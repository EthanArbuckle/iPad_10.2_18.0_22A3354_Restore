@implementation HMMBufferingLogEventSubmitter

- (HMMBufferingLogEventSubmitter)init
{
  return -[HMMBufferingLogEventSubmitter initWithBufferSize:](self, "initWithBufferSize:", 1000);
}

- (HMMBufferingLogEventSubmitter)initWithBufferSize:(int64_t)a3
{
  HMMBufferingLogEventSubmitter *v4;
  HMMBufferingLogEventSubmitter *v5;
  uint64_t v6;
  NSMutableArray *bufferedLogEvents;
  HMMLogEventSubmitting *submitter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMMBufferingLogEventSubmitter;
  v4 = -[HMMBufferingLogEventSubmitter init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_bufferSize = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    bufferedLogEvents = v5->_bufferedLogEvents;
    v5->_bufferedLogEvents = (NSMutableArray *)v6;

    submitter = v5->_submitter;
    v5->_submitter = 0;

  }
  return v5;
}

- (void)submitLogEvent:(id)a3
{
  id v4;
  HMMLogEventSubmitting *submitter;
  void *v6;
  HMMBufferingLogEventSubmitter *v7;
  NSObject *v8;
  void *v9;
  int64_t bufferSize;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  submitter = self->_submitter;
  if (submitter)
  {
    -[HMMLogEventSubmitting submitLogEvent:](submitter, "submitLogEvent:", v4);
  }
  else if ((unint64_t)-[NSMutableArray count](self->_bufferedLogEvents, "count") >= self->_bufferSize)
  {
    v6 = (void *)MEMORY[0x1D17B78FC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      bufferSize = self->_bufferSize;
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = bufferSize;
      _os_log_impl(&dword_1CD029000, v8, OS_LOG_TYPE_ERROR, "%{public}@Log event not buffered. Buffer full, size: %ld", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    -[NSMutableArray addObject:](self->_bufferedLogEvents, "addObject:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setError:", a4);
  -[HMMBufferingLogEventSubmitter submitLogEvent:](self, "submitLogEvent:", v6);

}

- (void)processLogEventsWithSubmitter:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *bufferedLogEvents;
  HMMLogEventSubmitting *submitter;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_bufferedLogEvents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "submitLogEvent:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  bufferedLogEvents = self->_bufferedLogEvents;
  self->_bufferedLogEvents = 0;

  submitter = self->_submitter;
  self->_submitter = (HMMLogEventSubmitting *)v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_bufferedLogEvents, 0);
}

@end

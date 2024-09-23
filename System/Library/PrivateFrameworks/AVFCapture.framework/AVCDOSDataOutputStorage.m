@implementation AVCDOSDataOutputStorage

- (AVCDOSDataOutputStorage)initWithDataOutput:(id)a3
{
  AVCDOSDataOutputStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCDOSDataOutputStorage;
  v4 = -[AVCDOSDataOutputStorage init](&v6, sel_init);
  if (v4)
  {
    v4->_dataOutput = (AVCaptureDataOutputDelegateOverride *)a3;
    v4->_synchronizedDataQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((AVCaptureIsRunningInMediaserverd() & 1) == 0)
      v4->_delegateOverrideCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avfoundation.dataoutputsynchronizer.dataoutputqueue_%@_%@"), v4->_dataOutput, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString")), "UTF8String"), 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCDOSDataOutputStorage;
  -[AVCDOSDataOutputStorage dealloc](&v3, sel_dealloc);
}

- (BOOL)isLive
{
  return objc_msgSend((id)objc_msgSend((id)-[AVCaptureDataOutputDelegateOverride connections](self->_dataOutput, "connections"), "firstObject"), "isLive");
}

- (BOOL)hasAllExpectedSynchronizedDataForLeaderTimestamp:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  AVCaptureDataOutputDelegateOverride *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime time2;
  CMTime time1;
  char v24;
  CMTime v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](-[AVCDOSDataOutputStorage synchronizedDataQueue](self, "synchronizedDataQueue"), "count"))return 0;
  if (!-[AVCDOSDataOutputStorage timestampAdjustmentsDataQueue](self, "timestampAdjustmentsDataQueue"))
  {
    v7 = (void *)-[NSMutableArray objectAtIndexedSubscript:](-[AVCDOSDataOutputStorage synchronizedDataQueue](self, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
    if (v7)
    {
      objc_msgSend(v7, "timestamp");
      goto LABEL_10;
    }
LABEL_9:
    memset(&time1, 0, sizeof(time1));
    goto LABEL_10;
  }
  v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](-[AVCDOSDataOutputStorage synchronizedDataQueue](self, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
  if (!v5)
    return 0;
  objc_msgSend(v5, "adjustedTimestamp");
  if ((v24 & 1) == 0)
    return 0;
  v6 = (void *)-[NSMutableArray objectAtIndexedSubscript:](-[AVCDOSDataOutputStorage synchronizedDataQueue](self, "synchronizedDataQueue"), "objectAtIndexedSubscript:", 0);
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v6, "adjustedTimestamp");
LABEL_10:
  v25 = time1;
  time1 = (CMTime)*a3;
  time2 = v25;
  if (CMTimeCompare(&time1, &time2) > 0)
    return 0;
  -[AVCDOSDataOutputStorage dataOutput](self, "dataOutput");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[AVCDOSDataOutputStorage dataOutput](self, "dataOutput");
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[AVCaptureDataOutputDelegateOverride metadataObjectTypes](v8, "metadataObjectTypes"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = -[AVCDOSDataOutputStorage synchronizedDataQueue](self, "synchronizedDataQueue");
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (v15)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "adjustedTimestamp");
            if ((v17 & 1) != 0)
              objc_msgSend(v9, "minusSet:", objc_msgSend(v15, "handledMetadataObjectTypes"));
          }
          else
          {
            v17 = 0;
          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }
    if (objc_msgSend(v9, "count"))
      return 0;
  }
  return 1;
}

- (AVCaptureDataOutputDelegateOverride)dataOutput
{
  return self->_dataOutput;
}

- (NSMutableArray)synchronizedDataQueue
{
  return self->_synchronizedDataQueue;
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return self->_delegateOverrideCallbackQueue;
}

- (NSMutableArray)timestampAdjustmentsDataQueue
{
  return self->_timestampAdjustmentsDataQueue;
}

- (void)setTimestampAdjustmentsDataQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end

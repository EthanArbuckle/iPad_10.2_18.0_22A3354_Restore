@implementation IRReplayWriter

- (void)writeReplayEventWithReason:(id)a3 SystemState:(id)a4 miloLslPrediction:(id)a5 candidatesContainerDO:(id)a6 nearbyDeviceContainerDO:(id)a7 date:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableSet *bufferedReplayEvents;
  NSObject *v28;
  void *v29;
  IRServiceStore *store;
  NSMutableSet *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  IRReplayEventDO *v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (+[IRPlatformInfo isInternalInstall](IRPlatformInfo, "isInternalInstall"))
  {
    v37 = v14;
    v36 = -[IRReplayEventDO initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:]([IRReplayEventDO alloc], "initWithDate:contextChangeReason:candidatesContainer:miloLslPrediction:systemState:nearbyDeviceContainerDO:", v19, v14, v17, v16, v15, v18);
    -[NSMutableSet addObject:](self->_bufferedReplayEvents, "addObject:");
    v20 = -[NSMutableSet count](self->_bufferedReplayEvents, "count");
    +[IRPreferences shared](IRPreferences, "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "replayWriterEventsSizeToBuffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue");

    if (v20 >= v23)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)*MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      {
        v26 = (void *)MEMORY[0x24BDD16E0];
        bufferedReplayEvents = self->_bufferedReplayEvents;
        v28 = v25;
        objc_msgSend(v26, "numberWithUnsignedInteger:", -[NSMutableSet count](bufferedReplayEvents, "count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v39 = "#replay-writer, ";
        v40 = 2112;
        v41 = v24;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_23FFBA000, v28, OS_LOG_TYPE_DEBUG, "%s[%@], Writing %@ replay events to DB", buf, 0x20u);

      }
      v31 = self->_bufferedReplayEvents;
      store = self->_store;
      +[IRPreferences shared](IRPreferences, "shared");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "numberOfEventsToSaveInDisk");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(store) = -[IRServiceStore addReplayEvents:withLimit:](store, "addReplayEvents:withLimit:", v31, objc_msgSend(v33, "unsignedIntValue"));

      if ((store & 1) == 0)
      {
        dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *MEMORY[0x24BE5B270];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v39 = "#replay-writer, ";
          v40 = 2112;
          v41 = v34;
          _os_log_impl(&dword_23FFBA000, v35, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Replay save error] Could not save replay events", buf, 0x16u);
        }

      }
      -[NSMutableSet removeAllObjects](self->_bufferedReplayEvents, "removeAllObjects");
    }

    v14 = v37;
  }

}

- (IRReplayWriter)initWithServiceStore:(id)a3
{
  id v5;
  IRReplayWriter *v6;
  IRReplayWriter *v7;
  uint64_t v8;
  NSMutableSet *bufferedReplayEvents;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRReplayWriter;
  v6 = -[IRReplayWriter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = objc_opt_new();
    bufferedReplayEvents = v7->_bufferedReplayEvents;
    v7->_bufferedReplayEvents = (NSMutableSet *)v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IRReplayWriter;
  -[IRReplayWriter dealloc](&v2, sel_dealloc);
}

- (void)deallocSync
{
  const void **v3;
  void *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSMutableSet *bufferedReplayEvents;
  NSObject *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  NSMutableSet **p_bufferedReplayEvents;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableSet count](self->_bufferedReplayEvents, "count"))
  {
    v3 = (const void **)MEMORY[0x24BE5B328];
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (os_log_t *)MEMORY[0x24BE5B270];
    v6 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      bufferedReplayEvents = self->_bufferedReplayEvents;
      v9 = v6;
      objc_msgSend(v7, "numberWithUnsignedInteger:", -[NSMutableSet count](bufferedReplayEvents, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "#replay-writer, ";
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_DEBUG, "%s[%@], Writing %@ replay events to DB on dealloc", (uint8_t *)&v18, 0x20u);

    }
    p_bufferedReplayEvents = &self->_bufferedReplayEvents;
    v11 = self->_bufferedReplayEvents;
    v12 = p_bufferedReplayEvents[1];
    +[IRPreferences shared](IRPreferences, "shared");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberOfEventsToSaveInDisk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = -[NSMutableSet addReplayEvents:withLimit:](v12, "addReplayEvents:withLimit:", v11, objc_msgSend(v15, "unsignedIntValue"));

    if ((v11 & 1) == 0)
    {
      dispatch_get_specific(*v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        v18 = 136315394;
        v19 = "#replay-writer, ";
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_23FFBA000, v17, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Replay dealloc error] Could not save replay events", (uint8_t *)&v18, 0x16u);
      }

    }
  }
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_bufferedReplayEvents, 0);
}

@end

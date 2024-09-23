@implementation DTTapConfig

- (DTTapConfig)init
{
  DTTapConfig *v2;
  uint64_t v3;
  NSMutableDictionary *dict;
  uint64_t v5;
  NSString *uuid;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTTapConfig;
  v2 = -[DTTapConfig init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    v2->_serviceVersion = -1;
    -[DTTapConfig setBufferMode:](v2, "setBufferMode:", 0);
    sub_222B64B64();
    v5 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v5;

  }
  return v2;
}

- (DTTapConfig)initWithPlist:(id)a3
{
  id v4;
  DTTapConfig *v5;
  DTTapConfig *v6;
  uint64_t v7;
  NSMutableDictionary *dict;
  uint64_t v9;
  NSString *uuid;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DTTapConfig;
  v5 = -[DTTapConfig init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_serviceVersion = -1;
    v7 = objc_msgSend(v4, "mutableCopy");
    dict = v6->_dict;
    v6->_dict = (NSMutableDictionary *)v7;

    sub_222B64B64();
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v9;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *dict;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  _NSZone *v26;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = objc_opt_new();
  v7 = (void *)v5[1];
  v5[1] = v6;

  dict = self->_dict;
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = sub_222B64D54;
  v24 = &unk_24EB29EF8;
  v26 = a3;
  v9 = v5;
  v25 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dict, "enumerateKeysAndObjectsUsingBlock:", &v21);
  v10 = -[NSString copy](self->_serviceName, "copy", v21, v22, v23, v24);
  v11 = (void *)v9[3];
  v9[3] = v10;

  v9[4] = self->_serviceVersion;
  v9[6] = self->_bulkDataReceiver;
  v12 = objc_msgSend(self->_runningMetadataChangedHandler, "copy");
  v13 = (void *)v9[7];
  v9[7] = v12;

  v14 = objc_msgSend(self->_statusHandler, "copy");
  v15 = (void *)v9[8];
  v9[8] = v14;

  v16 = objc_msgSend(self->_recordingInfoHandler, "copy");
  v17 = (void *)v9[9];
  v9[9] = v16;

  v18 = -[NSString copy](self->_uuid, "copy");
  v19 = (void *)v9[5];
  v9[5] = v18;

  return v9;
}

- (id)plist
{
  return (id)-[NSMutableDictionary copy](self->_dict, "copy");
}

- (void)_setSerializableObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)_getSerializableObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", a3);
}

- (void)_removeSerializableObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", a3);
}

- (void)refreshUUID
{
  NSString *v3;
  NSString *uuid;

  sub_222B64B64();
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v3;

}

- (void)setRunningMetadataChangedHandler:(id)a3
{
  void *v4;
  id runningMetadataChangedHandler;

  v4 = _Block_copy(a3);
  runningMetadataChangedHandler = self->_runningMetadataChangedHandler;
  self->_runningMetadataChangedHandler = v4;

}

- (void)setStatusHandler:(id)a3
{
  void *v4;
  id statusHandler;

  v4 = _Block_copy(a3);
  statusHandler = self->_statusHandler;
  self->_statusHandler = v4;

}

- (void)_runningMetadataChanged:(id)a3
{
  id v4;
  id runningMetadataChangedHandler;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  runningMetadataChangedHandler = self->_runningMetadataChangedHandler;
  if (runningMetadataChangedHandler)
  {
    v6 = _Block_copy(runningMetadataChangedHandler);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_222B64F30;
    v9[3] = &unk_24EB29F20;
    v11 = v6;
    v10 = v4;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

- (void)_dispatchStatus:(unsigned int)a3 timestamp:(unint64_t)a4 notice:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id statusHandler;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  unsigned int v21;

  v10 = a5;
  v11 = a6;
  statusHandler = self->_statusHandler;
  if (statusHandler)
  {
    v13 = _Block_copy(statusHandler);
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B65034;
    block[3] = &unk_24EB29F48;
    v21 = a3;
    v19 = v13;
    v20 = a4;
    v17 = v10;
    v18 = v11;
    v15 = v13;
    dispatch_async(v14, block);

  }
}

- (BOOL)isDeferredDisplay
{
  void *v2;
  BOOL v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("ur"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setIsDeferredDisplay:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    MEMORY[0x24BEDD108](self, sel__removeSerializableObjectForKey_);
  }
  else
  {
    -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("ur"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 500);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v5, CFSTR("ur"));

    }
  }
}

- (BOOL)spoolToDiskWhenPossible
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("s2d"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSpoolToDiskWhenPossible:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("s2d"));

}

- (BOOL)discardHeartbeatsWhenPossible
{
  void *v2;
  char v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("nohb"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDiscardHeartbeatsWhenPossible:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("nohb"));

}

- (void)setPollingInterval:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3 / 0xF4240);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("ur"));

  }
  else
  {
    MEMORY[0x24BEDD108](self, sel_setIsDeferredDisplay_);
  }
}

- (unint64_t)pollingInterval
{
  void *v2;
  uint64_t v3;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("ur"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return 1000000 * v3;
}

- (void)setBufferMode:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:");
  if (a3 - 1 <= 1)
    -[DTTapConfig setPollingInterval:](self, "setPollingInterval:", 0);

}

- (unint64_t)bufferMode
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  unint64_t v5;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("bm"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");
  if (v2)
    v4 = v3 > 2;
  else
    v4 = 1;
  if (v4)
  {
    if (v2)
      NSLog(CFSTR("Unsupported buffer mode enum %d, defaulting to DTTAP_RECORDING_MODE_IMMEDIATE"), v3);
    v5 = 1;
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (unint64_t)windowSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DTTapConfig _getSerializableObjectForKey:](self, "_getSerializableObjectForKey:", CFSTR("ws"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = 1000000 * objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setWindowSize:(unint64_t)a3
{
  id v4;

  if (a3 <= 0xF423FFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3 / 0xF4240);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[DTTapConfig _setSerializableObject:forKey:](self, "_setSerializableObject:forKey:", v4, CFSTR("ws"));

  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)serviceVersion
{
  return self->_serviceVersion;
}

- (void)setServiceVersion:(int64_t)a3
{
  self->_serviceVersion = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)filePreservation
{
  return self->_filePreservation;
}

- (void)setFilePreservation:(BOOL)a3
{
  self->_filePreservation = a3;
}

- (DTTapBulkDataReceiver)bulkDataReceiver
{
  return self->_bulkDataReceiver;
}

- (void)setBulkDataReceiver:(id)a3
{
  self->_bulkDataReceiver = (DTTapBulkDataReceiver *)a3;
}

- (id)runningMetadataChangedHandler
{
  return self->_runningMetadataChangedHandler;
}

- (id)statusHandler
{
  return self->_statusHandler;
}

- (id)recordingInfoHandler
{
  return self->_recordingInfoHandler;
}

- (void)setRecordingInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordingInfoHandler, 0);
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong(&self->_runningMetadataChangedHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end

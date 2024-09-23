@implementation DTSysmonTapMessageHandler

- (id)messageReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSData *v11;
  id v12;
  void *nextSampleData;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSData *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DTSysmonTapMessageHandler;
  -[DTTapMessageHandler messageReceived:](&v29, sel_messageReceived_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !v5)
  {
    -[DTTapMessageHandler config](self, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v7 = objc_retainAutorelease(v4);
    v8 = objc_msgSend(v7, "getBufferWithReturnedLength:", &v28);
    if (v8)
    {
      v9 = v8;
      v10 = objc_alloc(MEMORY[0x24BDBCE50]);
      v11 = (NSData *)objc_msgSend(v10, "initWithBytes:length:", v9, v28);
      v12 = 0;
      nextSampleData = self->_nextSampleData;
      self->_nextSampleData = v11;
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectWithAllowedClasses:", v14);
    nextSampleData = (void *)objc_claimAutoreleasedReturnValue();

    if (nextSampleData)
    {
      v15 = objc_msgSend(nextSampleData, "kind");
      v16 = 0;
      if (v15 <= 6)
      {
        if (v15)
        {
          if (v15 == 5)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v16, "setTapVersion:", self->_tapVersion);
            objc_msgSend(v16, "setFinalMemo:", 1);
          }
        }
        else
        {
          v16 = 0;
          self->_tapVersion = objc_msgSend(nextSampleData, "tapVersion");
        }
        goto LABEL_17;
      }
      if (v15 != 7)
      {
        if (v15 == 1024)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v16, "setTapVersion:", self->_tapVersion);
          v27 = (void *)MEMORY[0x24BDD1620];
          v17 = (void *)MEMORY[0x24BDBCF20];
          v18 = objc_opt_class();
          v19 = objc_opt_class();
          v20 = objc_opt_class();
          v21 = objc_opt_class();
          objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "unarchivedObjectOfClasses:fromData:error:", v22, self->_nextSampleData, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setSamples:", v23);

          objc_msgSend(v16, "setSupportsPeek:", 1);
          v24 = self->_nextSampleData;
          self->_nextSampleData = 0;

        }
        goto LABEL_17;
      }
      objc_msgSend(nextSampleData, "runningMetadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_runningMetadataChanged:", v25);

    }
    v16 = 0;
LABEL_17:
    v12 = v16;
    goto LABEL_18;
  }
  v12 = v5;
LABEL_19:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSampleData, 0);
}

@end

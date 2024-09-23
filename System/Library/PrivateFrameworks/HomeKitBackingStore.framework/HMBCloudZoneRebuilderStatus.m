@implementation HMBCloudZoneRebuilderStatus

- (HMBCloudZoneRebuilderStatus)initWithState:(unint64_t)a3 message:(id)a4
{
  id v6;
  HMBCloudZoneRebuilderStatus *v7;
  uint64_t v8;
  NSString *message;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBCloudZoneRebuilderStatus;
  v7 = -[HMBCloudZoneRebuilderStatus init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    message = v7->_message;
    v7->_message = (NSString *)v8;

    if (a3 <= 7)
      v7->_keyStatus = qword_1CCDCD360[a3];
    v7->_rebuildState = a3;
  }

  return v7;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("ZCRS.m");
  -[HMBCloudZoneRebuilderStatus message](self, "message", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ZCRS.se");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMBCloudZoneRebuilderStatus rebuildState](self, "rebuildState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hmbOPACKDataFromDictionaryWithError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  +[HMBCloudZoneRebuilderStatus rebuilderStateString:](HMBCloudZoneRebuilderStatus, "rebuilderStateString:", -[HMBCloudZoneRebuilderStatus rebuildState](self, "rebuildState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMBCloudZoneRebuilderStatus keyStatusString:](HMBCloudZoneRebuilderStatus, "keyStatusString:", -[HMBCloudZoneRebuilderStatus keyStatus](self, "keyStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("Key Status"), v4);
  objc_msgSend(v5, "addObject:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("Rebuild State"), v3);
  objc_msgSend(v5, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneRebuilderStatus message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Message"), v9);
  objc_msgSend(v5, "addObject:", v10);

  return v5;
}

- (int64_t)keyStatus
{
  return self->_keyStatus;
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)rebuildState
{
  return self->_rebuildState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

+ (id)rebuilderStateString:(unint64_t)a3
{
  if (a3 < 8)
    return off_1E8931810[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<UNKNOWN %lu>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyStatusString:(int64_t)a3
{
  if ((unint64_t)a3 < 3)
    return off_1E8931850[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<UNKNOWN %lu>"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMBCloudZoneRebuilderStatus *v10;

  objc_msgSend(MEMORY[0x1E0C99D80], "hmbDictionaryFromOPACKData:error:", a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "hmf_stringForKey:", CFSTR("ZCRS.m"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("ZCRS.se"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    v10 = -[HMBCloudZoneRebuilderStatus initWithState:message:]([HMBCloudZoneRebuilderStatus alloc], "initWithState:message:", v9, v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

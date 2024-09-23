@implementation ASDTIOPAudioVTDebugProperty

+ (id)configDictForService:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0A5B8];
  v8[0] = *MEMORY[0x24BE0A5D8];
  v8[1] = v3;
  v9[0] = CFSTR("ASDTIOPAudioVTDebugProperty");
  v9[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ASDTIOPAudioVTDebugProperty)initWithConfig:(id)a3
{
  void *v4;
  void *v5;
  ASDTIOPAudioVTDebugProperty *v6;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE0A5A8];
  v10[0] = &unk_250852FE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asdtAddMissingEntriesFromDictionary:", v5);

  v8.receiver = self;
  v8.super_class = (Class)ASDTIOPAudioVTDebugProperty;
  v6 = -[ASDTIOPAudioVTUInt32Property initWithConfig:](&v8, sel_initWithConfig_, v4);

  return v6;
}

- (BOOL)storeUInt32Value:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "setDebugEnabled:", v3);

  return v3;
}

- (BOOL)retrieveUInt32Value:(unsigned int *)a3
{
  void *v4;

  -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "getDebugEnabled:", a3);

  return (char)a3;
}

@end

@implementation ASDTIOPAudioVTActiveChannelMaskProperty

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
  v9[0] = CFSTR("ASDTIOPAudioVTActiveChannelMaskProperty");
  v9[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ASDTIOPAudioVTActiveChannelMaskProperty)initWithConfig:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  ASDTIOPAudioVTActiveChannelMaskProperty *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE0A580];
  v10[0] = *MEMORY[0x24BE0A5A8];
  v10[1] = v5;
  v11[0] = &unk_250852FB8;
  v11[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asdtAddMissingEntriesFromDictionary:", v6);

  v9.receiver = self;
  v9.super_class = (Class)ASDTIOPAudioVTActiveChannelMaskProperty;
  v7 = -[ASDTIOPAudioVTUInt32Property initWithConfig:](&v9, sel_initWithConfig_, v4);

  return v7;
}

- (BOOL)retrieveUInt32Value:(unsigned int *)a3
{
  void *v4;

  -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "getChannelMask:", a3);

  return (char)a3;
}

@end

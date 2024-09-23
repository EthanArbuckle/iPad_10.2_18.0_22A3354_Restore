@implementation ASDTIOPAudioVTOccurredProperty

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
  v9[0] = CFSTR("ASDTIOPAudioVTOccurredProperty");
  v9[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ASDTIOPAudioVTOccurredProperty)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ASDTIOPAudioVTOccurredProperty *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE0A580];
  v15[0] = *MEMORY[0x24BE0A5A8];
  v15[1] = v6;
  v16[0] = &unk_250852EC8;
  v16[1] = MEMORY[0x24BDBD1C0];
  v15[2] = *MEMORY[0x24BE0A590];
  v16[2] = *MEMORY[0x24BE0A5E0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asdtAddMissingEntriesFromDictionary:", v7);

  v14.receiver = self;
  v14.super_class = (Class)ASDTIOPAudioVTOccurredProperty;
  v8 = -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:](&v14, sel_initWithConfig_propertyDataType_qualifierDataType_, v5, 1886155636, 0);
  if (v8)
  {
    objc_initWeak(&location, v8);
    -[ASDTIOPAudioVTProperty vtDevice](v8, "vtDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__ASDTIOPAudioVTOccurredProperty_initWithConfig___block_invoke;
    v11[3] = &unk_250850950;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "setPhraseDetectEventBlock:", v11);

    -[ASDTCustomProperty storePropertyValue:](v8, "storePropertyValue:", MEMORY[0x24BDBD1B8]);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __49__ASDTIOPAudioVTOccurredProperty_initWithConfig___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "phraseDetectEvent");

}

- (void)phraseDetectEvent
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to store phrase detection event data.", (uint8_t *)&v2, 0xCu);

}

@end

@implementation CDMServiceTypeNames

+ (id)getNameStringToEnumDict
{
  if (getNameStringToEnumDict_onceToken_7204 != -1)
    dispatch_once(&getNameStringToEnumDict_onceToken_7204, &__block_literal_global_7205);
  return (id)getNameStringToEnumDict_serviceTypeNameStringToEnum;
}

+ (id)getServiceTypeNames
{
  if (getServiceTypeNames_onceToken != -1)
    dispatch_once(&getServiceTypeNames_onceToken, &__block_literal_global_45);
  return (id)getServiceTypeNames_serviceTypeNames;
}

void __42__CDMServiceTypeNames_getServiceTypeNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[23];

  v2[22] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("CDMComposerService");
  v2[1] = CFSTR("CDMContextUpdateService");
  v2[2] = CFSTR("CDMTokenizerProtoService");
  v2[3] = CFSTR("CDMEmbeddingProtoService");
  v2[4] = CFSTR("CDMShortcutService");
  v2[5] = CFSTR("CDMSNLCProtoService");
  v2[6] = CFSTR("CDMCATIProtoService");
  v2[7] = CFSTR("CDMNLv4ProtoService");
  v2[8] = CFSTR("CDMOverridesProtoService");
  v2[9] = CFSTR("CDMRepetitionDetectionService");
  v2[10] = CFSTR("CDMUaaPNLProtoService");
  v2[11] = CFSTR("CDMPSCService");
  v2[12] = CFSTR("CDMCcqrAerCbRService");
  v2[13] = CFSTR("CDMMentionDetectorService");
  v2[14] = CFSTR("CDMMentionResolverService");
  v2[15] = CFSTR("CDMContextualSpanMatcherService");
  v2[16] = CFSTR("CDMLVCService");
  v2[17] = CFSTR("CDMSSUService");
  v2[18] = CFSTR("CDMDateTimeSpanMatchService");
  v2[19] = CFSTR("CDMRegexSpanMatchService");
  v2[20] = CFSTR("CDMSiriVocabularySpanMatchService");
  v2[21] = CFSTR("CDMVocSpanMatchService");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getServiceTypeNames_serviceTypeNames;
  getServiceTypeNames_serviceTypeNames = v0;

}

void __46__CDMServiceTypeNames_getNameStringToEnumDict__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[22];
  _QWORD v25[24];

  v25[22] = *MEMORY[0x24BDAC8D0];
  v24[0] = CFSTR("CDMComposerService");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 21);
  v25[0] = v23;
  v24[1] = CFSTR("CDMContextUpdateService");
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 18);
  v25[1] = v22;
  v24[2] = CFSTR("CDMTokenizerProtoService");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 11);
  v25[2] = v21;
  v24[3] = CFSTR("CDMEmbeddingProtoService");
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 4);
  v25[3] = v20;
  v24[4] = CFSTR("CDMShortcutService");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 14);
  v25[4] = v19;
  v24[5] = CFSTR("CDMSNLCProtoService");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 2);
  v25[5] = v18;
  v24[6] = CFSTR("CDMCATIProtoService");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 10);
  v25[6] = v17;
  v24[7] = CFSTR("CDMNLv4ProtoService");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v25[7] = v16;
  v24[8] = CFSTR("CDMOverridesProtoService");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 13);
  v25[8] = v15;
  v24[9] = CFSTR("CDMRepetitionDetectionService");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 15);
  v25[9] = v14;
  v24[10] = CFSTR("CDMUaaPNLProtoService");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 8);
  v25[10] = v13;
  v24[11] = CFSTR("CDMPSCService");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 3);
  v25[11] = v12;
  v24[12] = CFSTR("CDMCcqrAerCbRService");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 6);
  v25[12] = v0;
  v24[13] = CFSTR("CDMMentionDetectorService");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 16);
  v25[13] = v1;
  v24[14] = CFSTR("CDMMentionResolverService");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 17);
  v25[14] = v2;
  v24[15] = CFSTR("CDMContextualSpanMatcherService");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 19);
  v25[15] = v3;
  v24[16] = CFSTR("CDMLVCService");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 22);
  v25[16] = v4;
  v24[17] = CFSTR("CDMSSUService");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 23);
  v25[17] = v5;
  v24[18] = CFSTR("CDMDateTimeSpanMatchService");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 24);
  v25[18] = v6;
  v24[19] = CFSTR("CDMRegexSpanMatchService");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 25);
  v25[19] = v7;
  v24[20] = CFSTR("CDMSiriVocabularySpanMatchService");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 26);
  v25[20] = v8;
  v24[21] = CFSTR("CDMVocSpanMatchService");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 27);
  v25[21] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 22);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)getNameStringToEnumDict_serviceTypeNameStringToEnum;
  getNameStringToEnumDict_serviceTypeNameStringToEnum = v10;

}

@end

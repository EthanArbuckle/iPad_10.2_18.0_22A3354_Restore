@implementation CDMServiceNodeNames

+ (id)getNameStringToEnumDict
{
  if (getNameStringToEnumDict_onceToken != -1)
    dispatch_once(&getNameStringToEnumDict_onceToken, &__block_literal_global_5328);
  return (id)getNameStringToEnumDict_serviceNodeNameStringToEnum;
}

void __46__CDMServiceNodeNames_getNameStringToEnumDict__block_invoke()
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[28];
  _QWORD v31[30];

  v31[28] = *MEMORY[0x24BDAC8D0];
  v30[0] = CFSTR("doContextUpdate");
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 3);
  v31[0] = v29;
  v30[1] = CFSTR("doCurrentTokenize");
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  v31[1] = v28;
  v30[2] = CFSTR("doPreviousTurnsTokenize");
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 2);
  v31[2] = v27;
  v30[3] = CFSTR("doEmbedding");
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 4);
  v31[3] = v26;
  v30[4] = CFSTR("doSpanization");
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 5);
  v31[4] = v25;
  v30[5] = CFSTR("doSpanizationDateTime");
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 28);
  v31[5] = v24;
  v30[6] = CFSTR("doSpanizationRegex");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 29);
  v31[6] = v23;
  v30[7] = CFSTR("doSpanizationSiriVocabulary");
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 30);
  v31[7] = v22;
  v30[8] = CFSTR("doSpanizationVoc");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 31);
  v31[8] = v21;
  v30[9] = CFSTR("doShortcutParse");
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 6);
  v31[9] = v20;
  v30[10] = CFSTR("doSNLCInference");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 7);
  v31[10] = v19;
  v30[11] = CFSTR("doCATIInference");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 9);
  v31[11] = v18;
  v30[12] = CFSTR("doNLv4Inference");
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 10);
  v31[12] = v17;
  v30[13] = CFSTR("doOverridesProto");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 11);
  v31[13] = v16;
  v30[14] = CFSTR("doRepetitionDetection");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 12);
  v31[14] = v15;
  v30[15] = CFSTR("doPostProcess");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 13);
  v31[15] = v14;
  v30[16] = CFSTR("endNode");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 14);
  v31[16] = v13;
  v30[17] = CFSTR("doCorrectedUtteranceTokenize");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 15);
  v31[17] = v12;
  v30[18] = CFSTR("doUaaPNLInference");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 17);
  v31[18] = v0;
  v30[19] = CFSTR("doPSCInference");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 18);
  v31[19] = v1;
  v30[20] = CFSTR("doLVCInference");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 26);
  v31[20] = v2;
  v30[21] = CFSTR("doCcqrAerCbRInference");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 20);
  v31[21] = v3;
  v30[22] = CFSTR("doMentionDetection");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 21);
  v31[22] = v4;
  v30[23] = CFSTR("doMentionResolving");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 22);
  v31[23] = v5;
  v30[24] = CFSTR("doSpanMerging");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 23);
  v31[24] = v6;
  v30[25] = CFSTR("doContextualSpanMatching");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 24);
  v31[25] = v7;
  v30[26] = CFSTR("doSSUMatching");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 27);
  v31[26] = v8;
  v30[27] = CFSTR("doNLv4SNLCMerging");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 32);
  v31[27] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 28);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)getNameStringToEnumDict_serviceNodeNameStringToEnum;
  getNameStringToEnumDict_serviceNodeNameStringToEnum = v10;

}

@end

@implementation NLPLearnerCharacterLanguageModelingData

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "NLPLearnerCharacterLanguageModelingData");
    v3 = (void *)sLogCharLM;
    sLogCharLM = (uint64_t)v2;

  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 200;
}

- (NLPLearnerCharacterLanguageModelingData)initWithLocale:(id)a3
{
  id v4;
  NLPLearnerCharacterLanguageModelingData *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NLPLearnerCharacterLanguageModelingData;
  v5 = -[NLPLearnerLanguageModelingData initWithLocale:](&v7, sel_initWithLocale_, v4);
  if (v5)
    -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", objc_msgSend((id)objc_opt_class(), "defaultMaxSequenceLength"));

  return v5;
}

- (void)addResource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  CVNLPTokenIDConverter *v7;
  CVNLPTokenIDConverter *tokenConverter;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[NLPLearnerLanguageModelingData setTokenIDMapPath:](self, "setTokenIDMapPath:", v4);
  v5 = objc_alloc(MEMORY[0x24BE12300]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CVNLPTokenIDConverter *)objc_msgSend(v5, "initWithResource:andTokenType:", v6, 1);
  tokenConverter = self->_tokenConverter;
  self->_tokenConverter = v7;

  if (!self->_tokenConverter)
  {
    v9 = sLogCharLM;
    if (os_log_type_enabled((os_log_t)sLogCharLM, OS_LOG_TYPE_ERROR))
      -[NLPLearnerCharacterLanguageModelingData addResource:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CVNLPTokenIDConverter *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  CVNLPTokenIDConverter *tokenConverter;
  id v26;
  id obj;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[16];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  tokenConverter = self->_tokenConverter;
  v26 = v6;
  if (tokenConverter)
  {
    v7 = (id)sLogCharLM;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[NLPLearnerTextData loadFromCoreDuet:limitSamplesTo:].cold.1((uint64_t)v41, objc_msgSend(v26, "count"), v7);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v26;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v36;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x227695148]();
        if (a4 && -[NLPLearnerTextData numSamples](self, "numSamples") >= a4)
        {
          v23 = 2;
        }
        else
        {
          -[NLPLearnerTextData locale](self, "locale", tokenConverter);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "languageCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[NLPLearnerUtils messageContentForEvent:andLanguage:](NLPLearnerUtils, "messageContentForEvent:andLanguage:", v11, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v29 = 0;
            v30 = &v29;
            v31 = 0x3032000000;
            v32 = __Block_byref_object_copy__49;
            v33 = __Block_byref_object_dispose__50;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CVNLPTokenIDConverter bosTokenID](self->_tokenConverter, "bosTokenID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v16;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (id)objc_msgSend(v17, "mutableCopy");

            v18 = self->_tokenConverter;
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __75__NLPLearnerCharacterLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke;
            v28[3] = &unk_24EDB92E0;
            v28[4] = self;
            v28[5] = &v29;
            -[CVNLPTokenIDConverter enumerateTokenIDsForText:withBlock:](v18, "enumerateTokenIDsForText:withBlock:", v15, v28);
            v19 = objc_msgSend((id)v30[5], "count");
            if (v19 < -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength"))
            {
              v20 = (void *)v30[5];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CVNLPTokenIDConverter eosTokenID](self->_tokenConverter, "eosTokenID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v21);

              -[NLPLearnerTextData sentences](self, "sentences");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v30[5]);

            }
            _Block_object_dispose(&v29, 8);

            v23 = 0;
          }
          else
          {
            v23 = 3;
          }

        }
        objc_autoreleasePoolPop(v12);
        if (v23 != 3)
        {
          if (v23)
            break;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v8)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  return tokenConverter != 0;
}

void __75__NLPLearnerCharacterLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  if (v6 >= objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sentences");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
    objc_msgSend(v9, "addObject:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeAllObjects");
  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenConverter, 0);
}

- (void)addResource:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "Failed to load character tokenization resources from '%@'", a5, a6, a7, a8, 2u);
}

@end

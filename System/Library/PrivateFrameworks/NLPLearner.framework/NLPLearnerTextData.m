@implementation NLPLearnerTextData

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "NLPLearnerTextData");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (NLPLearnerTextData)initWithLocale:(id)a3
{
  id v4;
  NLPLearnerTextData *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NLPLearnerTextData;
  v5 = -[NLPLearnerTextData init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NLPLearnerTextData setSentences:](v5, "setSentences:", v6);

    -[NLPLearnerTextData setIterator:](v5, "setIterator:", 0);
    -[NLPLearnerTextData setLocale:](v5, "setLocale:", v4);
  }

  return v5;
}

+ (id)dataForTask:(int64_t)a3 andLocale:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
    +[NLPLearnerTextData dataForTask:andLocale:].cold.2();
  if ((unint64_t)(a3 - 1) >= 7)
  {
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      +[NLPLearnerTextData dataForTask:andLocale:].cold.1();
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(*off_24EDB9128[a3 - 1]), "initWithLocale:", v5);
  }

  return v6;
}

+ (id)dataForPFL:(int64_t)a3 andLocale:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      +[NLPLearnerTextData dataForTask:andLocale:].cold.1();
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(*off_24EDB9160[a3 - 1]), "initWithLocale:", v5);
  }

  return v6;
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[16];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v6 = (id)sLog;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[NLPLearnerTextData loadFromCoreDuet:limitSamplesTo:].cold.1((uint64_t)v25, objc_msgSend(v18, "count"), v6);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v18;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x227695148]();
      if (a4 && -[NLPLearnerTextData numSamples](self, "numSamples") >= a4)
      {
        v16 = 2;
      }
      else
      {
        -[NLPLearnerTextData locale](self, "locale", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "languageCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[NLPLearnerUtils messageContentForEvent:andLanguage:](NLPLearnerUtils, "messageContentForEvent:andLanguage:", v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[NLPLearnerTextData sentences](self, "sentences");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v14);

          v16 = 0;
        }
        else
        {
          v16 = 3;
        }

      }
      objc_autoreleasePoolPop(v11);
      if (v16 != 3)
      {
        if (v16)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }

  return 1;
}

- (void)rewind
{
  self->_iterator = 0;
}

- (unint64_t)numSamples
{
  return -[NSMutableArray count](self->_sentences, "count");
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4 withLocale:(id)a5 andLMStreamTokenizationBlock:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  int v21;
  id v23;
  CFTypeRef cf;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CFTypeRef v31;
  _BYTE v32[128];
  _BYTE v33[16];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v10 = a5;
  v25 = a6;
  v26 = v10;
  cf = (CFTypeRef)LMStreamTokenizerCreate();
  v31 = cf;
  v11 = (id)sLog;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[NLPLearnerTextData loadFromCoreDuet:limitSamplesTo:].cold.1((uint64_t)v33, objc_msgSend(v23, "count"), v11);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v23;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v12);
      v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x227695148]();
      if (a4 && -[NLPLearnerTextData numSamples](self, "numSamples") >= a4)
      {
        v21 = 2;
      }
      else
      {
        objc_msgSend(v26, "languageCode", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[NLPLearnerUtils messageContentForEvent:andLanguage:](NLPLearnerUtils, "messageContentForEvent:andLanguage:", v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          -[NLPLearnerTextData setProcessingNewRecord:](self, "setProcessingNewRecord:", 1);
          strlen(v20);
          LMStreamTokenizerPushBytes();
          v21 = 0;
        }
        else
        {
          v21 = 3;
        }

      }
      objc_autoreleasePoolPop(v17);
      if (v21 != 3)
      {
        if (v21)
          break;
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v13)
          goto LABEL_5;
        break;
      }
    }
  }

  -[NLPLearnerTextData setProcessingNewRecord:](self, "setProcessingNewRecord:", 0);
  if (cf)
    CFRelease(cf);

  return 1;
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 50;
}

- (void)addResource:(id)a3
{
  id v3;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    -[NLPLearnerTextData addResource:].cold.1();

}

- (unint64_t)maxSequenceLength
{
  return self->_maxSequenceLength;
}

- (void)setMaxSequenceLength:(unint64_t)a3
{
  self->_maxSequenceLength = a3;
}

- (NSMutableArray)sentences
{
  return self->_sentences;
}

- (void)setSentences:(id)a3
{
  objc_storeStrong((id *)&self->_sentences, a3);
}

- (unint64_t)iterator
{
  return self->_iterator;
}

- (void)setIterator:(unint64_t)a3
{
  self->_iterator = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)processingNewRecord
{
  return self->_processingNewRecord;
}

- (void)setProcessingNewRecord:(BOOL)a3
{
  self->_processingNewRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_sentences, 0);
}

- (BOOL)addExamples:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NLPLearnerTextData sentences](self, "sentences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  return 1;
}

+ (void)dataForTask:andLocale:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22630F000, v0, v1, "NLPLearnerTask %ld is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)dataForTask:andLocale:.cold.2()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v2 = 2048;
  v3 = 1;
  v4 = 2048;
  v5 = 2;
  v6 = 2048;
  v7 = 3;
  v8 = 2048;
  v9 = 4;
  v10 = 2048;
  v11 = 5;
  v12 = 2048;
  v13 = 6;
  v14 = 2048;
  v15 = 7;
  _os_log_debug_impl(&dword_22630F000, v0, OS_LOG_TYPE_DEBUG, "Initializing data for %ld task.\n (Emoji %ld, LM Legacy %ld, Character LM %ld, LM Shipping %ld, LM Fragment %ld, LM Ngram %ld, ACT %ld)", v1, 0x52u);
}

- (void)loadFromCoreDuet:(NSObject *)a3 limitSamplesTo:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1_0(&dword_22630F000, a2, a3, "Processing %ld events extracted from CoreDuet", (uint8_t *)a1);
}

- (void)addResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22630F000, v0, v1, "Unexpected call to addResource with '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

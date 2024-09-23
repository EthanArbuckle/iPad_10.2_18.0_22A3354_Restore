@implementation NLPLearnerEmojiClassificationData

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "NLPLearnerEmojiClassificationData");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (NLPLearnerEmojiClassificationData)initWithLocale:(id)a3
{
  id v4;
  NLPLearnerEmojiClassificationData *v5;
  void *v6;
  void *v7;
  const void *v8;
  NSMutableArray *v9;
  NSMutableArray *labels;
  NSNumber *noneClassProbability;
  NLPLearnerEmojiClassificationData *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _BYTE v18[24];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NLPLearnerEmojiClassificationData;
  v5 = -[NLPLearnerTextData initWithLocale:](&v17, sel_initWithLocale_, v4);
  if (!v5)
    goto LABEL_4;
  -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", objc_msgSend((id)objc_opt_class(), "defaultMaxSequenceLength"));
  v19[0] = *MEMORY[0x24BE1E5C8];
  -[NLPLearnerTextData locale](v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = *MEMORY[0x24BE1E5D0];
  v20[0] = v6;
  v20[1] = *MEMORY[0x24BE1E5D8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (const void *)NLStringEmbeddingCreateWithOptions();
  nlp::CFScopedPtr<void *>::reset((const void **)&v5->_embedding.m_ref, v8);
  if (v5->_embedding.m_ref)
  {
    v5->_embeddingDimension = NLStringEmbeddingGetDimension();
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    labels = v5->_labels;
    v5->_labels = v9;

    noneClassProbability = v5->_noneClassProbability;
    v5->_noneClassProbability = (NSNumber *)&unk_24EDBC808;

LABEL_4:
    v12 = v5;
    goto LABEL_8;
  }
  v13 = (id)sLog;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[NLPLearnerTextData locale](v5, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "languageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLPLearnerEmojiClassificationData initWithLocale:].cold.1(v15, (uint64_t)v18, v13, v14);
  }

  v12 = 0;
LABEL_8:

  return v12;
}

- (void)sampleNoneClassExample:(id)a3
{
  uint32_t v4;
  float v5;
  NSMutableArray *labels;
  void *v7;
  uint32_t v8;
  uint32_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "count"))
  {
    v4 = arc4random_uniform(0x64u);
    -[NSNumber floatValue](self->_noneClassProbability, "floatValue");
    if ((float)(v5 * 100.0) > (float)v4)
    {
      labels = self->_labels;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](labels, "addObject:", v7);

      LODWORD(v7) = objc_msgSend(v12, "count");
      if (v7 >= -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength"))
        v8 = -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength");
      else
        v8 = objc_msgSend(v12, "count");
      v9 = arc4random_uniform(v8);
      -[NLPLearnerTextData sentences](self, "sentences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subarrayWithRange:", 0, (int)(v9 + 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }

}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6;
  NSDictionary *labelClasses;
  void *v8;
  objc_super v10;
  _QWORD v11[8];
  _QWORD v12[5];
  id v13;
  _QWORD v14[3];
  char v15;
  _QWORD v16[3];
  char v17;

  v6 = a3;
  labelClasses = self->_labelClasses;
  if (labelClasses)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy_;
    v12[4] = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NLPLearnerTextData locale](self, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = 3221225472;
    v11[2] = __69__NLPLearnerEmojiClassificationData_loadFromCoreDuet_limitSamplesTo___block_invoke;
    v11[3] = &unk_24EDB90B8;
    v11[4] = self;
    v11[5] = v14;
    v11[6] = v12;
    v11[7] = v16;
    v10.receiver = self;
    v10.super_class = (Class)NLPLearnerEmojiClassificationData;
    v11[0] = MEMORY[0x24BDAC760];
    -[NLPLearnerTextData loadFromCoreDuet:limitSamplesTo:withLocale:andLMStreamTokenizationBlock:](&v10, sel_loadFromCoreDuet_limitSamplesTo_withLocale_andLMStreamTokenizationBlock_, v6, a4, v8, v11);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }

  return labelClasses != 0;
}

void __69__NLPLearnerEmojiClassificationData_loadFromCoreDuet_limitSamplesTo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a4 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (a4 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "processingNewRecord"))
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        objc_msgSend(*(id *)(a1 + 32), "sampleNoneClassExample:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 32), "setProcessingNewRecord:", 0);
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    objc_msgSend(v5, "lowercaseString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (CEMStringContainsEmoji())
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "valueForKey:", v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v6);
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
        v8 = objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength");
        v9 = *(void **)(a1 + 32);
        if (v7 <= v8)
        {
          objc_msgSend(v9, "sentences");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
          objc_msgSend(v10, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v9, "sentences");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "subarrayWithRange:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")- objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"), objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v10, "addObject:", v12);

        }
      }

    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          objc_msgSend(*(id *)(a1 + 32), "sampleNoneClassExample:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAllObjects");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v13);
    }

  }
}

- (id)nextTrainingDataBatch:(unint64_t)a3
{
  unint64_t v5;
  void *v7;
  void *v8;
  size_t v9;
  void *v10;
  unint64_t embeddingDimension;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *__p[3];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[NLPLearnerTextData iterator](self, "iterator") + a3;
  if (v5 > -[NLPLearnerTextData numSamples](self, "numSamples"))
    return 0;
  -[NLPLearnerTextData sentences](self, "sentences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", -[NLPLearnerTextData iterator](self, "iterator"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 4 * a3 * -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength") * self->_embeddingDimension;
  v10 = malloc_type_malloc(v9, 0xCABCD16BuLL);
  embeddingDimension = self->_embeddingDimension;
  v17 = 0;
  std::vector<float>::vector(__p, embeddingDimension, &v17);
  -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength");
  NLStringEmbeddingFillWordVectors();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE68EC8];
  v20[0] = v12;
  v14 = *MEMORY[0x24BE68ED0];
  v19[0] = v13;
  v19[1] = v14;
  -[NSMutableArray subarrayWithRange:](self->_labels, "subarrayWithRange:", -[NLPLearnerTextData iterator](self, "iterator"), a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NLPLearnerTextData setIterator:](self, "setIterator:", -[NLPLearnerTextData iterator](self, "iterator") + a3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v16;
}

- (id)nextEvaluationDataPoint
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  size_t v7;
  void *v8;
  unint64_t embeddingDimension;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *__p[3];
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[NLPLearnerTextData iterator](self, "iterator");
  if (v3 >= -[NLPLearnerTextData numSamples](self, "numSamples"))
  {
    v15 = 0;
  }
  else
  {
    -[NLPLearnerTextData sentences](self, "sentences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 4 * -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength") * self->_embeddingDimension;
    v8 = malloc_type_malloc(v7, 0x6BAACAC8uLL);
    embeddingDimension = self->_embeddingDimension;
    v17 = 0;
    std::vector<float>::vector(__p, embeddingDimension, &v17);
    -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength");
    NLStringEmbeddingFillWordVectors();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE68F50];
    v21[0] = v10;
    v12 = *MEMORY[0x24BE68F58];
    v20[0] = v11;
    v20[1] = v12;
    -[NSMutableArray objectAtIndexedSubscript:](self->_labels, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NLPLearnerTextData setIterator:](self, "setIterator:", -[NLPLearnerTextData iterator](self, "iterator") + 1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

  }
  return v15;
}

- (unint64_t)numOutputClasses
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSDictionary allValues](self->_labelClasses, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)addResource:(id)a3
{
  id v4;
  void *v5;
  NSDictionary **p_labelClasses;
  NSDictionary *labelClasses;
  uint64_t v8;
  float v9;
  NSDictionary *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSDictionary *v17;
  _QWORD v18[5];
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[3];
  unint64_t v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    p_labelClasses = &self->_labelClasses;
    objc_storeStrong((id *)&self->_labelClasses, v5);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v25 = -[NLPLearnerEmojiClassificationData numOutputClasses](self, "numOutputClasses");
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    labelClasses = self->_labelClasses;
    v8 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__NLPLearnerEmojiClassificationData_addResource___block_invoke;
    v19[3] = &unk_24EDB90E0;
    v19[4] = self;
    v19[5] = v24;
    v19[6] = &v20;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](labelClasses, "enumerateKeysAndObjectsUsingBlock:", v19);
    if (*((_BYTE *)v21 + 24))
    {
      -[NSNumber floatValue](self->_noneClassProbability, "floatValue");
      if (v9 > 0.0)
      {
        v10 = *p_labelClasses;
        v18[0] = v8;
        v18[1] = 3221225472;
        v18[2] = __49__NLPLearnerEmojiClassificationData_addResource___block_invoke_15;
        v18[3] = &unk_24EDB9108;
        v18[4] = &v20;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v18);
      }
      if (*((_BYTE *)v21 + 24))
        goto LABEL_13;
      v11 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        -[NLPLearnerEmojiClassificationData addResource:].cold.2((uint64_t)v4, v11, v12);
    }
    else
    {
      v15 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        -[NLPLearnerEmojiClassificationData addResource:].cold.1((uint64_t)v4, v15, v16);
    }
    v17 = *p_labelClasses;
    *p_labelClasses = 0;

LABEL_13:
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(v24, 8);
    goto LABEL_14;
  }
  v13 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    -[NLPLearnerEmojiClassificationData addResource:].cold.3((uint64_t)v4, v13, v14);
LABEL_14:

}

void __49__NLPLearnerEmojiClassificationData_addResource___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  float v8;
  float v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v10, "isEqualToString:", CFSTR("NONE"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v7, "floatValue"), v8 >= 0.0)
    && (objc_msgSend(v7, "floatValue"), v9 <= 1.0))
  {
    objc_storeStrong((id *)(a1[4] + 64), a3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !CEMStringContainsEmoji()
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || objc_msgSend(v7, "integerValue") < 0
      || (unint64_t)objc_msgSend(v7, "integerValue") >= *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      *a4 = 1;
    }
  }

}

void __49__NLPLearnerEmojiClassificationData_addResource___block_invoke_15(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (CEMStringContainsEmoji() && !objc_msgSend(v7, "integerValue"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unint64_t)embeddingDimension
{
  return self->_embeddingDimension;
}

- (NSDictionary)labelClasses
{
  return self->_labelClasses;
}

- (void).cxx_destruct
{
  nlp::CFScopedPtr<void *>::reset((const void **)&self->_embedding.m_ref, 0);
  objc_storeStrong((id *)&self->_noneClassProbability, 0);
  objc_storeStrong((id *)&self->_labelClasses, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  return self;
}

- (BOOL)addExamples:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sentence"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v10;
        v11 = objc_msgSend(v10, "count");
        if (v11 <= -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength"))
        {
          v12 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") - 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDictionary allValues](self->_labelClasses, "allValues");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = objc_msgSend(v15, "containsObject:", v14);

          if ((_DWORD)v12)
          {
            -[NSMutableArray addObject:](self->_labels, "addObject:", v14);
            -[NLPLearnerTextData sentences](self, "sentences");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v5);

          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);

  }
  return 1;
}

- (void)initWithLocale:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_22630F000, a3, (uint64_t)a3, "Failed to load '%@' word embeddings", (uint8_t *)a2);

}

- (void)addResource:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_22630F000, a2, a3, "Unexpected format of emoji mapping in '%@'", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)addResource:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_22630F000, a2, a3, "Emoji mapped to 0 in presence of NONE class in '%@'", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)addResource:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_22630F000, a2, a3, "Failed to load emoji mapping from '%@'", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end

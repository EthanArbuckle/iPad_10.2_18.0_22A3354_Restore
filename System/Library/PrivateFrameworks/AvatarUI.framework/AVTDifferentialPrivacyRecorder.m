@implementation AVTDifferentialPrivacyRecorder

- (AVTDifferentialPrivacyRecorder)init
{
  return -[AVTDifferentialPrivacyRecorder initWithStringRecorderProvider:numericDataRecorderProvider:](self, "initWithStringRecorderProvider:numericDataRecorderProvider:", &__block_literal_global_21, &__block_literal_global_2_1);
}

id __38__AVTDifferentialPrivacyRecorder_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)get_DPStringRecorderClass_softClass;
  v11 = get_DPStringRecorderClass_softClass;
  if (!get_DPStringRecorderClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __get_DPStringRecorderClass_block_invoke;
    v7[3] = &unk_1EA51D7C0;
    v7[4] = &v8;
    __get_DPStringRecorderClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithKey:", v2);

  return v5;
}

id __38__AVTDifferentialPrivacyRecorder_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)get_DPNumericDataRecorderClass_softClass;
  v11 = get_DPNumericDataRecorderClass_softClass;
  if (!get_DPNumericDataRecorderClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __get_DPNumericDataRecorderClass_block_invoke;
    v7[3] = &unk_1EA51D7C0;
    v7[4] = &v8;
    __get_DPNumericDataRecorderClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithKey:", v2);

  return v5;
}

+ (id)makeCachingStringRecorderProvider:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__AVTDifferentialPrivacyRecorder_makeCachingStringRecorderProvider___block_invoke;
  v9[3] = &unk_1EA51F510;
  v10 = v4;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  v7 = (void *)MEMORY[0x1DF0D0754](v9);

  return v7;
}

id __68__AVTDifferentialPrivacyRecorder_makeCachingStringRecorderProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }

  return v4;
}

+ (id)makeCachingNumRecorderProvider:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__AVTDifferentialPrivacyRecorder_makeCachingNumRecorderProvider___block_invoke;
  v9[3] = &unk_1EA51F538;
  v10 = v4;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  v7 = (void *)MEMORY[0x1DF0D0754](v9);

  return v7;
}

id __65__AVTDifferentialPrivacyRecorder_makeCachingNumRecorderProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }

  return v4;
}

- (AVTDifferentialPrivacyRecorder)initWithStringRecorderProvider:(id)a3 numericDataRecorderProvider:(id)a4
{
  id v6;
  id v7;
  AVTDifferentialPrivacyRecorder *v8;
  uint64_t v9;
  id stringRecorderProvider;
  uint64_t v11;
  id numRecorderProvider;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTDifferentialPrivacyRecorder;
  v8 = -[AVTDifferentialPrivacyRecorder init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "makeCachingStringRecorderProvider:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    stringRecorderProvider = v8->_stringRecorderProvider;
    v8->_stringRecorderProvider = (id)v9;

    objc_msgSend((id)objc_opt_class(), "makeCachingNumRecorderProvider:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    numRecorderProvider = v8->_numRecorderProvider;
    v8->_numRecorderProvider = (id)v11;

  }
  return v8;
}

- (void)recordString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AVTDifferentialPrivacyRecorder stringRecorderProvider](self, "stringRecorderProvider");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v8)[2](v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "record:", v10);
}

- (void)recordNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[AVTDifferentialPrivacyRecorder numRecorderProvider](self, "numRecorderProvider");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v8)[2](v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "record:", v10);
}

- (id)stringRecorderProvider
{
  return self->_stringRecorderProvider;
}

- (id)numRecorderProvider
{
  return self->_numRecorderProvider;
}

- (NSMutableDictionary)stringRecorders
{
  return self->_stringRecorders;
}

- (NSMutableDictionary)numRecorders
{
  return self->_numRecorders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numRecorders, 0);
  objc_storeStrong((id *)&self->_stringRecorders, 0);
  objc_storeStrong(&self->_numRecorderProvider, 0);
  objc_storeStrong(&self->_stringRecorderProvider, 0);
}

@end

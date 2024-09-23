@implementation EARSpeechRecognition

- (EARSpeechRecognition)initWithRecognition:(id)a3
{
  id v4;
  EARSpeechRecognition *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSArray *tokenSausage;
  void *v14;
  uint64_t v15;
  NSArray *interpretationIndices;
  uint64_t v17;
  NSArray *nBest;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)EARSpeechRecognition;
  v5 = -[EARSpeechRecognition init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tokenSausage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke;
    v29[3] = &unk_1E64858E8;
    v30 = v7;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v29);
    objc_msgSend(v4, "nBest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v24 = v8;
    v25 = 3221225472;
    v26 = __44__EARSpeechRecognition_initWithRecognition___block_invoke_4;
    v27 = &unk_1E64858E8;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v28;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v24);
    v12 = objc_msgSend(v9, "copy", v24, v25, v26, v27);
    tokenSausage = v5->_tokenSausage;
    v5->_tokenSausage = (NSArray *)v12;

    objc_msgSend(v4, "interpretationIndices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    interpretationIndices = v5->_interpretationIndices;
    v5->_interpretationIndices = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    nBest = v5->_nBest;
    v5->_nBest = (NSArray *)v17;

    objc_msgSend(v11, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_oneBest, v22);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *tokenSausage;
  id v5;

  tokenSausage = self->_tokenSausage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tokenSausage, CFSTR("tokenSausage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interpretationIndices, CFSTR("interpretationIndices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nBest, CFSTR("nBest"));

}

- (EARSpeechRecognition)initWithCoder:(id)a3
{
  id v4;
  EARSpeechRecognition *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *tokenSausage;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *interpretationIndices;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *nBest;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EARSpeechRecognition;
  v5 = -[EARSpeechRecognition init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tokenSausage"));
    v9 = objc_claimAutoreleasedReturnValue();
    tokenSausage = v5->_tokenSausage;
    v5->_tokenSausage = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("interpretationIndices"));
    v14 = objc_claimAutoreleasedReturnValue();
    interpretationIndices = v5->_interpretationIndices;
    v5->_interpretationIndices = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("nBest"));
    v19 = objc_claimAutoreleasedReturnValue();
    nBest = v5->_nBest;
    v5->_nBest = (NSArray *)v19;

    -[NSArray firstObject](v5->_nBest, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    v23 = (void *)v22;
    if (v22)
      v24 = (void *)v22;
    else
      v24 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_oneBest, v24);

  }
  return v5;
}

- (NSArray)tokenSausage
{
  return self->_tokenSausage;
}

- (NSArray)interpretationIndices
{
  return self->_interpretationIndices;
}

- (NSArray)oneBest
{
  return self->_oneBest;
}

- (NSArray)nBest
{
  return self->_nBest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nBest, 0);
  objc_storeStrong((id *)&self->_oneBest, 0);
  objc_storeStrong((id *)&self->_interpretationIndices, 0);
  objc_storeStrong((id *)&self->_tokenSausage, 0);
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke_2;
  v9[3] = &unk_1E64858E8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v6, "addObject:", v7);

}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke_5;
  v9[3] = &unk_1E64858C0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v6, "addObject:", v7);

}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  EARSpeechRecognitionToken *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[EARSpeechRecognitionToken initWithToken:]([EARSpeechRecognitionToken alloc], "initWithToken:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__EARSpeechRecognition_initWithRecognition___block_invoke_3;
  v9[3] = &unk_1E64858C0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v6, "addObject:", v7);

}

void __44__EARSpeechRecognition_initWithRecognition___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  EARSpeechRecognitionToken *v4;

  v3 = a2;
  v4 = -[EARSpeechRecognitionToken initWithToken:]([EARSpeechRecognitionToken alloc], "initWithToken:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

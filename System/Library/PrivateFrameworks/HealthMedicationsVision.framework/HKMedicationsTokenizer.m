@implementation HKMedicationsTokenizer

- (HKMedicationsTokenizer)init
{
  HKMedicationsTokenizer *v2;
  HKMedicationsTokenizer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsTokenizer;
  v2 = -[HKMedicationsTokenizer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD70]), "initWithUnit:", 0);
    -[HKMedicationsTokenizer setTokenizer:](v3, "setTokenizer:", v4);

  }
  return v3;
}

- (id)wordsFromTranscript:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationsTokenizer tokenizer](self, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v4);

  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[HKMedicationsTokenizer tokenizer](self, "tokenizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "length");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__HKMedicationsTokenizer_wordsFromTranscript___block_invoke;
  v14[3] = &unk_24EC1A358;
  v15 = v4;
  v10 = v7;
  v16 = v10;
  v11 = v4;
  objc_msgSend(v8, "enumerateTokensInRange:usingBlock:", 0, v9, v14);

  v12 = v10;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

void __46__HKMedicationsTokenizer_wordsFromTranscript___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  id v7;

  if (!a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (NLTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

@end

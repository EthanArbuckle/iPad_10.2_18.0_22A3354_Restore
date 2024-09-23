@implementation _ICNAAccountReportToDevice

- (_ICNAAccountReportToDevice)init
{
  _ICNAAccountReportToDevice *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *countOfAccountsByType;
  NSMutableDictionary *v5;
  NSMutableDictionary *countOfNotesByType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_ICNAAccountReportToDevice;
  v2 = -[_ICNAAccountReportToDevice init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countOfAccountsByType = v2->_countOfAccountsByType;
    v2->_countOfAccountsByType = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countOfNotesByType = v2->_countOfNotesByType;
    v2->_countOfNotesByType = v5;

  }
  return v2;
}

- (void)reportAccountType:(int64_t)a3 noteCount:(unint64_t)a4
{
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
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  -[_ICNAAccountReportToDevice countOfAccountsByType](self, "countOfAccountsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICNAAccountReportToDevice countOfAccountsByType](self, "countOfAccountsByType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  -[_ICNAAccountReportToDevice countOfNotesByType](self, "countOfNotesByType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + a4);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[_ICNAAccountReportToDevice countOfNotesByType](self, "countOfNotesByType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v19);

}

- (id)accountTypeSummary
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_ICNAAccountReportToDevice countOfAccountsByType](self, "countOfAccountsByType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___ICNAAccountReportToDevice_accountTypeSummary__block_invoke;
  v6[3] = &unk_1E771BFB8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSMutableDictionary)countOfAccountsByType
{
  return self->_countOfAccountsByType;
}

- (void)setCountOfAccountsByType:(id)a3
{
  objc_storeStrong((id *)&self->_countOfAccountsByType, a3);
}

- (NSMutableDictionary)countOfNotesByType
{
  return self->_countOfNotesByType;
}

- (void)setCountOfNotesByType:(id)a3
{
  objc_storeStrong((id *)&self->_countOfNotesByType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfNotesByType, 0);
  objc_storeStrong((id *)&self->_countOfAccountsByType, 0);
}

@end

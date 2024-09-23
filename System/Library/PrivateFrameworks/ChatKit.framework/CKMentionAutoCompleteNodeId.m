@implementation CKMentionAutoCompleteNodeId

- (CKMentionAutoCompleteNodeId)initWithKeys:(id)a3
{
  id v4;
  CKMentionAutoCompleteNodeId *v5;
  uint64_t v6;
  NSArray *keys;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMentionAutoCompleteNodeId;
  v5 = -[CKMentionAutoCompleteNodeId init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    keys = v5->_keys;
    v5->_keys = (NSArray *)v6;

  }
  return v5;
}

- (CKMentionAutoCompleteNodeId)init
{
  return -[CKMentionAutoCompleteNodeId initWithKeys:](self, "initWithKeys:", MEMORY[0x1E0C9AA60]);
}

- (id)nodeIdByAppendingKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKMentionAutoCompleteNodeId keys](self, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeys:", v6);
  return v7;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
}

@end

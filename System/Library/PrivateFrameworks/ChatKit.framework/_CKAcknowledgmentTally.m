@implementation _CKAcknowledgmentTally

- (_CKAcknowledgmentTally)initWithType:(int64_t)a3 senders:(id)a4
{
  id v6;
  _CKAcknowledgmentTally *v7;
  _CKAcknowledgmentTally *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_CKAcknowledgmentTally;
  v7 = -[_CKAcknowledgmentTally init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_CKAcknowledgmentTally setType:](v7, "setType:", a3);
    v9 = (void *)objc_msgSend(v6, "copy");
    -[_CKAcknowledgmentTally setSenders:](v8, "setSenders:", v9);

  }
  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CKAcknowledgmentTally type](self, "type");
  -[_CKAcknowledgmentTally senders](self, "senders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; type = %ld; senders = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)contacts
{
  NSArray *contacts;
  void *v4;
  void *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKEntity *v12;
  NSArray *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  contacts = self->_contacts;
  if (!contacts)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[_CKAcknowledgmentTally senders](self, "senders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[_CKAcknowledgmentTally senders](self, "senders", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
          -[NSArray addObject:](v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v13 = self->_contacts;
    self->_contacts = v6;

    contacts = self->_contacts;
  }
  return contacts;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_senders, 0);
}

@end

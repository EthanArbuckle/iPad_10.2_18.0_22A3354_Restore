@implementation ICDataCryptor

- (ICDataCryptor)initWithObjectIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICDataCryptor *v7;

  v4 = a3;
  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICDataCryptor initWithObjectIdentifier:context:](self, "initWithObjectIdentifier:context:", v4, v6);
  return v7;
}

- (ICDataCryptor)initWithObjectIdentifier:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  ICDataCryptor *v9;
  ICDataCryptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDataCryptor;
  v9 = -[ICDataCryptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectIdentifier, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDataCryptor objectIdentifier](self, "objectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, objectIdentifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  char v15;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDataCryptor objectIdentifier](self, "objectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
    v9 = 0;
  else
    v9 = v6;
  v10 = v9;
  if (v8 == v7)
    v11 = 0;
  else
    v11 = v7;
  v12 = v11;
  v13 = (void *)v12;
  if (v10 | v12)
  {
    if (v10)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
      v15 = 0;
    else
      v15 = objc_msgSend((id)v10, "isEqual:", v12);
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  -[ICDataCryptor objectIdentifier](self, "objectIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");
  v11 = ICHashWithHashKeys(v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (id)encryptData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  -[ICDataCryptor context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__ICDataCryptor_encryptData___block_invoke;
  v9[3] = &unk_1E76C9ED8;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __29__ICDataCryptor_encryptData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject cloudObjectWithIdentifier:context:](ICCloudSyncingObject, "cloudObjectWithIdentifier:context:", v2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cryptoStrategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptSidecarData:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)decryptData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  -[ICDataCryptor context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__ICDataCryptor_decryptData___block_invoke;
  v9[3] = &unk_1E76C9ED8;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __29__ICDataCryptor_decryptData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject cloudObjectWithIdentifier:context:](ICCloudSyncingObject, "cloudObjectWithIdentifier:context:", v2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cryptoStrategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decryptSidecarData:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDataCryptor)initWithCoder:(id)a3
{
  id v4;
  ICDataCryptor *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *objectIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDataCryptor;
  v5 = -[ICDataCryptor init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_objectIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICDataCryptor objectIdentifier](self, "objectIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_objectIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end

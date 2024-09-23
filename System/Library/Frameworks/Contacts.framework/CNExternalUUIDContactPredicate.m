@implementation CNExternalUUIDContactPredicate

- (CNExternalUUIDContactPredicate)initWithExternalUUIDs:(id)a3
{
  id v4;
  CNExternalUUIDContactPredicate *v5;
  uint64_t v6;
  NSArray *externalUUIDs;
  CNExternalUUIDContactPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNExternalUUIDContactPredicate;
  v5 = -[CNPredicate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    externalUUIDs = v5->_externalUUIDs;
    v5->_externalUUIDs = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingExternalUUIDs:]"));
  -[CNExternalUUIDContactPredicate externalUUIDs](self, "externalUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("externalUUIDs"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)shortDebugDescription
{
  return CFSTR("ExternalUUIDPredicate");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNExternalUUIDContactPredicate *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CNExternalUUIDContactPredicate *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__CNExternalUUIDContactPredicate_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v17 = v4;
  v18 = self;
  aBlock = v6;
  v11 = 3221225472;
  v12 = __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

BOOL __42__CNExternalUUIDContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "externalUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(a1 + 40), "externalUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == objc_msgSend(v4, "count");

  return v5;
}

uint64_t __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  objc_msgSend(*(id *)(a1 + 32), "externalUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_3;
  v5[3] = &unk_1E29F9210;
  v6 = *(id *)(a1 + 40);
  v7 = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "externalUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(MEMORY[0x1E0D13A40], "isString:localizedCaseInsensitiveEqualToOther:", v8, v10);
  if ((a3 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __38__CNExternalUUIDContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __38__CNExternalUUIDContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "externalUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "arrayHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNExternalUUIDContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNExternalUUIDContactPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *externalUUIDs;
  CNExternalUUIDContactPredicate *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNExternalUUIDContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_externalUUIDs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    externalUUIDs = v5->_externalUUIDs;
    v5->_externalUUIDs = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNExternalUUIDContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalUUIDs, CFSTR("_externalUUIDs"), v5.receiver, v5.super_class);

}

- (NSArray)externalUUIDs
{
  return self->_externalUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalUUIDs, 0);
}

@end

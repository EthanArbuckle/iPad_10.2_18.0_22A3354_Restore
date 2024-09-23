@implementation CNContactRelation

- (CNContactRelation)initWithName:(NSString *)name
{
  NSString *v3;
  CNContactRelation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactRelation;
  v3 = name;
  v4 = -[CNContactRelation init](&v6, sel_init);
  -[CNContactRelation setName:](v4, "setName:", v3, v6.receiver, v6.super_class);

  return v4;
}

+ (CNContactRelation)contactRelationWithName:(NSString *)name
{
  NSString *v4;
  void *v5;

  v4 = name;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:", v4);

  return (CNContactRelation *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactRelation)initWithCoder:(id)a3
{
  id v3;
  CNContactRelation *v4;
  void *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNContactRelation;
  v3 = a3;
  v4 = -[CNContactRelation init](&v9, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"), v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v6;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("_name"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[CNContactRelation name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "name"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNContactRelation name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactRelation name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("name"), v4, 0);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  _QWORD v3[5];

  v3[1] = 3221225472;
  v3[2] = __25__CNContactRelation_hash__block_invoke;
  v3[3] = &unk_1E29F7D98;
  v3[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  return objc_msgSend(MEMORY[0x1E0D13A78], "hashWithBlocks:", v3, 0);
}

uint64_t __25__CNContactRelation_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (BOOL)isValid:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  if (isValid__cn_once_token_0_1 != -1)
    dispatch_once(&isValid__cn_once_token_0_1, &__block_literal_global_68);
  v5 = (id)isValid__cn_once_object_0_1;
  if (isValid__cn_once_token_1_1 != -1)
    dispatch_once(&isValid__cn_once_token_1_1, &__block_literal_global_8_1);
  v6 = isValid__cn_once_token_2_1;
  v7 = (id)isValid__cn_once_object_1_1;
  if (v6 != -1)
    dispatch_once(&isValid__cn_once_token_2_1, &__block_literal_global_9_0);
  v8 = +[CN areValidKeyPaths:forObject:expectedClasses:allowNil:error:](CN, "areValidKeyPaths:forObject:expectedClasses:allowNil:error:", v5, self, v7, isValid__cn_once_object_2_1, a3);

  return v8;
}

void __29__CNContactRelation_isValid___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)isValid__cn_once_object_0_1;
  isValid__cn_once_object_0_1 = v1;

}

void __29__CNContactRelation_isValid___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)isValid__cn_once_object_1_1;
  isValid__cn_once_object_1_1 = v1;

}

void __29__CNContactRelation_isValid___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40680, "copy");
  v1 = (void *)isValid__cn_once_object_2_1;
  isValid__cn_once_object_2_1 = v0;

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

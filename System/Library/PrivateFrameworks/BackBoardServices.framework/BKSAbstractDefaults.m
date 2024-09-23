@implementation BKSAbstractDefaults

- (NSString)description
{
  return (NSString *)-[BKSAbstractDefaults descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSAbstractDefaults succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSAbstractDefaults descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  -[BKSAbstractDefaults succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__BKSAbstractDefaults_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E1EA1BF8;
  v10[4] = self;
  v5 = v4;
  v11 = v5;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v10);
  v7 = v11;
  v8 = v5;

  return v8;
}

void __61__BKSAbstractDefaults_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  objc_class *v2;
  objc_property_t *v3;
  objc_property_t *v4;
  unint64_t i;
  objc_property *v6;
  const char *Name;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int outCount;

  outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  v3 = class_copyPropertyList(v2, &outCount);
  if (v3)
  {
    v4 = v3;
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        v6 = v4[i];
        Name = property_getName(v6);
        if (Name)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", Name, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = property_copyAttributeValue(v6, "G");
          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
            v10 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v10;
          }
          v11 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (id)objc_msgSend(v11, "appendObject:withName:", v12, v8);

        }
      }
    }
    free(v4);
  }
}

@end

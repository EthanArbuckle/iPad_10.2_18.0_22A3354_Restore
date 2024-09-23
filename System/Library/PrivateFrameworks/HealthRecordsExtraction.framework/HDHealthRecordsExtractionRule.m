@implementation HDHealthRecordsExtractionRule

+ (id)extractionRuleWithDefinition:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HDHealthRecordsExtractionRule *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("|"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_map:", &__block_literal_global_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "length", (_QWORD)v17))
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("invalid extraction rule"));

              goto LABEL_15;
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
            continue;
          break;
        }
      }

      objc_msgSend(v8, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HDHealthRecordsExtractionRule initWithKeyPath:transforms:]([HDHealthRecordsExtractionRule alloc], "initWithKeyPath:transforms:", v13, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("no key path specified"));
LABEL_15:
      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("empty extraction rule definition"));
    v15 = 0;
  }

  return v15;
}

id __68__HDHealthRecordsExtractionRule_extractionRuleWithDefinition_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD14A8];
  v3 = a2;
  objc_msgSend(v2, "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)definitionBySubstitutingKeyPathWith:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordsExtractionRule.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newKeyPath"));

  }
  if (-[NSArray count](self->_transforms, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_transforms, "componentsJoinedByString:", CFSTR(" | "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" | %@"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (HDHealthRecordsExtractionRule)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHealthRecordsExtractionRule)initWithKeyPath:(id)a3 transforms:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HDHealthRecordsExtractionRule *v10;
  uint64_t v11;
  NSString *keyPath;
  uint64_t v13;
  NSArray *transforms;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordsExtractionRule.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthRecordsExtractionRule.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transforms"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HDHealthRecordsExtractionRule;
  v10 = -[HDHealthRecordsExtractionRule init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    transforms = v10->_transforms;
    v10->_transforms = (NSArray *)v13;

  }
  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end

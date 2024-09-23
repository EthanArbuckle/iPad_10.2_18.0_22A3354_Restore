@implementation HMDPropertyCodingDescription

- (id)initWithModel:(void *)a3 property:
{
  id *v5;
  id *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unint64_t v22;
  void *v24;
  id v25;
  id obj;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27.receiver = a1;
  v27.super_class = (Class)HMDPropertyCodingDescription;
  v5 = (id *)objc_msgSendSuper2(&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 1, a3);
    -[HMDManagedObjectCodingModel codingKeyForProperty:](a2, a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v6[2];
    v6[2] = (id)v7;

    objc_msgSend(a3, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a2 + 112));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v13 = *(id *)(a2 + 40);
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invertedSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v12;
      objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("|"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
      {
        v17 = v16;
        v24 = a3;
        v18 = 0;
        v19 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if (!objc_msgSend(v21, "length")
              || objc_msgSend(v21, "rangeOfCharacterFromSet:", v15) != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v24, "entity");
              objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
              objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "name");
              objc_claimAutoreleasedReturnValue();
              _HMFPreconditionFailureWithFormat();
LABEL_25:
              _HMFPreconditionFailure();
            }
            objc_opt_self();
            v22 = objc_msgSend(v13, "indexOfObject:", v21);
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v22 = objc_msgSend(v13, "count");
              objc_msgSend(v13, "addObject:", v21);
            }
            objc_opt_self();
            if (v22 >= 0x40)
              goto LABEL_25;
            v18 |= 1 << v22;
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      v12 = v25;
    }
    else
    {
      v18 = 0;
    }

    v6[3] = (id)v18;
  }
  return v6;
}

- (NSPropertyDescription)property
{
  return self->_property;
}

- (NSString)name
{
  return -[NSPropertyDescription name](self->_property, "name");
}

- (NSString)codingKey
{
  return self->_codingKey;
}

- (BOOL)isConditional
{
  return self->_conditions != 0;
}

- (BOOL)shouldIncludeWithConditions:(id)a3
{
  unint64_t conditions;
  uint64_t v4;

  conditions = self->_conditions;
  if (!conditions)
    return 1;
  if (a3)
    v4 = *((_QWORD *)a3 + 2);
  else
    v4 = 0;
  return (v4 & conditions) != 0;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSPropertyDescription entity](self->_property, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPropertyDescription name](self->_property, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end

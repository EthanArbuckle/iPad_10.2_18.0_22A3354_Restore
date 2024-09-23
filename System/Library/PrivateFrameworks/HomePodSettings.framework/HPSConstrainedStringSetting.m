@implementation HPSConstrainedStringSetting

- (HPSConstrainedStringSetting)initWithKeyPath:(id)a3 stringValue:(id)a4 items:(id)a5
{
  id v8;
  HPSConstrainedStringSetting *v9;
  uint64_t v10;
  NSArray *items;

  v8 = a5;
  v9 = -[HPSStringSetting initWithKeyPath:stringValue:](self, "initWithKeyPath:stringValue:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    items = v9->_items;
    v9->_items = (NSArray *)v10;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HPSConstrainedStringSetting;
  -[HPSSetting encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HPSConstrainedStringSetting items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("setting.items"));

}

- (HPSConstrainedStringSetting)initWithCoder:(id)a3
{
  id v4;
  HPSConstrainedStringSetting *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *items;
  HPSConstrainedStringSetting *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HPSConstrainedStringSetting;
  v5 = -[HPSSetting initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (!v5 || !objc_msgSend(v4, "containsValueForKey:", CFSTR("setting.items")))
  {
LABEL_13:
    v10 = v5;
    goto LABEL_14;
  }
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("setting.items"));
  v8 = objc_claimAutoreleasedReturnValue();
  items = v5->_items;
  v5->_items = (NSArray *)v8;

  objc_opt_class();
  v10 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v5->_items;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v10 = 0;
            goto LABEL_14;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v13)
          continue;
        break;
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end

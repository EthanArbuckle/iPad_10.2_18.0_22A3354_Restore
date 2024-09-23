@implementation SKActionTable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionTableWithContentsOfDictionary:(id)a3
{
  id v3;
  SKActionTable *v4;

  v3 = a3;
  v4 = -[SKActionTable initWithContentsOfDictionary:]([SKActionTable alloc], "initWithContentsOfDictionary:", v3);

  return v4;
}

- (SKActionTable)initWithContentsOfDictionary:(id)a3
{
  id v4;
  SKActionTable *v5;
  uint64_t v6;
  NSDictionary *actionTableDictionary;
  NSMutableDictionary *info;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKActionTable;
  v5 = -[SKActionTable init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    actionTableDictionary = v5->_actionTableDictionary;
    v5->_actionTableDictionary = (NSDictionary *)v6;

    info = v5->__info;
    v5->__info = 0;

  }
  return v5;
}

- (SKActionTable)initWithCoder:(id)a3
{
  id v4;
  SKActionTable *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *actionTableDictionary;
  uint64_t v11;
  NSMutableDictionary *info;
  objc_super v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKActionTable;
  v5 = -[SKActionTable init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_actionTableDict"));
    v9 = objc_claimAutoreleasedReturnValue();
    actionTableDictionary = v5->_actionTableDictionary;
    v5->_actionTableDictionary = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_info"));
    v11 = objc_claimAutoreleasedReturnValue();
    info = v5->__info;
    v5->__info = (NSMutableDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionTableDictionary, CFSTR("_actionTableDict"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__info, CFSTR("_info"));

}

- (BOOL)isEqualToActionTable:(id)a3
{
  SKActionTable *v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (SKActionTable *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_actionTableDictionary;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_actionTableDictionary, "objectForKey:", v9, (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKey:](v4->_actionTableDictionary, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {

LABEL_15:
            v13 = 0;
            goto LABEL_16;
          }
          v12 = objc_msgSend(v10, "isEqualToAction:", v11);

          if ((v12 & 1) == 0)
            goto LABEL_15;
        }
        v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v13 = 1;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v13 = 1;
    }
LABEL_16:

  }
  return v13;
}

- (id)actionForName:(id)a3
{
  -[NSDictionary objectForKeyedSubscript:](self->_actionTableDictionary, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)actionTableDictionary
{
  return self->_actionTableDictionary;
}

- (NSMutableDictionary)_info
{
  return self->__info;
}

- (void)set_info:(id)a3
{
  objc_storeStrong((id *)&self->__info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__info, 0);
  objc_storeStrong((id *)&self->_actionTableDictionary, 0);
}

@end

@implementation MPUContentItemIdentifierCollection

- (MPUContentItemIdentifierCollection)initWithItemType:(unint64_t)a3
{
  MPUContentItemIdentifierCollection *result;

  result = -[MPUContentItemIdentifierCollection init](self, "init");
  if (result)
    result->_itemType = a3;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t itemType;
  __CFString *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  char v21;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  itemType = self->_itemType;
  if (itemType > 0xE)
    v8 = 0;
  else
    v8 = off_24DD6E138[itemType];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p itemType:%@"), v5, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__MPUContentItemIdentifierCollection_description__block_invoke;
  v12[3] = &unk_24DD6E118;
  v14 = v20;
  v10 = v9;
  v13 = v10;
  v15 = &v16;
  -[MPUContentItemIdentifierCollection enumerateIdentifiersUsingBlock:](self, "enumerateIdentifiersUsingBlock:", v12);
  if (*((_BYTE *)v17 + 24))
    objc_msgSend(v10, "appendString:", CFSTR("}"));
  objc_msgSend(v10, "appendString:", CFSTR(">"));

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
  return v10;
}

void __49__MPUContentItemIdentifierCollection_description__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5;
  __CFString *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    *(_BYTE *)(v5 + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" identifiers: {\n"));
  }
  if (a2 > 8)
    v6 = 0;
  else
    v6 = off_24DD6E1B0[a2];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@\n"), v6, v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

- (unint64_t)hash
{
  return self->_itemType ^ -[NSMapTable hash](self->_identifierTypeToIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MPUContentItemIdentifierCollection *v4;
  NSMapTable *identifierTypeToIdentifier;
  char v6;

  v4 = (MPUContentItemIdentifierCollection *)a3;
  if (self == v4)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_itemType != v4->_itemType)
  {
    v6 = 0;
    goto LABEL_8;
  }
  identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
  if (identifierTypeToIdentifier == v4->_identifierTypeToIdentifier)
  {
LABEL_7:
    v6 = 1;
    goto LABEL_8;
  }
  v6 = -[NSMapTable isEqual:](identifierTypeToIdentifier, "isEqual:");
LABEL_8:

  return v6;
}

- (MPUContentItemIdentifierCollection)initWithCoder:(id)a3
{
  id v4;
  MPUContentItemIdentifierCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPUContentItemIdentifierCollection;
  v5 = -[MPUContentItemIdentifierCollection init](&v23, sel_init);
  if (v5)
  {
    v5->_itemType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPUContentItemIdentifierCollectionItemType"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("MPUContentItemIdentifierCollectionIdentifierTypeNumberToIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPUContentItemIdentifierCollection _setIdentifier:forIdentifierType:](v5, "_setIdentifier:forIdentifierType:", v17, objc_msgSend(v16, "unsignedIntegerValue"));

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v13);
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  objc_msgSend(v13, "encodeInteger:forKey:", self->_itemType, CFSTR("MPUContentItemIdentifierCollectionItemType"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_identifierTypeToIdentifier;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_identifierTypeToIdentifier, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (!v7)
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMapTable count](self->_identifierTypeToIdentifier, "count"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v11, v12);

        }
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("MPUContentItemIdentifierCollectionIdentifierTypeNumberToIdentifier"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPUContentItemIdentifierCollection _copyWithZone:class:](self, "_copyWithZone:class:", a3, objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)identifierCount
{
  return -[NSMapTable count](self->_identifierTypeToIdentifier, "count");
}

- (void)enumerateIdentifiersUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  NSMapTable *identifierTypeToIdentifier;
  char v6;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  if (v4)
  {
    identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
    if (identifierTypeToIdentifier)
    {
      memset(&enumerator, 0, sizeof(enumerator));
      NSEnumerateMapTable(&enumerator, identifierTypeToIdentifier);
      value = 0;
      key = 0;
      v6 = 0;
      do
      {
        if (!NSNextMapEnumeratorPair(&enumerator, &key, &value))
          break;
        v4[2](v4, key, value, &v6);
      }
      while (!v6);
      NSEndMapTableEnumeration(&enumerator);
    }
  }

}

- (id)identifierForIdentifierType:(unint64_t)a3
{
  NSMapTable *identifierTypeToIdentifier;

  identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
  if (identifierTypeToIdentifier)
    identifierTypeToIdentifier = (NSMapTable *)NSMapGet(identifierTypeToIdentifier, (const void *)a3);
  return identifierTypeToIdentifier;
}

- (id)_copyWithZone:(_NSZone *)a3 class:(Class)a4
{
  objc_class *v5;
  uint64_t v6;
  void *v7;

  v5 = -[objc_class initWithItemType:](-[objc_class allocWithZone:](a4, "allocWithZone:", a3), "initWithItemType:", self->_itemType);
  if (v5)
  {
    v6 = -[NSMapTable copy](self->_identifierTypeToIdentifier, "copy");
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

  }
  return v5;
}

- (void)_setIdentifier:(id)a3 forIdentifierType:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  NSMapTable *v9;
  NSMapTable *identifierTypeToIdentifier;
  NSMapTable *v11;
  NSMapTable *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  NSMapTable *v17;
  id v18;

  v6 = a3;
  v7 = v6;
  v18 = v6;
  if (a4 > 8)
  {
    if (v6)
    {
LABEL_9:
      v9 = (NSMapTable *)objc_msgSend(v7, "copy");
      if (v9)
      {
        identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
        if (!identifierTypeToIdentifier)
        {
          v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 1);
          v12 = self->_identifierTypeToIdentifier;
          self->_identifierTypeToIdentifier = v11;

          identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
        }
        NSMapInsert(identifierTypeToIdentifier, (const void *)a4, v9);
      }
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  if (((1 << a4) & 0x1E2) != 0)
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "isNSNumber");
LABEL_8:
      v7 = v18;
      if ((v8 & 1) != 0)
        goto LABEL_9;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (a4 - 1 > 7)
        v16 = 0;
      else
        v16 = off_24DD6E1F8[a4 - 1];
      NSLog(CFSTR("%@: Invalid identifier (%@: %@) provided for type: %@. Undefined results when using this identifier."), self, v14, v18, v16);

    }
  }
  else
  {
    if (((1 << a4) & 0x1C) == 0)
      goto LABEL_22;
    if (v6)
    {
      v8 = objc_msgSend(v6, "isNSString");
      goto LABEL_8;
    }
  }
LABEL_17:
  v17 = self->_identifierTypeToIdentifier;
  if (v17)
  {
    NSMapRemove(v17, (const void *)a4);
    if (!-[NSMapTable count](self->_identifierTypeToIdentifier, "count"))
    {
      v18 = 0;
      v9 = self->_identifierTypeToIdentifier;
      self->_identifierTypeToIdentifier = 0;
LABEL_21:

      v7 = v18;
      goto LABEL_22;
    }
  }
  v7 = 0;
LABEL_22:

}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierTypeToIdentifier, 0);
}

@end

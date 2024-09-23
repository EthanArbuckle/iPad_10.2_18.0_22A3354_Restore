@implementation NSMetadataItem

- (id)_init:(id)a3
{
  NSMetadataItem *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMetadataItem;
  v4 = -[NSMetadataItem init](&v6, sel_init);
  v4->_item = a3;
  v4->_reserved = objc_alloc_init(_NSMetadataItemPrivateIvars);
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMetadataItem;
  -[NSMetadataItem dealloc](&v3, sel_dealloc);
}

- (id)_item
{
  return self->_item;
}

- (void)_setQuery:(id)a3
{
  *((_QWORD *)self->_reserved + 1) = a3;
}

- (id)valueForKey:(id)a3
{
  void *v6;
  objc_super v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("attributes")))
    {
      return -[NSMetadataItem attributes](self, "attributes");
    }
    else
    {
      if (objc_msgSend(CFSTR("kMDItemPath"), "isEqualToString:", a3))
        return -[NSMetadataItem valueForAttribute:](self, "valueForAttribute:", a3);
      v6 = (void *)*((_QWORD *)self->_reserved + 1);
      if (objc_msgSend(v6, "_isMDQuery"))
      {
        if ((objc_msgSend((id)objc_msgSend(v6, "_allAttributes"), "containsObject:", a3) & 1) != 0)
          return -[NSMetadataItem valueForAttribute:](self, "valueForAttribute:", a3);
      }
      if (-[NSArray containsObject:](-[NSMetadataItem attributes](self, "attributes"), "containsObject:", a3))
      {
        return -[NSMetadataItem valueForAttribute:](self, "valueForAttribute:", a3);
      }
      else
      {
        v7.receiver = self;
        v7.super_class = (Class)NSMetadataItem;
        return -[NSMetadataItem valueForKey:](&v7, sel_valueForKey_);
      }
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSMetadataItem;
    return -[NSMetadataItem valueForKey:](&v8, sel_valueForKey_);
  }
}

- (id)valueForAttribute:(NSString *)key
{
  void *v5;
  uint64_t v6;
  id result;

  v5 = (void *)*((_QWORD *)self->_reserved + 1);
  if (!objc_msgSend(v5, "_isMDQuery"))
    return (id)objc_msgSend((id)objc_msgSend(self->_item, "attributeForName:", key), "copy");
  if (!objc_msgSend((id)objc_msgSend(v5, "_allAttributes"), "containsObject:", key))
    return (id)objc_msgSend((id)objc_msgSend(self->_item, "attributeForName:", key), "copy");
  v6 = objc_msgSend(v5, "indexOfResult:", self);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return (id)objc_msgSend((id)objc_msgSend(self->_item, "attributeForName:", key), "copy");
  result = (id)objc_msgSend(v5, "valueOfAttribute:forResultAtIndex:", key, v6);
  if (!result)
    return (id)objc_msgSend((id)objc_msgSend(self->_item, "attributeForName:", key), "copy");
  return result;
}

- (NSDictionary)valuesForAttributes:(NSArray *)keys
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*((_QWORD *)self->_reserved + 1);
  if (!objc_msgSend(v5, "_isMDQuery"))
    return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
  v6 = (void *)objc_msgSend(v5, "_allAttributes");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(keys);
      if (!objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10)))
        return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v8)
          goto LABEL_4;
        break;
      }
    }
  }
  v11 = objc_msgSend(v5, "indexOfResult:", self);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
  v12 = v11;
  v13 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(keys);
        -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", objc_msgSend(v5, "valueOfAttribute:forResultAtIndex:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v12), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](keys, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v15);
  }
  if (!v13)
    return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
  return v13;
}

- (NSArray)attributes
{
  NSArray *result;

  result = (NSArray *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributeNames"), "copy");
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

@end

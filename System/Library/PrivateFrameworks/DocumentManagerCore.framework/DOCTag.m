@implementation DOCTag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarPinned, 0);
  objc_storeStrong((id *)&self->_sidebarVisible, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (BOOL)isEqual:(id)a3
{
  DOCTag *v4;
  BOOL v5;

  v4 = (DOCTag *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[DOCTag isEqualToTag:](self, "isEqualToTag:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DOCTag displayName](self, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precomposedStringWithCanonicalMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[DOCTag displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(v4, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v6 = 1;
        goto LABEL_7;
      }
    }
    -[DOCTag displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "compare:options:", v9, 129) == 0;

  }
  else
  {
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)type
{
  return self->_type;
}

- (DOCTag)initWithDisplayName:(id)a3 labelIndex:(int64_t)a4 type:(int64_t)a5 itemCount:(int64_t)a6 sidebarVisible:(id)a7 sidebarPinned:(id)a8
{
  id v14;
  id v15;
  id v16;
  DOCTag *v17;
  DOCTag *v18;
  objc_super v20;

  v14 = a3;
  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)DOCTag;
  v17 = -[DOCTag init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayName, a3);
    v18->_labelIndex = a4;
    v18->_type = a5;
    objc_storeStrong((id *)&v18->_sidebarVisible, a7);
    objc_storeStrong((id *)&v18->_sidebarPinned, a8);
  }

  return v18;
}

- (DOCTag)initWithDisplayName:(id)a3 labelIndex:(int64_t)a4 type:(int64_t)a5
{
  return -[DOCTag initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:](self, "initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:", a3, a4, a5, -1, 0, 0);
}

- (int64_t)labelIndex
{
  return self->_labelIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCTag)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  DOCTag *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("labelIndex"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemCount"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sidebarVisible"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sidebarPinned"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DOCTag initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:](self, "initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:", v5, v6, v7, v8, v9, v10);
  return v11;
}

+ (id)tagsLoadedFromUserDefaults
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  DOCTag *v18;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.DocumentManagerCore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("UIDocumentPickerDefaultTags"), CFSTR("plist"));
  v3 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_LOCALIZABLE_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FinderTagDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("FinderTags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", CFSTR("n"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("l"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
          v17 = objc_msgSend(v15, "integerValue");
        else
          v17 = 0;
        v18 = -[DOCTag initWithDisplayName:labelIndex:type:]([DOCTag alloc], "initWithDisplayName:labelIndex:type:", v14, v17, 1);
        objc_msgSend(v8, "addObject:", v18);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  return v8;
}

+ (BOOL)areTags:(id)a3 equalByNameAndColorTo:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (!(v5 | v6))
    goto LABEL_2;
  if (!objc_msgSend((id)v5, "isEqualToOrderedSet:", v6))
  {
LABEL_12:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  v8 = objc_msgSend((id)v5, "count");
  if (v8)
  {
    v9 = 0;
    v10 = v8 - 1;
    while (1)
    {
      objc_msgSend((id)v5, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "labelIndex");
      if (v13 != objc_msgSend(v12, "labelIndex"))
        break;
      objc_msgSend(v11, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v14, "isEqualToString:", v15);

      if (v7)
      {
        if (v10 != v9++)
          continue;
      }
      goto LABEL_13;
    }

    goto LABEL_12;
  }
LABEL_2:
  LOBYTE(v7) = 1;
LABEL_13:

  return v7;
}

+ (id)untitledTagForRendering:(int64_t)a3
{
  return -[DOCTag initWithDisplayName:labelIndex:type:]([DOCTag alloc], "initWithDisplayName:labelIndex:type:", &stru_24C0FF868, a3, 1);
}

- (DOCTag)initWithICloudTagAttributes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  DOCTag *v12;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCTag.m"), 29, CFSTR("iCloudTag dictionary missing required keys"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("l"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("v"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[DOCTag initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:](self, "initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:", v7, v9, 1, -1, v10, v11);
  return v12;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = -[DOCTag type](self, "type");
  v4 = CFSTR("unexpected tag type");
  if (!v3)
    v4 = CFSTR("discovered");
  if (v3 == 1)
    v5 = CFSTR("user");
  else
    v5 = v4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)DOCTag;
  -[DOCTag description](&v11, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTag displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: %@, labelIndex: %ld, type: %@"), v7, v8, -[DOCTag labelIndex](self, "labelIndex"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)iCloudTagAttributes
{
  void *v3;
  void *v4;
  const __CFString *displayName;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
  v4 = v3;
  if (self->_displayName)
    displayName = (const __CFString *)self->_displayName;
  else
    displayName = &stru_24C0FF868;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", displayName, CFSTR("n"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_labelIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("l"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_sidebarVisible, CFSTR("v"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_sidebarPinned, CFSTR("p"));
  return v4;
}

- (void)mergeWithTag:(id)a3 options:(int64_t)a4
{
  char v4;
  NSString *displayName;
  void *v7;
  void *v8;
  NSNumber *v9;
  NSNumber *sidebarVisible;
  NSNumber *v11;
  NSNumber *sidebarPinned;
  id v13;

  v4 = a4;
  v13 = a3;
  displayName = self->_displayName;
  objc_msgSend(v13, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(displayName) = -[NSString isEqualToString:](displayName, "isEqualToString:", v7);

  v8 = v13;
  if ((_DWORD)displayName)
  {
    if (objc_msgSend(v13, "type") > self->_type)
      self->_type = objc_msgSend(v13, "type");
    if ((v4 & 2) != 0 || !self->_labelIndex)
      self->_labelIndex = objc_msgSend(v13, "labelIndex");
    v8 = v13;
    if ((v4 & 4) != 0 || self->_itemCount == -1)
    {
      self->_itemCount = objc_msgSend(v13, "itemCount");
      v8 = v13;
    }
    if (!self->_sidebarVisible)
    {
      objc_msgSend(v13, "sidebarVisible");
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      sidebarVisible = self->_sidebarVisible;
      self->_sidebarVisible = v9;

      v8 = v13;
    }
    if (!self->_sidebarPinned)
    {
      objc_msgSend(v13, "sidebarPinned");
      v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      sidebarPinned = self->_sidebarPinned;
      self->_sidebarPinned = v11;

      v8 = v13;
    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  id v5;

  displayName = self->_displayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_labelIndex, CFSTR("labelIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemCount, CFSTR("itemCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sidebarVisible, CFSTR("sidebarVisible"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sidebarPinned, CFSTR("sidebarPinned"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCTag *v5;
  void *v6;
  int64_t labelIndex;
  int64_t type;
  int64_t itemCount;
  void *v10;
  void *v11;
  DOCTag *v12;

  v5 = [DOCTag alloc];
  v6 = (void *)-[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  labelIndex = self->_labelIndex;
  type = self->_type;
  itemCount = self->_itemCount;
  v10 = (void *)-[NSNumber copyWithZone:](self->_sidebarPinned, "copyWithZone:", a3);
  v11 = (void *)-[NSNumber copyWithZone:](self->_sidebarVisible, "copyWithZone:", a3);
  v12 = -[DOCTag initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:](v5, "initWithDisplayName:labelIndex:type:itemCount:sidebarVisible:sidebarPinned:", v6, labelIndex, type, itemCount, v10, v11);

  return v12;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (NSNumber)sidebarVisible
{
  return self->_sidebarVisible;
}

- (NSNumber)sidebarPinned
{
  return self->_sidebarPinned;
}

@end

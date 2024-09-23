@implementation MSVSectionedCollection

- (MSVSectionedCollection)init
{
  MSVSectionedCollection *v2;
  MSVSectionedCollection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVSectionedCollection;
  v2 = -[MSVSectionedCollection init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MSVSectionedCollection _initializeAsEmptySectionedCollection](v2, "_initializeAsEmptySectionedCollection");
  return v3;
}

- (MSVSectionedCollection)initWithCoder:(id)a3
{
  id v4;
  MSVSectionedCollection *v5;
  uint64_t v6;
  NSArray *sectionedItems;
  uint64_t v8;
  NSArray *sections;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVSectionedCollection;
  v5 = -[MSVSectionedCollection init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sectionedItems"));
    v6 = objc_claimAutoreleasedReturnValue();
    sectionedItems = v5->_sectionedItems;
    v5->_sectionedItems = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sections"));
    v8 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sectionedItems;
  id v5;

  sectionedItems = self->_sectionedItems;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sectionedItems, CFSTR("sectionedItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sections, CFSTR("sections"));

}

- (NSString)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v7 = -[MSVSectionedCollection numberOfSections](self, "numberOfSections");
  v8 = v7;
  v9 = CFSTR("sections");
  if (v7 == 1)
    v9 = CFSTR("section");
  objc_msgSend(v6, "appendFormat:", CFSTR("; %lu %@"), v7, v9);
  objc_msgSend(v6, "appendString:", CFSTR(": ["));
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      v11 = -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
      -[MSVSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "debugDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("items");
      if (v11 == 1)
        v15 = CFSTR("item");
      objc_msgSend(v6, "appendFormat:", CFSTR("\n    %@ (%lu %@): ["), v13, v11, v15);

      if (v11 >= 1)
      {
        for (j = 0; j != v11; ++j)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "msv_indexPathForItem:inSection:", j, i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSVSectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "debugDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("\n        %@,"), v19);

        }
        objc_msgSend(v6, "appendString:", CFSTR("\n    "));
      }
      objc_msgSend(v6, "appendString:", CFSTR("],"));
    }
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v6, "appendString:", CFSTR("]"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v7 = -[MSVSectionedCollection numberOfSections](self, "numberOfSections");
  v8 = v7;
  v9 = CFSTR("sections");
  if (v7 == 1)
    v9 = CFSTR("section");
  objc_msgSend(v6, "appendFormat:", CFSTR("; %lu %@"), v7, v9);
  objc_msgSend(v6, "appendString:", CFSTR("; ["));
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      v11 = -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
      -[MSVSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v11 == 1)
        v15 = CFSTR("item");
      else
        v15 = CFSTR("items");
      objc_msgSend(v6, "appendFormat:", CFSTR("\n    %@ (%lu %@),"), v13, v11, v15);

    }
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v6, "appendString:", CFSTR("]"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MSVMutableSectionedCollection *v4;
  uint64_t v5;
  NSArray *sections;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSArray *sectionedItems;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MSVMutableSectionedCollection);
  if (v4)
  {
    v5 = -[NSArray mutableCopy](self->_sections, "mutableCopy");
    sections = v4->super._sections;
    v4->super._sections = (NSArray *)v5;

    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_sectionedItems, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_sectionedItems;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "mutableCopy", (_QWORD)v16);
          -[NSArray addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    sectionedItems = v4->super._sectionedItems;
    v4->super._sectionedItems = v7;

  }
  return v4;
}

- (id)firstItem
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_sectionedItems, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastItem
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_sectionedItems, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)allItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MSVSectionedCollection totalItemCount](self, "totalItemCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_sectionedItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (id)allSections
{
  return (id)-[NSArray copy](self->_sections, "copy");
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_sections, "count");
}

- (id)sectionAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a3);
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndex:](self->_sectionedItems, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "msv_section");
  v6 = objc_msgSend(v4, "msv_item");

  -[NSArray objectAtIndex:](self->_sectionedItems, "objectAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t, char *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, uint64_t, char *))a3;
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_sections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v12;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v9)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), v8 + v10, &v15);
      if (v15)
        break;
      if (v7 == ++v10)
      {
        v8 += v10;
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)reverseEnumerateSectionsUsingBlock:(id)a3
{
  void (**v4)(id, void *, int64_t, BOOL *);
  int64_t v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;

  v4 = (void (**)(id, void *, int64_t, BOOL *))a3;
  v5 = -[NSArray count](self->_sections, "count") - 1;
  v8 = v5 < 0;
  do
  {
    if (v8)
      break;
    if (v5 < 0)
      break;
    -[MSVSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, v5, &v8);
    v7 = v8;
    --v5;

  }
  while (!v7);

}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD, uint64_t, char *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, uint64_t, char *))a4;
  -[NSArray objectAtIndex:](self->_sectionedItems, "objectAtIndex:", a3);
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v7);
      v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), v10 + v12, &v17);
      if (v17)
        break;
      if (v9 == ++v12)
      {
        v10 += v12;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4;
  NSArray *sectionedItems;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  sectionedItems = self->_sectionedItems;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E43E94F8;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NSArray enumerateObjectsUsingBlock:](sectionedItems, "enumerateObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

- (id)firstSection
{
  return -[NSArray firstObject](self->_sections, "firstObject");
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "msv_section");
  v6 = objc_msgSend(v4, "msv_item");
  if (v5 < 0)
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    while (v5 != v8)
      v9 += -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v8++);
    if (v7 >= -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v5))
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v7 + v9;
  }

  return v10;
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v22 = v6;
    v23 = v5;
    v24 = v4;
    v25 = v3;
    if (a3 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSectionedCollection.m"), 252, CFSTR("globalIndex must be greater than or equal to 0"));

    }
    v14 = -[MSVSectionedCollection numberOfSections](self, "numberOfSections", v8, v7, v22, v23, v24, v25, v9, v10);
    if (v14 < 1)
    {
LABEL_10:
      v11 = 0;
    }
    else
    {
      v15 = v14;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v16);
        if (v18 + v17 > a3)
          break;
        ++v16;
        v17 += v18;
        if (v15 == v16)
          goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "msv_indexPathForItem:inSection:", a3 - v17, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v11;
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_sectionedItems, "objectAtIndex:", a3);
}

- (BOOL)hasSameContentAsSectionedCollection:(id)a3
{
  return self == a3;
}

- (id)lastSection
{
  return -[NSArray lastObject](self->_sections, "lastObject");
}

- (int64_t)totalItemCount
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  v3 = -[MSVSectionedCollection numberOfSections](self, "numberOfSections");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  do
    v6 += -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v5++);
  while (v4 != v5);
  return v6;
}

- (id)_stateDumpObject
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = -[MSVSectionedCollection numberOfSections](self, "numberOfSections");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MSVSectionedCollection numberOfSections](self, "numberOfSections"));
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      v6 = -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
      -[MSVSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __42__MSVSectionedCollection__stateDumpObject__block_invoke;
      v13[3] = &unk_1E43E9520;
      v14 = v8;
      v9 = v8;
      -[MSVSectionedCollection enumerateItemsInSectionAtIndex:usingBlock:](self, "enumerateItemsInSectionAtIndex:usingBlock:", i, v13);
      v15[0] = CFSTR("section");
      v15[1] = CFSTR("items");
      v16[0] = v7;
      v16[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
  }
  return v4;
}

- (void)_initializeAsEmptySectionedCollection
{
  NSArray *sectionedItems;
  NSArray *v4;
  NSArray *sections;

  sectionedItems = self->_sectionedItems;
  v4 = (NSArray *)MEMORY[0x1E0C9AA60];
  self->_sectionedItems = (NSArray *)MEMORY[0x1E0C9AA60];

  sections = self->_sections;
  self->_sections = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionedItems, 0);
}

uint64_t __42__MSVSectionedCollection__stateDumpObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E43E94D0;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = a3;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v10);
  if (a4 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

void __51__MSVSectionedCollection_enumerateItemsUsingBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = (void *)MEMORY[0x1A1AFBB54]();
  v8 = a1[4];
  objc_msgSend(MEMORY[0x1E0CB36B0], "msv_indexPathForItem:inSection:", a3, a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, uint64_t))(v8 + 16))(v8, v10, v9, *(_QWORD *)(a1[5] + 8) + 24);

  if (a4 && *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;
  objc_autoreleasePoolPop(v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)msv_mutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)msv_immutableClass
{
  return (Class)objc_opt_class();
}

@end

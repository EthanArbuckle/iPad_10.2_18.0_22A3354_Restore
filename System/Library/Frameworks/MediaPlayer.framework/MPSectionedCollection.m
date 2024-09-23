@implementation MPSectionedCollection

- (void)enumerateItemIdentifiersUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v14 = 0;
  v5 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v7);
      v9 = v14;
      if (v8 >= 1 && !v14)
      {
        v10 = v8;
        v11 = 1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11 - 1, v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSectionedCollection identifiersForItemAtIndexPath:](self, "identifiersForItemAtIndexPath:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            v4[2](v4, v12, v13, &v14);

          v9 = v14;
          if (v11 >= v10)
            break;
          ++v11;
        }
        while (!v14);
      }
      ++v7;
    }
    while (v7 < v6 && !v9);
  }

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
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");
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
      v9 += -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v8++);
    if (v7 >= -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v5))
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v7 + v9;
  }

  return v10;
}

- (int64_t)totalItemCount
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  v3 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  do
    v6 += -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v5++);
  while (v4 != v5);
  return v6;
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
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPSectionedCollection.m"), 254, CFSTR("globalIndex must be greater than or equal to 0"));

    }
    v14 = -[MPSectionedCollection numberOfSections](self, "numberOfSections", v8, v7, v22, v23, v24, v25, v9, v10);
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
        v18 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v16);
        if (v18 + v17 > a3)
          break;
        ++v16;
        v17 += v18;
        if (v15 == v16)
          goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3 - v17, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionedItems, 0);
}

- (int64_t)numberOfSections
{
  return -[NSArray count](self->_sections, "count");
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
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");

  -[NSArray objectAtIndex:](self->_sectionedItems, "objectAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v7[2] = __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_1E3154160;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NSArray enumerateObjectsUsingBlock:](sectionedItems, "enumerateObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

void __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E3154138;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = a3;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v10);
  if (a4 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

- (MPSectionedCollection)init
{
  MPSectionedCollection *v2;
  MPSectionedCollection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPSectionedCollection;
  v2 = -[MPSectionedCollection init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MPSectionedCollection _initializeAsEmptySectionedCollection](v2, "_initializeAsEmptySectionedCollection");
  return v3;
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

- (id)sectionAtIndex:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a3);
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

void __50__MPSectionedCollection_enumerateItemsUsingBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = (void *)MEMORY[0x19403A624]();
  v8 = a1[4];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, uint64_t))(v8 + 16))(v8, v10, v9, *(_QWORD *)(a1[5] + 8) + 24);

  if (a4 && *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;
  objc_autoreleasePoolPop(v7);

}

- (void)enumerateSectionIdentifiersUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, uint64_t, void *, _BYTE *))a3;
  v9 = 0;
  v5 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 1;
    do
    {
      -[MPSectionedCollection identifiersForSectionAtIndex:](self, "identifiersForSectionAtIndex:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7 - 1, v8, &v9);

      if (v7 >= v6)
        break;
      ++v7;
    }
    while (!v9);
  }

}

- (void)enumerateItemIdentifiersInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, uint64_t, void *, _BYTE *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v6 = (void (**)(id, uint64_t, void *, _BYTE *))a4;
  v12 = 0;
  v7 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", a3);
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9 - 1, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPSectionedCollection identifiersForItemAtIndexPath:](self, "identifiersForItemAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v6[2](v6, v9 - 1, v11, &v12);

      if (v9 >= v8)
        break;
      ++v9;
    }
    while (!v12);
  }

}

- (MPSectionedCollection)initWithCoder:(id)a3
{
  id v4;
  MPSectionedCollection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *sectionedItems;
  uint64_t v10;
  NSArray *sections;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSectionedCollection;
  v5 = -[MPSectionedCollection init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "allowedClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("sectionedItems"));
    v8 = objc_claimAutoreleasedReturnValue();
    sectionedItems = v5->_sectionedItems;
    v5->_sectionedItems = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("sections"));
    v10 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v10;

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

  v7 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
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
      v11 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
      -[MPSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
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
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", j, i);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", v17);
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

  v7 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
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
      v11 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
      -[MPSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
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
  MPMutableSectionedCollection *v4;
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
  v4 = objc_alloc_init(MPMutableSectionedCollection);
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MPSectionedCollection totalItemCount](self, "totalItemCount"));
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

- (id)firstSection
{
  return -[NSArray firstObject](self->_sections, "firstObject");
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

- (id)changeDetailsToSectionedCollection:(id)a3 isEqualBlock:(id)a4 isUpdatedBlock:(id)a5
{
  return -[MPSectionedCollection changeDetailsToSectionedCollection:applyingUIKitWorkarounds:isEqualBlock:isUpdatedBlock:](self, "changeDetailsToSectionedCollection:applyingUIKitWorkarounds:isEqualBlock:isUpdatedBlock:", a3, 1, a4, a5);
}

- (id)changeDetailsToSectionedCollection:(id)a3 applyingUIKitWorkarounds:(BOOL)a4 isEqualBlock:(id)a5 isUpdatedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPChangeDetails *v13;
  id v14;
  id v15;
  id v16;
  MPChangeDetails *v17;
  MPChangeDetails *v18;
  MPChangeDetails *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = [MPChangeDetails alloc];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke;
  v21[3] = &unk_1E3154250;
  v21[4] = self;
  v14 = v10;
  v22 = v14;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v25 = a4;
  v17 = -[MPChangeDetails initWithBlock:](v13, "initWithBlock:", v21);
  if (-[MPChangeDetails hasChanges](v17, "hasChanges"))
  {
    v18 = v17;
  }
  else
  {
    +[MPChangeDetails empty](MPChangeDetails, "empty");
    v18 = (MPChangeDetails *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  return v19;
}

- (id)lazyMapWithSections:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  _MPLazyTransformSectionedCollectionDataSource *v8;
  MPLazySectionedCollection *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_MPLazyTransformSectionedCollectionDataSource initWithSectionedCollection:sectionTransform:itemTransform:]([_MPLazyTransformSectionedCollectionDataSource alloc], "initWithSectionedCollection:sectionTransform:itemTransform:", self, v7, v6);

  v9 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v8);
  return v9;
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
  uint64_t quot;
  const UInt8 *v11;
  ldiv_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[MPSectionedCollection numberOfSections](self, "numberOfSections"));
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      v6 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
      -[MPSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __41__MPSectionedCollection__stateDumpObject__block_invoke;
      v17[3] = &unk_1E3157050;
      v9 = v8;
      v18 = v9;
      -[MPSectionedCollection enumerateItemsInSectionAtIndex:usingBlock:](self, "enumerateItemsInSectionAtIndex:usingBlock:", i, v17);
      v19[0] = CFSTR("_sectionIdx");
      quot = i;
      v11 = (const UInt8 *)&v21;
      do
      {
        v12 = ldiv(quot, 10);
        quot = v12.quot;
        if (v12.rem >= 0)
          LOBYTE(v13) = v12.rem;
        else
          v13 = -v12.rem;
        *--v11 = v13 + 48;
      }
      while (v12.quot);
      v14 = (__CFString *)CFStringCreateWithBytes(0, v11, (char *)&v21 - (char *)v11, 0x8000100u, 0);
      v20[0] = v14;
      v20[1] = v7;
      v19[1] = CFSTR("section");
      v19[2] = CFSTR("items");
      v20[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addObject:", v15);
    }
  }
  return v4;
}

uint64_t __41__MPSectionedCollection__stateDumpObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  _QWORD *v20;
  void (**v21)(_QWORD, _QWORD);
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  id v48;
  void (**v49)(_QWORD, _QWORD);
  void (**v50)(_QWORD, _QWORD);
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  unint64_t v82;
  char v83[9];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  v8 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  v9 = objc_msgSend(*(id *)(a1 + 40), "numberOfSections");
  v10 = MEMORY[0x1E0C809B0];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2;
  v80[3] = &unk_1E3154188;
  v81 = *(id *)(a1 + 48);
  v11 = MPChangeDetailOperationGenerateEx(v8, v9, &v82, (char *)&v55, v80);
  v74[0] = v10;
  v74[1] = 3221225472;
  v74[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3;
  v74[3] = &unk_1E3154200;
  v12 = v5;
  v75 = v12;
  v78 = *(id *)(a1 + 48);
  v13 = v4;
  v76 = v13;
  v14 = v3;
  v77 = v14;
  v79 = *(id *)(a1 + 56);
  v50 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v74);
  v68[0] = v10;
  v68[1] = 3221225472;
  v68[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5;
  v68[3] = &unk_1E3154200;
  v15 = v7;
  v69 = v15;
  v72 = *(id *)(a1 + 48);
  v16 = v6;
  v70 = v16;
  v73 = *(id *)(a1 + 56);
  v17 = v14;
  v71 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v68);
  v62[0] = v10;
  v62[1] = 3221225472;
  v62[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2_51;
  v62[3] = &unk_1E3154200;
  v46 = v13;
  v63 = v46;
  v66 = *(id *)(a1 + 48);
  v45 = v12;
  v64 = v45;
  v19 = v17;
  v65 = v19;
  v67 = *(id *)(a1 + 56);
  v49 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v62);
  v56[0] = v10;
  v56[1] = 3221225472;
  v56[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4_53;
  v56[3] = &unk_1E3154200;
  v20 = v11;
  v44 = v16;
  v57 = v44;
  v60 = *(id *)(a1 + 48);
  v43 = v15;
  v58 = v43;
  v61 = *(id *)(a1 + 56);
  v48 = v19;
  v59 = v48;
  v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v56);
  v22 = v82;
  if (v82)
  {
    v23 = 0;
    v24 = 0x1E0CB3000uLL;
    v47 = v20;
    while (1)
    {
      v25 = v20[v23];
      v26 = v25 >> 62;
      if (v25 >> 62 == 1)
        break;
      if ((_DWORD)v26 == 3)
      {
        objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", v20[v23] & 0x7FFFFFFFLL);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v50;
LABEL_8:
        ((void (**)(_QWORD, id))v28)[2](v28, v27);
LABEL_31:

        v22 = v82;
        goto LABEL_32;
      }
      if ((_DWORD)v26 == 2)
      {
        objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", (v25 >> 31) & 0x7FFFFFFF);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v49;
        goto LABEL_8;
      }
LABEL_32:
      if (++v23 >= v22)
        goto LABEL_33;
    }
    v29 = (v25 >> 31) & 0x7FFFFFFF;
    objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v25 & 0x7FFFFFFF;
    objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v33 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", v29);
    v34 = objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", v31);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6;
    v51[3] = &unk_1E3154228;
    v54 = *(id *)(a1 + 48);
    v27 = v30;
    v52 = v27;
    v35 = v32;
    v53 = v35;
    v36 = MPChangeDetailOperationGenerateEx(v33, v34, &v55, v83, v51);
    v37 = v55;
    if (!v55)
    {
LABEL_26:
      free(v36);
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
      {
        v20 = v47;
        v24 = 0x1E0CB3000;
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          objc_msgSend(v48, "appendSectionUpdateForPreviousIndex:finalIndex:", objc_msgSend(v27, "section"), objc_msgSend(v35, "section"));
      }
      else
      {
        ((void (**)(_QWORD, id))v49)[2](v49, v27);
        ((void (**)(_QWORD, id))v50)[2](v50, v35);
        v20 = v47;
        v24 = 0x1E0CB3000;
      }

      goto LABEL_31;
    }
    v38 = 0;
    while (1)
    {
      v39 = *((_QWORD *)v36 + v38);
      v40 = v39 >> 62;
      if (v39 >> 62 == 1)
      {
        objc_msgSend(v27, "indexPathByAddingIndex:", (v39 >> 31) & 0x7FFFFFFF);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "indexPathByAddingIndex:", v39 & 0x7FFFFFFF);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        {
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          {
            if ((objc_msgSend(v41, "isEqual:", v42) & 1) != 0)
              objc_msgSend(v48, "appendItemUpdateForPreviousIndexPath:finalIndexPath:", v41, v42);
            else
              objc_msgSend(v48, "appendItemMoveFromIndexPath:toIndexPath:updated:", v41, v42, 1);
          }
        }
        else
        {
          ((void (**)(_QWORD, void *))v21)[2](v21, v41);
          ((void (**)(_QWORD, void *))v18)[2](v18, v42);
        }

        goto LABEL_24;
      }
      if ((_DWORD)v40 == 3)
        break;
      if ((_DWORD)v40 == 2)
      {
        objc_msgSend(v27, "indexPathByAddingIndex:", (v39 >> 31) & 0x7FFFFFFF);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v21)[2](v21, v41);
LABEL_24:

        v37 = v55;
      }
      if (++v38 >= v37)
        goto LABEL_26;
    }
    objc_msgSend(v35, "indexPathByAddingIndex:", *((_QWORD *)v36 + v38) & 0x7FFFFFFFLL);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v41);
    goto LABEL_24;
  }
LABEL_33:
  free(v20);
  objc_msgSend(v48, "setInsertedSections:", v46);
  objc_msgSend(v48, "setDeletedSections:", v45);
  objc_msgSend(v48, "setInsertedItemIndexPaths:", v44);
  objc_msgSend(v48, "setDeletedItemIndexPaths:", v43);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v48, "applyUIKitWorkarounds");

}

uint64_t __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  return v7;
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4;
  v11[3] = &unk_1E31541B0;
  v13 = *(id *)(a1 + 56);
  v5 = v3;
  v12 = v5;
  v14 = &v15;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v11);
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v6 = *(void **)(a1 + 48);
    v7 = v16[3];
    v8 = objc_msgSend(v5, "section");
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v16[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5));

  }
  _Block_object_dispose(&v15, 8);

}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5461;
  v19 = __Block_byref_object_dispose__5462;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_49;
  v10 = &unk_1E31541D8;
  v12 = *(id *)(a1 + 56);
  v5 = v3;
  v11 = v5;
  v13 = &v21;
  v14 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if ((objc_msgSend((id)v16[5], "isEqual:", v5) & 1) != 0)
    {
      if ((_DWORD)v6)
        objc_msgSend(*(id *)(a1 + 48), "appendItemUpdateForPreviousIndexPath:finalIndexPath:", v16[5], v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appendItemMoveFromIndexPath:toIndexPath:updated:", v16[5], v5, v6);
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2_51(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3_52;
  v11[3] = &unk_1E31541B0;
  v13 = *(id *)(a1 + 56);
  v5 = v3;
  v12 = v5;
  v14 = &v15;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v11);
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v6 = *(void **)(a1 + 48);
    v7 = objc_msgSend(v5, "section");
    v8 = v16[3];
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10));

  }
  _Block_object_dispose(&v15, 8);

}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5461;
  v19 = __Block_byref_object_dispose__5462;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5_54;
  v10 = &unk_1E31541D8;
  v12 = *(id *)(a1 + 56);
  v5 = v3;
  v11 = v5;
  v13 = &v21;
  v14 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if ((objc_msgSend(v5, "isEqual:", v16[5]) & 1) != 0)
    {
      if ((_DWORD)v6)
        objc_msgSend(*(id *)(a1 + 48), "appendItemUpdateForPreviousIndexPath:finalIndexPath:", v5, v16[5]);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appendItemMoveFromIndexPath:toIndexPath:updated:", v5, v16[5], v6);
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

uint64_t __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "indexPathByAddingIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "indexPathByAddingIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

  return v8;
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5_54(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }

}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3_52(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v7 = a1[4];
  v6 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_49(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }

}

void __113__MPSectionedCollection_changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  void *v7;

  v6 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, a1[4]);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[MPSectionedCollection itemAtIndexPath:](self, "itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "identifiers");
    else
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  void *v3;
  id v4;
  void *v5;

  -[MPSectionedCollection sectionAtIndex:](self, "sectionAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "identifiers");
    else
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)indexPathForItemWithIdentifiersIntersectingSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = -[MPSectionedCollection numberOfSections](self, "numberOfSections");
  if (v5 < 1)
  {
    v13 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = -[MPSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v7);
      if (v8 < 1)
      {
        v13 = 0;
      }
      else
      {
        v9 = v8;
        v10 = 1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10 - 1, v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSectionedCollection identifiersForItemAtIndexPath:](self, "identifiersForItemAtIndexPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "intersectsSet:", v4))
            v13 = v11;
          else
            v13 = 0;

          if (v10 >= v9)
            break;
          ++v10;
        }
        while (!v13);
      }
      ++v7;
    }
    while (v7 < v6 && !v13);
  }

  return v13;
}

@end

@implementation MSVMutableSectionedCollection

- (void)_initializeAsEmptySectionedCollection
{
  NSArray *v3;
  NSArray *sectionedItems;
  NSArray *v5;
  NSArray *sections;

  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sectionedItems = self->super._sectionedItems;
  self->super._sectionedItems = v3;

  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  sections = self->super._sections;
  self->super._sections = v5;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "msv_immutableClass"));
  if (v4)
  {
    v5 = -[NSArray copy](self->super._sections, "copy");
    v6 = (void *)v4[2];
    v4[2] = v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->super._sectionedItems, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->super._sectionedItems;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copy", (_QWORD)v17);
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    v14 = objc_msgSend(v7, "copy");
    v15 = (void *)v4[1];
    v4[1] = v14;

  }
  return v4;
}

- (void)insertSection:(id)a3 atIndex:(int64_t)a4
{
  NSArray *sections;
  NSArray *v7;
  id v8;
  NSArray *v9;

  sections = self->super._sections;
  v7 = self->super._sectionedItems;
  v9 = sections;
  -[NSArray insertObject:atIndex:](v9, "insertObject:atIndex:", a3, a4);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSArray insertObject:atIndex:](v7, "insertObject:atIndex:", v8, a4);

}

- (void)removeSectionAtIndex:(int64_t)a3
{
  NSArray *sections;
  NSArray *v5;
  NSArray *v6;

  sections = self->super._sections;
  v5 = self->super._sectionedItems;
  v6 = sections;
  -[NSArray removeObjectAtIndex:](v6, "removeObjectAtIndex:", a3);
  -[NSArray removeObjectAtIndex:](v5, "removeObjectAtIndex:", a3);

}

- (void)moveSectionFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  NSArray *sections;
  NSArray *v7;
  NSArray *v8;

  sections = self->super._sections;
  v7 = self->super._sectionedItems;
  v8 = sections;
  -[NSArray exchangeObjectAtIndex:withObjectAtIndex:](v8, "exchangeObjectAtIndex:withObjectAtIndex:", a3, a4);
  -[NSArray exchangeObjectAtIndex:withObjectAtIndex:](v7, "exchangeObjectAtIndex:withObjectAtIndex:", a3, a4);

}

- (void)replaceSectionAtIndex:(int64_t)a3 withObject:(id)a4
{
  -[NSArray replaceObjectAtIndex:withObject:](self->super._sections, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)appendSection:(id)a3
{
  id v4;

  v4 = a3;
  -[MSVMutableSectionedCollection insertSection:atIndex:](self, "insertSection:atIndex:", v4, -[MSVSectionedCollection numberOfSections](self, "numberOfSections"));

}

- (void)insertItem:(id)a3 atIndexPath:(id)a4
{
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = self->super._sectionedItems;
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v7, "msv_section");
  v10 = objc_msgSend(v7, "msv_item");

  -[NSArray objectAtIndex:](v6, "objectAtIndex:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "insertObject:atIndex:", v8, v10);
}

- (void)removeItemAtIndexPath:(id)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = self->super._sectionedItems;
  v5 = a3;
  v6 = objc_msgSend(v5, "msv_section");
  v7 = objc_msgSend(v5, "msv_item");

  -[NSArray objectAtIndex:](v4, "objectAtIndex:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObjectAtIndex:", v7);
}

- (void)replaceObjectAtIndexPath:(id)a3 withObject:(id)a4
{
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = self->super._sectionedItems;
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "msv_section");
  v10 = objc_msgSend(v8, "msv_item");

  -[NSArray objectAtIndex:](v6, "objectAtIndex:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v10, v7);
}

- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;

  v16 = self->super._sectionedItems;
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "msv_section");
  v9 = objc_msgSend(v7, "msv_item");

  v10 = objc_msgSend(v6, "msv_section");
  v11 = objc_msgSend(v6, "msv_item");

  -[NSArray objectAtIndex:](v16, "objectAtIndex:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8 == v10)
  {
    objc_msgSend(v12, "exchangeObjectAtIndex:withObjectAtIndex:", v9, v11);
  }
  else
  {
    -[NSArray objectAtIndex:](v16, "objectAtIndex:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectAtIndex:", v9);
    objc_msgSend(v14, "insertObject:atIndex:", v15, v11);

  }
}

- (void)appendItem:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  id v7;

  v4 = a3;
  v5 = -[MSVSectionedCollection numberOfSections](self, "numberOfSections") - 1;
  v6 = -[MSVSectionedCollection numberOfItemsInSection:](self, "numberOfItemsInSection:", v5);
  objc_msgSend(MEMORY[0x1E0CB36B0], "msv_indexPathForItem:inSection:", v6, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVMutableSectionedCollection insertItem:atIndexPath:](self, "insertItem:atIndexPath:", v4, v7);

}

- (void)appendItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MSVMutableSectionedCollection appendItem:](self, "appendItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeAllObjects
{
  -[NSArray removeAllObjects](self->super._sections, "removeAllObjects");
  -[NSArray removeAllObjects](self->super._sectionedItems, "removeAllObjects");
}

- (void)replaceSectionsUsingBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t, _BYTE *);
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unsigned __int8 v9;

  v4 = (void (**)(id, void *, unint64_t, _BYTE *))a3;
  v9 = 0;
  if (-[NSArray count](self->super._sections, "count"))
  {
    v5 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->super._sections, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, v5, &v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
        -[NSArray replaceObjectAtIndex:withObject:](self->super._sections, "replaceObjectAtIndex:withObject:", v5, v7);
      v8 = v9;

      if (v8)
        break;
      ++v5;
    }
    while (v5 < -[NSArray count](self->super._sections, "count"));
  }

}

- (void)replaceItemsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unsigned __int8 v13;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  if (-[NSArray count](self->super._sections, "count"))
  {
    v5 = 0;
    while (1)
    {
      v13 = 0;
      -[NSArray objectAtIndexedSubscript:](self->super._sectionedItems, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
        break;
LABEL_9:

      if (++v5 >= -[NSArray count](self->super._sections, "count"))
        goto LABEL_12;
    }
    v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "msv_indexPathForItem:inSection:", v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, v9, &v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v10)
      {
        -[NSArray objectAtIndexedSubscript:](self->super._sectionedItems, "objectAtIndexedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v7, v10);

      }
      v12 = v13;

      if (v12)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_9;
    }

  }
LABEL_12:

}

@end

@implementation NSCollectionLayoutGroup

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutGroup *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  objc_super v28;

  v4 = (NSCollectionLayoutGroup *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
    v5 = -[NSCollectionLayoutGroup count](self, "count");
    if (v5 != -[NSCollectionLayoutGroup count](v4, "count"))
      goto LABEL_13;
    v6 = -[NSCollectionLayoutGroup layoutDirection](self, "layoutDirection");
    if (v6 != -[NSCollectionLayoutGroup layoutDirection](v4, "layoutDirection"))
      goto LABEL_13;
    -[NSCollectionLayoutGroup customGroupItemProvider](self, "customGroupItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutGroup customGroupItemProvider](v4, "customGroupItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (v7 == 0) ^ (v8 == 0);

    if ((v9 & 1) != 0)
      goto LABEL_13;
    -[NSCollectionLayoutGroup interItemSpacing](self, "interItemSpacing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutGroup interItemSpacing](v4, "interItemSpacing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = __objectEqual(v10, v11);

    if (!v12)
      goto LABEL_13;
    -[NSCollectionLayoutGroup subitems](self, "subitems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutGroup subitems](v4, "subitems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = __objectEqual(v13, v14);

    if (!v15)
      goto LABEL_13;
    v16 = -[NSCollectionLayoutGroup groupOptions](self, "groupOptions");
    if (v16 != -[NSCollectionLayoutGroup groupOptions](v4, "groupOptions"))
      goto LABEL_13;
    -[NSCollectionLayoutGroup itemsProvider](self, "itemsProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutGroup itemsProvider](v4, "itemsProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (v17 == 0) ^ (v18 == 0);

    if ((v19 & 1) != 0)
      goto LABEL_13;
    -[NSCollectionLayoutGroup visualFormatItemProvider](self, "visualFormatItemProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutGroup visualFormatItemProvider](v4, "visualFormatItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (v20 == 0) ^ (v21 == 0);

    if ((v22 & 1) != 0)
      goto LABEL_13;
    -[NSCollectionLayoutGroup visualFormats](self, "visualFormats");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutGroup visualFormats](v4, "visualFormats");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = __objectEqual(v23, v24);

    if (v25)
    {
      v28.receiver = self;
      v28.super_class = (Class)NSCollectionLayoutGroup;
      v26 = -[NSCollectionLayoutItem isEqual:](&v28, sel_isEqual_, v4);
    }
    else
    {
LABEL_13:
      v26 = 0;
    }
  }

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int64_t v32;
  void *v33;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutItem size](self, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutGroup subitems](self, "subitems");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[NSCollectionLayoutGroup count](self, "count");
  -[NSCollectionLayoutGroup interItemSpacing](self, "interItemSpacing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[NSCollectionLayoutItem edgeSpacing](self, "edgeSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NSCollectionLayoutGroup layoutDirection](self, "layoutDirection");
  -[NSCollectionLayoutItem supplementaryItems](self, "supplementaryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutGroup customGroupItemProvider](self, "customGroupItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem name](self, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (_QWORD *)objc_msgSend(v4, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v5, v33, v32, v6, v15, v16, v8, v10, v12, v14, v17, v18, v19, v20);

  v21[21] = -[NSCollectionLayoutGroup groupOptions](self, "groupOptions");
  -[NSCollectionLayoutGroup visualFormats](self, "visualFormats");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  v24 = (void *)v21[18];
  v21[18] = v23;

  -[NSCollectionLayoutGroup itemsProvider](self, "itemsProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");
  v27 = (void *)v21[19];
  v21[19] = v26;

  -[NSCollectionLayoutGroup visualFormatItemProvider](self, "visualFormatItemProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "copy");
  v30 = (void *)v21[20];
  v21[20] = v29;

  return v21;
}

- (NSCollectionLayoutSpacing)interItemSpacing
{
  return self->_interItemSpacing;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (NSArray)visualFormats
{
  return self->_visualFormats;
}

- (id)visualFormatItemProvider
{
  return self->_visualFormatItemProvider;
}

- (id)itemsProvider
{
  return self->_itemsProvider;
}

- (int64_t)groupOptions
{
  return self->_groupOptions;
}

- (NSCollectionLayoutGroup)initWithSize:(id)a3 subitems:(id)a4 count:(int64_t)a5 interItemSpacing:(id)a6 contentInsets:(CVCDirectionalEdgeInsets)a7 edgeSpacing:(id)a8 layoutDirection:(int64_t)a9 supplementaryItems:(id)a10 customGroupItemProvider:(id)a11 name:(id)a12 identifier:(id)a13
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSCollectionLayoutGroup *v30;
  uint64_t v31;
  NSArray *subitems;
  uint64_t v33;
  NSCollectionLayoutSpacing *interItemSpacing;
  uint64_t v35;
  id customGroupItemProvider;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v44;

  trailing = a7.trailing;
  bottom = a7.bottom;
  leading = a7.leading;
  top = a7.top;
  v22 = a3;
  v23 = a4;
  v24 = a6;
  v25 = a8;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v29 = a13;
  if (v22)
  {
    if (v27)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 483, CFSTR("A size is required."));

    if (v27)
      goto LABEL_8;
  }
  if (!objc_msgSend(v23, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 486, CFSTR("At least 1 subitem is required for a group"));

  }
  if (a5 >= 1 && objc_msgSend(v23, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 489, CFSTR("A single item is required for a repeating item group, %@ were supplied"), v38);

  }
LABEL_8:
  v44.receiver = self;
  v44.super_class = (Class)NSCollectionLayoutGroup;
  v30 = -[NSCollectionLayoutItem initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:](&v44, sel_initWithSize_contentInsets_edgeSpacing_supplementaryItems_decorationItems_name_identifier_, v22, v25, v26, MEMORY[0x1E0C9AA60], v28, v29, top, leading, bottom, trailing);
  if (v30)
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v23, 1);
    subitems = v30->_subitems;
    v30->_subitems = (NSArray *)v31;

    v30->_count = a5;
    v33 = objc_msgSend(v24, "copy");
    interItemSpacing = v30->_interItemSpacing;
    v30->_interItemSpacing = (NSCollectionLayoutSpacing *)v33;

    v30->_layoutDirection = a9;
    v35 = objc_msgSend(v27, "copy");
    customGroupItemProvider = v30->_customGroupItemProvider;
    v30->_customGroupItemProvider = (id)v35;

  }
  return v30;
}

- (BOOL)isCustomGroup
{
  void *v2;
  BOOL v3;

  -[NSCollectionLayoutGroup customGroupItemProvider](self, "customGroupItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)customGroupItemProvider
{
  return self->_customGroupItemProvider;
}

void __66__NSCollectionLayoutGroup__hasDecorationItemRequiringRegistration__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a2, "decorationItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "_registrationViewClass"))
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 97) = 1;
          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_externalDescription
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unint64_t layoutDirection;
  const __CFString *v13;
  void *v14;
  void *v15;
  NSCollectionLayoutGroup *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)NSCollectionLayoutGroup;
  -[NSCollectionLayoutItem _externalDescription](&v23, sel__externalDescription);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = self;
  v4 = self->_subitems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "_externalDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n\t"), CFSTR("\n\t\t"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t %@"), v10);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  if (v17->_customGroupItemProvider)
  {
    v11 = (void *)MEMORY[0x1DF0DB6D0]();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t customGroupItemProvider: %@"), v11);

  }
  layoutDirection = v17->_layoutDirection;
  if (layoutDirection > 2)
    v13 = &stru_1EA7CEF88;
  else
    v13 = off_1EA7CE4C0[layoutDirection];
  -[NSCollectionLayoutSpacing _externalDescription](v17->_interItemSpacing, "_externalDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("\n\t layoutDirection: %@\n\t interItemSpacing=%@\n\t subitems=%@"), v13, v14, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setInterItemSpacing:(NSCollectionLayoutSpacing *)interItemSpacing
{
  objc_setProperty_nonatomic_copy(self, a2, interItemSpacing, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visualFormatItemProvider, 0);
  objc_storeStrong(&self->_itemsProvider, 0);
  objc_storeStrong((id *)&self->_visualFormats, 0);
  objc_storeStrong(&self->_customGroupItemProvider, 0);
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_interItemSpacing, 0);
}

- (BOOL)_isListSolverCompatibleForLayoutAxis:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  char v20;

  if (a3 - 1 <= 1)
  {
    -[NSCollectionLayoutGroup subitems](self, "subitems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1 && !-[NSCollectionLayoutGroup isCustomGroup](self, "isCustomGroup"))
    {
      if (a3 == 1)
        v9 = 2;
      else
        v9 = a3 == 2;
      -[NSCollectionLayoutGroup subitems](self, "subitems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "isGroup");
      objc_msgSend(v11, "size");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_isEstimatedForAxis:", v9);

      objc_msgSend(v11, "size");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (a3 == 2)
        objc_msgSend(v15, "widthDimension");
      else
        objc_msgSend(v15, "heightDimension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "dimension");
      if (v18 > 0.5 && (objc_msgSend(v17, "dimension"), v19 <= 1.0))
      {
        v20 = 1;
        if ((v12 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        v20 = 0;
        if ((v12 & 1) != 0)
        {
LABEL_15:
          v7 = 0;
LABEL_18:

          return v7;
        }
      }
      v7 = v20 & (v14 ^ 1);
      goto LABEL_18;
    }
  }
  return 0;
}

- (BOOL)isHorizontalGroup
{
  return !-[NSCollectionLayoutGroup isCustomGroup](self, "isCustomGroup")
      && -[NSCollectionLayoutGroup layoutDirection](self, "layoutDirection") == 2;
}

- (BOOL)isVerticalGroup
{
  return !-[NSCollectionLayoutGroup isCustomGroup](self, "isCustomGroup")
      && -[NSCollectionLayoutGroup layoutDirection](self, "layoutDirection") == 1;
}

+ (NSCollectionLayoutGroup)customGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize itemProvider:(NSCollectionLayoutGroupCustomItemProvider)itemProvider
{
  NSCollectionLayoutGroupCustomItemProvider v6;
  NSCollectionLayoutSize *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = itemProvider;
  v7 = layoutSize;
  v8 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v7, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], v6, 0, v11);

  return (NSCollectionLayoutGroup *)v12;
}

+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize repeatingSubitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  NSCollectionLayoutSize *v9;
  NSCollectionLayoutItem *v10;
  NSCollectionLayoutItem *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = layoutSize;
  v10 = subitem;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSize != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subitem != nil"));

LABEL_3:
  if (count <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 533, CFSTR("A repeating horizontal group should specify a count >= 1"));

  }
  v12 = objc_alloc((Class)a1);
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v13, count, v14, v15, 2, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  NSCollectionLayoutSize *v9;
  NSCollectionLayoutItem *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = layoutSize;
  v10 = subitem;
  if (count <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 707, CFSTR("A repeating horizontal group should specify a count >= 1"));

  }
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_effectiveCopiedSubitemsForSubitems:count:layoutDirection:", v11, count, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v12, count, v14, v15, 2, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  NSCollectionLayoutSize *v9;
  NSCollectionLayoutItem *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = layoutSize;
  v10 = subitem;
  if (count <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 725, CFSTR("A repeating vertical group should specify a count >= 1"));

  }
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_effectiveCopiedSubitemsForSubitems:count:layoutDirection:", v11, count, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v12, count, v14, v15, 1, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

+ (id)_effectiveCopiedSubitemsForSubitems:(id)a3 count:(int64_t)a4 layoutDirection:(int64_t)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99D20];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithArray:copyItems:", v9, 1);

  if (objc_msgSend(v10, "count") == 1 && a4 > 0)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_effectiveSizeForSize:count:layoutDirection:", v12, a4, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSize:", v13);
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v10;
  }

  return v14;
}

+ (id)_effectiveSizeForSize:(id)a3 count:(int64_t)a4 layoutDirection:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  v7 = a3;
  v8 = v7;
  if (a4 && a5)
  {
    v9 = 1.0 / (double)a4;
    objc_msgSend(v7, "widthDimension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightDimension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 == 1)
    {
      +[NSCollectionLayoutDimension fractionalHeightDimension:](NSCollectionLayoutDimension, "fractionalHeightDimension:", v9);
      v15 = objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v11 = (void *)v15;
    }
    else
    {
      if (a5 != 2)
      {
LABEL_9:
        +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v10, v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      +[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v10;
      v10 = (void *)v12;
    }

    goto LABEL_9;
  }
  v14 = v7;
LABEL_10:

  return v14;
}

+ (NSCollectionLayoutGroup)horizontalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitems:(NSArray *)subitems
{
  NSArray *v6;
  NSCollectionLayoutSize *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = subitems;
  v7 = layoutSize;
  v8 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v7, v6, 0, v9, v10, 2, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, 0, v11);

  return (NSCollectionLayoutGroup *)v12;
}

+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize subitems:(NSArray *)subitems
{
  NSArray *v6;
  NSCollectionLayoutSize *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = subitems;
  v7 = layoutSize;
  v8 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v7, v6, 0, v9, v10, 1, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, 0, v11);

  return (NSCollectionLayoutGroup *)v12;
}

- (BOOL)_hasDecorationItemRequiringRegistration
{
  _QWORD v4[5];

  if (!self->_hasCheckedIfDecorationItemRequiresRegistration)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__NSCollectionLayoutGroup__hasDecorationItemRequiringRegistration__block_invoke;
    v4[3] = &unk_1EA7CE348;
    v4[4] = self;
    -[NSCollectionLayoutItem _enumerateItemsWithHandler:](self, "_enumerateItemsWithHandler:", v4);
    self->_hasCheckedIfDecorationItemRequiresRegistration = 1;
  }
  return self->__hasDecorationItemRequiringRegistration;
}

- (id)description
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t layoutDirection;
  const __CFString *v12;
  void *v13;
  NSCollectionLayoutGroup *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NSCollectionLayoutGroup;
  -[NSCollectionLayoutItem description](&v21, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = self;
  v4 = self->_subitems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n\t"), CFSTR("\n\t\t"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t %@"), v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v6);
  }

  layoutDirection = v15->_layoutDirection;
  if (layoutDirection > 2)
    v12 = &stru_1EA7CEF88;
  else
    v12 = off_1EA7CE4C0[layoutDirection];
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n\t group: subitems=%@\n\t interItemSpacing=%@;\n\t layoutDirection=%@>"),
    v3,
    v15->_interItemSpacing,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (NSCollectionLayoutGroup)verticalGroupWithLayoutSize:(NSCollectionLayoutSize *)layoutSize repeatingSubitem:(NSCollectionLayoutItem *)subitem count:(NSInteger)count
{
  NSCollectionLayoutSize *v9;
  NSCollectionLayoutItem *v10;
  NSCollectionLayoutItem *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = layoutSize;
  v10 = subitem;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutSize != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subitem != nil"));

LABEL_3:
  if (count <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 565, CFSTR("A repeating vertical group should specify a count >= 1"));

  }
  v12 = objc_alloc((Class)a1);
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v9, v13, count, v14, v15, 1, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, 0, v16);

  return (NSCollectionLayoutGroup *)v17;
}

- (unint64_t)layoutAxis
{
  if (-[NSCollectionLayoutGroup isVerticalGroup](self, "isVerticalGroup"))
    return 2;
  else
    return -[NSCollectionLayoutGroup isHorizontalGroup](self, "isHorizontalGroup");
}

- (NSCollectionLayoutGroup)initWithSize:(id)a3 subitems:(id)a4 count:(int64_t)a5 interItemSpacing:(id)a6 contentInsets:(CVCDirectionalEdgeInsets)a7 edgeSpacing:(id)a8 layoutDirection:(int64_t)a9 supplementaryItems:(id)a10 visualFormats:(id)a11 itemsProvider:(id)a12 visualFormatItemProvider:(id)a13 customGroupItemProvider:(id)a14 options:(int64_t)a15 name:(id)a16 identifier:(id)a17
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  id v30;
  id v31;
  void *v32;
  NSCollectionLayoutGroup *v33;
  NSCollectionLayoutGroup *v34;
  uint64_t v35;
  NSArray *visualFormats;
  uint64_t v37;
  id itemsProvider;
  uint64_t v39;
  id visualFormatItemProvider;
  void *v42;
  void *v43;
  void *v44;
  id v49;
  id v50;
  id v51;

  trailing = a7.trailing;
  bottom = a7.bottom;
  leading = a7.leading;
  top = a7.top;
  v51 = a3;
  v24 = a4;
  v50 = a6;
  v49 = a8;
  v25 = a10;
  v26 = a11;
  v27 = (unint64_t)a12;
  v28 = a13;
  v29 = (unint64_t)a14;
  v30 = a16;
  v31 = a17;
  if (!(v27 | v29))
  {
    objc_msgSend(v26, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      if (!objc_msgSend(v24, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 761, CFSTR("At least 1 subitem is required for a group"));

      }
      if (a5 >= 1 && objc_msgSend(v24, "count") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 764, CFSTR("A single item is required for a repeating item group, %@ were supplied"), v43);

      }
    }
  }
  v33 = -[NSCollectionLayoutGroup initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:](self, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:customGroupItemProvider:name:identifier:", v51, v24, a5, v50, v49, a9, top, leading, bottom, trailing, v25, v29, v30, v31);
  v34 = v33;
  if (v33)
  {
    v33->_groupOptions = a15;
    v35 = objc_msgSend(v26, "copy");
    visualFormats = v34->_visualFormats;
    v34->_visualFormats = (NSArray *)v35;

    v37 = objc_msgSend((id)v27, "copy");
    itemsProvider = v34->_itemsProvider;
    v34->_itemsProvider = (id)v37;

    v39 = objc_msgSend(v28, "copy");
    visualFormatItemProvider = v34->_visualFormatItemProvider;
    v34->_visualFormatItemProvider = (id)v39;

  }
  return v34;
}

+ (id)horizontalGroupWithSize:(id)a3 subitemsProvider:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 780, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subitemsProvider"));

  }
  v9 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:visualFormats:itemsProvider:visualFormatItemProvider:customGroupItemProvider:options:name:identifier:", v7, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, v8, 0, 0, 0, 0, v12);

  return v13;
}

+ (id)verticalGroupWithSize:(id)a3 subitemsProvider:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subitemsProvider"));

  }
  v9 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:visualFormats:itemsProvider:visualFormatItemProvider:customGroupItemProvider:options:name:identifier:", v7, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], 0, v8, 0, 0, 0, 0, v12);

  return v13;
}

+ (NSCollectionLayoutGroup)layoutGroupWithSize:(id)a3 visualFormats:(id)a4 itemProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 821, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visualFormats.count"));

  }
  objc_msgSend(v9, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "containsString:", CFSTR("H:")) & 1) == 0
    && (objc_msgSend(v13, "containsString:", CFSTR("V:")) & 1) == 0)
  {

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSCollectionLayoutItem.m"), 833, CFSTR("Unknown layout axis: %@ for formats %@"), v21, v9);

  }
  v14 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSpacing defaultSpacing](NSCollectionLayoutSpacing, "defaultSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithSize:subitems:count:interItemSpacing:contentInsets:edgeSpacing:layoutDirection:supplementaryItems:visualFormats:itemsProvider:visualFormatItemProvider:customGroupItemProvider:options:name:identifier:", v11, 0.0, 0.0, 0.0, 0.0, MEMORY[0x1E0C9AA60], v9, 0, v10, 0, 0, 0, v17);

  return (NSCollectionLayoutGroup *)v18;
}

- (BOOL)hasItemProvider
{
  void *v2;
  BOOL v3;

  -[NSCollectionLayoutGroup itemsProvider](self, "itemsProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasVisualFormat
{
  void *v2;
  BOOL v3;

  -[NSCollectionLayoutGroup visualFormats](self, "visualFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setSubitems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setCustomGroupItemProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void)set_hasDecorationItemRequiringRegistration:(BOOL)a3
{
  self->__hasDecorationItemRequiringRegistration = a3;
}

@end

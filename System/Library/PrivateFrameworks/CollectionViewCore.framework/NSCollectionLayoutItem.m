@implementation NSCollectionLayoutItem

- (NSCollectionLayoutSize)layoutSize
{
  return self->_size;
}

- (void)_enumerateItemsWithHandler:(id)a3
{
  void (**v4)(id, NSCollectionLayoutItem *, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, NSCollectionLayoutItem *, _BYTE *);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, NSCollectionLayoutItem *, _BYTE *))a3;
  v18 = 0;
  v4[2](v4, self, &v18);
  if (!v18 && -[NSCollectionLayoutItem isGroup](self, "isGroup"))
  {
    -[NSCollectionLayoutItem subitems](self, "subitems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12[0] = v9;
          v12[1] = 3221225472;
          v12[2] = __53__NSCollectionLayoutItem__enumerateItemsWithHandler___block_invoke;
          v12[3] = &unk_1EA7CE3C0;
          v13 = v4;
          objc_msgSend(v11, "_enumerateItemsWithHandler:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)isGroup
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutItem size](self, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[NSCollectionLayoutItem edgeSpacing](self, "edgeSpacing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem supplementaryItems](self, "supplementaryItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem decorationItems](self, "decorationItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem name](self, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v4, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v5, v14, v15, v16, v17, v18, v7, v9, v11, v13);

  return v19;
}

- (NSString)name
{
  return self->_name;
}

uint64_t __53__NSCollectionLayoutItem__enumerateItemsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutItem *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;

  v4 = (NSCollectionLayoutItem *)a3;
  if (self == v4)
  {
    v16 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NSCollectionLayoutItem contentInsets](v4, "contentInsets");
  v16 = 0;
  if (v8 == v17 && v6 == v13 && v12 == v15 && v10 == v14)
  {
    -[NSCollectionLayoutItem edgeSpacing](self, "edgeSpacing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutItem edgeSpacing](v4, "edgeSpacing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = __objectEqual(v18, v19);

    if (v20)
    {
      -[NSCollectionLayoutItem supplementaryItems](self, "supplementaryItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutItem supplementaryItems](v4, "supplementaryItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = __objectEqual(v21, v22);

      if (v23)
      {
        -[NSCollectionLayoutItem decorationItems](self, "decorationItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCollectionLayoutItem decorationItems](v4, "decorationItems");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = __objectEqual(v24, v25);

        if (v26)
        {
          -[NSCollectionLayoutItem size](self, "size");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCollectionLayoutItem size](v4, "size");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = __objectEqual(v27, v28);

          goto LABEL_13;
        }
      }
    }
LABEL_11:
    v16 = 0;
  }
LABEL_13:

  return v16;
}

- (NSCollectionLayoutEdgeSpacing)edgeSpacing
{
  return self->_edgeSpacing;
}

- (NSArray)supplementaryItems
{
  return self->_supplementaryItems;
}

- (NSArray)decorationItems
{
  return self->_decorationItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationItems, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_supplementaryItems, 0);
  objc_storeStrong((id *)&self->_edgeSpacing, 0);
}

- (NSCollectionLayoutItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 edgeSpacing:(id)a5 supplementaryItems:(id)a6 decorationItems:(id)a7 name:(id)a8 identifier:(id)a9
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSCollectionLayoutItem *v25;
  uint64_t v26;
  NSCollectionLayoutSize *size;
  uint64_t v28;
  NSCollectionLayoutEdgeSpacing *edgeSpacing;
  uint64_t v30;
  NSArray *supplementaryItems;
  uint64_t v32;
  NSArray *decorationItems;
  uint64_t v34;
  NSString *name;
  objc_super v37;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v19 = a3;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v37.receiver = self;
  v37.super_class = (Class)NSCollectionLayoutItem;
  v25 = -[NSCollectionLayoutItem init](&v37, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v19, "copy");
    size = v25->_size;
    v25->_size = (NSCollectionLayoutSize *)v26;

    v28 = objc_msgSend(v20, "copy");
    edgeSpacing = v25->_edgeSpacing;
    v25->_edgeSpacing = (NSCollectionLayoutEdgeSpacing *)v28;

    v30 = objc_msgSend(v21, "copy");
    supplementaryItems = v25->_supplementaryItems;
    v25->_supplementaryItems = (NSArray *)v30;

    v32 = objc_msgSend(v22, "copy");
    decorationItems = v25->_decorationItems;
    v25->_decorationItems = (NSArray *)v32;

    v34 = objc_msgSend(v23, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v34;

    objc_storeStrong((id *)&v25->_identifier, a9);
    -[NSCollectionLayoutItem setContentInsets:](v25, "setContentInsets:", top, leading, bottom, trailing);
  }

  return v25;
}

- (CVCDirectionalEdgeInsets)_effectiveContentInsets
{
  void *v3;
  char v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CVCDirectionalEdgeInsets result;

  -[NSCollectionLayoutItem size](self, "size");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isEstimatedForAxis:", 2);
  v5 = objc_msgSend(v3, "_isEstimatedForAxis:", 1);
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  if ((v4 & 1) == 0)
  {
    _CVCDirectionalInsetsForInsetsAlongAxis(2);
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
  }
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  if ((v5 & 1) == 0)
  {
    _CVCDirectionalInsetsForInsetsAlongAxis(1);
    v6 = v18;
  }
  v19 = v7 + v6;
  v20 = v8 + v15;
  v21 = v9 + v16;
  v22 = v10 + v17;

  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  result.trailing = v26;
  result.bottom = v25;
  result.leading = v24;
  result.top = v23;
  return result;
}

- (NSCollectionLayoutSize)size
{
  return self->_size;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets
{
  uint64_t (**v4)(_QWORD, _QWORD);
  char v5;
  int v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  NSDirectionalEdgeInsets v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_contentInsets = (CVCDirectionalEdgeInsets)contentInsets;
  if (contentInsets.leading != 0.0
    || contentInsets.top != 0.0
    || contentInsets.trailing != 0.0
    || contentInsets.bottom != 0.0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__NSCollectionLayoutItem_setContentInsets___block_invoke;
    v9[3] = &unk_1EA7CE320;
    v9[4] = self;
    v10 = contentInsets;
    v4 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1DF0DB6D0](v9, a2);
    v5 = v4[2](v4, 2);
    v6 = v4[2](v4, 1);
    if ((v5 & 1) != 0 || v6)
    {
      _compLayoutLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[NSCollectionLayoutItem _externalDescription](self, "_externalDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_error_impl(&dword_1DD770000, v7, OS_LOG_TYPE_ERROR, "Attempting to add contentInsets to an item's dimension along an estimated axis. Insets along any estimated axes will be ignored. Use the item's edgeSpacing or the containing group's interItemSpacing instead. Item: %@", buf, 0xCu);

      }
    }

  }
}

void __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEstimated");

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) |= 2u;
    *a3 = 1;
  }
}

- (BOOL)containsEstimatedSizeItem
{
  unsigned int itemFlags;
  uint64_t v4;
  $B58A67D313DA4EDD16236AB18C2D9045 v5;
  _QWORD v8[5];
  _QWORD v9[5];

  itemFlags = self->_itemFlags;
  if ((itemFlags & 1) == 0)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke;
    v9[3] = &unk_1EA7CE348;
    v9[4] = self;
    -[NSCollectionLayoutItem _enumerateItemsWithHandler:](self, "_enumerateItemsWithHandler:", v9);
    v5 = self->_itemFlags;
    if ((*(_BYTE *)&v5 & 2) == 0)
    {
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke_2;
      v8[3] = &unk_1EA7CE370;
      v8[4] = self;
      -[NSCollectionLayoutItem _enumerateSupplementaryItemsWithHandler:](self, "_enumerateSupplementaryItemsWithHandler:", v8);
      v5 = self->_itemFlags;
    }
    itemFlags = *(_DWORD *)&v5 | 1;
    *(_BYTE *)&self->_itemFlags = itemFlags;
  }
  return (itemFlags >> 1) & 1;
}

BOOL __43__NSCollectionLayoutItem_setContentInsets___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "size");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isEstimatedForAxis:", a2);

  return v5
      && fabs(_CVCTotalEdgeDimensionsForLayoutAxis(a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64))) >= 2.22044605e-16;
}

- (id)_externalDescription
{
  void *v3;
  double top;
  double leading;
  double bottom;
  __CFString *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSCollectionLayoutItem *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p size=%@>"), objc_opt_class(), self, self->_size);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  if (leading != 0.0 || top != 0.0 || self->_contentInsets.trailing != 0.0 || bottom != 0.0)
  {
    v7 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g, %.*g, %.*g}"), 17, *(_QWORD *)&top, 17, *(_QWORD *)&leading, 17, *(_QWORD *)&bottom, 17, *(_QWORD *)&self->_contentInsets.trailing);
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tcontentInsets=%@"), v7);

  }
  if (-[NSCollectionLayoutEdgeSpacing _hasSpacing](self->_edgeSpacing, "_hasSpacing"))
  {
    -[NSCollectionLayoutEdgeSpacing _externalDescription](self->_edgeSpacing, "_externalDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tedgeSpacing=%@"), v8);

  }
  v27 = v3;
  if (-[NSArray count](self->_supplementaryItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\tsupplementaryItems="));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = self;
    v10 = self->_supplementaryItems;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "_externalDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR("\n\t\t%@"), v16);

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v12);
    }

    v3 = v27;
    objc_msgSend(v27, "appendString:", v9);

    self = v26;
  }
  if (-[NSArray count](self->_decorationItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n\tdecorationItems="));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = self->_decorationItems;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "_externalDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendFormat:", CFSTR("\n\t\t%@"), v24);

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v20);
    }

    v3 = v27;
    objc_msgSend(v27, "appendString:", v17);

  }
  return v3;
}

- (BOOL)hasCustomGroupItemProvider
{
  void *v3;
  BOOL v4;

  if (!-[NSCollectionLayoutItem isGroup](self, "isGroup"))
    return 0;
  -[NSCollectionLayoutItem customGroupItemProvider](self, "customGroupItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (NSCollectionLayoutItem)itemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize supplementaryItems:(NSArray *)supplementaryItems
{
  NSArray *v6;
  NSCollectionLayoutSize *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = supplementaryItems;
  v7 = layoutSize;
  v8 = objc_alloc((Class)a1);
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v7, v9, v6, MEMORY[0x1E0C9AA60], 0, v10, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutItem *)v11;
}

- (void)setSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (NSCollectionLayoutItem)itemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize
{
  NSCollectionLayoutSize *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = layoutSize;
  v5 = objc_alloc((Class)a1);
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v4, v6, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, v7, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutItem *)v8;
}

+ (NSCollectionLayoutItem)itemWithSize:(id)a3 decorationItems:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:", v7, v9, MEMORY[0x1E0C9AA60], v6, 0, v10, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutItem *)v11;
}

- (void)_enumerateSupplementaryItemsWithHandler:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, char *);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v26 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSCollectionLayoutItem supplementaryItems](self, "supplementaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9), &v26);
      if (v26)
        goto LABEL_17;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  if (-[NSCollectionLayoutItem isGroup](self, "isGroup"))
  {
    -[NSCollectionLayoutItem subitems](self, "subitems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v5);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v16[0] = v13;
          v16[1] = 3221225472;
          v16[2] = __66__NSCollectionLayoutItem__enumerateSupplementaryItemsWithHandler___block_invoke;
          v16[3] = &unk_1EA7CE398;
          v17 = v4;
          objc_msgSend(v15, "_enumerateSupplementaryItemsWithHandler:", v16);

        }
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      }
      while (v11);
    }
LABEL_17:

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p; name=%@; size=%@;\n\t edgeSpacing=%@;\n\t identfier=%@;\n\t contentInsets={%g,%g,%g,%g}>"),
               objc_opt_class(),
               self,
               self->_name,
               self->_size,
               self->_edgeSpacing,
               self->_identifier,
               *(_QWORD *)&self->_contentInsets.top,
               *(_QWORD *)&self->_contentInsets.leading,
               *(_QWORD *)&self->_contentInsets.bottom,
               *(_QWORD *)&self->_contentInsets.trailing);
}

void __51__NSCollectionLayoutItem_containsEstimatedSizeItem__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEstimated");

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) |= 2u;
    *a3 = 1;
  }
}

- (BOOL)containsItemWithAxesUniformAcrossSiblings
{
  unsigned int itemFlags;
  _QWORD v6[5];

  itemFlags = self->_itemFlags;
  if ((itemFlags & 4) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__NSCollectionLayoutItem_containsItemWithAxesUniformAcrossSiblings__block_invoke;
    v6[3] = &unk_1EA7CE348;
    v6[4] = self;
    -[NSCollectionLayoutItem _enumerateItemsWithHandler:](self, "_enumerateItemsWithHandler:", v6);
    itemFlags = *(_BYTE *)&self->_itemFlags | 4;
    *(_BYTE *)&self->_itemFlags |= 4u;
  }
  return (itemFlags >> 3) & 1;
}

void __67__NSCollectionLayoutItem_containsItemWithAxesUniformAcrossSiblings__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_axesUniformAcrossSiblings");

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) |= 8u;
    *a3 = 1;
  }
}

uint64_t __66__NSCollectionLayoutItem__enumerateSupplementaryItemsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)_insetSizeForContainer:(id)a3 displayScale:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v6 = a3;
  -[NSCollectionLayoutItem size](self, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_effectiveSizeForContainer:displayScale:ignoringInsets:", v6, 0, a4);
  v9 = v8;
  v11 = v10;

  -[NSCollectionLayoutItem _effectiveContentInsets](self, "_effectiveContentInsets");
  if (v13 >= 0.5)
    v16 = 1.0;
  else
    v16 = v9;
  v17 = v13 * v16;
  if (v15 >= 0.5)
    v18 = 1.0;
  else
    v18 = v9;
  v19 = v15 * v18;
  if (v12 >= 0.5)
    v20 = 1.0;
  else
    v20 = v11;
  v21 = v12 * v20;
  if (v14 >= 0.5)
    v22 = 1.0;
  else
    v22 = v11;
  v23 = v14 * v22;
  v24 = v9 - (v17 + v19);
  v25 = v11 - (v21 + v23);
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)isCustomGroup
{
  _BOOL4 v3;

  v3 = -[NSCollectionLayoutItem isGroup](self, "isGroup");
  if (v3)
    LOBYTE(v3) = -[NSCollectionLayoutItem hasCustomGroupItemProvider](self, "hasCustomGroupItemProvider");
  return v3;
}

- (BOOL)isAuxillary
{
  return -[NSCollectionLayoutItem isDecoration](self, "isDecoration")
      || -[NSCollectionLayoutItem isSupplementary](self, "isSupplementary");
}

- (BOOL)isSupplementary
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isDecoration
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isBackgroundDecoration
{
  return 0;
}

- (id)auxillaryItems
{
  NSArray *supplementaryItems;
  NSArray *decorationItems;
  NSArray *v4;
  void *v5;

  supplementaryItems = self->_supplementaryItems;
  if (!supplementaryItems)
    supplementaryItems = (NSArray *)MEMORY[0x1E0C9AA60];
  if (self->_decorationItems)
    decorationItems = self->_decorationItems;
  else
    decorationItems = (NSArray *)MEMORY[0x1E0C9AA60];
  v4 = supplementaryItems;
  -[NSArray arrayByAddingObjectsFromArray:](v4, "arrayByAddingObjectsFromArray:", decorationItems);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)ignoresRTL
{
  _BOOL4 v3;

  v3 = -[NSCollectionLayoutItem isGroup](self, "isGroup");
  if (v3)
    LOBYTE(v3) = -[NSCollectionLayoutItem groupOptions](self, "groupOptions") & 1;
  return v3;
}

- (void)setEdgeSpacing:(NSCollectionLayoutEdgeSpacing *)edgeSpacing
{
  objc_setProperty_nonatomic_copy(self, a2, edgeSpacing, 16);
}

- (void)setSupplementaryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDecorationItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end

@implementation NSCollectionLayoutSupplementaryItem

- (NSCollectionLayoutDecorationItem)decorationItem
{
  return 0;
}

- (CVCDirectionalEdgeInsets)_effectiveContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CVCDirectionalEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)NSCollectionLayoutSupplementaryItem;
  -[NSCollectionLayoutItem _effectiveContentInsets](&v6, sel__effectiveContentInsets);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setZIndex:(NSInteger)zIndex
{
  self->_zIndex = zIndex;
}

+ (NSCollectionLayoutSupplementaryItem)supplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind containerAnchor:(NSCollectionLayoutAnchor *)containerAnchor
{
  NSCollectionLayoutAnchor *v8;
  NSString *v9;
  NSCollectionLayoutSize *v10;
  void *v11;

  v8 = containerAnchor;
  v9 = elementKind;
  v10 = layoutSize;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:", v10, v9, v8, 0, 1, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutSupplementaryItem *)v11;
}

- (void)setItemAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_itemAnchor, a3);
}

- (void)setContainerAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_containerAnchor, a3);
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutSupplementaryItem *v4;
  NSInteger v5;
  void *v6;
  void *v7;
  int v8;
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
  BOOL v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  objc_super v29;

  v4 = (NSCollectionLayoutSupplementaryItem *)a3;
  if (self == v4)
  {
    v20 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v5 = -[NSCollectionLayoutSupplementaryItem zIndex](self, "zIndex");
  if (v5 != -[NSCollectionLayoutSupplementaryItem zIndex](v4, "zIndex"))
    goto LABEL_12;
  -[NSCollectionLayoutSupplementaryItem elementKind](self, "elementKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSupplementaryItem elementKind](v4, "elementKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8)
    goto LABEL_12;
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[NSCollectionLayoutItem contentInsets](v4, "contentInsets");
  v20 = 0;
  if (v12 == v21 && v10 == v17 && v16 == v19 && v14 == v18)
  {
    -[NSCollectionLayoutSupplementaryItem containerAnchor](self, "containerAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCollectionLayoutSupplementaryItem containerAnchor](v4, "containerAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = __objectEqual(v22, v23);

    if (v24)
    {
      -[NSCollectionLayoutSupplementaryItem itemAnchor](self, "itemAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSupplementaryItem itemAnchor](v4, "itemAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = __objectEqual(v25, v26);

      if (v27)
      {
        v29.receiver = self;
        v29.super_class = (Class)NSCollectionLayoutSupplementaryItem;
        v20 = -[NSCollectionLayoutItem isEqual:](&v29, sel_isEqual_, v4);
        goto LABEL_14;
      }
    }
LABEL_12:
    v20 = 0;
  }
LABEL_14:

  return v20;
}

- (NSString)elementKind
{
  return self->_elementKind;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

- (NSCollectionLayoutAnchor)itemAnchor
{
  return self->_itemAnchor;
}

- (NSCollectionLayoutAnchor)containerAnchor
{
  return self->_containerAnchor;
}

- (NSCollectionLayoutSupplementaryItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 elementKind:(id)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSCollectionLayoutSupplementaryItem *v22;
  id v25;
  objc_super v26;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v25 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a3;
  +[NSCollectionLayoutEdgeSpacing defaultSpacing](NSCollectionLayoutEdgeSpacing, "defaultSpacing");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)NSCollectionLayoutSupplementaryItem;
  v22 = -[NSCollectionLayoutItem initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:](&v26, sel_initWithSize_contentInsets_edgeSpacing_supplementaryItems_decorationItems_name_identifier_, v19, v20, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, v21, top, leading, bottom, trailing);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_elementKind, a5);
    objc_storeStrong((id *)&v22->_containerAnchor, a6);
    objc_storeStrong((id *)&v22->_itemAnchor, a7);
    v22->_zIndex = a8;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAnchor, 0);
  objc_storeStrong((id *)&self->_containerAnchor, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
}

+ (NSCollectionLayoutSupplementaryItem)supplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind containerAnchor:(NSCollectionLayoutAnchor *)containerAnchor itemAnchor:(NSCollectionLayoutAnchor *)itemAnchor
{
  NSCollectionLayoutAnchor *v10;
  NSCollectionLayoutAnchor *v11;
  NSString *v12;
  NSCollectionLayoutSize *v13;
  void *v14;

  v10 = itemAnchor;
  v11 = containerAnchor;
  v12 = elementKind;
  v13 = layoutSize;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:", v13, v12, v11, v10, 1, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutSupplementaryItem *)v14;
}

+ (NSCollectionLayoutSupplementaryItem)itemWithLayoutSize:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCollectionLayoutSupplementaryItem must be initialized with an initializer accepting an element kind"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (NSCollectionLayoutSupplementaryItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCollectionLayoutSupplementaryItem must be initialized with an initializer accepting an element kind"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutItem size](self, "size");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[NSCollectionLayoutSupplementaryItem elementKind](self, "elementKind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSupplementaryItem containerAnchor](self, "containerAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSupplementaryItem itemAnchor](self, "itemAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v4, "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:", v5, v14, v15, v16, -[NSCollectionLayoutSupplementaryItem zIndex](self, "zIndex"), v7, v9, v11, v13);

  return v17;
}

- (id)_externalDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[NSCollectionLayoutItem layoutSize](self, "layoutSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSupplementaryItem elementKind](self, "elementKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p size: %@; elementKind: \"%@\";"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  if (v11 != 0.0 || v8 != 0.0 || v10 != 0.0 || v9 != 0.0)
  {
    -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
    v16 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g, %.*g, %.*g}"), 17, v12, 17, v13, 17, v14, 17, v15);
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\tcontentInsets=%@"), v16);

  }
  -[NSCollectionLayoutSupplementaryItem containerAnchor](self, "containerAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSCollectionLayoutSupplementaryItem containerAnchor](self, "containerAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\tcontainerAnchor=%@"), v18);

  }
  -[NSCollectionLayoutSupplementaryItem itemAnchor](self, "itemAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NSCollectionLayoutSupplementaryItem itemAnchor](self, "itemAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\titemAnchor=%@"), v20);

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (NSCollectionLayoutSupplementaryItem)supplementaryItem
{
  NSCollectionLayoutSupplementaryItem *v3;

  if (-[NSCollectionLayoutSupplementaryItem isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItem
{
  return 0;
}

- (void)setElementKind:(id)a3
{
  objc_storeStrong((id *)&self->_elementKind, a3);
}

- (BOOL)canAdjustContentSize
{
  return self->_canAdjustContentSize;
}

- (void)setCanAdjustContentSize:(BOOL)a3
{
  self->_canAdjustContentSize = a3;
}

@end

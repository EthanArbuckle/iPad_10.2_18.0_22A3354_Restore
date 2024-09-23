@implementation NSCollectionLayoutDecorationItem

- (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItem
{
  return 0;
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
  void *v16;
  NSInteger v17;
  objc_class *v18;
  void *v19;
  uint64_t v21;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutDecorationItem elementKind](self, "elementKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem size](self, "size");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[NSCollectionLayoutDecorationItem containerAnchor](self, "containerAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutDecorationItem itemAnchor](self, "itemAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSCollectionLayoutDecorationItem zIndex](self, "zIndex");
  v18 = -[NSCollectionLayoutDecorationItem _registrationViewClass](self, "_registrationViewClass");
  LOBYTE(v21) = -[NSCollectionLayoutDecorationItem isBackgroundDecoration](self, "isBackgroundDecoration");
  v19 = (void *)objc_msgSend(v4, "initWithElementKind:size:contentInsets:containerAnchor:itemAnchor:zIndex:registrationViewClass:isBackgroundDecoration:", v5, v6, v15, v16, v17, v18, v8, v10, v12, v14, v21);

  return v19;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

- (Class)_registrationViewClass
{
  return self->__registrationViewClass;
}

+ (NSCollectionLayoutDecorationItem)decorationItemWithSize:(id)a3 elementKind:(id)a4 containerAnchor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  LOBYTE(v13) = 0;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithElementKind:size:contentInsets:containerAnchor:itemAnchor:zIndex:registrationViewClass:isBackgroundDecoration:", v9, v10, v8, 0, 1, 0, 0.0, 0.0, 0.0, 0.0, v13);

  return (NSCollectionLayoutDecorationItem *)v11;
}

- (NSCollectionLayoutDecorationItem)initWithElementKind:(id)a3 size:(id)a4 contentInsets:(CVCDirectionalEdgeInsets)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8 registrationViewClass:(Class)a9 isBackgroundDecoration:(BOOL)a10
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSCollectionLayoutDecorationItem *v26;
  uint64_t v27;
  NSString *elementKind;
  uint64_t v29;
  NSCollectionLayoutAnchor *containerAnchor;
  uint64_t v31;
  NSCollectionLayoutAnchor *itemAnchor;
  objc_super v34;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v20 = a3;
  v21 = a6;
  v22 = a7;
  v23 = (void *)MEMORY[0x1E0CB3A28];
  v24 = a4;
  objc_msgSend(v23, "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34.receiver = self;
  v34.super_class = (Class)NSCollectionLayoutDecorationItem;
  v26 = -[NSCollectionLayoutItem initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:](&v34, sel_initWithSize_contentInsets_edgeSpacing_supplementaryItems_decorationItems_name_identifier_, v24, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, v25, top, leading, bottom, trailing);

  if (v26)
  {
    v27 = objc_msgSend(v20, "copy");
    elementKind = v26->_elementKind;
    v26->_elementKind = (NSString *)v27;

    v29 = objc_msgSend(v21, "copy");
    containerAnchor = v26->_containerAnchor;
    v26->_containerAnchor = (NSCollectionLayoutAnchor *)v29;

    v31 = objc_msgSend(v22, "copy");
    itemAnchor = v26->_itemAnchor;
    v26->_itemAnchor = (NSCollectionLayoutAnchor *)v31;

    v26->_zIndex = a8;
    v26->_isBackgroundDecoration = a10;
    objc_storeStrong((id *)&v26->__registrationViewClass, a9);
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutDecorationItem *v4;
  int64_t zIndex;
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
  _BOOL4 v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  objc_super v30;

  v4 = (NSCollectionLayoutDecorationItem *)a3;
  if (self == v4)
  {
    v20 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  zIndex = self->_zIndex;
  if (zIndex != -[NSCollectionLayoutDecorationItem zIndex](v4, "zIndex"))
    goto LABEL_13;
  -[NSCollectionLayoutDecorationItem elementKind](self, "elementKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutDecorationItem elementKind](v4, "elementKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (!v8)
    goto LABEL_13;
  -[NSCollectionLayoutItem contentInsets](self, "contentInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[NSCollectionLayoutItem contentInsets](v4, "contentInsets");
  v20 = 0;
  if (v12 == v21 && v10 == v17 && v16 == v19 && v14 == v18)
  {
    v22 = -[NSCollectionLayoutDecorationItem isBackgroundDecoration](self, "isBackgroundDecoration");
    if (v22 == -[NSCollectionLayoutDecorationItem isBackgroundDecoration](v4, "isBackgroundDecoration"))
    {
      -[NSCollectionLayoutDecorationItem containerAnchor](self, "containerAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutDecorationItem containerAnchor](v4, "containerAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = __objectEqual(v23, v24);

      if (v25)
      {
        -[NSCollectionLayoutDecorationItem itemAnchor](self, "itemAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCollectionLayoutDecorationItem itemAnchor](v4, "itemAnchor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = __objectEqual(v26, v27);

        if (v28)
        {
          v30.receiver = self;
          v30.super_class = (Class)NSCollectionLayoutDecorationItem;
          v20 = -[NSCollectionLayoutItem isEqual:](&v30, sel_isEqual_, v4);
          goto LABEL_15;
        }
      }
    }
LABEL_13:
    v20 = 0;
  }
LABEL_15:

  return v20;
}

- (NSString)elementKind
{
  return self->_elementKind;
}

- (BOOL)isBackgroundDecoration
{
  return self->_isBackgroundDecoration;
}

- (NSCollectionLayoutAnchor)itemAnchor
{
  return self->_itemAnchor;
}

- (NSCollectionLayoutAnchor)containerAnchor
{
  return self->_containerAnchor;
}

- (void)setZIndex:(NSInteger)zIndex
{
  self->_zIndex = zIndex;
}

- (void)_setRegistrationViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->__registrationViewClass, a3);
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
  v6.super_class = (Class)NSCollectionLayoutDecorationItem;
  -[NSCollectionLayoutItem _effectiveContentInsets](&v6, sel__effectiveContentInsets);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registrationViewClass, 0);
  objc_storeStrong((id *)&self->_itemAnchor, 0);
  objc_storeStrong((id *)&self->_containerAnchor, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
}

+ (NSCollectionLayoutDecorationItem)backgroundDecorationItemWithElementKind:(NSString *)elementKind
{
  NSString *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = elementKind;
  v5 = objc_alloc((Class)a1);
  +[NSCollectionLayoutSize sizeWithContainerSize](NSCollectionLayoutSize, "sizeWithContainerSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 1;
  v7 = (void *)objc_msgSend(v5, "initWithElementKind:size:contentInsets:containerAnchor:itemAnchor:zIndex:registrationViewClass:isBackgroundDecoration:", v4, v6, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, v9);

  return (NSCollectionLayoutDecorationItem *)v7;
}

+ (NSCollectionLayoutDecorationItem)itemWithLayoutSize:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCollectionLayoutDecorationItem must be initialized with the .background(elementKind:)/+backgroundDecorationItemWithElementKind: initializer"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (NSCollectionLayoutDecorationItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCollectionLayoutDecorationItem must be initialized with the .background(elementKind:)/+backgroundDecorationItemWithElementKind: initializer"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
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
  -[NSCollectionLayoutDecorationItem elementKind](self, "elementKind");
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
  -[NSCollectionLayoutDecorationItem containerAnchor](self, "containerAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSCollectionLayoutDecorationItem containerAnchor](self, "containerAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\tcontainerAnchor=%@"), v18);

  }
  -[NSCollectionLayoutDecorationItem itemAnchor](self, "itemAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NSCollectionLayoutDecorationItem itemAnchor](self, "itemAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\titemAnchor=%@"), v20);

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (NSCollectionLayoutSupplementaryItem)supplementaryItem
{
  return 0;
}

- (void)setElementKind:(id)a3
{
  objc_storeStrong((id *)&self->_elementKind, a3);
}

- (void)setContainerAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_containerAnchor, a3);
}

- (void)setItemAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_itemAnchor, a3);
}

- (void)setIsBackgroundDecoration:(BOOL)a3
{
  self->_isBackgroundDecoration = a3;
}

@end

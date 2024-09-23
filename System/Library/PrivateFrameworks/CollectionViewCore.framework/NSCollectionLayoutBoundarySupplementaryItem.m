@implementation NSCollectionLayoutBoundarySupplementaryItem

+ (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind alignment:(NSRectAlignment)alignment
{
  return (NSCollectionLayoutBoundarySupplementaryItem *)objc_msgSend(a1, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", layoutSize, elementKind, alignment, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)setPinToVisibleBounds:(BOOL)pinToVisibleBounds
{
  self->_pinToVisibleBounds = pinToVisibleBounds;
}

- (id)copyWithContainerAnchor:(id)a3 itemAnchor:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)-[NSCollectionLayoutBoundarySupplementaryItem copy](self, "copy");
  objc_msgSend(v8, "setContainerAnchor:", v7);

  objc_msgSend(v8, "setItemAnchor:", v6);
  return v8;
}

+ (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind alignment:(NSRectAlignment)alignment absoluteOffset:(CGPoint)absoluteOffset
{
  double y;
  double x;
  NSString *v10;
  NSCollectionLayoutSize *v11;
  void *v12;
  uint64_t v14;

  y = absoluteOffset.y;
  x = absoluteOffset.x;
  v10 = elementKind;
  v11 = layoutSize;
  LOWORD(v14) = 1;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:alignment:offset:extendsBoundary:pinToVisibleBounds:", v11, v10, 0, 0, 1, alignment, 0.0, 0.0, 0.0, 0.0, x, y, v14);

  return (NSCollectionLayoutBoundarySupplementaryItem *)v12;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutBoundarySupplementaryItem *v4;
  NSRectAlignment v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int64_t v15;
  objc_super v17;

  v4 = (NSCollectionLayoutBoundarySupplementaryItem *)a3;
  if (self == v4)
  {
    v11 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v5 = -[NSCollectionLayoutBoundarySupplementaryItem alignment](self, "alignment");
  if (v5 != -[NSCollectionLayoutBoundarySupplementaryItem alignment](v4, "alignment"))
    goto LABEL_10;
  -[NSCollectionLayoutBoundarySupplementaryItem offset](self, "offset");
  v7 = v6;
  v9 = v8;
  -[NSCollectionLayoutBoundarySupplementaryItem offset](v4, "offset");
  v11 = 0;
  if (v7 == v12 && v9 == v10)
  {
    v13 = -[NSCollectionLayoutBoundarySupplementaryItem extendsBoundary](self, "extendsBoundary");
    if (v13 == -[NSCollectionLayoutBoundarySupplementaryItem extendsBoundary](v4, "extendsBoundary"))
    {
      v14 = -[NSCollectionLayoutBoundarySupplementaryItem pinToVisibleBounds](self, "pinToVisibleBounds");
      if (v14 == -[NSCollectionLayoutBoundarySupplementaryItem pinToVisibleBounds](v4, "pinToVisibleBounds"))
      {
        v15 = -[NSCollectionLayoutBoundarySupplementaryItem _pinningZIndex](self, "_pinningZIndex");
        if (v15 == -[NSCollectionLayoutBoundarySupplementaryItem _pinningZIndex](v4, "_pinningZIndex"))
        {
          v17.receiver = self;
          v17.super_class = (Class)NSCollectionLayoutBoundarySupplementaryItem;
          v11 = -[NSCollectionLayoutSupplementaryItem isEqual:](&v17, sel_isEqual_, v4);
          goto LABEL_12;
        }
      }
    }
LABEL_10:
    v11 = 0;
  }
LABEL_12:

  return v11;
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
  NSInteger v17;
  NSRectAlignment v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  _QWORD *v24;
  uint64_t v26;

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
  v17 = -[NSCollectionLayoutSupplementaryItem zIndex](self, "zIndex");
  v18 = -[NSCollectionLayoutBoundarySupplementaryItem alignment](self, "alignment");
  -[NSCollectionLayoutBoundarySupplementaryItem offset](self, "offset");
  v20 = v19;
  v22 = v21;
  v23 = -[NSCollectionLayoutBoundarySupplementaryItem extendsBoundary](self, "extendsBoundary");
  BYTE1(v26) = -[NSCollectionLayoutBoundarySupplementaryItem pinToVisibleBounds](self, "pinToVisibleBounds");
  LOBYTE(v26) = v23;
  v24 = (_QWORD *)objc_msgSend(v4, "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:alignment:offset:extendsBoundary:pinToVisibleBounds:", v5, v14, v15, v16, v17, v18, v7, v9, v11, v13, v20, v22, v26);

  v24[19] = self->_pinningZIndex;
  return v24;
}

- (BOOL)extendsBoundary
{
  return self->_extendsBoundary;
}

- (NSRectAlignment)alignment
{
  return self->_alignment;
}

- (BOOL)pinToVisibleBounds
{
  return self->_pinToVisibleBounds;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSCollectionLayoutBoundarySupplementaryItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 elementKind:(id)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8 alignment:(int64_t)a9 offset:(CGPoint)a10 extendsBoundary:(BOOL)a11 pinToVisibleBounds:(BOOL)a12
{
  CGFloat y;
  CGFloat x;
  NSCollectionLayoutBoundarySupplementaryItem *result;
  objc_super v16;

  y = a10.y;
  x = a10.x;
  v16.receiver = self;
  v16.super_class = (Class)NSCollectionLayoutBoundarySupplementaryItem;
  result = -[NSCollectionLayoutSupplementaryItem initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:](&v16, sel_initWithSize_contentInsets_elementKind_containerAnchor_itemAnchor_zIndex_, a3, a5, a6, a7, a8, a4.top, a4.leading, a4.bottom, a4.trailing);
  if (result)
  {
    result->_alignment = a9;
    result->_offset.x = x;
    result->_offset.y = y;
    result->_extendsBoundary = a11;
    result->_pinToVisibleBounds = a12;
    result->_pinningZIndex = 0x8000000000000001;
  }
  return result;
}

- (int64_t)_pinningZIndex
{
  if (self->_pinningZIndex == 0x8000000000000001)
    return -[NSCollectionLayoutSupplementaryItem zIndex](self, "zIndex");
  else
    return self->_pinningZIndex;
}

- (void)_setPinningZIndex:(int64_t)a3
{
  self->_pinningZIndex = a3;
}

- (void)setExtendsBoundary:(BOOL)extendsBoundary
{
  self->_extendsBoundary = extendsBoundary;
}

+ (NSCollectionLayoutBoundarySupplementaryItem)itemWithLayoutSize:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCollectionLayoutBoundarySupplementaryItem must be initialized with an initializer accepting an element kind"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (NSCollectionLayoutBoundarySupplementaryItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSCollectionLayoutBoundarySupplementaryItem must be initialized with an initializer accepting an element kind"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)setPinningZIndex:(int64_t)a3
{
  self->_pinningZIndex = a3;
}

@end

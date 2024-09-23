@implementation GEOResolvedItem

- (GEOResolvedItem)initWithResolvedItem:(id)a3
{
  id v5;
  GEOResolvedItem *v6;
  GEOResolvedItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResolvedItem;
  v6 = -[GEOResolvedItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resolvedItem, a3);

  return v7;
}

- (GEOResolvedItem)initWithAutocompleteResolvedItem:(id)a3
{
  id v4;
  GEOResolvedItem *v5;
  GEOPDResolvedItem *v6;
  GEOPDResolvedItem *resolvedItem;
  int v8;
  GEOPDResolvedItem *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOResolvedItem;
  v5 = -[GEOResolvedItem init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(GEOPDResolvedItem);
    resolvedItem = v5->_resolvedItem;
    v5->_resolvedItem = v6;

    if (objc_msgSend(v4, "hasResolvedItemType"))
    {
      v8 = objc_msgSend(v4, "resolvedItemType");
      v9 = v5->_resolvedItem;
      if (v9)
      {
        *(_BYTE *)&v9->_flags |= 1u;
        v9->_resolvedItemType = v8;
      }
    }
  }

  return v5;
}

- (NSString)extractedTerm
{
  uint64_t resolvedItem;

  resolvedItem = (uint64_t)self->_resolvedItem;
  if (resolvedItem)
  {
    if (*(_QWORD *)(resolvedItem + 16))
    {
      -[GEOPDResolvedItem extractedTerm]((id *)resolvedItem);
      resolvedItem = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      resolvedItem = 0;
    }
  }
  return (NSString *)(id)resolvedItem;
}

- (unint64_t)resultIndex
{
  GEOPDResolvedItem *resolvedItem;

  resolvedItem = self->_resolvedItem;
  if (resolvedItem)
    return resolvedItem->_resultIndex;
  else
    return 0;
}

- (BOOL)hasResultIndex
{
  GEOPDResolvedItem *resolvedItem;
  _BOOL4 v3;

  resolvedItem = self->_resolvedItem;
  if (resolvedItem)
    return (*(_BYTE *)&resolvedItem->_flags >> 1) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (int)itemType
{
  GEOPDResolvedItem *resolvedItem;
  int resolvedItemType;

  resolvedItem = self->_resolvedItem;
  if (!resolvedItem || (*(_BYTE *)&resolvedItem->_flags & 1) == 0)
    return 0;
  resolvedItemType = resolvedItem->_resolvedItemType;
  if ((resolvedItemType - 1) >= 6)
    return 0;
  else
    return resolvedItemType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedItem, 0);
}

@end

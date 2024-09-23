@implementation GEOQuickLink

- (GEOQuickLink)initWithQuickLink:(id)a3
{
  id v5;
  GEOQuickLink *v6;
  GEOQuickLink *v7;
  GEOQuickLink *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOQuickLink;
  v6 = -[GEOQuickLink init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_quickLinkItem, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)title
{
  return -[GEOPDQuickLinkItem title]((id *)&self->_quickLinkItem->super.super.isa);
}

- (NSString)URLString
{
  return -[GEOPDQuickLinkItem url]((id *)&self->_quickLinkItem->super.super.isa);
}

- (NSString)appAdamID
{
  return -[GEOPDQuickLinkItem appAdamId]((id *)&self->_quickLinkItem->super.super.isa);
}

- (NSString)bundleID
{
  return -[GEOPDQuickLinkItem bundleId]((id *)&self->_quickLinkItem->super.super.isa);
}

- (NSString)imageName
{
  GEOPDQuickLinkItem *quickLinkItem;
  void *v4;

  quickLinkItem = self->_quickLinkItem;
  if (quickLinkItem
    && (-[GEOPDQuickLinkItem _readSymbolImageName]((uint64_t)self->_quickLinkItem), quickLinkItem->_symbolImageName))
  {
    -[GEOPDQuickLinkItem symbolImageName]((id *)&self->_quickLinkItem->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (int64_t)type
{
  int v2;

  v2 = -[GEOPDQuickLinkItem linkType]((uint64_t)self->_quickLinkItem);
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLinkItem, 0);
}

@end

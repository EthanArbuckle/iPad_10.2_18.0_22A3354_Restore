@implementation OrderedWBTabWrapper

- (OrderedWBTabWrapper)initWithWBTab:(id)a3
{
  id v5;
  OrderedWBTabWrapper *v6;
  OrderedWBTabWrapper *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)OrderedWBTabWrapper,
        v6 = -[OrderedWBTabWrapper init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_tab, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)ancestorTabIdentifiers
{
  void *v2;
  void *v3;

  -[WBTab localAttributes](self->_tab, "localAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ancestorTabUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)identifier
{
  return (NSString *)-[WBTab uuid](self->_tab, "uuid");
}

- (BOOL)isPinnedTab
{
  return -[WBTab isPinned](self->_tab, "isPinned");
}

- (double)lastActivationTime
{
  double result;

  -[WBTab lastViewedTime](self->_tab, "lastViewedTime");
  return result;
}

- (BOOL)shouldSelectOriginatingTabWhenClosed
{
  return 0;
}

- (NSString)windowIdentifier
{
  void *v2;
  void *v3;

  -[WBTab localAttributes](self->_tab, "localAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  OrderedWBTabWrapper *v4;
  void *v5;
  char v6;

  v4 = (OrderedWBTabWrapper *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[OrderedWBTabWrapper tab](v4, "tab");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = WBSIsEqual();

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[WBTab hash](self->_tab, "hash");
}

- (WBTab)tab
{
  return self->_tab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tab, 0);
}

@end

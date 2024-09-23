@implementation PKHashtagQueryItem

- (PKHashtagQueryItem)initWithCoreHandwritingPrefixQueryItem:(id)a3
{
  id v4;
  PKHashtagQueryItem *v5;
  PKHashtagQueryItem *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKHashtagQueryItem;
  v5 = -[PKHashtagQueryItem init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKHashtagQueryItem setCoreHandwritingPrefixQueryItem:](v5, "setCoreHandwritingPrefixQueryItem:", v4);
    objc_msgSend(v4, "queryResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHashtagQueryItem setHashtagResult:](v6, "setHashtagResult:", v7);

  }
  return v6;
}

- (id)strokeIdentifiers
{
  return (id)-[CHPrefixQueryItem strokeIdentifiers](self->_coreHandwritingPrefixQueryItem, "strokeIdentifiers");
}

- (id)baselinePath
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", -[CHPrefixQueryItem estimatedBaseline](self->_coreHandwritingPrefixQueryItem, "estimatedBaseline"));
}

- (unint64_t)hash
{
  return -[CHPrefixQueryItem hash](self->_coreHandwritingPrefixQueryItem, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PKHashtagQueryItem *v4;
  CHPrefixQueryItem *coreHandwritingPrefixQueryItem;
  void *v6;
  char v7;

  v4 = (PKHashtagQueryItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      coreHandwritingPrefixQueryItem = self->_coreHandwritingPrefixQueryItem;
      -[PKHashtagQueryItem coreHandwritingPrefixQueryItem](v4, "coreHandwritingPrefixQueryItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CHPrefixQueryItem isEqualToPrefixQueryItem:](coreHandwritingPrefixQueryItem, "isEqualToPrefixQueryItem:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)hashtagResult
{
  return self->_hashtagResult;
}

- (void)setHashtagResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CHPrefixQueryItem)coreHandwritingPrefixQueryItem
{
  return self->_coreHandwritingPrefixQueryItem;
}

- (void)setCoreHandwritingPrefixQueryItem:(id)a3
{
  objc_storeStrong((id *)&self->_coreHandwritingPrefixQueryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHandwritingPrefixQueryItem, 0);
  objc_storeStrong((id *)&self->_hashtagResult, 0);
}

@end

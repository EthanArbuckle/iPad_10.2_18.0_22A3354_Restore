@implementation PKProofreadingQueryItem

- (PKProofreadingQueryItem)initWithCoreHandwritingTextCheckingQueryItem:(id)a3
{
  CHTextCheckingQueryItem *v4;
  PKProofreadingQueryItem *v5;
  CHTextCheckingQueryItem *coreHandwritingTextCheckingQueryItem;
  objc_super v8;

  v4 = (CHTextCheckingQueryItem *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKProofreadingQueryItem;
  v5 = -[PKProofreadingQueryItem init](&v8, sel_init);
  coreHandwritingTextCheckingQueryItem = v5->_coreHandwritingTextCheckingQueryItem;
  v5->_coreHandwritingTextCheckingQueryItem = v4;

  return v5;
}

- (id)strokeIdentifiers
{
  return (id)-[CHTextCheckingQueryItem strokeIdentifiers](self->_coreHandwritingTextCheckingQueryItem, "strokeIdentifiers");
}

- (id)baselinePath
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", -[CHTextCheckingQueryItem estimatedBaseline](self->_coreHandwritingTextCheckingQueryItem, "estimatedBaseline"));
}

- (NSArray)replacementStrings
{
  return (NSArray *)-[CHTextCheckingQueryItem replacementStrings](self->_coreHandwritingTextCheckingQueryItem, "replacementStrings");
}

- (int)resultType
{
  return -[CHTextCheckingQueryItem textCheckingResultType](self->_coreHandwritingTextCheckingQueryItem, "textCheckingResultType");
}

- (unint64_t)hash
{
  return -[CHTextCheckingQueryItem hash](self->_coreHandwritingTextCheckingQueryItem, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PKProofreadingQueryItem *v4;
  CHTextCheckingQueryItem *coreHandwritingTextCheckingQueryItem;
  void *v6;
  char v7;

  v4 = (PKProofreadingQueryItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      coreHandwritingTextCheckingQueryItem = self->_coreHandwritingTextCheckingQueryItem;
      -[PKProofreadingQueryItem coreHandwritingTextCheckingQueryItem](v4, "coreHandwritingTextCheckingQueryItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CHTextCheckingQueryItem isEqualToTextCheckingQueryItem:](coreHandwritingTextCheckingQueryItem, "isEqualToTextCheckingQueryItem:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (CHTextCheckingQueryItem)coreHandwritingTextCheckingQueryItem
{
  return self->_coreHandwritingTextCheckingQueryItem;
}

- (void)setCoreHandwritingTextCheckingQueryItem:(id)a3
{
  objc_storeStrong((id *)&self->_coreHandwritingTextCheckingQueryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHandwritingTextCheckingQueryItem, 0);
}

@end

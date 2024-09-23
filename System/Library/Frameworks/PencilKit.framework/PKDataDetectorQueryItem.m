@implementation PKDataDetectorQueryItem

- (PKDataDetectorQueryItem)initWithCoreHandwritingDataDetectorQueryItem:(id)a3
{
  CHDataDetectorQueryItem *v4;
  PKDataDetectorQueryItem *v5;
  CHDataDetectorQueryItem *coreHandwritingDataDetectorQueryItem;
  objc_super v8;

  v4 = (CHDataDetectorQueryItem *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDataDetectorQueryItem;
  v5 = -[PKDataDetectorQueryItem init](&v8, sel_init);
  coreHandwritingDataDetectorQueryItem = v5->_coreHandwritingDataDetectorQueryItem;
  v5->_coreHandwritingDataDetectorQueryItem = v4;

  return v5;
}

- (id)strokeIdentifiers
{
  return (id)-[CHDataDetectorQueryItem strokeIdentifiers](self->_coreHandwritingDataDetectorQueryItem, "strokeIdentifiers");
}

- (DDScannerResult)scannerResult
{
  return (DDScannerResult *)-[CHDataDetectorQueryItem dataDetectorResult](self->_coreHandwritingDataDetectorQueryItem, "dataDetectorResult");
}

- (id)baselinePath
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", -[CHDataDetectorQueryItem estimatedBaseline](self->_coreHandwritingDataDetectorQueryItem, "estimatedBaseline"));
}

- (unint64_t)hash
{
  return -[CHDataDetectorQueryItem hash](self->_coreHandwritingDataDetectorQueryItem, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PKDataDetectorQueryItem *v4;
  CHDataDetectorQueryItem *coreHandwritingDataDetectorQueryItem;
  void *v6;
  char v7;

  v4 = (PKDataDetectorQueryItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      coreHandwritingDataDetectorQueryItem = self->_coreHandwritingDataDetectorQueryItem;
      -[PKDataDetectorQueryItem coreHandwritingDataDetectorQueryItem](v4, "coreHandwritingDataDetectorQueryItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CHDataDetectorQueryItem isEqualToDataDetectorQueryItem:](coreHandwritingDataDetectorQueryItem, "isEqualToDataDetectorQueryItem:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (CHDataDetectorQueryItem)coreHandwritingDataDetectorQueryItem
{
  return self->_coreHandwritingDataDetectorQueryItem;
}

- (void)setCoreHandwritingDataDetectorQueryItem:(id)a3
{
  objc_storeStrong((id *)&self->_coreHandwritingDataDetectorQueryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHandwritingDataDetectorQueryItem, 0);
}

@end

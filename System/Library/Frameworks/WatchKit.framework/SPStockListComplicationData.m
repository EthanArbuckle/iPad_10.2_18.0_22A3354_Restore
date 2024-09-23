@implementation SPStockListComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPStockListComplicationData;
  v4 = a3;
  -[SPComplicationData encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stockList, CFSTR("_StockListKey"), v5.receiver, v5.super_class);

}

- (SPStockListComplicationData)initWithCoder:(id)a3
{
  id v4;
  SPStockListComplicationData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *stockList;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SPStockListComplicationData;
  v5 = -[SPComplicationData initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_StockListKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    stockList = v5->_stockList;
    v5->_stockList = (NSArray *)v9;

  }
  return v5;
}

- (NSArray)stockList
{
  return self->_stockList;
}

- (void)setStockList:(id)a3
{
  objc_storeStrong((id *)&self->_stockList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stockList, 0);
}

@end

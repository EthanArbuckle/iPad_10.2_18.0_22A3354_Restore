@implementation SPStockComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPStockComplicationData;
  v4 = a3;
  -[SPComplicationData encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tickerSymbolText, CFSTR("_TickerSymbolTextKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_priceText, CFSTR("_PriceTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_marketCapText, CFSTR("_MarketCapTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_changeInPercentText, CFSTR("_ChangeInPercentTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_changeInPointsText, CFSTR("_ChangeInPointsTextKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_changeText, CFSTR("_ChangeTextKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_changeDirection, CFSTR("_ChangeDirectionKey"));

}

- (SPStockComplicationData)initWithCoder:(id)a3
{
  id v4;
  SPStockComplicationData *v5;
  uint64_t v6;
  NSString *tickerSymbolText;
  uint64_t v8;
  NSString *priceText;
  uint64_t v10;
  NSString *marketCapText;
  uint64_t v12;
  NSString *changeInPercentText;
  uint64_t v14;
  NSString *changeInPointsText;
  uint64_t v16;
  NSString *changeText;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPStockComplicationData;
  v5 = -[SPComplicationData initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_TickerSymbolTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    tickerSymbolText = v5->_tickerSymbolText;
    v5->_tickerSymbolText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_PriceTextKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    priceText = v5->_priceText;
    v5->_priceText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_MarketCapTextKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    marketCapText = v5->_marketCapText;
    v5->_marketCapText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ChangeInPercentTextKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    changeInPercentText = v5->_changeInPercentText;
    v5->_changeInPercentText = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ChangeInPointsTextKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    changeInPointsText = v5->_changeInPointsText;
    v5->_changeInPointsText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ChangeTextKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    changeText = v5->_changeText;
    v5->_changeText = (NSString *)v16;

    v5->_changeDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_ChangeDirectionKey"));
  }

  return v5;
}

- (NSString)tickerSymbolText
{
  return self->_tickerSymbolText;
}

- (void)setTickerSymbolText:(id)a3
{
  objc_storeStrong((id *)&self->_tickerSymbolText, a3);
}

- (NSString)priceText
{
  return self->_priceText;
}

- (void)setPriceText:(id)a3
{
  objc_storeStrong((id *)&self->_priceText, a3);
}

- (NSString)marketCapText
{
  return self->_marketCapText;
}

- (void)setMarketCapText:(id)a3
{
  objc_storeStrong((id *)&self->_marketCapText, a3);
}

- (NSString)changeInPercentText
{
  return self->_changeInPercentText;
}

- (void)setChangeInPercentText:(id)a3
{
  objc_storeStrong((id *)&self->_changeInPercentText, a3);
}

- (NSString)changeInPointsText
{
  return self->_changeInPointsText;
}

- (void)setChangeInPointsText:(id)a3
{
  objc_storeStrong((id *)&self->_changeInPointsText, a3);
}

- (NSString)changeText
{
  return self->_changeText;
}

- (void)setChangeText:(id)a3
{
  objc_storeStrong((id *)&self->_changeText, a3);
}

- (unint64_t)changeDirection
{
  return self->_changeDirection;
}

- (void)setChangeDirection:(unint64_t)a3
{
  self->_changeDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeText, 0);
  objc_storeStrong((id *)&self->_changeInPointsText, 0);
  objc_storeStrong((id *)&self->_changeInPercentText, 0);
  objc_storeStrong((id *)&self->_marketCapText, 0);
  objc_storeStrong((id *)&self->_priceText, 0);
  objc_storeStrong((id *)&self->_tickerSymbolText, 0);
}

@end

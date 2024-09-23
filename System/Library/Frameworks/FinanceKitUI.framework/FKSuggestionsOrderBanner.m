@implementation FKSuggestionsOrderBanner

- (FKSuggestionsOrderBanner)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  FKSuggestionsOrderBanner *v7;
  _TtC12FinanceKitUI22SuggestionsOrderBanner *v8;
  _TtC12FinanceKitUI22SuggestionsOrderBanner *orderBanner;
  FKSuggestionsOrderBanner *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FKSuggestionsOrderBanner;
  v7 = -[FKSuggestionsOrderBanner init](&v12, sel_init);
  if (v7
    && (v8 = -[SuggestionsOrderBanner init:error:]([_TtC12FinanceKitUI22SuggestionsOrderBanner alloc], "init:error:", v6, a4), orderBanner = v7->_orderBanner, v7->_orderBanner = v8, orderBanner, !v7->_orderBanner))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)merchantName
{
  return -[SuggestionsOrderBanner merchantName](self->_orderBanner, "merchantName");
}

- (id)bannerAttributedSubtitle
{
  return -[SuggestionsOrderBanner bannerAttributedSubtitle](self->_orderBanner, "bannerAttributedSubtitle");
}

- (id)walletLogo
{
  return +[SuggestionsOrderBanner walletLogo](_TtC12FinanceKitUI22SuggestionsOrderBanner, "walletLogo");
}

- (id)orderDeepLink
{
  return -[SuggestionsOrderBanner orderDeepLink](self->_orderBanner, "orderDeepLink");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderBanner, 0);
}

@end

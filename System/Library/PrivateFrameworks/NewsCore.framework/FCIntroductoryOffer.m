@implementation FCIntroductoryOffer

- (FCIntroductoryOffer)initWithOfferType:(int)a3 priceFormatted:(id)a4 recurringSubscriptionPeriod:(id)a5 numOfPeriods:(unint64_t)a6
{
  id v11;
  id v12;
  FCIntroductoryOffer *v13;
  FCIntroductoryOffer *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Offer Type cannot be unknown. Must be a unsupported intro offer type."));
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]";
    v22 = 2080;
    v23 = "FCIntroductoryOffer.m";
    v24 = 1024;
    v25 = 27;
    v26 = 2114;
    v27 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11)
      goto LABEL_6;
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "priceFormatted");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]";
    v22 = 2080;
    v23 = "FCIntroductoryOffer.m";
    v24 = 1024;
    v25 = 28;
    v26 = 2114;
    v27 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "recurringSubscriptionPeriod");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]";
    v22 = 2080;
    v23 = "FCIntroductoryOffer.m";
    v24 = 1024;
    v25 = 29;
    v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v19.receiver = self;
  v19.super_class = (Class)FCIntroductoryOffer;
  v13 = -[FCIntroductoryOffer init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_offerType = a3;
    objc_storeStrong((id *)&v13->_priceFormatted, a4);
    v14->_numOfPeriods = a6;
    objc_storeStrong((id *)&v14->_subscriptionPeriodInISO_8601, a5);
  }

  return v14;
}

- (int)offerType
{
  return self->_offerType;
}

- (void)setOfferType:(int)a3
{
  self->_offerType = a3;
}

- (unint64_t)numOfPeriods
{
  return self->_numOfPeriods;
}

- (void)setNumOfPeriods:(unint64_t)a3
{
  self->_numOfPeriods = a3;
}

- (NSString)priceFormatted
{
  return self->_priceFormatted;
}

- (void)setPriceFormatted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subscriptionPeriodInISO_8601
{
  return self->_subscriptionPeriodInISO_8601;
}

- (void)setSubscriptionPeriodInISO_8601:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPeriodInISO_8601, 0);
  objc_storeStrong((id *)&self->_priceFormatted, 0);
}

@end

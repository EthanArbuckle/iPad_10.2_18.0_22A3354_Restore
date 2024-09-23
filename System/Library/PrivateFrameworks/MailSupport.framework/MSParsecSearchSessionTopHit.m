@implementation MSParsecSearchSessionTopHit

+ (id)topHitWithIdentifier:(id)a3 date:(id)a4 mailRankingSignals:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:date:mailRankingSignals:", v8, v9, v10);

  return v11;
}

- (MSParsecSearchSessionTopHit)initWithIdentifier:(id)a3 date:(id)a4 mailRankingSignals:(id)a5
{
  id v9;
  id *v10;
  MSParsecSearchSessionTopHit *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MSParsecSearchSessionTopHit;
  v10 = -[MSParsecSearchSessionMessageResult initResultWithIdentifier:date:](&v13, sel_initResultWithIdentifier_date_, a3, a4);
  v11 = (MSParsecSearchSessionTopHit *)v10;
  if (v10)
    objc_storeStrong(v10 + 3, a5);

  return v11;
}

- (id)feedbackResult
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSParsecSearchSessionTopHit;
  -[MSParsecSearchSessionMessageResult feedbackResult](&v5, sel_feedbackResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopHit:", 2);
  objc_msgSend(v3, "setResultBundleId:", CFSTR("com.apple.mail.search.tophit"));
  objc_msgSend(v3, "setSectionBundleIdentifier:", CFSTR("tophit"));
  objc_msgSend(v3, "setMailRankingSignals:", self->_mailRankingSignals);
  return v3;
}

- (SFMailRankingSignals)mailRankingSignals
{
  return self->_mailRankingSignals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailRankingSignals, 0);
}

@end

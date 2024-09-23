@implementation MSPWalletRAPReport

- (id)initForMerchantIssue:(unint64_t)a3 merchantIndustryCode:(int64_t)a4 mapsIdentifier:(unint64_t)a5 merchantName:(id)a6 merchantRawName:(id)a7 merchantIndustryCategory:(id)a8 merchantURL:(id)a9 merchantFormattedAddress:(id)a10 transactionTime:(double)a11 transactionType:(id)a12 transactionLocation:(id)a13 bankTransactionInformation:(id)a14
{
  double var1;
  double var0;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  MSPWalletRAPReport *v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  GEORPFeedbackRequestParameters *requestParameters;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v45;
  char v46;
  objc_super v47;

  var1 = a13.var1;
  var0 = a13.var0;
  v46 = a3;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a12;
  v27 = a14;
  v47.receiver = self;
  v47.super_class = (Class)MSPWalletRAPReport;
  v28 = -[MSPWalletRAPReport init](&v47, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D272D0]), "initWithMSPWalletBankTransactionInformation:rawMerchantCode:industryCategory:", v27, v22, v23);
    v30 = objc_alloc(MEMORY[0x1E0D273B0]);
    v42 = (void *)v29;
    v43 = v26;
    v31 = a5;
    v45 = v24;
    v32 = objc_msgSend(v30, "initWithMerchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:merchantBankTransactionInfo:", a4, v31, v21, v22, v23, v24, a11, var0, var1, v25, v26, v29);
    requestParameters = v28->_requestParameters;
    v28->_requestParameters = (GEORPFeedbackRequestParameters *)v32;

    v34 = objc_alloc_init(MEMORY[0x1E0D273C8]);
    v35 = v34;
    v36 = v21;
    v37 = v22;
    if ((v46 & 2) != 0)
    {
      objc_msgSend(v34, "setIsMerchantIncorrect:", 1);
      if ((v46 & 1) == 0)
      {
LABEL_4:
        if ((v46 & 4) == 0)
        {
LABEL_6:
          -[GEORPFeedbackRequestParameters submissionParameters](v28->_requestParameters, "submissionParameters");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "details");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "merchantLookupFeedback");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setCorrections:", v35);

          v21 = v36;
          v22 = v37;
          v26 = v43;
          v24 = v45;
          goto LABEL_7;
        }
LABEL_5:
        objc_msgSend(v35, "setIsOtherIssue:", 1);
        goto LABEL_6;
      }
    }
    else if ((v46 & 1) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v35, "setIsCategoryIncorrect:", 1);
    if ((v46 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_7:

  return v28;
}

- (void)setMerchantAdamId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merchantLookupFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMerchantAdamId:", v8);

}

- (NSString)merchantAdamId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchantLookupFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merchantAdamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setReportersComment:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonCorrections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D273A0]);
    -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommonCorrections:", v6);

  }
  v8 = (void *)objc_msgSend(v11, "copy");
  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonCorrections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComments:", v8);

}

- (NSString)reportersComment
{
  void *v2;
  void *v3;
  void *v4;

  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonCorrections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "comments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setCorrelationId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(a3, "copy");
  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merchantLookupFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCorrelationId:", v8);

}

- (NSString)correlationId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchantLookupFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correlationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isAppleCard
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchantLookupFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleCard");

  return v6;
}

- (void)setIsAppleCard:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "merchantLookupFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAppleCard:", v3);

}

- (unint64_t)lookupTransactionType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "details");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchantLookupFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "requestTransactionType");

  return v6;
}

- (void)setLookupTransactionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[GEORPFeedbackRequestParameters submissionParameters](self->_requestParameters, "submissionParameters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "merchantLookupFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestTransactionType:", a3);

}

- (GEORPFeedbackRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
}

@end

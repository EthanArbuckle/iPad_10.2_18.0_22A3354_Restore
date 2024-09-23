@implementation MKWalletRAPReport

- (id)initForMerchantIssue:(unint64_t)a3 merchantIndustryCode:(int64_t)a4 mapsIdentifier:(unint64_t)a5 merchantName:(id)a6 merchantRawName:(id)a7 merchantIndustryCategory:(id)a8 merchantURL:(id)a9 merchantFormattedAddress:(id)a10 transactionTime:(double)a11 transactionType:(id)a12 transactionLocation:(id)a13
{
  double var1;
  double var0;
  char v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  MKWalletRAPReport *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  GEORPFeedbackRequestParameters *requestParameters;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v40;
  objc_super v41;

  var1 = a13.var1;
  var0 = a13.var0;
  v19 = a3;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a12;
  v41.receiver = self;
  v41.super_class = (Class)MKWalletRAPReport;
  v27 = -[MKWalletRAPReport init](&v41, sel_init);
  if (v27)
  {
    v28 = objc_alloc(MEMORY[0x1E0D273B0]);
    v29 = a5;
    v40 = v22;
    v30 = objc_msgSend(v28, "initWithMerchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:merchantBankTransactionInfo:", a4, v29, v21, v22, v23, v24, a11, var0, var1, v25, v26, 0);
    requestParameters = v27->_requestParameters;
    v27->_requestParameters = (GEORPFeedbackRequestParameters *)v30;

    v32 = objc_alloc_init(MEMORY[0x1E0D273C8]);
    v33 = v32;
    v34 = v21;
    if ((v19 & 2) != 0)
    {
      objc_msgSend(v32, "setIsMerchantIncorrect:", 1);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        if ((v19 & 4) == 0)
        {
LABEL_6:
          -[GEORPFeedbackRequestParameters submissionParameters](v27->_requestParameters, "submissionParameters");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "details");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "merchantLookupFeedback");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setCorrections:", v33);

          v21 = v34;
          v22 = v40;
          goto LABEL_7;
        }
LABEL_5:
        objc_msgSend(v33, "setIsOtherIssue:", 1);
        goto LABEL_6;
      }
    }
    else if ((v19 & 1) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v33, "setIsCategoryIncorrect:", 1);
    if ((v19 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_7:

  return v27;
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

- (GEORPProblem)problem
{
  return self->_problem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problem, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);
}

@end

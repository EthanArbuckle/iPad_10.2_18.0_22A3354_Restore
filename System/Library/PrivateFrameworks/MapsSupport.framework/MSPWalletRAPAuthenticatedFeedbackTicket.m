@implementation MSPWalletRAPAuthenticatedFeedbackTicket

void __MSPWalletRAPAuthenticatedFeedbackTicket_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "feedbackRequestParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submissionParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "merchantLookupFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "merchantBankTransactionInfo");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32) == 2)
  {
    objc_msgSend(v9, "tdmUserInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anonymousUserId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnonymisedUserId:", v11);

  }
  objc_msgSend(v9, "tdmUserInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "baaSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBaaSignature:", v13);

  objc_msgSend(v9, "tdmUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "baaCertificates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBaaCertificates:", v15);

}

@end

@implementation MSPWalletRAPUnauthenticatedFeedbackTicket

void __MSPWalletRAPUnauthenticatedFeedbackTicket_block_invoke(uint64_t a1, void *a2)
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
  id v12;

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
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32) == 2)
  {
    objc_msgSend(v9, "tdmUserInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anonymousUserId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnonymisedUserId:", v11);

  }
}

@end

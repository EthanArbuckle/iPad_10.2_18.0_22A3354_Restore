@implementation PKPaymentAuthorizationDataModel(NanoPassKit)

- (void)npkSetPassAndPaymentApplicationForAID:()NanoPassKit
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  objc_msgSend(a1, "acceptedPasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke;
  v10[3] = &unk_24CFE96D0;
  v6 = v4;
  v11 = v6;
  v12 = &v20;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend(a1, "beginUpdates");
  if (objc_msgSend((id)v21[5], "isPeerPaymentPass"))
  {
    NPKSharedPeerPaymentAccountManager();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentBalance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v21[5], "setPeerPaymentBalance:", v9);

  }
  objc_msgSend(a1, "setPass:", v21[5]);
  objc_msgSend(a1, "setPaymentApplication:", v15[5]);
  objc_msgSend(a1, "endUpdates");

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

}

- (BOOL)npkIsPeerPayment
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "peerPaymentQuote");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)npkIsNearbyPeerPayment
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "paymentRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "peerPaymentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "hasUndeterminedRecipient");
  else
    v3 = 0;

  return v3;
}

- (BOOL)npkIsSkeletonPeerPayment
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (!objc_msgSend(a1, "npkIsPeerPayment"))
    return 0;
  objc_msgSend(a1, "paymentRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentSummaryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type") == 1;

  return v5;
}

- (BOOL)npkIsTopUp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "peerPaymentQuote");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstQuoteItemOfType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "peerPaymentQuote");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstQuoteItemOfType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)npkIsSplitPeerPayment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "peerPaymentQuote");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstQuoteItemOfType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "peerPaymentQuote");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstQuoteItemOfType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)npkIsSplitPeerPaymentWithAnotherPaymentMethod
{
  uint64_t result;

  result = objc_msgSend(a1, "npkIsSplitPeerPayment");
  if ((_DWORD)result)
    return objc_msgSend(a1, "_hasNonPeerPaymentAcceptedPasses");
  return result;
}

- (uint64_t)npkIsSplitPeerPaymentWithoutAnotherPaymentMethod
{
  uint64_t result;

  result = objc_msgSend(a1, "npkIsSplitPeerPayment");
  if ((_DWORD)result)
    return objc_msgSend(a1, "_hasNonPeerPaymentAcceptedPasses") ^ 1;
  return result;
}

- (BOOL)_hasNonPeerPaymentAcceptedPasses
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "acceptedPasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "npkFindFirstObjectMatchingCondition:", &__block_literal_global_8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (BOOL)npkIsOutgoingPeerPayment
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "npkIsPeerPayment"))
    return 0;
  objc_msgSend(a1, "peerPaymentQuote");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)npkIsCardOnFilePayment
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "paymentRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "requestType") == 1;

  return v2;
}

- (BOOL)npkIsExternalContextAuthorization
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "paymentRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "requestType") == 7;

  return v2;
}

- (BOOL)npkIsCompanionAuthForTvOS
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "paymentRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "requestorDeviceType") == 1;

  return v2;
}

@end

@implementation NPKContactlessPaymentSessionSoundsManager

- (void)didSelectPassFromField
{
  +[NPKAudioPlayer playIdentityReaderConnectionStartHaptic](NPKAudioPlayer, "playIdentityReaderConnectionStartHaptic");
}

- (void)contactlessPaymentSessionManager:(id)a3 didChangeSessionState:(id)a4
{
  void (**v4)(void *);
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void (**v16)(void *);
  void (**v17)(void *);
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a4;
  if (NPKDoesSessionStateRepresentAuthorizationTimeoutForPassRequiringAuthorization(v29))
  {
    v4 = (void (**)(void *))&__block_literal_global_27;
LABEL_6:
    v6 = v29;
    goto LABEL_7;
  }
  v5 = objc_msgSend(v29, "completionReason");
  if (v5 <= 0xA)
  {
    if (((1 << v5) & 0x770) != 0)
    {
      v4 = (void (**)(void *))&__block_literal_global_32;
      goto LABEL_6;
    }
    if (v5 == 3)
    {
      kdebug_trace();
      objc_msgSend(v29, "currentPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "paymentPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isAccessPass");

      if ((v9 & 1) != 0)
      {
        v4 = (void (**)(void *))&__block_literal_global_33;
        goto LABEL_6;
      }
      objc_msgSend(v29, "currentPass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "paymentPass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isIdentityPass");

      v16 = (void (**)(void *))&__block_literal_global_35;
      v17 = (void (**)(void *))&__block_literal_global_34;
LABEL_19:
      if (v15)
        v4 = v17;
      else
        v4 = v16;
      goto LABEL_6;
    }
  }
  v10 = objc_msgSend(v29, "failureType");
  if (v10 <= 0xB && ((1 << v10) & 0xFBE) != 0 && !objc_msgSend(v29, "userRejectedReleaseData"))
  {
    v4 = (void (**)(void *))&__block_literal_global_36;
    goto LABEL_6;
  }
  objc_msgSend(v29, "transactionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "authenticationRequested");

  if ((v12 & 1) != 0)
  {
    v4 = (void (**)(void *))&__block_literal_global_37;
    goto LABEL_6;
  }
  objc_msgSend(v29, "transactionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "transactionType") != 5)
    goto LABEL_28;
  objc_msgSend(v29, "transactionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "transactionStatus") != 1)
  {

LABEL_28:
    v6 = v29;
    goto LABEL_29;
  }
  objc_msgSend(v29, "transactionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "releaseDataStatus");

  v6 = v29;
  if (v21 != 1)
  {
LABEL_29:
    objc_msgSend(v6, "transactionContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "transactionStatus");

    if (v23 != 2)
    {
      objc_msgSend(v29, "expressTransactionStatus");
      goto LABEL_9;
    }
    objc_msgSend(v29, "currentPass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "paymentPass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isAccessPass");

    if ((v26 & 1) != 0)
    {
      v4 = (void (**)(void *))&__block_literal_global_39;
      goto LABEL_6;
    }
    objc_msgSend(v29, "currentPass");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "paymentPass");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v28, "isIdentityPass");

    v16 = (void (**)(void *))&__block_literal_global_41_0;
    v17 = (void (**)(void *))&__block_literal_global_40_0;
    goto LABEL_19;
  }
  v4 = (void (**)(void *))&__block_literal_global_38;
LABEL_7:
  if (objc_msgSend(v6, "expressTransactionStatus") != 5)
    v4[2](v4);
LABEL_9:

}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke()
{
  return +[NPKAudioPlayer playSessionTimeoutHaptic](NPKAudioPlayer, "playSessionTimeoutHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_2()
{
  return +[NPKAudioPlayer playTransactionFailureHaptic](NPKAudioPlayer, "playTransactionFailureHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_3()
{
  return +[NPKAudioPlayer playAccessScanCompleteHaptic](NPKAudioPlayer, "playAccessScanCompleteHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_4()
{
  return +[NPKAudioPlayer playIdentityReaderConnectionCompleteHaptic](NPKAudioPlayer, "playIdentityReaderConnectionCompleteHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_5()
{
  return +[NPKAudioPlayer playTransactionSuccessHaptic](NPKAudioPlayer, "playTransactionSuccessHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_6()
{
  return +[NPKAudioPlayer playTransactionFailureHaptic](NPKAudioPlayer, "playTransactionFailureHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_7()
{
  return +[NPKAudioPlayer playTransactionAuthenticationHaptic](NPKAudioPlayer, "playTransactionAuthenticationHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_8()
{
  return +[NPKAudioPlayer playIdentityReaderConnectionStartHaptic](NPKAudioPlayer, "playIdentityReaderConnectionStartHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_9()
{
  return +[NPKAudioPlayer playAccessScanCompleteHaptic](NPKAudioPlayer, "playAccessScanCompleteHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_10()
{
  return +[NPKAudioPlayer playIdentityReaderConnectionCompleteHaptic](NPKAudioPlayer, "playIdentityReaderConnectionCompleteHaptic");
}

uint64_t __100__NPKContactlessPaymentSessionSoundsManager_contactlessPaymentSessionManager_didChangeSessionState___block_invoke_11()
{
  return +[NPKAudioPlayer playTransactionSuccessHaptic](NPKAudioPlayer, "playTransactionSuccessHaptic");
}

@end

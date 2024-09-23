@implementation PKPaymentWebServiceContext(NanoPassKit)

- (id)npkPossiblyOverriddenPeerPaymentServiceURL
{
  void *v1;
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "peerPaymentServiceURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PKPeerPaymentServiceOverrideURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    pk_Payment_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v2;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Using overridden peer payment service url '%@' for registration.", (uint8_t *)&v8, 0xCu);
      }

    }
    v6 = v2;

    v1 = v6;
  }

  return v1;
}

@end

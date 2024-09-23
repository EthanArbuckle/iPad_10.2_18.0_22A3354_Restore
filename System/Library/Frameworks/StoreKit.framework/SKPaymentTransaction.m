@implementation SKPaymentTransaction

- (SKPaymentTransaction)init
{
  SKPaymentTransaction *v2;
  SKPaymentTransactionInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKPaymentTransaction;
  v2 = -[SKPaymentTransaction init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentTransactionInternal);
    internal = v2->_internal;
    v2->_internal = v3;

  }
  return v2;
}

- (SKPaymentTransaction)initWithPayment:(id)a3
{
  id v4;
  SKPaymentTransaction *v5;
  SKPaymentTransaction *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = -[SKPaymentTransaction init](self, "init");
  v6 = v5;
  if (v5)
  {
    v7 = v5->_internal;
    v8 = objc_msgSend(v4, "copy");
    v9 = (void *)v7[5];
    v7[5] = v8;

  }
  return v6;
}

- (NSArray)downloads
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 3);
}

- (SKPaymentTransaction)originalTransaction
{
  return (SKPaymentTransaction *)*((id *)self->_internal + 4);
}

- (SKPayment)payment
{
  return (SKPayment *)*((id *)self->_internal + 5);
}

- (NSDate)transactionDate
{
  return (NSDate *)*((id *)self->_internal + 7);
}

- (NSString)transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (NSData)transactionReceipt
{
  return (NSData *)*((id *)self->_internal + 9);
}

- (SKPaymentTransactionState)transactionState
{
  return *((_QWORD *)self->_internal + 10);
}

- (id)appleIDAccountDetails
{
  return *((id *)self->_internal + 11);
}

- (id)UUID
{
  return *((id *)self->_internal + 1);
}

- (BOOL)canMergeWithTransaction:(id)a3
{
  _QWORD *v4;
  char isKindOfClass;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *((id *)self->_internal + 5);
  v7 = *(id *)(v4[1] + 40);
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    if (v6 == v7)
      v9 = 1;
    else
      v9 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v9 = 0;
  }
  v10 = *((id *)self->_internal + 8);

  if (v10)
  {
    v11 = *(id *)(v4[1] + 64);

    if (v9)
    {
      if (v10 == v11)
      {
        LOBYTE(v9) = 1;
        v11 = v10;
      }
      else
      {
        LOBYTE(v9) = objc_msgSend(v10, "isEqualToString:", v11);
      }
    }
  }
  else
  {
    v11 = v8;
  }

  return v9;
}

- (NSString)matchingIdentifier
{
  id v3;

  v3 = *((id *)self->_internal + 8);
  if (!v3)
    v3 = *((id *)self->_internal + 6);
  return (NSString *)v3;
}

- (BOOL)mergeWithTransaction:(id)a3
{
  id *v4;
  id *v5;
  _QWORD *v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  v4 = (id *)a3;
  v5 = (id *)self->_internal;
  v6 = v4[1];
  v7 = (id)v6[3];
  if (v5[3] != v7)
    objc_storeStrong(v5 + 3, v7);
  v8 = v5[10];
  v9 = (id)v6[10];
  v10 = v8 != v9;
  if (v8 != v9)
    v5[10] = v9;
  v11 = (id)v6[4];
  if (v5[4] != v11)
    objc_storeStrong(v5 + 4, v11);
  v12 = (id)v6[7];
  if (v5[7] != v12)
    objc_storeStrong(v5 + 7, v12);
  v13 = (id)v6[8];
  if (v5[8] != v13)
  {
    v14 = objc_msgSend(v13, "copy");
    v15 = v5[8];
    v5[8] = (id)v14;

  }
  v16 = (id)v6[6];
  if (v5[6] != v16)
  {
    v17 = objc_msgSend(v16, "copy");
    v18 = v5[6];
    v5[6] = (id)v17;

  }
  v19 = (id)v6[9];
  if (v5[9] != v19)
    objc_storeStrong(v5 + 9, v19);
  v20 = v5[2];
  if (v20 != (id)v6[2] && (objc_msgSend(v20, "isEqualToArray:") & 1) == 0)
  {
    -[SKPaymentTransaction _setDownloads:](self, "_setDownloads:", v6[2]);
    v10 = 1;
  }

  return v10;
}

- (void)_setDownloads:(id)a3
{
  id *internal;
  id v4;
  id v7;
  uint64_t v8;
  id v9;
  id *v10;

  internal = (id *)self->_internal;
  v4 = internal[2];
  if (v4 != a3)
  {
    v10 = internal;
    v7 = a3;
    objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel__setTransaction_, 0);
    v8 = objc_msgSend(v7, "copy");

    v9 = internal[2];
    internal[2] = (id)v8;

    objc_msgSend(internal[2], "makeObjectsPerformSelector:withObject:", sel__setTransaction_, self);
  }
}

- (void)_setError:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 3);
  v7 = (id *)(internal + 24);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (void)_setOriginalTransaction:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 4);
  v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (void)_setTemporaryIdentifier:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[6];
    internal[6] = v5;

  }
}

- (void)_setTransactionDate:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 7);
  v7 = (id *)(internal + 56);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (void)_setTransactionIdentifier:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[8] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[8];
    internal[8] = v5;

  }
}

- (void)_setTransactionReceipt:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[9];
    internal[9] = v5;

  }
}

- (void)_setTransactionState:(int64_t)a3
{
  *((_QWORD *)self->_internal + 10) = a3;
}

- (void)_setAuthorizationResponse:(id)a3
{
  id v5;
  char *internal;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  internal = (char *)self->_internal;
  v8 = (id)*((_QWORD *)internal + 11);
  v7 = (id *)(internal + 88);
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(v7, a3);
    v5 = v9;
  }

}

- (NSString)_transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (SKPaymentTransaction)initWithServerTransaction:(id)a3
{
  id v4;
  SKPaymentTransaction *v5;
  SKPaymentTransaction *v6;

  v4 = a3;
  v5 = -[SKPaymentTransaction init](self, "init");
  v6 = v5;
  if (v5)
    -[SKPaymentTransaction mergeWithServerTransaction:](v5, "mergeWithServerTransaction:", v4);

  return v6;
}

- (BOOL)mergeWithServerTransaction:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  SKPaymentTransactionAuthorizationResponse *v14;
  void *v15;
  id v16;
  SKPaymentTransactionAuthorizationResponse *v17;
  void *v18;
  id *v19;
  id v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  SKPaymentTransaction *v30;
  _QWORD *internal;
  id v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SKPaymentTransaction *v40;
  SKMutablePayment *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  SKDownload *v69;
  void *v70;
  void *v71;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  SKPaymentTransaction *v77;
  void *v78;
  void *v79;
  void *v80;
  SKPaymentTransaction *v81;
  void *v82;
  id *v83;
  id v84;
  id obj;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  uint8_t v92[128];
  uint8_t buf[4];
  SKPaymentTransaction *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)self->_internal;
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong(v5 + 1, v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E220);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong(v5 + 8, v7);
    v5[10] = (id)1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E280);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong(v5 + 7, v8);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E2A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong(v5 + 9, v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E2C0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5[10] = (id)objc_msgSend(v10, "integerValue");
  v83 = v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", SKServerKeyAuthorizationResponse);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v84 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v94 = self;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received credential", buf, 0xCu);
    }
    v91 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v91);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v91;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SKPaymentTransaction mergeWithServerTransaction:].cold.1();
      v14 = [SKPaymentTransactionAuthorizationResponse alloc];
      v15 = 0;
      v16 = v13;
    }
    else
    {
      v14 = [SKPaymentTransactionAuthorizationResponse alloc];
      v15 = v12;
      v16 = 0;
    }
    v17 = -[SKPaymentTransactionAuthorizationResponse initWithAuthorizationCredential:error:](v14, "initWithAuthorizationCredential:error:", v15, v16);
    if (v17)
      -[SKPaymentTransaction _setAuthorizationResponse:](self, "_setAuthorizationResponse:", v17);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_27;
    _SKErrorFromNSError(v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SKPaymentTransaction mergeWithServerTransaction:].cold.2();
    v17 = -[SKPaymentTransactionAuthorizationResponse initWithAuthorizationCredential:error:]([SKPaymentTransactionAuthorizationResponse alloc], "initWithAuthorizationCredential:error:", 0, v13);
    -[SKPaymentTransaction _setAuthorizationResponse:](self, "_setAuthorizationResponse:", v17);
  }

  v4 = v84;
LABEL_27:
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E1A0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v19 = v83;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v18;
    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.commerce.client")))
    {
      v22 = objc_msgSend(v20, "code");

      v23 = v22 == 1000;
      v4 = v84;
      if (v23)
        goto LABEL_36;
    }
    else
    {

    }
    objc_msgSend(v20, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isEqualToString:", CFSTR("ASDErrorDomain")))
    {

      goto LABEL_39;
    }
    v25 = objc_msgSend(v20, "code");

    v23 = v25 == 1052;
    v4 = v84;
    if (!v23)
    {
LABEL_39:
      if (v83[8] || v83[7] || v83[9])
        goto LABEL_42;
      _SKErrorFromNSError(v20);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v83[3];
      v83[3] = (id)v73;

      v26 = 2;
LABEL_37:
      v83[10] = (id)v26;
LABEL_42:

      goto LABEL_43;
    }
LABEL_36:
    v26 = 4;
    goto LABEL_37;
  }
LABEL_43:
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E240);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E260);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)v27;
  objc_opt_class();
  v82 = v28;
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v30 = objc_alloc_init(SKPaymentTransaction);
    internal = v30->_internal;
    v32 = v29;
    v33 = (void *)internal[7];
    internal[7] = v32;
    v34 = internal;

    v35 = objc_msgSend(v28, "copy");
    v36 = (void *)v34[8];
    v34[8] = v35;

    v34[10] = 1;
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", SKPaymentOptionLegacyOfferName);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", SKPaymentOptionLegacyQuantity);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v81 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v38;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v40 = v30;
      v41 = objc_alloc_init(SKMutablePayment);
      v80 = v37;
      -[SKMutablePayment setProductIdentifier:](v41, "setProductIdentifier:", v37);
      -[SKMutablePayment setQuantity:](v41, "setQuantity:", objc_msgSend(v38, "integerValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", SKPaymentOptionLegacyRequestData);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SKMutablePayment setRequestData:](v41, "setRequestData:", v42);
      objc_msgSend(v83[5], "applicationUsername");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v43, "copy");
      -[SKMutablePayment setApplicationUsername:](v41, "setApplicationUsername:", v44);

      objc_msgSend(v83[5], "partnerIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v45, "copy");
      -[SKMutablePayment setPartnerIdentifier:](v41, "setPartnerIdentifier:", v46);

      objc_msgSend(v83[5], "partnerTransactionIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v47, "copy");
      -[SKMutablePayment setPartnerTransactionIdentifier:](v41, "setPartnerTransactionIdentifier:", v48);

      objc_msgSend(v83[5], "requestParameters");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v49, "copy");
      -[SKMutablePayment setRequestParameters:](v41, "setRequestParameters:", v50);

      objc_msgSend(v83[5], "paymentDiscount");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKMutablePayment setPaymentDiscount:](v41, "setPaymentDiscount:", v51);

      v52 = -[SKMutablePayment copy](v41, "copy");
      v53 = v83[5];
      v83[5] = (id)v52;

      if (v40)
      {
        v54 = v40->_internal;
        v55 = -[SKMutablePayment copy](v41, "copy");
        v56 = (void *)v54[5];
        v54[5] = v55;

      }
      v30 = v40;
      v39 = v38;
      v37 = v80;
    }
    else
    {
      v42 = v18;
    }
  }
  else
  {
    v42 = v18;
    v39 = v38;
  }
  objc_storeStrong(v83 + 4, v30);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E300);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = v57;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v58, "count"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", SKServerKeyId);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = v4;
    v61 = (void *)v59;
    objc_msgSend(v60, "objectForKeyedSubscript:", SKPaymentOptionLegacyOfferName);
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    if (v61 && v62)
    {
      v76 = v57;
      v77 = v30;
      v78 = v29;
      v79 = v39;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v75 = v58;
      obj = v58;
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v65; ++i)
          {
            if (*(_QWORD *)v88 != v66)
              objc_enumerationMutation(obj);
            v68 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
            v69 = objc_alloc_init(SKDownload);
            -[SKDownload _setDownloadID:](v69, "_setDownloadID:", v61);
            -[SKDownload _setContentIdentifier:](v69, "_setContentIdentifier:", v63);
            objc_msgSend(v68, "objectForKeyedSubscript:", 0x1E5B2E680);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKDownload _setContentLength:](v69, "_setContentLength:", v70);

            objc_msgSend(v68, "objectForKeyedSubscript:", 0x1E5B2E660);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKDownload _setVersion:](v69, "_setVersion:", v71);

            objc_msgSend(v86, "addObject:", v69);
          }
          v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
        }
        while (v65);
      }

      v19 = v83;
      v30 = v77;
      v39 = v79;
      v58 = v75;
      v57 = v76;
    }
    -[SKPaymentTransaction _setDownloads:](v81, "_setDownloads:", v86, v75, v76, v77, v78);

    v4 = v84;
  }

  return 1;
}

- (SKPaymentTransaction)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SKPaymentTransaction *v6;
  SKPaymentTransaction *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  void *v11;
  id internal;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  objc_class *v15;
  int v16;
  uint64_t v17;
  CFDictionaryRef v18;
  objc_class *v19;
  Class isa;
  CFDictionaryRef v21;
  CFDictionaryRef v22;
  CFDictionaryRef v23;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  SKPaymentTransaction *v26;
  CFDictionaryRef v27;
  _QWORD *v28;
  const __CFDictionary *v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  CFDictionaryRef v34;
  CFDictionaryRef v35;
  SKMutablePayment *v36;
  CFDictionaryRef v37;
  CFDictionaryRef v38;
  CFDictionaryRef v39;
  CFDictionaryRef v40;
  CFDictionaryRef v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const __CFDictionary *v46;
  const __CFDictionary *v47;
  id v48;
  id v49;
  const __CFDictionary *v50;
  CFDictionaryRef v51;
  _QWORD applier[4];
  id v53;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1AF43BC3C](v4) == MEMORY[0x1E0C812F8])
  {
    v8 = -[SKPaymentTransaction init](self, "init");
    v6 = v8;
    if (!v8)
      goto LABEL_5;
    self = (SKPaymentTransaction *)v8->_internal;
    objc_opt_class();
    v9 = SKXPCDictionaryCopyCFObjectWithClass(v5, "2");
    v10 = v9;
    if (v9)
    {
      SKGetErrorForData((uint64_t)v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      internal = self[1]._internal;
      self[1]._internal = v11;

    }
    objc_opt_class();
    v13 = SKXPCDictionaryCopyCFObjectWithClass(v5, "6");

    if (v13)
      objc_storeStrong(&self[3]._internal, v13);
    v14 = SKXPCDictionaryCopyCFObject(v5, "11");

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = (objc_class *)-[__CFDictionary integerValue](v14, "integerValue");
      self[5].super.isa = v15;
      if (v15 == (objc_class *)10000)
      {
        v16 = _CFExecutableLinkedOnOrAfter();
        v17 = 3;
        if (v16)
          v17 = 1;
        self[5].super.isa = (Class)v17;
      }
    }
    objc_opt_class();
    v18 = SKXPCDictionaryCopyCFObjectWithClass(v5, "13");

    if (v18)
    {
      v19 = v18;
      isa = self[4].super.isa;
      self[4].super.isa = v19;
    }
    else
    {
      objc_opt_class();
      v21 = SKXPCDictionaryCopyCFObjectWithClass(v5, "12");
      if (!v21)
      {
        v19 = 0;
        goto LABEL_21;
      }
      v19 = v21;
      isa = self[3].super.isa;
      self[3].super.isa = v19;
    }

LABEL_21:
    objc_opt_class();
    v22 = SKXPCDictionaryCopyCFObjectWithClass(v5, "8");

    if (v22)
      objc_storeStrong(&self[4]._internal, v22);
    objc_opt_class();
    v23 = SKXPCDictionaryCopyCFObjectWithClass(v5, "4");
    objc_opt_class();
    v24 = SKXPCDictionaryCopyCFObjectWithClass(v5, "5");
    v25 = v24;
    v26 = 0;
    v51 = v23;
    if (v23 && v24)
    {
      v26 = objc_alloc_init(SKPaymentTransaction);
      v27 = v25;
      v28 = v26->_internal;
      v29 = v51;
      v30 = (void *)v28[7];
      v28[7] = v29;
      v31 = v28;

      v32 = -[__CFDictionary copy](v27, "copy");
      v33 = (void *)v31[8];
      v31[8] = v32;

      v31[10] = 1;
      v25 = v27;
    }
    objc_opt_class();
    v34 = SKXPCDictionaryCopyCFObjectWithClass(v5, "3");
    v35 = SKXPCDictionaryCopyCFObject(v5, "7");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v50 = v25;
      v36 = objc_alloc_init(SKMutablePayment);
      -[SKMutablePayment setProductIdentifier:](v36, "setProductIdentifier:", v34);
      -[SKMutablePayment setQuantity:](v36, "setQuantity:", -[__CFDictionary integerValue](v35, "integerValue"));
      objc_opt_class();
      v37 = SKXPCDictionaryCopyCFObjectWithClass(v5, "9");

      if (v37)
        -[SKMutablePayment setRequestData:](v36, "setRequestData:", v37);
      objc_opt_class();
      v38 = SKXPCDictionaryCopyCFObjectWithClass(v5, "10");

      if (v38)
        -[SKMutablePayment setRequestParameters:](v36, "setRequestParameters:", v38);
      objc_opt_class();
      v39 = SKXPCDictionaryCopyCFObjectWithClass(v5, "0");

      if (v39)
        -[SKMutablePayment setApplicationUsername:](v36, "setApplicationUsername:", v39);
      objc_opt_class();
      v40 = SKXPCDictionaryCopyCFObjectWithClass(v5, "14");

      if (v40)
        -[SKMutablePayment setPartnerIdentifier:](v36, "setPartnerIdentifier:", v40);
      objc_opt_class();
      v41 = SKXPCDictionaryCopyCFObjectWithClass(v5, "15");

      if (v41)
        -[SKMutablePayment setPartnerTransactionIdentifier:](v36, "setPartnerTransactionIdentifier:", v41);
      v22 = SKXPCDictionaryCopyCFObject(v5, "16");

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[SKMutablePayment setSimulatesAskToBuyInSandbox:](v36, "setSimulatesAskToBuyInSandbox:", -[__CFDictionary BOOLValue](v22, "BOOLValue"));
      -[SKMutablePayment setIsStoreOriginated:](v36, "setIsStoreOriginated:", xpc_dictionary_get_BOOL(v5, "17"));
      -[SKPaymentTransaction getPaymentDiscountFromTransactionXPCEncoding:](v6, "getPaymentDiscountFromTransactionXPCEncoding:", v5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKMutablePayment setPaymentDiscount:](v36, "setPaymentDiscount:", v42);
      v43 = (void *)-[SKMutablePayment copy](v36, "copy");
      objc_storeStrong(&self[2]._internal, v43);
      if (v26)
        objc_storeStrong((id *)v26->_internal + 5, v43);

      v25 = v50;
    }
    objc_storeStrong((id *)&self[2].super.isa, v26);
    xpc_dictionary_get_value(v5, "1");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44 && MEMORY[0x1AF43BC3C](v44) == MEMORY[0x1E0C812C8])
    {
      v46 = v35;
      v47 = v25;
      v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __44__SKPaymentTransaction_initWithXPCEncoding___block_invoke;
      applier[3] = &unk_1E5B26800;
      v49 = v48;
      v53 = v49;
      xpc_array_apply(v45, applier);
      if (objc_msgSend(v49, "count"))
        -[SKPaymentTransaction _setDownloads:](v6, "_setDownloads:", v49);

      v25 = v47;
      v35 = v46;
    }

    goto LABEL_4;
  }
  v6 = 0;
LABEL_4:

LABEL_5:
  return v6;
}

uint64_t __44__SKPaymentTransaction_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SKDownload *v5;

  v4 = a3;
  v5 = -[SKDownload initWithXPCEncoding:]([SKDownload alloc], "initWithXPCEncoding:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  return 1;
}

- (id)getPaymentDiscountFromTransactionXPCEncoding:(id)a3
{
  id v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  void *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  SKPaymentDiscount *v10;

  v3 = a3;
  objc_opt_class();
  v4 = SKXPCDictionaryCopyCFObjectWithClass(v3, "18");
  if (v4)
  {
    objc_opt_class();
    v5 = SKXPCDictionaryCopyCFObjectWithClass(v3, "19");
    if (v5)
    {
      objc_opt_class();
      v6 = SKXPCDictionaryCopyCFObjectWithClass(v3, "20");
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
      if (v7)
      {
        objc_opt_class();
        v8 = SKXPCDictionaryCopyCFObjectWithClass(v3, "21");
        if (v8)
        {
          objc_opt_class();
          v9 = SKXPCDictionaryCopyCFObjectWithClass(v3, "22");
          if (v9)
            v10 = -[SKPaymentDiscount initWithIdentifier:keyIdentifier:nonce:signature:timestamp:]([SKPaymentDiscount alloc], "initWithIdentifier:keyIdentifier:nonce:signature:timestamp:", v4, v5, v7, v8, v9);
          else
            v10 = 0;

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  id *internal;
  id v5;
  id *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  internal = (id *)self->_internal;
  v5 = internal[5];
  v6 = internal;
  SKXPCDictionarySetCFObject(v3, "0", (__CFString *)objc_msgSend(v5, "applicationUsername"));
  SKXPCDictionarySetCFObject(v3, "1", (__CFString *)v6[2]);
  v7 = (__CFString *)SKGetDataForError((uint64_t)v6[3]);
  SKXPCDictionarySetCFObject(v3, "2", v7);
  SKXPCDictionarySetCFObject(v3, "3", (__CFString *)objc_msgSend(internal[5], "productIdentifier"));
  SKXPCDictionarySetCFObject(v3, "4", (__CFString *)objc_msgSend(v6[4], "transactionDate"));
  SKXPCDictionarySetCFObject(v3, "5", (__CFString *)objc_msgSend(v6[4], "transactionIdentifier"));
  SKXPCDictionarySetCFObject(v3, "14", (__CFString *)objc_msgSend(internal[5], "partnerIdentifier"));
  SKXPCDictionarySetCFObject(v3, "15", (__CFString *)objc_msgSend(internal[5], "partnerTransactionIdentifier"));
  SKXPCDictionarySetCFObject(v3, "6", (__CFString *)v6[7]);
  xpc_dictionary_set_int64(v3, "7", objc_msgSend(internal[5], "quantity"));
  SKXPCDictionarySetCFObject(v3, "8", (__CFString *)v6[9]);
  SKXPCDictionarySetCFObject(v3, "9", (__CFString *)objc_msgSend(internal[5], "requestData"));
  SKXPCDictionarySetCFObject(v3, "10", (__CFString *)objc_msgSend(internal[5], "requestParameters"));
  xpc_dictionary_set_int64(v3, "11", (int64_t)v6[10]);
  SKXPCDictionarySetCFObject(v3, "12", (__CFString *)v6[6]);
  SKXPCDictionarySetCFObject(v3, "13", (__CFString *)v6[8]);
  xpc_dictionary_set_BOOL(v3, "16", objc_msgSend(internal[5], "simulatesAskToBuyInSandbox"));
  xpc_dictionary_set_BOOL(v3, "17", objc_msgSend(internal[5], "isStoreOriginated"));
  objc_msgSend(internal[5], "paymentDiscount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SKXPCDictionarySetCFObject(v3, "18", (__CFString *)objc_msgSend(v8, "identifier"));
  SKXPCDictionarySetCFObject(v3, "19", (__CFString *)objc_msgSend(v8, "keyIdentifier"));
  objc_msgSend(v8, "nonce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SKXPCDictionarySetCFObject(v3, "20", (__CFString *)objc_msgSend(v10, "lowercaseString"));

  SKXPCDictionarySetCFObject(v3, "21", (__CFString *)objc_msgSend(v8, "signature"));
  SKXPCDictionarySetCFObject(v3, "22", (__CFString *)objc_msgSend(v8, "timestamp"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

- (void)mergeWithServerTransaction:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@]: Failed to unarchive auth response: %{public}@", v1, v2, v3, v4, v5);
}

- (void)mergeWithServerTransaction:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "[%{public}@]: Auth credential failed: %{public}@", v1, v2, v3, v4, v5);
}

@end

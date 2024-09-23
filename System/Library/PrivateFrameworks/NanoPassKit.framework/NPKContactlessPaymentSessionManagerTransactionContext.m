@implementation NPKContactlessPaymentSessionManagerTransactionContext

- (NPKContactlessPaymentSessionManagerTransactionContext)init
{
  NPKContactlessPaymentSessionManagerTransactionContext *v2;
  NPKContactlessPaymentSessionManagerTransactionContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKContactlessPaymentSessionManagerTransactionContext;
  v2 = -[NPKContactlessPaymentSessionManagerTransactionContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](v2, "setTransactionStatus:", 2);
  return v3;
}

- (void)updateWithConcreteTransactions:(id)a3 ephemeralTransaction:(id)a4 updatedPassTransitItems:(id)a5 paymentApplication:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  _BYTE v62[44];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__8;
  v59 = __Block_byref_object_dispose__8;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__8;
  v49 = __Block_byref_object_dispose__8;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  pk_General_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v62 = v10;
      *(_WORD *)&v62[8] = 2112;
      *(_QWORD *)&v62[10] = v11;
      *(_WORD *)&v62[18] = 2112;
      *(_QWORD *)&v62[20] = v12;
      *(_WORD *)&v62[28] = 2112;
      *(_QWORD *)&v62[30] = v13;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKPaymentView: updateWithConcreteTransactions:%@ ephemeralTransaction:%@ updatedPassTransitItems:%@ paymentApplication:%@", buf, 0x2Au);
    }

  }
  v19 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_322;
  v35[3] = &unk_24CFE99B8;
  v37 = &v51;
  v38 = &v41;
  v39 = &v45;
  v20 = v13;
  v36 = v20;
  v40 = &v55;
  v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B6780](v35);
  v22 = v21;
  if (v11)
  {
    ((void (**)(_QWORD, id))v21)[2](v21, v11);
  }
  else
  {
    v30 = v19;
    v31 = 3221225472;
    v32 = __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_335;
    v33 = &unk_24CFE99E0;
    v34 = v21;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v30);

  }
  -[NPKContactlessPaymentSessionManagerTransactionContext setPaymentTransaction:](self, "setPaymentTransaction:", v56[5], v30, v31, v32, v33);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionType:](self, "setTransactionType:", v52[3]);
  -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionDescription:](self, "setTransactionDescription:", v46[5]);
  -[NPKContactlessPaymentSessionManagerTransactionContext setDisplayablePassItems:](self, "setDisplayablePassItems:", v15);
  -[NPKContactlessPaymentSessionManagerTransactionContext setAction:](self, "setAction:", v42[3]);
  pk_Payment_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    pk_Payment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *((_DWORD *)v52 + 6);
      objc_msgSend((id)objc_opt_class(), "_NPKTransactionContextActionDescriptionForNPKTransactionContextAction:", v42[3]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v46[5];
      v29 = v56[5];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v62 = v26;
      *(_WORD *)&v62[4] = 2112;
      *(_QWORD *)&v62[6] = v15;
      *(_WORD *)&v62[14] = 2112;
      *(_QWORD *)&v62[16] = v27;
      *(_WORD *)&v62[24] = 2112;
      *(_QWORD *)&v62[26] = v28;
      *(_WORD *)&v62[34] = 2112;
      *(_QWORD *)&v62[36] = v29;
      _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Transaction complete context: got transaction type %d displayable pass Items %@ action %@ transactionDescription:\"%@\" transactions:%@", buf, 0x30u);

    }
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

}

uint64_t __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_254D39A10) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "conformsToProtocol:", &unk_254D39B78))
  {
    v3 = objc_msgSend(v2, "isCountBasedCommutePlan");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_322(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  pk_ui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_ui_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "transitType");
      v9 = objc_msgSend(v4, "transitType");
      objc_msgSend(v4, "amount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "amounts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138413314;
      v30 = v4;
      v31 = 2048;
      v32 = v8;
      v33 = 2048;
      v34 = v9;
      v35 = 2112;
      v36 = v10;
      v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPaymentView: Evaluate transaction %@ with type:%ld transitSubtype:%ld amount:%@ amounts: %@ ", (uint8_t *)&v29, 0x34u);

    }
  }
  if (objc_msgSend(v4, "transactionType") == 2)
  {
    v12 = objc_msgSend(v4, "transitType");
    if (v12 == 1025)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      if ((objc_msgSend(v4, "enRoute") & 1) == 0)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("TRANSIT_TRANSACTION_TITLE_GREEN_CAR");
      goto LABEL_14;
    }
    if (v12 == 257)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
      if ((objc_msgSend(v4, "enRoute") & 1) == 0)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKitUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("TRANSIT_TRANSACTION_TITLE_SHINKANSEN");
LABEL_14:
      objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24CFF06D8, CFSTR("NanoPassKitUI-Transit"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      goto LABEL_15;
    }
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_QWORD *)(v19 + 24))
      *(_QWORD *)(v19 + 24) = 3;
    objc_msgSend(v4, "amount");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v4, "currencyCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        objc_msgSend(*(id *)(a1 + 32), "appletCurrencyCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setCurrencyCode:", v23);

      }
    }
    objc_msgSend(v4, "amount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && (objc_msgSend(v4, "currencyCode"), (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v4, "amounts");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v26, "count"))
      {
        objc_msgSend(v4, "plans");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v24)
        if (!v28)
          goto LABEL_28;
        goto LABEL_27;
      }

      if (!v24)
      {
LABEL_27:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
LABEL_28:
        if (objc_msgSend(v4, "enRoute"))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_15;
      }
    }

    goto LABEL_27;
  }
LABEL_15:

}

uint64_t __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_335(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceToTransitTypeTransactionWithTransactionStatus:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = a3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested forceToTransitTypeTransactionWithTransactionStatus:%lu", (uint8_t *)&v8, 0xCu);
    }

  }
  if (a3 <= 5)
    -[NPKContactlessPaymentSessionManagerTransactionContext setTransactionStatus:](self, "setTransactionStatus:", qword_213772080[a3]);
}

+ (id)_NPKTransactionContextActionDescriptionForNPKTransactionContextAction:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("None");
  else
    return off_24CFE9CF8[a3 - 1];
}

- (id)description
{
  void *v3;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NPKContactlessPaymentSessionManagerTransactionContext;
  -[NPKContactlessPaymentSessionManagerTransactionContext description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NPKContactlessPaymentSessionManagerTransactionContext transactionPass](self, "transactionPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext valueAddedServicePass](self, "valueAddedServicePass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext transactionDescription](self, "transactionDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromNPKContactlessPaymentSessionTransactionType(-[NPKContactlessPaymentSessionManagerTransactionContext transactionType](self, "transactionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext transactionDescription](self, "transactionDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKContactlessPaymentSessionManagerTransactionContext displayablePassItems](self, "displayablePassItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromNPKTransactionContextStatus(-[NPKContactlessPaymentSessionManagerTransactionContext transactionStatus](self, "transactionStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (transactionPass %@ valueAddedServicePass %@ paymentMethodDescription %@ transactionType %@ transactionDescription %@ displayablePassItems %@ transactionStatus: %@)\n"), v5, v6, v7, v8, v9, v10, v11);

  -[NPKContactlessPaymentSessionManagerTransactionContext paymentBarcode](self, "paymentBarcode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (Barcode payment related: paymentBarcode %@ authentication requested %d)"), v12, -[NPKContactlessPaymentSessionManagerTransactionContext authenticationRequested](self, "authenticationRequested"));

  NSStringFromNPKDataReleaseStatus(-[NPKContactlessPaymentSessionManagerTransactionContext releaseDataStatus](self, "releaseDataStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (releaseDataStatus:%@)\n"), v13);

  objc_msgSend((id)objc_opt_class(), "_NPKTransactionContextActionDescriptionForNPKTransactionContextAction:", -[NPKContactlessPaymentSessionManagerTransactionContext action](self, "action"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (Action :%@)"), v14);
  -[NPKContactlessPaymentSessionManagerTransactionContext accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (Accessory :%@)"), v15);

  return v4;
}

- (PKPass)transactionPass
{
  return self->_transactionPass;
}

- (void)setTransactionPass:(id)a3
{
  objc_storeStrong((id *)&self->_transactionPass, a3);
}

- (PKPass)valueAddedServicePass
{
  return self->_valueAddedServicePass;
}

- (void)setValueAddedServicePass:(id)a3
{
  objc_storeStrong((id *)&self->_valueAddedServicePass, a3);
}

- (NSString)paymentMethodDescription
{
  return self->_paymentMethodDescription;
}

- (void)setPaymentMethodDescription:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodDescription, a3);
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (void)setPaymentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_paymentTransaction, a3);
}

- (unint64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(unint64_t)a3
{
  self->_transactionStatus = a3;
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDescription, a3);
}

- (NSArray)displayablePassItems
{
  return self->_displayablePassItems;
}

- (void)setDisplayablePassItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayablePassItems, a3);
}

- (NPKPaymentBarcode)paymentBarcode
{
  return self->_paymentBarcode;
}

- (void)setPaymentBarcode:(id)a3
{
  objc_storeStrong((id *)&self->_paymentBarcode, a3);
}

- (BOOL)authenticationRequested
{
  return self->_authenticationRequested;
}

- (void)setAuthenticationRequested:(BOOL)a3
{
  self->_authenticationRequested = a3;
}

- (unint64_t)releaseDataStatus
{
  return self->_releaseDataStatus;
}

- (void)setReleaseDataStatus:(unint64_t)a3
{
  self->_releaseDataStatus = a3;
}

- (STSTransaction18013Request)releaseDataRequest
{
  return self->_releaseDataRequest;
}

- (void)setReleaseDataRequest:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDataRequest, a3);
}

- (STS18013ReaderAuthInfo)readerAuthInfo
{
  return self->_readerAuthInfo;
}

- (void)setReaderAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_readerAuthInfo, a3);
}

- (PKPassTile)passTile
{
  return self->_passTile;
}

- (void)setPassTile:(id)a3
{
  objc_storeStrong((id *)&self->_passTile, a3);
}

- (PKHMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_passTile, 0);
  objc_storeStrong((id *)&self->_readerAuthInfo, 0);
  objc_storeStrong((id *)&self->_releaseDataRequest, 0);
  objc_storeStrong((id *)&self->_paymentBarcode, 0);
  objc_storeStrong((id *)&self->_displayablePassItems, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
  objc_storeStrong((id *)&self->_paymentMethodDescription, 0);
  objc_storeStrong((id *)&self->_valueAddedServicePass, 0);
  objc_storeStrong((id *)&self->_transactionPass, 0);
}

@end

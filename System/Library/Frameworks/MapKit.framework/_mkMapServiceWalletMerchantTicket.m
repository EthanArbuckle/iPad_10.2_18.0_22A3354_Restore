@implementation _mkMapServiceWalletMerchantTicket

- (_mkMapServiceWalletMerchantTicket)initWithRequest:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  _mkMapServiceWalletMerchantTicket *v8;
  _mkMapServiceWalletMerchantTicket *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  GEOMapServiceTicket *ticket;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  int v30;
  _mkMapServiceWalletMerchantTicket *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  objc_super v71;

  v6 = a3;
  v7 = a4;
  v71.receiver = self;
  v71.super_class = (Class)_mkMapServiceWalletMerchantTicket;
  v8 = -[_mkMapServiceWalletMerchantTicket init](&v71, sel_init);
  v9 = v8;
  if (v8)
  {
    v31 = v8;
    v70 = v7;
    objc_msgSend(v6, "bankMerchantInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0D272E0]);
      objc_msgSend(v6, "bankMerchantInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)objc_msgSend(v11, "initWithMKMerchantInfo:", v12);

    }
    else
    {
      v69 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantCode");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawMerchantCode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relyingPartyIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "industryCategory");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "industryCode");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentNetwork");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "terminalId");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionCurrencyCode");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v6, "transactionType");
    objc_msgSend(v6, "transactionId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warsawMerchantDomain");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warsawMerchantName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warsawMerchantId");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adamId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantId");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantDoingBizAsName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantEnhancedName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantCity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantRawCity");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantState");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantRawAddress");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantZip");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantAddress");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantRawAddress");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantCountryCode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantCleanConfidenceLevel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantAdditionalData");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "merchantCanl");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fuzzyMatched");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coarseLocationUsed");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v6, "bankTransactionType");
    v27 = objc_msgSend(v6, "bankMerchantStatus");
    objc_msgSend(v6, "bankAnonymisedUserId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "otherBankTransactionLocations");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankTransactionDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankTransactionTimestamp");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankRawMerchantCode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankIndustryCategory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankIndustryCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankTransactionCurrencyCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baaCerts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baaSignature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankEnableBrandMUIDFallback");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bankTransactionDescriptionClean");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "piiRedactionOccurred");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rotationPeriodsSinceEpoch");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = v30;
    objc_msgSend(v66, "ticketForMerchantCode:rawMerchantCode:relyingPartyIdentifier:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:terminalId:transactionCurrencyCode:transactionType:transactionId:warsawMerchantDomain:warsawMerchantName:warsawMerchantId:adamId:merchantId:merchantDoingBizAsName:merchantEnhancedName:merchantCity:merchantRawCity:merchantState:merchantRawState:merchantZip:merchantAddress:merchantRawAddress:merchantCountryCode:merchantType:merchantCleanConfidenceLevel:merchantAdditionalData:merchantCanl:fuzzyMatched:coarseLocationUsed:bankTransactionType:bankTransactionStatus:bankAnonymisedUserId:otherBankTransactionLocations:bankTransactionDescription:bankTransactionTimestamp:bankRawMerchantCode:bankIndustryCategory:bankIndustryCode:bankTransactionCurrencyCode:bankMerchantInfo:baaCerts:baaSignature:bankBrandMUIDFallbackEnabled:bankIdentifier:bankTransactionDescriptionClean:bankPIIRedactionIsApplied:bankRotationPeriodsSinceEpoch:traits:", v68, v67, v63, v65, v64, v62, v60, v61, v58,
      v59,
      v22,
      v56,
      v57,
      v54,
      v55,
      v52,
      v53,
      v50,
      v51,
      v48,
      v49,
      v46,
      v47,
      v44,
      v45,
      v43,
      v42,
      v41,
      v29,
      v40,
      v39,
      v38,
      v37,
      __PAIR64__(v27, v28),
      v36,
      v35,
      v34,
      v33,
      v32,
      v26,
      v13,
      v25,
      v69,
      v14,
      v15,
      v24,
      v16,
      v17,
      v18,
      v23,
      v70);
    v19 = objc_claimAutoreleasedReturnValue();
    v9 = v31;
    ticket = v31->_ticket;
    v31->_ticket = (GEOMapServiceTicket *)v19;

    v7 = v70;
  }

  return v9;
}

- (void)submitWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  GEOMapServiceTicket *ticket;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  ticket = self->_ticket;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71___mkMapServiceWalletMerchantTicket_submitWithCompletionQueue_handler___block_invoke;
  v11[3] = &unk_1E20DAAA8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[GEOMapServiceTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v11, 0);

}

- (void)cancel
{
  GEOMapServiceTicket *ticket;

  -[GEOMapServiceTicket cancel](self->_ticket, "cancel");
  ticket = self->_ticket;
  self->_ticket = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end

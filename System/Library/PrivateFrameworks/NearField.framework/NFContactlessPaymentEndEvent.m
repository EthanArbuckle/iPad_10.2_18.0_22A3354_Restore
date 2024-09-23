@implementation NFContactlessPaymentEndEvent

+ (BOOL)logsTransactionDetails
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LogTransactionDetails"));

  return v3;
}

- (NFContactlessPaymentEndEvent)initWithDictionary:(id)a3
{
  id v4;
  NFContactlessPaymentEndEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *readerIdentifier;
  uint64_t v12;
  NSString *transactionIdentifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDecimalNumber *amount;
  uint64_t v21;
  NSString *currency;
  uint64_t v23;
  NSData *tlv;
  void *v25;
  uint64_t v26;
  NSDictionary *felicaInfo;
  uint64_t v28;
  NSDictionary *parsedInfo;
  void *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *v33;
  uint64_t v34;
  NSDictionary *v35;
  uint64_t v36;
  objc_super v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NFContactlessPaymentEndEvent;
  v5 = -[NFContactlessPaymentEndEvent init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endPointIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_didError = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("command"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_command = objc_msgSend(v15, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v16, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_result = objc_msgSend(v17, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("informative"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_informative = objc_msgSend(v18, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("amount"));
    v19 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currency"));
    v21 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tlv"));
    v23 = objc_claimAutoreleasedReturnValue();
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v25, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("felicaInfo"));
    v26 = objc_claimAutoreleasedReturnValue();
    felicaInfo = v5->_felicaInfo;
    v5->_felicaInfo = (NSDictionary *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parsedInfo"));
    v28 = objc_claimAutoreleasedReturnValue();
    parsedInfo = v5->_parsedInfo;
    v5->_parsedInfo = (NSDictionary *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BackgroundTransaction"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_background = objc_msgSend(v30, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PairingModeBrandCode"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = v5->_parsedInfo;
      if (v32)
      {
        v33 = (NSDictionary *)-[NSDictionary mutableCopy](v32, "mutableCopy");
        -[NSDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v31, CFSTR("PairingModeBrandCode"));
        v34 = -[NSDictionary copy](v33, "copy");
        v35 = v5->_parsedInfo;
        v5->_parsedInfo = (NSDictionary *)v34;

      }
      else
      {
        v39 = CFSTR("PairingModeBrandCode");
        v40[0] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        v33 = v5->_parsedInfo;
        v5->_parsedInfo = (NSDictionary *)v36;
      }

    }
  }

  return v5;
}

- (id)description
{
  uint64_t v3;
  NSString *readerIdentifier;
  id v5;
  unsigned int type;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unsigned __int16 informative;
  int v13;
  NSDictionary *parsedInfo;
  void *v15;
  id v16;
  void *v17;
  NSString *transactionIdentifier;
  void *v19;
  void *v20;
  _BOOL4 didError;
  uint64_t status;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t command;
  uint64_t v27;
  void *v28;
  void *v29;
  const __CFString *currency;
  const __CFString *v31;
  void *v32;
  uint64_t v34;
  __CFString *v35;
  id v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  objc_super v40;

  if (self->_keyIdentifier)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("applet=%@ endpoint=%@ "), self->_appletIdentifier, self->_keyIdentifier);
  }
  else
  {
    readerIdentifier = self->_readerIdentifier;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (readerIdentifier)
      v3 = objc_msgSend(v5, "initWithFormat:", CFSTR("applet=%@ reader=%@ "), self->_appletIdentifier, self->_readerIdentifier);
    else
      v3 = objc_msgSend(v5, "initWithFormat:", CFSTR("applet=%@ "), self->_appletIdentifier, v34);
  }
  type = self->_type;
  v7 = CFSTR("UNKNOWN");
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        v7 = CFSTR("Felica");
      }
      else if (type == 61441)
      {
        v7 = CFSTR("Parsed by ATL");
      }
    }
    else if (type == 32)
    {
      v7 = CFSTR("RefundPurchase");
    }
    else if (type == 34)
    {
      v7 = CFSTR("VoidPurchase");
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        v7 = CFSTR("Purchase");
        break;
      case 1u:
        v7 = CFSTR("Cashback");
        break;
      case 2u:
        v7 = CFSTR("VoidRefund");
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        v7 = CFSTR("PurchaseWithCashback");
        break;
      default:
        if (type == 23)
          v7 = CFSTR("CashDisbursement");
        break;
    }
  }
  v8 = self->_result;
  v9 = CFSTR("UNKNOWN");
  v38 = v7;
  v39 = (void *)v3;
  if (v8 <= 0xFF)
  {
    if (self->_result)
    {
      if (v8 == 64)
      {
        v9 = CFSTR("offline/approved");
      }
      else if (v8 == 128)
      {
        v9 = CFSTR("online/pending");
      }
    }
    else
    {
      v9 = CFSTR("offline/declined");
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        v9 = CFSTR("failed/field tear");
        break;
      case 0xF001u:
        v9 = CFSTR("offline type f");
        break;
      case 0xF002u:
        v9 = CFSTR("online type f");
        break;
      case 0xF003u:
        v9 = CFSTR("express transit");
        break;
      case 0xF004u:
        v9 = CFSTR("incompatible applet");
        break;
      case 0xF005u:
        v9 = CFSTR("key not found");
        break;
      case 0xF006u:
        v9 = CFSTR("reader in pairing mode");
        break;
      case 0xF007u:
        v9 = CFSTR("no matching key");
        break;
      default:
        if (v8 == 256)
          v9 = CFSTR("failed");
        break;
    }
  }
  v10 = (void *)objc_opt_new();
  v11 = v10;
  informative = self->_informative;
  if ((informative & 1) != 0)
  {
    objc_msgSend(v10, "addObject:", CFSTR("PINRequired"));
    informative = self->_informative;
    if ((informative & 2) == 0)
    {
LABEL_43:
      if ((informative & 4) == 0)
        goto LABEL_44;
      goto LABEL_54;
    }
  }
  else if ((informative & 2) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(v11, "addObject:", CFSTR("WarningPresent"));
  informative = self->_informative;
  if ((informative & 4) == 0)
  {
LABEL_44:
    if ((informative & 8) == 0)
      goto LABEL_45;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v11, "addObject:", CFSTR("ContactIssuer"));
  informative = self->_informative;
  if ((informative & 8) == 0)
  {
LABEL_45:
    if ((informative & 0x100) == 0)
      goto LABEL_46;
LABEL_56:
    objc_msgSend(v11, "addObject:", CFSTR("EMVTransaction"));
    if ((self->_informative & 0x8000) == 0)
      goto LABEL_47;
    goto LABEL_57;
  }
LABEL_55:
  objc_msgSend(v11, "addObject:", CFSTR("PINAttemptsExceeded"));
  informative = self->_informative;
  if ((informative & 0x100) != 0)
    goto LABEL_56;
LABEL_46:
  if ((informative & 0x8000) == 0)
    goto LABEL_47;
LABEL_57:
  objc_msgSend(v11, "addObject:", CFSTR("ActionNeeded"));
LABEL_47:
  v37 = v9;
  if (!+[NFContactlessPaymentEndEvent logsTransactionDetails](NFContactlessPaymentEndEvent, "logsTransactionDetails"))
  {
LABEL_51:
    v35 = &stru_1E3B54F18;
    goto LABEL_64;
  }
  v13 = self->_type;
  if (v13 == 61441)
  {
    parsedInfo = self->_parsedInfo;
    if (!parsedInfo)
      goto LABEL_51;
LABEL_59:
    -[NSDictionary description](parsedInfo, "description");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_64;
  }
  if (v13 == 256)
  {
    parsedInfo = self->_felicaInfo;
    if (!parsedInfo)
      goto LABEL_51;
    goto LABEL_59;
  }
  v15 = v11;
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = v16;
  transactionIdentifier = self->_transactionIdentifier;
  if (self->_amount)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), self->_amount);
    v35 = (__CFString *)objc_msgSend(v17, "initWithFormat:", CFSTR("transID=%@ amount=%@ tlv=%@ "), transactionIdentifier, v19, self->_tlv);

  }
  else
  {
    v35 = (__CFString *)objc_msgSend(v16, "initWithFormat:", CFSTR("transID=%@ amount=%@ tlv=%@ "), transactionIdentifier, CFSTR("NOT_PRESENT"), self->_tlv);
  }
  v11 = v15;
LABEL_64:
  v36 = objc_alloc(MEMORY[0x1E0CB3940]);
  v40.receiver = self;
  v40.super_class = (Class)NFContactlessPaymentEndEvent;
  -[NFContactlessPaymentEndEvent description](&v40, sel_description);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  didError = self->_didError;
  status = self->_status;
  v23 = self->_type;
  v24 = self->_result;
  v25 = self->_informative;
  command = self->_command;
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v11;
  v29 = (void *)v27;
  currency = (const __CFString *)self->_currency;
  if (!currency)
    currency = CFSTR("NOT_PRESENT");
  v31 = CFSTR("YES");
  if (!didError)
    v31 = CFSTR("NO");
  v32 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("%@ { %@ didError=%@ command=0x%04x status=0x%04x type=0x%04x(%@) result=0x%04x(%@) informative=0x%04x(%@) currency=%@ %@}"), v20, v39, v31, command, status, v23, v38, v24, v37, v25, v27, currency, v35);

  return v32;
}

- (id)asDictionary
{
  unsigned int type;
  const __CFString *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  unsigned __int16 informative;
  id v10;
  void *v11;
  NSString *transactionIdentifier;
  void *v13;
  NSDictionary *v14;
  NSDictionary *felicaInfo;
  NSDictionary *v16;
  NSDictionary *parsedInfo;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *currency;
  NSDictionary *v25;
  NSDictionary *v26;
  void *v27;
  void *v28;
  __CFString *v30;
  void *v31;
  void *v32;
  NSString *readerIdentifier;
  NSString *keyIdentifier;
  NSString *appletIdentifier;
  id v36;
  const __CFString *v37;
  const __CFString *v38;

  type = self->_type;
  v4 = CFSTR("UNKNOWN");
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        v4 = CFSTR("Felica");
      }
      else if (type == 61441)
      {
        v4 = CFSTR("ATL");
      }
    }
    else if (type == 32)
    {
      v4 = CFSTR("RefundPurchase");
    }
    else if (type == 34)
    {
      v4 = CFSTR("VoidPurchase");
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        v4 = CFSTR("Purchase");
        break;
      case 1u:
        v4 = CFSTR("Cashback");
        break;
      case 2u:
        v4 = CFSTR("VoidRefund");
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        v4 = CFSTR("PurchaseWithCashback");
        break;
      default:
        if (type == 23)
          v4 = CFSTR("CashDisbursement");
        break;
    }
  }
  v5 = self->_result;
  v6 = CFSTR("UNKNOWN");
  v38 = v4;
  if (v5 <= 0xFF)
  {
    if (self->_result)
    {
      if (v5 == 64)
      {
        v6 = CFSTR("offline/approved");
      }
      else if (v5 == 128)
      {
        v6 = CFSTR("online/pending");
      }
    }
    else
    {
      v6 = CFSTR("offline/declined");
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        v6 = CFSTR("failed/field tear");
        break;
      case 0xF001u:
        v6 = CFSTR("offline type f");
        break;
      case 0xF002u:
        v6 = CFSTR("online type f");
        break;
      case 0xF003u:
        v6 = CFSTR("express transit");
        break;
      case 0xF004u:
        v6 = CFSTR("incompatible applet");
        break;
      case 0xF005u:
        v6 = CFSTR("key not found");
        break;
      case 0xF006u:
        v6 = CFSTR("reader in pairing mode");
        break;
      case 0xF007u:
        v6 = CFSTR("no matching key");
        break;
      default:
        if (v5 == 256)
          v6 = CFSTR("failed");
        break;
    }
  }
  v37 = v6;
  v7 = (void *)objc_opt_new();
  v8 = v7;
  informative = self->_informative;
  if ((informative & 1) != 0)
  {
    objc_msgSend(v7, "addObject:", CFSTR("PINRequired"));
    informative = self->_informative;
    if ((informative & 2) == 0)
    {
LABEL_38:
      if ((informative & 4) == 0)
        goto LABEL_39;
      goto LABEL_47;
    }
  }
  else if ((informative & 2) == 0)
  {
    goto LABEL_38;
  }
  objc_msgSend(v8, "addObject:", CFSTR("WarningPresent"));
  informative = self->_informative;
  if ((informative & 4) == 0)
  {
LABEL_39:
    if ((informative & 8) == 0)
      goto LABEL_40;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(v8, "addObject:", CFSTR("ContactIssuer"));
  informative = self->_informative;
  if ((informative & 8) == 0)
  {
LABEL_40:
    if ((informative & 0x100) == 0)
      goto LABEL_41;
LABEL_49:
    objc_msgSend(v8, "addObject:", CFSTR("EMVTransaction"));
    if ((self->_informative & 0x8000) == 0)
      goto LABEL_42;
    goto LABEL_50;
  }
LABEL_48:
  objc_msgSend(v8, "addObject:", CFSTR("PINAttemptsExceeded"));
  informative = self->_informative;
  if ((informative & 0x100) != 0)
    goto LABEL_49;
LABEL_41:
  if ((informative & 0x8000) == 0)
    goto LABEL_42;
LABEL_50:
  objc_msgSend(v8, "addObject:", CFSTR("ActionNeeded"));
LABEL_42:
  if (+[NFContactlessPaymentEndEvent logsTransactionDetails](NFContactlessPaymentEndEvent, "logsTransactionDetails"))
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = v10;
    transactionIdentifier = self->_transactionIdentifier;
    if (self->_amount)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), self->_amount);
      v30 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR(", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, "), transactionIdentifier, v13, self->_tlv);

    }
    else
    {
      v30 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR(", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, "), transactionIdentifier, CFSTR("NOT_PRESENT"), self->_tlv);
    }
  }
  else
  {
    v30 = &stru_1E3B54F18;
  }
  if (!self->_felicaInfo)
  {
    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    felicaInfo = self->_felicaInfo;
    self->_felicaInfo = v14;

  }
  if (!self->_parsedInfo)
  {
    v16 = (NSDictionary *)objc_opt_new();
    parsedInfo = self->_parsedInfo;
    self->_parsedInfo = v16;

  }
  v18 = objc_alloc(MEMORY[0x1E0C99D80]);
  appletIdentifier = self->_appletIdentifier;
  v36 = v18;
  readerIdentifier = self->_readerIdentifier;
  keyIdentifier = self->_keyIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_command);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_status);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_type);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_result);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_informative);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  currency = self->_currency;
  v32 = v8;
  v25 = self->_felicaInfo;
  v26 = self->_parsedInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_background);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v36, "initWithObjectsAndKeys:", appletIdentifier, CFSTR("applet"), keyIdentifier, CFSTR("endpoint"), readerIdentifier, CFSTR("reader"), v31, CFSTR("command"), v19, CFSTR("status"), v20, CFSTR("type"), v38, CFSTR("typeStr"), v21, CFSTR("result"), v37,
                  CFSTR("resultStr"),
                  v22,
                  CFSTR("informative"),
                  v23,
                  CFSTR("informativeStr"),
                  currency,
                  CFSTR("currency"),
                  v30,
                  CFSTR("details"),
                  v25,
                  CFSTR("felicaInfo"),
                  v26,
                  CFSTR("parsedInfo"),
                  v27,
                  CFSTR("background"),
                  0);

  return v28;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NFContactlessPaymentEndEvent)initWithCoder:(id)a3
{
  id v4;
  NFContactlessPaymentEndEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *readerIdentifier;
  uint64_t v12;
  NSString *transactionIdentifier;
  uint64_t v14;
  NSDecimalNumber *amount;
  uint64_t v16;
  NSString *currency;
  uint64_t v18;
  NSData *tlv;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSDictionary *felicaInfo;
  uint64_t v30;
  NSDictionary *parsedInfo;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NFContactlessPaymentEndEvent;
  v5 = -[NFContactlessPaymentEndEvent init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endPointIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v12;

    v5->_didError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didError"));
    v5->_command = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("command"));
    v5->_status = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("status"));
    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    v5->_result = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("result"));
    v5->_informative = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("informative"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v14 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v16 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tlv"));
    v18 = objc_claimAutoreleasedReturnValue();
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v18;

    v5->_background = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BackgroundTransaction"));
    v20 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = (void *)objc_msgSend(v20, "initWithObjects:", v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("felicaInfo"));
    v28 = objc_claimAutoreleasedReturnValue();
    felicaInfo = v5->_felicaInfo;
    v5->_felicaInfo = (NSDictionary *)v28;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("parsedInfo"));
    v30 = objc_claimAutoreleasedReturnValue();
    parsedInfo = v5->_parsedInfo;
    v5->_parsedInfo = (NSDictionary *)v30;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appletIdentifier;
  id v5;

  appletIdentifier = self->_appletIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("endPointIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didError, CFSTR("didError"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_command, CFSTR("command"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_result, CFSTR("result"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_informative, CFSTR("informative"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tlv, CFSTR("tlv"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_felicaInfo, CFSTR("felicaInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parsedInfo, CFSTR("parsedInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_background, CFSTR("BackgroundTransaction"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (BOOL)didError
{
  return self->_didError;
}

- (unsigned)command
{
  return self->_command;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)informative
{
  return self->_informative;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSData)tlv
{
  return self->_tlv;
}

- (NSDictionary)felicaInfo
{
  return self->_felicaInfo;
}

- (NSDictionary)parsedInfo
{
  return self->_parsedInfo;
}

- (BOOL)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedInfo, 0);
  objc_storeStrong((id *)&self->_felicaInfo, 0);
  objc_storeStrong((id *)&self->_tlv, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end

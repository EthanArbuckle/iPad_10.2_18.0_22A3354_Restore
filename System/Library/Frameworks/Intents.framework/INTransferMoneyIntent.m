@implementation INTransferMoneyIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INTransferMoneyIntent)initWithFromAccount:(INPaymentAccount *)fromAccount toAccount:(INPaymentAccount *)toAccount transactionAmount:(INPaymentAmount *)transactionAmount transactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate transactionNote:(NSString *)transactionNote
{
  INPaymentAccount *v12;
  INPaymentAccount *v13;
  INPaymentAmount *v14;
  INDateComponentsRange *v15;
  NSString *v16;
  INTransferMoneyIntent *v17;
  INTransferMoneyIntent *v18;
  objc_super v20;

  v12 = fromAccount;
  v13 = toAccount;
  v14 = transactionAmount;
  v15 = transactionScheduledDate;
  v16 = transactionNote;
  v20.receiver = self;
  v20.super_class = (Class)INTransferMoneyIntent;
  v17 = -[INIntent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[INTransferMoneyIntent setFromAccount:](v17, "setFromAccount:", v12);
    -[INTransferMoneyIntent setToAccount:](v18, "setToAccount:", v13);
    -[INTransferMoneyIntent setTransactionAmount:](v18, "setTransactionAmount:", v14);
    -[INTransferMoneyIntent setTransactionScheduledDate:](v18, "setTransactionScheduledDate:", v15);
    -[INTransferMoneyIntent setTransactionNote:](v18, "setTransactionNote:", v16);
  }

  return v18;
}

- (INPaymentAccount)fromAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromFinancialAccountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentAccount *)v4;
}

- (void)setFromAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToFinancialAccountValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFromAccount:", v5);
}

- (INPaymentAccount)toAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromFinancialAccountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentAccount *)v4;
}

- (void)setToAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToFinancialAccountValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setToAccount:", v5);
}

- (INPaymentAmount)transactionAmount
{
  void *v2;
  void *v3;
  void *v4;

  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPaymentAmountValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentAmount *)v4;
}

- (void)setTransactionAmount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPaymentAmountValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTransactionAmount:", v5);
}

- (INDateComponentsRange)transactionScheduledDate
{
  void *v2;
  void *v3;
  void *v4;

  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionScheduledDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setTransactionScheduledDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTransactionScheduledDate:", v5);
}

- (NSString)transactionNote
{
  void *v2;
  void *v3;
  void *v4;

  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setTransactionNote:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionNote:", v4);

}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
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
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("fromAccount");
  -[INTransferMoneyIntent fromAccount](self, "fromAccount");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v3;
  v16[1] = CFSTR("toAccount");
  -[INTransferMoneyIntent toAccount](self, "toAccount", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("transactionAmount");
  -[INTransferMoneyIntent transactionAmount](self, "transactionAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("transactionScheduledDate");
  -[INTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v10;
  v16[4] = CFSTR("transactionNote");
  -[INTransferMoneyIntent transactionNote](self, "transactionNote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v4)

  return v13;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  -[INTransferMoneyIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "fromAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedFinancialAccountValueFromFinancialAccountValue(v9, a3, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromAccount:", v10);

  objc_msgSend(v7, "toAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedFinancialAccountValueFromFinancialAccountValue(v11, a3, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToAccount:", v12);

  objc_msgSend(v7, "transactionAmount");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransactionAmount:", v13);

  objc_msgSend(v7, "transactionScheduledDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTransactionScheduledDate:", v15);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (id)domain
{
  return CFSTR("Payments");
}

- (id)verb
{
  return CFSTR("TransferMoney");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

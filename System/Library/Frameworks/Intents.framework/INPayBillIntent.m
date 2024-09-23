@implementation INPayBillIntent

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

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 4;
}

- (id)_categoryVerb
{
  return CFSTR("Pay");
}

- (INPayBillIntent)initWithBillPayee:(INBillPayee *)billPayee fromAccount:(INPaymentAccount *)fromAccount transactionAmount:(INPaymentAmount *)transactionAmount transactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate transactionNote:(NSString *)transactionNote billType:(INBillType)billType dueDate:(INDateComponentsRange *)dueDate
{
  INBillPayee *v15;
  INPaymentAccount *v16;
  INPaymentAmount *v17;
  INDateComponentsRange *v18;
  NSString *v19;
  INDateComponentsRange *v20;
  INPayBillIntent *v21;
  INPayBillIntent *v22;
  objc_super v24;

  v15 = billPayee;
  v16 = fromAccount;
  v17 = transactionAmount;
  v18 = transactionScheduledDate;
  v19 = transactionNote;
  v20 = dueDate;
  v24.receiver = self;
  v24.super_class = (Class)INPayBillIntent;
  v21 = -[INIntent init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    -[INPayBillIntent setBillPayee:](v21, "setBillPayee:", v15);
    -[INPayBillIntent setFromAccount:](v22, "setFromAccount:", v16);
    -[INPayBillIntent setTransactionAmount:](v22, "setTransactionAmount:", v17);
    -[INPayBillIntent setTransactionScheduledDate:](v22, "setTransactionScheduledDate:", v18);
    -[INPayBillIntent setTransactionNote:](v22, "setTransactionNote:", v19);
    -[INPayBillIntent setBillType:](v22, "setBillType:", billType);
    -[INPayBillIntent setDueDate:](v22, "setDueDate:", v20);
  }

  return v22;
}

- (INBillPayee)billPayee
{
  void *v2;
  void *v3;
  void *v4;

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "billPayee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromBillPayeeValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INBillPayee *)v4;
}

- (void)setBillPayee:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToBillPayeeValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBillPayee:", v5);
}

- (INPaymentAccount)fromAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToFinancialAccountValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFromAccount:", v5);
}

- (INPaymentAmount)transactionAmount
{
  void *v2;
  void *v3;
  void *v4;

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transactionNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setTransactionNote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTransactionNote:", v5);
}

- (INBillType)billType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INBillType v7;
  INBillType v8;

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBillType");
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "billType") - 1;
  if (v6 <= 0x15)
    v7 = v6 + 1;
  else
    v7 = INBillTypeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INBillTypeUnknown;

  return v8;
}

- (void)setBillType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 0x15)
    objc_msgSend(v4, "setHasBillType:", 0);
  else
    objc_msgSend(v4, "setBillType:");

}

- (INDateComponentsRange)dueDate
{
  void *v2;
  void *v3;
  void *v4;

  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDueDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDueDate:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  INBillType v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("billPayee");
  -[INPayBillIntent billPayee](self, "billPayee");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("fromAccount");
  -[INPayBillIntent fromAccount](self, "fromAccount");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v5;
  v25[1] = v5;
  v24[2] = CFSTR("transactionAmount");
  -[INPayBillIntent transactionAmount](self, "transactionAmount");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("transactionScheduledDate");
  -[INPayBillIntent transactionScheduledDate](self, "transactionScheduledDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v9;
  v24[4] = CFSTR("transactionNote");
  -[INPayBillIntent transactionNote](self, "transactionNote", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v12;
  v24[5] = CFSTR("billType");
  v13 = -[INPayBillIntent billType](self, "billType");
  if ((unint64_t)(v13 - 1) > 0x15)
    v14 = CFSTR("unknown");
  else
    v14 = off_1E228D0B0[v13 - 1];
  v15 = v14;
  v25[5] = v15;
  v24[6] = CFSTR("dueDate");
  -[INPayBillIntent dueDate](self, "dueDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)

  if (!v11)
  if (!v10)

  if (!v8)
  if (!v6)

  if (!v4)
  return v18;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a4;
  -[INPayBillIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "billPayee");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedBillPayeeValueFromBillPayeeValue(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBillPayee:", v10);

  objc_msgSend(v7, "fromAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedFinancialAccountValueFromFinancialAccountValue(v11, a3, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromAccount:", v12);

  objc_msgSend(v7, "transactionAmount");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransactionAmount:", v13);

  objc_msgSend(v7, "transactionScheduledDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransactionScheduledDate:", v15);

  objc_msgSend(v7, "transactionNote");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedStringFromString(v16, a3, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransactionNote:", v17);

  objc_msgSend(v7, "dueDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v18, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDueDate:", v19);
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
  return CFSTR("PayBill");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation INSearchForBillsIntent

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

  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSearchForBillsIntent)initWithBillPayee:(INBillPayee *)billPayee paymentDateRange:(INDateComponentsRange *)paymentDateRange billType:(INBillType)billType status:(INPaymentStatus)status dueDateRange:(INDateComponentsRange *)dueDateRange
{
  INBillPayee *v12;
  INDateComponentsRange *v13;
  INDateComponentsRange *v14;
  INSearchForBillsIntent *v15;
  INSearchForBillsIntent *v16;
  objc_super v18;

  v12 = billPayee;
  v13 = paymentDateRange;
  v14 = dueDateRange;
  v18.receiver = self;
  v18.super_class = (Class)INSearchForBillsIntent;
  v15 = -[INIntent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[INSearchForBillsIntent setBillPayee:](v15, "setBillPayee:", v12);
    -[INSearchForBillsIntent setPaymentDateRange:](v16, "setPaymentDateRange:", v13);
    -[INSearchForBillsIntent setBillType:](v16, "setBillType:", billType);
    -[INSearchForBillsIntent setStatus:](v16, "setStatus:", status);
    -[INSearchForBillsIntent setDueDateRange:](v16, "setDueDateRange:", v14);
  }

  return v16;
}

- (INBillPayee)billPayee
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToBillPayeeValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBillPayee:", v5);
}

- (INDateComponentsRange)paymentDateRange
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentDateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setPaymentDateRange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPaymentDateRange:", v5);
}

- (INBillType)billType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INBillType v7;
  INBillType v8;

  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBillType");
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 0x15)
    objc_msgSend(v4, "setHasBillType:", 0);
  else
    objc_msgSend(v4, "setBillType:");

}

- (INPaymentStatus)status
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INPaymentStatus v7;
  INPaymentStatus v8;

  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasStatus");
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status") - 1;
  if (v6 <= 4)
    v7 = v6 + 1;
  else
    v7 = INPaymentStatusUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INPaymentStatusUnknown;

  return v8;
}

- (void)setStatus:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 4)
    objc_msgSend(v4, "setHasStatus:", 0);
  else
    objc_msgSend(v4, "setStatus:");

}

- (INDateComponentsRange)dueDateRange
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dueDateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setDueDateRange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDueDateRange:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INBillType v7;
  __CFString *v8;
  __CFString *v9;
  INPaymentStatus v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("billPayee");
  -[INSearchForBillsIntent billPayee](self, "billPayee");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v4;
  v17[1] = CFSTR("paymentDateRange");
  -[INSearchForBillsIntent paymentDateRange](self, "paymentDateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v6;
  v17[2] = CFSTR("billType");
  v7 = -[INSearchForBillsIntent billType](self, "billType");
  if ((unint64_t)(v7 - 1) > 0x15)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E228D0B0[v7 - 1];
  v9 = v8;
  v18[2] = v9;
  v17[3] = CFSTR("status");
  v10 = -[INSearchForBillsIntent status](self, "status");
  if ((unint64_t)(v10 - 1) > 4)
    v11 = CFSTR("unknown");
  else
    v11 = *(&off_1E228A690 + v10 - 1);
  v12 = v11;
  v18[3] = v12;
  v17[4] = CFSTR("dueDateRange");
  -[INSearchForBillsIntent dueDateRange](self, "dueDateRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v5)
  if (!v3)

  return v15;
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
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  -[INSearchForBillsIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "billPayee");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedBillPayeeValueFromBillPayeeValue(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBillPayee:", v10);

  objc_msgSend(v7, "paymentDateRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPaymentDateRange:", v12);

  objc_msgSend(v7, "dueDateRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDueDateRange:", v14);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Payments");
}

- (id)verb
{
  return CFSTR("SearchForBills");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

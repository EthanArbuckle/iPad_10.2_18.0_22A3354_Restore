@implementation AMSAgeVerificationCore

+ (id)_resultForAccountVerificationExpirationTimestamp:(id)a3 withBagControlledAgeVerificationRequired:(id)a4 bagWarningThresholdDays:(id)a5 at:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSAgeVerificationRequiredResult *v14;
  char v15;
  AMSAgeVerificationRequiredResult *v16;
  void *v17;
  AMSAgeVerificationRequiredResult *v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = objc_alloc_init(AMSAgeVerificationRequiredResult);
  -[AMSAgeVerificationRequiredResult setRequiredType:](v14, "setRequiredType:", 1);
  v15 = objc_msgSend(v13, "BOOLValue");

  if ((v15 & 1) == 0)
    goto LABEL_4;
  if (objc_msgSend(a1, "_isAgeVerificationNeededForExpiration:at:", v10, v12))
  {
    -[AMSAgeVerificationRequiredResult setRequiredType:](v14, "setRequiredType:", 2);
LABEL_4:
    v16 = v14;
    goto LABEL_8;
  }
  objc_msgSend((id)objc_opt_class(), "_timestampForWarningThresholdDays:addedTo:", v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_isAgeVerificationNeededForExpiration:at:", v10, v17))
    -[AMSAgeVerificationRequiredResult setRequiredType:](v14, "setRequiredType:", 3);
  v18 = v14;

LABEL_8:
  return v14;
}

+ (id)_timestampForWarningThresholdDays:(id)a3 addedTo:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (a3)
    v6 = objc_msgSend(a3, "integerValue");
  else
    v6 = 30;
  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setDay:", v6);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)_isAgeVerificationNeededForExpiration:(id)a3 at:(id)a4
{
  return objc_msgSend(a1, "_isTimestamp:validAsOf:", a3, a4) ^ 1;
}

+ (BOOL)_isTimestamp:(id)a3 validAsOf:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a4;
  objc_msgSend(a1, "_momentOfExpiryFrom:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend(v6, "compare:", v7) == -1;
  else
    v8 = 0;

  return v8;
}

+ (id)_momentOfExpiryFrom:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(objc_msgSend(v3, "longLongValue") / 1000));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_ageVerificationPresentationResultFromVerificationResult:(id)a3
{
  id v3;
  AMSPromiseResult *v4;
  AMSAgeVerificationPresentationResult *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(AMSPromiseResult);
  v5 = objc_alloc_init(AMSAgeVerificationPresentationResult);
  AMSError(6, CFSTR("Age verification screen dismissed without successful age verification"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AMSError(0, CFSTR("Invalid age verification result"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "requiredType");

  if (v8 == 1 || v8 == 3)
  {
    -[AMSAgeVerificationPresentationResult setSuccessType:](v5, "setSuccessType:", 1);
    -[AMSPromiseResult setResult:](v4, "setResult:", v5);
  }
  else
  {
    if (v8 == 2)
      v9 = v6;
    else
      v9 = v7;
    -[AMSPromiseResult setError:](v4, "setError:", v9);
  }

  return v4;
}

@end

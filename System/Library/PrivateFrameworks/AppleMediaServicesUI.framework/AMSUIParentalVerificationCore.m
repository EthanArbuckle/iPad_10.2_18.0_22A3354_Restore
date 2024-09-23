@implementation AMSUIParentalVerificationCore

+ (id)_tokenFromObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6 && !objc_msgSend(v6, "integerValue"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paymentToken"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v8;
      else
        v7 = 0;

      if (v7)
        v9 = v7;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_tokenResultFromTokenString:(id)a3
{
  void *v3;
  AMSPaymentVerificationTokenResult *v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AMSPaymentVerificationTokenResult initWithTokenData:]([AMSPaymentVerificationTokenResult alloc], "initWithTokenData:", v3);

  return v4;
}

+ (BOOL)_isCardOnFileOnStack:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6 && !objc_msgSend(v6, "integerValue"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aurumOnStack"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;

      if (v9)
        v7 = objc_msgSend(v9, "BOOLValue");
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_allowedAccountParameters:(id)a3
{
  void *v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__AMSUIParentalVerificationCore__allowedAccountParameters___block_invoke;
  v5[3] = &unk_24CB50440;
  v6 = &unk_24CB8C970;
  objc_msgSend(a3, "ams_filterUsingTest:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __59__AMSUIParentalVerificationCore__allowedAccountParameters___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (id)_minimumAgeFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adultMinimumAge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adultMinimumAge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8 && (v9 = objc_msgSend(v8, "integerValue"), v9 >= 1))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

@end

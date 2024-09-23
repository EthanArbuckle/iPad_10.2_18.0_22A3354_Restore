@implementation SUUIGiftValidationResponse

- (SUUIGiftValidationResponse)initWithValidationDictionary:(id)a3
{
  id v4;
  SUUIGiftValidationResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *totalGiftAmountString;
  void *v11;
  uint64_t v12;
  void *giftKey;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *errorString;
  uint64_t v18;
  NSString *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUUIGiftValidationResponse;
  v5 = -[SUUIGiftValidationResponse init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "integerValue");
      v5->_valid = v7 == 0;
      if (!v7)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("amountFormatted"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(v4, "objectForKey:", CFSTR("totalPriceFormatted"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_msgSend(v8, "copy");
          totalGiftAmountString = v5->_totalGiftAmountString;
          v5->_totalGiftAmountString = (NSString *)v9;

        }
        objc_msgSend(v4, "objectForKey:", CFSTR("giftKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_22;
        v12 = objc_msgSend(v11, "copy");
        giftKey = v5->_giftKey;
        v5->_giftKey = (NSString *)v12;
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      v5->_valid = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("errorEntries"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("localizedMessage"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_msgSend(v15, "copy");
          errorString = v5->_errorString;
          v5->_errorString = (NSString *)v16;

        }
      }

    }
    if (v5->_errorString)
      goto LABEL_22;
    objc_msgSend(v4, "objectForKey:", CFSTR("userPresentableErrorMessage"));
    giftKey = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(giftKey, "copy");
      v19 = v5->_errorString;
      v5->_errorString = (NSString *)v18;

    }
    goto LABEL_21;
  }
LABEL_23:

  return v5;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (NSString)giftKey
{
  return self->_giftKey;
}

- (NSString)totalGiftAmountString
{
  return self->_totalGiftAmountString;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalGiftAmountString, 0);
  objc_storeStrong((id *)&self->_giftKey, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
}

@end

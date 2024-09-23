@implementation SUUIItemOffer

- (SUUIItemOffer)initWithButtonText:(id)a3
{
  id v4;
  SUUIItemOffer *v5;
  uint64_t v6;
  NSString *buttonText;
  NSString *confirmationText;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIItemOffer;
  v5 = -[SUUIItemOffer init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    buttonText = v5->_buttonText;
    v5->_buttonText = (NSString *)v6;

    confirmationText = v5->_confirmationText;
    v5->_confirmationText = (NSString *)&stru_2511FF0C8;

  }
  return v5;
}

- (SUUIItemOffer)initWithLookupDictionary:(id)a3
{
  id v4;
  SUUIItemOffer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  float price;
  void *v14;
  uint64_t v15;
  NSString *buttonText;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *offerTypeString;
  void *v23;
  uint64_t v24;
  NSString *variantIdentifier;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUUIItemOffer;
  v5 = -[SUUIItemOffer init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("buyParams"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("action-params"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_actionParameters, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("actionText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("medium"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "uppercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      v6 = v8;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("priceFormatted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("button_text"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    objc_msgSend(v4, "objectForKey:", CFSTR("price"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      v5->_price = price;
    }
    else
    {
      price = v5->_price;
    }
    v28 = v9;
    if (price == 0.0)
    {
      if (v9)
        v14 = v9;
      else
        v14 = v11;
      v15 = objc_msgSend(v14, "copy", v9, v30);
      buttonText = v5->_buttonText;
      v5->_buttonText = (NSString *)v15;
    }
    else
    {
      objc_storeStrong((id *)&v5->_buttonText, v11);
      v17 = v9;
      buttonText = v5->_confirmationText;
      v5->_confirmationText = v17;
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("assets"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("assetFlavors"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUUIItemOffer _setFileSizeWithAssets:](v5, "_setFileSizeWithAssets:", v18);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SUUIItemOffer _setFileSizeWithFlavors:](v5, "_setFileSizeWithFlavors:", v19);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("type"), v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "copy");
      offerTypeString = v5->_offerTypeString;
      v5->_offerTypeString = (NSString *)v21;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("variant"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = objc_msgSend(v23, "copy");
      variantIdentifier = v5->_variantIdentifier;
      v5->_variantIdentifier = (NSString *)v24;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("shouldEnableMessagesExtension"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_shouldEnableMessagesExtension = objc_msgSend(v26, "BOOLValue");
    }

  }
  return v5;
}

- (SUUIItemOffer)initWithOfferDictionary:(id)a3
{
  id v4;
  SUUIItemOffer *v5;
  void *v6;
  uint64_t v7;
  NSString *actionParameters;
  void *v9;
  uint64_t v10;
  NSString *buttonText;
  void *v12;
  uint64_t v13;
  NSString *confirmationText;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIItemOffer;
  v5 = -[SUUIItemOffer init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("action-params"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      actionParameters = v5->_actionParameters;
      v5->_actionParameters = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("button_text"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      buttonText = v5->_buttonText;
      v5->_buttonText = (NSString *)v10;

      v5->_price = (float)(-[NSString isEqualToString:](v5->_buttonText, "isEqualToString:", CFSTR("FREE")) ^ 1);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("confirm-text"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "copy");
      confirmationText = v5->_confirmationText;
      v5->_confirmationText = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("assetFlavors"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUIItemOffer _setFileSizeWithFlavors:](v5, "_setFileSizeWithFlavors:", v15);

  }
  return v5;
}

- (SUUIItemOffer)initWithRedownloadToken:(id)a3
{
  id v4;
  SUUIItemOffer *v5;
  uint64_t v6;
  NSString *actionParameters;
  NSString *buttonText;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v5 = 0;
    goto LABEL_5;
  }
  v5 = -[SUUIItemOffer init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actionParameters = v5->_actionParameters;
    v5->_actionParameters = (NSString *)v6;

    buttonText = v5->_buttonText;
    v5->_buttonText = (NSString *)CFSTR("FREE");

    self = (SUUIItemOffer *)v5->_confirmationText;
    v5->_confirmationText = (NSString *)CFSTR("INSTALL APP");
LABEL_5:

  }
  return v5;
}

- (NSString)fileSizeText
{
  NSString *fileSizeText;
  NSString *v4;
  NSString *v5;

  fileSizeText = self->_fileSizeText;
  if (!fileSizeText)
  {
    CPFSSizeStrings();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fileSizeText;
    self->_fileSizeText = v4;

    fileSizeText = self->_fileSizeText;
  }
  return fileSizeText;
}

- (NSDictionary)lookupDictionary
{
  void *v3;
  void *v4;
  NSString *actionParameters;
  void *v6;
  void *v7;
  NSString *buttonText;
  NSString *offerTypeString;
  NSString *variantIdentifier;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actionParameters = self->_actionParameters;
  if (actionParameters)
    objc_msgSend(v3, "setObject:forKey:", actionParameters, CFSTR("buyParams"));
  if (self->_price > 0.00000011921)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("price"));

  }
  if (self->_confirmationText)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", self->_confirmationText, CFSTR("medium"), 0);
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("actionText"));

  }
  buttonText = self->_buttonText;
  if (buttonText)
    objc_msgSend(v4, "setObject:forKey:", buttonText, CFSTR("priceFormatted"));
  offerTypeString = self->_offerTypeString;
  if (offerTypeString)
    objc_msgSend(v4, "setObject:forKey:", offerTypeString, CFSTR("type"));
  variantIdentifier = self->_variantIdentifier;
  if (variantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", variantIdentifier, CFSTR("variant"));
  if (self->_shouldEnableMessagesExtension)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("shouldEnableMessagesExtension"));

  }
  return (NSDictionary *)v4;
}

- (int64_t)offerType
{
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("rent")))
    return 3;
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("preorder")))
    return 2;
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("complete")))
    return 1;
  if (-[NSString isEqualToString:](self->_offerTypeString, "isEqualToString:", CFSTR("get")))
    return 4;
  return 0;
}

- (void)_addActionParameterWithName:(id)a3 value:(id)a4
{
  NSString *actionParameters;
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  NSString *v12;

  actionParameters = self->_actionParameters;
  if (actionParameters)
  {
    v7 = a4;
    v8 = a3;
    -[NSString stringByAppendingFormat:](actionParameters, "stringByAppendingFormat:", CFSTR("&%@=%@"), v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (objc_class *)MEMORY[0x24BDD17C8];
    v7 = a4;
    v8 = a3;
    v9 = objc_msgSend([v10 alloc], "initWithFormat:", CFSTR("%@=%@"), v8, v7);
  }
  v11 = (NSString *)v9;

  v12 = self->_actionParameters;
  self->_actionParameters = v11;

}

- (void)_setFileSizeWithDeviceSizes:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int64_t v8;
  NSString *fileSizeText;
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thinnedApplicationVariantIdentifier");
  v11[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compatibleProductType");
  v5 = 0;
  v11[1] = (id)objc_claimAutoreleasedReturnValue();
  v11[2] = CFSTR("universal");
  while (1)
  {
    v6 = (id)v11[v5];
    if (v6)
      break;
LABEL_5:

    if (++v5 == 3)
      goto LABEL_8;
  }
  objc_msgSend(v10, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v7, "longLongValue");
  fileSizeText = self->_fileSizeText;
  self->_fileSize = v8;
  self->_fileSizeText = 0;

LABEL_8:
}

- (SUUIItemOffer)initWithCacheRepresentation:(id)a3
{
  id v4;
  SUUIItemOffer *v5;
  void *v6;
  uint64_t v7;
  NSString *actionParameters;
  void *v9;
  uint64_t v10;
  NSString *buttonText;
  void *v12;
  uint64_t v13;
  NSString *confirmationText;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *fileSizeText;
  void *v19;
  float v20;
  objc_super v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)SUUIItemOffer;
    v5 = -[SUUIItemOffer init](&v22, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("action-params"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        actionParameters = v5->_actionParameters;
        v5->_actionParameters = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("button_text"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        buttonText = v5->_buttonText;
        v5->_buttonText = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("confirm-text"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        confirmationText = v5->_confirmationText;
        v5->_confirmationText = (NSString *)v13;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("fileSize"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_fileSize = objc_msgSend(v15, "longLongValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("fileSizeText"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "copy");
        fileSizeText = v5->_fileSizeText;
        v5->_fileSizeText = (NSString *)v17;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("price"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v19, "floatValue");
        v5->_price = v20;
      }

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSString *actionParameters;
  NSString *buttonText;
  NSString *confirmationText;
  NSString *fileSizeText;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_fileSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("fileSize"));

  *(float *)&v5 = self->_price;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("price"));

  actionParameters = self->_actionParameters;
  if (actionParameters)
    objc_msgSend(v3, "setObject:forKey:", actionParameters, CFSTR("action-params"));
  buttonText = self->_buttonText;
  if (buttonText)
    objc_msgSend(v3, "setObject:forKey:", buttonText, CFSTR("button_text"));
  confirmationText = self->_confirmationText;
  if (confirmationText)
    objc_msgSend(v3, "setObject:forKey:", confirmationText, CFSTR("confirm-text"));
  fileSizeText = self->_fileSizeText;
  if (fileSizeText)
    objc_msgSend(v3, "setObject:forKey:", fileSizeText, CFSTR("fileSizeText"));
  return (NSMutableDictionary *)v3;
}

- (void)_setFileSizeWithAssets:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "count");
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("size"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->_fileSize = objc_msgSend(v7, "longLongValue");

    }
    v5 = v8;
  }

}

- (void)_setFileSizeWithFlavors:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *fileSizeText;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "count");
  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("fileSize"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        self->_fileSize = objc_msgSend(v7, "longLongValue");
      objc_msgSend(v6, "objectForKey:", CFSTR("fileSizeText"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (NSString *)objc_msgSend(v8, "copy");
        fileSizeText = self->_fileSizeText;
        self->_fileSizeText = v9;

      }
    }

    v5 = v11;
  }

}

- (NSString)actionParameters
{
  return self->_actionParameters;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (float)price
{
  return self->_price;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)shouldEnableMessagesExtension
{
  return self->_shouldEnableMessagesExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_offerTypeString, 0);
  objc_storeStrong((id *)&self->_fileSizeText, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_actionParameters, 0);
}

@end

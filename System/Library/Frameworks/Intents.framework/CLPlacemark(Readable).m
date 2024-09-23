@implementation CLPlacemark(Readable)

- (id)_intents_defaultReadableDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id CNPostalAddressFormatterClass;
  void *v8;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "formattedAddressLines");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(a1, "formattedAddressLines");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CNPostalAddressFormatterClass = getCNPostalAddressFormatterClass();
      objc_msgSend(a1, "postalAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CNPostalAddressFormatterClass, "singleLineStringFromPostalAddress:addCountryName:", v8, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id CNPostalAddressFormatterClass;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_msgSend(v7, "type");
    if (v8 == 2)
    {
      objc_msgSend(a1, "locality");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v8 == 1)
    {
      objc_msgSend(a1, "formattedAddressLines");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        objc_msgSend(a1, "formattedAddressLines");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        CNPostalAddressFormatterClass = getCNPostalAddressFormatterClass();
        objc_msgSend(a1, "postalAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CNPostalAddressFormatterClass, "singleLineStringFromPostalAddress:addCountryName:", v16, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_14;
    }
    v9 = v7;
    if (!v8)
    {
      objc_msgSend(a1, "_intents_defaultReadableDescription");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v10;
LABEL_14:
      v9 = v7;
      goto LABEL_15;
    }
  }
  else
  {

    v9 = 0;
  }
  objc_msgSend(a1, "_intents_defaultReadableDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v11;
}

@end

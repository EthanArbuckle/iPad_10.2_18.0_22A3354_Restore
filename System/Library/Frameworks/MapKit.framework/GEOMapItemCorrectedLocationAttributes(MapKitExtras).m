@implementation GEOMapItemCorrectedLocationAttributes(MapKitExtras)

- (id)_formattedPostalAddress
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(a1, "correctedAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "structuredAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C97378]);
    if (objc_msgSend(v3, "hasFullThoroughfare"))
    {
      objc_msgSend(v3, "fullThoroughfare");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      objc_msgSend(a1, "correctedAddressSecondaryStreetLine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v10);

      }
      v11 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v4, "setStreet:", v11);

    }
    if (objc_msgSend(v3, "hasLocality"))
    {
      objc_msgSend(v3, "locality");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCity:", v12);

    }
    if (objc_msgSend(v3, "hasAdministrativeArea"))
    {
      objc_msgSend(v3, "administrativeArea");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setState:", v13);

    }
    if (objc_msgSend(v3, "hasPostCode"))
    {
      objc_msgSend(v3, "postCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPostalCode:", v14);

    }
    if (objc_msgSend(v3, "hasCountry"))
    {
      objc_msgSend(v3, "country");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCountry:", v15);

    }
    if (objc_msgSend(v3, "hasCountryCode"))
    {
      objc_msgSend(v3, "countryCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setISOCountryCode:", v16);

    }
    objc_msgSend(MEMORY[0x1E0C973B0], "stringFromPostalAddress:style:", v4, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_addressFormattedAsName
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "correctedAddress");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formattedAddressLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_addressFormattedAsSinglelineAddress
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "correctedAddress");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formattedAddressLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_addressFormattedAsShortenedAddress
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "correctedAddress");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formattedAddressLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

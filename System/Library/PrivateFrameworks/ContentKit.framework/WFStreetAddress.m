@implementation WFStreetAddress

- (WFStreetAddress)initWithPostalAddress:(id)a3 placemark:(id)a4 formattedAddress:(id)a5 label:(id)a6
{
  WFStreetAddress *v6;
  id v10;
  id v11;
  id v12;
  WFStreetAddress *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFStreetAddress *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = (WFStreetAddress *)a3;
  if (a3)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = v6;
    -[WFStreetAddress street](v13, "street");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress subLocality](v13, "subLocality");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress city](v13, "city");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress subAdministrativeArea](v13, "subAdministrativeArea");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress state](v13, "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress postalCode](v13, "postalCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress country](v13, "country");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress ISOCountryCode](v13, "ISOCountryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[WFStreetAddress initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:placemark:formattedAddress:label:](self, "initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:placemark:formattedAddress:label:", v23, v22, v14, v15, v16, v20, v21, v17, v12, v11, v10);
    self = v18;

    v6 = self;
  }

  return v6;
}

- (WFStreetAddress)initWithStreet:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10 placemark:(id)a11 formattedAddress:(id)a12 label:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  WFStreetAddress *v27;
  uint64_t v28;
  NSString *street;
  uint64_t v30;
  NSString *subLocality;
  uint64_t v32;
  NSString *city;
  uint64_t v34;
  NSString *subAdministrativeArea;
  uint64_t v36;
  NSString *state;
  uint64_t v38;
  NSString *postalCode;
  uint64_t v40;
  NSString *country;
  uint64_t v42;
  NSString *isoCountryCode;
  uint64_t v44;
  CLPlacemark *placemark;
  uint64_t v46;
  NSString *addressString;
  uint64_t v48;
  NSString *label;
  WFStreetAddress *v50;
  id v53;
  id v54;

  v18 = a3;
  v19 = a4;
  v54 = a5;
  v53 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = -[WFStreetAddress init](self, "init");
  if (v27)
  {
    v28 = objc_msgSend(v18, "copy");
    street = v27->_street;
    v27->_street = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    subLocality = v27->_subLocality;
    v27->_subLocality = (NSString *)v30;

    v32 = objc_msgSend(v54, "copy");
    city = v27->_city;
    v27->_city = (NSString *)v32;

    v34 = objc_msgSend(v53, "copy");
    subAdministrativeArea = v27->_subAdministrativeArea;
    v27->_subAdministrativeArea = (NSString *)v34;

    v36 = objc_msgSend(v20, "copy");
    state = v27->_state;
    v27->_state = (NSString *)v36;

    v38 = objc_msgSend(v21, "copy");
    postalCode = v27->_postalCode;
    v27->_postalCode = (NSString *)v38;

    v40 = objc_msgSend(v22, "copy");
    country = v27->_country;
    v27->_country = (NSString *)v40;

    v42 = objc_msgSend(v23, "copy");
    isoCountryCode = v27->_isoCountryCode;
    v27->_isoCountryCode = (NSString *)v42;

    v44 = objc_msgSend(v24, "copy");
    placemark = v27->_placemark;
    v27->_placemark = (CLPlacemark *)v44;

    v46 = objc_msgSend(v25, "copy");
    addressString = v27->_addressString;
    v27->_addressString = (NSString *)v46;

    v48 = objc_msgSend(v26, "copy");
    label = v27->_label;
    v27->_label = (NSString *)v48;

    v50 = v27;
  }

  return v27;
}

- (WFStreetAddress)streetAddressWithLabel:(id)a3
{
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
  void *v15;
  id v16;
  void *v17;

  v4 = a3;
  v16 = objc_alloc((Class)objc_opt_class());
  -[WFStreetAddress street](self, "street");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress subLocality](self, "subLocality");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress subAdministrativeArea](self, "subAdministrativeArea");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress postalCode](self, "postalCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress country](self, "country");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress isoCountryCode](self, "isoCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress placemark](self, "placemark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStreetAddress addressString](self, "addressString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v16, "initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:placemark:formattedAddress:label:", v17, v15, v5, v6, v7, v8, v9, v10, v11, v12, v4);

  return (WFStreetAddress *)v13;
}

- (CNPostalAddress)postalAddress
{
  CNPostalAddress *postalAddress;
  void *v4;
  id v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CNPostalAddress *v23;
  CNPostalAddress *v24;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  postalAddress = self->_postalAddress;
  if (!postalAddress)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v4 = (void *)getCNMutablePostalAddressClass_softClass;
    v30 = getCNMutablePostalAddressClass_softClass;
    if (!getCNMutablePostalAddressClass_softClass)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __getCNMutablePostalAddressClass_block_invoke;
      v26[3] = &unk_24C4E3118;
      v26[4] = &v27;
      __getCNMutablePostalAddressClass_block_invoke((uint64_t)v26);
      v4 = (void *)v28[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v27, 8);
    v6 = (void *)objc_opt_new();
    -[WFStreetAddress street](self, "street");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFStreetAddress street](self, "street");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setStreet:", v8);

    }
    -[WFStreetAddress subLocality](self, "subLocality");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WFStreetAddress subLocality](self, "subLocality");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSubLocality:", v10);

    }
    -[WFStreetAddress city](self, "city");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFStreetAddress city](self, "city");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCity:", v12);

    }
    -[WFStreetAddress subAdministrativeArea](self, "subAdministrativeArea");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[WFStreetAddress subAdministrativeArea](self, "subAdministrativeArea");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSubAdministrativeArea:", v14);

    }
    -[WFStreetAddress state](self, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WFStreetAddress state](self, "state");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setState:", v16);

    }
    -[WFStreetAddress postalCode](self, "postalCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[WFStreetAddress postalCode](self, "postalCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPostalCode:", v18);

    }
    -[WFStreetAddress country](self, "country");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[WFStreetAddress country](self, "country");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCountry:", v20);

    }
    -[WFStreetAddress isoCountryCode](self, "isoCountryCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[WFStreetAddress isoCountryCode](self, "isoCountryCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setISOCountryCode:", v22);

    }
    v23 = (CNPostalAddress *)objc_msgSend(v6, "copy");
    v24 = self->_postalAddress;
    self->_postalAddress = v23;

    postalAddress = self->_postalAddress;
  }
  return postalAddress;
}

- (NSString)shortAddressString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WFStreetAddress street](self, "street");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFStreetAddress city](self, "city");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[WFStreetAddress state](self, "state");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[WFStreetAddress country](self, "country");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

    }
  }

  return (NSString *)v5;
}

- (NSString)street
{
  NSString *street;
  NSString *v3;
  void *v4;

  street = self->_street;
  if (street)
  {
    v3 = street;
  }
  else
  {
    -[WFStreetAddress placemark](self, "placemark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)addressString
{
  NSString *addressString;
  NSString **p_addressString;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  p_addressString = &self->_addressString;
  addressString = self->_addressString;
  if (!addressString)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v5 = (void *)getCNPostalAddressFormatterClass_softClass;
    v25 = getCNPostalAddressFormatterClass_softClass;
    if (!getCNPostalAddressFormatterClass_softClass)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __getCNPostalAddressFormatterClass_block_invoke;
      v21[3] = &unk_24C4E3118;
      v21[4] = &v22;
      __getCNPostalAddressFormatterClass_block_invoke((uint64_t)v21);
      v5 = (void *)v23[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v22, 8);
    v7 = (void *)objc_opt_new();
    -[WFStreetAddress placemark](self, "placemark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFStreetAddress postalAddress](self, "postalAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "street");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      -[WFStreetAddress placemark](self, "placemark");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[WFStreetAddress postalAddress](self, "postalAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributedStringFromPostalAddress:name:organization:attributes:", v14, v12, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[__CFString rangeOfCharacterFromSet:](v16, "rangeOfCharacterFromSet:", v17);

    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      v19 = &stru_24C4E3948;
    else
      v19 = v16;
    objc_storeStrong((id *)p_addressString, v19);

    addressString = self->_addressString;
  }
  return addressString;
}

- (NSString)wfName
{
  void *v2;
  void *v3;
  void *v4;

  -[WFStreetAddress addressString](self, "addressString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localizedLabel
{
  void *v2;
  void *v3;

  -[WFStreetAddress label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[WFContactLabeledValue localizedStringForLabel:](WFContactLabeledValue, "localizedStringForLabel:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFStreetAddress *v4;
  NSString *street;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = (WFStreetAddress *)a3;
  if (v4 == self)
  {
    v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((street = self->_street, street == v4->_street) || -[NSString isEqualToString:](street, "isEqualToString:")))
    {
      -[WFStreetAddress subLocality](self, "subLocality");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFStreetAddress subLocality](v4, "subLocality");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7 || objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[WFStreetAddress city](self, "city");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFStreetAddress city](v4, "city");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9 || objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[WFStreetAddress subAdministrativeArea](self, "subAdministrativeArea");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFStreetAddress subAdministrativeArea](v4, "subAdministrativeArea");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == v11 || objc_msgSend(v10, "isEqualToString:", v11))
          {
            -[WFStreetAddress state](self, "state");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFStreetAddress state](v4, "state");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 == v13 || objc_msgSend(v12, "isEqualToString:", v13))
            {
              v34 = v10;
              v35 = v13;
              -[WFStreetAddress postalCode](self, "postalCode");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFStreetAddress postalCode](v4, "postalCode");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14 == v15 || objc_msgSend(v14, "isEqualToString:", v15))
              {
                v32 = v11;
                v33 = v15;
                -[WFStreetAddress country](self, "country");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFStreetAddress country](v4, "country");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v16;
                if (v16 == v17 || objc_msgSend(v16, "isEqualToString:", v17))
                {
                  v30 = v17;
                  -[WFStreetAddress isoCountryCode](self, "isoCountryCode");
                  v18 = objc_claimAutoreleasedReturnValue();
                  -[WFStreetAddress isoCountryCode](v4, "isoCountryCode");
                  v19 = objc_claimAutoreleasedReturnValue();
                  v20 = (void *)v18;
                  v21 = (void *)v19;
                  if (v20 == (void *)v19
                    || (v22 = v20, v23 = objc_msgSend(v20, "isEqualToString:", v19), v20 = v22, v23))
                  {
                    v22 = v20;
                    -[WFStreetAddress label](self, "label", v21, v12);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFStreetAddress label](v4, "label");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v24 == v25)
                      v26 = 1;
                    else
                      v26 = objc_msgSend(v24, "isEqualToString:", v25);

                    v21 = v28;
                    v12 = v29;
                  }
                  else
                  {
                    v26 = 0;
                  }

                  v17 = v30;
                }
                else
                {
                  v26 = 0;
                }

                v11 = v32;
                v15 = v33;
              }
              else
              {
                v26 = 0;
              }

              v10 = v34;
              v13 = v35;
            }
            else
            {
              v26 = 0;
            }

          }
          else
          {
            v26 = 0;
          }

        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  void *v19;
  void *v20;

  v18 = -[NSString hash](self->_street, "hash");
  -[WFStreetAddress subLocality](self, "subLocality");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v20, "hash");
  -[WFStreetAddress city](self, "city");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v19, "hash");
  -[WFStreetAddress subAdministrativeArea](self, "subAdministrativeArea");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "hash");
  -[WFStreetAddress state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[WFStreetAddress postalCode](self, "postalCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[WFStreetAddress country](self, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[WFStreetAddress isoCountryCode](self, "isoCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[WFStreetAddress label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ objc_msgSend(v12, "hash") ^ 0x390AF033;

  return v13;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  CLPlacemark *placemark;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setValue:forKey:", self->_street, CFSTR("link.contentkit.addressstreet"));
  objc_msgSend(v3, "setValue:forKey:", self->_subLocality, CFSTR("link.contentkit.addresssublocality"));
  objc_msgSend(v3, "setValue:forKey:", self->_city, CFSTR("link.contentkit.addresscity"));
  objc_msgSend(v3, "setValue:forKey:", self->_subAdministrativeArea, CFSTR("link.contentkit.addresssubadministrativearea"));
  objc_msgSend(v3, "setValue:forKey:", self->_state, CFSTR("link.contentkit.addressstate"));
  objc_msgSend(v3, "setValue:forKey:", self->_postalCode, CFSTR("link.contentkit.addresspostalcode"));
  objc_msgSend(v3, "setValue:forKey:", self->_country, CFSTR("link.contentkit.addresscountry"));
  objc_msgSend(v3, "setValue:forKey:", self->_isoCountryCode, CFSTR("link.contentkit.addressisocountrycode"));
  placemark = self->_placemark;
  if (placemark)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", placemark, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("link.contentkit.addressplacemark"));

  }
  else
  {
    objc_msgSend(v3, "setValue:forKey:", 0, CFSTR("link.contentkit.addressplacemark"));
  }
  objc_msgSend(v3, "setValue:forKey:", self->_addressString, CFSTR("link.contentkit.addressstring"));
  objc_msgSend(v3, "setValue:forKey:", self->_label, CFSTR("link.contentkit.addresslabel"));
  return v3;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
}

+ (id)streetAddressesInString:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    +[WFDataDetector resultsForString:ofTypes:error:](WFDataDetector, "resultsForString:ofTypes:error:", a3, 16, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "streetAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v5;
}

+ (BOOL)stringContainsStreetAddresses:(id)a3
{
  return +[WFDataDetector hasResultForString:ofTypes:](WFDataDetector, "hasResultForString:ofTypes:", a3, 16);
}

+ (id)streetAddressWithTextCheckingResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD12B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD1288]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD12B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD12C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD1290]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "streetAddressWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:label:", v5, 0, v6, 0, v7, v8, v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)streetAddressWithStreet:(id)a3 subLocality:(id)a4 city:(id)a5 subAdministrativeArea:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9 isoCountryCode:(id)a10 label:(id)a11
{
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  if (a3 || a4 || a5 || a6 || a7 || a8 || a9 || a10)
  {
    v19 = a11;
    v20 = a10;
    v21 = a9;
    v22 = a8;
    v23 = a7;
    v24 = a6;
    v25 = a5;
    v26 = a4;
    v27 = a3;
    v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:placemark:formattedAddress:label:", v27, v26, v25, v24, v23, v22, v21, v20, 0, 0, v19);

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

+ (id)streetAddressWithPlacemark:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  WFCNPostalAddressFromCLPlacemark(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPostalAddress:placemark:formattedAddress:label:", v9, v7, 0, v6);

  return v10;
}

+ (id)streetAddressWithPostalAddress:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPostalAddress:placemark:formattedAddress:label:", v7, 0, 0, v6);

  return v8;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addressplacemark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (objc_class *)a1;
  v24 = v5;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v7 = (void *)getCLPlacemarkClass_softClass;
    v30 = getCLPlacemarkClass_softClass;
    if (!getCLPlacemarkClass_softClass)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __getCLPlacemarkClass_block_invoke;
      v26[3] = &unk_24C4E3118;
      v26[4] = &v27;
      __getCLPlacemarkClass_block_invoke((uint64_t)v26);
      v7 = (void *)v28[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v27, 8);
    v25 = 0;
    objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v8, v5, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v25;
  }
  else
  {
    v9 = 0;
    v22 = 0;
  }
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addressstreet"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addresssublocality"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addresscity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addresssubadministrativearea"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addressstate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addresspostalcode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addresscountry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addressisocountrycode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addressstring"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.addresslabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend([v23 alloc], "initWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:placemark:formattedAddress:label:", v20, v10, v11, v12, v13, v21, v14, v15, v9, v16, v17);

  return v19;
}

@end

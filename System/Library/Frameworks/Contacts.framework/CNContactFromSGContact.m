@implementation CNContactFromSGContact

CNMutablePostalAddress *__CNContactFromSGContact_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNMutablePostalAddress *v3;
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
  void *v14;
  void *v15;
  id v16;
  void *v17;
  CNMutablePostalAddress *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CNMutablePostalAddress *v27;
  id v29;

  v2 = a2;
  if (v2)
  {
    v3 = objc_alloc_init(CNMutablePostalAddress);
    objc_msgSend(v2, "components");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "street");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setStreet:](v3, "setStreet:", v6);

      objc_msgSend(v5, "subLocality");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setSubLocality:](v3, "setSubLocality:", v7);

      objc_msgSend(v5, "city");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setCity:](v3, "setCity:", v8);

      objc_msgSend(v5, "subAdministrativeArea");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setSubAdministrativeArea:](v3, "setSubAdministrativeArea:", v9);

      objc_msgSend(v5, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setState:](v3, "setState:", v10);

      objc_msgSend(v5, "postalCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setPostalCode:](v3, "setPostalCode:", v11);

      objc_msgSend(v5, "country");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setCountry:](v3, "setCountry:", v12);

      objc_msgSend(v5, "isoCountryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddress setISOCountryCode:](v3, "setISOCountryCode:", v13);

    }
    else
    {
      objc_msgSend(v2, "rawAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v29 = 0;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 16, &v29);
        v16 = v29;
        v17 = v16;
        if (v15)
        {
          objc_msgSend(v2, "rawAddress");
          v18 = (CNMutablePostalAddress *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstMatchInString:options:range:", v18, 0, 0, -[CNMutablePostalAddress length](v18, "length"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addressComponents");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v19 && v20)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3298]);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPostalAddress setStreet:](v3, "setStreet:", v22);

            objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3260]);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPostalAddress setCity:](v3, "setCity:", v23);

            objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3290]);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPostalAddress setState:](v3, "setState:", v24);

            objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB32A0]);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPostalAddress setPostalCode:](v3, "setPostalCode:", v25);

            objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3268]);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPostalAddress setCountry:](v3, "setCountry:", v26);
          }
          else
          {
            v26 = v3;
            v3 = 0;
          }
          v27 = v3;

          v3 = v18;
        }
        else
        {
          NSLog(CFSTR("error creating data detector: %@"), v16);
          v27 = 0;
        }

        v3 = v27;
      }
      else
      {

        v3 = 0;
      }
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

CNMutableSocialProfile *__CNContactFromSGContact_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  CNMutableSocialProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = objc_alloc_init(CNMutableSocialProfile);
    objc_msgSend(v2, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSocialProfile setDisplayname:](v3, "setDisplayname:", v4);

    objc_msgSend(v2, "username");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSocialProfile setUsername:](v3, "setUsername:", v5);

    objc_msgSend(v2, "userIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSocialProfile setUserIdentifier:](v3, "setUserIdentifier:", v6);

    objc_msgSend(v2, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v2, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSocialProfile setBundleIdentifiers:](v3, "setBundleIdentifiers:", v9);

    }
    else
    {
      -[CNSocialProfile setBundleIdentifiers:](v3, "setBundleIdentifiers:", 0);
    }

    objc_msgSend(v2, "teamIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSocialProfile setTeamIdentifier:](v3, "setTeamIdentifier:", v10);

    objc_msgSend(v2, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSocialProfile setService:](v3, "setService:", v11);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end

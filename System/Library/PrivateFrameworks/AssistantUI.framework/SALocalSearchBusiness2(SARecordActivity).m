@implementation SALocalSearchBusiness2(SARecordActivity)

- (id)donateActivityCommand
{
  id v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v2 = objc_alloc_init(MEMORY[0x24BE810F8]);
  objc_msgSend(a1, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setType:", CFSTR("com.apple.siri.businessLocation"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "label");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "locationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v6, v7);

    }
    objc_msgSend(v3, "city");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "city");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "city");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v9, v10);

    }
    objc_msgSend(v3, "postalCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "postalCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "postalCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v12, v13);

    }
    objc_msgSend(v3, "street");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "street");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "thoroughfare");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v15, v16);

    }
    objc_msgSend(v3, "stateCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "stateCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "stateOrProvince");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v18, v19);

    }
    objc_msgSend(v3, "countryCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v3, "countryCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "country");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v21, v22);

    }
    objc_msgSend(v3, "longitude");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v3, "longitude");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "longitude");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v24, v25);

    }
    objc_msgSend(v3, "latitude");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v3, "latitude");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE1B0B8], "latitude");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v27, v28);

    }
  }
  objc_msgSend(a1, "phoneNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(a1, "phoneNumber");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v30, CFSTR("_DKLocationApplicationActivityMetadataKey-phoneNumber"));

  }
  objc_msgSend(v2, "setMetadata:", v4);
  objc_msgSend(v2, "setVisibility:", *MEMORY[0x24BE81A50]);
  objc_msgSend(v2, "setStreamType:", CFSTR("/app/locationActivity"));
  v31 = objc_alloc_init(MEMORY[0x24BE81510]);
  objc_msgSend(v31, "setActivity:", v2);

  return v31;
}

@end

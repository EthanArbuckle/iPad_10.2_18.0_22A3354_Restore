@implementation MSDStoreContactsModel

+ (MSDStoreContactsModel)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_6);
  return (MSDStoreContactsModel *)(id)sharedInstance_sharedInstance_1;
}

void __39__MSDStoreContactsModel_sharedInstance__block_invoke()
{
  MSDStoreContactsModel *v0;
  void *v1;

  v0 = objc_alloc_init(MSDStoreContactsModel);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (MSDStoreContactsModel)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *regionToCountryCode;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  MSDStoreContactsModel *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)MSDStoreContactsModel;
  v35 = -[MSDStoreContactsModel init](&v44, sel_init);
  if (v35)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("contact"), CFSTR("json"));
    v3 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v3;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("area_ar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    -[MSDStoreContactsModel setCountryCodeToNumbers:](v35, "setCountryCodeToNumbers:", v5);

    v6 = objc_opt_new();
    regionToCountryCode = v35->_regionToCountryCode;
    v35->_regionToCountryCode = (NSDictionary *)v6;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v4;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (!v31)
      goto LABEL_23;
    v30 = *(_QWORD *)v41;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(obj);
        v33 = v8;
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "objectForKey:", CFSTR("label"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("phone_ar"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v34 = v11;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v37 != v14)
                objc_enumerationMutation(v34);
              v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v16, "objectForKey:", CFSTR("country_code"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", CFSTR("phone"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", CFSTR("toll_free"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
                objc_msgSend(v10, "addObject:", v17);
              -[MSDStoreContactsModel countryCodeToNumbers](v35, "countryCodeToNumbers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", v17);
              v21 = objc_claimAutoreleasedReturnValue();
              if (!v21)
              {

LABEL_18:
                -[MSDStoreContactsModel countryCodeToNumbers](v35, "countryCodeToNumbers");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKey:", v18, v17);

                goto LABEL_19;
              }
              v22 = (void *)v21;
              v23 = objc_msgSend(v19, "BOOLValue");

              if ((v23 & 1) != 0)
                goto LABEL_18;
LABEL_19:

            }
            v13 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v13);
        }
        -[NSDictionary setValue:forKey:](v35->_regionToCountryCode, "setValue:forKey:", v10, v32);

        v8 = v33 + 1;
      }
      while (v33 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (!v31)
      {
LABEL_23:

        return v35;
      }
    }
  }
  return v35;
}

- (id)contactNumberForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MSDStoreContactsModel countryCodeToNumbers](self, "countryCodeToNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)regionToCountryCode
{
  return self->_regionToCountryCode;
}

- (NSMutableDictionary)countryCodeToNumbers
{
  return self->_countryCodeToNumbers;
}

- (void)setCountryCodeToNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_countryCodeToNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCodeToNumbers, 0);
  objc_storeStrong((id *)&self->_regionToCountryCode, 0);
}

@end

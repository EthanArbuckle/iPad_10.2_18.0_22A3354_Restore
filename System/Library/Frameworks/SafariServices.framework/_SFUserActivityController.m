@implementation _SFUserActivityController

+ (id)sharedActivityController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___SFUserActivityController_sharedActivityController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_SFUserActivityController sharedActivityController]::onceToken != -1)
    dispatch_once(&+[_SFUserActivityController sharedActivityController]::onceToken, block);
  return (id)+[_SFUserActivityController sharedActivityController]::sharedController;
}

+ (id)searchableItemAttributesForDictionary:(id)a3 profileIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("streetAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("telephone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_23;
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v9 = (void *)getCSSearchableItemAttributeSetClass(void)::softClass;
  v29 = getCSSearchableItemAttributeSetClass(void)::softClass;
  if (!getCSSearchableItemAttributeSetClass(void)::softClass)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = ___ZL36getCSSearchableItemAttributeSetClassv_block_invoke;
    v25[3] = &unk_1E4ABFDC0;
    v25[4] = &v26;
    ___ZL36getCSSearchableItemAttributeSetClassv_block_invoke((uint64_t)v25);
    v9 = (void *)v27[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v26, 8);
  v8 = (void *)objc_msgSend([v10 alloc], "initWithItemContentType:", CFSTR("com.apple.mobilesafari.UserActivity.ProactiveConnection"));
  objc_msgSend(MEMORY[0x1E0D8AC68], "coreSpotlightPageDonationIdentifierForProfileWithIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDomainIdentifier:", v11);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressLocality"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "setCity:", v12);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressCountry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v8, "setCountry:", v13);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressRegion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v8, "setStateOrProvince:", v14);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("telephone"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    v30[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPhoneNumbers:", v17);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v8, "setNamedLocation:", v18);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v20);
    objc_msgSend(MEMORY[0x1E0D8AC68], "historyItemIdentifierForURL:profileIdentifier:", v20, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRelatedUniqueIdentifier:", v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("postalCode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v8, "setPostalCode:", v22);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("streetAddress"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v8, "setThoroughfare:", v23);

LABEL_23:
  return v8;
}

@end

@implementation WFDCMapsLinkContentItem

- (NSDictionary)additionalRepresentationsForSerialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_opt_new();
  -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsAppURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF85F0], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v6);

  v9.receiver = self;
  v9.super_class = (Class)WFDCMapsLinkContentItem;
  -[WFContentItem additionalRepresentationsForSerialization](&v9, sel_additionalRepresentationsForSerialization);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v7);

  return (NSDictionary *)v3;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 0;
}

- (id)mapsLink
{
  return -[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v8)(id, void *, void *, _QWORD);
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
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
  objc_class *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  void (**v38)(id, void *, void *, _QWORD);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v8 = (void (**)(id, void *, void *, _QWORD))a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mapsAppURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Apple Maps URL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v20, 0);

LABEL_9:
    goto LABEL_26;
  }
  NSStringFromClass(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(CFSTR("MKMapItem"), "isEqualToString:", v10);

  if (!v11)
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, void *))v8)[2](v8, 0, 0, v18);
    goto LABEL_9;
  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v12 = (void *)getMKLocalSearchRequestClass_softClass;
  v47 = getMKLocalSearchRequestClass_softClass;
  v13 = MEMORY[0x24BDAC760];
  if (!getMKLocalSearchRequestClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getMKLocalSearchRequestClass_block_invoke;
    v42 = &unk_24C4E3118;
    v43 = &v44;
    __getMKLocalSearchRequestClass_block_invoke((uint64_t)&v39);
    v12 = (void *)v45[3];
  }
  v14 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v44, 8);
  v15 = objc_alloc_init(v14);
  -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v15, "setNaturalLanguageQuery:", v17);
  }
  else
  {
    -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "searchLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v15, "setNaturalLanguageQuery:", v22);
    }
    else
    {
      -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "destinationAddress");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v15, "setNaturalLanguageQuery:", v23);
        v24 = v35;
      }
      else
      {
        -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "startAddress");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v15, "setNaturalLanguageQuery:", v25);
          v24 = v35;
        }
        else
        {
          -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "searchNearQuery");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v15, "setNaturalLanguageQuery:", v26);
          }
          else
          {
            -[WFDCMapsLinkContentItem mapsLink](self, "mapsLink");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "searchQuery");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setNaturalLanguageQuery:", v27);

          }
          v24 = v35;

          v25 = 0;
        }

        v23 = 0;
      }

      v13 = MEMORY[0x24BDAC760];
    }

  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v28 = (void *)getMKLocalSearchClass_softClass;
  v47 = getMKLocalSearchClass_softClass;
  if (!getMKLocalSearchClass_softClass)
  {
    v39 = v13;
    v40 = 3221225472;
    v41 = __getMKLocalSearchClass_block_invoke;
    v42 = &unk_24C4E3118;
    v43 = &v44;
    __getMKLocalSearchClass_block_invoke((uint64_t)&v39);
    v28 = (void *)v45[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v44, 8);
  v30 = (void *)objc_msgSend([v29 alloc], "initWithRequest:", v15);
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __73__WFDCMapsLinkContentItem_generateObjectRepresentation_options_forClass___block_invoke;
  v36[3] = &unk_24C4DFF48;
  v37 = v15;
  v38 = v8;
  v31 = v15;
  objc_msgSend(v30, "startWithCompletionHandler:", v36);

LABEL_26:
}

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

void __73__WFDCMapsLinkContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "mapItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "mapItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v9 + 16))(v9, v11, 0, 0);

  }
  else
  {
    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getMKErrorDomain();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", v13))
    {
      v14 = objc_msgSend(v6, "code");

      if (v14 == 4)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        getMKErrorDomain();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("Location Not Found"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v17;
        v25 = *MEMORY[0x24BDD0FC8];
        v18 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The location (“%@”) could not be found using Maps local search."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "naturalLanguageQuery");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v19, v20, v24, v25, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v24, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v23;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("MKMapItem"), CFSTR("MapKit"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Location");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Maps link"), CFSTR("Maps link"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Maps links"), CFSTR("Maps links"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Maps links"));
}

@end

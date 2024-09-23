@implementation WFGetMKMapItemEntry

id __WFGetMKMapItemEntry_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = a2;
  objc_msgSend(v2, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.mkmapitem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCurrentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemark"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend(getMKMapItemClass(), "mapItemForCurrentLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    v9 = objc_alloc((Class)getMKMapItemClass());
    v10 = (void *)MEMORY[0x24BDD1620];
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v11 = (void *)getMKPlacemarkClass_softClass;
    v24 = getMKPlacemarkClass_softClass;
    if (!getMKPlacemarkClass_softClass)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __getMKPlacemarkClass_block_invoke;
      v20[3] = &unk_24C4E3118;
      v20[4] = &v21;
      __getMKPlacemarkClass_block_invoke((uint64_t)v20);
      v11 = (void *)v22[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v12, v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithPlacemark:", v13);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v14);

  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPhoneNumber:", v15);

  v16 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v3, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUrl:", v18);

  return v8;
}

id __WFGetMKMapItemEntry_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
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
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  getMKMapItemClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD1618];
      objc_msgSend(v3, "placemark");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("placemark"));

    }
    else if (objc_msgSend(v3, "isCurrentLocation"))
    {
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isCurrentLocation"));
    }
    objc_msgSend(v3, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("name"));

    }
    objc_msgSend(v3, "phoneNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v3, "phoneNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("phoneNumber"));

    }
    objc_msgSend(v3, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("url"));

    }
    v18 = CFSTR("link.contentkit.mkmapitem");
    v19[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end

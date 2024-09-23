@implementation NSUserActivity(MKMapItemPrivate)

- (void)_mapkit_populateFieldsForDonationOfMapItem:()MKMapItemPrivate
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "contentAttributeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    if (!v6)
    {
      v36 = 0;
      v37 = &v36;
      v38 = 0x2050000000;
      v7 = (void *)qword_1ECE2DE28;
      v39 = qword_1ECE2DE28;
      if (!qword_1ECE2DE28)
      {
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __getCSSearchableItemAttributeSetClass_block_invoke;
        v35[3] = &unk_1E20D8078;
        v35[4] = &v36;
        __getCSSearchableItemAttributeSetClass_block_invoke((uint64_t)v35);
        v7 = (void *)v37[3];
      }
      v8 = v7;
      _Block_object_dispose(&v36, 8);
      v9 = objc_alloc((Class)v8);
      objc_msgSend(a1, "activityType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v9, "initWithItemContentType:", v10);

    }
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNamedLocation:", v11);

    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "_coordinate");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLatitude:", v13);

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "_coordinate");
    objc_msgSend(v14, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLongitude:", v16);

    objc_msgSend(v4, "phoneNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      objc_msgSend(v6, "phoneNumbers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v6, "phoneNumbers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "phoneNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayByAddingObject:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPhoneNumbers:", v22);

      }
      else
      {
        objc_msgSend(v4, "phoneNumber");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPhoneNumbers:", v21);
      }

    }
    objc_msgSend(v4, "placemark");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "thoroughfare");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setThoroughfare:", v24);

    objc_msgSend(v23, "subThoroughfare");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubThoroughfare:", v25);

    objc_msgSend(v23, "postalCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPostalCode:", v26);

    objc_msgSend(v23, "locality");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCity:", v27);

    objc_msgSend(v23, "administrativeArea");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStateOrProvince:", v28);

    objc_msgSend(v23, "country");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCountry:", v29);

    objc_msgSend(v4, "_addressFormattedAsSinglelineAddress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFullyFormattedAddress:", v30);

    objc_msgSend(a1, "setContentAttributeSet:", v6);
    objc_getAssociatedObject(a1, &_MergedGlobals_172);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "integerValue") + 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, &_MergedGlobals_172, v33, (void *)0x301);

    objc_msgSend(a1, "_internalUserActivity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "updateForwardToCoreSpotlightIndexer:", (char)v32);

  }
}

- (void)_mapkit_clearMapItemDonationFields
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_getAssociatedObject(a1, &_MergedGlobals_172);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "integerValue");
  objc_setAssociatedObject(a1, &_MergedGlobals_172, 0, (void *)0x301);
  if (v2 >= 1)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateForwardToCoreSpotlightIndexer:", (char)-(char)v2);

  }
}

@end

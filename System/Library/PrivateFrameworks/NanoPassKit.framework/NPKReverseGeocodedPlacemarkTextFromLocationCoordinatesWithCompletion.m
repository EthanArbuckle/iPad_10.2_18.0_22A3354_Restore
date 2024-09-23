@implementation NPKReverseGeocodedPlacemarkTextFromLocationCoordinatesWithCompletion

void __NPKReverseGeocodedPlacemarkTextFromLocationCoordinatesWithCompletion_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!objc_msgSend(v5, "count"))
      goto LABEL_20;
    objc_msgSend(v5, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject locality](v9, "locality");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject administrativeArea](v9, "administrativeArea");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RELEVANT_REVERSE_GEOCODED_PLACEMARK_TEXT"), &stru_24CFF06D8, CFSTR("NanoPassKit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v16, v11, v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v11)
      {
        v17 = v11;
LABEL_16:
        v20 = *(_QWORD *)(a1 + 40);
        if (v20)
          (*(void (**)(uint64_t, id))(v20 + 16))(v20, v17);

        goto LABEL_19;
      }
      -[NSObject subLocality](v9, "subLocality");
      v18 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v18;
      if (v18)
        v19 = (void *)v18;
      else
        v19 = v13;
      v17 = v19;
    }

    goto LABEL_16;
  }
  pk_General_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v22 = v10;
      v23 = 2112;
      v24 = v5;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Error while reverse geocoding location %@ with placemarks: %@: %@", buf, 0x20u);
    }
LABEL_19:

  }
LABEL_20:

}

@end

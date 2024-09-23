@implementation NDOWarranty

+ (id)_legacyWarrantyPath
{
  void *v2;
  void *v3;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Application Support/com.apple.NewDeviceOutreach/Warranty.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_warrantyPathForSerialNumberFormat
{
  void *v2;
  void *v3;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Application Support/com.apple.NewDeviceOutreach/%@_Warranty.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NDOWarranty)warrantyWithDictionary:(id)a3
{
  id v3;
  NDOWarranty *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[NDOWarranty initWithDictionary:]([NDOWarranty alloc], "initWithDictionary:", v3);

  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[NDOWarranty warrantyWithDictionary:]";
    v9 = 1024;
    v10 = v4 != 0;
    _os_log_impl(&dword_22D064000, v5, OS_LOG_TYPE_DEFAULT, "%s : %d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

+ (id)migrateLegacyCachedWarrantyIfNeededForSerialNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
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
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(a1, "_legacyWarrantyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "warrantyWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D064000, v9, OS_LOG_TYPE_DEFAULT, "Migrating legacy warranty..", buf, 2u);
    }

    objc_msgSend(v8, "cacheWarranty:", v4);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("CachedWarrantyValidityDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    if (v13 > 0.0)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "sha256Hash");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_CachedWarrantyValidityDuration"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDouble:forKey:", v16, v13);

      objc_msgSend(v10, "removeObjectForKey:", CFSTR("CachedWarrantyValidityDuration"));
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("CachedWarrantyLastUpdatedDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "sha256Hash");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@_CachedWarrantyLastUpdatedDate"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v17, v20);

      objc_msgSend(v10, "removeObjectForKey:", CFSTR("CachedWarrantyLastUpdatedDate"));
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("CachedWarrantyLocale"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "sha256Hash");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@_CachedWarrantyLocale"), v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v21, v24);

      objc_msgSend(v10, "removeObjectForKey:", CFSTR("CachedWarrantyLocale"));
      objc_msgSend(v10, "objectForKey:", CFSTR("CachedWarrantyVersion"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "sha256Hash");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@_CachedWarrantyVersion"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v25, v28);

      objc_msgSend(v10, "removeObjectForKey:", CFSTR("CachedWarrantyVersion"));
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("CachedWarrantyVersion"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_legacyWarrantyPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeItemAtPath:error:", v30, 0);

  }
  return v8;
}

+ (id)cachedWarrantyForSerialNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "_warrantyPathForSerialNumberFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sha256Hash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_legacyWarrantyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _NDOLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "+[NDOWarranty cachedWarrantyForSerialNumber:]";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_22D064000, v9, OS_LOG_TYPE_DEFAULT, "%s : warrantyPath : %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "warrantyWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NDOWarranty)initWithDictionary:(id)a3
{
  id v4;
  NDOWarranty *v5;
  NDOWarranty *v6;
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
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  objc_super v120;

  v4 = a3;
  v120.receiver = self;
  v120.super_class = (Class)NDOWarranty;
  v5 = -[NDOWarranty init](&v120, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v47 = v5;
      v6 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[NDOWarranty setDictionaryRepresentation:](v5, "setDictionaryRepresentation:", v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("covered"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCovered:](v6, "setCovered:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverageEndDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCoverageEndDate:](v6, "setCoverageEndDate:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedCoveredDeviceDateLabelFormat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setLocalizedCoveredDeviceDateLabelFormat:](v6, "setLocalizedCoveredDeviceDateLabelFormat:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverageLocalizedLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCoverageLocalizedLabel:](v6, "setCoverageLocalizedLabel:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverageLocalizedDesc"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCoverageLocalizedDesc:](v6, "setCoverageLocalizedDesc:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverageLocalizedDescLong"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCoverageLocalizedDescLong:](v6, "setCoverageLocalizedDescLong:", v13);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverageLocalizedExpirationLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCoverageLocalizedExpirationLabel:](v6, "setCoverageLocalizedExpirationLabel:", v14);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer1FormatString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setFooter1FormatString:](v6, "setFooter1FormatString:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer1LinkLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setFooter1LinkLabel:](v6, "setFooter1LinkLabel:", v16);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer1LinkURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setFooter1LinkURL:](v6, "setFooter1LinkURL:", v17);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer2FormatString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setFooter2FormatString:](v6, "setFooter2FormatString:", v18);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer2LinkLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setFooter2LinkLabel:](v6, "setFooter2LinkLabel:", v19);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer2LinkURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setFooter2LinkURL:](v6, "setFooter2LinkURL:", v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferEligible"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferEligible:](v6, "setAcOfferEligible:", objc_msgSend(v21, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferEligibleUntil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferEligibleUntil:](v6, "setAcOfferEligibleUntil:", v23);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferFollowupDisplayDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferFollowupDisplayDate:](v6, "setAcOfferFollowupDisplayDate:", v25);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferDisplayDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferDisplayDate:](v6, "setAcOfferDisplayDate:", v27);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (const __CFString *)v28;
    else
      v30 = &stru_24F81DDD8;
    -[NDOWarranty setAcOfferIdentifier:](v6, "setAcOfferIdentifier:", v30);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferLabel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferLabel:](v6, "setAcLocalizedOfferLabel:", v31);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferLongLabel"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferLongLabel:](v6, "setAcLocalizedOfferLongLabel:", v32);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedGroupedOfferFooterLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedGroupedOfferFooterLabel:](v6, "setAcLocalizedGroupedOfferFooterLabel:", v33);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferStatusLabel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferStatusLabel:](v6, "setAcLocalizedOfferStatusLabel:", v34);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferPluralDescFormat"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferPluralDescFormat:](v6, "setAcLocalizedOfferPluralDescFormat:", v35);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferSingularDesc"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferSingularDesc:](v6, "setAcLocalizedOfferSingularDesc:", v36);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acNotificationLocalizedOfferLabel"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcNotificationLocalizedOfferLabel:](v6, "setAcNotificationLocalizedOfferLabel:", v37);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acNotificationLocalizedOfferPluralDescFormat"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcNotificationLocalizedOfferPluralDescFormat:](v6, "setAcNotificationLocalizedOfferPluralDescFormat:", v38);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acNotificationLocalizedOfferSingularDesc"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcNotificationLocalizedOfferSingularDesc:](v6, "setAcNotificationLocalizedOfferSingularDesc:", v39);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferCTA"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferCTA:](v6, "setAcLocalizedOfferCTA:", v40);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedGroupedOfferCTA"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedGroupedOfferCTA:](v6, "setAcLocalizedGroupedOfferCTA:", v41);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferDetails"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferDetails:](v6, "setAcLocalizedOfferDetails:", v42);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferDetailsPluralEligibilityFormat"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferDetailsPluralEligibilityFormat:](v6, "setAcLocalizedOfferDetailsPluralEligibilityFormat:", v43);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedOfferDetailsSingularEligibility"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedOfferDetailsSingularEligibility:](v6, "setAcLocalizedOfferDetailsSingularEligibility:", v44);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedUnlinkedPlanLabel"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedUnlinkedPlanLabel:](v6, "setAcLocalizedUnlinkedPlanLabel:", v45);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLocalizedUnlinkedPlanStatusLabel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcLocalizedUnlinkedPlanStatusLabel:](v6, "setAcLocalizedUnlinkedPlanStatusLabel:", v46);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("featureToggleParameters"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("acOfferDisplay"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferDisplay:](v6, "setAcOfferDisplay:", objc_msgSend(v48, "BOOLValue"));

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("acOfferSettingsAppBadge"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferSettingsAppBadge:](v6, "setAcOfferSettingsAppBadge:", objc_msgSend(v49, "BOOLValue"));

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("acOfferSettingsRowBadge"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferSettingsRowBadge:](v6, "setAcOfferSettingsRowBadge:", objc_msgSend(v50, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferPromoFormat"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferPromoFormat:](v6, "setAcOfferPromoFormat:", v51);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferPromoNew"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferPromoNew:](v6, "setAcOfferPromoNew:", v52);

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("acOfferDurationDaysBeforeEndDate"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    -[NDOWarranty setAcOfferDurationBeforeEndDate:](v6, "setAcOfferDurationBeforeEndDate:", v54 * 86400.0);

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("acOfferToggle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setAcOfferToggle:](v6, "setAcOfferToggle:", v55);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferBadgeBeforeEndDate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    -[NDOWarranty setAcOfferBadgeDurationBeforeEndDate:](v6, "setAcOfferBadgeDurationBeforeEndDate:", v57 * 86400.0);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acLogoToggle"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setCoverageHasACLogo:](v6, "setCoverageHasACLogo:", objc_msgSend(v58, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acServicesPartner"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setLocalizedCoverageSubTitleForServicesPartnerString:](v6, "setLocalizedCoverageSubTitleForServicesPartnerString:", v59);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedSupportAppLabel"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setLocalizedSupportAppLabel:](v6, "setLocalizedSupportAppLabel:", v60);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedSupportAppFooter"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setLocalizedSupportAppFooter:](v6, "setLocalizedSupportAppFooter:", v61);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedManagePlanLabel"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setLocalizedManagePlanLabel:](v6, "setLocalizedManagePlanLabel:", v62);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAcSubscription"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setIsCoveragePlanSubscriptionType:](v6, "setIsCoveragePlanSubscriptionType:", objc_msgSend(v63, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAcServicesPartner"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOWarranty setIsACServicesPartner:](v6, "setIsACServicesPartner:", objc_msgSend(v64, "BOOLValue"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKey:", CFSTR("ConversionDate"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      -[NDOWarranty setAcOfferConversionDate:](v6, "setAcOfferConversionDate:", v67);
LABEL_16:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scIntervalInDays"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setScIntervalInDays:](v6, "setScIntervalInDays:", v77);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eligibilityEventId"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setEligibilityEventId:](v6, "setEligibilityEventId:", v78);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scIntervalFollowupEligible"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setScIntervalFollowupEligible:](v6, "setScIntervalFollowupEligible:", objc_msgSend(v79, "BOOLValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scIntervalPairedDeviceAllowed"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setScIntervalPairedDeviceAllowed:](v6, "setScIntervalPairedDeviceAllowed:", objc_msgSend(v80, "BOOLValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverage"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setCoverageDetailsDictionary:](v6, "setCoverageDetailsDictionary:", v81);

      -[NDOWarranty coverageDetailsDictionary](v6, "coverageDetailsDictionary");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("localizedCoverageTitle"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setLocalizedCoverageDetailsTitle:](v6, "setLocalizedCoverageDetailsTitle:", v83);

      -[NDOWarranty coverageDetailsDictionary](v6, "coverageDetailsDictionary");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("coverageDetails"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setCoverageDetailsArray:](v6, "setCoverageDetailsArray:", v85);

      -[NDOWarranty coverageDetailsDictionary](v6, "coverageDetailsDictionary");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("localizedCoverageFooterFormatString"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setLocalizedCoverageFooterFormatString:](v6, "setLocalizedCoverageFooterFormatString:", v87);

      -[NDOWarranty coverageDetailsDictionary](v6, "coverageDetailsDictionary");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("localizedCoverageFooterLinkLabel"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setLocalizedCoverageFooterLinkLabel:](v6, "setLocalizedCoverageFooterLinkLabel:", v89);

      -[NDOWarranty coverageDetailsDictionary](v6, "coverageDetailsDictionary");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("benefitsCard"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setCoverageBenefitsDictionary:](v6, "setCoverageBenefitsDictionary:", v91);

      -[NDOWarranty coverageBenefitsDictionary](v6, "coverageBenefitsDictionary");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("localizedBenefitsCardTitle"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setLocalizedBenefitsCardTitle:](v6, "setLocalizedBenefitsCardTitle:", v93);

      -[NDOWarranty coverageBenefitsDictionary](v6, "coverageBenefitsDictionary");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("localizedBenefitsCardSubTitle"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setLocalizedBenefitsCardSubTitle:](v6, "setLocalizedBenefitsCardSubTitle:", v95);

      -[NDOWarranty coverageBenefitsDictionary](v6, "coverageBenefitsDictionary");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("benefitDetails"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setBenefitDetailsArray:](v6, "setBenefitDetailsArray:", v97);

      -[NDOWarranty coverageBenefitsDictionary](v6, "coverageBenefitsDictionary");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("localizedBenefitsCardFooter"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setLocalizedBenefitsCardFooter:](v6, "setLocalizedBenefitsCardFooter:", v99);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayRepairAndSupport"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setDisplayRepairAndSupport:](v6, "setDisplayRepairAndSupport:", objc_msgSend(v100, "BOOLValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("agsURL"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setAgsURL:](v6, "setAgsURL:", v101);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("agsULURL"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setAgsULURL:](v6, "setAgsULURL:", v102);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportAppURL"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setSupportAppURL:](v6, "setSupportAppURL:", v103);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cacheTtlMinutes"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "doubleValue");
      -[NDOWarranty setCacheValidityDuration:](v6, "setCacheValidityDuration:", v105 * 60.0);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showNotificationToggle"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setShowNotificationToggle:](v6, "setShowNotificationToggle:", objc_msgSend(v106, "BOOLValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showNotificationBeforeEndDate"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "doubleValue");
      -[NDOWarranty setShowNotificationBeforeEndDate:](v6, "setShowNotificationBeforeEndDate:", v108 * 86400.0);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("deviceImageUrl"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setDeviceImageUrl:](v6, "setDeviceImageUrl:", v110);

      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("deviceDesc"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setDeviceDesc:](v6, "setDeviceDesc:", v111);

      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("sgId"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setSgId:](v6, "setSgId:", v112);

      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("pfcId"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setPfcId:](v6, "setPfcId:", v113);

      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("pgfId"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setPgfId:](v6, "setPgfId:", v114);

      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("parentId"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setParentId:](v6, "setParentId:", v115);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("getSupportURL"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setGetSupportURL:](v6, "setGetSupportURL:", v116);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mySupportURL"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setMySupportURL:](v6, "setMySupportURL:", v117);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAPSSupported"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setIsAPSSupported:](v6, "setIsAPSSupported:", objc_msgSend(v118, "BOOLValue"));

      goto LABEL_17;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acOfferConversionDate"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v68;
    if (v68)
    {
      objc_msgSend(v68, "doubleValue");
      if (v70 == 0.0)
      {
        -[NDOWarranty setAcOfferConversionDate:](v6, "setAcOfferConversionDate:", 0);
        goto LABEL_15;
      }
      +[NDOUtilities dateWithEpochNumber:](NDOUtilities, "dateWithEpochNumber:", v69);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setAcOfferConversionDate:](v6, "setAcOfferConversionDate:", v71);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKey:", CFSTR("OneDayInterval"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      v75 = v74;

      -[NDOWarranty coverageEndDate](v6, "coverageEndDate");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "dateByAddingTimeInterval:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOWarranty setAcOfferConversionDate:](v6, "setAcOfferConversionDate:", v76);

    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_18:

  return v6;
}

- (void)cacheWarranty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend((id)objc_opt_class(), "_warrantyPathForSerialNumberFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sha256Hash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_legacyWarrantyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _NDOLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[NDOWarranty cacheWarranty:]";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_22D064000, v9, OS_LOG_TYPE_DEFAULT, "%s -> %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  -[NDOWarranty dictionaryRepresentation](self, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeToFile:atomically:", v8, 1);

}

- (void)cache
{
  -[NDOWarranty cacheWarranty:](self, "cacheWarranty:", 0);
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NDOWarranty dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)acLocalizedOfferDesc
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = -[NDOWarranty daysEligible](self, "daysEligible");
  if (v3 > 1)
  {
    v5 = v3;
    -[NDOWarranty acLocalizedOfferPluralDescFormat](self, "acLocalizedOfferPluralDescFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[NDOWarranty acLocalizedOfferPluralDescFormat](self, "acLocalizedOfferPluralDescFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _NDOLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NDOWarranty acLocalizedOfferDesc].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      v4 = 0;
    }
  }
  else
  {
    -[NDOWarranty acLocalizedOfferSingularDesc](self, "acLocalizedOfferSingularDesc");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)acLocalizedNotificationOfferDesc
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = -[NDOWarranty daysEligible](self, "daysEligible");
  if (v3 > 1)
  {
    v5 = v3;
    -[NDOWarranty acNotificationLocalizedOfferPluralDescFormat](self, "acNotificationLocalizedOfferPluralDescFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[NDOWarranty acNotificationLocalizedOfferPluralDescFormat](self, "acNotificationLocalizedOfferPluralDescFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _NDOLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NDOWarranty acLocalizedNotificationOfferDesc].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      v4 = 0;
    }
  }
  else
  {
    -[NDOWarranty acNotificationLocalizedOfferSingularDesc](self, "acNotificationLocalizedOfferSingularDesc");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (NSString)acLocalizedOfferDetailsEligibility
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = -[NDOWarranty daysEligible](self, "daysEligible");
  if (v3 > 1)
  {
    v5 = v3;
    -[NDOWarranty acLocalizedOfferDetailsPluralEligibilityFormat](self, "acLocalizedOfferDetailsPluralEligibilityFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[NDOWarranty acLocalizedOfferDetailsPluralEligibilityFormat](self, "acLocalizedOfferDetailsPluralEligibilityFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _NDOLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NDOWarranty acLocalizedOfferDetailsEligibility].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      v4 = 0;
    }
  }
  else
  {
    -[NDOWarranty acLocalizedOfferDetailsSingularEligibility](self, "acLocalizedOfferDetailsSingularEligibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (unsigned)daysEligible
{
  void *v2;
  unsigned int v3;

  -[NDOWarranty acOfferEligibleUntil](self, "acOfferEligibleUntil");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[NDOUtilities daysFromDate:](NDOUtilities, "daysFromDate:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NDOWarranty dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DictionaryRepresentation"));

}

- (NDOWarranty)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NDOWarranty *v12;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("DictionaryRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[NDOWarranty initWithDictionary:](self, "initWithDictionary:", v11);
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NDOWarranty dictionaryRepresentation](self, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NDOWarranty;
    v7 = -[NDOWarranty isEqual:](&v9, sel_isEqual_, v4);

  }
  return v7;
}

- (BOOL)covered
{
  return self->_covered;
}

- (void)setCovered:(BOOL)a3
{
  self->_covered = a3;
}

- (NSDate)coverageEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoverageEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)localizedCoveredDeviceDateLabelFormat
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalizedCoveredDeviceDateLabelFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)coverageLocalizedLabel
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCoverageLocalizedLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)coverageLocalizedDesc
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoverageLocalizedDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)coverageLocalizedDescLong
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoverageLocalizedDescLong:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)coverageLocalizedExpirationLabel
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCoverageLocalizedExpirationLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)footer1FormatString
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFooter1FormatString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)footer1LinkLabel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFooter1LinkLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)footer1LinkURL
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFooter1LinkURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)footer2FormatString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFooter2FormatString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)footer2LinkLabel
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFooter2LinkLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)footer2LinkURL
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFooter2LinkURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)acOfferEligible
{
  return self->_acOfferEligible;
}

- (void)setAcOfferEligible:(BOOL)a3
{
  self->_acOfferEligible = a3;
}

- (NSDate)acOfferEligibleUntil
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAcOfferEligibleUntil:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDate)acOfferFollowupDisplayDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAcOfferFollowupDisplayDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDate)acOfferDisplayDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAcOfferDisplayDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)acOfferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAcOfferIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)acLocalizedOfferLabel
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAcLocalizedOfferLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)acLocalizedOfferLongLabel
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAcLocalizedOfferLongLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)acLocalizedGroupedOfferFooterLabel
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAcLocalizedGroupedOfferFooterLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)acLocalizedOfferStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAcLocalizedOfferStatusLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)acLocalizedOfferPluralDescFormat
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAcLocalizedOfferPluralDescFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)acLocalizedOfferSingularDesc
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAcLocalizedOfferSingularDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)acNotificationLocalizedOfferLabel
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAcNotificationLocalizedOfferLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)acNotificationLocalizedOfferSingularDesc
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAcNotificationLocalizedOfferSingularDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)acNotificationLocalizedOfferPluralDescFormat
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAcNotificationLocalizedOfferPluralDescFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)acLocalizedOfferCTA
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAcLocalizedOfferCTA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)acLocalizedGroupedOfferCTA
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setAcLocalizedGroupedOfferCTA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)acLocalizedOfferDetails
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAcLocalizedOfferDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)acLocalizedOfferDetailsPluralEligibilityFormat
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setAcLocalizedOfferDetailsPluralEligibilityFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)acLocalizedOfferDetailsSingularEligibility
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAcLocalizedOfferDetailsSingularEligibility:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)acLocalizedUnlinkedPlanLabel
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAcLocalizedUnlinkedPlanLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)acLocalizedUnlinkedPlanStatusLabel
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setAcLocalizedUnlinkedPlanStatusLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (BOOL)acOfferDisplay
{
  return self->_acOfferDisplay;
}

- (void)setAcOfferDisplay:(BOOL)a3
{
  self->_acOfferDisplay = a3;
}

- (BOOL)acOfferSettingsAppBadge
{
  return self->_acOfferSettingsAppBadge;
}

- (void)setAcOfferSettingsAppBadge:(BOOL)a3
{
  self->_acOfferSettingsAppBadge = a3;
}

- (BOOL)acOfferSettingsRowBadge
{
  return self->_acOfferSettingsRowBadge;
}

- (void)setAcOfferSettingsRowBadge:(BOOL)a3
{
  self->_acOfferSettingsRowBadge = a3;
}

- (double)acOfferDurationBeforeEndDate
{
  return self->_acOfferDurationBeforeEndDate;
}

- (void)setAcOfferDurationBeforeEndDate:(double)a3
{
  self->_acOfferDurationBeforeEndDate = a3;
}

- (NSArray)acOfferToggle
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (void)setAcOfferToggle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSString)acOfferPromoFormat
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setAcOfferPromoFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSString)acOfferPromoNew
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (void)setAcOfferPromoNew:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (double)acOfferBadgeDurationBeforeEndDate
{
  return self->_acOfferBadgeDurationBeforeEndDate;
}

- (void)setAcOfferBadgeDurationBeforeEndDate:(double)a3
{
  self->_acOfferBadgeDurationBeforeEndDate = a3;
}

- (BOOL)coverageHasACLogo
{
  return self->_coverageHasACLogo;
}

- (void)setCoverageHasACLogo:(BOOL)a3
{
  self->_coverageHasACLogo = a3;
}

- (NSString)localizedCoverageSubTitleForServicesPartnerString
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setLocalizedCoverageSubTitleForServicesPartnerString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)localizedCoverageFooterFormatString
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setLocalizedCoverageFooterFormatString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSString)localizedCoverageFooterLinkLabel
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setLocalizedCoverageFooterLinkLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSString)localizedSupportAppLabel
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setLocalizedSupportAppLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSString)localizedSupportAppFooter
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLocalizedSupportAppFooter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (BOOL)isCoveragePlanSubscriptionType
{
  return self->_isCoveragePlanSubscriptionType;
}

- (void)setIsCoveragePlanSubscriptionType:(BOOL)a3
{
  self->_isCoveragePlanSubscriptionType = a3;
}

- (NSString)localizedManagePlanLabel
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setLocalizedManagePlanLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (BOOL)isACServicesPartner
{
  return self->_isACServicesPartner;
}

- (void)setIsACServicesPartner:(BOOL)a3
{
  self->_isACServicesPartner = a3;
}

- (NSDate)acOfferConversionDate
{
  return (NSDate *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAcOfferConversionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSDictionary)coverageDetailsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCoverageDetailsDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSString)localizedCoverageDetailsTitle
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setLocalizedCoverageDetailsTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSArray)coverageDetailsArray
{
  return (NSArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCoverageDetailsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSString)localizedCoverageDetailsLabel
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setLocalizedCoverageDetailsLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSString)localizedCoverageDetailsValue
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setLocalizedCoverageDetailsValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSDictionary)coverageBenefitsDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (void)setCoverageBenefitsDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSString)localizedBenefitsCardTitle
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLocalizedBenefitsCardTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSString)localizedBenefitsCardSubTitle
{
  return (NSString *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLocalizedBenefitsCardSubTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSArray)benefitDetailsArray
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setBenefitDetailsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSString)localizedBenefitsCardFooter
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLocalizedBenefitsCardFooter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (BOOL)displayRepairAndSupport
{
  return self->_displayRepairAndSupport;
}

- (void)setDisplayRepairAndSupport:(BOOL)a3
{
  self->_displayRepairAndSupport = a3;
}

- (NSString)agsURL
{
  return (NSString *)objc_getProperty(self, a2, 456, 1);
}

- (void)setAgsURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSString)agsULURL
{
  return (NSString *)objc_getProperty(self, a2, 464, 1);
}

- (void)setAgsULURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSString)deviceImageUrl
{
  return (NSString *)objc_getProperty(self, a2, 472, 1);
}

- (void)setDeviceImageUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSString)deviceDesc
{
  return (NSString *)objc_getProperty(self, a2, 480, 1);
}

- (void)setDeviceDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSString)sgId
{
  return (NSString *)objc_getProperty(self, a2, 488, 1);
}

- (void)setSgId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (NSString)pfcId
{
  return (NSString *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPfcId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (NSString)pgfId
{
  return (NSString *)objc_getProperty(self, a2, 504, 1);
}

- (void)setPgfId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSString)parentId
{
  return (NSString *)objc_getProperty(self, a2, 512, 1);
}

- (void)setParentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (NSString)supportAppURL
{
  return (NSString *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSupportAppURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (double)cacheValidityDuration
{
  return self->_cacheValidityDuration;
}

- (void)setCacheValidityDuration:(double)a3
{
  self->_cacheValidityDuration = a3;
}

- (BOOL)showNotificationToggle
{
  return self->_showNotificationToggle;
}

- (void)setShowNotificationToggle:(BOOL)a3
{
  self->_showNotificationToggle = a3;
}

- (double)showNotificationBeforeEndDate
{
  return self->_showNotificationBeforeEndDate;
}

- (void)setShowNotificationBeforeEndDate:(double)a3
{
  self->_showNotificationBeforeEndDate = a3;
}

- (NSString)getSupportURL
{
  return (NSString *)objc_getProperty(self, a2, 544, 1);
}

- (void)setGetSupportURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (NSString)mySupportURL
{
  return (NSString *)objc_getProperty(self, a2, 552, 1);
}

- (void)setMySupportURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (BOOL)isAPSSupported
{
  return self->_isAPSSupported;
}

- (void)setIsAPSSupported:(BOOL)a3
{
  self->_isAPSSupported = a3;
}

- (NSNumber)scIntervalInDays
{
  return (NSNumber *)objc_getProperty(self, a2, 560, 1);
}

- (void)setScIntervalInDays:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSString)eligibilityEventId
{
  return (NSString *)objc_getProperty(self, a2, 568, 1);
}

- (void)setEligibilityEventId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (BOOL)scIntervalFollowupEligible
{
  return self->_scIntervalFollowupEligible;
}

- (void)setScIntervalFollowupEligible:(BOOL)a3
{
  self->_scIntervalFollowupEligible = a3;
}

- (BOOL)scIntervalPairedDeviceAllowed
{
  return self->_scIntervalPairedDeviceAllowed;
}

- (void)setScIntervalPairedDeviceAllowed:(BOOL)a3
{
  self->_scIntervalPairedDeviceAllowed = a3;
}

- (NSDate)coverageValidityDate
{
  return (NSDate *)objc_getProperty(self, a2, 576, 1);
}

- (void)setCoverageValidityDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (NSString)localizedBenefitLabelKey
{
  return (NSString *)objc_getProperty(self, a2, 584, 1);
}

- (void)setLocalizedBenefitLabelKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (NSString)localizedBenefitValueKey
{
  return (NSString *)objc_getProperty(self, a2, 592, 1);
}

- (void)setLocalizedBenefitValueKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 600, 1);
}

- (void)setDictionaryRepresentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_localizedBenefitValueKey, 0);
  objc_storeStrong((id *)&self->_localizedBenefitLabelKey, 0);
  objc_storeStrong((id *)&self->_coverageValidityDate, 0);
  objc_storeStrong((id *)&self->_eligibilityEventId, 0);
  objc_storeStrong((id *)&self->_scIntervalInDays, 0);
  objc_storeStrong((id *)&self->_mySupportURL, 0);
  objc_storeStrong((id *)&self->_getSupportURL, 0);
  objc_storeStrong((id *)&self->_supportAppURL, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
  objc_storeStrong((id *)&self->_pgfId, 0);
  objc_storeStrong((id *)&self->_pfcId, 0);
  objc_storeStrong((id *)&self->_sgId, 0);
  objc_storeStrong((id *)&self->_deviceDesc, 0);
  objc_storeStrong((id *)&self->_deviceImageUrl, 0);
  objc_storeStrong((id *)&self->_agsULURL, 0);
  objc_storeStrong((id *)&self->_agsURL, 0);
  objc_storeStrong((id *)&self->_localizedBenefitsCardFooter, 0);
  objc_storeStrong((id *)&self->_benefitDetailsArray, 0);
  objc_storeStrong((id *)&self->_localizedBenefitsCardSubTitle, 0);
  objc_storeStrong((id *)&self->_localizedBenefitsCardTitle, 0);
  objc_storeStrong((id *)&self->_coverageBenefitsDictionary, 0);
  objc_storeStrong((id *)&self->_localizedCoverageDetailsValue, 0);
  objc_storeStrong((id *)&self->_localizedCoverageDetailsLabel, 0);
  objc_storeStrong((id *)&self->_coverageDetailsArray, 0);
  objc_storeStrong((id *)&self->_localizedCoverageDetailsTitle, 0);
  objc_storeStrong((id *)&self->_coverageDetailsDictionary, 0);
  objc_storeStrong((id *)&self->_acOfferConversionDate, 0);
  objc_storeStrong((id *)&self->_localizedManagePlanLabel, 0);
  objc_storeStrong((id *)&self->_localizedSupportAppFooter, 0);
  objc_storeStrong((id *)&self->_localizedSupportAppLabel, 0);
  objc_storeStrong((id *)&self->_localizedCoverageFooterLinkLabel, 0);
  objc_storeStrong((id *)&self->_localizedCoverageFooterFormatString, 0);
  objc_storeStrong((id *)&self->_localizedCoverageSubTitleForServicesPartnerString, 0);
  objc_storeStrong((id *)&self->_acOfferPromoNew, 0);
  objc_storeStrong((id *)&self->_acOfferPromoFormat, 0);
  objc_storeStrong((id *)&self->_acOfferToggle, 0);
  objc_storeStrong((id *)&self->_acLocalizedUnlinkedPlanStatusLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedUnlinkedPlanLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferDetailsSingularEligibility, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferDetailsPluralEligibilityFormat, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferDetails, 0);
  objc_storeStrong((id *)&self->_acLocalizedGroupedOfferCTA, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferCTA, 0);
  objc_storeStrong((id *)&self->_acNotificationLocalizedOfferPluralDescFormat, 0);
  objc_storeStrong((id *)&self->_acNotificationLocalizedOfferSingularDesc, 0);
  objc_storeStrong((id *)&self->_acNotificationLocalizedOfferLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferSingularDesc, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferPluralDescFormat, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferStatusLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedGroupedOfferFooterLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferLongLabel, 0);
  objc_storeStrong((id *)&self->_acLocalizedOfferLabel, 0);
  objc_storeStrong((id *)&self->_acOfferIdentifier, 0);
  objc_storeStrong((id *)&self->_acOfferDisplayDate, 0);
  objc_storeStrong((id *)&self->_acOfferFollowupDisplayDate, 0);
  objc_storeStrong((id *)&self->_acOfferEligibleUntil, 0);
  objc_storeStrong((id *)&self->_footer2LinkURL, 0);
  objc_storeStrong((id *)&self->_footer2LinkLabel, 0);
  objc_storeStrong((id *)&self->_footer2FormatString, 0);
  objc_storeStrong((id *)&self->_footer1LinkURL, 0);
  objc_storeStrong((id *)&self->_footer1LinkLabel, 0);
  objc_storeStrong((id *)&self->_footer1FormatString, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedExpirationLabel, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedDescLong, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedDesc, 0);
  objc_storeStrong((id *)&self->_coverageLocalizedLabel, 0);
  objc_storeStrong((id *)&self->_localizedCoveredDeviceDateLabelFormat, 0);
  objc_storeStrong((id *)&self->_coverageEndDate, 0);
}

- (void)acLocalizedOfferDesc
{
  OUTLINED_FUNCTION_1(&dword_22D064000, a1, a3, "acLocalizedOfferDesc: acLocalizedOfferPluralDescFormat is not a string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)acLocalizedNotificationOfferDesc
{
  OUTLINED_FUNCTION_1(&dword_22D064000, a1, a3, "acLocalizedNotificationOfferDesc: acNotificationLocalizedOfferPluralDescFormat is not a string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)acLocalizedOfferDetailsEligibility
{
  OUTLINED_FUNCTION_1(&dword_22D064000, a1, a3, "acLocalizedOfferDetailsEligibility: acLocalizedOfferDetailsPluralEligibilityFormat is not a string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end

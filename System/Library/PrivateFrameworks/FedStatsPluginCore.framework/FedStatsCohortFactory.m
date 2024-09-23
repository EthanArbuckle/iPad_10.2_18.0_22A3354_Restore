@implementation FedStatsCohortFactory

- (FedStatsCohortFactory)init
{
  FedStatsCohortFactory *result;
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
  uint64_t v13;
  NSDictionary *cohortObjects;
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
  FedStatsCohortFactory *v51;
  objc_super v52;
  _QWORD v53[46];
  _QWORD v54[48];

  v54[46] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)FedStatsCohortFactory;
  result = -[FedStatsCohortFactory init](&v52, sel_init);
  if (result)
  {
    v53[0] = CFSTR("locale");
    v51 = result;
    +[FedStatsCohortQueryLocale cohortInstance](FedStatsCohortQueryLocale, "cohortInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v50;
    v53[1] = CFSTR("deviceType");
    +[FedStatsCohortQueryDeviceType cohortInstance](FedStatsCohortQueryDeviceType, "cohortInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v49;
    v53[2] = CFSTR("numOfMediaApps");
    +[FedStatsCohortQueryInstalledApps cohortInstance](FedStatsCohortQueryInstalledAppsMedia, "cohortInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v48;
    v53[3] = CFSTR("numOfPhoneApps");
    +[FedStatsCohortQueryInstalledApps cohortInstance](FedStatsCohortQueryInstalledAppsPhone, "cohortInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v47;
    v53[4] = CFSTR("bundleID");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = v46;
    v53[5] = CFSTR("sessionType");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54[5] = v45;
    v53[6] = CFSTR("sessionState");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54[6] = v44;
    v53[7] = CFSTR("supportsBackgrounding");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[7] = v43;
    v53[8] = CFSTR("supportsStateRestoration");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v54[8] = v42;
    v53[9] = CFSTR("eventName");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[9] = v41;
    v53[10] = CFSTR("measure");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v54[10] = v40;
    v53[11] = CFSTR("extra");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54[11] = v39;
    v53[12] = CFSTR("issuer");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[12] = v38;
    v53[13] = CFSTR("dayOfWeek");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v54[13] = v37;
    v53[14] = CFSTR("hourOfDay");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v54[14] = v36;
    v53[15] = CFSTR("geohash");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54[15] = v35;
    v53[16] = CFSTR("country");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v54[16] = v34;
    v53[17] = CFSTR("timeZone");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[17] = v33;
    v53[18] = CFSTR("interfaceType");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[18] = v32;
    v53[19] = CFSTR("radioType");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54[19] = v31;
    v53[20] = CFSTR("radioBand");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[20] = v30;
    v53[21] = CFSTR("addressFamily");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54[21] = v29;
    v53[22] = CFSTR("lang");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v54[22] = v28;
    v53[23] = CFSTR("platform");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54[23] = v27;
    v53[24] = CFSTR("performanceEvent");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54[24] = v26;
    v53[25] = CFSTR("signal");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v54[25] = v25;
    v53[26] = CFSTR("userAgent");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54[26] = v24;
    v53[27] = CFSTR("countryCode");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54[27] = v23;
    v53[28] = CFSTR("error");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[28] = v22;
    v53[29] = CFSTR("localeIdentifier");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54[29] = v21;
    v53[30] = CFSTR("contentType");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v54[30] = v20;
    v53[31] = CFSTR("ageGroup");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[31] = v19;
    v53[32] = CFSTR("eventDirection");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54[32] = v18;
    v53[33] = CFSTR("isNativeArchitecture");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v54[33] = v17;
    v53[34] = CFSTR("dyldPlatform");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54[34] = v16;
    v53[35] = CFSTR("type");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v54[35] = v15;
    v53[36] = CFSTR("screenDistance");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v54[36] = v3;
    v53[37] = CFSTR("action");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v54[37] = v4;
    v53[38] = CFSTR("gestureAssessment");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v54[38] = v5;
    v53[39] = CFSTR("livenessAssessment");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v54[39] = v6;
    v53[40] = CFSTR("property");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v54[40] = v7;
    v53[41] = CFSTR("accessedPropertyDirectly");
    +[FedStatsCohortQueryFieldGeneric cohortQueryFieldWithKey:](FedStatsCohortQueryFieldGeneric, "cohortQueryFieldWithKey:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v54[41] = v8;
    v53[42] = CFSTR("geohash1");
    +[FedStatsCohortGeohash cohortInstanceWithPrecision:](FedStatsCohortGeohash, "cohortInstanceWithPrecision:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v54[42] = v9;
    v53[43] = CFSTR("geohash2");
    +[FedStatsCohortGeohash cohortInstanceWithPrecision:](FedStatsCohortGeohash, "cohortInstanceWithPrecision:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54[43] = v10;
    v53[44] = CFSTR("geohash3");
    +[FedStatsCohortGeohash cohortInstanceWithPrecision:](FedStatsCohortGeohash, "cohortInstanceWithPrecision:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54[44] = v11;
    v53[45] = CFSTR("geohash4");
    +[FedStatsCohortGeohash cohortInstanceWithPrecision:](FedStatsCohortGeohash, "cohortInstanceWithPrecision:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54[45] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 46);
    v13 = objc_claimAutoreleasedReturnValue();
    cohortObjects = v51->_cohortObjects;
    v51->_cohortObjects = (NSDictionary *)v13;

    return v51;
  }
  return result;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__FedStatsCohortFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __39__FedStatsCohortFactory_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

+ (id)cohortQueryFieldByName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[FedStatsCohortFactory sharedInstance](FedStatsCohortFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cohortObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)cohortObjects
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortObjects, 0);
}

@end

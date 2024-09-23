@implementation CPAnalyticsSystemProperties

- (CPAnalyticsSystemProperties)init
{
  CPAnalyticsSystemProperties *v2;
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPAnalyticsSystemProperties;
  v2 = -[CPAnalyticsSystemProperties init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[CPAnalyticsSystemProperties setSystemProperties:](v2, "setSystemProperties:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[CPAnalyticsSystemProperties setDynamicProperties:](v2, "setDynamicProperties:", v4);

  }
  return v2;
}

- (void)setSystemProperties:(id)a3
{
  objc_storeStrong((id *)&self->_systemProperties, a3);
}

- (void)setDynamicProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProperties, a3);
}

- (void)addProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[CPAnalyticsSystemProperties systemProperties](self, "systemProperties");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v6, v7);

  }
}

- (void)addDynamicProperty:(id)a3 withProvider:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CPAnalyticsSystemProperties dynamicProperties](self, "dynamicProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

}

- (id)propertyForKey:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CPAnalyticsSystemProperties systemProperties](self, "systemProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    -[CPAnalyticsSystemProperties dynamicProperties](self, "dynamicProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "getDynamicProperty:forEventName:payloadForSystemPropertyExtraction:", v8, v9, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)removePhotoLibraryProperties
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CPAnalyticsSystemProperties systemProperties](self, "systemProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "staticPhotoLibraryProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsForKeys:", v4);

  -[CPAnalyticsSystemProperties dynamicProperties](self, "dynamicProperties");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dynamicPhotoLibraryProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsForKeys:", v5);

}

- (NSMutableDictionary)systemProperties
{
  return self->_systemProperties;
}

- (NSMutableDictionary)dynamicProperties
{
  return self->_dynamicProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicProperties, 0);
  objc_storeStrong((id *)&self->_systemProperties, 0);
}

+ (NSArray)staticPhotoLibraryProperties
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("cpa_common_photoCount");
  v3[1] = CFSTR("cpa_common_videoCount");
  v3[2] = CFSTR("cpa_common_collectionCount");
  v3[3] = CFSTR("cpa_common_librarySizeRange");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSArray)dynamicPhotoLibraryProperties
{
  _QWORD v3[16];

  v3[15] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("cpa_common_icpl_enabled");
  v3[1] = CFSTR("cpa_common_icpl_exceedingQuota");
  v3[2] = CFSTR("cpa_common_icpl_lowDiskSpace");
  v3[3] = CFSTR("cpa_common_icpl_veryLowDiskSpace");
  v3[4] = CFSTR("cpa_common_icpl_hasChangesToProcess");
  v3[5] = CFSTR("cpa_media_type");
  v3[6] = CFSTR("cpa_media_subType");
  v3[7] = CFSTR("cpa_media_age");
  v3[8] = CFSTR("cpa_media_duration");
  v3[9] = CFSTR("cpa_media_localIdentifier");
  v3[10] = CFSTR("cpa_media_ageInMinutes");
  v3[11] = CFSTR("cpa_media_sceneType");
  v3[12] = CFSTR("cpa_media_subject");
  v3[13] = CFSTR("cpa_media_uuid");
  v3[14] = CFSTR("cpa_common_sharedLibraryEnabled");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 15);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

@end

@implementation NTKPigmentCollectionConfig

- (void)overridePropertiesFromConfig:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  objc_msgSend(v32, "defaultColorOptionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v32, "defaultColorOptionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setDefaultColorOptionName:](self, "setDefaultColorOptionName:", v5);

  }
  objc_msgSend(v32, "sensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v32, "sensitivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setSensitivity:](self, "setSensitivity:", v7);

  }
  objc_msgSend(v32, "isAddable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v32, "isAddable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setIsAddable:](self, "setIsAddable:", v9);

  }
  objc_msgSend(v32, "supportsSlider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v32, "supportsSlider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setSupportsSlider:](self, "setSupportsSlider:", v11);

  }
  -[NTKPigmentCollectionConfig migration](self, "migration");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        objc_msgSend(v32, "migration"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    -[NTKPigmentCollectionConfig migration](self, "migration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v32, "migration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v17);

  }
  else
  {
    objc_msgSend(v32, "migration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v32;
    if (!v18)
      goto LABEL_15;
    objc_msgSend(v32, "migration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NTKPigmentCollectionConfig setMigration:](self, "setMigration:", v16);

  v19 = v32;
LABEL_15:
  objc_msgSend(v19, "exclusions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NTKPigmentCollectionConfig exclusions](self, "exclusions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "exclusions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setExclusions:](self, "setExclusions:", v23);

  }
  objc_msgSend(v32, "excludesDuotone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v32, "excludesDuotone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setExcludesDuotone:](self, "setExcludesDuotone:", v25);

  }
  objc_msgSend(v32, "collectionOverride");

  objc_msgSend(v32, "defaultGalleryColorNames");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v32, "defaultGalleryColorNames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setDefaultGalleryColorNames:](self, "setDefaultGalleryColorNames:", v27);

  }
  objc_msgSend(v32, "defaultColorOptionName");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    objc_msgSend(v32, "defaultConfigAttributeName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v32, "defaultConfigAttributeName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollectionConfig setDefaultConfigAttributeName:](self, "setDefaultConfigAttributeName:", v31);

    }
  }

}

- (void)removeExcludedItemsFromList:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v15 = a3;
  -[NTKPigmentCollectionConfig exclusions](self, "exclusions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v15, "count");

    if (!v5)
      goto LABEL_8;
    goto LABEL_6;
  }
  -[NTKPigmentCollectionConfig excludesDuotone](self, "excludesDuotone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "BOOLValue"))
  {
LABEL_7:

    goto LABEL_8;
  }
  v7 = objc_msgSend(v15, "count");

  if (v7)
  {
LABEL_6:
    v8 = (void *)MEMORY[0x1E0C99E20];
    -[NTKPigmentCollectionConfig exclusions](self, "exclusions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKPigmentCollectionConfig exclusions](self, "exclusions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke;
    v19[3] = &unk_1E6BCD930;
    v13 = v10;
    v20 = v13;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);

    v14 = (void *)objc_msgSend(v15, "copy");
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke_2;
    v16[3] = &unk_1E6BD0B40;
    v16[4] = self;
    v17 = v15;
    v18 = v13;
    v4 = v13;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

    v6 = v20;
    goto LABEL_7;
  }
LABEL_8:

}

void __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "containsString:", CFSTR(":")))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __58__NTKPigmentCollectionConfig_removeExcludedItemsFromList___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "isMultitoneOption"))
  {
    objc_msgSend(*(id *)(a1 + 32), "excludesDuotone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    if ((v4 & 1) != 0)
      goto LABEL_7;
  }
  if (objc_msgSend(v11, "isMultitoneOption"))
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v11, "multitoneNamesWithoutCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((v5 & 1) != 0)
      goto LABEL_7;
  }
  v7 = *(void **)(a1 + 48);
  objc_msgSend(v11, "effectiveOptionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((v7 & 1) != 0
    || (v9 = *(void **)(a1 + 48),
        objc_msgSend(v11, "fullname"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10),
        v10,
        (_DWORD)v9))
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v11);
  }

}

- (void)applyCollectionOverrideNameOnItems:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[NTKPigmentCollectionConfig collectionOverride](self, "collectionOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    v6 = objc_msgSend(v14, "count");

    v5 = v14;
    if (v6)
    {
      v7 = (void *)objc_msgSend(v14, "copy");
      if (objc_msgSend(v7, "count"))
      {
        v8 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "collectionName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "effectiveCollectionName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", v11))
          {
            -[NTKPigmentCollectionConfig collectionOverride](self, "collectionOverride");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v9, "copyWithCollectionOverride:", v12);

            objc_msgSend(v14, "removeObject:", v9);
            if (objc_msgSend(v14, "count") - 1 <= v8)
              objc_msgSend(v14, "addObject:", v13);
            else
              objc_msgSend(v14, "insertObject:atIndex:", v13, v8);

          }
          ++v8;
        }
        while (objc_msgSend(v7, "count") > v8);
      }

      v5 = v14;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_defaultColorOptionName, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_fallbackDefaultColorOptionName, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_defaultConfigAttributeName, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSArray copy](self->_defaultGalleryColorNames, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSNumber copy](self->_sensitivity, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSNumber copy](self->_isAddable, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[NSNumber copy](self->_excludesDuotone, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSDictionary copy](self->_migration, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSString copy](self->_featureFlag, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_supportsSlider, "copy");
  v24 = (void *)v4[7];
  v4[7] = v23;

  v25 = -[NSNumber copy](self->_sortedByHue, "copy");
  v26 = (void *)v4[11];
  v4[11] = v25;

  v27 = -[NSArray copy](self->_exclusions, "copy");
  v28 = (void *)v4[12];
  v4[12] = v27;

  v29 = -[NSString copy](self->_collectionOverride, "copy");
  v30 = (void *)v4[13];
  v4[13] = v29;

  v31 = -[NSNumber copy](self->_sku, "copy");
  v32 = (void *)v4[14];
  v4[14] = v31;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  uint64_t *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  NSDictionary *migration;
  _QWORD v26[4];
  void **v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v4 = (void **)a3;
  if (v4)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v32 = NTKEqualObjects(self->_defaultColorOptionName, v4[1]);
    v5 = v30;
    if (*((_BYTE *)v30 + 24))
    {
      v6 = NTKEqualObjects(self->_fallbackDefaultColorOptionName, v4[2]);
      v5 = v30;
      *((_BYTE *)v30 + 24) = v6;
      if (v6)
      {
        v7 = NTKEqualObjects(self->_defaultConfigAttributeName, v4[3]);
        v5 = v30;
        *((_BYTE *)v30 + 24) = v7;
        if (v7)
        {
          v8 = NTKEqualObjects(self->_sensitivity, v4[5]);
          v5 = v30;
          *((_BYTE *)v30 + 24) = v8;
          if (v8)
          {
            v9 = NTKEqualObjects(self->_isAddable, v4[6]);
            v5 = v30;
            *((_BYTE *)v30 + 24) = v9;
            if (v9)
            {
              v10 = NTKEqualObjects(self->_supportsSlider, v4[7]);
              v5 = v30;
              *((_BYTE *)v30 + 24) = v10;
              if (v10)
              {
                v11 = NTKEqualObjects(self->_featureFlag, v4[10]);
                v5 = v30;
                *((_BYTE *)v30 + 24) = v11;
                if (v11)
                {
                  v12 = NTKEqualObjects(self->_sortedByHue, v4[11]);
                  v5 = v30;
                  *((_BYTE *)v30 + 24) = v12;
                  if (v12)
                  {
                    v13 = NTKEqualObjects(self->_collectionOverride, v4[13]);
                    v5 = v30;
                    *((_BYTE *)v30 + 24) = v13;
                    if (v13)
                    {
                      v14 = self->_excludesDuotone == v4[8];
                      *((_BYTE *)v5 + 24) = v14;
                      if (v14)
                      {
                        v15 = -[NSArray count](self->_exclusions, "count");
                        v16 = objc_msgSend(v4[12], "count");
                        v5 = v30;
                        *((_BYTE *)v30 + 24) = v15 == v16;
                        if (v15 == v16)
                        {
                          v17 = -[NSDictionary count](self->_migration, "count");
                          v18 = objc_msgSend(v4[9], "count");
                          *((_BYTE *)v30 + 24) = v17 == v18;
                          if (v17 != v18)
                            goto LABEL_35;
                          v19 = 0;
                          while (-[NSArray count](self->_exclusions, "count") > v19)
                          {
                            -[NSArray objectAtIndexedSubscript:](self->_exclusions, "objectAtIndexedSubscript:", v19);
                            v20 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v4[12], "objectAtIndexedSubscript:", v19);
                            v21 = (void *)objc_claimAutoreleasedReturnValue();
                            v22 = objc_msgSend(v20, "isEqualToString:", v21);
                            *((_BYTE *)v30 + 24) = v22;

                            v23 = 0;
                            ++v19;
                            if (!*((_BYTE *)v30 + 24))
                              goto LABEL_31;
                          }
                          if (*((_BYTE *)v30 + 24))
                          {
                            migration = self->_migration;
                            v26[0] = MEMORY[0x1E0C809B0];
                            v26[1] = 3221225472;
                            v26[2] = __38__NTKPigmentCollectionConfig_isEqual___block_invoke;
                            v26[3] = &unk_1E6BD9EB8;
                            v27 = v4;
                            v28 = &v29;
                            -[NSDictionary enumerateKeysAndObjectsUsingBlock:](migration, "enumerateKeysAndObjectsUsingBlock:", v26);

                            v23 = *((_BYTE *)v30 + 24) != 0;
                          }
                          else
                          {
LABEL_35:
                            v23 = 0;
                          }
                          goto LABEL_31;
                        }
LABEL_30:
                        v23 = 0;
                        *((_BYTE *)v5 + 24) = 0;
LABEL_31:
                        _Block_object_dispose(&v29, 8);
                        goto LABEL_32;
                      }
LABEL_29:
                      *((_BYTE *)v5 + 24) = 0;
                      goto LABEL_30;
                    }
LABEL_28:
                    *((_BYTE *)v5 + 24) = 0;
                    goto LABEL_29;
                  }
LABEL_27:
                  *((_BYTE *)v5 + 24) = 0;
                  goto LABEL_28;
                }
LABEL_26:
                *((_BYTE *)v5 + 24) = 0;
                goto LABEL_27;
              }
LABEL_25:
              *((_BYTE *)v5 + 24) = 0;
              goto LABEL_26;
            }
LABEL_24:
            *((_BYTE *)v5 + 24) = 0;
            goto LABEL_25;
          }
LABEL_23:
          *((_BYTE *)v5 + 24) = 0;
          goto LABEL_24;
        }
LABEL_22:
        *((_BYTE *)v5 + 24) = 0;
        goto LABEL_23;
      }
    }
    else
    {
      *((_BYTE *)v30 + 24) = 0;
    }
    *((_BYTE *)v5 + 24) = 0;
    goto LABEL_22;
  }
  v23 = 0;
LABEL_32:

  return v23;
}

void __38__NTKPigmentCollectionConfig_isEqual___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = NTKEqualObjects(v8, v9);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;

}

- (id)description
{
  void *v2;
  NSString *collectionOverride;
  NSString *defaultColorOptionName;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  collectionOverride = self->_collectionOverride;
  defaultColorOptionName = self->_defaultColorOptionName;
  -[NSArray ntk_flatDescription](self->_defaultGalleryColorNames, "ntk_flatDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("config [collectionOverride: %@, defaultColorOptionName:%@, defaultGalleryColorNames:%@]"), collectionOverride, defaultColorOptionName, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)collectionConfigFromProtoBuffer:(id)a3
{
  id v3;
  NTKPigmentCollectionConfig *v4;
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
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(NTKPigmentCollectionConfig);
    objc_msgSend(v3, "defaultColorOptionName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setDefaultColorOptionName:](v4, "setDefaultColorOptionName:", v5);

    objc_msgSend(v3, "fallbackDefaultColorOptionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setFallbackDefaultColorOptionName:](v4, "setFallbackDefaultColorOptionName:", v6);

    objc_msgSend(v3, "defaultConfigAttributeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setDefaultConfigAttributeName:](v4, "setDefaultConfigAttributeName:", v7);

    if (objc_msgSend(v3, "hasSensitivity"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "sensitivity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollectionConfig setSensitivity:](v4, "setSensitivity:", v8);

    }
    if (objc_msgSend(v3, "hasIsAddable"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isAddable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollectionConfig setIsAddable:](v4, "setIsAddable:", v9);

    }
    if (objc_msgSend(v3, "hasSupportsSlider"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "supportsSlider"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollectionConfig setSupportsSlider:](v4, "setSupportsSlider:", v10);

    }
    objc_msgSend(v3, "featureFlag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setFeatureFlag:](v4, "setFeatureFlag:", v11);

    if (objc_msgSend(v3, "hasSortedByHue"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "sortedByHue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollectionConfig setSortedByHue:](v4, "setSortedByHue:", v12);

    }
    if (objc_msgSend(v3, "hasExcludesDuotone"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "excludesDuotone"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPigmentCollectionConfig setExcludesDuotone:](v4, "setExcludesDuotone:", v13);

    }
    objc_msgSend(v3, "collectionOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setCollectionOverride:](v4, "setCollectionOverride:", v14);

    objc_msgSend(v3, "exclusions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setExclusions:](v4, "setExclusions:", v15);

    objc_msgSend(v3, "migrations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "migrationsCount"));
      objc_msgSend(v3, "migrations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__NTKPigmentCollectionConfig_collectionConfigFromProtoBuffer___block_invoke;
      v22[3] = &unk_1E6BD9EE0;
      v23 = v17;
      v19 = v17;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v22);

      -[NTKPigmentCollectionConfig setMigration:](v4, "setMigration:", v19);
    }
    objc_msgSend(v3, "defaultGalleryColorNames");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKPigmentCollectionConfig setDefaultGalleryColorNames:](v4, "setDefaultGalleryColorNames:", v20);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __62__NTKPigmentCollectionConfig_collectionConfigFromProtoBuffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "from");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v9, "to");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v9, "to");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v9, "from");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
  }

}

- (id)protoBuffer
{
  NTKProtoPigmentCollectionConfig *v3;
  void *v4;
  void *v5;
  void *v6;
  NSNumber *sensitivity;
  NSNumber *isAddable;
  NSNumber *supportsSlider;
  NSNumber *sortedByHue;
  NSNumber *excludesDuotone;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *migration;
  NTKProtoPigmentCollectionConfig *v16;
  _QWORD v18[4];
  NTKProtoPigmentCollectionConfig *v19;

  v3 = objc_alloc_init(NTKProtoPigmentCollectionConfig);
  v4 = (void *)-[NSString copy](self->_defaultColorOptionName, "copy");
  -[NTKProtoPigmentCollectionConfig setDefaultColorOptionName:](v3, "setDefaultColorOptionName:", v4);

  v5 = (void *)-[NSString copy](self->_fallbackDefaultColorOptionName, "copy");
  -[NTKProtoPigmentCollectionConfig setFallbackDefaultColorOptionName:](v3, "setFallbackDefaultColorOptionName:", v5);

  v6 = (void *)-[NSString copy](self->_defaultConfigAttributeName, "copy");
  -[NTKProtoPigmentCollectionConfig setDefaultConfigAttributeName:](v3, "setDefaultConfigAttributeName:", v6);

  sensitivity = self->_sensitivity;
  if (sensitivity)
    -[NTKProtoPigmentCollectionConfig setSensitivity:](v3, "setSensitivity:", -[NSNumber BOOLValue](sensitivity, "BOOLValue"));
  isAddable = self->_isAddable;
  if (isAddable)
    -[NTKProtoPigmentCollectionConfig setIsAddable:](v3, "setIsAddable:", -[NSNumber BOOLValue](isAddable, "BOOLValue"));
  supportsSlider = self->_supportsSlider;
  if (supportsSlider)
    -[NTKProtoPigmentCollectionConfig setSupportsSlider:](v3, "setSupportsSlider:", -[NSNumber BOOLValue](supportsSlider, "BOOLValue"));
  -[NTKProtoPigmentCollectionConfig setFeatureFlag:](v3, "setFeatureFlag:", self->_featureFlag);
  sortedByHue = self->_sortedByHue;
  if (sortedByHue)
    -[NTKProtoPigmentCollectionConfig setSortedByHue:](v3, "setSortedByHue:", -[NSNumber BOOLValue](sortedByHue, "BOOLValue"));
  excludesDuotone = self->_excludesDuotone;
  if (excludesDuotone)
    -[NTKProtoPigmentCollectionConfig setExcludesDuotone:](v3, "setExcludesDuotone:", -[NSNumber BOOLValue](excludesDuotone, "BOOLValue"));
  v12 = (void *)-[NSArray copy](self->_defaultGalleryColorNames, "copy");
  -[NTKProtoPigmentCollectionConfig setDefaultGalleryColorNames:](v3, "setDefaultGalleryColorNames:", v12);

  v13 = (void *)-[NSArray copy](self->_exclusions, "copy");
  -[NTKProtoPigmentCollectionConfig setExclusions:](v3, "setExclusions:", v13);

  v14 = (void *)-[NSString copy](self->_collectionOverride, "copy");
  -[NTKProtoPigmentCollectionConfig setCollectionOverride:](v3, "setCollectionOverride:", v14);

  migration = self->_migration;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__NTKPigmentCollectionConfig_protoBuffer__block_invoke;
  v18[3] = &unk_1E6BD9F08;
  v16 = v3;
  v19 = v16;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](migration, "enumerateKeysAndObjectsUsingBlock:", v18);

  return v16;
}

void __41__NTKPigmentCollectionConfig_protoBuffer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NTKProtoMigration *v9;

  v5 = a3;
  v6 = a2;
  v9 = objc_alloc_init(NTKProtoMigration);
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NTKProtoMigration setFrom:](v9, "setFrom:", v7);
  v8 = (void *)objc_msgSend(v5, "copy");

  -[NTKProtoMigration setTo:](v9, "setTo:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addMigration:", v9);

}

- (NSString)defaultColorOptionName
{
  return self->_defaultColorOptionName;
}

- (void)setDefaultColorOptionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fallbackDefaultColorOptionName
{
  return self->_fallbackDefaultColorOptionName;
}

- (void)setFallbackDefaultColorOptionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)defaultConfigAttributeName
{
  return self->_defaultConfigAttributeName;
}

- (void)setDefaultConfigAttributeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)defaultGalleryColorNames
{
  return self->_defaultGalleryColorNames;
}

- (void)setDefaultGalleryColorNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)isAddable
{
  return self->_isAddable;
}

- (void)setIsAddable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)supportsSlider
{
  return self->_supportsSlider;
}

- (void)setSupportsSlider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)excludesDuotone
{
  return self->_excludesDuotone;
}

- (void)setExcludesDuotone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)migration
{
  return self->_migration;
}

- (void)setMigration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)sortedByHue
{
  return self->_sortedByHue;
}

- (void)setSortedByHue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)exclusions
{
  return self->_exclusions;
}

- (void)setExclusions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)collectionOverride
{
  return self->_collectionOverride;
}

- (void)setCollectionOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)sku
{
  return self->_sku;
}

- (void)setSku:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sku, 0);
  objc_storeStrong((id *)&self->_collectionOverride, 0);
  objc_storeStrong((id *)&self->_exclusions, 0);
  objc_storeStrong((id *)&self->_sortedByHue, 0);
  objc_storeStrong((id *)&self->_featureFlag, 0);
  objc_storeStrong((id *)&self->_migration, 0);
  objc_storeStrong((id *)&self->_excludesDuotone, 0);
  objc_storeStrong((id *)&self->_supportsSlider, 0);
  objc_storeStrong((id *)&self->_isAddable, 0);
  objc_storeStrong((id *)&self->_sensitivity, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColorNames, 0);
  objc_storeStrong((id *)&self->_defaultConfigAttributeName, 0);
  objc_storeStrong((id *)&self->_fallbackDefaultColorOptionName, 0);
  objc_storeStrong((id *)&self->_defaultColorOptionName, 0);
}

@end

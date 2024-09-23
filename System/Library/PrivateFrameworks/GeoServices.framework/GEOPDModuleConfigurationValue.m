@implementation GEOPDModuleConfigurationValue

- (GEOPDModuleConfigurationValue)init
{
  GEOPDModuleConfigurationValue *v2;
  GEOPDModuleConfigurationValue *v3;
  GEOPDModuleConfigurationValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDModuleConfigurationValue;
  v2 = -[GEOPDModuleConfigurationValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDModuleConfigurationValue)initWithData:(id)a3
{
  GEOPDModuleConfigurationValue *v3;
  GEOPDModuleConfigurationValue *v4;
  GEOPDModuleConfigurationValue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDModuleConfigurationValue;
  v3 = -[GEOPDModuleConfigurationValue initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRibbonModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRibbonModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)ribbonModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readRibbonModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readButtonModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtonModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)buttonModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readButtonModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readWebModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWebModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)webModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readWebModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)setWebModuleConfiguration:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x400u;
    *(_WORD *)(a1 + 116) |= 0x800u;
    objc_storeStrong((id *)(a1 + 96), a2);
  }

}

- (void)_readTemplatePlaceModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTemplatePlaceModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)templatePlaceModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readTemplatePlaceModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)_readPlaceInfosModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceInfosModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)placeInfosModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readPlaceInfosModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readBusinessInfosModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessInfosModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)businessInfosModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readBusinessInfosModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readHeaderButtonsConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHeaderButtonsConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)headerButtonsConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readHeaderButtonsConfiguration]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readUnifiedActionModuleConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnifiedActionModuleConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)unifiedActionModuleConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDModuleConfigurationValue _readUnifiedActionModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDModuleConfigurationValue;
  -[GEOPDModuleConfigurationValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDModuleConfigurationValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDModuleConfigurationValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v56[4];
  id v57;

  if (!a1)
    return 0;
  -[GEOPDModuleConfigurationValue readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDModuleConfigurationValue ribbonModuleConfiguration]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("ribbonModuleConfiguration");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("ribbon_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDModuleConfigurationValue buttonModuleConfiguration]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("buttonModuleConfiguration");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("button_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedPlaceModuleConfiguration_tags);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v15 = *(id *)(a1 + 64);
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("relatedPlaceModuleConfiguration");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("related_place_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  -[GEOPDModuleConfigurationValue webModuleConfiguration]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("webModuleConfiguration");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("web_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  -[GEOPDModuleConfigurationValue templatePlaceModuleConfiguration]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("templatePlaceModuleConfiguration");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("template_place_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDModuleConfigurationValue placeInfosModuleConfiguration]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("placeInfosModuleConfiguration");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("place_infos_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  -[GEOPDModuleConfigurationValue businessInfosModuleConfiguration]((id *)a1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("businessInfosModuleConfiguration");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("business_infos_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  -[GEOPDModuleConfigurationValue headerButtonsConfiguration]((id *)a1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("headerButtonsConfiguration");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("header_buttons_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  -[GEOPDModuleConfigurationValue unifiedActionModuleConfiguration]((id *)a1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("unifiedActionModuleConfiguration");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("unified_action_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
  {
    v43 = *(void **)(a1 + 8);
    if (v43)
    {
      v44 = v43;
      objc_sync_enter(v44);
      GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikingAssociationModuleConfiguration_tags);
      objc_sync_exit(v44);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v45 = *(id *)(a1 + 48);
  v46 = v45;
  if (v45)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v45, "jsonRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("hikingAssociationModuleConfiguration");
    }
    else
    {
      objc_msgSend(v45, "dictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("hiking_association_module_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

  }
  v49 = *(void **)(a1 + 16);
  if (v49)
  {
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __59__GEOPDModuleConfigurationValue__dictionaryRepresentation___block_invoke;
      v56[3] = &unk_1E1C00600;
      v53 = v52;
      v57 = v53;
      objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v56);
      v54 = v53;

      v51 = v54;
    }
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDModuleConfigurationValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5019;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5020;
      GEOPDModuleConfigurationValueReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDPlaceInfosModuleConfiguration readAll:](*(_QWORD *)(a1 + 56), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __59__GEOPDModuleConfigurationValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id *v6;
  const __CFString *v7;
  void *v8;
  int *v9;
  GEOPDPlaceRibbonConfiguration *v10;
  GEOPDPlaceRibbonConfiguration *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  GEOPDRibbonItem *v26;
  GEOPDRibbonItem *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  GEOPDFactoidRibbonItem *v34;
  id v35;
  void *v36;
  unsigned int v37;
  GEOPDFactoidRibbonItem *v38;
  void *v39;
  GEOPDAmenityRibbonItem *v40;
  GEOPDAmenityRibbonItem *v41;
  id v42;
  GEOPDAmenityRibbonItem *v43;
  void *v44;
  GEOPDAmenityRibbonItem *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  GEOPDAmenityRibbonItem *v53;
  uint64_t v54;
  GEOPDPlaceRibbonConfiguration *v55;
  const __CFString *v56;
  void *v57;
  GEOPDButtonModuleConfiguration *v58;
  id v59;
  const __CFString *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  uint64_t v67;
  GEOPDButtonItem *v68;
  GEOPDButtonItem *v69;
  GEOPDButtonItem *v70;
  GEOPDButtonModuleConfiguration *v71;
  const __CFString *v72;
  void *v73;
  GEOPDRelatedPlaceModuleConfiguration *v74;
  id v75;
  const __CFString *v76;
  void *v77;
  int v78;
  int v79;
  const __CFString *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  uint64_t v87;
  GEOLocalizedString *v88;
  GEOLocalizedString *v89;
  GEOLocalizedString *v90;
  int v91;
  const __CFString *v92;
  void *v93;
  int v94;
  GEOPDRelatedPlaceModuleConfiguration *v95;
  const __CFString *v96;
  void *v97;
  GEOPDWebModuleConfiguration *v98;
  id v99;
  void *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  char v104;
  void *v105;
  int v106;
  const __CFString *v107;
  void *v108;
  GEOPDTemplatePlaceModuleConfiguration *v109;
  void *v110;
  id v111;
  const __CFString *v112;
  void *v113;
  GEOPDPlaceInfosModuleConfiguration *v114;
  GEOPDPlaceInfosModuleConfiguration *v115;
  id v116;
  const __CFString *v117;
  void *v118;
  GEOPDLocationInfoItem *v119;
  id v120;
  int v121;
  void *v122;
  id v123;
  int v124;
  GEOPDLocationInfoItem *v125;
  const __CFString *v126;
  void *v127;
  void *v128;
  GEOPDFactoidInfoItem *v129;
  GEOPDFactoidInfoItem *v130;
  id v131;
  GEOPDFactoidInfoItem *v132;
  void *v133;
  GEOPDFactoidInfoItem *v134;
  int v135;
  const __CFString *v136;
  void *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  const __CFString *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  GEOPDFactoidReference *v145;
  GEOPDFactoidReference *v146;
  id v147;
  uint64_t v148;
  void *v149;
  int v150;
  void *v151;
  id v152;
  int v153;
  uint64_t v154;
  GEOPDFactoidInfoItem *v155;
  const __CFString *v156;
  void *v157;
  void *v158;
  id v159;
  int v160;
  id v161;
  const __CFString *v162;
  void *v163;
  GEOPDBusinessInfosModuleConfiguration *v164;
  id v165;
  const __CFString *v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t m;
  void *v173;
  GEOPDBusinessInfosModuleConfiguration *v174;
  const __CFString *v175;
  void *v176;
  GEOPDHeaderButtonsConfiguration *v177;
  id v178;
  const __CFString *v179;
  void *v180;
  char v181;
  GEOPDHeaderButtonsConfiguration *v182;
  const __CFString *v183;
  void *v184;
  GEOPDUnifiedActionModuleConfiguration *v185;
  id v186;
  const __CFString *v187;
  void *v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t n;
  uint64_t v194;
  GEOPDButtonItem *v195;
  GEOPDButtonItem *v196;
  GEOPDButtonItem *v197;
  GEOPDUnifiedActionModuleConfiguration *v198;
  const __CFString *v199;
  void *v200;
  GEOPDHikingAssociationModuleConfiguration *v201;
  id v202;
  const __CFString *v203;
  void *v204;
  GEOPDTemplatePlaceModuleConfiguration *v205;
  void *v206;
  id v207;
  GEOPDHikingAssociationModuleConfiguration *v208;
  void *v210;
  id v211;
  void *v212;
  id v213;
  id v214;
  id *v215;
  id *v216;
  id *v217;
  id *v218;
  id *v219;
  id *v220;
  GEOPDPlaceRibbonConfiguration *v221;
  void *v222;
  void *v223;
  void *v224;
  const __CFString *v225;
  const __CFString *v226;
  void *v227;
  id v228;
  void *v229;
  const __CFString *v230;
  void *v231;
  const __CFString *v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  id v238;
  const __CFString *v239;
  void *v240;
  int v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  _BYTE v254[128];
  uint64_t v255;

  v255 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (id *)objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_350;
  if (a3)
    v7 = CFSTR("ribbonModuleConfiguration");
  else
    v7 = CFSTR("ribbon_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
  v241 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDPlaceRibbonConfiguration alloc];
    if (v10)
    {
      v11 = v10;
      v12 = v8;
      v221 = -[GEOPDPlaceRibbonConfiguration init](v11, "init");
      if (v221)
      {
        if (a3)
          v13 = CFSTR("ribbonItem");
        else
          v13 = CFSTR("ribbon_item");
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v211 = v12;
          v212 = v8;
          v215 = v6;
          v244 = 0u;
          v245 = 0u;
          v242 = 0u;
          v243 = 0u;
          v210 = v14;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v242, &v250, 16);
          v17 = (uint64_t)v221;
          if (!v16)
            goto LABEL_88;
          v18 = v16;
          v19 = CFSTR("factoid_ribbon_item");
          v20 = *(_QWORD *)v243;
          if (a3)
            v19 = CFSTR("factoidRibbonItem");
          v232 = v19;
          v21 = CFSTR("factoid_item_index");
          if (a3)
            v21 = CFSTR("factoidItemIndex");
          v226 = v21;
          v228 = v15;
          if (a3)
            v22 = CFSTR("amenityRibbonItem");
          else
            v22 = CFSTR("amenity_ribbon_item");
          v230 = v22;
          v23 = CFSTR("amenity_item_index");
          if (a3)
            v23 = CFSTR("amenityItemIndex");
          v225 = v23;
          v234 = *(_QWORD *)v243;
          while (1)
          {
            v24 = 0;
            v236 = v18;
            do
            {
              if (*(_QWORD *)v243 != v20)
                objc_enumerationMutation(v15);
              v25 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v24);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v26 = [GEOPDRibbonItem alloc];
                if (v26)
                {
                  v27 = v26;
                  v28 = v25;
                  v29 = -[GEOPDRibbonItem init](v27, "init");
                  if (v29)
                  {
                    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("type"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v238 = v28;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v31 = v30;
                      if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_UNKNOWN")) & 1) != 0)
                      {
                        v32 = 0;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_HOURS")) & 1) != 0)
                      {
                        v32 = 1;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_RATINGS")) & 1) != 0)
                      {
                        v32 = 2;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_AMENITIES")) & 1) != 0)
                      {
                        v32 = 3;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_PRICE")) & 1) != 0)
                      {
                        v32 = 4;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_CURATED_GUIDES")) & 1) != 0)
                      {
                        v32 = 5;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_FACTOID")) & 1) != 0)
                      {
                        v32 = 6;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_CALL_TO_ACTION")) & 1) != 0)
                      {
                        v32 = 7;
                      }
                      else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_DISTANCE_FROM_CURRENT_LOCATION")) & 1) != 0)
                      {
                        v32 = 8;
                      }
                      else if (objc_msgSend(v31, "isEqualToString:", CFSTR("RIBBON_ITEM_TYPE_PLUGS_AVAILABILITY")))
                      {
                        v32 = 9;
                      }
                      else
                      {
                        v32 = 0;
                      }

                      v20 = v234;
LABEL_54:
                      *(_BYTE *)(v29 + 56) |= 0x10u;
                      *(_BYTE *)(v29 + 56) |= 1u;
                      *(_DWORD *)(v29 + 52) = v32;
                      v28 = v238;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v32 = objc_msgSend(v30, "intValue");
                        goto LABEL_54;
                      }
                    }

                    objc_msgSend(v28, "objectForKeyedSubscript:", v232);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v34 = [GEOPDFactoidRibbonItem alloc];
                      if (v34)
                      {
                        v35 = v33;
                        v34 = -[GEOPDFactoidRibbonItem init](v34, "init");
                        if (v34)
                        {
                          objc_msgSend(v35, "objectForKeyedSubscript:", v226);
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v37 = objc_msgSend(v36, "unsignedIntValue");
                            *(_BYTE *)&v34->_flags |= 1u;
                            v34->_factoidItemIndex = v37;
                          }

                          v15 = v228;
                        }

                      }
                      v38 = v34;
                      *(_BYTE *)(v29 + 56) |= 8u;
                      *(_BYTE *)(v29 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v29 + 32), v34);

                      v20 = v234;
                      v28 = v238;
                    }

                    objc_msgSend(v28, "objectForKeyedSubscript:", v230);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v40 = [GEOPDAmenityRibbonItem alloc];
                      if (v40)
                      {
                        v41 = v40;
                        v42 = v39;
                        v43 = v41;
                        v44 = v42;
                        v45 = -[GEOPDAmenityRibbonItem init](v43, "init");
                        if (v45)
                        {
                          objc_msgSend(v44, "objectForKeyedSubscript:", v225);
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v223 = v44;
                            v224 = v39;
                            v248 = 0u;
                            v249 = 0u;
                            v246 = 0u;
                            v247 = 0u;
                            v222 = v46;
                            v47 = v46;
                            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v246, v254, 16);
                            if (v48)
                            {
                              v49 = v48;
                              v50 = *(_QWORD *)v247;
                              do
                              {
                                for (i = 0; i != v49; ++i)
                                {
                                  if (*(_QWORD *)v247 != v50)
                                    objc_enumerationMutation(v47);
                                  v52 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * i);
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    objc_msgSend(v52, "unsignedIntValue");
                                    PBRepeatedUInt32Add();
                                  }
                                }
                                v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v246, v254, 16);
                              }
                              while (v49);
                            }

                            v17 = (uint64_t)v221;
                            v46 = v222;
                            v15 = v228;
                            v44 = v223;
                            v39 = v224;
                          }

                        }
                      }
                      else
                      {
                        v45 = 0;
                      }
                      v53 = v45;
                      *(_BYTE *)(v29 + 56) |= 4u;
                      *(_BYTE *)(v29 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v29 + 24), v45);

                      v20 = v234;
                      v28 = v238;
                    }

                  }
                }
                else
                {
                  v29 = 0;
                }
                v18 = v236;
                -[GEOPDPlaceRibbonConfiguration addRibbonItem:](v17, (void *)v29);

              }
              ++v24;
            }
            while (v24 != v18);
            v54 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v242, &v250, 16);
            v18 = v54;
            if (!v54)
            {
LABEL_88:

              v6 = v215;
              v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
              v12 = v211;
              v8 = v212;
              v14 = v210;
              break;
            }
          }
        }

      }
    }
    else
    {
      v221 = 0;
    }
    v55 = v221;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x80u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 9, v221);

  }
  if (a3)
    v56 = CFSTR("buttonModuleConfiguration");
  else
    v56 = CFSTR("button_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v56, v210, v211, v212);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = [GEOPDButtonModuleConfiguration alloc];
    if (v58)
    {
      v59 = v57;
      v58 = -[GEOPDButtonModuleConfiguration init](v58, "init");
      if (v58)
      {
        if (a3)
          v60 = CFSTR("buttonItem");
        else
          v60 = CFSTR("button_item");
        objc_msgSend(v59, "objectForKeyedSubscript:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v216 = v6;
          v252 = 0u;
          v253 = 0u;
          v250 = 0u;
          v251 = 0u;
          v62 = v61;
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
          if (v63)
          {
            v64 = v63;
            v65 = *(_QWORD *)v251;
            do
            {
              for (j = 0; j != v64; ++j)
              {
                if (*(_QWORD *)v251 != v65)
                  objc_enumerationMutation(v62);
                v67 = *(_QWORD *)(*((_QWORD *)&v250 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v68 = [GEOPDButtonItem alloc];
                  if ((v241 & 1) != 0)
                    v69 = -[GEOPDButtonItem initWithJSON:](v68, "initWithJSON:", v67);
                  else
                    v69 = -[GEOPDButtonItem initWithDictionary:](v68, "initWithDictionary:", v67);
                  v70 = v69;
                  -[GEOPDButtonModuleConfiguration addButtonItem:]((uint64_t)v58, v69);

                }
              }
              v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
            }
            while (v64);
          }

          v6 = v216;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
          a3 = v241;
        }

      }
    }
    v71 = v58;
    *(_WORD *)((char *)v6 + v9[118]) |= 4u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 4, v58);

  }
  if (a3)
    v72 = CFSTR("relatedPlaceModuleConfiguration");
  else
    v72 = CFSTR("related_place_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = [GEOPDRelatedPlaceModuleConfiguration alloc];
    if (v74)
    {
      v75 = v73;
      v74 = -[GEOPDRelatedPlaceModuleConfiguration init](v74, "init");
      if (v74)
      {
        if (a3)
          v76 = CFSTR("relatedPlaceComponentId");
        else
          v76 = CFSTR("related_place_component_id");
        objc_msgSend(v75, "objectForKeyedSubscript:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v78 = objc_msgSend(v77, "intValue");
          *(_BYTE *)&v74->_flags |= 2u;
          v74->_relatedPlaceComponentId = v78;
        }

        v79 = a3;
        if (a3)
          v80 = CFSTR("sectionTitle");
        else
          v80 = CFSTR("section_title");
        objc_msgSend(v75, "objectForKeyedSubscript:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v213 = v5;
          v217 = v6;
          v252 = 0u;
          v253 = 0u;
          v250 = 0u;
          v251 = 0u;
          v82 = v81;
          v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
          if (v83)
          {
            v84 = v83;
            v85 = *(_QWORD *)v251;
            do
            {
              for (k = 0; k != v84; ++k)
              {
                if (*(_QWORD *)v251 != v85)
                  objc_enumerationMutation(v82);
                v87 = *(_QWORD *)(*((_QWORD *)&v250 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v88 = [GEOLocalizedString alloc];
                  if ((v241 & 1) != 0)
                    v89 = -[GEOLocalizedString initWithJSON:](v88, "initWithJSON:", v87);
                  else
                    v89 = -[GEOLocalizedString initWithDictionary:](v88, "initWithDictionary:", v87);
                  v90 = v89;
                  -[GEOPDRelatedPlaceModuleConfiguration addSectionTitle:]((uint64_t)v74, v89);

                }
              }
              v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
            }
            while (v84);
          }

          v5 = v213;
          v6 = v217;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
          v79 = v241;
        }

        v91 = v79;
        if (v79)
          v92 = CFSTR("numberOfRows");
        else
          v92 = CFSTR("number_of_rows");
        objc_msgSend(v75, "objectForKeyedSubscript:", v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v94 = objc_msgSend(v93, "intValue");
          *(_BYTE *)&v74->_flags |= 1u;
          v74->_numberOfRows = v94;
        }

        a3 = v91;
      }

    }
    v95 = v74;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x40u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 8, v74);

  }
  if (a3)
    v96 = CFSTR("webModuleConfiguration");
  else
    v96 = CFSTR("web_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v98 = [GEOPDWebModuleConfiguration alloc];
    if (!v98)
    {
LABEL_174:
      -[GEOPDModuleConfigurationValue setWebModuleConfiguration:]((uint64_t)v6, v98);

      goto LABEL_175;
    }
    v99 = v97;
    v98 = -[GEOPDWebModuleConfiguration init](v98, "init");
    if (!v98)
    {
LABEL_173:

      goto LABEL_174;
    }
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("url"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = (void *)objc_msgSend(v100, "copy");
      -[GEOPDWebModuleConfiguration setUrl:]((uint64_t)v98, v101);

    }
    if (a3)
      v102 = CFSTR("shouldRenderBackgroundPlatter");
    else
      v102 = CFSTR("should_render_background_platter");
    objc_msgSend(v99, "objectForKeyedSubscript:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v104 = objc_msgSend(v103, "BOOLValue");
      *(_BYTE *)&v98->_flags |= 2u;
      v98->_shouldRenderBackgroundPlatter = v104;
    }

    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("type"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v105, "isEqualToString:", CFSTR("WEB_MODULE_TYPE_GENERIC"));
      v106 = 0;
      a3 = v241;
    }
    else
    {
      objc_opt_class();
      a3 = v241;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_172:

        goto LABEL_173;
      }
      v106 = objc_msgSend(v105, "intValue");
    }
    *(_BYTE *)&v98->_flags |= 1u;
    v98->_type = v106;
    goto LABEL_172;
  }
LABEL_175:

  if (a3)
    v107 = CFSTR("templatePlaceModuleConfiguration");
  else
    v107 = CFSTR("template_place_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v109 = [GEOPDTemplatePlaceModuleConfiguration alloc];
    if (v109)
      v110 = (void *)-[GEOPDTemplatePlaceModuleConfiguration _initWithDictionary:isJSON:](v109, v108, a3);
    else
      v110 = 0;
    v111 = v110;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x100u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 10, v110);

  }
  if (a3)
    v112 = CFSTR("placeInfosModuleConfiguration");
  else
    v112 = CFSTR("place_infos_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_270;
  v114 = [GEOPDPlaceInfosModuleConfiguration alloc];
  if (!v114)
  {
    v235 = 0;
    goto LABEL_269;
  }
  v115 = v114;
  v116 = v113;
  v235 = -[GEOPDPlaceInfosModuleConfiguration init](v115, "init");
  if (v235)
  {
    if (a3)
      v117 = CFSTR("locationInfoItem");
    else
      v117 = CFSTR("location_info_item");
    v233 = v116;
    objc_msgSend(v116, "objectForKeyedSubscript:", v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v229 = v113;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_211:

      if (a3)
        v126 = CFSTR("factoidInfoItem");
      else
        v126 = CFSTR("factoid_info_item");
      v127 = v233;
      objc_msgSend(v233, "objectForKeyedSubscript:", v126);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v231 = v128;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v129 = [GEOPDFactoidInfoItem alloc];
        if (v129)
        {
          v130 = v129;
          v131 = v128;
          v132 = v130;
          v133 = v131;
          v134 = -[GEOPDFactoidInfoItem init](v132, "init");
          if (v134)
          {
            v135 = a3;
            if (a3)
              v136 = CFSTR("factoidReference");
            else
              v136 = CFSTR("factoid_reference");
            objc_msgSend(v133, "objectForKeyedSubscript:", v136);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v227 = v133;
              v214 = v5;
              v218 = v6;
              v252 = 0u;
              v253 = 0u;
              v250 = 0u;
              v251 = 0u;
              v138 = v137;
              v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
              if (!v139)
                goto LABEL_252;
              v140 = v139;
              v141 = CFSTR("factoid_item_index");
              v142 = *(_QWORD *)v251;
              if (v241)
                v141 = CFSTR("factoidItemIndex");
              v237 = v137;
              v239 = v141;
              while (1)
              {
                v143 = 0;
                do
                {
                  if (*(_QWORD *)v251 != v142)
                    objc_enumerationMutation(v138);
                  v144 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * v143);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v145 = [GEOPDFactoidReference alloc];
                    if (v145)
                    {
                      v146 = v145;
                      v147 = v144;
                      v148 = -[GEOPDFactoidReference init](v146, "init");
                      if (v148)
                      {
                        objc_msgSend(v147, "objectForKeyedSubscript:", v239);
                        v149 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v150 = objc_msgSend(v149, "unsignedIntValue");
                          *(_BYTE *)(v148 + 24) |= 1u;
                          *(_DWORD *)(v148 + 16) = v150;
                        }

                        objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("style"));
                        v151 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v152 = v151;
                          if ((objc_msgSend(v152, "isEqualToString:", CFSTR("FACTOID_STYLE_DEFAULT")) & 1) != 0)
                          {
                            v153 = 0;
                          }
                          else if ((objc_msgSend(v152, "isEqualToString:", CFSTR("FACTOID_STYLE_DIRECTIONS")) & 1) != 0)
                          {
                            v153 = 1;
                          }
                          else if (objc_msgSend(v152, "isEqualToString:", CFSTR("FACTOID_STYLE_LINK")))
                          {
                            v153 = 2;
                          }
                          else
                          {
                            v153 = 0;
                          }

LABEL_244:
                          *(_BYTE *)(v148 + 24) |= 2u;
                          *(_DWORD *)(v148 + 20) = v153;
                          v137 = v237;
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v153 = objc_msgSend(v151, "intValue");
                            goto LABEL_244;
                          }
                        }

                      }
                    }
                    else
                    {
                      v148 = 0;
                    }
                    -[GEOPDFactoidInfoItem addFactoidReference:]((uint64_t)v134, (void *)v148);

                  }
                  ++v143;
                }
                while (v140 != v143);
                v154 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
                v140 = v154;
                if (!v154)
                {
LABEL_252:

                  v5 = v214;
                  v6 = v218;
                  v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
                  v135 = v241;
                  v133 = v227;
                  break;
                }
              }
            }

            a3 = v135;
          }

        }
        else
        {
          v134 = 0;
        }
        v155 = v134;
        *(_BYTE *)(v235 + 56) |= 4u;
        *(_BYTE *)(v235 + 56) |= 0x10u;
        objc_storeStrong((id *)(v235 + 24), v134);

        v113 = v229;
        v127 = v233;
      }

      if (a3)
        v156 = CFSTR("attributionType");
      else
        v156 = CFSTR("attribution_type");
      objc_msgSend(v127, "objectForKeyedSubscript:", v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v158 = v113;
        v159 = v157;
        if ((objc_msgSend(v159, "isEqualToString:", CFSTR("ATTRIBUTION_TYPE_VENDOR")) & 1) != 0)
          v160 = 0;
        else
          v160 = objc_msgSend(v159, "isEqualToString:", CFSTR("ATTRIBUTION_TYPE_INDIGENOUS_ACKNOWLEDGEMENT"));

        v113 = v158;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_267:

          v116 = v233;
          goto LABEL_268;
        }
        v160 = objc_msgSend(v157, "intValue");
      }
      *(_BYTE *)(v235 + 56) |= 0x10u;
      *(_BYTE *)(v235 + 56) |= 1u;
      *(_DWORD *)(v235 + 52) = v160;
      goto LABEL_267;
    }
    v119 = [GEOPDLocationInfoItem alloc];
    if (!v119)
    {
LABEL_210:
      v125 = v119;
      *(_BYTE *)(v235 + 56) |= 8u;
      *(_BYTE *)(v235 + 56) |= 0x10u;
      objc_storeStrong((id *)(v235 + 32), v119);

      v113 = v229;
      goto LABEL_211;
    }
    v120 = v118;
    v119 = -[GEOPDLocationInfoItem init](v119, "init");
    if (!v119)
    {
LABEL_209:

      goto LABEL_210;
    }
    v121 = a3;
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("style"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v123 = v122;
      if ((objc_msgSend(v123, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v124 = 0;
      }
      else if ((objc_msgSend(v123, "isEqualToString:", CFSTR("LOCATION")) & 1) != 0)
      {
        v124 = 1;
      }
      else if ((objc_msgSend(v123, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
      {
        v124 = 2;
      }
      else if (objc_msgSend(v123, "isEqualToString:", CFSTR("NONE")))
      {
        v124 = 3;
      }
      else
      {
        v124 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_208:

        a3 = v121;
        goto LABEL_209;
      }
      v124 = objc_msgSend(v122, "intValue");
    }
    *(_BYTE *)&v119->_flags |= 1u;
    v119->_style = v124;
    goto LABEL_208;
  }
LABEL_268:

LABEL_269:
  v161 = (id)v235;
  *(_WORD *)((char *)v6 + v9[118]) |= 0x20u;
  *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
  objc_storeStrong(v6 + 7, (id)v235);

LABEL_270:
  if (a3)
    v162 = CFSTR("businessInfosModuleConfiguration");
  else
    v162 = CFSTR("business_infos_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v164 = [GEOPDBusinessInfosModuleConfiguration alloc];
    if (v164)
    {
      v165 = v163;
      v164 = -[GEOPDBusinessInfosModuleConfiguration init](v164, "init");
      if (v164)
      {
        if (a3)
          v166 = CFSTR("factoidItemIndex");
        else
          v166 = CFSTR("factoid_item_index");
        objc_msgSend(v165, "objectForKeyedSubscript:", v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v219 = v6;
          v252 = 0u;
          v253 = 0u;
          v250 = 0u;
          v251 = 0u;
          v240 = v167;
          v168 = v167;
          v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
          if (v169)
          {
            v170 = v169;
            v171 = *(_QWORD *)v251;
            do
            {
              for (m = 0; m != v170; ++m)
              {
                if (*(_QWORD *)v251 != v171)
                  objc_enumerationMutation(v168);
                v173 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v173, "unsignedIntValue");
                  PBRepeatedUInt32Add();
                }
              }
              v170 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
            }
            while (v170);
          }

          v6 = v219;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
          a3 = v241;
          v167 = v240;
        }

      }
    }
    v174 = v164;
    *(_WORD *)((char *)v6 + v9[118]) |= 2u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 3, v164);

  }
  if (a3)
    v175 = CFSTR("headerButtonsConfiguration");
  else
    v175 = CFSTR("header_buttons_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v177 = [GEOPDHeaderButtonsConfiguration alloc];
    if (v177)
    {
      v178 = v176;
      v177 = -[GEOPDHeaderButtonsConfiguration init](v177, "init");
      if (v177)
      {
        if (a3)
          v179 = CFSTR("shouldSuppressDirectionsAction");
        else
          v179 = CFSTR("should_suppress_directions_action");
        objc_msgSend(v178, "objectForKeyedSubscript:", v179);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v181 = objc_msgSend(v180, "BOOLValue");
          *(_BYTE *)&v177->_flags |= 1u;
          v177->_shouldSuppressDirectionsAction = v181;
        }

      }
    }
    v182 = v177;
    *(_WORD *)((char *)v6 + v9[118]) |= 8u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 5, v177);

  }
  if (a3)
    v183 = CFSTR("unifiedActionModuleConfiguration");
  else
    v183 = CFSTR("unified_action_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v185 = [GEOPDUnifiedActionModuleConfiguration alloc];
    if (v185)
    {
      v186 = v184;
      v185 = -[GEOPDUnifiedActionModuleConfiguration init](v185, "init");
      if (v185)
      {
        if (a3)
          v187 = CFSTR("buttonItem");
        else
          v187 = CFSTR("button_item");
        objc_msgSend(v186, "objectForKeyedSubscript:", v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v220 = v6;
          v252 = 0u;
          v253 = 0u;
          v250 = 0u;
          v251 = 0u;
          v189 = v188;
          v190 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
          if (v190)
          {
            v191 = v190;
            v192 = *(_QWORD *)v251;
            do
            {
              for (n = 0; n != v191; ++n)
              {
                if (*(_QWORD *)v251 != v192)
                  objc_enumerationMutation(v189);
                v194 = *(_QWORD *)(*((_QWORD *)&v250 + 1) + 8 * n);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v195 = [GEOPDButtonItem alloc];
                  if ((v241 & 1) != 0)
                    v196 = -[GEOPDButtonItem initWithJSON:](v195, "initWithJSON:", v194);
                  else
                    v196 = -[GEOPDButtonItem initWithDictionary:](v195, "initWithDictionary:", v194);
                  v197 = v196;
                  -[GEOPDUnifiedActionModuleConfiguration addButtonItem:]((uint64_t)v185, v196);

                }
              }
              v191 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v250, v254, 16);
            }
            while (v191);
          }

          v6 = v220;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
          a3 = v241;
        }

      }
    }
    v198 = v185;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x200u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 11, v185);

  }
  if (a3)
    v199 = CFSTR("hikingAssociationModuleConfiguration");
  else
    v199 = CFSTR("hiking_association_module_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v201 = [GEOPDHikingAssociationModuleConfiguration alloc];
    if (v201)
    {
      v202 = v200;
      v201 = -[GEOPDHikingAssociationModuleConfiguration init](v201, "init");
      if (v201)
      {
        if (a3)
          v203 = CFSTR("templatePlaceConfiguration");
        else
          v203 = CFSTR("template_place_configuration");
        objc_msgSend(v202, "objectForKeyedSubscript:", v203);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v205 = [GEOPDTemplatePlaceModuleConfiguration alloc];
          if (v205)
            v206 = (void *)-[GEOPDTemplatePlaceModuleConfiguration _initWithDictionary:isJSON:](v205, v204, a3);
          else
            v206 = 0;
          v207 = v206;
          objc_storeStrong((id *)&v201->_templatePlaceConfiguration, v206);

        }
      }

    }
    v208 = v201;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x10u;
    *(_WORD *)((char *)v6 + v9[118]) |= 0x800u;
    objc_storeStrong(v6 + 6, v201);

  }
LABEL_350:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDModuleConfigurationValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  GEOPDPlaceInfosModuleConfiguration *placeInfosModuleConfiguration;
  int v7;
  id v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_8;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0xDC4) != 0)
    goto LABEL_8;
  if ((flags & 0x20) != 0)
  {
    placeInfosModuleConfiguration = self->_placeInfosModuleConfiguration;
    if (placeInfosModuleConfiguration)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&placeInfosModuleConfiguration->_readerLock);
      v7 = *(_BYTE *)&placeInfosModuleConfiguration->_flags & 0x1C;
      os_unfair_lock_unlock(&placeInfosModuleConfiguration->_readerLock);
      if (v7)
        goto LABEL_8;
      flags = (__int16)self->_flags;
    }
  }
  if ((flags & 0x21A) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_29;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 0);
  if (self->_ribbonModuleConfiguration)
    PBDataWriterWriteSubmessage();
  v8 = v11;
  if (self->_buttonModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_relatedPlaceModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_webModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_templatePlaceModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_placeInfosModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_businessInfosModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_headerButtonsConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_unifiedActionModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  if (self->_hikingAssociationModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v8 = v11;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v8);
LABEL_29:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDPlaceRibbonConfiguration copyWithZone:](self->_ribbonModuleConfiguration, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v8;

    v10 = -[GEOPDButtonModuleConfiguration copyWithZone:](self->_buttonModuleConfiguration, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[GEOPDRelatedPlaceModuleConfiguration copyWithZone:](self->_relatedPlaceModuleConfiguration, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v12;

    v14 = -[GEOPDWebModuleConfiguration copyWithZone:](self->_webModuleConfiguration, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v14;

    v16 = -[GEOPDTemplatePlaceModuleConfiguration copyWithZone:](self->_templatePlaceModuleConfiguration, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v16;

    v18 = -[GEOPDPlaceInfosModuleConfiguration copyWithZone:](self->_placeInfosModuleConfiguration, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v18;

    v20 = -[GEOPDBusinessInfosModuleConfiguration copyWithZone:](self->_businessInfosModuleConfiguration, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v20;

    v22 = -[GEOPDHeaderButtonsConfiguration copyWithZone:](self->_headerButtonsConfiguration, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v22;

    v24 = -[GEOPDUnifiedActionModuleConfiguration copyWithZone:](self->_unifiedActionModuleConfiguration, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v24;

    v26 = -[GEOPDHikingAssociationModuleConfiguration copyWithZone:](self->_hikingAssociationModuleConfiguration, "copyWithZone:", a3);
    v27 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v26;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDModuleConfigurationValueReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDPlaceRibbonConfiguration *ribbonModuleConfiguration;
  GEOPDButtonModuleConfiguration *buttonModuleConfiguration;
  GEOPDRelatedPlaceModuleConfiguration *relatedPlaceModuleConfiguration;
  GEOPDWebModuleConfiguration *webModuleConfiguration;
  GEOPDTemplatePlaceModuleConfiguration *templatePlaceModuleConfiguration;
  GEOPDPlaceInfosModuleConfiguration *placeInfosModuleConfiguration;
  GEOPDBusinessInfosModuleConfiguration *businessInfosModuleConfiguration;
  GEOPDHeaderButtonsConfiguration *headerButtonsConfiguration;
  GEOPDUnifiedActionModuleConfiguration *unifiedActionModuleConfiguration;
  GEOPDHikingAssociationModuleConfiguration *hikingAssociationModuleConfiguration;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 1);
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)v4, 1);
  ribbonModuleConfiguration = self->_ribbonModuleConfiguration;
  if ((unint64_t)ribbonModuleConfiguration | v4[9])
  {
    if (!-[GEOPDPlaceRibbonConfiguration isEqual:](ribbonModuleConfiguration, "isEqual:"))
      goto LABEL_22;
  }
  buttonModuleConfiguration = self->_buttonModuleConfiguration;
  if ((unint64_t)buttonModuleConfiguration | v4[4]
    && !-[GEOPDButtonModuleConfiguration isEqual:](buttonModuleConfiguration, "isEqual:"))
  {
    goto LABEL_22;
  }
  if (((relatedPlaceModuleConfiguration = self->_relatedPlaceModuleConfiguration,
         !((unint64_t)relatedPlaceModuleConfiguration | v4[8]))
     || -[GEOPDRelatedPlaceModuleConfiguration isEqual:](relatedPlaceModuleConfiguration, "isEqual:"))
    && ((webModuleConfiguration = self->_webModuleConfiguration, !((unint64_t)webModuleConfiguration | v4[12]))
     || -[GEOPDWebModuleConfiguration isEqual:](webModuleConfiguration, "isEqual:"))
    && ((templatePlaceModuleConfiguration = self->_templatePlaceModuleConfiguration,
         !((unint64_t)templatePlaceModuleConfiguration | v4[10]))
     || -[GEOPDTemplatePlaceModuleConfiguration isEqual:](templatePlaceModuleConfiguration, "isEqual:"))
    && ((placeInfosModuleConfiguration = self->_placeInfosModuleConfiguration,
         !((unint64_t)placeInfosModuleConfiguration | v4[7]))
     || -[GEOPDPlaceInfosModuleConfiguration isEqual:](placeInfosModuleConfiguration, "isEqual:"))
    && ((businessInfosModuleConfiguration = self->_businessInfosModuleConfiguration,
         !((unint64_t)businessInfosModuleConfiguration | v4[3]))
     || -[GEOPDBusinessInfosModuleConfiguration isEqual:](businessInfosModuleConfiguration, "isEqual:"))
    && ((headerButtonsConfiguration = self->_headerButtonsConfiguration,
         !((unint64_t)headerButtonsConfiguration | v4[5]))
     || -[GEOPDHeaderButtonsConfiguration isEqual:](headerButtonsConfiguration, "isEqual:"))
    && ((unifiedActionModuleConfiguration = self->_unifiedActionModuleConfiguration,
         !((unint64_t)unifiedActionModuleConfiguration | v4[11]))
     || -[GEOPDUnifiedActionModuleConfiguration isEqual:](unifiedActionModuleConfiguration, "isEqual:")))
  {
    hikingAssociationModuleConfiguration = self->_hikingAssociationModuleConfiguration;
    if ((unint64_t)hikingAssociationModuleConfiguration | v4[6])
      v15 = -[GEOPDHikingAssociationModuleConfiguration isEqual:](hikingAssociationModuleConfiguration, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDPlaceRibbonConfiguration hash](self->_ribbonModuleConfiguration, "hash");
  v4 = -[GEOPDButtonModuleConfiguration hash](self->_buttonModuleConfiguration, "hash") ^ v3;
  v5 = v4 ^ -[GEOPDRelatedPlaceModuleConfiguration hash](self->_relatedPlaceModuleConfiguration, "hash");
  v6 = -[GEOPDWebModuleConfiguration hash](self->_webModuleConfiguration, "hash");
  v7 = v6 ^ -[GEOPDTemplatePlaceModuleConfiguration hash](self->_templatePlaceModuleConfiguration, "hash");
  v8 = v5 ^ v7 ^ -[GEOPDPlaceInfosModuleConfiguration hash](self->_placeInfosModuleConfiguration, "hash");
  v9 = -[GEOPDBusinessInfosModuleConfiguration hash](self->_businessInfosModuleConfiguration, "hash");
  v10 = v9 ^ -[GEOPDHeaderButtonsConfiguration hash](self->_headerButtonsConfiguration, "hash");
  v11 = v10 ^ -[GEOPDUnifiedActionModuleConfiguration hash](self->_unifiedActionModuleConfiguration, "hash");
  return v8 ^ v11 ^ -[GEOPDHikingAssociationModuleConfiguration hash](self->_hikingAssociationModuleConfiguration, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_unifiedActionModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_templatePlaceModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_ribbonModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedPlaceModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_placeInfosModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_hikingAssociationModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_headerButtonsConfiguration, 0);
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_businessInfosModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end

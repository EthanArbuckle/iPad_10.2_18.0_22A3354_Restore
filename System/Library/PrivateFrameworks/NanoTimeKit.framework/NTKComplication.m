@implementation NTKComplication

- (NTKComplication)initWithComplicationType:(unint64_t)a3
{
  NTKComplication *v4;
  NTKComplication *v5;
  void *v6;
  uint64_t v7;
  NSString *uniqueIdentifier;
  uint64_t v9;
  NSString *appIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKComplication;
  v4 = -[NTKComplication init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_complicationType = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v7;

    -[NTKComplication _generateAppIdentifier](v5, "_generateAppIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v9;

  }
  return v5;
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (id)_generateAppIdentifier
{
  uint64_t v3;
  __CFString *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = -[NTKComplication complicationType](self, "complicationType");
  if (v3 > 37)
  {
    if ((unint64_t)(v3 - 38) >= 4)
    {
      if (v3 == 45 || v3 == 57)
      {
        v4 = CFSTR("com.apple.nanotimekit.time");
        return v4;
      }
      goto LABEL_16;
    }
LABEL_9:
    v4 = CFSTR("com.apple.nanotimekit.astronomy");
    return v4;
  }
  if (v3 > 12)
  {
    if (v3 == 13)
    {
      v4 = CFSTR("com.apple.nanotimekit.battery");
      return v4;
    }
    if (v3 == 29)
    {
      v4 = CFSTR("com.apple.nanotimekit.siri");
      return v4;
    }
    goto LABEL_16;
  }
  if (!v3)
  {
    v4 = CFSTR("com.apple.nanotimekit.off");
    return v4;
  }
  if (v3 == 11)
    goto LABEL_9;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypesToBundleIDMappingForDevice(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_complicationType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    v4 = (__CFString *)v9;
  else
    v4 = CFSTR("com.apple.nanotimekit.internal");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (id)nullComplication
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 0);
}

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  NTKLocalizedTitleForComplication(self, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 2) != 0)
  {
    -[NTKComplication localizedSectionHeaderName](self, "localizedSectionHeaderName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedLowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedLowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = NTKEqualObjects(v8, v9);

    if ((v10 & 1) == 0)
    {
      NTKClockFaceLocalizedString(CFSTR("COMPLICATION_JOINED_DESCRIPTORS"), CFSTR("%@: %@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v7, v6);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v12;
    }

  }
  return v6;
}

- (unint64_t)ntk_itemType
{
  if (-[NTKComplication complicationType](self, "complicationType"))
    return 2;
  else
    return 1;
}

- (id)localizedSectionHeaderName
{
  NTKComplication *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  NTKComplication *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0)
  {
    -[NTKComplication complication](v2, "complication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedAppNameForBundleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
      goto LABEL_39;

  }
  if (-[NTKComplication complicationType](v2, "complicationType") != 2)
  {
    -[NTKComplication ntk_sectionIdentifier](v2, "ntk_sectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NanoWorldClock"));

    if (v11)
    {
      v8 = CFSTR("EDIT_MODE_LABEL_COMPLICATION_SECTION_WORLD_CLOCK");
      v9 = CFSTR("World Clock");
      goto LABEL_11;
    }
    -[NTKComplication ntk_sectionIdentifier](v2, "ntk_sectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.SafetyMonitorApp"));

    if (v13)
    {
      v8 = CFSTR("EDIT_MODE_LABEL_COMPLICATION_SECTION_CHECK_IN");
      v9 = CFSTR("Check In");
      goto LABEL_11;
    }
    -[NTKComplication ntk_sectionIdentifier](v2, "ntk_sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.off")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_NONE_SECTION_NAME");
      v15 = CFSTR("None");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.findmy")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_FINDMY_SECTION_NAME");
      v15 = CFSTR("Find My");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.controls")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_CONTROLS_SECTION_NAME");
      v15 = CFSTR("Controls");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.battery")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_BATTERY_SECTION_NAME");
      v15 = CFSTR("Battery");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.cellular")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_CELLULAR_SECTION_NAME");
      v15 = CFSTR("Cellular");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.internal")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_INTERNAL_SECTION_NAME");
      v15 = CFSTR("Internal");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.contacts")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_CONTACTS_SECTION_NAME");
      v15 = CFSTR("Contacts");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.astronomy")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_ASTRONOMY_SECTION_NAME");
      v15 = CFSTR("Astronomy");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.personalization")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_PERSONALIZATION_SECTION_NAME");
      v15 = CFSTR("Personalization");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.time")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_TIME_SECTION_NAME");
      v15 = CFSTR("Time");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.DateComplicationsHost")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_DATE_SECTION_NAME");
      v15 = CFSTR("Date");
    }
    else if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.nanotimekit.siri")))
    {
      v14 = CFSTR("COMPLICATION_PICKER_SIRI_SECTION_NAME");
      v15 = CFSTR("Siri");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqual:", CFSTR("com.apple.NanoCompass.watchkitapp.waypoints")))
      {
        +[NTKCompanion1stPartyApp appForBundleIdentifier:](NTKCompanion1stPartyApp, "appForBundleIdentifier:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "name");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (id)objc_msgSend(v19, "localizedAppNameForBundleIdentifier:", v5);

          +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "allApps");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v38 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v26, "watchApplicationIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqual:", v5);

                if ((v28 & 1) != 0)
                {
                  objc_msgSend(v26, "name");
                  v7 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_54;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
              if (v23)
                continue;
              break;
            }
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            NTKSharedRemoteComplicationProvider();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKComplication clientIdentifier](v2, "clientIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedAppNameForClientIdentifier:", v29);
            v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_54:
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = (void *)MEMORY[0x1E0C944B0];
              v31 = v2;
              objc_msgSend(v30, "currentDevice");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              NTKSharedWidgetComplicationProvider((uint64_t)v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NTKComplication descriptor](v31, "descriptor");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "infoForDescriptor:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v35, "localizedAppName");
              v7 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              NTKComplicationTypeLocalizedLabelText(-[NTKComplication complicationType](v2, "complicationType"));
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

        }
        goto LABEL_39;
      }
      v14 = CFSTR("COMPLICATION_PICKER_COMPASS_WAYPOINTS");
      v15 = CFSTR("Compass");
    }
    NTKClockFaceLocalizedString(v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

    goto LABEL_40;
  }
  v8 = CFSTR("EDIT_MODE_LABEL_COMPLICATION_SECTION_ALARMS");
  v9 = CFSTR("Alarms");
LABEL_11:
  NTKCompanionClockFaceLocalizedString(v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v7;
}

+ (id)allComplicationsOfType:(unint64_t)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "_complicationClassForType:"), "_allComplicationConfigurationsWithType:", a3);
}

+ (id)anyComplicationOfType:(unint64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "allComplicationsOfType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (Class)_complicationClassForType:(unint64_t)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setComplicationType:(unint64_t)a3
{
  self->_complicationType = a3;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6;
  objc_class *v7;

  v6 = a4;
  v7 = +[NTKComplicationController controllerClassForComplicationType:family:forDevice:](NTKComplicationController, "controllerClassForComplicationType:family:forDevice:", -[NTKComplication complicationType](self, "complicationType"), a3, v6);

  return v7 != 0;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", a3);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return 0;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  void *v4;
  void *v5;
  int v6;

  if (self->_complicationType != 19)
    return 0;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2A51E7B3-1B80-4981-9F09-F725BC3A8065"));
  v6 = objc_msgSend(v4, "supportsCapability:", v5);

  if (v6)
    return CFSTR("mind");
  else
    return 0;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "localeMatchesContext:", v6))
    v7 = objc_msgSend(v5, "buildVersionMatchesContext:", v6) ^ 1;
  else
    LOBYTE(v7) = 1;

  return v7;
}

- (NSString)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", self->_complicationType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)localizedKeylineLabelText
{
  return NTKComplicationTypeLocalizedLabelText(self->_complicationType);
}

- (id)localizedRichKeylineLabelText
{
  return NTKComplicationTypeRichLocalizedLabelText(self->_complicationType);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->_uniqueIdentifier, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueIdentifier, "hash");
}

- (id)JSONObjectRepresentation
{
  char isKindOfClass;
  unint64_t complicationType;
  void *v5;
  void *v6;
  void *v8;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  complicationType = self->_complicationType;
  if ((isKindOfClass & 1) != 0 || complicationType)
  {
    v5 = (void *)objc_opt_new();
    if ((isKindOfClass & 1) == 0)
    {
      switch(complicationType)
      {
        case 0x1FuLL:
          goto LABEL_14;
        case 0x30uLL:
LABEL_15:
          -[NTKComplication _addKeysToJSONDictionary:](self, "_addKeysToJSONDictionary:", v5);
          return v5;
        case 0x38uLL:
LABEL_14:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_complicationType);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("type"));

          goto LABEL_15;
      }
      NTKFaceBundleStringFromComplicationType(self->_complicationType);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("app"));

    }
    if (complicationType != 56 && complicationType != 31)
      goto LABEL_15;
    goto LABEL_14;
  }
  v5 = 0;
  return v5;
}

+ (NTKComplication)complicationWithJSONObjectRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("object must be dictionary - invalid value: %@"), v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle app identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle app complication descriptor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94148]), "initWithJSONObjectRepresentation:", v7);
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v5, v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBundleComplication bundledComplicationWithComplication:](NTKBundleComplication, "bundledComplicationWithComplication:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("app"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for '%@'"), CFSTR("app"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for '%@' must be a string - invalid value: %@"), CFSTR("app"), v9);
    v21 = 0;
    if (!NTKFaceBundleGetComplicationTypeFromString(v9, &v21))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      if (v10)
      {
        if (v11 == 56 || v11 == 31)
          v21 = v11;
        else
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("Disallowed complication type encoded: %lu"), v11);
      }
      else
      {
        v21 = 31;
      }

    }
    v14 = (objc_class *)objc_msgSend(a1, "_complicationClassForType:", v21);
    if (v14 != (objc_class *)objc_opt_class()
      || (+[NTKBundleComplication _revertedBundleComplicationFromJSONDictionary:](NTKBundleComplication, "_revertedBundleComplicationFromJSONDictionary:", v4), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v15 = [v14 alloc];
      v16 = (void *)objc_msgSend(v15, "_initWithComplicationType:JSONDictionary:", v21, v4);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("available"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAA0]);

    if (v18)
    {
      +[NTKComplicationTombstone tombstoneWithComplication:](NTKComplicationTombstone, "tombstoneWithComplication:", v16);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = v16;
    }
    v13 = v19;

  }
  return (NTKComplication *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 24) = self->_complicationType;
  objc_storeStrong((id *)(v4 + 8), self->_uniqueIdentifier);
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t complicationType;
  id v4;

  complicationType = self->_complicationType;
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", complicationType, CFSTR("ComplicationTypeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", 2, CFSTR("ComplicationEncodingVersionKey"));

}

- (NTKComplication)initWithCoder:(id)a3
{
  id v4;
  NTKComplication *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSString *uniqueIdentifier;
  uint64_t v15;
  NSString *appIdentifier;
  unint64_t complicationType;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKComplication;
  v5 = -[NTKComplication init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ComplicationEncodingVersionKey"));
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ComplicationTypeKey"));
    v8 = v7;
    if (v6 < 2)
    {
      v10 = NTKComplicationTypeV2fromV1Encoding(v7);
      v9 = v10;
      v5->_complicationType = v10;
      if (v8 && !v10)
      {
        _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          complicationType = v5->_complicationType;
          *(_DWORD *)buf = 134218496;
          v21 = v8;
          v22 = 2048;
          v23 = complicationType;
          v24 = 2048;
          v25 = v6;
          _os_log_error_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_ERROR, "Unable to decode complication type. starting type: (%lu) resulting type: (%lu) version encoding: (%lu)", buf, 0x20u);
        }

        v9 = v5->_complicationType;
      }
    }
    else
    {
      v5->_complicationType = v7;
      v9 = v7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v13;

    -[NTKComplication _generateAppIdentifier](v5, "_generateAppIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v15;

  }
  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  NTKComplication *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = self;
  v4 = v3;
  if (v3->_complicationType == 9)
  {
    v5 = *MEMORY[0x1E0C93EC8];
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKRemoteComplication _remoteStocksComplicationWithIdentifier:forDevice:](NTKRemoteComplication, "_remoteStocksComplicationWithIdentifier:forDevice:", v5, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4
{
  unint64_t v6;
  uint64_t v7;

  if (!NTKIsRichComplicationFamily(a3))
    return 0;
  v6 = -[NTKComplication complicationType](self, "complicationType");
  if (v6 == 16)
  {
    if (a3 != 11)
    {
      v7 = 1;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (v6 == 11)
  {
    v7 = 40;
    goto LABEL_14;
  }
  if (a3 != 11)
    return 0;
  if (v6 != 36 && v6 != 10)
  {
    if (v6 == 1)
    {
LABEL_11:
      v7 = 8;
      goto LABEL_14;
    }
    return 0;
  }
  v7 = 22;
LABEL_14:
  +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

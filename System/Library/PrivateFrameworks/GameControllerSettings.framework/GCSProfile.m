@implementation GCSProfile

+ (NSUUID)defaultProfileUUID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc((Class)&off_254DF3350), "initWithUUIDString:", CFSTR("42381781-1b0c-467e-aa7d-823c4ce359d1"));
}

+ (GCSProfile)defaultProfile
{
  int64_t v2;
  int64_t v3;
  GCSProfile *v4;
  void *v5;
  void *v6;
  GCSProfile *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = +[GCSProfile defaultDoublePressGesture](GCSProfile, "defaultDoublePressGesture");
  v3 = +[GCSProfile defaultLongPressGesture](GCSProfile, "defaultLongPressGesture");
  v4 = [GCSProfile alloc];
  +[GCSProfile defaultProfileUUID](GCSProfile, "defaultProfileUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  LOWORD(v10) = 0;
  LOBYTE(v9) = 0;
  v7 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:](v4, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v5, CFSTR("GCS_PROFILE_DEFAULT"), 0, 0, 0, 0, 1.0, CFSTR("gamecontroller.fill"), v6, v9, v2, v3, v10, 0);

  return v7;
}

- (BOOL)isActive
{
  return 1;
}

- (NSString)id
{
  return -[NSUUID UUIDString](self->_uuid, "UUIDString");
}

- (id)description
{
  NSString *name;
  void *v3;
  void *v4;

  name = self->_name;
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSProfile %@ (%@)>"), name, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (GCSProfile)initWithUUID:(id)a3 name:(id)a4 persistentControllerIdentifier:(id)a5 gameBundleIdentifier:(id)a6 baseProfile:(BOOL)a7 customizable:(BOOL)a8 sfSymbolsName:(id)a9 elementMappings:(id)a10 hapticFeedbackOverride:(BOOL)a11 hapticStrength:(double)a12 doublePressShareGesture:(int64_t)a13 longPressShareGesture:(int64_t)a14 lightbarOverride:(BOOL)a15 lightbarCustomColorEnabled:(BOOL)a16 lightbarColor:(int64_t)a17
{
  id v23;
  id v24;
  id v25;
  GCSProfile *v26;
  uint64_t v27;
  NSDate *modifiedDate;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v23 = a3;
  v24 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a9;
  v25 = a10;
  v35.receiver = self;
  v35.super_class = (Class)GCSProfile;
  v26 = -[GCSProfile init](&v35, sel_init);
  if (v26)
  {
    +[NSDate date](&off_254DF3E30, "date");
    v27 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v26->_modifiedDate;
    v26->_modifiedDate = (NSDate *)v27;

    objc_storeStrong((id *)&v26->_uuid, a3);
    objc_storeStrong((id *)&v26->_name, a4);
    objc_storeStrong((id *)&v26->_persistentControllerIdentifier, a5);
    objc_storeStrong((id *)&v26->_gameBundleIdentifier, a6);
    v26->_baseProfile = a7;
    v26->_customizable = a8;
    objc_storeStrong((id *)&v26->_sfSymbolsName, a9);
    objc_storeStrong((id *)&v26->_elementMappings, a10);
    v26->_hapticFeedbackOverride = a11;
    v26->_hapticStrength = a12;
    v26->_doublePressShareGesture = a13;
    v26->_longPressShareGesture = a14;
    v26->_lightbarOverride = a15;
    v26->_lightbarCustomColorEnabled = a16;
    v26->_lightbarColor = a17;
  }

  return v26;
}

- (NSString)name
{
  NSString *v3;

  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("GCS_PROFILE_DEFAULT")))
  {
    _GCFConvertStringToLocalizedString();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_name;
  }
  return v3;
}

- (id)anonymizedCopy
{
  GCSProfile *v3;
  void *v4;
  GCSProfile *v5;
  NSString *name;

  v3 = [GCSProfile alloc];
  -[GCSProfile jsonObject](self, "jsonObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GCSProfile initWithJSONObject:](v3, "initWithJSONObject:", v4);

  name = v5->_name;
  v5->_name = (NSString *)CFSTR("Profile");

  return v5;
}

+ (id)elementMappingsFrom:(id)a3 for:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  GCSDirectionPadMapping *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  GCSDirectionPadMapping *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  GCSDirectionPadMapping *v31;
  GCSElementMapping *v32;
  uint64_t v33;
  GCSElementMapping *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v39;
  id v40;
  id obj;
  unsigned int v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)&off_254DF4908);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    v39 = *(_QWORD *)v45;
    v40 = v5;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mappingKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(v12, "name");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v43 = v17;

        if (objc_msgSend(v12, "kind") == 2)
        {
          objc_msgSend(v5, "objectForKey:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v18;
          else
            v19 = 0;
          v20 = v19;
          v21 = [GCSDirectionPadMapping alloc];
          v42 = objc_msgSend(v12, "remappingKey");
          v22 = objc_msgSend(v20, "invertHorizontally");
          v23 = objc_msgSend(v20, "invertVertically");
          v24 = v9;
          v25 = v7;
          v26 = objc_msgSend(v20, "swapAxes");

          v27 = v21;
          v28 = v43;
          v29 = v22;
          v10 = v39;
          v5 = v40;
          v30 = v26;
          v7 = v25;
          v9 = v24;
          v31 = -[GCSDirectionPadMapping initWithElementKey:mappingKey:remappingOrder:invertHorizontally:invertVertically:swapAxes:](v27, "initWithElementKey:mappingKey:remappingOrder:invertHorizontally:invertVertically:swapAxes:", v13, v43, v42, v29, v23, v30);

        }
        else
        {
          v32 = [GCSElementMapping alloc];
          v33 = objc_msgSend(v12, "remappingKey");
          v34 = v32;
          v28 = v43;
          v31 = -[GCSElementMapping initWithElementKey:mappingKey:remappingOrder:](v34, "initWithElementKey:mappingKey:remappingOrder:", v13, v43, v33);
        }
        objc_msgSend(v7, "addObject:", v31);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v7;
  v37 = (void *)v35;

  return v37;
}

BOOL __38__GCSProfile_elementMappingsFrom_for___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "remappingOrder");
  v5 = objc_msgSend(v4, "remappingOrder");

  return (int)a2 > v5;
}

+ (id)newBaseProfile
{
  GCSProfile *v2;
  void *v3;
  void *v4;
  GCSProfile *v5;
  uint64_t v7;
  uint64_t v8;

  v2 = [GCSProfile alloc];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  LOWORD(v8) = 0;
  LOBYTE(v7) = 0;
  v5 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:](v2, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v3, CFSTR("Base Profile"), 0, 0, 1, 1, 1.0, CFSTR("gamecontroller.fill"), v4, v7, 1, 2, v8, 0);

  return v5;
}

+ (int64_t)defaultDoublePressGesture
{
  return 1;
}

+ (int64_t)defaultLongPressGesture
{
  return 2;
}

+ (id)profile
{
  int64_t v2;
  int64_t v3;
  GCSProfile *v4;
  void *v5;
  void *v6;
  GCSProfile *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = +[GCSProfile defaultDoublePressGesture](GCSProfile, "defaultDoublePressGesture");
  v3 = +[GCSProfile defaultLongPressGesture](GCSProfile, "defaultLongPressGesture");
  v4 = [GCSProfile alloc];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  LOWORD(v10) = 0;
  LOBYTE(v9) = 0;
  v7 = -[GCSProfile initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:](v4, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v5, CFSTR("New Profile"), 0, 0, 0, 1, 1.0, CFSTR("gamecontroller.fill"), v6, v9, v2, v3, v10, 0);

  return v7;
}

+ (GCSProfile)profileWithName:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  +[GCSProfile profile](GCSProfile, "profile");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4[2];
  v4[2] = v3;

  return (GCSProfile *)v4;
}

+ (id)adhocProfileForController:(id)a3 gameBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  +[GCSProfile profile](GCSProfile, "profile");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7[2];
  v7[2] = CFSTR("-");

  objc_msgSend(v6, "persistentIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v7[5];
  v7[5] = v9;

  v11 = (void *)v7[6];
  v7[6] = v5;

  return v7;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)persistentControllerIdentifier
{
  return self->_persistentControllerIdentifier;
}

- (NSString)gameBundleIdentifier
{
  return self->_gameBundleIdentifier;
}

- (BOOL)isBaseProfile
{
  return self->_baseProfile;
}

- (BOOL)customizable
{
  return self->_customizable;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (NSDictionary)elementMappings
{
  return self->_elementMappings;
}

- (BOOL)hapticFeedbackOverride
{
  return self->_hapticFeedbackOverride;
}

- (double)hapticStrength
{
  return self->_hapticStrength;
}

- (int64_t)doublePressShareGesture
{
  return self->_doublePressShareGesture;
}

- (int64_t)longPressShareGesture
{
  return self->_longPressShareGesture;
}

- (BOOL)lightbarOverride
{
  return self->_lightbarOverride;
}

- (BOOL)lightbarCustomColorEnabled
{
  return self->_lightbarCustomColorEnabled;
}

- (int64_t)lightbarColor
{
  return self->_lightbarColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementMappings, 0);
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
  objc_storeStrong((id *)&self->_gameBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)archivalClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSProfile)initWithCoder:(id)a3
{
  id v4;
  GCSProfile *v5;
  uint64_t v6;
  NSDate *modifiedDate;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *persistentControllerIdentifier;
  uint64_t v14;
  NSString *gameBundleIdentifier;
  uint64_t v16;
  NSString *sfSymbolsName;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSDictionary *elementMappings;
  double v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GCSProfile;
  v5 = -[GCSProfile init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modifiedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_persistentControllerIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    persistentControllerIdentifier = v5->_persistentControllerIdentifier;
    v5->_persistentControllerIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_gameBundleIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    gameBundleIdentifier = v5->_gameBundleIdentifier;
    v5->_gameBundleIdentifier = (NSString *)v14;

    v5->_baseProfile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_baseProfile"));
    v5->_customizable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_customizable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sfSymbolsName"));
    v16 = objc_claimAutoreleasedReturnValue();
    sfSymbolsName = v5->_sfSymbolsName;
    v5->_sfSymbolsName = (NSString *)v16;

    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_elementMappings"));
    v22 = objc_claimAutoreleasedReturnValue();
    elementMappings = v5->_elementMappings;
    v5->_elementMappings = (NSDictionary *)v22;

    v5->_hapticFeedbackOverride = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hapticFeedbackOverride"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_hapticStrength"));
    v5->_hapticStrength = v24;
    v5->_doublePressShareGesture = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_doublePressShareGesture_ios"));
    v5->_longPressShareGesture = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_longPressShareGesture_ios"));
    v5->_lightbarOverride = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_lightbarOverride"));
    v5->_lightbarCustomColorEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_lightbarCustomColorEnabled"));
    v5->_lightbarColor = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_lightbarColor"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *modifiedDate;
  id v5;

  modifiedDate = self->_modifiedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modifiedDate, CFSTR("_modifiedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistentControllerIdentifier, CFSTR("_persistentControllerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gameBundleIdentifier, CFSTR("_gameBundleIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_baseProfile, CFSTR("_baseProfile"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_customizable, CFSTR("_customizable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sfSymbolsName, CFSTR("_sfSymbolsName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_elementMappings, CFSTR("_elementMappings"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hapticFeedbackOverride, CFSTR("_hapticFeedbackOverride"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_hapticStrength"), self->_hapticStrength);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_doublePressShareGesture, CFSTR("_doublePressShareGesture_ios"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_longPressShareGesture, CFSTR("_longPressShareGesture_ios"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lightbarOverride, CFSTR("_lightbarOverride"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lightbarCustomColorEnabled, CFSTR("_lightbarCustomColorEnabled"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lightbarColor, CFSTR("_lightbarColor"));

}

- (id)elementMappingsWithJSONDictionary:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  __objc2_class **v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "_gcs_dictionaryForJSONKey:", CFSTR("elementMappings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithCapacity:](&off_254DF4A00, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("invertHorizontally"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = &classRef_GCSElementMapping;
            if (v13)
              v14 = &classRef_GCSDirectionPadMapping;
            v15 = (void *)objc_msgSend(objc_alloc(*v14), "initWithJSONObject:", v12);
            if (v15)
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v10);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v17;
}

- (GCSProfile)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSProfile *v6;
  void *v7;
  void *v8;
  NSDate *v9;
  GCSProfile *v10;
  NSDate *modifiedDate;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *persistentControllerIdentifier;
  uint64_t v18;
  NSString *gameBundleIdentifier;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *sfSymbolsName;
  uint64_t v24;
  NSDictionary *elementMappings;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v35;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v35.receiver = self;
    v35.super_class = (Class)GCSProfile;
    v6 = -[GCSProfile init](&v35, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_dateForJSONKey:", CFSTR("modifiedDate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        +[NSDate date](&off_254DF3E30, "date");
        v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v9;

      objc_msgSend(v5, "_gcs_uuidForJSONKey:", CFSTR("uuid"));
      v12 = objc_claimAutoreleasedReturnValue();
      uuid = v6->_uuid;
      v6->_uuid = (NSUUID *)v12;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("name"));
      v14 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v14;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("persistentControllerIdentifier"));
      v16 = objc_claimAutoreleasedReturnValue();
      persistentControllerIdentifier = v6->_persistentControllerIdentifier;
      v6->_persistentControllerIdentifier = (NSString *)v16;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("gameBundleIdentifier"));
      v18 = objc_claimAutoreleasedReturnValue();
      gameBundleIdentifier = v6->_gameBundleIdentifier;
      v6->_gameBundleIdentifier = (NSString *)v18;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("isBaseProfile"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_baseProfile = objc_msgSend(v20, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("customizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_customizable = objc_msgSend(v21, "BOOLValue");

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("sfSymbolsName"));
      v22 = objc_claimAutoreleasedReturnValue();
      sfSymbolsName = v6->_sfSymbolsName;
      v6->_sfSymbolsName = (NSString *)v22;

      -[GCSProfile elementMappingsWithJSONDictionary:](v6, "elementMappingsWithJSONDictionary:", v5);
      v24 = objc_claimAutoreleasedReturnValue();
      elementMappings = v6->_elementMappings;
      v6->_elementMappings = (NSDictionary *)v24;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("hapticFeedbackOverride"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_hapticFeedbackOverride = objc_msgSend(v26, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("hapticStrength"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v6->_hapticStrength = v28;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("doublePressShareGesture_ios"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_doublePressShareGesture = objc_msgSend(v29, "longValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("longPressShareGesture_ios"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_longPressShareGesture = objc_msgSend(v30, "longValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("lightbarOverride"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_lightbarOverride = objc_msgSend(v31, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("lightbarCustomColorEnabled"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_lightbarCustomColorEnabled = objc_msgSend(v32, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("lightbarColor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_lightbarColor = objc_msgSend(v33, "longValue");

    }
    self = v6;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GCSJSONObject)jsonObject
{
  NSString *name;
  NSDictionary *elementMappings;
  NSString *sfSymbolsName;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *persistentControllerIdentifier;
  NSString *gameBundleIdentifier;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[14];
  _QWORD v24[16];

  v24[14] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("modifiedDate");
  -[NSDate jsonObject](self->_modifiedDate, "jsonObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("uuid");
  -[NSUUID jsonObject](self->_uuid, "jsonObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v24[1] = v21;
  v24[2] = name;
  v23[2] = CFSTR("name");
  v23[3] = CFSTR("isBaseProfile");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_baseProfile);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v20;
  v23[4] = CFSTR("customizable");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_customizable);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sfSymbolsName = self->_sfSymbolsName;
  elementMappings = self->_elementMappings;
  v24[4] = v19;
  v24[5] = sfSymbolsName;
  v23[5] = CFSTR("sfSymbolsName");
  v23[6] = CFSTR("elementMappings");
  +[NSDictionary _gcs_jsonObjectForSerializableDictionary:](&off_254DF3850, "_gcs_jsonObjectForSerializableDictionary:", elementMappings);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v18;
  v23[7] = CFSTR("hapticFeedbackOverride");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_hapticFeedbackOverride);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v6;
  v23[8] = CFSTR("hapticStrength");
  +[NSNumber numberWithDouble:](&off_254DF4058, "numberWithDouble:", self->_hapticStrength);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v7;
  v23[9] = CFSTR("doublePressShareGesture_ios");
  +[NSNumber numberWithInteger:](&off_254DF4058, "numberWithInteger:", self->_doublePressShareGesture);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v8;
  v23[10] = CFSTR("longPressShareGesture_ios");
  +[NSNumber numberWithInteger:](&off_254DF4058, "numberWithInteger:", self->_longPressShareGesture);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v9;
  v23[11] = CFSTR("lightbarOverride");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_lightbarOverride);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v10;
  v23[12] = CFSTR("lightbarCustomColorEnabled");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_lightbarCustomColorEnabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v11;
  v23[13] = CFSTR("lightbarColor");
  +[NSNumber numberWithInteger:](&off_254DF4058, "numberWithInteger:", self->_lightbarColor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v12;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v24, v23, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DF4A00, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  persistentControllerIdentifier = self->_persistentControllerIdentifier;
  if (persistentControllerIdentifier)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", persistentControllerIdentifier, CFSTR("persistentControllerIdentifier"));
  gameBundleIdentifier = self->_gameBundleIdentifier;
  if (gameBundleIdentifier)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", gameBundleIdentifier, CFSTR("gameBundleIdentifier"));
  return (GCSJSONObject *)v14;
}

@end

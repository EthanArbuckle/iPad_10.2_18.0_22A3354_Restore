@implementation NTKWorldClockComplication

+ (int64_t)compareComplication:(id)a3 toComplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t (**v10)(void *, id);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  _QWORD aBlock[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_allCities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke;
  aBlock[3] = &unk_1E6BDA018;
  v19 = v8;
  v9 = v8;
  v10 = (uint64_t (**)(void *, id))_Block_copy(aBlock);
  v11 = v10[2](v10, v6);
  v12 = v10[2](v10, v7);
  if (v11 == v12)
  {
    v13 = objc_msgSend(v6, "complicationType");
    v14 = objc_msgSend(v7, "complicationType");
    v15 = -1;
    if (v13 >= v14)
      v15 = 1;
    if (v13 == v14)
      v16 = 0;
    else
      v16 = v15;
  }
  else if (v11 < v12)
  {
    v16 = -1;
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

uint64_t __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -3;
  }
  else if (objc_msgSend(v3, "complicationType") == 12)
  {
    v4 = -1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "city");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alCityId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "complicationDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("cityID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v9 = 0;
      }

      v6 = v9;
    }
    v10 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke_2;
    v14[3] = &unk_1E6BD9FF0;
    v15 = v6;
    v11 = v6;
    v12 = objc_msgSend(v10, "indexOfObjectPassingTest:", v14);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = -2;
    else
      v4 = v12;

  }
  return v4;
}

uint64_t __64__NTKWorldClockComplication_compareComplication_toComplication___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "alCityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == *(void **)(a1 + 32))
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "isEqual:");
  *a4 = v8;

  return v8;
}

+ (id)_allCities
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;

  +[NTKWorldClockManager sharedManager](NTKWorldClockManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cities");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3 || (v4 = (void *)v3, v5 = objc_msgSend(v2, "checkIfCitiesModified"), v4, v5))
    objc_msgSend(v2, "loadCities");
  objc_msgSend(v2, "cities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "_allCities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", a3);
        objc_storeStrong((id *)(v11 + 32), v10);
        objc_msgSend((id)v11, "_generateUniqueIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(v11 + 8);
        *(_QWORD *)(v11 + 8) = v12;

        objc_msgSend(v5, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v8 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKWorldClockComplication city](self, "city");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "city");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- (id)_generateUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockCity alCityId](self->_city, "alCityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedDetailText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  -[NTKWorldClockComplication city](self, "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("79129411-2004-4B40-89F6-B0E14651B97F"));
    v7 = objc_msgSend(v5, "supportsCapability:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v4;
    }
    v9 = v8;

  }
  else
  {
    NTKComplicationTypeLocalizedLabelText(-[NTKComplication complicationType](self, "complicationType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
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
  v8.super_class = (Class)NTKWorldClockComplication;
  -[NTKComplication description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorldClockCity alCityId](self->_city, "alCityId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%d)"), v4, objc_msgSend(v5, "intValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[WorldClockCity alCityId](self->_city, "alCityId", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v5, "intValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "calendarDateMatchesContext:", v6)
    && objc_msgSend(v5, "timeZoneMatchesContext:", v6))
  {
    v7 = objc_msgSend(v5, "localeMatchesContext:", v6) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplication;
  v4 = -[NTKComplication copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_city);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKWorldClockComplication)initWithCoder:(id)a3
{
  id v4;
  NTKWorldClockComplication *v5;
  uint64_t v6;
  uint64_t v7;
  WorldClockCity *city;
  uint64_t v9;
  NSString *uniqueIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKWorldClockComplication;
  v5 = -[NTKComplication initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("WorldClockComplicationCityKey"));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4FAC0]), "initWithALCityIdentifier:", v6);
    city = v5->_city;
    v5->_city = (WorldClockCity *)v7;

    if (!v5->_city)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil city"), objc_opt_class());
    -[NTKWorldClockComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WorldClockCity alCityId](self->_city, "alCityId", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", objc_msgSend(v5, "intValue"), CFSTR("WorldClockComplicationCityKey"));

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWorldClockComplication;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v6, sel__addKeysToJSONDictionary_, v4);
  -[WorldClockCity alCityId](self->_city, "alCityId", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("city ID"));

}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKWorldClockComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v12, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("city ID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for key '%@'"), CFSTR("city ID"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be number - invalid value: %@"), CFSTR("city ID"), v8);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4FAC0]), "initWithALCityIdentifier:", objc_msgSend(v8, "intValue"));
    v10 = (void *)v7[4];
    v7[4] = v9;

    if (!v7[4])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("invalid value for key '%@': %@"), CFSTR("city ID"), v8);

  }
  return v7;
}

- (void)_handleAddedFromFaceSharing
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "WorldClockManager can not add any city.", a5, a6, a7, a8, 0);
}

- (WorldClockCity)city
{
  return self->_city;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
}

@end

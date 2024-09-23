@implementation NTKBundleComplication

- (id)ntk_sectionIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NTKBundleComplication complication](self, "complication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifierForBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bundledComplicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "bundledComplicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", a3, a4, 0);
}

+ (id)bundledComplicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bundleComplicationExistsForAppBundleIdentifier:", v9);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundledComplicationWithComplication:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)bundledComplicationWithComplication:(id)a3
{
  CLKCBundleComplication *v3;
  NTKBundleComplication *v4;
  CLKCBundleComplication *complication;
  CLKCBundleComplication *v6;
  uint64_t v7;
  NSString *uniqueIdentifier;

  v3 = (CLKCBundleComplication *)a3;
  v4 = -[NTKComplication initWithComplicationType:]([NTKBundleComplication alloc], "initWithComplicationType:", 48);
  complication = v4->_complication;
  v4->_complication = v3;
  v6 = v3;

  -[NTKBundleComplication _generateUniqueIdentifier](v4, "_generateUniqueIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v4->super._uniqueIdentifier;
  v4->super._uniqueIdentifier = (NSString *)v7;

  return v4;
}

- (id)_generateUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCBundleComplication appBundleIdentifier](self->_complication, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCBundleComplication bundleIdentifier](self->_complication, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  return v8;
}

- (id)analyticsIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NTKReportingValueForComplication(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%@"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  return v5;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return (CLKComplicationDescriptor *)-[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
}

- (id)appIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;

  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCBundleComplication bundleIdentifier](self->_complication, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupIdentifierForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[CLKCBundleComplication appBundleIdentifier](self->_complication, "appBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = CFSTR("com.apple.nanotimekit.internal");
      goto LABEL_6;
    }
    -[CLKCBundleComplication appBundleIdentifier](self->_complication, "appBundleIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
LABEL_6:

  return v8;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NTKBundleComplication_supportsComplicationFamily_forDevice___block_invoke;
  v9[3] = &unk_1E6BD51F0;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v7, "enumerateBundlesForComplicationFamily:device:withBlock:", a3, v6, v9);

  LOBYTE(a3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return a3;
}

void __62__NTKBundleComplication_supportsComplicationFamily_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  int v10;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = a2;
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[NTKComplication uniqueIdentifier](self, "uniqueIdentifier", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lx"), objc_msgSend(v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Complication Bundle of %@"), self->_complication);
}

- (id)localizedKeylineLabelText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[NTKBundleComplication complication](self, "complication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKCBundleComplication bundleIdentifier](self->_complication, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedComplicationNameForBundleIdentifier:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplication;
  v4 = -[NTKComplication copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_complication);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_revertedBundleComplicationFromJSONDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  NTKComplication *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("bundle identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.NanoReminders.ComplicationBundle")) & 1) != 0)
  {
    v4 = 20;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MessagesComplication")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = 23;
  }
  v5 = -[NTKComplication initWithComplicationType:]([NTKComplication alloc], "initWithComplicationType:", v4);
LABEL_7:

  return v5;
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKBundleComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v17, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle app identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundle app complication descriptor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94148]), "initWithJSONObjectRepresentation:", v10);
    else
      v11 = 0;
    objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v8, v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v7[4];
    v7[4] = v12;

    objc_msgSend(v7, "_generateUniqueIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v7[1];
    v7[1] = v14;

  }
  return v7;
}

- (NTKBundleComplication)initWithCoder:(id)a3
{
  id v4;
  NTKBundleComplication *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CLKCBundleComplication *complication;
  uint64_t v11;
  NSString *uniqueIdentifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKBundleComplication;
  v5 = -[NTKComplication initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ComplicationBundleIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ComplicationBundleAppIdentifierKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ComplicationBundleComplicationDescriptorKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    complication = v5->_complication;
    v5->_complication = (CLKCBundleComplication *)v9;

    if (!v5->_complication)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil complication"), objc_opt_class());
    -[NTKBundleComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKBundleComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CLKCBundleComplication bundleIdentifier](self->_complication, "bundleIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_ComplicationBundleIdentifierKey"));

  -[CLKCBundleComplication appBundleIdentifier](self->_complication, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_ComplicationBundleAppIdentifierKey"));

  -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_ComplicationBundleComplicationDescriptorKey"));

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKBundleComplication;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v14, sel__addKeysToJSONDictionary_, v4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCBundleComplication bundleIdentifier](self->_complication, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CLKCBundleComplication bundleIdentifier](self->_complication, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("bundle identifier"));

  }
  -[CLKCBundleComplication appBundleIdentifier](self->_complication, "appBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CLKCBundleComplication appBundleIdentifier](self->_complication, "appBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("bundle app identifier"));

  }
  -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CLKCBundleComplication complicationDescriptor](self->_complication, "complicationDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "JSONObjectRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("bundle app complication descriptor"));
  }
  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "addEntriesFromDictionary:", v13);

}

- (CLKCBundleComplication)complication
{
  return self->_complication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complication, 0);
}

- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (NTKIsRichComplicationFamily(a3))
  {
    -[NTKBundleComplication complication](self, "complication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 11)
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.NanoCompass.complications.altitude")))
        goto LABEL_24;
    }
    else
    {
      if (a3 != 8)
        goto LABEL_24;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.NanoCompass.complications.compass")) & 1) == 0)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.NanoCompass.complications.altitude")) & 1) != 0)
        {
          v20 = v8;
          v9 = CFSTR("com.apple.NanoCompass.complications.altitude.incline");
LABEL_10:
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = v6;
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
                if (objc_msgSend(v16, "isMemberOfClass:", objc_opt_class()))
                {
                  v10 = v16;
                  objc_msgSend(v10, "complication");
                  v17 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v17, "bundleIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  LOBYTE(v17) = objc_msgSend(v18, "isEqualToString:", v9);
                  if ((v17 & 1) != 0)
                    goto LABEL_23;

                }
                ++v15;
              }
              while (v13 != v15);
              v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            }
            while (v13);
          }

          _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[NTKBundleComplication(BlueRidgeMigration) _migrateToFamily:withAllowedComplications:].cold.1((uint64_t)v9, v11);
          v10 = 0;
LABEL_23:
          v8 = v20;

          goto LABEL_25;
        }
LABEL_24:
        v10 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v20 = v8;
    v9 = CFSTR("com.apple.NanoCompass.complications.compass.bearing");
    goto LABEL_10;
  }
  v10 = 0;
LABEL_26:

  return v10;
}

@end

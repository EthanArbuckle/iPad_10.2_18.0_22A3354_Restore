@implementation NTKRemoteComplication

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  char v5;
  void *v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  NTKClockFaceLocalizedString(CFSTR("COMPLICATION_JOINED_DESCRIPTORS"), CFSTR("%@: %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __99__NTKRemoteComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke;
  v24 = &unk_1E6BCE598;
  v26 = &v27;
  v7 = v6;
  v25 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(&v21);
  if ((v5 & 2) != 0)
  {
    -[NTKComplication localizedSectionHeaderName](self, "localizedSectionHeaderName", v21, v22, v23, v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9);

  }
  if ((v5 & 1) != 0)
  {
    -[NTKRemoteComplication complicationDescriptor](self, "complicationDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "localizedLowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedLowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = NTKEqualObjects(v12, v13);

    if ((v14 & 1) == 0)
      v8[2](v8, v11);

  }
  if (!objc_msgSend((id)v28[5], "length", v21, v22, v23, v24))
  {
    NTKSharedRemoteComplicationProvider();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRemoteComplication clientIdentifier](self, "clientIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedAppNameForClientIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v28[5];
    v28[5] = v17;

  }
  v19 = (void *)objc_msgSend((id)v28[5], "copy");

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __99__NTKRemoteComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;
    }
    else
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = v8;
      v5 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v7;
    }

  }
}

- (NTKRemoteComplication)initWithComplicationType:(unint64_t)a3
{
  NTKRemoteComplication *v4;
  void *v5;
  __CFString *v6;
  NSString *appBundleIdentifier;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CLKComplicationDescriptor *complicationDescriptor;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRemoteComplication;
  v4 = -[NTKComplication initWithComplicationType:](&v14, sel_initWithComplicationType_, 31);
  if (a3 == 9)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "nrDeviceVersion") >> 16 <= 6)
      v6 = CFSTR("com.apple.stocks.watchapp.watchextension");
    else
      v6 = CFSTR("com.apple.stocks.watchapp");
    objc_storeStrong((id *)&v4->_clientIdentifier, v6);

    appBundleIdentifier = v4->_appBundleIdentifier;
    v4->_appBundleIdentifier = (NSString *)CFSTR("com.apple.stocks.watchapp");

    v8 = *MEMORY[0x1E0C93EC8];
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKRemoteComplication _remoteStocksComplicationDescriptorWithIdentifier:forDevice:](NTKRemoteComplication, "_remoteStocksComplicationDescriptorWithIdentifier:forDevice:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    complicationDescriptor = v4->_complicationDescriptor;
    v4->_complicationDescriptor = (CLKComplicationDescriptor *)v10;

  }
  -[NTKRemoteComplication _generateUniqueIdentifier](v4, "_generateUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKComplication setUniqueIdentifier:](v4, "setUniqueIdentifier:", v12);

  return v4;
}

+ (id)complicationWithClientIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 31);
  v12 = (void *)v11[4];
  v11[4] = v8;
  v13 = v8;

  v14 = (void *)v11[5];
  v11[5] = v9;
  v15 = v9;

  v16 = (void *)v11[6];
  v11[6] = v10;

  objc_msgSend(v11, "_generateUniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUniqueIdentifier:", v17);

  return v11;
}

- (id)analyticsIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NTKReportingValueForComplication(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRemoteComplication appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationDescriptor identifier](self->_complicationDescriptor, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_generateUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRemoteComplication appBundleIdentifier](self, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationDescriptor identifier](self->_complicationDescriptor, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 9)
    return MEMORY[0x1E0C9AA60];
  v4 = *MEMORY[0x1E0C93EC8];
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_remoteStocksComplicationWithIdentifier:forDevice:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)resetComplicationDescriptor
{
  CLKComplicationDescriptor *v3;
  CLKComplicationDescriptor *complicationDescriptor;
  id v5;

  -[CLKComplicationDescriptor supportedFamilies](self->_complicationDescriptor, "supportedFamilies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptorWithSupportedFamilies:", v5);
  v3 = (CLKComplicationDescriptor *)objc_claimAutoreleasedReturnValue();
  complicationDescriptor = self->_complicationDescriptor;
  self->_complicationDescriptor = v3;

}

- (id)watchLocalizedKeylineLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[NTKRemoteComplication complicationDescriptor](self, "complicationDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    NTKSharedRemoteComplicationProvider();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRemoteComplication clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedAppNameForClientIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (id)companionLocalizedKeylineLabelText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[NTKRemoteComplication complicationDescriptor](self, "complicationDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    NTKSharedRemoteComplicationProvider();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRemoteComplication clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedAppNameForClientIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)NTKRemoteComplication;
  -[NTKComplication description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRemoteComplication clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationDescriptor identifier](self->_complicationDescriptor, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_remoteStocksComplicationDescriptorWithIdentifier:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v5, "isRunningGraceOrLater"))
  {
    objc_msgSend(&unk_1E6CA9BC8, "arrayByAddingObject:", &unk_1E6C9EB78);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_1E6CA9BC8;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("63DBFE2B-B226-4EF1-AFBB-43E4CCE6A43E"));
  v9 = objc_msgSend(v5, "supportsCapability:", v8);

  if (v9)
  {
    objc_msgSend(v7, "arrayByAddingObject:", &unk_1E6C9EB90);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  v11 = objc_alloc(MEMORY[0x1E0C94148]);
  v12 = (void *)objc_msgSend(v11, "initWithIdentifier:displayName:supportedFamilies:userInfo:", v6, &stru_1E6BDC918, v7, MEMORY[0x1E0C9AA70]);

  return v12;
}

+ (id)_remoteStocksComplicationWithIdentifier:(id)a3 forDevice:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0C944B0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "nrDeviceVersion") >> 16 <= 6)
    v10 = CFSTR("com.apple.stocks.watchapp.watchextension");
  else
    v10 = CFSTR("com.apple.stocks.watchapp");
  v11 = v10;
  objc_msgSend(a1, "_remoteStocksComplicationDescriptorWithIdentifier:forDevice:", v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "complicationWithClientIdentifier:appBundleIdentifier:complicationDescriptor:", v11, CFSTR("com.apple.stocks.watchapp"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[NTKRemoteComplication complicationDescriptor](self, "complicationDescriptor", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "supportedFamilies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  void *v6;
  void *v7;
  CLKComplicationDescriptor *complicationDescriptor;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRemoteComplication clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  complicationDescriptor = self->_complicationDescriptor;
  -[NTKRemoteComplication appBundleIdentifier](self, "appBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sampleTemplateForClientIdentifier:descriptor:applicationID:family:", v7, complicationDescriptor, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[NTKRemoteComplication appBundleIdentifier](self, "appBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKComplicationDescriptor identifier](self->_complicationDescriptor, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@,%@,%lx"), v15, v16, (uint64_t)v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKRemoteComplication;
  v4 = -[NTKComplication copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[NTKRemoteComplication clientIdentifier](self, "clientIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

  -[NTKRemoteComplication appBundleIdentifier](self, "appBundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v7;

  objc_storeStrong((id *)v4 + 6, self->_complicationDescriptor);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKRemoteComplication)initWithCoder:(id)a3
{
  id v4;
  NTKRemoteComplication *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  void *v8;
  uint64_t v9;
  NSString *appBundleIdentifier;
  void *v11;
  uint64_t v12;
  CLKComplicationDescriptor *complicationDescriptor;
  uint64_t v14;
  CLKComplicationDescriptor *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NTKRemoteComplication;
  v5 = -[NTKComplication initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteComplicationClientIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    -[NTKRemoteComplication clientIdentifier](v5, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil client identifier"), objc_opt_class());
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteComplicationAppBundleIdentifierKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v9;

    -[NTKRemoteComplication appBundleIdentifier](v5, "appBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil app bundle identifier"), objc_opt_class());
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteComplicationComplicationDescriptorKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    complicationDescriptor = v5->_complicationDescriptor;
    v5->_complicationDescriptor = (CLKComplicationDescriptor *)v12;

    if (!v5->_complicationDescriptor)
    {
      objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v5->_complicationDescriptor;
      v5->_complicationDescriptor = (CLKComplicationDescriptor *)v14;

    }
    -[NTKRemoteComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplication setUniqueIdentifier:](v5, "setUniqueIdentifier:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRemoteComplication;
  -[NTKThirdPartyComplication encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRemoteComplication;
  -[NTKThirdPartyComplication _addKeysToJSONDictionary:](&v3, sel__addKeysToJSONDictionary_, a3);
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  id *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  objc_super v28;

  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)NTKRemoteComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v28, sel__initWithComplicationType_JSONDictionary_, 31, v6);
  v8 = (id *)v7;
  if (v7)
  {
    if (a3 == 9)
    {
      v9 = (void *)v7[5];
      v7[5] = CFSTR("com.apple.stocks.watchapp");

      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "nrDeviceVersion") >> 16 <= 6)
        v11 = CFSTR("com.apple.stocks.watchapp.watchextension");
      else
        v11 = CFSTR("com.apple.stocks.watchapp");
      objc_storeStrong(v8 + 4, v11);

      v12 = *MEMORY[0x1E0C93EC8];
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKRemoteComplication _remoteStocksComplicationDescriptorWithIdentifier:forDevice:](NTKRemoteComplication, "_remoteStocksComplicationDescriptorWithIdentifier:forDevice:", v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v8[6];
      v8[6] = (id)v14;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("app"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v8[5];
      v8[5] = (id)v16;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extension"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v19 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(v8, "appBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("complication of type '%@' missing value for key '%@'"), v20, CFSTR("extension"));

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(v8, "appBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("complication of type '%@' value for key '%@' must be a string - invalid value: %@"), v22, CFSTR("extension"), v18);

      }
      v23 = v8[4];
      v8[4] = v18;
      v15 = v18;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("complication descriptor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94148]), "initWithJSONObjectRepresentation:", v13);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v25 = v8[6];
      v8[6] = (id)v24;

    }
    objc_msgSend(v8, "_generateUniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUniqueIdentifier:", v26);

  }
  return v8;
}

- (id)clkClientIdentifier
{
  return self->_clientIdentifier;
}

- (id)clkComplicationDescriptor
{
  return self->_complicationDescriptor;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end

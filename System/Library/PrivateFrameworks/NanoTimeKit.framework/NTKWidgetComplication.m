@implementation NTKWidgetComplication

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
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  v38 = 0;
  NTKClockFaceLocalizedString(CFSTR("COMPLICATION_JOINED_DESCRIPTORS"), CFSTR("%@: %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __99__NTKWidgetComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke;
  v30 = &unk_1E6BCE598;
  v32 = &v33;
  v7 = v6;
  v31 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(&v27);
  if ((v5 & 2) != 0)
  {
    -[NTKComplication localizedSectionHeaderName](self, "localizedSectionHeaderName", v27, v28, v29, v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9);

  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice", v27, v28, v29, v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NTKSharedWidgetComplicationProvider((uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v13, "localizedDisplayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34[5], "localizedLowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedLowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = NTKEqualObjects(v15, v16);

    if ((v17 & 1) == 0)
      v8[2](v8, v14);

  }
  if (!objc_msgSend(v34[5], "length"))
  {
    objc_msgSend(v13, "localizedAppName");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v34[5];
    v34[5] = (id)v18;

    v20 = v34[5];
    -[NTKWidgetComplication descriptor](self, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "containerBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = NTKEqualObjects(v20, v22);

    v23 = v20 ^ 1;
    if ((v5 & 1) == 0)
      v23 = 1;
    if ((v23 & 1) == 0)
    {
      -[NTKComplication localizedSectionHeaderName](self, "localizedSectionHeaderName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length"))
        objc_storeStrong(v34 + 5, v24);

    }
  }
  v25 = (void *)objc_msgSend(v34[5], "copy");

  _Block_object_dispose(&v33, 8);
  return v25;
}

void __99__NTKWidgetComplication_NTKComplicationItem__ntk_localizedNameWithOptions_forRichComplicationSlot___block_invoke(uint64_t a1, void *a2)
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

+ (NTKWidgetComplication)complicationWithDescriptor:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 56);
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[4];
  v5[4] = v6;

  objc_msgSend(v5, "_createUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniqueIdentifier:", v8);

  return (NTKWidgetComplication *)v5;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  +[NTKCompanionWidgetComplicationManager instanceForDevice:](NTKCompanionWidgetComplicationManager, "instanceForDevice:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sampleTemplateForWidget:family:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[NTKComplication uniqueIdentifier](self, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@,%ld"), v13, (uint64_t)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)analyticsIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NTKReportingValueForComplication(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_createUniqueIdentifier
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
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWidgetComplication descriptor](self, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intentReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@-%li"), v5, v7, v9, objc_msgSend(v11, "indexingHash"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)appIdentifier
{
  void *v2;
  void *v3;

  -[NTKWidgetComplication descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  NTKSharedWidgetComplicationProvider((uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "isComplicationAvailable:forFamilies:", self, v8);

  return a3;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return 1;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKWidgetComplication;
  return -[NTKComplication snapshotContext:isStaleRelativeToContext:](&v5, sel_snapshotContext_isStaleRelativeToContext_, a3, a4);
}

- (NSString)containerBundleIdentifier
{
  return (NSString *)-[CLKWidgetComplicationDescriptor containerBundleIdentifier](self->_descriptor, "containerBundleIdentifier");
}

- (NSString)extensionBundleIdentifier
{
  return (NSString *)-[CLKWidgetComplicationDescriptor extensionBundleIdentifier](self->_descriptor, "extensionBundleIdentifier");
}

- (NSString)kind
{
  return (NSString *)-[CLKWidgetComplicationDescriptor kind](self->_descriptor, "kind");
}

- (INIntent)intent
{
  void *v2;
  void *v3;

  -[CLKWidgetComplicationDescriptor intentReference](self->_descriptor, "intentReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INIntent *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKWidgetComplication)initWithCoder:(id)a3
{
  id v4;
  NTKWidgetComplication *v5;
  uint64_t v6;
  CLKWidgetComplicationDescriptor *descriptor;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKWidgetComplication;
  v5 = -[NTKComplication initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v6 = objc_claimAutoreleasedReturnValue();
    descriptor = v5->_descriptor;
    v5->_descriptor = (CLKWidgetComplicationDescriptor *)v6;

    -[NTKWidgetComplication _createUniqueIdentifier](v5, "_createUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplication setUniqueIdentifier:](v5, "setUniqueIdentifier:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKWidgetComplication;
  v4 = a3;
  -[NTKThirdPartyComplication encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"), v5.receiver, v5.super_class);

}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKWidgetComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v14, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("descriptor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)MEMORY[0x1E0CB2C88];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("CLKWidgetComplicationDescriptor dictionary is nil or not a dictionary"));
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94578]), "initWithJSONObjectRepresentation:", v8);
    v11 = (void *)v7[4];
    v7[4] = v10;

    if (!v7[4] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("CLKWidgetComplicationDescriptor is not defined or an incorrect class"));
    objc_msgSend(v7, "_createUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUniqueIdentifier:", v12);

  }
  return v7;
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKWidgetComplication;
  v4 = a3;
  -[NTKThirdPartyComplication _addKeysToJSONDictionary:](&v9, sel__addKeysToJSONDictionary_, v4);
  -[NTKWidgetComplication descriptor](self, "descriptor", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("app"));

  -[NTKWidgetComplication descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "JSONObjectRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("descriptor"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)NTKWidgetComplication;
  -[NTKComplication description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKWidgetComplicationDescriptor extensionBundleIdentifier](self->_descriptor, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKWidgetComplicationDescriptor kind](self->_descriptor, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKWidgetComplicationDescriptor intentReference](self->_descriptor, "intentReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@, %lli)"), v4, v5, v6, objc_msgSend(v7, "indexingHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKWidgetComplication;
  v4 = -[NTKComplication copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_descriptor);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[NTKWidgetComplication descriptor](self, "descriptor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "descriptor"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v5,
        v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKWidgetComplication;
    v8 = -[NTKComplication isEqual:](&v10, sel_isEqual_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)clkComplicationDescriptor
{
  return 0;
}

- (CLKWidgetComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end

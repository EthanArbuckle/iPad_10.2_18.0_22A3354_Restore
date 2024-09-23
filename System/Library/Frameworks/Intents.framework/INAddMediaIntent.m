@implementation INAddMediaIntent

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INAddMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch mediaDestination:(INMediaDestination *)mediaDestination
{
  NSArray *v8;
  INMediaSearch *v9;
  INMediaDestination *v10;
  INAddMediaIntent *v11;
  INAddMediaIntent *v12;
  objc_super v14;

  v8 = mediaItems;
  v9 = mediaSearch;
  v10 = mediaDestination;
  v14.receiver = self;
  v14.super_class = (Class)INAddMediaIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INAddMediaIntent setMediaItems:](v11, "setMediaItems:", v8);
    -[INAddMediaIntent setMediaSearch:](v12, "setMediaSearch:", v9);
    -[INAddMediaIntent setMediaDestination:](v12, "setMediaDestination:", v10);
  }

  return v12;
}

- (NSArray)mediaItems
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaItemValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setMediaItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaItemValues(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaItems:", v5);
}

- (INMediaSearch)mediaSearch
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaSearch(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INMediaSearch *)v4;
}

- (void)setMediaSearch:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaSearch:", v5);
}

- (INMediaDestination)mediaDestination
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromMediaDestination(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INMediaDestination *)v4;
}

- (void)setMediaDestination:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaDestination(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaDestination:", v5);
}

- (INPrivateAddMediaIntentData)privateAddMediaIntentData
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateAddMediaIntentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPrivateAddMediaIntentData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPrivateAddMediaIntentData *)v4;
}

- (void)setPrivateAddMediaIntentData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPrivateAddMediaIntentData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPrivateAddMediaIntentData:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("mediaItems");
  -[INAddMediaIntent mediaItems](self, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("mediaSearch");
  -[INAddMediaIntent mediaSearch](self, "mediaSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("mediaDestination");
  -[INAddMediaIntent mediaDestination](self, "mediaDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return v9;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INAddMediaIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Media");
}

- (id)verb
{
  return CFSTR("AddMedia");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

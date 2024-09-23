@implementation INUpdateMediaAffinityIntent

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

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INUpdateMediaAffinityIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch affinityType:(INMediaAffinityType)affinityType
{
  NSArray *v8;
  INMediaSearch *v9;
  INUpdateMediaAffinityIntent *v10;
  INUpdateMediaAffinityIntent *v11;
  objc_super v13;

  v8 = mediaItems;
  v9 = mediaSearch;
  v13.receiver = self;
  v13.super_class = (Class)INUpdateMediaAffinityIntent;
  v10 = -[INIntent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[INUpdateMediaAffinityIntent setMediaItems:](v10, "setMediaItems:", v8);
    -[INUpdateMediaAffinityIntent setMediaSearch:](v11, "setMediaSearch:", v9);
    -[INUpdateMediaAffinityIntent setAffinityType:](v11, "setAffinityType:", affinityType);
  }

  return v11;
}

- (NSArray)mediaItems
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaSearch:", v5);
}

- (INMediaAffinityType)affinityType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INMediaAffinityType v8;

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAffinityType");
  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "affinityType");
  v7 = v6 == 1;
  if (v6 == 2)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = INMediaAffinityTypeUnknown;

  return v8;
}

- (void)setAffinityType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 2)
    objc_msgSend(v4, "setHasAffinityType:", 0);
  else
    objc_msgSend(v4, "setAffinityType:", a3);

}

- (INPrivateUpdateMediaAffinityIntentData)privateUpdateMediaAffinityIntentData
{
  void *v2;
  void *v3;
  void *v4;

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateUpdateMediaAffinityIntentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPrivateUpdateMediaAffinityIntentData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPrivateUpdateMediaAffinityIntentData *)v4;
}

- (void)setPrivateUpdateMediaAffinityIntentData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPrivateUpdateMediaAffinityIntentData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPrivateUpdateMediaAffinityIntentData:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INMediaAffinityType v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("mediaItems");
  -[INUpdateMediaAffinityIntent mediaItems](self, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("mediaSearch");
  -[INUpdateMediaAffinityIntent mediaSearch](self, "mediaSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v6;
  v12[2] = CFSTR("affinityType");
  v7 = -[INUpdateMediaAffinityIntent affinityType](self, "affinityType");
  v8 = CFSTR("unknown");
  if (v7 == INMediaAffinityTypeDislike)
    v8 = CFSTR("dislike");
  if (v7 == INMediaAffinityTypeLike)
    v8 = CFSTR("like");
  v9 = v8;
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (!v3)

  return v10;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INUpdateMediaAffinityIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("UpdateMediaAffinity");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

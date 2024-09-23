@implementation INSearchForMediaIntent

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

  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSearchForMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch
{
  NSArray *v6;
  INMediaSearch *v7;
  INSearchForMediaIntent *v8;
  INSearchForMediaIntent *v9;
  objc_super v11;

  v6 = mediaItems;
  v7 = mediaSearch;
  v11.receiver = self;
  v11.super_class = (Class)INSearchForMediaIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INSearchForMediaIntent setMediaItems:](v8, "setMediaItems:", v6);
    -[INSearchForMediaIntent setMediaSearch:](v9, "setMediaSearch:", v7);
  }

  return v9;
}

- (NSArray)mediaItems
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToMediaSearch(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaSearch:", v5);
}

- (INPrivateSearchForMediaIntentData)privateSearchForMediaIntentData
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateSearchForMediaIntentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromPrivateSearchForMediaIntentData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPrivateSearchForMediaIntentData *)v4;
}

- (void)setPrivateSearchForMediaIntentData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToPrivateSearchForMediaIntentData(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPrivateSearchForMediaIntentData:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("mediaItems");
  -[INSearchForMediaIntent mediaItems](self, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("mediaSearch");
  v10[0] = v4;
  -[INSearchForMediaIntent mediaSearch](self, "mediaSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSearchForMediaIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("SearchForMedia");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

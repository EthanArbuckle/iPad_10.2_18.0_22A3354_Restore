@implementation INPlayAnnouncementSoundIntent

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

  -[INPlayAnnouncementSoundIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INPlayAnnouncementSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 2;
}

- (id)_categoryVerb
{
  return CFSTR("Play");
}

- (INPlayAnnouncementSoundIntent)initWithSoundType:(int64_t)a3
{
  INPlayAnnouncementSoundIntent *v4;
  INPlayAnnouncementSoundIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INPlayAnnouncementSoundIntent;
  v4 = -[INIntent init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[INPlayAnnouncementSoundIntent setSoundType:](v4, "setSoundType:", a3);
  return v5;
}

- (int64_t)soundType
{
  void *v3;
  int64_t v4;
  void *v5;

  -[INPlayAnnouncementSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v3, "hasSoundType");
  -[INPlayAnnouncementSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "soundType") == 1)
    v4 = v4;
  else
    v4 = 0;

  return v4;
}

- (void)setSoundType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INPlayAnnouncementSoundIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    objc_msgSend(v4, "setSoundType:", 1);
  else
    objc_msgSend(v4, "setHasSoundType:", 0);

}

- (id)_dictionaryRepresentation
{
  int64_t v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("soundType");
  v2 = -[INPlayAnnouncementSoundIntent soundType](self, "soundType");
  v3 = CFSTR("unknown");
  if (v2 == 1)
    v3 = CFSTR("announcementSent");
  v4 = v3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INPlayAnnouncementSoundIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("HomeCommunication");
}

- (id)verb
{
  return CFSTR("PlayAnnouncementSound");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation INSetAudioSourceInCarIntent

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

  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 16;
}

- (id)_categoryVerb
{
  return CFSTR("Set");
}

- (INSetAudioSourceInCarIntent)initWithAudioSource:(INCarAudioSource)audioSource relativeAudioSourceReference:(INRelativeReference)relativeAudioSourceReference
{
  INSetAudioSourceInCarIntent *v6;
  INSetAudioSourceInCarIntent *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INSetAudioSourceInCarIntent;
  v6 = -[INIntent init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[INSetAudioSourceInCarIntent setAudioSource:](v6, "setAudioSource:", audioSource);
    -[INSetAudioSourceInCarIntent setRelativeAudioSourceReference:](v7, "setRelativeAudioSourceReference:", relativeAudioSourceReference);
  }
  return v7;
}

- (INCarAudioSource)audioSource
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INCarAudioSource v7;
  INCarAudioSource v8;

  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAudioSource");
  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioSource") - 1;
  if (v6 <= 8)
    v7 = v6 + 1;
  else
    v7 = INCarAudioSourceUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INCarAudioSourceUnknown;

  return v8;
}

- (void)setAudioSource:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 8)
    objc_msgSend(v4, "setHasAudioSource:", 0);
  else
    objc_msgSend(v4, "setAudioSource:");

}

- (INRelativeReference)relativeAudioSourceReference
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INRelativeReference v8;

  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRelativeAudioSourceReference");
  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relativeAudioSourceReference");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = INRelativeReferenceUnknown;

  return v8;
}

- (void)setRelativeAudioSourceReference:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasRelativeAudioSourceReference:", 0);
  else
    objc_msgSend(v5, "setRelativeAudioSourceReference:", v4);

}

- (id)_dictionaryRepresentation
{
  INCarAudioSource v3;
  __CFString *v4;
  __CFString *v5;
  INRelativeReference v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("audioSource");
  v3 = -[INSetAudioSourceInCarIntent audioSource](self, "audioSource");
  if ((unint64_t)(v3 - 1) > 8)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E228A3D8[v3 - 1];
  v5 = v4;
  v11[1] = CFSTR("relativeAudioSourceReference");
  v12[0] = v5;
  v6 = -[INSetAudioSourceInCarIntent relativeAudioSourceReference](self, "relativeAudioSourceReference");
  v7 = CFSTR("unknown");
  if (v6 == INRelativeReferencePrevious)
    v7 = CFSTR("previous");
  if (v6 == INRelativeReferenceNext)
    v7 = CFSTR("next");
  v8 = v7;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetAudioSourceInCarIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("CarPlay");
}

- (id)verb
{
  return CFSTR("SetAudioSourceInCar");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

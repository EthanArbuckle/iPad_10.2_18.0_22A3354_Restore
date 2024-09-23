@implementation PHAssetPhotosSmartStyleExtendedProperties

- (PHAssetPhotosSmartStyleExtendedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHAssetPhotosSmartStyleExtendedProperties *v9;
  NSNumber *v10;
  NSNumber *smartStyleRenderingVersion;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *smartStyleIntensity;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *smartStyleToneBias;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *smartStyleColorBias;
  NSNumber *v21;
  NSNumber *v22;
  NSNumber *originalSmartStyleCast;
  NSNumber *v24;
  void *v25;
  PHAssetPhotosSmartStyleExtendedProperties *v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_8;
  v28.receiver = self;
  v28.super_class = (Class)PHAssetPhotosSmartStyleExtendedProperties;
  v9 = -[PHAssetPhotosSmartStyleExtendedProperties init](&v28, sel_init);
  self = v9;
  if (!v9)
    goto LABEL_8;
  objc_storeWeak((id *)&v9->super._asset, v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.sleetRenderingVersion"));
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  smartStyleRenderingVersion = self->_smartStyleRenderingVersion;
  self->_smartStyleRenderingVersion = v10;

  v12 = self->_smartStyleRenderingVersion;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.sleetIntensity"));
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  smartStyleIntensity = self->_smartStyleIntensity;
  self->_smartStyleIntensity = v13;

  v15 = self->_smartStyleIntensity;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.sleetToneBias"));
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  smartStyleToneBias = self->_smartStyleToneBias;
  self->_smartStyleToneBias = v16;

  v18 = self->_smartStyleToneBias;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.sleetColorBias"));
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  smartStyleColorBias = self->_smartStyleColorBias;
  self->_smartStyleColorBias = v19;

  v21 = self->_smartStyleColorBias;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedAttributes.sleetCast"));
  v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  originalSmartStyleCast = self->_originalSmartStyleCast;
  self->_originalSmartStyleCast = v22;

  v24 = self->_originalSmartStyleCast;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sleetIsReversible"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_smartStyleIsReversible = objc_msgSend(v25, "intValue");

  if (v12 || v15 || v18 || v21 || v24)
  {
    self = self;
    v26 = self;
  }
  else
  {
LABEL_8:
    v26 = 0;
  }

  return v26;
}

- (BOOL)isCurrentlySmartStyleable
{
  void *v3;
  BOOL v4;

  if (-[PHAssetPhotosSmartStyleExtendedProperties smartStyleIsReversible](self, "smartStyleIsReversible") != 1)
    return 0;
  -[PHAssetPropertySet asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "currentSmartStyleCast") > 0;

  return v4;
}

- (BOOL)originallySmartStyleable
{
  return -[PHAssetPhotosSmartStyleExtendedProperties smartStyleIsReversible](self, "smartStyleIsReversible") == 1;
}

- (NSNumber)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (NSNumber)smartStyleToneBias
{
  return self->_smartStyleToneBias;
}

- (NSNumber)smartStyleColorBias
{
  return self->_smartStyleColorBias;
}

- (NSNumber)smartStyleIntensity
{
  return self->_smartStyleIntensity;
}

- (NSNumber)originalSmartStyleCast
{
  return self->_originalSmartStyleCast;
}

- (unsigned)smartStyleIsReversible
{
  return self->_smartStyleIsReversible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalSmartStyleCast, 0);
  objc_storeStrong((id *)&self->_smartStyleIntensity, 0);
  objc_storeStrong((id *)&self->_smartStyleColorBias, 0);
  objc_storeStrong((id *)&self->_smartStyleToneBias, 0);
  objc_storeStrong((id *)&self->_smartStyleRenderingVersion, 0);
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetPhotosSmartStyleExtended");
}

+ (id)entityName
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_45;
}

void __62__PHAssetPhotosSmartStyleExtendedProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("extendedAttributes.sleetRenderingVersion");
  v3[1] = CFSTR("extendedAttributes.sleetIntensity");
  v3[2] = CFSTR("extendedAttributes.sleetToneBias");
  v3[3] = CFSTR("extendedAttributes.sleetColorBias");
  v3[4] = CFSTR("extendedAttributes.sleetCast");
  v3[5] = CFSTR("additionalAttributes.sleetIsReversible");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_45;
  propertiesToFetch_pl_once_object_45 = v1;

}

@end

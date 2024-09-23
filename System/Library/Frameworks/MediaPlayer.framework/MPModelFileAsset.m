@implementation MPModelFileAsset

+ (id)__traits_KEY
{
  return CFSTR("MPModelPropertyFileAssetTraits");
}

+ (id)__qualityType_KEY
{
  return CFSTR("MPModelPropertyFileAssetQualityType");
}

+ (id)__purchaseBundleFilePath_KEY
{
  return CFSTR("MPModelPropertyFileAssetPurchaseBundleFilePath");
}

+ (id)__protectionType_KEY
{
  return CFSTR("MPModelPropertyFileAssetProtectionType");
}

+ (id)__nonPurgeable_KEY
{
  return CFSTR("MPModelPropertyFileAssetNonPurgeable");
}

+ (id)__hlsKeyServerURL_KEY
{
  return CFSTR("MPModelPropertyFileAssetHLSKeyServerURL");
}

+ (id)__hlsKeyServerProtocol_KEY
{
  return CFSTR("MPModelPropertyFileAssetHLSKeyServerProtocol");
}

+ (id)__hlsKeyCertificateURL_KEY
{
  return CFSTR("MPModelPropertyFileAssetHLSKeyCertificateURL");
}

+ (id)__fileSize_KEY
{
  return CFSTR("MPModelPropertyFileAssetFileSize");
}

+ (id)__filePath_KEY
{
  return CFSTR("MPModelPropertyFileAssetFilePath");
}

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyFileAssetFilePath");
  v5[1] = CFSTR("MPModelPropertyFileAssetNonPurgeable");
  v5[2] = CFSTR("MPModelPropertyFileAssetQualityType");
  v5[3] = CFSTR("MPModelPropertyFileAssetProtectionType");
  v5[4] = CFSTR("MPModelPropertyFileAssetPurchaseBundleFilePath");
  v5[5] = CFSTR("MPModelPropertyFileAssetHLSKeyServerURL");
  v5[6] = CFSTR("MPModelPropertyFileAssetHLSKeyServerProtocol");
  v5[7] = CFSTR("MPModelPropertyFileAssetHLSKeyCertificateURL");
  v5[8] = CFSTR("MPModelPropertyFileAssetTraits");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)__MPModelPropertyFileAssetFilePath__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 28, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetFilePath"));

}

+ (void)__MPModelPropertyFileAssetFileSize__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 29, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetFileSize"));

}

+ (void)__MPModelPropertyFileAssetNonPurgeable__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetNonPurgeable"));

}

+ (void)__MPModelPropertyFileAssetProtectionType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetProtectionType"));

}

+ (void)__MPModelPropertyFileAssetPurchaseBundleFilePath__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 32, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetPurchaseBundleFilePath"));

}

+ (void)__MPModelPropertyFileAssetQualityType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 33, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetQualityType"));

}

+ (void)__MPModelPropertyFileAssetHLSKeyServerURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 34, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetHLSKeyServerURL"));

}

+ (void)__MPModelPropertyFileAssetHLSKeyServerProtocol__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 35, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetHLSKeyServerProtocol"));

}

+ (void)__MPModelPropertyFileAssetHLSKeyCertificateURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 36, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetHLSKeyCertificateURL"));

}

+ (void)__MPModelPropertyFileAssetTraits__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelFileAsset.m"), 37, CFSTR("Translator was missing mapping for MPModelPropertyFileAssetTraits"));

}

@end

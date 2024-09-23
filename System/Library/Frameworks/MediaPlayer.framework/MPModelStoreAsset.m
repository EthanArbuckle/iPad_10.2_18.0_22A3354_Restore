@implementation MPModelStoreAsset

+ (id)__subscriptionRequired_KEY
{
  return CFSTR("MPModelPropertyStoreAssetSubscriptionRequired");
}

+ (id)__shouldReportPlayEvents_KEY
{
  return CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents");
}

+ (id)__redownloadable_KEY
{
  return CFSTR("MPModelPropertyStoreAssetRedownloadable");
}

+ (id)__redownloadParameters_KEY
{
  return CFSTR("MPModelPropertyStoreAssetRedownloadParameters");
}

+ (id)__needsUserUpload_KEY
{
  return CFSTR("MPModelPropertyStoreAssetNeedsUserUpload");
}

+ (id)__endpointType_KEY
{
  return CFSTR("MPModelPropertyStoreAssetEndpointType");
}

+ (id)__accountIdentifier_KEY
{
  return CFSTR("MPModelPropertyStoreAssetAccountIdentifier");
}

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyStoreAssetEndpointType");
  v5[1] = CFSTR("MPModelPropertyStoreAssetRedownloadParameters");
  v5[2] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
  v5[3] = CFSTR("MPModelPropertyStoreAssetAccountIdentifier");
  v5[4] = CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents");
  v5[5] = CFSTR("MPModelPropertyStoreAssetSubscriptionRequired");
  v5[6] = MPModelPropertyStoreAssetNeedsUserUpload;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)__MPModelPropertyStoreAssetEndpointType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetEndpointType"));

}

+ (void)__MPModelPropertyStoreAssetRedownloadParameters__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 32, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetRedownloadParameters"));

}

+ (void)__MPModelPropertyStoreAssetRedownloadable__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 33, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetRedownloadable"));

}

+ (void)__MPModelPropertyStoreAssetAccountIdentifier__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 34, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetAccountIdentifier"));

}

+ (void)__MPModelPropertyStoreAssetShouldReportPlayEvents__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 35, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetShouldReportPlayEvents"));

}

+ (void)__MPModelPropertyStoreAssetSubscriptionRequired__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 36, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetSubscriptionRequired"));

}

+ (void)__MPModelPropertyStoreAssetNeedsUserUpload__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreAsset.m"), 37, CFSTR("Translator was missing mapping for MPModelPropertyStoreAssetNeedsUserUpload"));

}

@end

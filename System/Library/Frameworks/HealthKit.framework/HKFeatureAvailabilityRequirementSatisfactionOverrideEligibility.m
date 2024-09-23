@implementation HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility

- (BOOL)isRequirementOverridable:(id)a3 featureIdentifier:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("OxygenSaturationRecording")))
    goto LABEL_8;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ActiveWatchIsNotUnderInternalDevelopmentImportExclusion")) & 1) != 0)
  {
    v10 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("FeatureIsNotRemotelyDisabled")))
  {
LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v9, "importExclusionDeviceDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isActiveWatchProdFusedWithBehavior:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v13, "BOOLValue"))
    {
      objc_msgSend(v9, "importExclusionDeviceDataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "behavior");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "isImportAllowedForActiveWatchWithBehavior:featureIdentifier:", v15, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

LABEL_9:
  return v10;
}

@end

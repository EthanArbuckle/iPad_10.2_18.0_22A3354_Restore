@implementation HKObjectComparisonFilter

uint64_t __60___HKObjectComparisonFilter_areValidTypes_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ratingOfExertionAssociation")))
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", CFSTR("HKQuantityTypeIdentifierEstimatedWorkoutEffortScore")))
    {

    }
    else
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", CFSTR("HKQuantityTypeIdentifierWorkoutEffortScore"));

      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("unexpected data type %@"), v5);
        v9 = 0;
        goto LABEL_6;
      }
    }
  }
  v9 = 1;
LABEL_6:

  return v9;
}

uint64_t __55___HKObjectComparisonFilter__configureForKeyPathSource__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "_isLocalDevice"))
  {
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.private.health.localdevice"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __60___HKObjectComparisonFilter__acceptsDataObjectWithMetadata___block_invoke(uint64_t a1)
{
  void *v1;
  char isKindOfClass;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end

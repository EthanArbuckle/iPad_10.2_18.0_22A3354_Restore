@implementation NSObject(HKDataMetadataSampleExtensions)

- (uint64_t)hk_defaultDistanceQuantityType
{
  return objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C68]);
}

- (id)hk_localizedStringForAssociatedDistanceQuantity:()HKDataMetadataSampleExtensions displayTypeController:unitController:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "hk_defaultDistanceQuantityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayTypeForObjectType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unitForDisplayType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_numberFormatterForUnit:formattingContext:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "doubleValueForUnit:", v13);
  v17 = v16;

  objc_msgSend(v15, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromNumber:displayType:unitController:", v18, v12, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (uint64_t)hasAssociatedReport
{
  return 0;
}

- (uint64_t)fetchDetailedReportWithHealthStore:()HKDataMetadataSampleExtensions reportDataBlock:
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a4 + 16))(a4, 0, 0);
}

@end

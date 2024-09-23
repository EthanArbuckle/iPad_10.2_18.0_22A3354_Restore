@implementation NTPBTodayResultOperationFetchInfo(NTAdditions)

- (id)appConfigTreatmentID
{
  void *v2;

  if (objc_msgSend(a1, "hasAppConfigTreatmentIDInteger"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(a1, "appConfigTreatmentIDInteger"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)setAppConfigTreatmentID:()NTAdditions
{
  return objc_msgSend(a1, "setAppConfigTreatmentIDInteger:", objc_msgSend(a3, "integerValue"));
}

- (id)CTRByPersonalizationFeatureID
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "clickThroughRateByPersonalizationFeatureIDData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x24BDD1620];
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nf_securelyUnarchiveObjectOfClasses:withData:", v6, v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setCTRByPersonalizationFeatureID:()NTAdditions
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setClickThroughRateByPersonalizationFeatureIDData:", v4);

}

- (void)setLocale:()NTAdditions
{
  id v4;

  objc_msgSend(a3, "localeIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLocaleIdentifier:", v4);

}

- (id)locale
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", v1);
  else
    v2 = 0;

  return v2;
}

- (uint64_t)setUserSegmentationSegmentSetIDs:()NTAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __83__NTPBTodayResultOperationFetchInfo_NTAdditions__setUserSegmentationSegmentSetIDs___block_invoke;
  v4[3] = &unk_24DB5FEF8;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

- (uint64_t)setUserSegmentationTreatmentIDs:()NTAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __82__NTPBTodayResultOperationFetchInfo_NTAdditions__setUserSegmentationTreatmentIDs___block_invoke;
  v4[3] = &unk_24DB5FEF8;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

@end

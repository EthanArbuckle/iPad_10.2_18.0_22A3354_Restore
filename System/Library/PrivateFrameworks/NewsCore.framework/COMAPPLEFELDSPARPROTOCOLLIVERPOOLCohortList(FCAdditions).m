@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList(FCAdditions)

- (id)cohortWithPreferredType:()FCAdditions
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  int v12;

  objc_msgSend(a1, "cohorts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList_FCAdditions__cohortWithPreferredType___block_invoke;
  v11[3] = &__block_descriptor_36_e49_B16__0__COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohort_8l;
  v12 = a3;
  objc_msgSend(v5, "fc_firstObjectPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "cohorts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end

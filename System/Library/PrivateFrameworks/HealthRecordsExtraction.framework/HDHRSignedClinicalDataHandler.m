@implementation HDHRSignedClinicalDataHandler

- (id)preprocessDataInSource:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  HDHRSignedClinicalDataProcessor *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  -[HDHRSignedClinicalDataProcessor preprocessDataInSource:options:error:](v8, "preprocessDataInSource:options:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)preprocessFHIRResourceObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  HDHRSignedClinicalDataProcessor *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  -[HDHRSignedClinicalDataProcessor preprocessFHIRResourceObject:options:error:](v8, "preprocessFHIRResourceObject:options:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  HDHRSignedClinicalDataProcessor *v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  -[HDHRSignedClinicalDataProcessor processOriginalSignedClinicalDataRecords:options:completion:](v9, "processOriginalSignedClinicalDataRecords:options:completion:", v8, a4, v7);

}

- (void)processContextCollection:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  HDHRSignedClinicalDataProcessor *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  -[HDHRSignedClinicalDataProcessor processContextCollection:completion:](v7, "processContextCollection:completion:", v6, v5);

}

- (id)reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  HDHRSignedClinicalDataProcessor *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  -[HDHRSignedClinicalDataProcessor reprocessOriginalRecords:options:error:](v8, "reprocessOriginalRecords:options:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end

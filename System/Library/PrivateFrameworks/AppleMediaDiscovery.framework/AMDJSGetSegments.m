@implementation AMDJSGetSegments

+ (id)getAppSegments:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  id *v15;
  id location[3];
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14 = +[AMDWorkflow getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:](AMDWorkflow, "getCurrentWorkflowForDomain:andTreatmentId:andUseCaseId:error:", +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", CFSTR("apps")), 0, 0x1EA4BADA8, a4);
  if (*a4)
  {
    v17 = 0;
    v13 = 1;
  }
  else if (v14)
  {
    v12 = (id)objc_msgSend(v14, "first");
    v11 = +[AMDAppSegment getSegmentsInfoForTreatment:error:](AMDAppSegment, "getSegmentsInfoForTreatment:error:", v12, v15);
    if (*v15)
    {
      v17 = 0;
      v13 = 1;
    }
    else
    {
      v10 = (id)objc_msgSend(v11, "first");
      v9 = (id)objc_msgSend(v11, "second");
      v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

      v22[0] = CFSTR("segmentDataType");
      v23[0] = &unk_1EA4CEC38;
      v22[1] = CFSTR("segmentData");
      v23[1] = v10;
      v22[2] = CFSTR("metadata");
      v20 = CFSTR("metrics");
      v18[0] = CFSTR("algoId");
      v19[0] = v9;
      v18[1] = CFSTR("treatmentId");
      v19[1] = v12;
      v7 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v21 = v7;
      v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v23[2] = v6;
      v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);

      v13 = 1;
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v24[0] = CFSTR("segmentDataType");
    v25[0] = &unk_1EA4CEC38;
    v24[1] = CFSTR("segmentData");
    v25[1] = MEMORY[0x1E0C9AA70];
    v24[2] = CFSTR("metadata");
    v25[2] = &unk_1EA4D0C90;
    v17 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v13 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

@end

@implementation HKMedicationsTextExtractor

+ (id)extractedDocumentsFromRequestHandler:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDF9C78];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setMaximumCandidateCount:", 5);
  objc_msgSend(v7, "setUsesLanguageCorrection:", 1);
  objc_msgSend(v7, "setRecognitionLanguages:", &unk_24EC1D538);
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "performRequests:error:", v8, &v12);

  v9 = v12;
  if (v9)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    objc_msgSend(v7, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end

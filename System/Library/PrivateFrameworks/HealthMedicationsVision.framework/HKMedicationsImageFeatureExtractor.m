@implementation HKMedicationsImageFeatureExtractor

- (HKMedicationsImageFeatureExtractor)init
{
  HKMedicationsImageFeatureExtractor *v2;
  HKMedicationsTextNDCParser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicationsImageFeatureExtractor;
  v2 = -[HKMedicationsImageFeatureExtractor init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKMedicationsTextNDCParser);
    -[HKMedicationsImageFeatureExtractor setNdcParser:](v2, "setNdcParser:", v3);

  }
  return v2;
}

- (void)extractFeaturesFrom:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void (**v35)(id, void *, void *, id, id);
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35 = (void (**)(id, void *, void *, id, id))a4;
  v7 = objc_alloc(MEMORY[0x24BDF9C28]);
  v36 = v6;
  v8 = (void *)objc_msgSend(v7, "initWithCIImage:options:", v6, MEMORY[0x24BDBD1B8]);
  v9 = objc_alloc_init(MEMORY[0x24BDF9C78]);
  objc_msgSend(v9, "setMaximumCandidateCount:", 1);
  objc_msgSend(v9, "setUsesLanguageCorrection:", 1);
  objc_msgSend(v9, "setRecognitionLanguages:", &unk_24EC1D670);
  v10 = objc_alloc_init(MEMORY[0x24BDF9B50]);
  v11 = *MEMORY[0x24BDF9D90];
  v44[0] = *MEMORY[0x24BDF9D98];
  v44[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSymbologies:", v12);

  v43[0] = v9;
  v43[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v34 = v8;
  objc_msgSend(v8, "performRequests:error:", v13, &v41);
  v33 = v41;

  v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v9, "results");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HKTextBlockFromDocumentsClosestToPoint(2, v31, 0.5, 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getTranscript");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    objc_msgSend(v17, "getTranscript");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v20);

    -[HKMedicationsImageFeatureExtractor ndcParser](self, "ndcParser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getTranscript");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "parsedNDCCodeFromString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "length"))
      objc_msgSend(v15, "addObject:", v23);

  }
  v32 = v15;
  v24 = v14;
  objc_msgSend(v10, "results");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        +[HKMedicationsBarcodeNDCParser parsedNDCCodeFromBarcodeObservation:](HKMedicationsBarcodeNDCParser, "parsedNDCCodeFromBarcodeObservation:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "length"))
          objc_msgSend(v16, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v27);
  }
  v35[2](v35, v24, v32, v16, v33);

}

- (HKMedicationsTextNDCParser)ndcParser
{
  return self->_ndcParser;
}

- (void)setNdcParser:(id)a3
{
  objc_storeStrong((id *)&self->_ndcParser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ndcParser, 0);
}

@end

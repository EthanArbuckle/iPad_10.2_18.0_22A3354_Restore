@implementation NLModelTrainingDataSet

- (NLModelTrainingDataSet)initWithConfiguration:(id)a3 numberOfTrainingInstances:(unint64_t)a4 numberOfValidationInstances:(unint64_t)a5 trainingDataSource:(void *)a6 validationDataSource:(void *)a7 instanceDataProvider:(id)a8
{
  id v14;
  id v15;
  NLModelTrainingDataSet *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  int v27;
  double v28;
  void *v29;
  NLSplitDataProvider *v30;
  void *v31;
  NLPModelTrainingDataProvider *v32;
  uint64_t v33;
  NLDataProvider *modelTrainingDataProvider;
  NLSplitDataProvider *v35;
  void *v36;
  uint64_t v37;
  NLDataProvider *modelValidationDataProvider;
  NLPModelTrainingDataProvider *v39;
  NLPModelTrainingDataProvider *v40;
  NLPModelTrainingDataProvider *v42;
  NLPModelTrainingDataProvider *obj;
  objc_super v44;

  v14 = a3;
  v15 = a8;
  v44.receiver = self;
  v44.super_class = (Class)NLModelTrainingDataSet;
  v16 = -[NLDataSet initWithConfiguration:trainingDataURL:validationDataURL:testDataURL:](&v44, sel_initWithConfiguration_trainingDataURL_validationDataURL_testDataURL_, v14, 0, 0, 0);
  if (v16)
  {
    obj = -[NLPModelTrainingDataProvider initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:]([NLPModelTrainingDataProvider alloc], "initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:", v14, a4, a6, v15);
    v42 = -[NLPModelTrainingDataProvider initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:]([NLPModelTrainingDataProvider alloc], "initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:", v14, a5, a7, v15);
    -[NLDataSet configuration](v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = BOOLForKeyWithDefault(v18, CFSTR("UseCRF"));

    -[NLDataSet configuration](v16, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "options");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = BOOLForKeyWithDefault(v21, CFSTR("UseRNN"));

    -[NLDataSet configuration](v16, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = BOOLForKeyWithDefault(v24, CFSTR("UseTransfer"));

    if (a4 >= 0xA && !a5)
    {
      -[NLDataSet configuration](v16, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "type"))
        v27 = 1;
      else
        v27 = v19;
      if (v27 == 1)
      {

LABEL_10:
        v28 = dbl_1A36F7730[a4 > 0x63];
        if (a4 >> 5 > 0xC34)
          v28 = 0.05;
        splitIndexes(a4, v28, 0.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = [NLSplitDataProvider alloc];
        objc_msgSend(v29, "objectAtIndex:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = obj;
        v33 = -[NLSplitDataProvider initWithDataProvider:indexes:](v30, "initWithDataProvider:indexes:", obj, v31);
        modelTrainingDataProvider = v16->_modelTrainingDataProvider;
        v16->_modelTrainingDataProvider = (NLDataProvider *)v33;

        v35 = [NLSplitDataProvider alloc];
        objc_msgSend(v29, "objectAtIndex:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[NLSplitDataProvider initWithDataProvider:indexes:](v35, "initWithDataProvider:indexes:", obj, v36);
        modelValidationDataProvider = v16->_modelValidationDataProvider;
        v16->_modelValidationDataProvider = (NLDataProvider *)v37;

        v39 = v42;
        goto LABEL_14;
      }

      if (((v22 | v25) & 1) != 0)
        goto LABEL_10;
    }
    v32 = obj;
    objc_storeStrong((id *)&v16->_modelTrainingDataProvider, obj);
    v39 = v42;
    v40 = v42;
    v29 = v16->_modelValidationDataProvider;
    v16->_modelValidationDataProvider = &v40->super;
LABEL_14:

  }
  return v16;
}

- (id)dataProviderOfType:(int64_t)a3
{
  int *v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = &OBJC_IVAR___NLModelTrainingDataSet__modelValidationDataProvider;
  }
  else
  {
    v3 = &OBJC_IVAR___NLModelTrainingDataSet__modelTrainingDataProvider;
  }
  return *(id *)((char *)&self->super.super.isa + *v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelValidationDataProvider, 0);
  objc_storeStrong((id *)&self->_modelTrainingDataProvider, 0);
}

@end

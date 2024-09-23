@implementation MLPDataBatch

+ (id)dataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  __objc2_class *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  void *v29;
  uint64_t v31;

  v7 = a3;
  v8 = a5;
  objc_msgSend_objectForKeyedSubscript_(v7, v9, (uint64_t)MLPModelSampleDataFeatureValuesKey[0], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_length(v11, v12, v13, v14);

  if (v15)
  {
    v18 = MLPImageDataBatch;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v16, (uint64_t)MLPModelSampleDataBatchOfSequencesKey[0], v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      sub_19C09C77C(CFSTR("Unexpected data format"), v20, v21, v22, v23, v24, v25, v26, v31);
    v18 = MLPSeqDataBatch;
  }
  v27 = [v18 alloc];
  v29 = (void *)objc_msgSend_initWithDataBatch_batchSize_network_(v27, v28, (uint64_t)v7, a4, v8);

  return v29;
}

- (MLPDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("%@ not implemented in a subclass"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v9, v16, v10, (uint64_t)v15, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

@end

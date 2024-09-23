@implementation BMDSLJSONAllowedClasses

+ (Class)classFromString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[28];
  _QWORD v37[29];

  v37[28] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v36[0] = CFSTR("BMDSL");
  v37[0] = objc_opt_class();
  v36[1] = CFSTR("BMDSLArray");
  v37[1] = objc_opt_class();
  v36[2] = CFSTR("BMDSLCollect");
  v37[2] = objc_opt_class();
  v36[3] = CFSTR("BMDSLFilter");
  v37[3] = objc_opt_class();
  v36[4] = CFSTR("BMDSLInstanceTransform");
  v37[4] = objc_opt_class();
  v36[5] = CFSTR("BMDSLMap");
  v37[5] = objc_opt_class();
  v36[6] = CFSTR("BMDSLMerge");
  v37[6] = objc_opt_class();
  v36[7] = CFSTR("BMDSLOrderedMerge");
  v37[7] = objc_opt_class();
  v36[8] = CFSTR("BMDSLPersistentDerivatives");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v4 = (void *)getBMDSLPersistentDerivativesClass_softClass;
  v35 = getBMDSLPersistentDerivativesClass_softClass;
  if (!getBMDSLPersistentDerivativesClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLPersistentDerivativesClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLPersistentDerivativesClass_block_invoke((uint64_t)&v27);
    v4 = (void *)v33[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v32, 8);
  v37[8] = v5;
  v36[9] = CFSTR("BMDSLState");
  v37[9] = objc_opt_class();
  v36[10] = CFSTR("BMDSLStreamPublisher");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v6 = (void *)getBMDSLStreamPublisherClass_softClass;
  v35 = getBMDSLStreamPublisherClass_softClass;
  if (!getBMDSLStreamPublisherClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLStreamPublisherClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLStreamPublisherClass_block_invoke((uint64_t)&v27);
    v6 = (void *)v33[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v32, 8);
  v37[10] = v7;
  v36[11] = CFSTR("BMDSLTableMap");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v8 = (void *)getBMDSLTableMapClass_softClass;
  v35 = getBMDSLTableMapClass_softClass;
  if (!getBMDSLTableMapClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLTableMapClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLTableMapClass_block_invoke((uint64_t)&v27);
    v8 = (void *)v33[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v32, 8);
  v37[11] = v9;
  v36[12] = CFSTR("BMDSLTableStream");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v10 = (void *)getBMDSLTableStreamClass_softClass;
  v35 = getBMDSLTableStreamClass_softClass;
  if (!getBMDSLTableStreamClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLTableStreamClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLTableStreamClass_block_invoke((uint64_t)&v27);
    v10 = (void *)v33[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v32, 8);
  v37[12] = v11;
  v36[13] = CFSTR("BMDSLWindower");
  v37[13] = objc_opt_class();
  v36[14] = CFSTR("BMDSLAggregator");
  v37[14] = objc_opt_class();
  v36[15] = CFSTR("BMDSLTableAggregator");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v12 = (void *)getBMDSLTableAggregatorClass_softClass;
  v35 = getBMDSLTableAggregatorClass_softClass;
  if (!getBMDSLTableAggregatorClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLTableAggregatorClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLTableAggregatorClass_block_invoke((uint64_t)&v27);
    v12 = (void *)v33[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v32, 8);
  v37[15] = v13;
  v36[16] = CFSTR("BMDSLArgumentTransform");
  v37[16] = objc_opt_class();
  v36[17] = CFSTR("BMDSLClassTransform");
  v37[17] = objc_opt_class();
  v36[18] = CFSTR("BMDSLKeyPathRowTransform");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v14 = (void *)getBMDSLKeyPathRowTransformClass_softClass;
  v35 = getBMDSLKeyPathRowTransformClass_softClass;
  if (!getBMDSLKeyPathRowTransformClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLKeyPathRowTransformClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLKeyPathRowTransformClass_block_invoke((uint64_t)&v27);
    v14 = (void *)v33[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v32, 8);
  v37[18] = v15;
  v36[19] = CFSTR("BMDSLKeyPathSelector");
  v37[19] = objc_opt_class();
  v36[20] = CFSTR("BMDSLKeyPathTransform");
  v37[20] = objc_opt_class();
  v36[21] = CFSTR("BMDSLSubscriber");
  v37[21] = objc_opt_class();
  v36[22] = CFSTR("BMDSLTableUpsertSubscriber");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v16 = (void *)getBMDSLTableUpsertSubscriberClass_softClass;
  v35 = getBMDSLTableUpsertSubscriberClass_softClass;
  if (!getBMDSLTableUpsertSubscriberClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLTableUpsertSubscriberClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLTableUpsertSubscriberClass_block_invoke((uint64_t)&v27);
    v16 = (void *)v33[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v32, 8);
  v37[22] = v17;
  v36[23] = CFSTR("BMDSLTableSQLQueryTransform");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v18 = (void *)getBMDSLTableSQLQueryTransformClass_softClass;
  v35 = getBMDSLTableSQLQueryTransformClass_softClass;
  if (!getBMDSLTableSQLQueryTransformClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLTableSQLQueryTransformClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLTableSQLQueryTransformClass_block_invoke((uint64_t)&v27);
    v18 = (void *)v33[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v32, 8);
  v37[23] = v19;
  v36[24] = CFSTR("BMDSLTableTransform");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v20 = (void *)getBMDSLTableTransformClass_softClass;
  v35 = getBMDSLTableTransformClass_softClass;
  if (!getBMDSLTableTransformClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMDSLTableTransformClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMDSLTableTransformClass_block_invoke((uint64_t)&v27);
    v20 = (void *)v33[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v32, 8);
  v37[24] = v21;
  v36[25] = CFSTR("BMDSLWindowAssigner");
  v37[25] = objc_opt_class();
  v36[26] = CFSTR("BMDSLTumblingWindowAssigner");
  v37[26] = objc_opt_class();
  v36[27] = CFSTR("BMTableSchema");
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v22 = (void *)getBMTableSchemaClass_softClass;
  v35 = getBMTableSchemaClass_softClass;
  if (!getBMTableSchemaClass_softClass)
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __getBMTableSchemaClass_block_invoke;
    v30 = &unk_1E5E36518;
    v31 = &v32;
    __getBMTableSchemaClass_block_invoke((uint64_t)&v27);
    v22 = (void *)v33[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v32, 8);
  v37[27] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v25;
}

@end

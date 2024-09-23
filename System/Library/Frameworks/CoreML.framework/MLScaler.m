@implementation MLScaler

- (MLScaler)initWithShiftValue:(id)a3 scaleValue:(id)a4 description:(id)a5 configuration:(id)a6
{
  id v11;
  id v12;
  MLScaler *v13;
  MLScaler *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MLScaler;
  v13 = -[MLModelEngine initWithDescription:configuration:](&v16, sel_initWithDescription_configuration_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_shiftValue, a3);
    objc_storeStrong((id *)&v14->_scaleValue, a4);
  }

  return v14;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  unint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  MLMultiArray *v21;
  void *v22;
  uint64_t v23;
  MLMultiArray *v24;
  void *v25;
  double *v26;
  MLFeatureValue *shiftValue;
  uint64_t v28;
  MLFeatureValue *v29;
  double v30;
  double *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  MLDictionaryFeatureProvider *v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  id v47;
  double *v48;
  double *v49;
  uint64_t v50;
  double v51;
  MLFeatureValue *scaleValue;
  uint64_t v53;
  MLFeatureValue *v54;
  double v55;
  id v56;
  double *i;
  double v58;
  MLDictionaryFeatureProvider *v59;
  MLMultiArray *v61;
  id v62;
  id v63;
  _QWORD aBlock[6];
  void *v65;
  void *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v62 = a4;
  v8 = -[MLModelEngine signpostID](self, "signpostID");
  v9 = objc_msgSend(v62, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__MLScaler_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v8;
  aBlock[5] = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModelEngine modelDescription](self, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputFeatureNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelEngine modelDescription](self, "modelDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outputFeatureNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "featureValueForName:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "type");
  switch(v18)
  {
    case 1:
      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", (double)objc_msgSend(v17, "int64Value"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_shiftValue)
      {
        objc_msgSend(v33, "doubleValue");
        v35 = v34;
        -[MLFeatureValue doubleValue](self->_shiftValue, "doubleValue");
        +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", v35 + v36);
        v37 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v37;
      }
      else
      {
        v17 = v33;
      }
      if (!self->_scaleValue)
        goto LABEL_38;
      goto LABEL_21;
    case 2:
      if (self->_shiftValue)
      {
        objc_msgSend(v17, "doubleValue");
        v39 = v38;
        -[MLFeatureValue doubleValue](self->_shiftValue, "doubleValue");
        +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", v39 + v40);
        v41 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v41;
      }
      if (!self->_scaleValue)
        goto LABEL_38;
LABEL_21:
      objc_msgSend(v17, "doubleValue");
      v44 = v43;
      -[MLFeatureValue doubleValue](self->_scaleValue, "doubleValue");
      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", v44 * v45);
      v46 = objc_claimAutoreleasedReturnValue();
LABEL_37:

      v17 = (void *)v46;
LABEL_38:
      v59 = [MLDictionaryFeatureProvider alloc];
      v65 = v16;
      v66 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v24 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
      v42 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v59, "initWithDictionary:error:", v24, a5);
      goto LABEL_39;
    case 5:
      objc_msgSend(v17, "multiArrayValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v21 = [MLMultiArray alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[MLMultiArray initWithShape:dataType:error:](v21, "initWithShape:dataType:error:", v23, 65600, a5);

      objc_msgSend(v17, "multiArrayValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = objc_msgSend(v25, "copyIntoMultiArray:error:", v24, a5);

      if ((v23 & 1) == 0)
      {
        v42 = 0;
LABEL_39:

        goto LABEL_40;
      }
      v61 = objc_retainAutorelease(v24);
      v26 = -[MLMultiArray mutableBytes](v61, "mutableBytes");
      shiftValue = self->_shiftValue;
      if (shiftValue)
      {
        v28 = -[MLFeatureValue type](shiftValue, "type");
        v29 = self->_shiftValue;
        if (v28 == 2)
        {
          -[MLFeatureValue doubleValue](v29, "doubleValue");
          if (v20)
          {
            v31 = v26;
            v32 = v20;
            do
            {
              *v31 = v30 + *v31;
              ++v31;
              --v32;
            }
            while (v32);
          }
        }
        else if (-[MLFeatureValue type](v29, "type") == MLFeatureTypeMultiArray)
        {
          -[MLFeatureValue multiArrayValue](self->_shiftValue, "multiArrayValue");
          v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v48 = (double *)objc_msgSend(v47, "bytes");
          if (v20)
          {
            v49 = v26;
            v50 = v20;
            do
            {
              v51 = *v48++;
              *v49 = v51 + *v49;
              ++v49;
              --v50;
            }
            while (v50);
          }

        }
      }
      scaleValue = self->_scaleValue;
      if (scaleValue)
      {
        v53 = -[MLFeatureValue type](scaleValue, "type");
        v54 = self->_scaleValue;
        if (v53 == 2)
        {
          -[MLFeatureValue doubleValue](v54, "doubleValue");
          for (; v20; --v20)
          {
            *v26 = v55 * *v26;
            ++v26;
          }
        }
        else if (-[MLFeatureValue type](v54, "type") == MLFeatureTypeMultiArray)
        {
          -[MLFeatureValue multiArrayValue](self->_scaleValue, "multiArrayValue");
          v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          for (i = (double *)objc_msgSend(v56, "bytes"); v20; --v20)
          {
            v58 = *i++;
            *v26 = v58 * *v26;
            ++v26;
          }

        }
      }
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v61);
      v46 = objc_claimAutoreleasedReturnValue();

      v17 = v61;
      goto LABEL_37;
  }
  v42 = 0;
LABEL_40:

  v10[2](v10);
  return v42;
}

- (unint64_t)predictionTypeForKTrace
{
  return 19;
}

- (MLFeatureValue)shiftValue
{
  return self->_shiftValue;
}

- (MLFeatureValue)scaleValue
{
  return self->_scaleValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleValue, 0);
  objc_storeStrong((id *)&self->_shiftValue, 0);
}

uint64_t __49__MLScaler_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  CoreML::Specification::protobuf_Scaler_2eproto *v6;
  CoreML::Specification::protobuf_Scaler_2eproto *v7;
  uint64_t *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  MLScaler *v25;
  void (**v27)(CoreML::Specification::Scaler *__hidden);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;

  v6 = (CoreML::Specification::protobuf_Scaler_2eproto *)a4;
  v7 = v6;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 604)
  {
    v8 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_Scaler_2eproto::InitDefaults(v6);
    v8 = &CoreML::Specification::_Scaler_default_instance_;
  }
  v29 = 0;
  v30 = 0;
  v27 = &off_1E3D57C00;
  v28 = 0;
  v9 = *((_DWORD *)v8 + 4);
  if (v9)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v29, v9);
    memcpy((void *)(v30 + 8), (const void *)(v8[3] + 8), 8 * *((int *)v8 + 4));
    LODWORD(v29) = *((_DWORD *)v8 + 4);
  }
  v31 = 0;
  v32 = 0;
  v10 = *((_DWORD *)v8 + 10);
  if (v10)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v31, v10);
    memcpy((void *)(v32 + 8), (const void *)(v8[6] + 8), 8 * *((int *)v8 + 10));
    LODWORD(v31) = *((_DWORD *)v8 + 10);
  }
  v33 = 0;
  v11 = v8[1];
  if ((v11 & 1) != 0)
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v28, v11 & 0xFFFFFFFFFFFFFFFELL);
  if ((_DWORD)v29)
  {
    if ((_DWORD)v29 == 1)
    {
      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", *(double *)(v30 + 8), v27, v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (int)v29;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v29, v27, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v30 + (v15 >> 29) + 8));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

        v15 += 0x100000000;
        --v13;
      }
      while (v13);
      +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = 0;
  }
  if ((_DWORD)v31)
  {
    if ((_DWORD)v31 == 1)
    {
      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", *(double *)(v32 + 8));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (int)v31;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v32 + (v21 >> 29) + 8), v27, v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v22);

        v21 += 0x100000000;
        --v19;
      }
      while (v19);
      +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v18 = 0;
  }
  v24 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v25 = -[MLScaler initWithShiftValue:scaleValue:description:configuration:]([MLScaler alloc], "initWithShiftValue:scaleValue:description:configuration:", v12, v18, v24, v7);

  CoreML::Specification::Scaler::~Scaler((CoreML::Specification::Scaler *)&v27);
  return v25;
}

@end

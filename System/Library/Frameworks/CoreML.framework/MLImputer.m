@implementation MLImputer

- (MLImputer)initWith:(id)a3 imputeValue:(id)a4 replaceValue:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MLModelDescription *v22;
  MLImputer *v23;
  id *p_isa;
  id *p_imputeValue;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  MLImputer *v36;
  id v38;
  id v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v38 = a4;
  v39 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v41 = v18;
  v40 = v19;
  v22 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:]([MLModelDescription alloc], "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:trainingInputDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:", v17, v18, 0, 0, 0, v19, v20, 0);
  v42.receiver = self;
  v42.super_class = (Class)MLImputer;
  v23 = -[MLModelEngine initWithDescription:configuration:](&v42, sel_initWithDescription_configuration_, v22, v21);
  p_isa = (id *)&v23->super.super.isa;
  if (!v23)
    goto LABEL_21;
  p_imputeValue = (id *)&v23->_imputeValue;
  objc_storeStrong((id *)&v23->_imputeValue, a4);
  v26 = p_isa + 5;
  objc_storeStrong(p_isa + 5, a5);
  if (*p_imputeValue)
  {
    v27 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*p_imputeValue, "type"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*p_imputeValue, "type") == 2 || objc_msgSend(*p_imputeValue, "type") == 1)
      objc_msgSend(v30, "addObject:", &unk_1E3DA2500);
    objc_msgSend(v17, "allValues");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v31, v30, 1, 1, CFSTR("MLImputer Input"), a11);

    if (!v32)
      goto LABEL_24;
    objc_msgSend(v41, "allValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v33, v30, 1, 1, CFSTR("MLImputer Output"), a11);

    if (!v34)
      goto LABEL_24;
    if (*v26)
    {
      v35 = objc_msgSend(*v26, "type");
      if (v35 == 1)
      {
        if (objc_msgSend(*p_imputeValue, "type") != 1)
        {
LABEL_19:
          if (objc_msgSend(*p_imputeValue, "type") != 5)
            goto LABEL_22;
        }
      }
      else
      {
        if (v35 != 2)
        {
          if (v35 != 3 || objc_msgSend(*p_imputeValue, "type") != 3)
          {
LABEL_22:
            if (a11)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid combination of replace value type and input/output/feature value types."));
              *a11 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_24:

            goto LABEL_25;
          }
          goto LABEL_20;
        }
        if (objc_msgSend(*p_imputeValue, "type") != 2)
          goto LABEL_19;
      }
    }
LABEL_20:

LABEL_21:
    v36 = p_isa;
    goto LABEL_26;
  }
  if (!a11)
  {
LABEL_25:
    v36 = 0;
    goto LABEL_26;
  }
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("imputed feature value not set."));
  v36 = 0;
  *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v36;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MLFeatureValue *v18;
  MLFeatureValue *v19;
  MLFeatureValue *v20;
  void *v21;
  MLDictionaryFeatureProvider *v22;
  MLDictionaryFeatureProvider *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  double v31;
  MLFeatureType v32;
  MLFeatureValue *replaceValue;
  double v34;
  double v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  void *v41;
  float v42;
  double v43;
  MLMultiArray *v44;
  void *v45;
  void *v46;
  MLMultiArray *v47;
  char v48;
  uint64_t i;
  double v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  double v56;
  float v57;
  void *v58;
  void *v59;
  uint64_t v60;
  MLMultiArray *v61;
  char v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v67;
  _QWORD aBlock[7];
  void *v69;
  MLFeatureValue *v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v7 = a4;
  v8 = -[MLImputer predictionTypeForKTrace](self, "predictionTypeForKTrace");
  v9 = -[MLModelEngine signpostID](self, "signpostID");
  v10 = objc_msgSend(v7, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__MLImputer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[6] = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[MLModelEngine modelDescription](self, "modelDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputFeatureNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLModelEngine modelDescription](self, "modelDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outputFeatureNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v67, "featureValueForName:", v14);
  v18 = (MLFeatureValue *)(id)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && !-[MLFeatureValue isUndefined](v18, "isUndefined"))
  {
    v20 = v19;
    if (!self->_replaceValue)
      goto LABEL_5;
    v20 = v19;
    switch(-[MLFeatureValue type](self->_imputeValue, "type"))
    {
      case MLFeatureTypeInt64:
        v25 = -[MLFeatureValue int64Value](v19, "int64Value");
        v20 = v19;
        if (v25 == -[MLFeatureValue int64Value](self->_replaceValue, "int64Value"))
          goto LABEL_3;
        goto LABEL_5;
      case MLFeatureTypeDouble:
        -[MLFeatureValue doubleValue](self->_replaceValue, "doubleValue");
        -[MLFeatureValue doubleValue](v19, "doubleValue");
        v30 = v29;
        -[MLFeatureValue doubleValue](self->_replaceValue, "doubleValue");
        v20 = v19;
        if (v30 == v31)
          goto LABEL_3;
        goto LABEL_5;
      case MLFeatureTypeString:
        -[MLFeatureValue stringValue](v19, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLFeatureValue stringValue](self->_replaceValue, "stringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToString:", v27);

        v20 = v19;
        if (v28)
          goto LABEL_3;
        goto LABEL_5;
      case MLFeatureTypeMultiArray:
        v32 = -[MLFeatureValue type](self->_replaceValue, "type");
        replaceValue = self->_replaceValue;
        if (v32 == MLFeatureTypeDouble)
        {
          -[MLFeatureValue doubleValue](replaceValue, "doubleValue");
          v35 = v34;
        }
        else
        {
          v20 = v19;
          if (-[MLFeatureValue type](replaceValue, "type") != MLFeatureTypeInt64)
            goto LABEL_5;
          v35 = (double)-[MLFeatureValue int64Value](self->_replaceValue, "int64Value");
        }
        -[MLFeatureValue multiArrayValue](v19, "multiArrayValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v21, "count");
        if (objc_msgSend(v21, "dataType") == 65600 && objc_msgSend(v21, "isContiguous"))
        {
          v36 = (double *)objc_msgSend(objc_retainAutorelease(v21), "bytes");
          v37 = v65;
          if (v65 < 1)
            goto LABEL_52;
          while (v35 != *v36)
          {
            ++v36;
            if (!--v37)
              goto LABEL_52;
          }
LABEL_42:
          v44 = [MLMultiArray alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = v45;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[MLMultiArray initWithShape:dataType:error:](v44, "initWithShape:dataType:error:", v46, objc_msgSend(v21, "dataType"), a5);

          v47 = v61;
          if (!v61 || (v48 = objc_msgSend(v21, "copyIntoMultiArray:error:", v61, a5), v47 = v61, (v48 & 1) == 0))
          {

            v23 = 0;
            v20 = v19;
            goto LABEL_6;
          }
          if (objc_msgSend(v21, "dataType", v61) == 65600 && objc_msgSend(v21, "isContiguous"))
          {
            v63 = objc_msgSend(objc_retainAutorelease(v21), "bytes");
            v60 = -[MLMultiArray mutableBytes](objc_retainAutorelease(v61), "mutableBytes");
            for (i = 0; i != v65; ++i)
            {
              v50 = *(double *)(v63 + 8 * i);
              if (v35 == v50)
              {
                -[MLFeatureValue multiArrayValue](self->_imputeValue, "multiArrayValue");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectAtIndexedSubscript:", i);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "doubleValue");
                *(_QWORD *)(v60 + 8 * i) = v53;

              }
              else
              {
                *(double *)(v60 + 8 * i) = v50;
              }
            }
          }
          else
          {
            for (j = 0; j != v65; ++j)
            {
              objc_msgSend(v21, "objectAtIndexedSubscript:", j);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v21, "dataType");
              v56 = 0.0;
              if (v55 > 65599)
              {
                if (v55 == 65600)
                {
                  objc_msgSend(v64, "doubleValue", 0.0);
                }
                else if (v55 == 131104)
                {
                  v56 = (double)objc_msgSend(v64, "integerValue", 0.0);
                }
              }
              else if (v55 == 65552 || v55 == 65568)
              {
                objc_msgSend(v64, "floatValue", 0.0);
                v56 = v57;
              }
              if (v35 == v56)
              {
                -[MLFeatureValue multiArrayValue](self->_imputeValue, "multiArrayValue");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "objectAtIndexedSubscript:", j);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[MLMultiArray setObject:atIndexedSubscript:](v61, "setObject:atIndexedSubscript:", v59, j);

              }
            }
          }
          +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v61);
          v20 = (MLFeatureValue *)objc_claimAutoreleasedReturnValue();

          goto LABEL_4;
        }
        if (v65 < 1)
          goto LABEL_52;
        v38 = 0;
        v62 = 0;
        break;
      default:
        goto LABEL_5;
    }
    while (1)
    {
      v39 = objc_msgSend(v21, "dataType");
      v40 = 0.0;
      if (v39 <= 65599)
      {
        if (v39 != 65552 && v39 != 65568)
          goto LABEL_36;
        objc_msgSend(v21, "objectAtIndexedSubscript:", v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        v40 = v42;
        goto LABEL_35;
      }
      if (v39 == 65600)
        break;
      if (v39 == 131104)
      {
        objc_msgSend(v21, "objectAtIndexedSubscript:", v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (double)objc_msgSend(v41, "integerValue");
LABEL_35:

      }
LABEL_36:
      if (v35 == v40)
      {
        ++v38;
        v62 = 1;
        if (v38 == v65)
          goto LABEL_42;
      }
      else if (v65 == ++v38)
      {
        if ((v62 & 1) != 0)
          goto LABEL_42;
LABEL_52:
        v20 = v19;
        goto LABEL_4;
      }
    }
    objc_msgSend(v21, "objectAtIndexedSubscript:", v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v40 = v43;
    goto LABEL_35;
  }
LABEL_3:
  v20 = self->_imputeValue;
  v21 = v19;
LABEL_4:

LABEL_5:
  v22 = [MLDictionaryFeatureProvider alloc];
  v69 = v17;
  v70 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v22, "initWithDictionary:error:", v21, a5);
LABEL_6:

  v11[2](v11);
  return v23;
}

- (unint64_t)predictionTypeForKTrace
{
  return 13;
}

- (MLFeatureValue)imputeValue
{
  return self->_imputeValue;
}

- (MLFeatureValue)replaceValue
{
  return self->_replaceValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceValue, 0);
  objc_storeStrong((id *)&self->_imputeValue, 0);
}

uint64_t __50__MLImputer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  CoreML::Specification::protobuf_Imputer_2eproto *inited;
  uint64_t *v8;
  MLImputer *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  __int128 *v19;
  id *v20;
  uint64_t *v21;
  uint64_t *v22;
  int **v23;
  int **v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 *v36;
  __int128 v37;
  void *v38;
  std::string *v39;
  void *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  std::string *v46;
  void *v47;
  uint64_t *v48;
  int v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  __int128 *v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  std::string *v59;
  void *v60;
  id v61;
  MLImputer *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  MLImputer *v76;
  CoreML::Specification::protobuf_Imputer_2eproto *v77;
  std::string v78;
  std::string v79;

  inited = (CoreML::Specification::protobuf_Imputer_2eproto *)a4;
  v77 = inited;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
  {
    v8 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
    v8 = &CoreML::Specification::_Imputer_default_instance_;
  }
  v9 = 0;
  switch(*((_DWORD *)v8 + 9))
  {
    case 0:
      goto LABEL_120;
    case 1:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v10 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v10 = &CoreML::Specification::_Imputer_default_instance_;
      }
      v17 = 0.0;
      if (*((_DWORD *)v10 + 9) == 1)
        v17 = *((double *)v10 + 2);
      +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", v17);
      inited = (CoreML::Specification::protobuf_Imputer_2eproto *)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    case 2:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v11 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v11 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v11 + 9) == 2)
        v18 = v11[2];
      else
        v18 = 0;
      +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", v18);
      inited = (CoreML::Specification::protobuf_Imputer_2eproto *)objc_claimAutoreleasedReturnValue();
LABEL_43:
      v9 = (MLImputer *)inited;
      goto LABEL_84;
    case 3:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v12 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v12 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v12 + 9) == 3)
        v19 = (__int128 *)v12[2];
      else
        v19 = &google::protobuf::internal::fixed_address_empty_string;
      if (*((char *)v19 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)v19, *((_QWORD *)v19 + 1));
      }
      else
      {
        v25 = *v19;
        v79.__r_.__value_.__r.__words[2] = *((_QWORD *)v19 + 2);
        *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v25;
      }
      if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v46 = &v79;
      else
        v46 = (std::string *)v79.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v47);
      v9 = (MLImputer *)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v79.__r_.__value_.__l.__data_);
      goto LABEL_84;
    case 4:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v13 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v13 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v13 + 9) == 4)
      {
        v20 = a5;
        v21 = (uint64_t *)v13[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v20 = a5;
        v21 = &CoreML::Specification::_DoubleVector_default_instance_;
      }
      v26 = *((int *)v21 + 4);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v26)
      {
        v28 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v21[3] + (v28 >> 29) + 8));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v29);

          v28 += 0x100000000;
          --v26;
        }
        while (v26);
      }
      goto LABEL_57;
    case 5:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v14 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v14 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v14 + 9) == 5)
      {
        v22 = (uint64_t *)v14[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v22 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      v20 = a5;
      v30 = *((int *)v22 + 4);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!(_DWORD)v30)
        goto LABEL_57;
      v31 = 0;
      break;
    case 6:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v15 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v15 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v15 + 9) == 6)
      {
        v23 = (int **)v15[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v23 = (int **)&CoreML::Specification::_StringToDoubleMap_default_instance_;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *v23[5]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(&v79, v23[5]);
      while (v79.__r_.__value_.__r.__words[0])
      {
        v36 = *(__int128 **)(v79.__r_.__value_.__r.__words[0] + 24);
        if (*((char *)v36 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v78, *(const std::string::value_type **)v36, *((_QWORD *)v36 + 1));
        }
        else
        {
          v37 = *v36;
          v78.__r_.__value_.__r.__words[2] = *((_QWORD *)v36 + 2);
          *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v37;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v36 + 3));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v39 = &v78;
        else
          v39 = (std::string *)v78.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v38, v40);

        if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v78.__r_.__value_.__l.__data_);
        google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++((unsigned __int8 **)&v79);
      }
      +[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v35, a5);
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_76;
    case 7:
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v16 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v16 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v16 + 9) == 7)
      {
        v24 = (int **)v16[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v24 = (int **)&CoreML::Specification::_Int64ToDoubleMap_default_instance_;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *v24[5]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(&v79, v24[5]);
      while (v79.__r_.__value_.__r.__words[0])
      {
        v42 = *(uint64_t **)(v79.__r_.__value_.__r.__words[0] + 8);
        v43 = *v42;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v42 + 1));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v44, v45);

        google::protobuf::Map<long long,double>::InnerMap::iterator_base<google::protobuf::Map<long long,double>::KeyValuePair const>::operator++((uint64_t **)&v79);
      }
      +[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v35, a5);
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_76:
      v9 = (MLImputer *)v41;

      if (!v9)
        goto LABEL_120;
      goto LABEL_84;
    default:
      goto LABEL_84;
  }
  while (1)
  {
    v32 = *(_QWORD *)(v22[3] + (v31 >> 29) + 8);
    if (v32 != (uint64_t)(double)v32)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v33);

    v31 += 0x100000000;
    if (!--v30)
    {
LABEL_57:
      +[MLMultiArray doubleVectorWithValues:](MLMultiArray, "doubleVectorWithValues:", v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v34);
      v9 = (MLImputer *)objc_claimAutoreleasedReturnValue();
      a5 = v20;

LABEL_84:
      v76 = v9;
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
      {
        v48 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v48 = &CoreML::Specification::_Imputer_default_instance_;
      }
      v49 = *((_DWORD *)v48 + 10);
      if (v49 == 11)
      {
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
        {
          v51 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
          v51 = &CoreML::Specification::_Imputer_default_instance_;
        }
        v55 = 0.0;
        if (*((_DWORD *)v51 + 10) == 11)
          v55 = *((double *)v51 + 3);
        +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:", v55);
        v56 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v49 != 12)
        {
          if (v49 == 13)
          {
            if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
            {
              v50 = *(uint64_t **)(*(_QWORD *)a3 + 32);
            }
            else
            {
              CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
              v50 = &CoreML::Specification::_Imputer_default_instance_;
            }
            if (*((_DWORD *)v50 + 10) == 13)
              v54 = (__int128 *)v50[3];
            else
              v54 = &google::protobuf::internal::fixed_address_empty_string;
            if (*((char *)v54 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)v54, *((_QWORD *)v54 + 1));
            }
            else
            {
              v58 = *v54;
              v79.__r_.__value_.__r.__words[2] = *((_QWORD *)v54 + 2);
              *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v58;
            }
            if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v59 = &v79;
            else
              v59 = (std::string *)v79.__r_.__value_.__r.__words[0];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v60);
            v53 = objc_claimAutoreleasedReturnValue();

            if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v79.__r_.__value_.__l.__data_);
          }
          else
          {
            v53 = 0;
          }
          goto LABEL_119;
        }
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 601)
        {
          v52 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
          v52 = &CoreML::Specification::_Imputer_default_instance_;
        }
        if (*((_DWORD *)v52 + 10) == 12)
          v57 = v52[3];
        else
          v57 = 0;
        +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", v57);
        v56 = objc_claimAutoreleasedReturnValue();
      }
      v53 = v56;
LABEL_119:
      v61 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
      v75 = (void *)v53;
      v62 = [MLImputer alloc];
      objc_msgSend(v61, "inputDescriptionsByName");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "outputDescriptionsByName");
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)MEMORY[0x1E0C99E40];
      v73 = (void *)v63;
      objc_msgSend(v61, "inputDescriptionsByName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "allKeys");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "orderedSetWithArray:", v71);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v61, "outputDescriptionsByName");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "allKeys");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "orderedSetWithArray:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MLImputer initWith:imputeValue:replaceValue:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:](v62, "initWith:imputeValue:replaceValue:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:", CFSTR("imputer"), v76, v75, v74, v73, v65, v69, v77, a5);

      goto LABEL_120;
    }
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Only integer values with magnitude less than 2^48 are supported in the imputer."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v9 = 0;
LABEL_120:

  return v9;
}

+ (id)imputeValueFrom:(id)a3 replaceValue:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MLImputer *v20;
  MLModelConfiguration *v21;
  MLImputer *v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = [MLImputer alloc];
  v21 = objc_alloc_init(MLModelConfiguration);
  v22 = -[MLImputer initWith:imputeValue:replaceValue:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:](v20, "initWith:imputeValue:replaceValue:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:", CFSTR("MLimputer"), v14, v15, v16, v17, v18, v19, v21, a9);

  return v22;
}

+ (id)imputeValueFrom:(id)a3 replaceValue:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MLImputer *v22;
  MLModelConfiguration *v23;
  MLImputer *v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = [MLImputer alloc];
  v23 = objc_alloc_init(MLModelConfiguration);
  v24 = -[MLImputer initWith:imputeValue:replaceValue:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:](v22, "initWith:imputeValue:replaceValue:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:error:", v17, v15, v16, v18, v19, v20, v21, v23, a10);

  return v24;
}

@end

@implementation MLFeatureVectorizer

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  MLMultiArray *v10;
  MLFeatureVectorizer *v11;
  char *begin;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double *v19;
  double v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  unint64_t v30;
  double v31;
  MLDictionaryFeatureProvider *v32;
  void *v33;
  void *v34;
  void *v35;
  MLDictionaryFeatureProvider *v36;
  void *v37;
  void *v38;
  MLMultiArray *v40;
  MLMultiArray *v41;
  id v42;
  void (**v43)(_QWORD);
  uint64_t v44;
  vector<std::pair<unsigned long, unsigned long>, std::allocator<std::pair<unsigned long, unsigned long>>> *p_index_mapping;
  id v47;
  MLFeatureVectorizer *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD aBlock[7];
  void *v54;
  MLMultiArray *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v42 = a4;
  v7 = -[MLFeatureVectorizer predictionTypeForKTrace](self, "predictionTypeForKTrace");
  v8 = -[MLModelEngine signpostID](self, "signpostID");
  v9 = objc_msgSend(v42, "parentSignpostID");
  v48 = self;
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MLFeatureVectorizer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v7;
  aBlock[5] = v8;
  aBlock[6] = v9;
  v43 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = -[MLMultiArray initWithShape:dataType:error:]([MLMultiArray alloc], "initWithShape:dataType:error:", self->_output_array_shape, 65600, a5);
  if (v10)
  {
    v40 = v10;
    v41 = objc_retainAutorelease(v10);
    v44 = -[MLMultiArray mutableBytes](v41, "mutableBytes");
    v11 = self;
    p_index_mapping = &self->index_mapping;
    begin = (char *)self->index_mapping.__begin_;
    if (self->index_mapping.__end_ == begin)
      goto LABEL_25;
    v13 = 0;
    while (1)
    {
      v14 = &begin[16 * v13];
      v15 = *(_QWORD *)v14;
      v16 = *((_QWORD *)v14 + 1);
      -[NSArray objectAtIndexedSubscript:](v11->_columnNameEncoding, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "featureValueForName:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      v19 = (double *)(v44 + 8 * v15);
      switch(objc_msgSend(v18, "type"))
      {
        case 0:
        case 3:
        case 4:
        case 7:
        case 8:
          if (!a5)
            goto LABEL_41;
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MLFeatureVectorizer: Incorrect Type."));
          v36 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        case 1:
          v20 = (double)objc_msgSend(v18, "int64Value");
          goto LABEL_8;
        case 2:
          objc_msgSend(v18, "doubleValue");
LABEL_8:
          *v19 = v20;
          goto LABEL_24;
        case 5:
          objc_msgSend(v18, "multiArrayValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "count") == v16)
          {
            v22 = -[MLMultiArray setRangeWithRawData:destIndex:error:](v41, "setRangeWithRawData:destIndex:error:", v21, *((_QWORD *)p_index_mapping->__begin_ + 2 * v13), a5);

            if (v22)
              goto LABEL_24;
          }
          else
          {
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MLFeatureVectorizer: Array length incorrect."));
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

          }
          goto LABEL_41;
        case 6:
          objc_msgSend(v18, "dictionaryValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 >= 1)
            bzero(v19, 8 * (v16 - ((v16 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          if (!v25)
            goto LABEL_23;
          v26 = *(_QWORD *)v50;
          break;
        default:
          goto LABEL_24;
      }
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MLFeatureVectorizer: Dictionary key type must be NSNumber."));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_31;
            }
LABEL_32:

            goto LABEL_41;
          }
          v30 = objc_msgSend(v28, "unsignedIntegerValue");
          if (v30 >= v16)
          {
            if (a5)
            {
              +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("MLFeatureVectorizer: Dictionary index out of range."));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
              *a5 = v37;
            }
            goto LABEL_32;
          }
          objc_msgSend(v29, "doubleValue");
          v19[v30] = v31;

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        if (v25)
          continue;
        break;
      }
LABEL_23:

LABEL_24:
      ++v13;
      begin = (char *)p_index_mapping->__begin_;
      v11 = v48;
      if (v13 >= ((char *)p_index_mapping->__end_ - (char *)p_index_mapping->__begin_) >> 4)
      {
LABEL_25:
        v32 = [MLDictionaryFeatureProvider alloc];
        -[MLModelEngine modelDescription](v11, "modelDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "outputFeatureNames");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v34;
        v55 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v32, "initWithDictionary:error:", v35, a5);

        goto LABEL_42;
      }
    }
    if (a5)
    {
      -[NSArray objectAtIndexedSubscript:](v48->_columnNameEncoding, "objectAtIndexedSubscript:", v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Expected value for feature '%@'."), v38);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
LABEL_41:
    v36 = 0;
LABEL_42:

    v10 = v40;
  }
  else
  {
    v36 = 0;
  }

  v43[2](v43);
  return v36;
}

uint64_t __60__MLFeatureVectorizer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLFeatureVectorizer)initWith:(id)a3 dimensionEncoding:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  MLFeatureVectorizer *v25;
  MLFeatureVectorizer *v26;
  id *p_dimensionEncoding;
  void *v28;
  BOOL v29;
  void *v30;
  BOOL v31;
  unint64_t v32;
  vector<std::pair<unsigned long, unsigned long>, std::allocator<std::pair<unsigned long, unsigned long>>> *p_index_mapping;
  _BYTE *begin;
  char *end;
  unint64_t v36;
  unint64_t v37;
  _BYTE *value;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  MLFeatureVectorizer *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  int v53;
  char *v54;
  _BYTE *v55;
  uint64_t *v56;
  void *v57;
  uint64_t v58;
  NSArray *output_array_shape;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  objc_super v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v62 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v67.receiver = self;
  v67.super_class = (Class)MLFeatureVectorizer;
  v63 = v17;
  v64 = v20;
  v23 = v17;
  v24 = v19;
  v65 = v21;
  v66 = v22;
  v25 = -[MLModelEngine initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v67, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v23, v18, v19, v20, v21);
  v26 = v25;
  if (!v25)
  {
LABEL_28:
    v48 = v26;
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v25->_columnNameEncoding, a3);
  p_dimensionEncoding = (id *)&v26->_dimensionEncoding;
  objc_storeStrong((id *)&v26->_dimensionEncoding, a4);
  objc_msgSend(v18, "allValues", v61, v62);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v28, &unk_1E3DA2A08, 1, -1, CFSTR("MLFeatureVectorizer Input"), 0);

  if (v29)
  {
    objc_msgSend(v24, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:](MLModelDescriptionUtils, "validateAllFeatureDescriptions:hasAnyFeatureTypeIn:minimalCount:maximumCount:debugLabel:error:", v30, &unk_1E3DA2A20, 1, 1, CFSTR("MLFeatureVectorizer Output"), 0);

    if (v31)
    {
      v32 = objc_msgSend(*p_dimensionEncoding, "count");
      p_index_mapping = &v26->index_mapping;
      begin = v26->index_mapping.__begin_;
      end = (char *)v26->index_mapping.__end_;
      v36 = (end - begin) >> 4;
      if (v32 <= v36)
      {
        if (v32 >= v36)
        {
LABEL_22:
          if (end == p_index_mapping->__begin_)
          {
            v51 = 0;
          }
          else
          {
            v49 = 0;
            v50 = 0;
            v51 = 0;
            do
            {
              objc_msgSend(*p_dimensionEncoding, "objectAtIndexedSubscript:", v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "intValue");

              v54 = (char *)p_index_mapping->__begin_;
              v55 = v26->index_mapping.__end_;
              v56 = (uint64_t *)((char *)p_index_mapping->__begin_ + v49);
              *v56 = v51;
              v56[1] = v53;
              v51 += v53;
              ++v50;
              v49 += 16;
            }
            while (v50 < (v55 - v54) >> 4);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v51);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v68[0] = v57;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
          v58 = objc_claimAutoreleasedReturnValue();
          output_array_shape = v26->_output_array_shape;
          v26->_output_array_shape = (NSArray *)v58;

          goto LABEL_28;
        }
        end = &begin[16 * v32];
      }
      else
      {
        v37 = v32 - v36;
        value = v26->index_mapping.__end_cap_.__value_;
        if (v32 - v36 > (value - end) >> 4)
        {
          if (v32 >> 60)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v39 = value - begin;
          v40 = v39 >> 3;
          if (v39 >> 3 <= v32)
            v40 = v32;
          if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF0)
            v41 = 0xFFFFFFFFFFFFFFFLL;
          else
            v41 = v40;
          v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v41);
          v43 = &v42[16 * v36];
          v45 = &v42[16 * v44];
          bzero(v43, 16 * v37);
          end = &v43[16 * v37];
          v47 = (char *)p_index_mapping->__begin_;
          v46 = (char *)v26->index_mapping.__end_;
          if (v46 != p_index_mapping->__begin_)
          {
            do
            {
              *((_OWORD *)v43 - 1) = *((_OWORD *)v46 - 1);
              v43 -= 16;
              v46 -= 16;
            }
            while (v46 != v47);
            v46 = (char *)p_index_mapping->__begin_;
          }
          p_index_mapping->__begin_ = v43;
          v26->index_mapping.__end_ = end;
          v26->index_mapping.__end_cap_.__value_ = v45;
          if (v46)
          {
            operator delete(v46);
            end = (char *)v26->index_mapping.__end_;
          }
          goto LABEL_22;
        }
        bzero(v26->index_mapping.__end_, 16 * v37);
        end += 16 * v37;
      }
      v26->index_mapping.__end_ = end;
      goto LABEL_22;
    }
  }
  v48 = 0;
LABEL_29:

  return v48;
}

- (unint64_t)predictionTypeForKTrace
{
  return 17;
}

- (id)vectorizeOneHotEncoderDict:(id)a3 index:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  unint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const __CFString *v21;
  id v23;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v7 = (void *)objc_opt_new();
  for (i = 0; ; ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_dimensionEncoding, "objectAtIndexedSubscript:", a4, v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (i >= v10)
      break;
    objc_msgSend(v7, "setObject:atIndexedSubscript:", &unk_1E3DA2578, i);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v23;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v25 = *(_QWORD *)v28;
LABEL_6:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v25)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      -[NSArray objectAtIndexedSubscript:](self->_dimensionEncoding, "objectAtIndexedSubscript:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14 < objc_msgSend(v15, "unsignedIntegerValue");

      if (!v16)
      {
        if (a5)
        {
          v21 = CFSTR("MLFeatureVectorizer: Dict idx out of range.");
LABEL_21:
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", v21);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_22;
      }
      objc_msgSend(obj, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v13, "unsignedIntegerValue"), v17);
      }
      else
      {
        v18 = objc_msgSend(v13, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v18, v19);

      }
      if (v11 == ++v12)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          goto LABEL_6;
        goto LABEL_16;
      }
    }
    if (a5)
    {
      v21 = CFSTR("MLFeatureVectorizer: Dict key type must be NSNumber.");
      goto LABEL_21;
    }
LABEL_22:

    v20 = 0;
    goto LABEL_23;
  }
LABEL_16:

  v20 = v7;
LABEL_23:

  return v20;
}

- (NSArray)columnNameEncoding
{
  return self->_columnNameEncoding;
}

- (NSArray)dimensionEncoding
{
  return self->_dimensionEncoding;
}

- (void).cxx_destruct
{
  void *begin;

  objc_storeStrong((id *)&self->_dimensionEncoding, 0);
  objc_storeStrong((id *)&self->_columnNameEncoding, 0);
  begin = self->index_mapping.__begin_;
  if (begin)
  {
    self->index_mapping.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_output_array_shape, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  CoreML::Specification::protobuf_FeatureVectorizer_2eproto *inited;
  CoreML::Specification::protobuf_FeatureVectorizer_2eproto *v9;
  uint64_t i;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  id v17;
  MLFeatureVectorizer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MLFeatureVectorizer *v23;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  inited = (CoreML::Specification::protobuf_FeatureVectorizer_2eproto *)objc_opt_new();
  v9 = inited;
  for (i = 0; ; ++i)
  {
    if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 602)
    {
      v11 = *(uint64_t **)(*(_QWORD *)a3 + 32);
    }
    else
    {
      inited = (CoreML::Specification::protobuf_FeatureVectorizer_2eproto *)CoreML::Specification::protobuf_FeatureVectorizer_2eproto::InitDefaults(inited);
      v11 = &CoreML::Specification::_FeatureVectorizer_default_instance_;
    }
    if (i >= *((int *)v11 + 6))
      break;
    if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 602)
    {
      v12 = *(uint64_t **)(*(_QWORD *)a3 + 32);
    }
    else
    {
      CoreML::Specification::protobuf_FeatureVectorizer_2eproto::InitDefaults(inited);
      v12 = &CoreML::Specification::_FeatureVectorizer_default_instance_;
    }
    v13 = *(_QWORD *)(v12[4] + 8 * i + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v13 + 24));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreML::Specification::protobuf_FeatureVectorizer_2eproto addObject:](v9, "addObject:", v14);

    v15 = *(uint64_t **)(v13 + 16);
    if (*((char *)v15 + 23) < 0)
      v15 = (uint64_t *)*v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);

  }
  v17 = -[MLModelDescription initFromSingleFunctionModelSpecification:]([MLModelDescription alloc], "initFromSingleFunctionModelSpecification:", a3);
  v18 = [MLFeatureVectorizer alloc];
  objc_msgSend(v17, "inputDescriptionsByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "outputDescriptionsByName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inputFeatureNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "outputFeatureNames");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MLFeatureVectorizer initWith:dimensionEncoding:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](v18, "initWith:dimensionEncoding:dataTransformerName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:", v7, v9, CFSTR("feature vectorizer"), v19, v20, v21, v22, v6);

  return v23;
}

@end

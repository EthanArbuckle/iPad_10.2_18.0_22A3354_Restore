@implementation AXMindNetNetwork

- (unint64_t)preferredSmallSide
{
  return (unint64_t)self->_input_height;
}

+ (id)networkWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelPath:configuration:modelType:", v8, v9, a5);

  return v10;
}

- (AXMindNetNetwork)initWithModelPath:(id)a3 configuration:(id)a4 modelType:(int64_t)a5
{
  id v8;
  id v9;
  AXMindNetNetwork *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  AXMindNetNetwork *v15;
  void **v16;
  void **v17;
  uint64_t v18;
  id v19;
  MLModel *mindNetModel;
  void *v21;
  void *v22;
  float v23;
  uint64_t v24;
  NSArray *filterThresholds;
  int *begin;
  vector<int, std::allocator<int>> *p_important_classes;
  int64x2_t *p_model_labels;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t value;
  int *end;
  int *v34;
  int *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  int *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t *var0;
  __end_cap_ **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t *v53;
  char *v54;
  __end_cap_ **v55;
  __end_ **v56;
  uint64_t v57;
  int64x2_t v58;
  id *v59;
  int v60;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  objc_super v68;
  void **v69;
  void ***v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE v73[24];
  char *v74;
  void ***p_value;

  v8 = a3;
  v9 = a4;
  v68.receiver = self;
  v68.super_class = (Class)AXMindNetNetwork;
  v10 = -[AXMindNetNetwork init](&v68, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    objc_msgSend(MEMORY[0x1E0C9E940], "compileModelAtURL:error:", v11, &v67);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v67;
    if (v13)
    {
      v14 = v13;
      v15 = 0;
    }
    else
    {
      v69 = 0;
      v70 = &v69;
      v71 = 0x2050000000;
      v16 = (void **)getMLModelClass(void)::softClass;
      v72 = getMLModelClass(void)::softClass;
      v65 = v8;
      v62 = v12;
      v63 = v11;
      if (!getMLModelClass(void)::softClass)
      {
        *(_QWORD *)v73 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v73[8] = 3221225472;
        *(_QWORD *)&v73[16] = ___ZL15getMLModelClassv_block_invoke;
        v74 = (char *)&unk_1E625D168;
        p_value = &v69;
        ___ZL15getMLModelClassv_block_invoke((uint64_t)v73);
        v16 = v70[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v69, 8);
      v66 = 0;
      objc_msgSend(v17, "modelWithContentsOfURL:error:", v12, &v66);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v66;
      mindNetModel = v10->_mindNetModel;
      v10->_mindNetModel = (MLModel *)v18;

      v10->_modelType = a5;
      *(_WORD *)&v10->_keep_aspect_ratio = 257;
      v10->_input_height = 488.0;
      objc_msgSend(v9, "filterThresholds");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v19;
      v10->_num_pos_classes = objc_msgSend(v21, "count");

      objc_msgSend(v9, "nmsThreshold");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v10->_nmsThreshold = v23;

      objc_msgSend(v9, "filterThresholds");
      v24 = objc_claimAutoreleasedReturnValue();
      filterThresholds = v10->_filterThresholds;
      v10->_filterThresholds = (NSArray *)v24;

      p_important_classes = &v10->_important_classes;
      begin = v10->_important_classes.__begin_;
      if (begin)
      {
        v10->_important_classes.__end_ = begin;
        operator delete(begin);
        p_important_classes->__begin_ = 0;
        v10->_important_classes.__end_ = 0;
        v10->_important_classes.__end_cap_.__value_ = 0;
      }
      p_important_classes->__begin_ = 0;
      v10->_important_classes.__end_ = 0;
      v10->_important_classes.__end_cap_.__value_ = 0;
      memset(v73, 0, sizeof(v73));
      p_model_labels = (int64x2_t *)&v10->_model_labels;
      std::vector<NSString * {__strong}>::__vdeallocate((void **)&v10->_model_labels.__begin_);
      v10->_model_labels.var1.__value_ = *(id **)&v73[16];
      *(_OWORD *)&v10->_model_labels.__begin_ = *(_OWORD *)v73;
      memset(v73, 0, sizeof(v73));
      v69 = (void **)v73;
      std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v69);
      v29 = 0;
      while (1)
      {
        objc_msgSend(v9, "filterThresholds");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31 <= v29)
          break;
        ++v29;
        end = v10->_important_classes.__end_;
        value = (unint64_t)v10->_important_classes.__end_cap_.__value_;
        if ((unint64_t)end >= value)
        {
          v35 = p_important_classes->__begin_;
          v36 = end - p_important_classes->__begin_;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          v38 = value - (_QWORD)v35;
          if (v38 >> 1 > v37)
            v37 = v38 >> 1;
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v37;
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v10->_important_classes.__end_cap_, v39);
            v35 = v10->_important_classes.__begin_;
            end = v10->_important_classes.__end_;
          }
          else
          {
            v40 = 0;
          }
          v41 = (int *)&v40[4 * v36];
          *v41 = v29;
          v34 = v41 + 1;
          while (end != v35)
          {
            v42 = *--end;
            *--v41 = v42;
          }
          v10->_important_classes.__begin_ = v41;
          v10->_important_classes.__end_ = v34;
          v10->_important_classes.__end_cap_.__value_ = (int *)&v40[4 * v39];
          if (v35)
            operator delete(v35);
        }
        else
        {
          *end = v29;
          v34 = end + 1;
        }
        v10->_important_classes.__end_ = v34;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v29);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v43;
        var0 = (uint64_t *)v10->_model_labels.var0;
        v45 = (unint64_t)v10->_model_labels.var1.__value_;
        if ((unint64_t)var0 >= v45)
        {
          v48 = ((uint64_t)var0 - p_model_labels->i64[0]) >> 3;
          if ((unint64_t)(v48 + 1) >> 61)
            std::vector<BOOL>::__throw_length_error[abi:ne180100]();
          v49 = v45 - p_model_labels->i64[0];
          v50 = v49 >> 2;
          if (v49 >> 2 <= (unint64_t)(v48 + 1))
            v50 = v48 + 1;
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
            v51 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v51 = v50;
          p_value = &v10->_model_labels.var1.__value_;
          if (v51)
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v10->_model_labels.var1, v51);
          else
            v52 = 0;
          v53 = (uint64_t *)&v52[8 * v48];
          v54 = &v52[8 * v51];
          v74 = v54;
          *v53 = v44;
          v47 = (__end_cap_ **)(v53 + 1);
          *(_QWORD *)&v73[16] = v53 + 1;
          v56 = v10->_model_labels.__begin_;
          v55 = v10->_model_labels.var0;
          if (v55 == v56)
          {
            v58 = vdupq_n_s64((unint64_t)v55);
          }
          else
          {
            do
            {
              v57 = (uint64_t)*--v55;
              *v55 = 0;
              *--v53 = v57;
            }
            while (v55 != v56);
            v58 = *p_model_labels;
            v47 = *(__end_cap_ ***)&v73[16];
            v54 = v74;
          }
          v10->_model_labels.__begin_ = (__end_ **)v53;
          v10->_model_labels.var0 = v47;
          *(int64x2_t *)&v73[8] = v58;
          v59 = v10->_model_labels.var1.__value_;
          v10->_model_labels.var1.__value_ = (id *)v54;
          v74 = (char *)v59;
          *(_QWORD *)v73 = v58.i64[0];
          std::__split_buffer<NSString * {__strong}>::~__split_buffer((uint64_t)v73);
        }
        else
        {
          *var0 = v43;
          v47 = (__end_cap_ **)(var0 + 1);
        }
        v10->_model_labels.var0 = v47;
      }
      v14 = v64;
      v8 = v65;
      v12 = v62;
      v11 = v63;
      if (AXDeviceIsPad())
      {
        v60 = 1065353216;
      }
      else if (v10->_modelType)
      {
        v60 = 1056964608;
      }
      else
      {
        v60 = 1055766235;
      }
      LODWORD(v10->_input_aspect_ratio) = v60;
      *(_WORD *)&v10->_keep_aspect_ratio = 0;
      *(int32x2_t *)&v10->_input_height = vdup_n_s32(0x44600000u);
      v10->_screenshot_height = 896.0;
      v15 = v10;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  float v6;
  float width;
  void *data;
  float height;
  float rowBytes;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  MLModel *mindNetModel;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  AXElementDetection *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int *end;
  int *begin;
  uint64_t v52;
  void *v53;
  float v54;
  AXElementDetection *v55;
  int v56;
  int v57;
  void *v58;
  double v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  AXElementDetection *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  int *v83;
  int *v84;
  uint64_t v85;
  void *v86;
  float v87;
  AXElementDetection *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  id v93;
  void *exception;
  CFDictionaryRef pixelBufferAttributes;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  double v104;
  id obj;
  id v106;
  double v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  id v117;
  CVPixelBufferRef v118;
  _BYTE v119[128];
  _BYTE v120[128];
  void *v121;
  _QWORD v122[3];
  CGRect v123;
  CGRect v124;

  v122[1] = *MEMORY[0x1E0C80C00];
  v103 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMindNetNetwork threshold](self, "threshold");
  if (v6 == 1.0)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  width = (float)a3->width;
  data = a3->data;
  height = (float)a3->height;
  rowBytes = (float)a3->rowBytes;
  v118 = 0;
  CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (unint64_t)width, (unint64_t)height, 0x42475241u, data, (unint64_t)rowBytes, 0, 0, 0, &v118);
  if (v118)
  {
    -[MLModel modelDescription](self->_mindNetModel, "modelDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputDescriptionsByName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v121 = v99;
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", v118);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = 0;
    v100 = (void *)objc_msgSend(v14, "initWithDictionary:error:", v16, &v117);
    v17 = v117;

    mindNetModel = self->_mindNetModel;
    v116 = v17;
    -[MLModel predictionFromFeatures:error:](mindNetModel, "predictionFromFeatures:error:", v100, &v116);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v116;

    if (v101)
    {
      AXMediaLogElementVision();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AXMindNetNetwork processVImage:inputIsBGR:].cold.1((uint64_t)v101, v19);

      v20 = v103;
    }
    else
    {
      v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v98, "featureValueForName:", CFSTR("decoded_1"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "multiArrayValue");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_modelType == 1)
      {
        -[AXMindNetNetwork nmsThreshold](self, "nmsThreshold");
        v24 = v23;
        -[AXMindNetNetwork filterThresholds](self, "filterThresholds");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = v24;
        +[AXBoundingBox postComputeClickabilityWithDecoded:nmsThreshold:filterThresholds:](_TtC16AXMediaUtilities13AXBoundingBox, "postComputeClickabilityWithDecoded:nmsThreshold:filterThresholds:", v97, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        obj = v27;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v113;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v113 != v29)
                objc_enumerationMutation(obj);
              v31 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
              objc_msgSend(v31, "resultBox");
              if (CGRectGetWidth(v123) <= 0.9)
              {
                objc_msgSend(v31, "resultBox");
                if (CGRectGetHeight(v124) <= 0.9)
                {
                  v32 = [AXElementDetection alloc];
                  objc_msgSend(v31, "resultBox");
                  v104 = v33;
                  v35 = v34;
                  v37 = v36;
                  v39 = v38;
                  objc_msgSend(v31, "resultBox");
                  v41 = v40;
                  v43 = v42;
                  v45 = v44;
                  v47 = v46;
                  objc_msgSend(v31, "resultConfidence");
                  v49 = v48;
                  begin = self->_important_classes.__begin_;
                  end = self->_important_classes.__end_;
                  v52 = objc_msgSend(v31, "resultLabel");
                  objc_msgSend(v31, "resultLabelName");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = v49;
                  *(float *)&pixelBufferAttributes = v54;
                  v55 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:](v32, "initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:", 0, (unint64_t)((char *)end - (char *)begin) > 4, v52, v53, v104, v35, v37, v39, v41, v43, v45, v47, pixelBufferAttributes);

                  objc_msgSend(v106, "addObject:", v55);
                }
              }
            }
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          }
          while (v28);
        }
      }
      else
      {
        -[AXMindNetNetwork nmsThreshold](self, "nmsThreshold");
        v57 = v56;
        -[AXMindNetNetwork filterThresholds](self, "filterThresholds");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v59) = v57;
        +[AXBoundingBox postComputeWithDecoded:nmsThreshold:filterThresholds:](_TtC16AXMediaUtilities13AXBoundingBox, "postComputeWithDecoded:nmsThreshold:filterThresholds:", v97, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        obj = v60;
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
        if (v61)
        {
          v62 = *(_QWORD *)v109;
          do
          {
            for (j = 0; j != v61; ++j)
            {
              if (*(_QWORD *)v109 != v62)
                objc_enumerationMutation(obj);
              v64 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
              v65 = [AXElementDetection alloc];
              objc_msgSend(v64, "resultBox");
              v107 = v66;
              v68 = v67;
              v70 = v69;
              v72 = v71;
              objc_msgSend(v64, "resultBox");
              v74 = v73;
              v76 = v75;
              v78 = v77;
              v80 = v79;
              objc_msgSend(v64, "resultConfidence");
              v82 = v81;
              v84 = self->_important_classes.__begin_;
              v83 = self->_important_classes.__end_;
              v85 = objc_msgSend(v64, "resultLabel");
              objc_msgSend(v64, "resultLabelName");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = v82;
              *(float *)&pixelBufferAttributes = v87;
              v88 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:](v65, "initWithBox:defaultBox:confidence:scale:hasLabel:label:labelName:", 0, (unint64_t)((char *)v83 - (char *)v84) > 4, v85, v86, v107, v68, v70, v72, v74, v76, v78, v80, pixelBufferAttributes);

              objc_msgSend(v106, "addObject:", v88);
            }
            v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
          }
          while (v61);
        }
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "timeIntervalSinceDate:", v102);
      v91 = v90;

      objc_msgSend(v103, "setValue:forKey:", v106, CFSTR("boxes"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v91 * 1000.0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setValue:forKey:", v92, CFSTR("timing"));

      v93 = v103;
    }

  }
  else
  {
    v21 = v103;
  }

  return v103;
}

- (id)resizeAndProcessVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  vImagePixelCount width;
  vImagePixelCount height;
  BOOL v6;
  _BOOL8 v7;
  float v10;
  float v11;
  int v12;
  __int128 v13;
  float input_height;
  float input_aspect_ratio;
  vImagePixelCount v16;
  vImagePixelCount v17;
  vImagePixelCount v18;
  vImagePixelCount v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  vImagePixelCount v33;
  vImagePixelCount v34;
  vImagePixelCount v35;
  vImagePixelCount v36;
  int IsPad;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float screenshot_width;
  float screenshot_height;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *exception;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  vImage_Buffer v73;
  uint8_t color[4];
  vImage_Buffer dest;
  vImage_Buffer backColor;
  vImage_Buffer buf;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  height = a3->height;
  width = a3->width;
  if (width)
    v6 = height == 0;
  else
    v6 = 1;
  if (v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "Invalid input");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v7 = a4;
  v10 = (float)width;
  v11 = (float)height;
  if (self->_can_rotate && v11 > v10)
  {
    LODWORD(backColor.data) = 0;
    if (vImageBuffer_Init(&buf, v10, v11, 0x20u, 0))
    {
      v66 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1B5E124B8](v66, "Intermediate buffer allocation failed");
      __cxa_throw(v66, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    vImageRotate90_ARGB8888(a3, &buf, 1u, (const uint8_t *)&backColor, 0);
    v10 = (float)buf.width;
    v11 = (float)buf.height;
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v13 = *(_OWORD *)&a3->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&a3->data;
    *(_OWORD *)&buf.width = v13;
  }
  input_height = self->_input_height;
  input_aspect_ratio = self->_input_aspect_ratio;
  v16 = (unint64_t)(float)(input_height * input_aspect_ratio);
  v17 = (unint64_t)input_height;
  v18 = v16;
  v19 = (unint64_t)input_height;
  if (self->_keep_aspect_ratio)
  {
    if ((float)(v10 / v11) >= input_aspect_ratio)
    {
      v19 = (unint64_t)(float)((float)(v11 / v10) * (float)v16);
      v18 = (unint64_t)(float)(input_height * input_aspect_ratio);
    }
    else
    {
      v18 = (unint64_t)(float)((float)(v10 / v11) * (float)v17);
      v19 = (unint64_t)input_height;
    }
  }
  if (vImageBuffer_Init(&backColor, v19, v18, 0x20u, 0))
  {
    v63 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v63, "Intermediate buffer allocation failed");
    __cxa_throw(v63, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  vImageScale_ARGB8888(&buf, &backColor, 0, 0x20u);
  if (vImageBuffer_Init(&dest, v17, v16, 0x20u, 0))
  {
    v64 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v64, "Intermediate buffer allocation failed");
    __cxa_throw(v64, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  *(_DWORD *)color = -16777216;
  if (vImageBufferFill_ARGB8888(&dest, color, 0))
  {
    v65 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](v65, "esp error");
    __cxa_throw(v65, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  if (SLODWORD(backColor.height) >= 1)
  {
    v20 = 0;
    do
    {
      memcpy((char *)dest.data + dest.rowBytes * v20, (char *)backColor.data + backColor.rowBytes * v20, 4 * backColor.width);
      ++v20;
    }
    while (v20 < SLODWORD(backColor.height));
  }
  if (v16 > 0x4000 || v17 > 0x4000)
  {
    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  else
  {
    v73 = dest;
    -[AXMindNetNetwork processVImage:inputIsBGR:](self, "processVImage:inputIsBGR:", &v73, v7);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("boxes"));
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v70 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v24, "box");
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = dest.height;
          v33 = dest.width;
          v36 = backColor.height;
          v35 = backColor.width;
          IsPad = AXDeviceIsPad();
          v38 = (float)((float)v33 / (float)v35);
          v39 = v26 * v38;
          v40 = 1.0 - (1.0 - v28) * (float)v34 / (float)v36;
          v41 = v30 * v38;
          v42 = v32 * (float)((float)v34 / (float)v36);
          if (!IsPad)
            goto LABEL_30;
          screenshot_width = self->_screenshot_width;
          screenshot_height = self->_screenshot_height;
          v45 = screenshot_height;
          v46 = screenshot_width;
          if (screenshot_width < screenshot_height)
          {
            v39 = (v39 + -0.5) * v45 / v46 + 0.5;
            v41 = v41 * (float)(screenshot_height / screenshot_width);
LABEL_30:
            if (v12)
              goto LABEL_31;
            goto LABEL_33;
          }
          v40 = (v40 + -0.5) * v46 / v45 + 0.5;
          v42 = v42 * (float)(screenshot_width / screenshot_height);
          if (v12)
          {
LABEL_31:
            v47 = 1.0 - (v41 + v39);
            v48 = v42;
            goto LABEL_34;
          }
LABEL_33:
          v48 = v41;
          v41 = v42;
          v47 = v40;
          v40 = v39;
LABEL_34:
          objc_msgSend(v24, "setBox:", v40, v47, v48, v41);
          objc_msgSend(v24, "defaultBox");
          v51 = v50;
          v52 = (float)((float)dest.width / (float)backColor.width);
          v54 = v53 * v52;
          v55 = 1.0 - (1.0 - v49) * (float)dest.height / (float)backColor.height;
          v57 = v56 * v52;
          v58 = v51 * (float)((float)dest.height / (float)backColor.height);
          if (v12)
          {
            v59 = 1.0 - (v54 + v57);
            v60 = v58;
          }
          else
          {
            v60 = v57;
            v57 = v58;
            v59 = 1.0 - (1.0 - v49) * (float)dest.height / (float)backColor.height;
            v55 = v54;
          }
          objc_msgSend(v24, "setDefaultBox:", v55, v59, v60, v57);
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v21);
    }

    free(dest.data);
    dest.data = 0;
    free(backColor.data);
    backColor.data = 0;
    if (v12)
    {
      free(buf.data);
      buf.data = 0;
    }
  }
  return v67;
}

- (id)processCIImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  CGContext *v15;
  CGColor *GenericRGB;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  vImage_Buffer *v31;
  __int128 v32;
  void *v33;
  id result;
  void *exception;
  _OWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  objc_msgSend(v4, "extent");
  v7 = v6;
  if (v7 == 0.0 || (v8 = v5, v8 == 0.0))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1B5E124B8](exception, "esp error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  if (AXDeviceIsPad())
  {
    self->_screenshot_width = v7;
    self->_screenshot_height = v8;
    if (v8 <= v7)
      v9 = v7;
    else
      v9 = v8;
    v37 = 0;
    v38 = (uint64_t)&v37;
    v39 = 0x2020000000;
    v10 = getUIGraphicsBeginImageContextSymbolLoc(void)::ptr;
    v40 = getUIGraphicsBeginImageContextSymbolLoc(void)::ptr;
    if (!getUIGraphicsBeginImageContextSymbolLoc(void)::ptr)
    {
      v11 = (void *)UIKitLibrary();
      v10 = dlsym(v11, "UIGraphicsBeginImageContext");
      *(_QWORD *)(v38 + 24) = v10;
      getUIGraphicsBeginImageContextSymbolLoc(void)::ptr = v10;
    }
    _Block_object_dispose(&v37, 8);
    if (!v10)
      goto LABEL_26;
    v12 = v9;
    ((void (*)(double, double))v10)(v12, v12);
    v37 = 0;
    v38 = (uint64_t)&v37;
    v39 = 0x2020000000;
    v13 = getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr;
    v40 = getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr;
    if (!getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr)
    {
      v14 = (void *)UIKitLibrary();
      v13 = dlsym(v14, "UIGraphicsGetCurrentContext");
      *(_QWORD *)(v38 + 24) = v13;
      getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr = v13;
    }
    _Block_object_dispose(&v37, 8);
    if (!v13)
      goto LABEL_26;
    v15 = (CGContext *)((uint64_t (*)(void))v13)();
    GenericRGB = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
    CGContextSetFillColorWithColor(v15, GenericRGB);
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.width = v12;
    v46.size.height = v12;
    CGContextFillRect(v15, v46);
    CGColorRelease(GenericRGB);
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v47.size.width = v12;
    v47.size.height = v12;
    v48 = CGRectInset(v47, (v12 - v7) * 0.5, (v12 - v8) * 0.5);
    x = v48.origin.x;
    y = v48.origin.y;
    width = v48.size.width;
    height = v48.size.height;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v21 = (void *)getUIImageClass(void)::softClass;
    v45 = getUIImageClass(void)::softClass;
    if (!getUIImageClass(void)::softClass)
    {
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = (uint64_t)___ZL15getUIImageClassv_block_invoke;
      v40 = &unk_1E625D168;
      v41 = &v42;
      ___ZL15getUIImageClassv_block_invoke((uint64_t)&v37);
      v21 = (void *)v43[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v42, 8);
    objc_msgSend(v22, "imageWithCIImage:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "drawInRect:blendMode:alpha:", 0, x, y, width, height, 1.0);

    v24 = (void *)MEMORY[0x1E0C9DDC8];
    v37 = 0;
    v38 = (uint64_t)&v37;
    v39 = 0x2020000000;
    v25 = getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr;
    v40 = getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr;
    if (!getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr)
    {
      v26 = (void *)UIKitLibrary();
      v25 = dlsym(v26, "UIGraphicsGetImageFromCurrentImageContext");
      *(_QWORD *)(v38 + 24) = v25;
      getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr = v25;
    }
    _Block_object_dispose(&v37, 8);
    if (!v25)
      goto LABEL_26;
    ((void (*)(void))v25)();
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "imageWithCGImage:", objc_msgSend(v27, "CGImage"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    v38 = (uint64_t)&v37;
    v39 = 0x2020000000;
    v29 = getUIGraphicsEndImageContextSymbolLoc(void)::ptr;
    v40 = getUIGraphicsEndImageContextSymbolLoc(void)::ptr;
    if (!getUIGraphicsEndImageContextSymbolLoc(void)::ptr)
    {
      v30 = (void *)UIKitLibrary();
      v29 = dlsym(v30, "UIGraphicsEndImageContext");
      *(_QWORD *)(v38 + 24) = v29;
      getUIGraphicsEndImageContextSymbolLoc(void)::ptr = v29;
    }
    _Block_object_dispose(&v37, 8);
    if (!v29)
    {
LABEL_26:
      dlerror();
      result = (id)abort_report_np();
      __break(1u);
      return result;
    }
    ((void (*)(void))v29)();
  }
  else
  {
    v28 = v4;
  }
  v31 = +[AXMindNetHelpers createVImageBuffer:](AXMindNetHelpers, "createVImageBuffer:", v28);
  v32 = *(_OWORD *)&v31->width;
  v36[0] = *(_OWORD *)&v31->data;
  v36[1] = v32;
  -[AXMindNetNetwork resizeAndProcessVImage:inputIsBGR:](self, "resizeAndProcessVImage:inputIsBGR:", v36, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31->data)
    free(v31->data);
  MEMORY[0x1B5E1250C](v31, 0x1080C40ABB4582ELL);

  return v33;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (void).cxx_destruct
{
  int *begin;
  vector<NSString *, std::allocator<NSString *>> *p_model_labels;

  objc_storeStrong((id *)&self->_filterThresholds, 0);
  objc_storeStrong((id *)&self->_filterThreshold, 0);
  p_model_labels = &self->_model_labels;
  std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_model_labels);
  begin = self->_important_classes.__begin_;
  if (begin)
  {
    self->_important_classes.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_mindNetModel, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)processVImage:(uint64_t)a1 inputIsBGR:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "MindNet Model Error %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation MLCConvolutionLayer

+ (MLCConvolutionLayer)layerWithWeights:(MLCTensor *)weights biases:(MLCTensor *)biases descriptor:(MLCConvolutionDescriptor *)descriptor
{
  MLCConvolutionDescriptor *v8;
  MLCTensor *v9;
  MLCTensor *v10;
  void *v11;

  v8 = descriptor;
  v9 = biases;
  v10 = weights;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeights:biases:descriptor:", v10, v9, v8);

  return (MLCConvolutionLayer *)v11;
}

- (MLCConvolutionLayer)initWithWeights:(id)a3 biases:(id)a4 descriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  MLCConvolutionLayer *v21;
  MLCConvolutionLayer *v22;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  MLCConvolutionLayer *v58;
  MLCConvolutionLayer *v59;
  uint64_t v60;
  MLCTensorParameter *weightsParameter;
  uint64_t v62;
  MLCTensorParameter *biasesParameter;
  MLCTensorParameter *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  id v74;
  objc_super v77;
  objc_super v78;
  objc_super v79;
  objc_super v80;
  objc_super v81;
  objc_super v82;
  objc_super v83;
  objc_super v84;
  objc_super v85;
  objc_super v86;
  objc_super v87;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  if (v14 >= 2)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.1(a2);
LABEL_11:

    v21 = 0;
LABEL_12:
    v22 = self;
    goto LABEL_13;
  }
  objc_msgSend(v8, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[MLCLog framework](MLCLog, "framework");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.2(a2);
    goto LABEL_11;
  }
  if (v9)
  {
    objc_msgSend(v9, "descriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    if (v20 >= 2)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.3(a2);
      goto LABEL_11;
    }
    objc_msgSend(v9, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");
    v74 = v10;
    v28 = objc_msgSend(v10, "outputFeatureChannelCount");
    v29 = v9;
    v30 = v28;

    if (v27 != v30)
    {
      +[MLCLog framework](MLCLog, "framework");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.7(a2);

      v21 = 0;
      v9 = v29;
      v10 = v74;
      goto LABEL_12;
    }
    objc_msgSend(v29, "descriptor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "shape");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v31, "count");
    v32 = v29;
    v10 = v74;
    v73 = v32;
    if (v71 >= 4)
    {
      objc_msgSend(v32, "descriptor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "shape");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v35, "unsignedIntegerValue") > 1)
      {

LABEL_28:
        +[MLCLog framework](MLCLog, "framework");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          -[MLCConvolutionLayer initWithWeights:biases:descriptor:].cold.4(a2);
        goto LABEL_45;
      }
      v70 = v35;
      v65 = v34;
      v67 = v33;
    }
    objc_msgSend(v32, "descriptor", v65);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "shape");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v38, "count") < 3)
    {
      v41 = 0;
    }
    else
    {
      objc_msgSend(v32, "descriptor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "shape");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 2);
      v69 = v31;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (unint64_t)objc_msgSend(v40, "unsignedIntegerValue") > 1;

      v31 = v69;
    }

    if (v71 >= 4)
    {

    }
    if (v41)
      goto LABEL_28;
    objc_msgSend(v8, "childLayers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");
    objc_msgSend(v73, "childLayers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    if (v44 != v46)
    {
      +[MLCLog framework](MLCLog, "framework");
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
LABEL_45:

        v21 = 0;
        v9 = v73;
        goto LABEL_12;
      }
LABEL_44:
      -[MLCFullyConnectedLayer initWithWeights:biases:descriptor:].cold.5(a2);
      goto LABEL_45;
    }
    objc_msgSend(v8, "childLayers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    v9 = v73;
    if (v48)
    {
      v49 = 0;
      while (1)
      {
        objc_msgSend(v8, "childLayers");
        v50 = v9;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v49);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "childLayers");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", v49);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52 != v54)
          break;
        ++v49;
        objc_msgSend(v8, "childLayers");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count");

        v9 = v73;
        v10 = v74;
        if (v49 >= v56)
          goto LABEL_35;
      }
      +[MLCLog framework](MLCLog, "framework");
      v42 = objc_claimAutoreleasedReturnValue();
      v10 = v74;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      goto LABEL_44;
    }
  }
LABEL_35:
  v57 = v10;
  v87.receiver = self;
  v87.super_class = (Class)MLCConvolutionLayer;
  v58 = -[MLCLayer initWithLabel:](&v87, sel_initWithLabel_, CFSTR("Convolution"));
  v59 = v58;
  if (v58)
  {
    v58->_accumulatorPrecisionOption = 0;
    objc_storeStrong((id *)&v58->_weights, a3);
    objc_storeStrong((id *)&v59->_descriptor, a5);
    objc_storeStrong((id *)&v59->_biases, a4);
    +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v8);
    v60 = objc_claimAutoreleasedReturnValue();
    weightsParameter = v59->_weightsParameter;
    v59->_weightsParameter = (MLCTensorParameter *)v60;

    -[MLCTensor setIsLayerParameter:](v59->_weights, "setIsLayerParameter:", 1);
    if (v9)
    {
      +[MLCTensorParameter parameterWithTensor:](MLCTensorParameter, "parameterWithTensor:", v9);
      v62 = objc_claimAutoreleasedReturnValue();
      biasesParameter = v59->_biasesParameter;
      v59->_biasesParameter = (MLCTensorParameter *)v62;

      -[MLCTensor setIsLayerParameter:](v59->_biases, "setIsLayerParameter:", 1);
    }
    else
    {
      v64 = v59->_biasesParameter;
      v59->_biasesParameter = 0;

    }
    v86.receiver = v59;
    v86.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setKernelWidth:](&v86, sel_setKernelWidth_, objc_msgSend(v57, "kernelWidth"));
    v85.receiver = v59;
    v85.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setKernelHeight:](&v85, sel_setKernelHeight_, objc_msgSend(v57, "kernelHeight"));
    v84.receiver = v59;
    v84.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setDilationRateInX:](&v84, sel_setDilationRateInX_, objc_msgSend(v57, "dilationRateInX"));
    v83.receiver = v59;
    v83.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setDilationRateInY:](&v83, sel_setDilationRateInY_, objc_msgSend(v57, "dilationRateInY"));
    v82.receiver = v59;
    v82.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setStrideInX:](&v82, sel_setStrideInX_, objc_msgSend(v57, "strideInX"));
    v81.receiver = v59;
    v81.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setStrideInY:](&v81, sel_setStrideInY_, objc_msgSend(v57, "strideInY"));
    v80.receiver = v59;
    v80.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setPaddingPolicy:](&v80, sel_setPaddingPolicy_, objc_msgSend(v57, "paddingPolicy"));
    v79.receiver = v59;
    v79.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setPaddingSizeInX:](&v79, sel_setPaddingSizeInX_, objc_msgSend(v57, "paddingSizeInX"));
    v78.receiver = v59;
    v78.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setPaddingSizeInY:](&v78, sel_setPaddingSizeInY_, objc_msgSend(v57, "paddingSizeInY"));
    v77.receiver = v59;
    v77.super_class = (Class)MLCConvolutionLayer;
    -[MLCLayer setIsUpdatable:](&v77, sel_setIsUpdatable_, 1);
  }
  v22 = v59;
  v21 = v22;
  v10 = v57;
LABEL_13:

  return v21;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  char isKindOfClass;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  int v79;
  int v80;
  int v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  char v86;
  void *v87;
  void *v88;
  unint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  int v95;
  int v96;
  int v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  int v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  uint64_t v117;
  unint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  unint64_t v122;
  NSObject *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  unsigned int v134;
  uint64_t v135;
  int v136;
  int v137;
  void *v138;
  const char *v139;
  id v140;
  objc_super v141;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MLCConvolutionLayer weights](self, "weights");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parentLayers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    -[MLCConvolutionLayer biases](self, "biases");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "parentLayers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      +[MLCLog framework](MLCLog, "framework");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MLCConvolutionLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2, self);
      goto LABEL_7;
    }
    v139 = a2;
    v140 = v10;
    -[MLCConvolutionLayer biases](self, "biases");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childLayers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      -[MLCConvolutionLayer weights](self, "weights");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "childLayers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");
      -[MLCConvolutionLayer biases](self, "biases");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "childLayers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v26 != v29)
      {
        +[MLCLog framework](MLCLog, "framework");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v139);
        v19 = 0;
        goto LABEL_46;
      }
      -[MLCConvolutionLayer weights](self, "weights");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "childLayers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        v33 = 0;
        while (1)
        {
          -[MLCConvolutionLayer weights](self, "weights");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "childLayers");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCConvolutionLayer biases](self, "biases");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "childLayers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", v33);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36 != v39)
            break;
          ++v33;
          -[MLCConvolutionLayer weights](self, "weights");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "childLayers");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

          if (v33 >= v42)
            goto LABEL_15;
        }
        +[MLCLog framework](MLCLog, "framework");
        v15 = objc_claimAutoreleasedReturnValue();
        v10 = v140;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MLCFullyConnectedLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v139);
        goto LABEL_7;
      }
    }
LABEL_15:
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v43, "paddingPolicy");

    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v44, "paddingSizeInX");

    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v45, "paddingSizeInY");

    v46 = -[MLCLayer paddingPolicy](self, "paddingPolicy");
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "paddingPolicy");

    v136 = v48;
    v137 = v46;
    if (v46 != v48)
    {
      v49 = -[MLCLayer paddingPolicy](self, "paddingPolicy");
      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setPaddingPolicy:", v49);

      v51 = -[MLCLayer paddingSizeInX](self, "paddingSizeInX");
      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setPaddingSizeInX:", v51);

      v53 = -[MLCLayer paddingSizeInY](self, "paddingSizeInY");
      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setPaddingSizeInY:", v53);

    }
    -[MLCLayer fusedLayers](self, "fusedLayers");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");

    if (v56)
    {
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      -[MLCLayer fusedLayers](self, "fusedLayers");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {

        -[MLCLayer fusedLayers](self, "fusedLayers");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "count");

        v129 = v11;
        if (v63 < 2)
        {
          v138 = 0;
        }
        else
        {
          -[MLCLayer fusedLayers](self, "fusedLayers");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectAtIndexedSubscript:", 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "descriptor");
          v138 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v9, "computeEngine");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCConvolutionLayer descriptor](self, "descriptor");
        v127 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "mean");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "variance");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "beta");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "gamma");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "varianceEpsilon");
        v79 = v78;
        objc_msgSend(v61, "momentum");
        v81 = v80;
        -[MLCConvolutionLayer weights](self, "weights");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLCConvolutionLayer biases](self, "biases");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v127;
        LODWORD(v84) = v79;
        LODWORD(v85) = v81;
        objc_msgSend(v130, "fusedConvolutionBatchNormalizationAndNeuronLayerWithDescriptor:mean:variance:beta:gamma:varianceEpsilon:momentum:neuronDescriptor:weights:biasTerms:", v127, v126, v75, v76, v77, v138, v84, v85, v82, v83);
        v15 = objc_claimAutoreleasedReturnValue();

        v67 = v130;
        v11 = v129;
      }
      else
      {
        objc_opt_class();
        v69 = objc_opt_isKindOfClass();

        -[MLCLayer fusedLayers](self, "fusedLayers");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectAtIndexedSubscript:", 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v69 & 1) != 0)
        {

          -[MLCLayer fusedLayers](self, "fusedLayers");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "count");

          if (v72 < 2)
          {
            v138 = 0;
          }
          else
          {
            -[MLCLayer fusedLayers](self, "fusedLayers");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "objectAtIndexedSubscript:", 1);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "descriptor");
            v138 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v9, "computeEngine");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCConvolutionLayer descriptor](self, "descriptor");
          v92 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "beta");
          v93 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "gamma");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "varianceEpsilon");
          v96 = v95;
          objc_msgSend(v61, "momentum");
          v98 = v97;
          -[MLCConvolutionLayer weights](self, "weights");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLCConvolutionLayer biases](self, "biases");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = (void *)v93;
          LODWORD(v102) = v96;
          LODWORD(v103) = v98;
          objc_msgSend(v131, "fusedConvolutionInstanceNormalizationAndNeuronLayerWithDescriptor:beta:gamma:varianceEpsilon:momentum:neuronDescriptor:weights:biasTerms:", v92, v93, v94, v138, v99, v100, v102, v103);
          v15 = objc_claimAutoreleasedReturnValue();

          v68 = (void *)v92;
          v67 = v131;
        }
        else
        {
          objc_opt_class();
          v86 = objc_opt_isKindOfClass();

          -[MLCLayer fusedLayers](self, "fusedLayers");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "objectAtIndexedSubscript:", 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v86 & 1) != 0)
          {
            -[MLCLayer fusedLayers](self, "fusedLayers");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v88, "count");

            if (v89 < 2)
            {
              v138 = 0;
            }
            else
            {
              -[MLCLayer fusedLayers](self, "fusedLayers");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectAtIndexedSubscript:", 1);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "descriptor");
              v138 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v9, "computeEngine");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCConvolutionLayer descriptor](self, "descriptor");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "beta");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "gamma");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "varianceEpsilon");
            v110 = v109;
            v132 = objc_msgSend(v61, "groupCount");
            -[MLCConvolutionLayer weights](self, "weights");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCConvolutionLayer biases](self, "biases");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v113) = 0;
            LODWORD(v114) = v110;
            objc_msgSend(v67, "fusedConvolutionGroupNormalizationAndNeuronLayerWithDescriptor:beta:gamma:varianceEpsilon:momentum:groupCount:neuronDescriptor:weights:biasTerms:", v68, v128, v108, v132, v138, v111, v114, v113, v112);
            v15 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v9, "computeEngine");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "descriptor");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCConvolutionLayer descriptor](self, "descriptor");
            v105 = objc_claimAutoreleasedReturnValue();
            -[MLCConvolutionLayer weights](self, "weights");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[MLCConvolutionLayer biases](self, "biases");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v138 = v104;
            objc_msgSend(v104, "fusedConvolutionAndNeuronLayerWithDescriptor:convolutionDescriptor:weights:biasTerms:", v67, v105, v106, v107);
            v15 = objc_claimAutoreleasedReturnValue();

            v68 = (void *)v105;
          }
        }
      }
    }
    else
    {
      objc_msgSend(v9, "computeEngine");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v66 = objc_claimAutoreleasedReturnValue();
      -[MLCConvolutionLayer weights](self, "weights");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLCConvolutionLayer biases](self, "biases");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = (void *)v66;
      objc_msgSend(v61, "convolutionLayerWithDescriptor:weights:biasTerms:", v66, v67, v68);
      v15 = objc_claimAutoreleasedReturnValue();
    }

    if (v15 && -[NSObject count](v15, "count"))
    {
      objc_msgSend(v9, "computeEngine");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v115, "compileLayerDeviceOps:sourceTensors:resultTensor:", v15, v140, v11);

      v141.receiver = self;
      v141.super_class = (Class)MLCConvolutionLayer;
      -[MLCLayer bindDevice:deviceOps:](&v141, sel_bindDevice_deviceOps_, v9, v15);
      -[MLCLayer fusedLayers](self, "fusedLayers");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "count");

      if (v117)
      {
        v118 = 0;
        do
        {
          -[MLCLayer fusedLayers](self, "fusedLayers");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "objectAtIndexedSubscript:", v118);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "bindDevice:deviceOps:", v9, v15);

          ++v118;
          -[MLCLayer fusedLayers](self, "fusedLayers");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = objc_msgSend(v121, "count");

        }
        while (v118 < v122);
      }
      if (v137 == v136)
      {
LABEL_46:
        v10 = v140;
        goto LABEL_8;
      }
      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setPaddingPolicy:", v134);

      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setPaddingSizeInX:", v133);

      -[MLCConvolutionLayer descriptor](self, "descriptor");
      v123 = objc_claimAutoreleasedReturnValue();
      -[NSObject setPaddingSizeInY:](v123, "setPaddingSizeInY:", v135);
    }
    else
    {
      +[MLCLog framework](MLCLog, "framework");
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:].cold.1(v139);
      v19 = 0;
    }
    v10 = v140;

    goto LABEL_8;
  }
  +[MLCLog framework](MLCLog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[MLCConvolutionLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2, self);
LABEL_7:
  v19 = 0;
LABEL_8:

  return v19;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[MLCConvolutionLayer weightsParameter](self, "weightsParameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allocateDataForOptimizer:device:isVector:", v4, v6, 1);

  -[MLCConvolutionLayer biases](self, "biases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MLCConvolutionLayer biasesParameter](self, "biasesParameter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCLayer device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allocateDataForOptimizer:device:isVector:", v4, v9, 1);

  }
  -[MLCLayer device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "computeEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer weights](self, "weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer biases](self, "biases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConvolutionLayerOptimizerDataForDeviceOps:weights:bias:", v12, v13, v14);

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = a3;
  v6 = a4;
  -[MLCConvolutionLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tensorAllocationSizeInBytes");

  -[MLCConvolutionLayer biases](self, "biases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "tensorAllocationSizeInBytes");

  if (v4)
  {
    v13 = v12 + v9;
    v9 += v9 * objc_msgSend(v6, "numOptimizerDataBuffers");
    v12 += v12 * objc_msgSend(v6, "numOptimizerDataBuffers");
  }
  else
  {
    v13 = 0;
  }
  -[MLCConvolutionLayer weights](self, "weights");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "childLayers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  -[MLCConvolutionLayer biases](self, "biases");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "childLayers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[MLCConvolutionLayer biases](self, "biases");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "childLayers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 /= (unint64_t)objc_msgSend(v21, "count");

  }
  return v12 + v13 + v9 / v16;
}

- (void)allocateGradientsForParameters
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[MLCConvolutionLayer biases](self, "biases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer weights](self, "weights");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v12[0] = v4;
    -[MLCConvolutionLayer biases](self, "biases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[MLCLayer device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer deviceOps](self, "deviceOps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allocateParameterGradientsForDeviceOps:parameters:", v10, v7);

}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  objc_super v15;

  if (a4 >= 2)
  {
    if (a4 == 3)
    {
      v7 = -[MLCLayer kernelWidth](self, "kernelWidth");
      v8 = -[MLCLayer dilationRateInX](self, "dilationRateInX");
      v9 = -[MLCLayer strideInX](self, "strideInX");
      v10 = -[MLCLayer paddingSizeInX](self, "paddingSizeInX");
    }
    else
    {
      v7 = -[MLCLayer kernelHeight](self, "kernelHeight");
      v8 = -[MLCLayer dilationRateInY](self, "dilationRateInY");
      v9 = -[MLCLayer strideInY](self, "strideInY");
      v10 = -[MLCLayer paddingSizeInY](self, "paddingSizeInY");
    }
    v11 = v10;
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isConvolutionTranspose");

    if (v13)
    {
      if (-[MLCLayer paddingPolicy](self, "paddingPolicy"))
      {
        a3 = v8 * (v7 - 1) + v9 * (a3 - 1) + 1;
        if (-[MLCLayer paddingPolicy](self, "paddingPolicy") != 1)
          a3 -= 2 * v11;
      }
      else
      {
        a3 *= v9;
      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)MLCConvolutionLayer;
      return -[MLCLayer resultSizeFromSourceSize:dimension:](&v15, sel_resultSizeFromSourceSize_dimension_, a3, a4);
    }
  }
  return a3;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v9, 0);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "outputFeatureChannelCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, 1);

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "shape");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  if (v16 == 3)
  {
    v22 = -[MLCConvolutionLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v21, 3);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    v25 = v23;
    v26 = 2;
  }
  else
  {
    v27 = -[MLCConvolutionLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", v21, 2);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v28, 2);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "descriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shape");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[MLCConvolutionLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", objc_msgSend(v32, "unsignedIntegerValue"), 3);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    v25 = v23;
    v26 = 3;
  }
  objc_msgSend(v24, "setObject:atIndexedSubscript:", v25, v26);

  v34 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "descriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v34, objc_msgSend(v36, "dataType"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  +[MLCTensor tensorWithDescriptor:](MLCTensor, "tensorWithDescriptor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCConvolutionLayer accumulatorPrecisionOption](self, "accumulatorPrecisionOption");
  -[MLCConvolutionLayer weights](self, "weights");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer biases](self, "biases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { accumulatorPrecisionOption=%d : weights=%@ : biasTerms=%@ : descriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)summarizedDOTDescription
{
  objc_class *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSUInteger v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "paddingPolicy");

  if (v5 < 2)
  {
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)objc_msgSend(v6, "paddingPolicy"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)objc_msgSend(v6, "paddingPolicy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "paddingSizeInX");
    -[MLCConvolutionLayer descriptor](self, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (%lu, %lu)"), v8, v10, objc_msgSend(v11, "paddingSizeInY"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v33 = 0;
LABEL_7:
  v30 = (void *)MEMORY[0x1E0CB3940];
  v29 = -[MLCLayer layerID](self, "layerID");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  MLCConvolutionTypeDebugDescription((MLCConvolutionType)objc_msgSend(v32, "convolutionType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v31, "kernelWidth");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v28, "kernelWidth");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v27, "strideInX");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "strideInY");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "inputFeatureChannelCount");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "outputFeatureChannelCount");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "dilationRateInX");
  -[MLCConvolutionLayer descriptor](self, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Convolution Type: %@<BR />Kernel: (%lu, %lu)     Stride: (%lu, %lu)<BR />Input Feature Channel Count: %lu<BR />Output Feature Channel Count: %lu<BR />Dilation: (%lu, %lu)   Padding: %@</FONT>>"), v34, v29, v26, v25, v24, v23, v13, v15, v17, v19, objc_msgSend(v20, "dilationRateInY"), v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)linkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MLCConvolutionLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[MLCConvolutionLayer biases](self, "biases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCConvolutionLayer biases](self, "biases");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", self);

  }
}

- (void)unlinkAssociatedTensors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MLCConvolutionLayer weights](self, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  -[MLCConvolutionLayer biases](self, "biases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MLCConvolutionLayer biases](self, "biases");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", self);

  }
}

- (unint64_t)parametersCount
{
  void *v2;

  -[MLCConvolutionLayer biasesParameter](self, "biasesParameter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 2;
  else
    return 1;
}

- (MLCConvolutionDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensor)biases
{
  return self->_biases;
}

- (MLCTensorParameter)weightsParameter
{
  return self->_weightsParameter;
}

- (MLCTensorParameter)biasesParameter
{
  return self->_biasesParameter;
}

- (int)accumulatorPrecisionOption
{
  return self->_accumulatorPrecisionOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameter, 0);
  objc_storeStrong((id *)&self->_weightsParameter, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: weights batch size > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.2(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: missing weights", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.3(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: biasTerms batch size > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.4(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: biasTerms width or height size > 1", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)initWithWeights:(const char *)a1 biases:descriptor:.cold.7(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1D4999000, v2, v3, "%@: number of channels in biasTerms does not match output feature channels", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.4(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "biases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: biasTerms tensor used by Convolution cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(void *)a2 resultTensor:.cold.5(const char *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "weights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_1(&dword_1D4999000, v5, v6, "%@: weights tensor used by Convolution cannot have a parent layer=%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_4_1();
}

@end

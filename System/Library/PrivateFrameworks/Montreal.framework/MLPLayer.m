@implementation MLPLayer

- (MLPLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 neuronType:(int)a5 neuronParams:(id)a6
{
  id v11;
  id v12;
  MLPLayer *v13;
  MLPLayer *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  objc_super v42;

  v11 = a4;
  v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)MLPLayer;
  v13 = -[MLPLayer init](&v42, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_layerType = a3;
    objc_storeStrong((id *)&v13->_name, a4);
    v14->_neuronType = a5;
    if (objc_msgSend_count(v12, v15, v16, v17))
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v18, 0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v21, v22, v23, v24);
      v14->_neuronA = v25;

    }
    if ((unint64_t)objc_msgSend_count(v12, v18, v19, v20) >= 2)
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v26, 1, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v29, v30, v31, v32);
      v14->_neuronB = v33;

    }
    if ((unint64_t)objc_msgSend_count(v12, v26, v27, v28) >= 3)
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v34, 2, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v36, v37, v38, v39);
      v14->_neuronC = v40;

    }
  }

  return v14;
}

- (MLPLayer)initWithLayerType:(unint64_t)a3 name:(id)a4 parameters:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  MLPLayer *v13;

  v8 = a4;
  v11 = objc_msgSend_mpsNeuronTypeFromMontrealType_(self, v9, a5->var7[0], v10);
  v13 = (MLPLayer *)objc_msgSend_initWithLayerType_name_neuronType_neuronParams_(self, v12, a3, (uint64_t)v8, v11, 0);

  return v13;
}

- (MLPLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("You must override %@ in a subclass"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v6, v12, *MEMORY[0x1E0C99768], (uint64_t)v11, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

+ (id)layerWithMontrealNode:(id)a3 modelContainer:(void *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MLPEmbeddingLayer *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  MLPDenseLayer *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  MLPConvolutionLayer *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  MLPLossLayer *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  MLPLSTMLayer *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  MLPPoolingLayer *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  MLPDropoutLayer *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  _OWORD v50[3];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;

  v5 = a3;
  v8 = v5;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  memset(v50, 0, sizeof(v50));
  if (v5)
  {
    objc_msgSend_parameters_(v5, v6, (uint64_t)a4, v7);
    v9 = 0;
    switch(*(_QWORD *)&v50[0])
    {
      case 0:
        goto LABEL_5;
      case 2:
        if (*((_QWORD *)&v51 + 1) == 6)
        {
          v45 = [MLPDropoutLayer alloc];
          objc_msgSend_name(v8, v46, v47, v48);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend_initWithName_parameters_(v45, v49, (uint64_t)v14, (uint64_t)v50);
          goto LABEL_6;
        }
        if (*((_QWORD *)&v51 + 1) == 4)
        {
          v30 = [MLPLossLayer alloc];
          objc_msgSend_name(v8, v31, v32, v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend_initWithName_parameters_(v30, v34, (uint64_t)v14, (uint64_t)v50);
          goto LABEL_6;
        }
        v9 = 0;
        break;
      case 4:
      case 0x17:
        v10 = [MLPEmbeddingLayer alloc];
        objc_msgSend_name(v8, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend_initWithName_parameters_(v10, v15, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      case 5:
        v35 = [MLPLSTMLayer alloc];
        objc_msgSend_name(v8, v36, v37, v38);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend_initWithName_parameters_(v35, v39, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      case 0xBLL:
        v25 = [MLPConvolutionLayer alloc];
        objc_msgSend_name(v8, v26, v27, v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend_initWithName_parameters_(v25, v29, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      case 0xCLL:
        v40 = [MLPPoolingLayer alloc];
        objc_msgSend_name(v8, v41, v42, v43);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend_initWithName_parameters_(v40, v44, (uint64_t)v14, (uint64_t)v50);
        goto LABEL_6;
      default:
        break;
    }
  }
  else
  {
    bzero(v50, 0x2C0uLL);
LABEL_5:
    v17 = [MLPDenseLayer alloc];
    objc_msgSend_name(v8, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_initWithName_parameters_(v17, v21, (uint64_t)v14, (uint64_t)v50);
LABEL_6:
    v9 = (void *)v16;

    if (v9)
      objc_msgSend_setNode_(v9, v22, (uint64_t)v8, v23);
  }

  return v9;
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("You must override %@ in a subclass"), v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v12, v18, *MEMORY[0x1E0C99768], (uint64_t)v17, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

- (id)backward:(id)a3 inputGradient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v11, (uint64_t)CFSTR("You must override %@ in a subclass"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v14, *MEMORY[0x1E0C99768], (uint64_t)v13, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v15);
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0C99DA0];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("You must override %@ in a subclass"), v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v12, v18, *MEMORY[0x1E0C99768], (uint64_t)v17, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v19);
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("You must override %@ in a subclass"), v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v11, v17, *MEMORY[0x1E0C99768], (uint64_t)v16, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v18);
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("You must override %@ in a subclass"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v9, v15, *MEMORY[0x1E0C99768], (uint64_t)v14, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5 params:(id *)a6 inputChunks:(id)a7 outputChunks:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  MontrealNNGenerateNode *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = [MontrealNNGenerateNode alloc];
  v22 = objc_msgSend_weightFormat(v15, v19, v20, v21);
  v24 = (void *)objc_msgSend_initWithParameters_weightDataFormat_(v18, v23, (uint64_t)a6, v22);
  objc_msgSend_createInputs_inputChunks_nodeName_(MontrealNNModelTensor, v25, (uint64_t)a6, (uint64_t)v16, v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createOutputs_outputChunks_nodeName_(MontrealNNModelTensor, v27, (uint64_t)a6, (uint64_t)v17, v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addInputs_(v15, v29, (uint64_t)v26, v30);
  objc_msgSend_addOutputs_(v15, v31, (uint64_t)v28, v32);
  objc_msgSend_node(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = objc_msgSend_generateNode_node_weightIter_inputs_outputs_(v24, v37, (uint64_t)v14, (uint64_t)v36, *a5, v26, v28);

  return v24;
}

- (void)createKernel
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("You must override %@ in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v8, *MEMORY[0x1E0C99768], (uint64_t)v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (void)updatePreviousLayer:(id)a3 nextLayer:(id)a4 network:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_setPreviousLayer_(self, v10, (uint64_t)v16, v11);
  objc_msgSend_setNextLayer_(self, v12, (uint64_t)v8, v13);
  objc_msgSend_setNetwork_(self, v14, (uint64_t)v9, v15);

}

- (void)printMatrix:(id)a3 name:(id)a4 cmdBuf:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_network(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v8, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_importDataFromGPU_cmdBuf_(v18, v23, (uint64_t)v22, (uint64_t)v10);

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_19C199E94;
    v26[3] = &unk_1E3D25628;
    v27 = v8;
    v28 = v9;
    objc_msgSend_addCompletedHandler_(v10, v24, (uint64_t)v26, v25);

  }
}

- (int)mpsNeuronTypeFromMontrealType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((unint64_t)a3 >= 9 || ((0x177u >> a3) & 1) == 0)
    sub_19C09C77C(CFSTR("Cannot translate Montreal Activation type to MPS: %tu"), (uint64_t)a2, a3, v3, v4, v5, v6, v7, a3);
  return dword_19C277B40[a3];
}

- (int64_t)montrealTypeFromMPSNeuronType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 >= 6 || ((0x3Bu >> a3) & 1) == 0)
    sub_19C09C77C(CFSTR("Cannot translate MPS Activation type to Montreal: %d"), (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
  return qword_19C277B68[a3];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)layerType
{
  return self->_layerType;
}

- (MontrealNNModelNode)node
{
  return (MontrealNNModelNode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)neuronType
{
  return self->_neuronType;
}

- (float)neuronA
{
  return self->_neuronA;
}

- (float)neuronB
{
  return self->_neuronB;
}

- (float)neuronC
{
  return self->_neuronC;
}

- (unint64_t)inputLength
{
  return self->_inputLength;
}

- (void)setInputLength:(unint64_t)a3
{
  self->_inputLength = a3;
}

- (unint64_t)inputChannels
{
  return self->_inputChannels;
}

- (void)setInputChannels:(unint64_t)a3
{
  self->_inputChannels = a3;
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (unint64_t)outputLength
{
  return self->_outputLength;
}

- (void)setOutputLength:(unint64_t)a3
{
  self->_outputLength = a3;
}

- (MPSKernel)forwardKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setForwardKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (MPSKernel)secondaryForwardKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSecondaryForwardKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (MPSKernel)primaryGradientKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPrimaryGradientKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (MPSKernel)secondaryGradientKernel
{
  return (MPSKernel *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSecondaryGradientKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (MLPLayer)previousLayer
{
  return (MLPLayer *)objc_loadWeakRetained((id *)&self->_previousLayer);
}

- (void)setPreviousLayer:(id)a3
{
  objc_storeWeak((id *)&self->_previousLayer, a3);
}

- (MLPLayer)nextLayer
{
  return (MLPLayer *)objc_loadWeakRetained((id *)&self->_nextLayer);
}

- (void)setNextLayer:(id)a3
{
  objc_storeWeak((id *)&self->_nextLayer, a3);
}

- (MLPNetwork)network
{
  return (MLPNetwork *)objc_loadWeakRetained((id *)&self->_network);
}

- (void)setNetwork:(id)a3
{
  objc_storeWeak((id *)&self->_network, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_network);
  objc_destroyWeak((id *)&self->_nextLayer);
  objc_destroyWeak((id *)&self->_previousLayer);
  objc_storeStrong((id *)&self->_secondaryGradientKernel, 0);
  objc_storeStrong((id *)&self->_primaryGradientKernel, 0);
  objc_storeStrong((id *)&self->_secondaryForwardKernel, 0);
  objc_storeStrong((id *)&self->_forwardKernel, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

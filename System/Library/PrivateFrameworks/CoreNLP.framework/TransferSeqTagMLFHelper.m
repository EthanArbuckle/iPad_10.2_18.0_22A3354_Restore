@implementation TransferSeqTagMLFHelper

- (TransferSeqTagMLFHelper)initWithTraininingParameters:(id)a3
{
  TransferSeqTagMLFHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransferSeqTagMLFHelper;
  v4 = -[TransferSeqTagMLFHelper init](&v6, sel_init);
  if (v4)
    v4->_trainingParameters = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransferSeqTagMLFHelper;
  -[TransferSeqTagMLFHelper dealloc](&v3, sel_dealloc);
}

- (id)createDataWithFloatValue:(float)a3 count:(unint64_t)a4
{
  unint64_t v6;
  float *v7;
  uint64_t v8;
  void *v9;

  v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x9597EF01uLL);
  if (a4)
  {
    v8 = 0;
    do
      v7[v8++] = a3;
    while (a4 > v8);
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v6, 1);
  return (id)objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v9, "mutableBytes"), objc_msgSend(v9, "length"));
}

- (id)createNSDataWithFloatValue:(float)a3 count:(unint64_t)a4
{
  unint64_t v6;
  float *v7;
  uint64_t v8;

  v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x39B910BEuLL);
  if (a4)
  {
    v8 = 0;
    do
      v7[v8++] = a3;
    while (a4 > v8);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v6, 1);
}

- (id)createLSTMFromWeights:(unint64_t)a3 outputSize:(unint64_t)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 biasTerms:(id)a7
{
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__132;
  v28 = __Block_byref_object_dispose__133;
  v12 = (void *)getMLCLSTMDescriptorClass(void)::softClass;
  v29 = getMLCLSTMDescriptorClass(void)::softClass;
  if (!getMLCLSTMDescriptorClass(void)::softClass)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = ___ZL25getMLCLSTMDescriptorClassv_block_invoke;
    v22 = &unk_1E2DF4DD0;
    v23 = &v24;
    ___ZL25getMLCLSTMDescriptorClassv_block_invoke((uint64_t)&v19);
    v12 = (void *)v25[5];
  }
  _Block_object_dispose(&v24, 8);
  LODWORD(v13) = 0;
  v14 = objc_msgSend(v12, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:isBidirectional:dropout:", a3, a4, 1, 1, 1, v13);
  v15 = objc_msgSend((id)getMLCActivationDescriptorClass(), "descriptorWithType:", 3);
  v16 = objc_msgSend((id)getMLCActivationDescriptorClass(), "descriptorWithType:", 5);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__132;
  v28 = __Block_byref_object_dispose__133;
  v17 = (void *)getMLCLSTMLayerClass(void)::softClass;
  v29 = getMLCLSTMLayerClass(void)::softClass;
  if (!getMLCLSTMLayerClass(void)::softClass)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = ___ZL20getMLCLSTMLayerClassv_block_invoke;
    v22 = &unk_1E2DF4DD0;
    v23 = &v24;
    ___ZL20getMLCLSTMLayerClassv_block_invoke((uint64_t)&v19);
    v17 = (void *)v25[5];
  }
  _Block_object_dispose(&v24, 8);
  v30[0] = v15;
  v30[1] = v15;
  v30[2] = v16;
  v30[3] = v15;
  return (id)objc_msgSend(v17, "layerWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:", v14, a5, a6, 0, a7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4), v16);
}

- (id)createLSTM:(unint64_t)a3 outputSize:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v14;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v10 = 0;
  v14 = a3;
  v11 = a4 * a3;
  do
  {
    objc_msgSend(v7, "setObject:atIndexedSubscript:", objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:randomInitializerType:", 1, 1, v11, 1, 2), v10);
    objc_msgSend(v8, "setObject:atIndexedSubscript:", objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:randomInitializerType:", 1, 1, a4 * a4, 1, 2), v10);
    if ((v10 & 0x7FFFFFFFFFFFFFFBLL) == 1)
      *(float *)&v12 = 1.0;
    else
      *(float *)&v12 = 0.0;
    objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a4, 1, -[TransferSeqTagMLFHelper createDataWithFloatValue:count:](self, "createDataWithFloatValue:count:", a4, v12)), v10++);
  }
  while (v10 != 8);
  return -[TransferSeqTagMLFHelper createLSTMFromWeights:outputSize:inputWeights:hiddenWeights:biasTerms:](self, "createLSTMFromWeights:outputSize:inputWeights:hiddenWeights:biasTerms:", v14, a4, v7, v8, v9);
}

- (id)createConvLayerFromData:(unint64_t)a3 width:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8 kernelWeight:(id)a9 kernelBias:(id)a10
{
  uint64_t v14;
  void *MLCTensorClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *MLCConvolutionDescriptorClass;
  uint64_t v20;
  uint64_t v22;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v14 = objc_msgSend((id)getMLCTensorDescriptorClass(), "convolutionWeightsDescriptorWithWidth:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:", a4, a3, a5, a6, 1);
  MLCTensorClass = (void *)getMLCTensorClass();
  v16 = objc_msgSend(MLCTensorClass, "tensorWithDescriptor:data:", v14, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(a9, "mutableBytes"), objc_msgSend(a9, "length")));
  v17 = (void *)getMLCTensorClass();
  v18 = objc_msgSend(v17, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a6, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(a10, "mutableBytes"), objc_msgSend(a10, "length")));
  MLCConvolutionDescriptorClass = (void *)getMLCConvolutionDescriptorClass();
  v26[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v26[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v25[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  LODWORD(v22) = 0;
  return (id)objc_msgSend((id)getMLCConvolutionLayerClass(), "layerWithWeights:biases:descriptor:", v16, v18, objc_msgSend(MLCConvolutionDescriptorClass, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:paddingSizes:", v20, a5, a6, 1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2), &unk_1E2DF9018, v22, &unk_1E2DF9030));
}

- (id)createConvLayerWithKernelHeight:(unint64_t)a3 width:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8
{
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *MLCConvolutionDescriptorClass;
  uint64_t v20;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend((id)getMLCTensorDescriptorClass(), "convolutionWeightsDescriptorWithWidth:height:inputFeatureChannelCount:outputFeatureChannelCount:dataType:", a4, a3, a5, a6, 1);
  v16 = objc_msgSend((id)getMLCTensorClass(), "tensorWithDescriptor:randomInitializerType:", v15, 2);
  LODWORD(v17) = 0;
  v18 = objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a6, 1, -[TransferSeqTagMLFHelper createDataWithFloatValue:count:](self, "createDataWithFloatValue:count:", a6, v17));
  MLCConvolutionDescriptorClass = (void *)getMLCConvolutionDescriptorClass();
  v24[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  LODWORD(v22) = 0;
  return (id)objc_msgSend((id)getMLCConvolutionLayerClass(), "layerWithWeights:biases:descriptor:", v16, v18, objc_msgSend(MLCConvolutionDescriptorClass, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:paddingSizes:", v20, a5, a6, 1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2), &unk_1E2DF9048, v22, &unk_1E2DF9060));
}

- (id)createFullyConnectedLayerFromData:(unint64_t)a3 outputSize:(unint64_t)a4 weightData:(id)a5 biasData:(id)a6
{
  return -[TransferSeqTagMLFHelper createConvLayerFromData:width:inputChannels:outputChannels:strideInX:strideInY:kernelWeight:kernelBias:](self, "createConvLayerFromData:width:inputChannels:outputChannels:strideInX:strideInY:kernelWeight:kernelBias:", 1, 1, a3, a4, 1, 1, a5, a6);
}

- (id)createFullyConnectedLayer:(unint64_t)a3 outputSize:(unint64_t)a4
{
  return -[TransferSeqTagMLFHelper createConvLayerWithKernelHeight:width:inputChannels:outputChannels:strideInX:strideInY:](self, "createConvLayerWithKernelHeight:width:inputChannels:outputChannels:strideInX:strideInY:", 1, 1, a3, a4, 1, 1);
}

- (void)removeBatchingFromDataAndLabels:(void *)a3 batchedLabels:(void *)a4 inputSentences:(void *)a5 inputLabels:(void *)a6 maxLength:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  std::string v23;
  std::string *v24;

  v7 = *(_QWORD *)a3;
  v8 = *((_QWORD *)a3 + 1);
  if (v8 != *(_QWORD *)a3)
  {
    v13 = 0;
    do
    {
      v14 = *(_QWORD *)(v7 + 24 * v13);
      if (*(_QWORD *)(v7 + 24 * v13 + 8) != v14)
      {
        v15 = 0;
        v16 = 0;
        do
        {
          v17 = *(__int128 **)(v14 + v15);
          v18 = -1431655765 * ((*(_QWORD *)(v14 + v15 + 8) - (_QWORD)v17) >> 3);
          if (v18 >= a7)
            v18 = a7;
          v19 = v18;
          memset(&v23, 0, sizeof(v23));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::__wrap_iter<std::string*>,std::__wrap_iter<std::string*>>(&v23, v17, (__int128 *)((char *)v17 + 24 * v18), v18);
          std::vector<std::vector<std::string>>::push_back[abi:ne180100]((uint64_t *)a5, (uint64_t)&v23);
          v24 = &v23;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
          v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v13) + v15);
          memset(&v23, 0, sizeof(v23));
          std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::__wrap_iter<std::vector<int>*>,std::__wrap_iter<std::vector<int>*>>(&v23, v20, v20 + 24 * (int)v19, v19);
          std::vector<std::vector<std::vector<int>>>::push_back[abi:ne180100]((uint64_t *)a6, (uint64_t)&v23);
          v24 = &v23;
          std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
          ++v16;
          v7 = *(_QWORD *)a3;
          v21 = (uint64_t *)(*(_QWORD *)a3 + 24 * v13);
          v14 = *v21;
          v15 += 24;
        }
        while (0xAAAAAAAAAAAAAAABLL * ((v21[1] - *v21) >> 3) > v16);
        v8 = *((_QWORD *)a3 + 1);
      }
      ++v13;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v8 - v7) >> 3) > v13);
  }
}

- (void)getNSSequenceFromStdSequence:(void *)a3 nsSentences:(id)a4 nsSeqLengths:(id)a5 maxLength:(int)a6
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a4;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v8 = 0;
    v9 = a6;
    do
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v16);
      v11 = *(_QWORD *)(*(_QWORD *)a3 + 24 * v8);
      if (*(_QWORD *)(*(_QWORD *)a3 + 24 * v8 + 8) != v11)
      {
        v12 = 0;
        v13 = 0;
        do
        {
          objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:"));
          ++v13;
          v12 += 24;
        }
        while (0xAAAAAAAAAAAAAAABLL
              * ((uint64_t)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v8 + 8) - *(_QWORD *)(*(_QWORD *)a3 + 24 * v8)) >> 3) > v13);
      }
      objc_msgSend(v16, "addObject:", v10);
      v14 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v8 + 8) - *(_QWORD *)(*(_QWORD *)a3 + 24 * v8)) >> 3);
      if (v14 <= v9)
        v15 = v14;
      else
        v15 = a6;
      objc_msgSend(a5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15));
      ++v8;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > v8);
  }
}

- (void)flattenBatchOfOneHotSequences:(void *)a3 flattenedBatch:(void *)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  unint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  int *v19;
  int *v20;
  int v21;
  int *v22;
  uint64_t v23;
  int *__p;
  int *v26;
  int *v27;

  *((_QWORD *)a4 + 1) = *(_QWORD *)a4;
  v5 = *(_QWORD *)a3;
  v4 = *((_QWORD *)a3 + 1);
  if (v4 != *(_QWORD *)a3)
  {
    v7 = 0;
    v23 = (*(_QWORD *)(*(_QWORD *)v5 + 8) - **(_QWORD **)v5) >> 2;
    do
    {
      if ((int)v23 >= 1)
      {
        v8 = 0;
        do
        {
          __p = 0;
          v26 = 0;
          v27 = 0;
          v9 = *(_QWORD *)(*(_QWORD *)a3 + 24 * v7);
          if (*(_QWORD *)(*(_QWORD *)a3 + 24 * v7 + 8) == v9)
          {
            v10 = 0;
            v22 = 0;
          }
          else
          {
            v10 = 0;
            v11 = 0;
            do
            {
              v12 = *(_QWORD *)(v9 + 24 * v11);
              if (v10 >= v27)
              {
                v13 = __p;
                v14 = v10 - __p;
                v15 = v14 + 1;
                if ((unint64_t)(v14 + 1) >> 62)
                  std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                v16 = (char *)v27 - (char *)__p;
                if (((char *)v27 - (char *)__p) >> 1 > v15)
                  v15 = v16 >> 1;
                if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
                  v17 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v17 = v15;
                if (v17)
                {
                  v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v27, v17);
                  v13 = __p;
                  v10 = v26;
                }
                else
                {
                  v18 = 0;
                }
                v19 = (int *)&v18[4 * v14];
                *v19 = *(_DWORD *)(v12 + 4 * v8);
                v20 = v19 + 1;
                while (v10 != v13)
                {
                  v21 = *--v10;
                  *--v19 = v21;
                }
                __p = v19;
                v27 = (int *)&v18[4 * v17];
                if (v13)
                  operator delete(v13);
                v10 = v20;
              }
              else
              {
                *v10++ = *(_DWORD *)(v12 + 4 * v8);
              }
              v26 = v10;
              ++v11;
              v9 = *(_QWORD *)(*(_QWORD *)a3 + 24 * v7);
            }
            while (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)a3 + 24 * v7 + 8) - v9) >> 3) > v11);
            v22 = __p;
          }
          std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>((uint64_t)a4, *((char **)a4 + 1), v22, v10, v10 - v22);
          if (__p)
            operator delete(__p);
          ++v8;
        }
        while (v8 != v23);
        v5 = *(_QWORD *)a3;
        v4 = *((_QWORD *)a3 + 1);
      }
      ++v7;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3) > v7);
  }
}

- (id)findMaxIndexWithData:(id)a3 batchSize:(unint64_t)a4 sequenceLength:(unint64_t)a5 numClasses:(unint64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  float *v16;
  float *v17;
  float *v18;
  _QWORD *v19;
  unint64_t i;
  size_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 8 * a4 * a5;
  v23 = (char *)malloc_type_malloc(v22, 0xE01A531DuLL);
  v10 = objc_msgSend(a3, "bytes");
  v24 = a4;
  if (a4)
  {
    v11 = v10;
    v12 = 0;
    v13 = 8 * a5;
    v14 = 4 * a5;
    do
    {
      if (a5)
      {
        bzero((char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a5);
        memset_pattern16((char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), &unk_191D42340, 4 * a5);
      }
      if (a6)
      {
        v15 = 0;
        v16 = (float *)v11;
        do
        {
          v17 = v16;
          v18 = (float *)((char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
          v19 = (size_t *)((char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
          for (i = a5; i; --i)
          {
            if (*v17 > *v18)
            {
              *v18 = *v17;
              *v19 = v15;
            }
            ++v19;
            ++v18;
            ++v17;
          }
          ++v15;
          v16 = (float *)((char *)v16 + v14);
        }
        while (v15 != a6);
      }
      if (a5)
        memcpy(&v23[v13 * v12], (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a5);
      ++v12;
      v11 += 4 * a6 * a5;
    }
    while (v12 != v24);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v23, v22, 1);
}

- (void)getMaxIndicesFromOneHotVectors:(void *)a3 maxIndicesBatch:(void *)a4
{
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  char *v10;
  BOOL v11;
  _BYTE *v12;
  int v13;
  char *v14;
  int v15;
  int v16;
  BOOL v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  void *v32;
  char *v33;
  uint64_t v34;
  void *__p;
  char *v36;
  char *v37;

  v4 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v6 = 0;
    do
    {
      __p = 0;
      v36 = 0;
      v37 = 0;
      v8 = (uint64_t *)(v4 + 24 * v6);
      v7 = *v8;
      if (v8[1] != *v8)
      {
        v9 = 0;
        do
        {
          v32 = 0;
          v33 = 0;
          v34 = 0;
          std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v32, *(const void **)(v7 + 24 * v9), *(_QWORD *)(v7 + 24 * v9 + 8), (uint64_t)(*(_QWORD *)(v7 + 24 * v9 + 8) - *(_QWORD *)(v7 + 24 * v9)) >> 2);
          v10 = (char *)v32 + 4;
          v11 = v32 == v33 || v10 == v33;
          v12 = v32;
          if (!v11)
          {
            v13 = *(_DWORD *)v32;
            v12 = v32;
            v14 = (char *)v32 + 4;
            do
            {
              v16 = *(_DWORD *)v14;
              v14 += 4;
              v15 = v16;
              v17 = v13 < v16;
              if (v13 <= v16)
                v13 = v15;
              if (v17)
                v12 = v10;
              v10 = v14;
            }
            while (v14 != v33);
          }
          v18 = (unint64_t)(v12 - (_BYTE *)v32) >> 2;
          v19 = v36;
          if (v36 >= v37)
          {
            v21 = (char *)__p;
            v22 = (v36 - (_BYTE *)__p) >> 2;
            v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 62)
              std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
            v24 = v37 - (_BYTE *)__p;
            if ((v37 - (_BYTE *)__p) >> 1 > v23)
              v23 = v24 >> 1;
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
              v25 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v25 = v23;
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v37, v25);
              v21 = (char *)__p;
              v19 = v36;
            }
            else
            {
              v26 = 0;
            }
            v27 = &v26[4 * v22];
            *(_DWORD *)v27 = v18;
            v20 = v27 + 4;
            while (v19 != v21)
            {
              v28 = *((_DWORD *)v19 - 1);
              v19 -= 4;
              *((_DWORD *)v27 - 1) = v28;
              v27 -= 4;
            }
            __p = v27;
            v36 = v20;
            v37 = &v26[4 * v25];
            if (v21)
              operator delete(v21);
          }
          else
          {
            *(_DWORD *)v36 = v18;
            v20 = v19 + 4;
          }
          v36 = v20;
          if (v32)
          {
            v33 = (char *)v32;
            operator delete(v32);
          }
          ++v9;
          v7 = *(_QWORD *)(*(_QWORD *)a3 + 24 * v6);
        }
        while (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)a3 + 24 * v6 + 8) - v7) >> 3) > v9);
      }
      v29 = *((_QWORD *)a4 + 1);
      if (v29 >= *((_QWORD *)a4 + 2))
      {
        v30 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>((uint64_t *)a4, (uint64_t)&__p);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)a4, (uint64_t)&__p);
        v30 = v29 + 24;
      }
      *((_QWORD *)a4 + 1) = v30;
      if (__p)
      {
        v36 = (char *)__p;
        operator delete(__p);
      }
      ++v6;
      v4 = *(_QWORD *)a3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > v6);
  }
}

- (void)printLstmWeights:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  char v18;
  _BYTE v19[15];
  uint8_t buf[4];
  double v21;
  uint8_t v22[4];
  uint64_t v23;
  uint8_t v24[4];
  int v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v4)
    -[TransferSeqTagMLFHelper printLstmWeights:].cold.6(v4, v5, v6);
  if (objc_msgSend((id)objc_msgSend(a3, "inputWeights"), "count"))
  {
    v7 = 0;
    v17 = &v25;
    v8 = MEMORY[0x1E0C81028];
    do
    {
      v26[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "inputWeights", v17), "objectAtIndexedSubscript:", v7), "data");
      v26[1] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "hiddenWeights"), "objectAtIndexedSubscript:", v7), "data");
      v26[2] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "biases"), "objectAtIndexedSubscript:", v7), "data");
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[TransferSeqTagMLFHelper printLstmWeights:].cold.5(&v18, v19);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[TransferSeqTagMLFHelper printLstmWeights:].cold.4(v24, v7, v17);
      if (objc_msgSend(v9, "count"))
      {
        v10 = 0;
        do
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            -[TransferSeqTagMLFHelper printLstmWeights:].cold.3(v22, v10, &v23);
          v11 = (void *)objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
          if ((unint64_t)objc_msgSend(v11, "length") >= 4)
          {
            v12 = 0;
            do
            {
              v13 = objc_msgSend(v11, "bytes");
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
                -[TransferSeqTagMLFHelper printLstmWeights:].cold.2(v13, v12, buf, &v21);
              ++v12;
            }
            while (v12 < (unint64_t)objc_msgSend(v11, "length") >> 2);
          }
          ++v10;
        }
        while (objc_msgSend(v9, "count") > v10);
      }
      ++v7;
    }
    while (v7 < objc_msgSend((id)objc_msgSend(a3, "inputWeights"), "count"));
  }
  v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v14)
    -[TransferSeqTagMLFHelper printLstmWeights:].cold.1(v14, v15, v16);
}

- (void)getEmbeddingsForSequenceData:(void *)a3 batchSize:(int)a4 maxLength:(int)a5 embeddingRef:(void *)a6 inputTensorDataItems:(void *)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t Dimension;
  void *v17;
  void *v18;
  int v19;
  void *__p[3];
  void *v21;
  _BYTE *v22;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v13 = a4;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  -[TransferSeqTagMLFHelper getNSSequenceFromStdSequence:nsSentences:nsSeqLengths:maxLength:](self, "getNSSequenceFromStdSequence:nsSentences:nsSeqLengths:maxLength:", a3, v14, objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13), v9);
  Dimension = (unint64_t)NLStringEmbeddingGetDimension((CoreNLP *)a6, v15);
  LODWORD(__p[0]) = 0;
  std::vector<float>::vector(&v21, (int)v9 * (uint64_t)(int)v10 * Dimension, __p);
  v19 = 0;
  std::vector<float>::vector(__p, Dimension, &v19);
  NLStringEmbeddingFillWordVectorsWithShape((CoreNLP *)a6, v14, v10, v9, (char *)v21, 0, (uint64_t)__p[0], 1);
  v17 = malloc_type_malloc(v22 - (_BYTE *)v21, 0x100004052888210uLL);
  memcpy(v17, v21, v22 - (_BYTE *)v21);
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v17, v22 - (_BYTE *)v21, 1);
  **(_QWORD **)a7 = objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v18, "mutableBytes"), objc_msgSend(v18, "length"));
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }
}

- (void)getInputEmbeddingsAndTargetTensorsForSequenceData:(void *)a3 seqLabels:(void *)a4 batchSize:(int)a5 maxLength:(int)a6 numClasses:(int)a7 embeddingRef:(void *)a8 inputTensorDataItems:(void *)a9 targetTensorData:(id *)a10 targetWeightTensorData:(id *)a11
{
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *__p;
  _BYTE *v28;
  uint64_t v29;
  std::vector<int>::value_type v30[2];
  uint64_t v31;
  uint64_t v32;
  std::vector<int> __x;
  std::vector<int> v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;

  -[TransferSeqTagMLFHelper getEmbeddingsForSequenceData:batchSize:maxLength:embeddingRef:inputTensorDataItems:](self, "getEmbeddingsForSequenceData:batchSize:maxLength:embeddingRef:inputTensorDataItems:", a3, *(_QWORD *)&a5, *(_QWORD *)&a6, a8, a9);
  v35 = 0;
  v36 = 0;
  v37 = 0;
  LODWORD(__x.__begin_) = 1;
  std::vector<int>::vector(&v34, a7, (const std::vector<int>::value_type *)&__x);
  v30[0] = 0;
  std::vector<int>::vector(&__x, a7, v30);
  v16 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v17 = 0;
    v18 = 0;
    do
    {
      *(_QWORD *)v30 = 0;
      v31 = 0;
      v32 = 0;
      std::vector<std::vector<int>>::assign((uint64_t *)v30, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v16 + v17 + 8) - *(_QWORD *)(v16 + v17)) >> 3), (uint64_t)&v34);
      std::vector<std::vector<int>>::resize((uint64_t *)v30, a6, (uint64_t)&__x);
      v19 = v36;
      if ((unint64_t)v36 >= v37)
      {
        v20 = std::vector<std::vector<std::vector<int>>>::__push_back_slow_path<std::vector<std::vector<int>> const&>(&v35, (uint64_t *)v30);
      }
      else
      {
        *v36 = 0;
        v19[1] = 0;
        v19[2] = 0;
        std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(v19, *(uint64_t *)v30, v31, 0xAAAAAAAAAAAAAAABLL * ((v31 - *(_QWORD *)v30) >> 3));
        v20 = (uint64_t)(v19 + 3);
      }
      v36 = (_QWORD *)v20;
      __p = v30;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      ++v18;
      v16 = *(_QWORD *)a3;
      v17 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > v18);
  }
  *(_QWORD *)v30 = 0;
  v31 = 0;
  v32 = 0;
  -[TransferSeqTagMLFHelper flattenBatchOfOneHotSequences:flattenedBatch:](self, "flattenBatchOfOneHotSequences:flattenedBatch:", a4, v30);
  v21 = v31 - *(_QWORD *)v30;
  v22 = malloc_type_malloc(v31 - *(_QWORD *)v30, 0x54A998BBuLL);
  memcpy(v22, *(const void **)v30, v31 - *(_QWORD *)v30);
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v22, v21, 1);
  *a10 = (id)objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v23, "mutableBytes"), objc_msgSend(v23, "length"));
  __p = 0;
  v28 = 0;
  v29 = 0;
  -[TransferSeqTagMLFHelper flattenBatchOfOneHotSequences:flattenedBatch:](self, "flattenBatchOfOneHotSequences:flattenedBatch:", &v35, &__p);
  v24 = v28 - (_BYTE *)__p;
  v25 = malloc_type_malloc(v28 - (_BYTE *)__p, 0x558BA8AFuLL);
  memcpy(v25, __p, v28 - (_BYTE *)__p);
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v25, v24, 1);
  *a11 = (id)objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v26, "mutableBytes"), objc_msgSend(v26, "length"));
  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  if (*(_QWORD *)v30)
  {
    v31 = *(_QWORD *)v30;
    operator delete(*(void **)v30);
  }
  if (__x.__begin_)
  {
    __x.__end_ = __x.__begin_;
    operator delete(__x.__begin_);
  }
  if (v34.__begin_)
  {
    v34.__end_ = v34.__begin_;
    operator delete(v34.__begin_);
  }
  v34.__begin_ = (std::vector<int>::pointer)&v35;
  std::vector<std::vector<std::vector<int>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
}

- (id)getModelLayerWeights:(vector<void *)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  unint64_t v13;
  int v14;
  CoreNLP::MontrealModel *v15;
  const void *v16;
  uint64_t j;
  void *v19;
  _QWORD v20[4];
  _QWORD __src[88];
  uint64_t v22[3];
  __int128 v23;
  char v24;
  _QWORD v25[90];

  v25[88] = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = *a3->var0;
  v4 = (void *)*((_QWORD *)a3->var0 + 1);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(v6, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "biases"), "objectAtIndexedSubscript:", i), "data"));
    objc_msgSend(v7, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "inputWeights"), "objectAtIndexedSubscript:", i), "data"));
    objc_msgSend(v8, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "hiddenWeights"), "objectAtIndexedSubscript:", i), "data"));
    objc_msgSend(v9, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "biases"), "objectAtIndexedSubscript:", i + 4), "data"));
    objc_msgSend(v10, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "inputWeights"), "objectAtIndexedSubscript:", i + 4), "data"));
    objc_msgSend(v11, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "hiddenWeights"), "objectAtIndexedSubscript:", i + 4), "data"));
  }
  v13 = (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "biases"), "objectAtIndexedSubscript:", 0), "data"), "length") >> 1;
  memset(v22, 0, sizeof(v22));
  bzero(__src, 0x2C0uLL);
  __src[0] = 6;
  __src[15] |= 0x80uLL;
  LODWORD(__src[16]) = v13;
  if ((v13 & 0x80000000) == 0)
    v14 = v13;
  else
    v14 = v13 + 1;
  LODWORD(__src[32]) = v14 >> 1;
  __src[56] = objc_msgSend(v7, "bytes");
  __src[57] = objc_msgSend(v8, "bytes");
  __src[72] = objc_msgSend(v6, "bytes");
  __src[58] = objc_msgSend(v10, "bytes");
  __src[59] = objc_msgSend(v11, "bytes");
  __src[74] = objc_msgSend(v9, "bytes");
  std::string::basic_string[abi:ne180100]<0>(&v23, "lstm");
  memcpy(v25, __src, 0x2C0uLL);
  std::vector<std::pair<std::string,MRLNeuralNetworkNodeParameter>>::push_back[abi:ne180100](v22, &v23);
  if (v24 < 0)
    operator delete((void *)v23);
  bzero(__src, 0x2C0uLL);
  __src[0] = 0;
  __src[7] = 4;
  LODWORD(__src[16]) = v13;
  LODWORD(__src[32]) = (unint64_t)(int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "biases"), "data"), "length") >> 2;
  __src[56] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "weights"), "data"), "bytes");
  __src[72] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "biases"), "data"), "bytes");
  std::string::basic_string[abi:ne180100]<0>(&v23, "softmax");
  memcpy(v25, __src, 0x2C0uLL);
  std::vector<std::pair<std::string,MRLNeuralNetworkNodeParameter>>::push_back[abi:ne180100](v22, &v23);
  if (v24 < 0)
    operator delete((void *)v23);
  v15 = (CoreNLP::MontrealModel *)operator new();
  CoreNLP::MontrealModel::MontrealModel(v15, v22);
  v20[3] = v15;
  std::string::basic_string[abi:ne180100]<0>(&v23, "lstm");
  LODWORD(v25[0]) = 0x40000000;
  std::string::basic_string[abi:ne180100]<0>(&v25[1], "softmax");
  LODWORD(v25[4]) = 0x40000000;
  std::map<std::string,float>::map[abi:ne180100]((uint64_t)v20, (const void **)&v23, 2);
  v16 = (const void *)CoreNLP::MontrealModel::copyInt8ModelData(v15, v20);
  std::__tree<std::string>::destroy((uint64_t)v20, (char *)v20[1]);
  for (j = 0; j != -8; j -= 4)
  {
    if (SHIBYTE(v25[j + 3]) < 0)
      operator delete((void *)v25[j + 1]);
  }
  objc_msgSend(v19, "addObject:", v16);
  CFRelease(v16);
  CoreNLP::MontrealModel::~MontrealModel(v15);
  MEMORY[0x19401E994]();
  *(_QWORD *)&v23 = v22;
  std::vector<std::pair<std::string,MRLNeuralNetworkNodeParameter>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
  return v19;
}

- (BOOL)loadModelLayersFromWeights:(id)a3 labelSize:(unint64_t)a4 embeddingDimension:(int64_t)a5 modelLayers:(void *)a6
{
  int v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *MLCTensorClass;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  unint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  int v52;
  void *v55;
  void *v56;
  uint64_t v57;

  v6 = a5;
  v56 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v55 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v9 = 0;
  v10 = 0;
  if (v6 >= 0)
    v11 = v6;
  else
    v11 = v6 + 1;
  v52 = v6;
  v12 = (v11 >> 1) * v6;
  v13 = ((v11 >> 1) * (v11 >> 1));
  v57 = (uint64_t)v11 >> 1;
  do
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    for (i = 0; i != 3; ++i)
      objc_msgSend(v14, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", v9 + i));
    MLCTensorClass = (void *)getMLCTensorClass();
    objc_msgSend(v56, "setObject:atIndexedSubscript:", objc_msgSend(MLCTensorClass, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, v12, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "mutableBytes"), objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "length"))), v10);
    v17 = (void *)getMLCTensorClass();
    objc_msgSend(v55, "setObject:atIndexedSubscript:", objc_msgSend(v17, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, v13, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 1), "mutableBytes"), objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 1), "length"))), v10);
    v18 = (void *)getMLCTensorClass();
    objc_msgSend(v8, "setObject:atIndexedSubscript:", objc_msgSend(v18, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, v57, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 2), "mutableBytes"), objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 2), "length"))), v10++);
    v9 += 3;
  }
  while (v10 != 8);
  v19 = -[TransferSeqTagMLFHelper createLSTMFromWeights:outputSize:inputWeights:hiddenWeights:biasTerms:](self, "createLSTMFromWeights:outputSize:inputWeights:hiddenWeights:biasTerms:", v52, v57, v56, v55, v8);
  v20 = objc_msgSend(v19, "descriptor");
  v21 = v20 != 0;
  if (v20)
  {
    v22 = *((_QWORD *)a6 + 2);
    v23 = (_QWORD *)*((_QWORD *)a6 + 1);
    if ((unint64_t)v23 >= v22)
    {
      v25 = ((uint64_t)v23 - *(_QWORD *)a6) >> 3;
      if ((unint64_t)(v25 + 1) >> 61)
        goto LABEL_46;
      v26 = v22 - *(_QWORD *)a6;
      v27 = v26 >> 2;
      if (v26 >> 2 <= (unint64_t)(v25 + 1))
        v27 = v25 + 1;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
        v28 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v28 = v27;
      if (v28)
        v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a6 + 16, v28);
      else
        v29 = 0;
      v30 = &v29[8 * v25];
      v31 = &v29[8 * v28];
      *(_QWORD *)v30 = v19;
      v24 = v30 + 8;
      v33 = *(char **)a6;
      v32 = (char *)*((_QWORD *)a6 + 1);
      if (v32 != *(char **)a6)
      {
        do
        {
          v34 = *((_QWORD *)v32 - 1);
          v32 -= 8;
          *((_QWORD *)v30 - 1) = v34;
          v30 -= 8;
        }
        while (v32 != v33);
        v32 = *(char **)a6;
      }
      *(_QWORD *)a6 = v30;
      *((_QWORD *)a6 + 1) = v24;
      *((_QWORD *)a6 + 2) = v31;
      if (v32)
        operator delete(v32);
    }
    else
    {
      *v23 = v19;
      v24 = v23 + 1;
    }
    *((_QWORD *)a6 + 1) = v24;
  }
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v35, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", 24));
  objc_msgSend(v35, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", 25));
  v36 = -[TransferSeqTagMLFHelper createFullyConnectedLayerFromData:outputSize:weightData:biasData:](self, "createFullyConnectedLayerFromData:outputSize:weightData:biasData:", 2 * (int)v57, a4, objc_msgSend(v35, "objectAtIndexedSubscript:", 0), objc_msgSend(v35, "objectAtIndexedSubscript:", 1));
  if (objc_msgSend(v36, "descriptor"))
  {
    v37 = *((_QWORD *)a6 + 2);
    v38 = (_QWORD *)*((_QWORD *)a6 + 1);
    if ((unint64_t)v38 < v37)
    {
      *v38 = v36;
      v39 = v38 + 1;
LABEL_44:
      *((_QWORD *)a6 + 1) = v39;
      return v21;
    }
    v40 = ((uint64_t)v38 - *(_QWORD *)a6) >> 3;
    if (!((unint64_t)(v40 + 1) >> 61))
    {
      v41 = v37 - *(_QWORD *)a6;
      v42 = v41 >> 2;
      if (v41 >> 2 <= (unint64_t)(v40 + 1))
        v42 = v40 + 1;
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8)
        v43 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v43 = v42;
      if (v43)
        v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a6 + 16, v43);
      else
        v44 = 0;
      v45 = &v44[8 * v40];
      v46 = &v44[8 * v43];
      *(_QWORD *)v45 = v36;
      v39 = v45 + 8;
      v48 = *(char **)a6;
      v47 = (char *)*((_QWORD *)a6 + 1);
      if (v47 != *(char **)a6)
      {
        do
        {
          v49 = *((_QWORD *)v47 - 1);
          v47 -= 8;
          *((_QWORD *)v45 - 1) = v49;
          v45 -= 8;
        }
        while (v47 != v48);
        v47 = *(char **)a6;
      }
      *(_QWORD *)a6 = v45;
      *((_QWORD *)a6 + 1) = v39;
      *((_QWORD *)a6 + 2) = v46;
      if (v47)
        operator delete(v47);
      goto LABEL_44;
    }
LABEL_46:
    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
  }
  return 0;
}

- (id)createGraphObjectFromLayers:(void *)a3 graphObject:(id)a4 inputPlaceholders:(void *)a5
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  void *v21;
  double v22;
  void *v23;
  uint64_t *__p;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  Class (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;

  __p = 0;
  v5 = 0;
  v29 = 0;
  v30 = 0;
  do
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3052000000;
    v39 = __Block_byref_object_copy__132;
    v40 = __Block_byref_object_dispose__133;
    v6 = (void *)getMLCArithmeticLayerClass(void)::softClass;
    v41 = getMLCArithmeticLayerClass(void)::softClass;
    if (!getMLCArithmeticLayerClass(void)::softClass)
    {
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = ___ZL26getMLCArithmeticLayerClassv_block_invoke;
      v34 = &unk_1E2DF4DD0;
      v35 = &v36;
      ___ZL26getMLCArithmeticLayerClassv_block_invoke((uint64_t)&v31);
      v6 = (void *)v37[5];
    }
    _Block_object_dispose(&v36, 8);
    v7 = objc_msgSend(v6, "layerWithOperation:", 2);
    v8 = v7;
    if (v29 >= v30)
    {
      v10 = v29 - __p;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
      v11 = ((char *)v30 - (char *)__p) >> 2;
      if (v11 <= v10 + 1)
        v11 = v10 + 1;
      if ((unint64_t)((char *)v30 - (char *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v12 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v12 = v11;
      if (v12)
        v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v30, v12);
      else
        v13 = 0;
      v14 = (uint64_t *)&v13[8 * v10];
      *v14 = v8;
      v9 = v14 + 1;
      v15 = v29;
      if (v29 != __p)
      {
        do
        {
          v16 = *--v15;
          *--v14 = v16;
        }
        while (v15 != __p);
        v15 = __p;
      }
      __p = v14;
      v30 = (uint64_t *)&v13[8 * v12];
      if (v15)
        operator delete(v15);
    }
    else
    {
      *v29 = v7;
      v9 = v29 + 1;
    }
    v29 = v9;
    ++v5;
  }
  while (v5 != 3);
  v17 = **(_QWORD **)a5;
  v18 = **(_QWORD **)a3;
  v19 = time(0);
  srand(v19);
  v20 = rand();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__132;
  v40 = __Block_byref_object_dispose__133;
  v21 = (void *)getMLCDropoutLayerClass(void)::softClass;
  v41 = getMLCDropoutLayerClass(void)::softClass;
  if (!getMLCDropoutLayerClass(void)::softClass)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = ___ZL23getMLCDropoutLayerClassv_block_invoke;
    v34 = &unk_1E2DF4DD0;
    v35 = &v36;
    ___ZL23getMLCDropoutLayerClassv_block_invoke((uint64_t)&v31);
    v21 = (void *)v37[5];
  }
  _Block_object_dispose(&v36, 8);
  LODWORD(v22) = 1045220557;
  v23 = (void *)objc_msgSend(a4, "nodeWithLayer:source:", *(_QWORD *)(*(_QWORD *)a3 + 8), objc_msgSend(a4, "nodeWithLayer:source:", objc_msgSend(v21, "layerWithRate:seed:", v20, v22), objc_msgSend(a4, "nodeWithLayer:source:", v18, v17)));
  if (__p)
    operator delete(__p);
  return v23;
}

- (void)createGraphObjectAndLayersFromInputPlaceholders:(void *)a3 scalarWeights:(void *)a4 labelSize:(unint64_t)a5 embeddingDimension:(int64_t)a6 graphObject:(id)a7 graphLayerList:(void *)a8
{
  int v9;
  uint64_t v11;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  int v26;
  id v27;
  id v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  id v42;
  id v43;
  unint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  id v57;
  id v58;
  unint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;

  v9 = a6;
  v11 = *(_QWORD *)a4;
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    v13 = 0;
    v14 = (char *)a8 + 16;
    v15 = (_QWORD *)*((_QWORD *)a8 + 1);
    do
    {
      v16 = *(_QWORD *)(v11 + 8 * v13);
      if ((unint64_t)v15 >= *v14)
      {
        v17 = ((uint64_t)v15 - *(_QWORD *)a8) >> 3;
        if ((unint64_t)(v17 + 1) >> 61)
          goto LABEL_72;
        v18 = *v14 - *(_QWORD *)a8;
        v19 = v18 >> 2;
        if (v18 >> 2 <= (unint64_t)(v17 + 1))
          v19 = v17 + 1;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
          v20 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        if (v20)
          v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v20);
        else
          v21 = 0;
        v22 = &v21[8 * v17];
        *(_QWORD *)v22 = v16;
        v15 = v22 + 8;
        v24 = *(char **)a8;
        v23 = (char *)*((_QWORD *)a8 + 1);
        if (v23 != *(char **)a8)
        {
          do
          {
            v25 = *((_QWORD *)v23 - 1);
            v23 -= 8;
            *((_QWORD *)v22 - 1) = v25;
            v22 -= 8;
          }
          while (v23 != v24);
          v23 = *(char **)a8;
        }
        *(_QWORD *)a8 = v22;
        *((_QWORD *)a8 + 1) = v15;
        *((_QWORD *)a8 + 2) = &v21[8 * v20];
        if (v23)
          operator delete(v23);
      }
      else
      {
        *v15++ = v16;
      }
      *((_QWORD *)a8 + 1) = v15;
      ++v13;
      v11 = *(_QWORD *)a4;
    }
    while (v13 < (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  }
  if (v9 >= 0)
    v26 = v9;
  else
    v26 = v9 + 1;
  v27 = -[TransferSeqTagMLFHelper createLSTM:outputSize:](self, "createLSTM:outputSize:", v9, (uint64_t)v26 >> 1);
  v28 = v27;
  v29 = *((_QWORD *)a8 + 2);
  v30 = (_QWORD *)*((_QWORD *)a8 + 1);
  if ((unint64_t)v30 >= v29)
  {
    v32 = ((uint64_t)v30 - *(_QWORD *)a8) >> 3;
    if ((unint64_t)(v32 + 1) >> 61)
      goto LABEL_72;
    v33 = v29 - *(_QWORD *)a8;
    v34 = v33 >> 2;
    if (v33 >> 2 <= (unint64_t)(v32 + 1))
      v34 = v32 + 1;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
      v35 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v35 = v34;
    if (v35)
      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v35);
    else
      v36 = 0;
    v37 = &v36[8 * v32];
    v38 = &v36[8 * v35];
    *(_QWORD *)v37 = v28;
    v31 = v37 + 8;
    v40 = *(char **)a8;
    v39 = (char *)*((_QWORD *)a8 + 1);
    if (v39 != *(char **)a8)
    {
      do
      {
        v41 = *((_QWORD *)v39 - 1);
        v39 -= 8;
        *((_QWORD *)v37 - 1) = v41;
        v37 -= 8;
      }
      while (v39 != v40);
      v39 = *(char **)a8;
    }
    *(_QWORD *)a8 = v37;
    *((_QWORD *)a8 + 1) = v31;
    *((_QWORD *)a8 + 2) = v38;
    if (v39)
      operator delete(v39);
  }
  else
  {
    *v30 = v27;
    v31 = v30 + 1;
  }
  *((_QWORD *)a8 + 1) = v31;
  v42 = -[TransferSeqTagMLFHelper createFullyConnectedLayer:outputSize:](self, "createFullyConnectedLayer:outputSize:", (int)(v26 & 0xFFFFFFFE), a5);
  v43 = v42;
  v45 = (_QWORD *)*((_QWORD *)a8 + 1);
  v44 = *((_QWORD *)a8 + 2);
  if ((unint64_t)v45 >= v44)
  {
    v47 = ((uint64_t)v45 - *(_QWORD *)a8) >> 3;
    if ((unint64_t)(v47 + 1) >> 61)
      goto LABEL_72;
    v48 = v44 - *(_QWORD *)a8;
    v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1))
      v49 = v47 + 1;
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
      v50 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v50 = v49;
    if (v50)
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v50);
    else
      v51 = 0;
    v52 = &v51[8 * v47];
    v53 = &v51[8 * v50];
    *(_QWORD *)v52 = v43;
    v46 = v52 + 8;
    v55 = *(char **)a8;
    v54 = (char *)*((_QWORD *)a8 + 1);
    if (v54 != *(char **)a8)
    {
      do
      {
        v56 = *((_QWORD *)v54 - 1);
        v54 -= 8;
        *((_QWORD *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      v54 = *(char **)a8;
    }
    *(_QWORD *)a8 = v52;
    *((_QWORD *)a8 + 1) = v46;
    *((_QWORD *)a8 + 2) = v53;
    if (v54)
      operator delete(v54);
  }
  else
  {
    *v45 = v42;
    v46 = v45 + 1;
  }
  *((_QWORD *)a8 + 1) = v46;
  v57 = -[TransferSeqTagMLFHelper createGraphObjectFromLayers:graphObject:inputPlaceholders:](self, "createGraphObjectFromLayers:graphObject:inputPlaceholders:", a8, a7, a3);
  v58 = v57;
  v60 = (_QWORD *)*((_QWORD *)a8 + 1);
  v59 = *((_QWORD *)a8 + 2);
  if ((unint64_t)v60 < v59)
  {
    *v60 = v57;
    v61 = v60 + 1;
    goto LABEL_71;
  }
  v62 = ((uint64_t)v60 - *(_QWORD *)a8) >> 3;
  if ((unint64_t)(v62 + 1) >> 61)
LABEL_72:
    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
  v63 = v59 - *(_QWORD *)a8;
  v64 = v63 >> 2;
  if (v63 >> 2 <= (unint64_t)(v62 + 1))
    v64 = v62 + 1;
  if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8)
    v65 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v65 = v64;
  if (v65)
    v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v65);
  else
    v66 = 0;
  v67 = &v66[8 * v62];
  v68 = &v66[8 * v65];
  *(_QWORD *)v67 = v58;
  v61 = v67 + 8;
  v70 = *(char **)a8;
  v69 = (char *)*((_QWORD *)a8 + 1);
  if (v69 != *(char **)a8)
  {
    do
    {
      v71 = *((_QWORD *)v69 - 1);
      v69 -= 8;
      *((_QWORD *)v67 - 1) = v71;
      v67 -= 8;
    }
    while (v69 != v70);
    v69 = *(char **)a8;
  }
  *(_QWORD *)a8 = v67;
  *((_QWORD *)a8 + 1) = v61;
  *((_QWORD *)a8 + 2) = v68;
  if (v69)
    operator delete(v69);
LABEL_71:
  *((_QWORD *)a8 + 1) = v61;
}

- (id)createTrainingGraphFromGraphObject:(id)a3 inputPlaceholders:(void *)a4 scalarWeights:(void *)a5 targetLabels:(id)a6 targeLabelWeights:(id)a7 device:(id)a8
{
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v37;
  uint64_t v38;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  Class (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__132;
  v51 = __Block_byref_object_dispose__133;
  v12 = (void *)getMLCLossDescriptorClass(void)::softClass;
  v52 = getMLCLossDescriptorClass(void)::softClass;
  if (!getMLCLossDescriptorClass(void)::softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = ___ZL25getMLCLossDescriptorClassv_block_invoke;
    v45 = &unk_1E2DF4DD0;
    v46 = &v47;
    ___ZL25getMLCLossDescriptorClassv_block_invoke((uint64_t)&v42);
    v12 = (void *)v48[5];
  }
  v37 = a8;
  _Block_object_dispose(&v47, 8);
  v13 = objc_msgSend(v12, "descriptorWithType:reductionType:", 2, 2);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__132;
  v51 = __Block_byref_object_dispose__133;
  v14 = (void *)getMLCLossLayerClass(void)::softClass;
  v52 = getMLCLossLayerClass(void)::softClass;
  if (!getMLCLossLayerClass(void)::softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = ___ZL20getMLCLossLayerClassv_block_invoke;
    v45 = &unk_1E2DF4DD0;
    v46 = &v47;
    ___ZL20getMLCLossLayerClassv_block_invoke((uint64_t)&v42);
    v14 = (void *)v48[5];
  }
  _Block_object_dispose(&v47, 8);
  v15 = objc_msgSend(v14, "layerWithDescriptor:", v13);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__132;
  v51 = __Block_byref_object_dispose__133;
  v16 = (void *)getMLCOptimizerDescriptorClass(void)::softClass;
  v52 = getMLCOptimizerDescriptorClass(void)::softClass;
  if (!getMLCOptimizerDescriptorClass(void)::softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = ___ZL30getMLCOptimizerDescriptorClassv_block_invoke;
    v45 = &unk_1E2DF4DD0;
    v46 = &v47;
    ___ZL30getMLCOptimizerDescriptorClassv_block_invoke((uint64_t)&v42);
    v16 = (void *)v48[5];
  }
  _Block_object_dispose(&v47, 8);
  LODWORD(v17) = 970045207;
  LODWORD(v18) = 1.0;
  LODWORD(v19) = 1.0;
  v20 = objc_msgSend(v16, "descriptorWithLearningRate:gradientRescale:regularizationType:regularizationScale:", 0, v17, v18, v19);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__132;
  v51 = __Block_byref_object_dispose__133;
  v21 = (void *)getMLCAdamOptimizerClass(void)::softClass;
  v52 = getMLCAdamOptimizerClass(void)::softClass;
  if (!getMLCAdamOptimizerClass(void)::softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = ___ZL24getMLCAdamOptimizerClassv_block_invoke;
    v45 = &unk_1E2DF4DD0;
    v46 = &v47;
    ___ZL24getMLCAdamOptimizerClassv_block_invoke((uint64_t)&v42);
    v21 = (void *)v48[5];
  }
  _Block_object_dispose(&v47, 8);
  LODWORD(v22) = 1063675494;
  LODWORD(v23) = 1065336439;
  LODWORD(v24) = 841731191;
  v25 = objc_msgSend(v21, "optimizerWithDescriptor:beta1:beta2:epsilon:timeStep:", v20, 1, v22, v23, v24);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__132;
  v51 = __Block_byref_object_dispose__133;
  v26 = (void *)getMLCTrainingGraphClass(void)::softClass;
  v52 = getMLCTrainingGraphClass(void)::softClass;
  if (!getMLCTrainingGraphClass(void)::softClass)
  {
    v42 = MEMORY[0x1E0C809B0];
    v43 = 3221225472;
    v44 = ___ZL24getMLCTrainingGraphClassv_block_invoke;
    v45 = &unk_1E2DF4DD0;
    v46 = &v47;
    ___ZL24getMLCTrainingGraphClassv_block_invoke((uint64_t)&v42);
    v26 = (void *)v48[5];
  }
  _Block_object_dispose(&v47, 8);
  v57[0] = a3;
  v41 = (void *)objc_msgSend(v26, "graphWithGraphObjects:lossLayer:optimizer:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1), v15, v25);
  v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = *(_QWORD *)a4;
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    v29 = 0;
    do
    {
      objc_msgSend(v27, "setObject:forKey:", *(_QWORD *)(v28 + 8 * v29), objc_msgSend(*(id *)(v28 + 8 * v29), "label", v37));
      ++v29;
      v28 = *(_QWORD *)a4;
    }
    while (v29 < (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  }
  v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3, v37);
  v31 = *(_QWORD *)a5;
  if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
  {
    v32 = 0;
    v33 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v27, "setObject:forKey:", *(_QWORD *)(v31 + 8 * v32), objc_msgSend(*(id *)(v31 + 8 * v32), "label"));
      v47 = 0;
      v48 = &v47;
      v49 = 0x3052000000;
      v50 = __Block_byref_object_copy__132;
      v51 = __Block_byref_object_dispose__133;
      v34 = (void *)getMLCTensorParameterClass(void)::softClass;
      v52 = getMLCTensorParameterClass(void)::softClass;
      if (!getMLCTensorParameterClass(void)::softClass)
      {
        v42 = v33;
        v43 = 3221225472;
        v44 = ___ZL26getMLCTensorParameterClassv_block_invoke;
        v45 = &unk_1E2DF4DD0;
        v46 = &v47;
        ___ZL26getMLCTensorParameterClassv_block_invoke((uint64_t)&v42);
        v34 = (void *)v48[5];
      }
      _Block_object_dispose(&v47, 8);
      objc_msgSend(v30, "addObject:", objc_msgSend(v34, "parameterWithTensor:optimizerData:", *(_QWORD *)(*(_QWORD *)a5 + 8 * v32++), 0));
      v31 = *(_QWORD *)a5;
    }
    while (v32 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
  }
  v55 = objc_msgSend(a6, "label");
  v56 = a6;
  v35 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v53 = objc_msgSend(a7, "label");
  v54 = a7;
  objc_msgSend(v41, "addInputs:lossLabels:lossLabelWeights:", v27, v35, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
  if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
    objc_msgSend(v41, "setTrainingTensorParameters:", v30);
  objc_msgSend(v41, "compileWithOptions:device:", 0, v38);
  return v41;
}

- (id)createInferenceGraphFromGraphObject:(id)a3 inputPlaceholders:(void *)a4 scalarWeights:(void *)a5 finalLayerTensor:(id)a6 device:(id)a7
{
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__132;
  v32 = __Block_byref_object_dispose__133;
  v12 = (void *)getMLCSoftmaxLayerClass(void)::softClass;
  v33 = getMLCSoftmaxLayerClass(void)::softClass;
  if (!getMLCSoftmaxLayerClass(void)::softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = ___ZL23getMLCSoftmaxLayerClassv_block_invoke;
    v26 = &unk_1E2DF4DD0;
    v27 = &v28;
    ___ZL23getMLCSoftmaxLayerClassv_block_invoke((uint64_t)&v23);
    v12 = (void *)v29[5];
  }
  _Block_object_dispose(&v28, 8);
  v13 = objc_msgSend(v12, "layerWithOperation:", 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__132;
  v32 = __Block_byref_object_dispose__133;
  v14 = (void *)getMLCInferenceGraphClass(void)::softClass;
  v33 = getMLCInferenceGraphClass(void)::softClass;
  if (!getMLCInferenceGraphClass(void)::softClass)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = ___ZL25getMLCInferenceGraphClassv_block_invoke;
    v26 = &unk_1E2DF4DD0;
    v27 = &v28;
    ___ZL25getMLCInferenceGraphClassv_block_invoke((uint64_t)&v23);
    v14 = (void *)v29[5];
  }
  _Block_object_dispose(&v28, 8);
  v34[0] = a3;
  v15 = (void *)objc_msgSend(v14, "graphWithGraphObjects:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1));
  if (!objc_msgSend(v15, "nodeWithLayer:source:", v13, a6))
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating inference graph"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Infrastructure Error"), v16, 0), "raise");
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = *(_QWORD *)a4;
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    v19 = 0;
    do
    {
      objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(v18 + 8 * v19), objc_msgSend(*(id *)(v18 + 8 * v19), "label"));
      ++v19;
      v18 = *(_QWORD *)a4;
    }
    while (v19 < (uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
  }
  v20 = *(_QWORD *)a5;
  if (*((_QWORD *)a5 + 1) != *(_QWORD *)a5)
  {
    v21 = 0;
    do
    {
      objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(v20 + 8 * v21), objc_msgSend(*(id *)(v20 + 8 * v21), "label"));
      ++v21;
      v20 = *(_QWORD *)a5;
    }
    while (v21 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
  }
  objc_msgSend(v15, "addInputs:", v17);
  objc_msgSend(v15, "compileWithOptions:device:", 0, a7);
  return v15;
}

- (void)trainAndSaveSeqTagModelFromData:(void *)a3 batchedLabels:(void *)a4 labelArray:(void *)a5 embeddingRef:(void *)a6 trainedModelDict:(__CFDictionary *)a7 trainingLogger:(id)a8
{
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  std::vector<int>::size_type v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t **v30;
  uint64_t **v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void *v47;
  int v48;
  unint64_t v49;
  void *MLCTensorDescriptorClass;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *Mutable;
  __CFArray *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  const char *v79;
  CFStringRef v80;
  id v81;
  id v82;
  __CFDictionary *v83;
  uint64_t **v84;
  const void *v85;
  const void *Value;
  const void *v87;
  const void *v88;
  const void *v89;
  const void *v90;
  __CFDictionary **v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  TransferSeqTagMLFHelper *v100;
  CoreNLP *Dimension;
  int v102;
  uint64_t v103;
  CFMutableArrayRef theArray;
  uint64_t v105;
  uint64_t v106;
  std::vector<int> v107;
  uint64_t v108;
  _QWORD *v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  _QWORD *v114;
  uint64_t v115;
  void *__p;
  char *v117;
  unint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t *v123;
  char *v124;
  char v125;
  CFMutableArrayRef *p_theArray;
  uint64_t *v127;
  unint64_t v128;
  Class (*v129)(uint64_t);
  void *v130;
  std::vector<int>::value_type *v131;
  std::vector<int>::value_type __x[2];
  uint64_t **v133;
  unint64_t v134;
  void (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  uint64_t v137;
  _QWORD v138[4];
  _QWORD v139[6];

  v139[4] = *MEMORY[0x1E0C80C00];
  v13 = *(_QWORD *)a5;
  v12 = *((_QWORD *)a5 + 1);
  v125 = 0;
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v119 = 0;
  v120 = 0;
  v121 = 0;
  __p = 0;
  v117 = 0;
  v118 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v111 = 0;
  v112 = 0;
  Dimension = NLStringEmbeddingGetDimension((CoreNLP *)a6, (void *)a2);
  v100 = self;
  v14 = -[NSDictionary objectForKeyedSubscript:](self->_trainingParameters, "objectForKeyedSubscript:", CFSTR("maxLength"));
  if (v14)
    v103 = objc_msgSend(v14, "intValue");
  else
    v103 = 50;
  v15 = -[NSDictionary objectForKeyedSubscript:](self->_trainingParameters, "objectForKeyedSubscript:", CFSTR("batchSize"));
  if (v15)
    v102 = objc_msgSend(v15, "intValue");
  else
    v102 = 32;
  v16 = -[NSDictionary objectForKeyedSubscript:](self->_trainingParameters, "objectForKeyedSubscript:", kNLModelTrainerModelDeviceTypeKey);
  if (v16)
    v17 = objc_msgSend(v16, "intValue");
  else
    v17 = 2;
  *(_QWORD *)__x = 0;
  v133 = (uint64_t **)__x;
  v134 = 0x3052000000;
  v135 = __Block_byref_object_copy__132;
  v136 = __Block_byref_object_dispose__133;
  v18 = (uint64_t *)getMLCDeviceClass(void)::softClass;
  v137 = getMLCDeviceClass(void)::softClass;
  if (!getMLCDeviceClass(void)::softClass)
  {
    v127 = (uint64_t *)MEMORY[0x1E0C809B0];
    v128 = 3221225472;
    v129 = ___ZL17getMLCDeviceClassv_block_invoke;
    v130 = &unk_1E2DF4DD0;
    v131 = __x;
    ___ZL17getMLCDeviceClassv_block_invoke((uint64_t)&v127);
    v18 = v133[5];
  }
  v93 = v13;
  v94 = v12;
  _Block_object_dispose(__x, 8);
  if (v17 <= 3)
    v19 = v17;
  else
    v19 = 2;
  v96 = objc_msgSend(v18, "deviceWithType:", v19);
  v91 = a7;
  v92 = (uint64_t *)a5;
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
  __x[0] = 0;
  std::vector<int>::vector(&v107, v20, __x);
  v21 = *(_QWORD *)a4;
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    v22 = 0;
    do
    {
      *(_QWORD *)__x = 0;
      v133 = 0;
      v134 = 0;
      if (*(_QWORD *)(v21 + 24 * v22 + 8) != *(_QWORD *)(v21 + 24 * v22))
      {
        v23 = 0;
        do
        {
          v127 = 0;
          v128 = 0;
          v129 = 0;
          v25 = (uint64_t *)(*(_QWORD *)(v21 + 24 * v22) + 24 * v23);
          v24 = *v25;
          if (v25[1] != *v25)
          {
            v26 = 0;
            v27 = 0;
            do
            {
              theArray = 0;
              v105 = 0;
              v106 = 0;
              std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(&theArray, *(_QWORD *)(v24 + v26), *(_QWORD *)(v24 + v26 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v24 + v26 + 8) - *(_QWORD *)(v24 + v26)) >> 3));
              std::vector<std::vector<int>>::resize((uint64_t *)&theArray, (int)v103, (uint64_t)&v107);
              v28 = (uint64_t *)v128;
              if (v128 >= (unint64_t)v129)
              {
                v29 = (uint64_t *)std::vector<std::vector<std::vector<int>>>::__push_back_slow_path<std::vector<std::vector<int>> const&>((uint64_t *)&v127, (uint64_t *)&theArray);
              }
              else
              {
                *(_QWORD *)v128 = 0;
                v28[1] = 0;
                v28[2] = 0;
                std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(v28, (uint64_t)theArray, v105, 0xAAAAAAAAAAAAAAABLL * ((v105 - (uint64_t)theArray) >> 3));
                v29 = v28 + 3;
              }
              v128 = (unint64_t)v29;
              p_theArray = &theArray;
              std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_theArray);
              ++v27;
              v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v22) + 24 * v23);
              v26 += 24;
            }
            while (0xAAAAAAAAAAAAAAABLL
                  * ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v22) + 24 * v23 + 8) - v24) >> 3) > v27);
          }
          v30 = v133;
          if ((unint64_t)v133 >= v134)
          {
            v31 = (uint64_t **)std::vector<std::vector<std::vector<std::vector<int>>>>::__push_back_slow_path<std::vector<std::vector<std::vector<int>>> const&>((uint64_t *)__x, &v127);
          }
          else
          {
            *v133 = 0;
            v30[1] = 0;
            v30[2] = 0;
            std::vector<std::vector<std::vector<int>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<int>>*,std::vector<std::vector<int>>*>(v30, v127, (uint64_t *)v128, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v128 - (_QWORD)v127) >> 3));
            v31 = v30 + 3;
          }
          v133 = v31;
          theArray = (CFMutableArrayRef)&v127;
          std::vector<std::vector<std::vector<int>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&theArray);
          ++v23;
          v21 = *(_QWORD *)a4;
        }
        while (0xAAAAAAAAAAAAAAABLL
              * ((uint64_t)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v22 + 8) - *(_QWORD *)(*(_QWORD *)a4 + 24 * v22)) >> 3) > v23);
      }
      v32 = v109;
      if ((unint64_t)v109 >= v110)
      {
        v33 = std::vector<std::vector<std::vector<std::vector<std::vector<int>>>>>::__push_back_slow_path<std::vector<std::vector<std::vector<std::vector<int>>>> const&>(&v108, (uint64_t ***)__x);
      }
      else
      {
        *v109 = 0;
        v32[1] = 0;
        v32[2] = 0;
        std::vector<std::vector<std::vector<std::vector<int>>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<std::vector<int>>>*,std::vector<std::vector<std::vector<int>>>*>(v32, *(uint64_t ***)__x, v133, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v133 - *(_QWORD *)__x) >> 3));
        v33 = (uint64_t)(v32 + 3);
      }
      v109 = (_QWORD *)v33;
      v127 = (uint64_t *)__x;
      std::vector<std::vector<std::vector<std::vector<int>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v127);
      ++v22;
      v21 = *(_QWORD *)a4;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3) > v22);
  }
  v34 = v117;
  if ((unint64_t)v117 >= v118)
  {
    v38 = (v117 - (_BYTE *)__p) >> 3;
    v37 = v93;
    v36 = v94;
    if ((unint64_t)(v38 + 1) >> 61)
      std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
    v39 = (uint64_t)(v118 - (_QWORD)__p) >> 2;
    if (v39 <= v38 + 1)
      v39 = v38 + 1;
    if (v118 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF8)
      v40 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v40 = v39;
    if (v40)
      v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v118, v40);
    else
      v41 = 0;
    v42 = &v41[8 * v38];
    v43 = &v41[8 * v40];
    *(_QWORD *)v42 = 0;
    v35 = v42 + 8;
    v45 = (char *)__p;
    v44 = v117;
    if (v117 != __p)
    {
      do
      {
        v46 = *((_QWORD *)v44 - 1);
        v44 -= 8;
        *((_QWORD *)v42 - 1) = v46;
        v42 -= 8;
      }
      while (v44 != v45);
      v44 = (char *)__p;
    }
    __p = v42;
    v117 = v35;
    v118 = (unint64_t)v43;
    if (v44)
      operator delete(v44);
  }
  else
  {
    *(_QWORD *)v117 = 0;
    v35 = v34 + 8;
    v37 = v93;
    v36 = v94;
  }
  v117 = v35;
  v95 = 0xAAAAAAAAAAAAAAABLL * ((v36 - v37) >> 3);
  -[TransferSeqTagMLFHelper getInputEmbeddingsAndTargetTensorsForSequenceData:seqLabels:batchSize:maxLength:numClasses:embeddingRef:inputTensorDataItems:targetTensorData:targetWeightTensorData:](v100, "getInputEmbeddingsAndTargetTensorsForSequenceData:seqLabels:batchSize:maxLength:numClasses:embeddingRef:inputTensorDataItems:targetTensorData:targetWeightTensorData:", &__p, &v112, &v111);
  v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v102 >= 1)
  {
    v48 = v102;
    do
    {
      objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103));
      --v48;
    }
    while (v48);
  }
  if (v117 != __p)
  {
    v49 = 0;
    do
    {
      MLCTensorDescriptorClass = (void *)getMLCTensorDescriptorClass();
      v139[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v102);
      v139[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", Dimension);
      v139[2] = &unk_1E2DF8FA8;
      v139[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103);
      v51 = objc_msgSend(MLCTensorDescriptorClass, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 4), v47, 1, 1);
      v52 = objc_msgSend((id)getMLCTensorClass(), "tensorWithDescriptor:data:", v51, *((_QWORD *)__p + v49));
      v53 = v52;
      v54 = v123;
      if (v123 >= (uint64_t *)v124)
      {
        v56 = ((char *)v123 - (_BYTE *)v122) >> 3;
        if ((unint64_t)(v56 + 1) >> 61)
          std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
        v57 = (v124 - (_BYTE *)v122) >> 2;
        if (v57 <= v56 + 1)
          v57 = v56 + 1;
        if ((unint64_t)(v124 - (_BYTE *)v122) >= 0x7FFFFFFFFFFFFFF8)
          v58 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v58 = v57;
        if (v58)
          v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v124, v58);
        else
          v59 = 0;
        v60 = (uint64_t *)&v59[8 * v56];
        *v60 = v53;
        v55 = v60 + 1;
        v62 = (char *)v122;
        v61 = (char *)v123;
        if (v123 != v122)
        {
          do
          {
            v63 = *((_QWORD *)v61 - 1);
            v61 -= 8;
            *--v60 = v63;
          }
          while (v61 != v62);
          v61 = (char *)v122;
        }
        v122 = v60;
        v123 = v55;
        v124 = &v59[8 * v58];
        if (v61)
          operator delete(v61);
      }
      else
      {
        *v123 = v52;
        v55 = v54 + 1;
      }
      v123 = v55;
      ++v49;
    }
    while (v49 < (v117 - (_BYTE *)__p) >> 3);
  }
  v64 = (void *)getMLCTensorDescriptorClass();
  v138[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v102);
  v138[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v95);
  v138[2] = &unk_1E2DF8FA8;
  v138[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103);
  v65 = objc_msgSend(v64, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 4), v47, 1, 1);
  v66 = objc_msgSend((id)getMLCTensorClass(), "tensorWithDescriptor:data:", v65, v112);
  v67 = objc_msgSend((id)getMLCTensorClass(), "tensorWithDescriptor:data:", v65, v111);
  *(_QWORD *)__x = 0;
  v133 = (uint64_t **)__x;
  v134 = 0x3052000000;
  v135 = __Block_byref_object_copy__132;
  v136 = __Block_byref_object_dispose__133;
  v137 = getMLCGraphClass(void)::softClass;
  if (!getMLCGraphClass(void)::softClass)
  {
    v127 = (uint64_t *)MEMORY[0x1E0C809B0];
    v128 = 3221225472;
    v129 = ___ZL16getMLCGraphClassv_block_invoke;
    v130 = &unk_1E2DF4DD0;
    v131 = __x;
    ___ZL16getMLCGraphClassv_block_invoke((uint64_t)&v127);
  }
  _Block_object_dispose(__x, 8);
  v68 = (id)objc_opt_new();
  -[TransferSeqTagMLFHelper createGraphObjectAndLayersFromInputPlaceholders:scalarWeights:labelSize:embeddingDimension:graphObject:graphLayerList:](v100, "createGraphObjectAndLayersFromInputPlaceholders:scalarWeights:labelSize:embeddingDimension:graphObject:graphLayerList:", &v122, &v119, (int)v95, Dimension, v68, &v113);
  v69 = *(v114 - 1);
  v70 = -[TransferSeqTagMLFHelper createTrainingGraphFromGraphObject:inputPlaceholders:scalarWeights:targetLabels:targeLabelWeights:device:](v100, "createTrainingGraphFromGraphObject:inputPlaceholders:scalarWeights:targetLabels:targeLabelWeights:device:", v68, &v122, &v119, v66, v67, v96);
  if (!v70)
  {
    v71 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported Hardware: Training graph creation failed."));
    (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, v71, &v125);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Infrastructure Error"), v71, 0), "raise");
  }
  v72 = -[TransferSeqTagMLFHelper createInferenceGraphFromGraphObject:inputPlaceholders:scalarWeights:finalLayerTensor:device:](v100, "createInferenceGraphFromGraphObject:inputPlaceholders:scalarWeights:finalLayerTensor:device:", v68, &v122, &v119, v69, v96);
  if (!v72)
  {
    v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported Hardware: Inference graph creation failed."));
    (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, v73, &v125);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Infrastructure Error"), v73, 0), "raise");
  }
  (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Training graph initialization complete.")), &v125);
  *(_QWORD *)__x = 0;
  *(_QWORD *)__x = -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:](v100, "doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:", a3, a4, &v108, v92, a6, &v113, v70, v72, &v119, &v122, v66, v67, a8);
  if (*(_QWORD *)__x)
  {
    (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saving Trained Model Weights")), &v125);
    Mutable = (uint64_t *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v127 = Mutable;
    v75 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    theArray = v75;
    v76 = *v92;
    if (v92[1] != *v92)
    {
      v77 = 0;
      v78 = 0;
      do
      {
        v79 = (const char *)(v76 + v77);
        if (*(char *)(v76 + v77 + 23) < 0)
          v79 = *(const char **)v79;
        v80 = CFStringCreateWithCString(0, v79, 0x8000100u);
        v75 = theArray;
        CFArrayAppendValue(theArray, v80);
        CFRelease(v80);
        ++v78;
        v76 = *v92;
        v77 += 24;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((v92[1] - *v92) >> 3) > v78);
      Mutable = v127;
    }
    CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelSampleDataLabelTypesArrayKey, v75);
    v81 = -[NSDictionary objectForKeyedSubscript:](v100->_trainingParameters, "objectForKeyedSubscript:", kNLModelTrainerEmbeddingArchitectureKey);
    v82 = -[NSDictionary objectForKeyedSubscript:](v100->_trainingParameters, "objectForKeyedSubscript:", kNLModelTrainerLanguageKey);
    CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelTrainerEmbeddingArchitectureKey, v81);
    CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelTrainerLanguageKey, v82);
    if (-[NSDictionary objectForKeyedSubscript:](v100->_trainingParameters, "objectForKeyedSubscript:", kNLModelTrainerMultilingualEmbeddingLocaleIdentifierKey))
    {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelTrainerMultilingualEmbeddingLocaleIdentifierKey, -[NSDictionary objectForKeyedSubscript:](v100->_trainingParameters, "objectForKeyedSubscript:", kNLModelTrainerMultilingualEmbeddingLocaleIdentifierKey));
    }
    v83 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(v83, kNLModelTrainerModelMetadataKey, Mutable);
    v84 = *(uint64_t ***)__x;
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)__x, kNLModelTrainerModelDataArrayKey))
    {
      v85 = (const void *)kNLModelTrainerModelDataArrayKey;
      Value = CFDictionaryGetValue((CFDictionaryRef)v84, kNLModelTrainerModelDataArrayKey);
      CFDictionaryAddValue(v83, v85, Value);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)v84, kNLModelPredictedTrainingLabelsKey))
    {
      v87 = (const void *)kNLModelPredictedTrainingLabelsKey;
      v88 = CFDictionaryGetValue((CFDictionaryRef)v84, kNLModelPredictedTrainingLabelsKey);
      CFDictionaryAddValue(v83, v87, v88);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)v84, kNLModelPredictedValidationLabelsKey))
    {
      v89 = (const void *)kNLModelPredictedValidationLabelsKey;
      v90 = CFDictionaryGetValue((CFDictionaryRef)v84, kNLModelPredictedValidationLabelsKey);
      CFDictionaryAddValue(v83, v89, v90);
    }
    *v91 = v83;
    if (v75)
      CFRelease(v75);
    if (Mutable)
      CFRelease(Mutable);
    if (v84)
      CFRelease(v84);
  }
  if (v107.__begin_)
  {
    v107.__end_ = v107.__begin_;
    operator delete(v107.__begin_);
  }
  *(_QWORD *)__x = &v108;
  std::vector<std::vector<std::vector<std::vector<std::vector<int>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)__x);
  if (v113)
  {
    v114 = v113;
    operator delete(v113);
  }
  if (__p)
  {
    v117 = (char *)__p;
    operator delete(__p);
  }
  if (v119)
  {
    v120 = v119;
    operator delete(v119);
  }
  if (v122)
  {
    v123 = (uint64_t *)v122;
    operator delete(v122);
  }
}

- (__CFDictionary)doSeqTagTrainingAndEvalFromData:(void *)a3 batchedLabels:(void *)a4 batchedPaddedLabelDatasets:(void *)a5 labelArray:(void *)a6 embeddingRef:(void *)a7 modeLayerList:(void *)a8 trainingGraph:(id)a9 inferenceGraph:(id)a10 scalarParams:(void *)a11 inputPlaceholders:(void *)a12 targetLabelPlaceholders:(id)a13 targetLabelWeightsPlaceholders:(id)a14 trainingLogger:(id)a15
{
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t Dimension;
  id v23;
  unsigned int v24;
  id v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  CFArrayRef v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  float v45;
  uint64_t **v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  _QWORD *v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  __int128 **v85;
  void **v86;
  _QWORD *v87;
  void *v88;
  int64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  __int128 ***v94;
  char *v95;
  char *v96;
  __int128 ***v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  float v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t *v107;
  uint64_t v108;
  void **v109;
  float v110;
  float v111;
  void **v112;
  uint64_t v113;
  _QWORD *v114;
  _QWORD *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  void *v121;
  void *v122;
  void *v124;
  __CFDictionary *theDict;
  void *v127;
  unint64_t v128;
  unsigned int v129;
  unsigned int v130;
  CoreNLP *v132;
  TransferSeqTagMLFHelper *v133;
  NSObject *dsema;
  uint64_t v135;
  uint64_t v136;
  void *v138[2];
  char v139;
  __int128 **v140[3];
  void *v141[2];
  char v142;
  void *v143;
  void *v144;
  uint64_t v145;
  char v146;
  char v147[15];
  char v148;
  char v149[15];
  char v150;
  char v151[15];
  _QWORD v152[10];
  int v153;
  void *v154;
  char *v155;
  char *v156;
  __int128 **v157;
  __int128 ***v158;
  uint64_t v159;
  int v160;
  void *__p;
  void *p_p;
  uint64_t v163;
  char v164;
  void *v165;
  _BYTE *v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  _QWORD *v170;
  unint64_t v171;
  void *v172;
  void *v173;
  unint64_t v174;
  _QWORD *v175;
  _QWORD *v176;
  unint64_t v177;
  _QWORD v178[3];
  _QWORD v179[3];
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char v183;
  uint8_t *v184;
  uint64_t v185;
  void **v186;
  uint64_t v187;
  __int128 **v188;
  uint8_t buf[24];
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v20 = *(_QWORD *)a6;
  v19 = *((_QWORD *)a6 + 1);
  v127 = a6;
  v132 = (CoreNLP *)a7;
  Dimension = (unint64_t)NLStringEmbeddingGetDimension((CoreNLP *)a7, v21);
  v183 = 0;
  v23 = -[NSDictionary objectForKeyedSubscript:](self->_trainingParameters, "objectForKeyedSubscript:", kNLModelTrainerMaxIterationNumberKey);
  if (v23)
    v24 = objc_msgSend(v23, "unsignedIntValue");
  else
    v24 = 20;
  v25 = -[NSDictionary objectForKeyedSubscript:](self->_trainingParameters, "objectForKeyedSubscript:", CFSTR("maxLength"));
  if (v25)
    v26 = objc_msgSend(v25, "intValue");
  else
    v26 = 50;
  v27 = *(_QWORD *)a3 + 24;
  v28 = **(uint64_t ***)a3;
  v30 = *v28;
  v29 = v28[1];
  v180 = 0;
  v181 = 0;
  v182 = 0;
  memset(v179, 0, sizeof(v179));
  v130 = v26;
  -[TransferSeqTagMLFHelper removeBatchingFromDataAndLabels:batchedLabels:inputSentences:inputLabels:maxLength:](self, "removeBatchingFromDataAndLabels:batchedLabels:inputSentences:inputLabels:maxLength:", v27, *(_QWORD *)a4 + 24, &v180, v179);
  memset(v178, 0, sizeof(v178));
  v133 = self;
  -[TransferSeqTagMLFHelper getMaxIndicesFromOneHotVectors:maxIndicesBatch:](self, "getMaxIndicesFromOneHotVectors:maxIndicesBatch:", v179, v178);
  v176 = 0;
  v175 = 0;
  v177 = 0;
  v173 = 0;
  v172 = 0;
  v174 = 0;
  v170 = 0;
  v169 = 0;
  v171 = 0;
  v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v31)
    -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:].cold.4(v31, v32, v33);
  v136 = v29;
  v34 = v180;
  if (v181 != v180)
  {
    v35 = 0;
    v36 = 0;
    do
    {
      v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v34 + v35 + 8) - *(_QWORD *)(v34 + v35)) >> 3);
      LODWORD(__p) = 0;
      std::vector<float>::vector(&v165, (int)v37 * Dimension, &__p);
      LODWORD(v157) = 0;
      std::vector<float>::vector(&__p, Dimension, &v157);
      v158 = 0;
      v157 = 0;
      v159 = 0;
      v158 = (__int128 ***)std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>((uint64_t *)&v157, (__int128 **)(v180 + v35));
      v38 = applesauce::CF::details::make_CFArrayRef<std::vector<std::string>>(&v157);
      v154 = v38;
      NLStringEmbeddingFillWordVectorsWithShape(v132, v38, 1, v37, (char *)v165, 0, (uint64_t)__p, 2);
      v39 = v170;
      if ((unint64_t)v170 >= v171)
      {
        v40 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v169, (uint64_t)&v165);
      }
      else
      {
        *v170 = 0;
        v39[1] = 0;
        v39[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v39, v165, (uint64_t)v166, (v166 - (_BYTE *)v165) >> 2);
        v40 = (uint64_t)(v39 + 3);
      }
      v170 = (_QWORD *)v40;
      if (v38)
        CFRelease(v38);
      v154 = &v157;
      std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v154);
      if (__p)
      {
        p_p = __p;
        operator delete(__p);
      }
      if (v165)
      {
        v166 = v165;
        operator delete(v165);
      }
      ++v36;
      v34 = v180;
      v35 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v181 - v180) >> 3) > v36);
  }
  v165 = 0;
  v166 = &v165;
  v167 = 0x2020000000;
  v168 = 0;
  __p = 0;
  p_p = &__p;
  v163 = 0x2020000000;
  v164 = 0;
  v41 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = *(_QWORD *)a11;
  if (*((_QWORD *)a11 + 1) != *(_QWORD *)a11)
  {
    v43 = 0;
    do
    {
      v44 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", objc_msgSend(*(id *)(v42 + 8 * v43), "data"));
      objc_msgSend(v41, "setObject:forKey:", objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v44, "mutableBytes"), objc_msgSend(v44, "length")), objc_msgSend(*(id *)(*(_QWORD *)a11 + 8 * v43++), "label"));
      v42 = *(_QWORD *)a11;
    }
    while (v43 < (uint64_t)(*((_QWORD *)a11 + 1) - *(_QWORD *)a11) >> 3);
  }
  (*((void (**)(id, uint64_t, char *))a15 + 2))(a15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Beginning training")), &v183);
  if (v24)
  {
    v135 = 0;
    v124 = 0;
    v129 = -1431655765 * ((unint64_t)(v19 - v20) >> 3);
    v128 = 0xAAAAAAAAAAAAAAABLL * ((v136 - v30) >> 3);
    v45 = NAN;
    do
    {
      v157 = 0;
      v158 = &v157;
      v159 = 0x2020000000;
      v160 = 0;
      dsema = dispatch_semaphore_create(0);
      v46 = *(uint64_t ***)a3;
      if (*(_QWORD *)(*(_QWORD *)a3 + 8) != **(_QWORD **)a3)
      {
        v47 = 0;
        do
        {
          v154 = 0;
          v155 = 0;
          v156 = 0;
          v140[0] = 0;
          v184 = 0;
          v49 = *(_QWORD *)a12;
          v48 = *((_QWORD *)a12 + 1);
          if (v135)
          {
            if (v48 != v49)
            {
              v50 = 0;
              v51 = 0;
              do
              {
                v52 = *(_QWORD *)(v175[3 * v47] + 8 * v51);
                if (v50 >= v156)
                {
                  v53 = (v50 - (_BYTE *)v154) >> 3;
                  if ((unint64_t)(v53 + 1) >> 61)
                    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                  v54 = (v156 - (_BYTE *)v154) >> 2;
                  if (v54 <= v53 + 1)
                    v54 = v53 + 1;
                  if ((unint64_t)(v156 - (_BYTE *)v154) >= 0x7FFFFFFFFFFFFFF8)
                    v55 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v55 = v54;
                  if (v55)
                    v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v156, v55);
                  else
                    v56 = 0;
                  v57 = &v56[8 * v53];
                  *(_QWORD *)v57 = v52;
                  v50 = v57 + 8;
                  v59 = (char *)v154;
                  v58 = v155;
                  if (v155 != v154)
                  {
                    do
                    {
                      v60 = *((_QWORD *)v58 - 1);
                      v58 -= 8;
                      *((_QWORD *)v57 - 1) = v60;
                      v57 -= 8;
                    }
                    while (v58 != v59);
                    v58 = (char *)v154;
                  }
                  v154 = v57;
                  v155 = v50;
                  v156 = &v56[8 * v55];
                  if (v58)
                    operator delete(v58);
                }
                else
                {
                  *(_QWORD *)v50 = v52;
                  v50 += 8;
                }
                v155 = v50;
                ++v51;
              }
              while (v51 < (uint64_t)(*((_QWORD *)a12 + 1) - *(_QWORD *)a12) >> 3);
            }
            v61 = (char *)v172 + 16 * v47;
            v140[0] = *(__int128 ***)v61;
            v184 = (uint8_t *)*((_QWORD *)v61 + 1);
          }
          else
          {
            if (v48 != v49)
            {
              v62 = 0;
              v63 = 0;
              do
              {
                if (v62 >= v156)
                {
                  v64 = (v62 - (_BYTE *)v154) >> 3;
                  if ((unint64_t)(v64 + 1) >> 61)
                    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                  v65 = (v156 - (_BYTE *)v154) >> 2;
                  if (v65 <= v64 + 1)
                    v65 = v64 + 1;
                  if ((unint64_t)(v156 - (_BYTE *)v154) >= 0x7FFFFFFFFFFFFFF8)
                    v66 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v66 = v65;
                  if (v66)
                    v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v156, v66);
                  else
                    v67 = 0;
                  v68 = &v67[8 * v64];
                  *(_QWORD *)v68 = 0;
                  v62 = v68 + 8;
                  v70 = (char *)v154;
                  v69 = v155;
                  if (v155 != v154)
                  {
                    do
                    {
                      v71 = *((_QWORD *)v69 - 1);
                      v69 -= 8;
                      *((_QWORD *)v68 - 1) = v71;
                      v68 -= 8;
                    }
                    while (v69 != v70);
                    v69 = (char *)v154;
                  }
                  v154 = v68;
                  v155 = v62;
                  v156 = &v67[8 * v66];
                  if (v69)
                    operator delete(v69);
                }
                else
                {
                  *(_QWORD *)v62 = 0;
                  v62 += 8;
                }
                v155 = v62;
                ++v63;
              }
              while (v63 < (uint64_t)(*((_QWORD *)a12 + 1) - *(_QWORD *)a12) >> 3);
              v46 = *(uint64_t ***)a3;
            }
            -[TransferSeqTagMLFHelper getInputEmbeddingsAndTargetTensorsForSequenceData:seqLabels:batchSize:maxLength:numClasses:embeddingRef:inputTensorDataItems:targetTensorData:targetWeightTensorData:](v133, "getInputEmbeddingsAndTargetTensorsForSequenceData:seqLabels:batchSize:maxLength:numClasses:embeddingRef:inputTensorDataItems:targetTensorData:targetWeightTensorData:", &(*v46)[3 * v47], **(_QWORD **)a5 + 24 * v47, v128, v130, v129, v132, &v154, v140, &v184);
            memset(buf, 0, sizeof(buf));
            if (*((_QWORD *)a12 + 1) != *(_QWORD *)a12)
            {
              v72 = 0;
              v73 = 0;
              do
              {
                v74 = v154;
                if ((unint64_t)v72 >= *(_QWORD *)&buf[16])
                {
                  v75 = ((uint64_t)v72 - *(_QWORD *)buf) >> 3;
                  if ((unint64_t)(v75 + 1) >> 61)
                    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                  v76 = (uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 2;
                  if (v76 <= v75 + 1)
                    v76 = v75 + 1;
                  if (*(_QWORD *)&buf[16] - *(_QWORD *)buf >= 0x7FFFFFFFFFFFFFF8uLL)
                    v77 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v77 = v76;
                  if (v77)
                    v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&buf[16], v77);
                  else
                    v78 = 0;
                  v79 = &v78[8 * v75];
                  *(_QWORD *)v79 = v74[v73];
                  v72 = v79 + 8;
                  v81 = *(char **)buf;
                  v80 = *(char **)&buf[8];
                  if (*(_QWORD *)&buf[8] != *(_QWORD *)buf)
                  {
                    do
                    {
                      v82 = *((_QWORD *)v80 - 1);
                      v80 -= 8;
                      *((_QWORD *)v79 - 1) = v82;
                      v79 -= 8;
                    }
                    while (v80 != v81);
                    v80 = *(char **)buf;
                  }
                  *(_QWORD *)buf = v79;
                  *(_QWORD *)&buf[8] = v72;
                  *(_QWORD *)&buf[16] = &v78[8 * v77];
                  if (v80)
                    operator delete(v80);
                }
                else
                {
                  *v72++ = *((_QWORD *)v154 + v73);
                }
                *(_QWORD *)&buf[8] = v72;
                ++v73;
              }
              while (v73 < (uint64_t)(*((_QWORD *)a12 + 1) - *(_QWORD *)a12) >> 3);
            }
            v83 = v176;
            if ((unint64_t)v176 >= v177)
            {
              v84 = std::vector<std::vector<MLCTensorData *>>::__push_back_slow_path<std::vector<MLCTensorData *> const&>((uint64_t *)&v175, (uint64_t)buf);
            }
            else
            {
              *v176 = 0;
              v83[1] = 0;
              v83[2] = 0;
              std::vector<MLCTensorData *>::__init_with_size[abi:ne180100]<MLCTensorData **,MLCTensorData **>(v83, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
              v84 = (uint64_t)(v83 + 3);
            }
            v176 = (_QWORD *)v84;
            v85 = v140[0];
            v86 = (void **)v184;
            v87 = v173;
            if ((unint64_t)v173 >= v174)
            {
              v89 = ((_BYTE *)v173 - (_BYTE *)v172) >> 4;
              v90 = v89 + 1;
              if ((unint64_t)(v89 + 1) >> 60)
                std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
              v91 = v174 - (_QWORD)v172;
              if ((uint64_t)(v174 - (_QWORD)v172) >> 3 > v90)
                v90 = v91 >> 3;
              if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF0)
                v92 = 0xFFFFFFFFFFFFFFFLL;
              else
                v92 = v90;
              if (v92)
                v93 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,unsigned long>>>((uint64_t)&v174, v92);
              else
                v93 = 0;
              v94 = (__int128 ***)&v93[16 * v89];
              *v94 = v85;
              v94[1] = (__int128 **)v86;
              v95 = (char *)v173;
              v96 = (char *)v172;
              v97 = v94;
              if (v173 != v172)
              {
                do
                {
                  *((_OWORD *)v97 - 1) = *((_OWORD *)v95 - 1);
                  v97 -= 2;
                  v95 -= 16;
                }
                while (v95 != v96);
                v95 = (char *)v172;
              }
              v88 = v94 + 2;
              v172 = v97;
              v173 = v94 + 2;
              v174 = (unint64_t)&v93[16 * v92];
              if (v95)
                operator delete(v95);
            }
            else
            {
              *(__int128 ***)v173 = v140[0];
              v87[1] = v86;
              v88 = v87 + 2;
            }
            v173 = v88;
            if (*(_QWORD *)buf)
            {
              *(_QWORD *)&buf[8] = *(_QWORD *)buf;
              operator delete(*(void **)buf);
            }
          }
          v98 = (void *)MEMORY[0x19401EF04]();
          v99 = *(_QWORD *)a12;
          if (*((_QWORD *)a12 + 1) != *(_QWORD *)a12)
          {
            v100 = 0;
            do
            {
              objc_msgSend(v41, "setObject:forKey:", *((_QWORD *)v154 + v100), objc_msgSend(*(id *)(v99 + 8 * v100), "label"));
              ++v100;
              v99 = *(_QWORD *)a12;
            }
            while (v100 < (uint64_t)(*((_QWORD *)a12 + 1) - *(_QWORD *)a12) >> 3);
          }
          v187 = objc_msgSend(a13, "label");
          v188 = v140[0];
          v101 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
          v185 = objc_msgSend(a14, "label");
          v186 = (void **)v184;
          v102 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1);
          v152[0] = MEMORY[0x1E0C809B0];
          v152[1] = 3221225472;
          v152[2] = __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke;
          v152[3] = &unk_1E2DF4D80;
          v152[6] = &__p;
          v152[7] = &v157;
          v152[8] = v47;
          v152[9] = a3;
          v153 = 0;
          v152[5] = &v165;
          v152[4] = dsema;
          objc_msgSend(a9, "executeWithInputsData:lossLabelsData:lossLabelWeightsData:batchSize:options:completionHandler:", v41, v101, v102, (int)v128, 0, v152);
          v155 = (char *)v154;
          objc_autoreleasePoolPop(v98);
          if (v154)
          {
            v155 = (char *)v154;
            operator delete(v154);
          }
          ++v47;
          v46 = *(uint64_t ***)a3;
        }
        while (v47 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(*(_QWORD *)a3 + 8) - **(_QWORD **)a3) >> 3));
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:].cold.3(&v150, v151);
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:].cold.2(&v148, v149);
      objc_msgSend(a9, "synchronizeUpdates");
      dispatch_release(dsema);
      v103 = *((float *)v158 + 6);
      v105 = **(_QWORD **)a3;
      v104 = *(_QWORD *)(*(_QWORD *)a3 + 8);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:].cold.1(&v146, v147);
      (*((void (**)(id, uint64_t, char *))a15 + 2))(a15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Completed epoch number = [%d] Total Training Loss = %f"), (v135 + 1), (float)(v103 / (float)(0xAAAAAAAAAAAAAAABLL * ((v104 - v105) >> 3)))), &v183);
      v143 = 0;
      v144 = 0;
      v145 = 0;
      std::vector<void *>::__init_with_size[abi:ne180100]<void **,void **>(&v143, *(const void **)a8, *((_QWORD *)a8 + 1), (uint64_t)(*((_QWORD *)a8 + 1) - *(_QWORD *)a8) >> 3);
      v106 = -[TransferSeqTagMLFHelper getModelLayerWeights:](v133, "getModelLayerWeights:", &v143);
      if (v143)
      {
        v144 = v143;
        operator delete(v143);
      }
      v154 = 0;
      v155 = 0;
      v156 = 0;
      if (v135 == v24 - 1)
      {
        memset(buf, 0, sizeof(buf));
        v107 = *(uint64_t **)a3;
        v108 = *(_QWORD *)a5;
        std::string::basic_string[abi:ne180100]<0>(v141, "Training");
        -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:](v133, "evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:", &v175, v107, v108, a10, a12, a11, v127, v141, a15, buf);
        if (v142 < 0)
          operator delete(v141[0]);
        memset(v140, 0, sizeof(v140));
        -[TransferSeqTagMLFHelper labelIdsToString:labelArray:labelStrings:](v133, "labelIdsToString:labelArray:labelStrings:", buf, v127, v140);
        v109 = (void **)applesauce::CF::details::make_CFArrayRef<std::vector<std::string>>(v140);
        v184 = (uint8_t *)v109;
        CFDictionaryAddValue(theDict, kNLModelPredictedTrainingLabelsKey, v109);
        if (v109)
          CFRelease(v109);
        v184 = (uint8_t *)v140;
        std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v184);
        v140[0] = (__int128 **)buf;
        std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v140);
      }
      CoreNLP::MontrealModel::MontrealModel((CoreNLP::MontrealModel *)v140, (const __CFData *)objc_msgSend(v106, "objectAtIndexedSubscript:", 0));
      std::string::basic_string[abi:ne180100]<0>(v138, "Validation");
      -[TransferSeqTagMLFHelper evaluateMontrealModelOnData:evalLabels:evalEmbeddingsCache:embeddingRef:montrealModel:labelArray:trainingLogger:dataTypeString:predictedLabels:](v133, "evaluateMontrealModelOnData:evalLabels:evalEmbeddingsCache:embeddingRef:montrealModel:labelArray:trainingLogger:dataTypeString:predictedLabels:", &v180, v178, &v169, v132, v140, v127, a15, v138, &v154);
      v111 = v110;
      if (v139 < 0)
        operator delete(v138[0]);
      if (v111 > v45)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&buf[4] = v45;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v111;
          _os_log_debug_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "\nValidation f-1 improved from %f to %f", buf, 0x16u);
        }
        memset(buf, 0, sizeof(buf));
        -[TransferSeqTagMLFHelper labelIdsToString:labelArray:labelStrings:](v133, "labelIdsToString:labelArray:labelStrings:", &v154, v127, buf);
        v112 = (void **)applesauce::CF::details::make_CFArrayRef<std::vector<std::string>>((__int128 ***)buf);
        v184 = (uint8_t *)v112;
        if (CFDictionaryContainsKey(theDict, kNLModelPredictedValidationLabelsKey))
          CFDictionaryReplaceValue(theDict, kNLModelPredictedValidationLabelsKey, v112);
        else
          CFDictionaryAddValue(theDict, kNLModelPredictedValidationLabelsKey, v112);
        if (v112)
          CFRelease(v112);
        v184 = buf;
        std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v184);
        v45 = v111;
        v124 = v106;
      }
      else
      {
        v106 = v124;
      }
      CoreNLP::MontrealModel::~MontrealModel((CoreNLP::MontrealModel *)v140);
      *(_QWORD *)buf = &v154;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      _Block_object_dispose(&v157, 8);
      ++v135;
    }
    while (v135 != v24);
  }
  else
  {
    v106 = 0;
  }
  CFDictionaryAddValue(theDict, kNLModelTrainerModelDataArrayKey, v106);
  v113 = (uint64_t)v175;
  v114 = v176;
  if (v176 != v175)
  {
    v115 = v176;
    do
    {
      v117 = (void *)*(v115 - 3);
      v115 -= 3;
      v116 = v117;
      if (v117)
      {
        *(v114 - 2) = v116;
        operator delete(v116);
      }
      v114 = v115;
    }
    while (v115 != (_QWORD *)v113);
  }
  v176 = (_QWORD *)v113;
  v173 = v172;
  v118 = (uint64_t)v169;
  v119 = v170;
  if (v170 != v169)
  {
    v120 = v170;
    do
    {
      v122 = (void *)*(v120 - 3);
      v120 -= 3;
      v121 = v122;
      if (v122)
      {
        *(v119 - 2) = v121;
        operator delete(v121);
      }
      v119 = v120;
    }
    while (v120 != (_QWORD *)v118);
  }
  v170 = (_QWORD *)v118;
  (*((void (**)(id, uint64_t, char *))a15 + 2))(a15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished Training")), &v183);
  _Block_object_dispose(&__p, 8);
  _Block_object_dispose(&v165, 8);
  v165 = &v169;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v165);
  if (v172)
  {
    v173 = v172;
    operator delete(v172);
  }
  v165 = &v175;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v165);
  v165 = v178;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v165);
  v165 = v179;
  std::vector<std::vector<std::vector<int>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v165);
  v165 = &v180;
  std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v165);
  return theDict;
}

void __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke(uint64_t a1, void *a2, double a3)
{
  float *v4;
  float *v5;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v4 = (float *)objc_msgSend((id)objc_msgSend(a2, "data"), "bytes");
  v5 = v4;
  if (v4)
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *v4
                                                               + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke_cold_1(a1, v5);
  if (*(_QWORD *)(a1 + 64) == 0xAAAAAAAAAAAAAAABLL
                             * ((uint64_t)(*(_QWORD *)(**(_QWORD **)(a1 + 72) + 24 * *(unsigned int *)(a1 + 80) + 8)
                                        - *(_QWORD *)(**(_QWORD **)(a1 + 72) + 24 * *(unsigned int *)(a1 + 80))) >> 3)
                             - 1)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)labelIdsToString:(void *)a3 labelArray:(void *)a4 labelStrings:(void *)a5
{
  uint64_t v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  std::string *v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  __int128 *v18;
  std::string *v19;
  unint64_t v20;
  __int128 **v21;

  v5 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v9 = 0;
    do
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v11 = (uint64_t *)(v5 + 24 * v9);
      v10 = *v11;
      if (v11[1] != *v11)
      {
        v12 = 0;
        v13 = 0;
        do
        {
          v14 = *(_QWORD *)a4 + 24 * *(int *)(v10 + 4 * v13);
          if ((unint64_t)v12 >= v20)
          {
            v12 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v18, (__int128 *)v14);
          }
          else
          {
            if (*(char *)(v14 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)v14, *(_QWORD *)(v14 + 8));
            }
            else
            {
              v15 = *(_OWORD *)v14;
              v12->__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 16);
              *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v15;
            }
            ++v12;
          }
          v19 = v12;
          ++v13;
          v10 = *(_QWORD *)(*(_QWORD *)a3 + 24 * v9);
        }
        while (v13 < (*(_QWORD *)(*(_QWORD *)a3 + 24 * v9 + 8) - v10) >> 2);
      }
      v16 = *((_QWORD *)a5 + 1);
      if (v16 >= *((_QWORD *)a5 + 2))
      {
        v17 = std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>((uint64_t *)a5, &v18);
      }
      else
      {
        std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>((uint64_t)a5, &v18);
        v17 = v16 + 24;
      }
      *((_QWORD *)a5 + 1) = v17;
      v21 = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      ++v9;
      v5 = *(_QWORD *)a3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3) > v9);
  }
}

- (float)showF1ResultsMatrix:(void *)a3 labelCounts:()map<int perLabelResults:()int trainingLogger:()std:(std:(int>>> *)a4 :(void *)a5 allocator<std:(id)a6 :()basic_string<char pair<const)int :()std:(std::allocator<char>> *)a7 :char_traits<char> less<int> dataTypeString:
{
  int v11;
  float v12;
  float v13;
  float v14;
  int v15;
  int v16;
  uint64_t **v17;
  int v18;
  uint64_t **v19;
  float v20;
  float v21;
  uint64_t **v22;
  uint64_t **v23;
  float *v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  float v28;
  float v29;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  int i;
  int v34;
  char v35;
  void *__p[3];
  _DWORD *v37[2];

  v11 = -1431655765 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  v37[0] = 0;
  std::vector<std::pair<float,float>>::vector(__p, v11, v37);
  v35 = 0;
  (*((void (**)(id, uint64_t, char *))a6 + 2))(a6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t Count \t\tLabel \t\t Prec \t\t Rec \t\t F-1")), &v35);
  v34 = 0;
  if (v11 < 1)
  {
    v14 = 0.0;
    v13 = 0.0;
    v12 = 0.0;
  }
  else
  {
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      v15 = 0;
      v16 = 0;
      for (i = 0; i < v11; ++i)
      {
        v37[0] = &v34;
        v17 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &v34, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &i;
        v18 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v17 + 5, &i, (uint64_t)&std::piecewise_construct, v37)+ 8);
        v37[0] = &i;
        v19 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &i, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &v34;
        v16 += v18;
        v15 += *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v19 + 5, &v34, (uint64_t)&std::piecewise_construct, v37)+ 8);
      }
      v20 = 0.0;
      v21 = 0.0;
      if (v16)
      {
        v37[0] = &v34;
        v22 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &v34, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &v34;
        v21 = (float)*((int *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v22 + 5, &v34, (uint64_t)&std::piecewise_construct, v37)+ 8)/ (float)v16;
      }
      if (v15)
      {
        v37[0] = &v34;
        v23 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &v34, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &v34;
        v20 = (float)*((int *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v23 + 5, &v34, (uint64_t)&std::piecewise_construct, v37)+ 8)/ (float)v15;
      }
      v24 = (float *)((char *)__p[0] + 8 * v34);
      *v24 = v21;
      v24[1] = v20;
      v25 = (void *)MEMORY[0x1E0CB3940];
      v37[0] = &v34;
      v26 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)a4, &v34, (uint64_t)&std::piecewise_construct, v37);
      v27 = *(_QWORD *)a3 + 24 * v34;
      if (*(char *)(v27 + 23) < 0)
        v27 = *(_QWORD *)v27;
      v28 = (float)(v21 + v20) * 0.5;
      (*((void (**)(id, uint64_t, char *))a6 + 2))(a6, objc_msgSend(v25, "stringWithFormat:", CFSTR("\t\t %d \t\t%s \t\t %4.2f \t\t %4.2f \t\t %4.2f"), *((unsigned int *)v26 + 8), v27, v21, v20, v28), &v35);
      v14 = v14 + v28;
      v13 = v13 + v21;
      v12 = v12 + v20;
      ++v34;
    }
    while (v34 < v11);
  }
  v29 = v14 / (float)v11;
  var0 = a7;
  if (*((char *)&a7->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a7->var0.var0.var0.var1.var0;
  (*((void (**)(id, uint64_t, char *))a6 + 2))(a6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Macro-average Precision = %4.2f Recall = %4.2f %s F-1 Score = %4.2f"), (float)(v13 / (float)v11), (float)(v12 / (float)v11), var0, v29), &v35);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v29;
}

- (float)evaluateMontrealModelOnData:(void *)a3 evalLabels:(void *)a4 evalEmbeddingsCache:(void *)a5 embeddingRef:(void *)a6 montrealModel:(void *)a7 labelArray:(void *)a8 trainingLogger:(id)a9 dataTypeString:()basic_string<char predictedLabels:()std:(std::allocator<char>> *)a10 :char_traits<char>
{
  uint64_t **v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void (**v16)(id, uint64_t, _BYTE *);
  uint64_t v17;
  unint64_t v18;
  float v19;
  float v20;
  CoreNLP::MontrealModel *v21;
  unint64_t v22;
  float *v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  float *v28;
  float v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  _DWORD *v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  int v49;
  uint64_t *v50;
  BOOL v51;
  uint64_t **v52;
  uint64_t *v53;
  unint64_t v54;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v55;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  float v57;
  float v58;
  float v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;
  TransferSeqTagMLFHelper *v64;
  void *context;
  std::string v70;
  uint64_t v71[3];
  int v72;
  int v73;
  char v74;
  int v75;
  uint64_t *v76;
  _QWORD *v77[2];
  uint64_t *v78;
  _QWORD *v79[2];
  int *v80;
  uint8_t buf[24];
  double v82;
  uint64_t v83;
  uint64_t *v84;

  v83 = *MEMORY[0x1E0C80C00];
  v79[0] = 0;
  v79[1] = 0;
  v77[1] = 0;
  v78 = (uint64_t *)v79;
  v76 = (uint64_t *)v77;
  v77[0] = 0;
  LODWORD(v80) = 0;
  if (*((_QWORD *)a8 + 1) != *(_QWORD *)a8)
  {
    do
    {
      *(_QWORD *)buf = &v80;
      *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v76, (int *)&v80, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
      v75 = 0;
      if (*((_QWORD *)a8 + 1) == *(_QWORD *)a8)
        break;
      do
      {
        *(_QWORD *)buf = &v80;
        v12 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v78, (int *)&v80, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(_QWORD *)buf = &v75;
        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v12 + 5, &v75, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
        v13 = ++v75;
        v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a8 + 1) - *(_QWORD *)a8) >> 3);
      }
      while (v14 > v13);
      v15 = (int)v80 + 1;
      LODWORD(v80) = (_DWORD)v80 + 1;
    }
    while (v14 > v15);
  }
  v74 = 0;
  v16 = (void (**)(id, uint64_t, _BYTE *))a9;
  v17 = (*((uint64_t (**)(id, uint64_t, char *))a9 + 2))(a9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Begin Validation..."), a4, a5, a6), &v74);
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v64 = self;
    v18 = 0;
    v19 = 0.0;
    v20 = 0.0;
    v21 = (CoreNLP::MontrealModel *)a7;
    while (1)
    {
      context = (void *)MEMORY[0x19401EF04](v17);
      memset(buf, 0, sizeof(buf));
      v22 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v18 + 8) - *(_QWORD *)(*(_QWORD *)a3 + 24 * v18)) >> 3);
      CoreNLP::MontrealModel::setInput(v21, 1, (int)v22, *(void **)(*(_QWORD *)a5 + 24 * v18), 0);
      CoreNLP::MontrealModel::predict(v21);
      v23 = (float *)CoreNLP::MontrealModel::output(v21, 0);
      v24 = CoreNLP::MontrealModel::outputSize(v21);
      if ((int)v22 >= 1)
      {
        v25 = 0;
        v26 = v24 << 32;
        v27 = 4 * (int)v24;
        do
        {
          v28 = v23;
          if (v26 >> 33)
          {
            v29 = *v23;
            v30 = 4;
            v28 = v23;
            do
            {
              if (v29 < v23[(unint64_t)v30 / 4])
              {
                v29 = v23[(unint64_t)v30 / 4];
                v28 = &v23[(unint64_t)v30 / 4];
              }
              v30 += 4;
            }
            while (v27 != v30);
          }
          v31 = (unint64_t)((char *)v28 - (char *)v23) >> 2;
          v32 = *(char **)&buf[8];
          if (*(_QWORD *)&buf[8] >= *(_QWORD *)&buf[16])
          {
            v34 = *(char **)buf;
            v35 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 2;
            v36 = v35 + 1;
            if ((unint64_t)(v35 + 1) >> 62)
              std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
            v37 = *(_QWORD *)&buf[16] - *(_QWORD *)buf;
            if ((uint64_t)(*(_QWORD *)&buf[16] - *(_QWORD *)buf) >> 1 > v36)
              v36 = v37 >> 1;
            if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
              v38 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v38 = v36;
            if (v38)
            {
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&buf[16], v38);
              v34 = *(char **)buf;
              v32 = *(char **)&buf[8];
            }
            else
            {
              v39 = 0;
            }
            v40 = &v39[4 * v35];
            *(_DWORD *)v40 = v31;
            v33 = v40 + 4;
            while (v32 != v34)
            {
              v41 = *((_DWORD *)v32 - 1);
              v32 -= 4;
              *((_DWORD *)v40 - 1) = v41;
              v40 -= 4;
            }
            *(_QWORD *)buf = v40;
            *(_QWORD *)&buf[8] = v33;
            *(_QWORD *)&buf[16] = &v39[4 * v38];
            if (v34)
              operator delete(v34);
          }
          else
          {
            **(_DWORD **)&buf[8] = v31;
            v33 = v32 + 4;
          }
          v23 = (float *)((char *)v23 + v27);
          *(_QWORD *)&buf[8] = v33;
          ++v25;
        }
        while (v25 != (_DWORD)v22);
      }
      v42 = v84[1];
      if (v42 >= v84[2])
      {
        v43 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v84, (uint64_t)buf);
        v21 = (CoreNLP::MontrealModel *)a7;
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v84, (uint64_t)buf);
        v21 = (CoreNLP::MontrealModel *)a7;
        v43 = v42 + 24;
      }
      v84[1] = v43;
      v44 = (*(_QWORD *)(*(_QWORD *)a3 + 24 * v18 + 8) - *(_QWORD *)(*(_QWORD *)a3 + 24 * v18)) / 24;
      if (*(_QWORD *)(*(_QWORD *)a3 + 24 * v18 + 8) == *(_QWORD *)(*(_QWORD *)a3 + 24 * v18))
      {
        v46 = 0;
      }
      else
      {
        v45 = 0;
        v46 = 0;
        if (v44 <= 1)
          v47 = 1;
        else
          v47 = (*(_QWORD *)(*(_QWORD *)a3 + 24 * v18 + 8) - *(_QWORD *)(*(_QWORD *)a3 + 24 * v18)) / 24;
        v48 = 1;
        do
        {
          v75 = 0;
          v75 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v18) + 4 * v45);
          v49 = *(_DWORD *)(*(_QWORD *)buf + 4 * v45);
          v80 = &v75;
          v50 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v76, &v75, (uint64_t)&std::piecewise_construct, (unsigned int **)&v80);
          ++*((_DWORD *)v50 + 8);
          v51 = v75 == v49;
          v73 = v75;
          v80 = &v73;
          v52 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v78, &v73, (uint64_t)&std::piecewise_construct, &v80);
          v72 = v49;
          v80 = &v72;
          v53 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v52 + 5, &v72, (uint64_t)&std::piecewise_construct, (unsigned int **)&v80);
          v46 += v51;
          v48 &= v51;
          ++*((_DWORD *)v53 + 8);
          ++v45;
        }
        while (v47 != v45);
        v21 = (CoreNLP::MontrealModel *)a7;
        if ((v48 & 1) == 0)
          goto LABEL_44;
      }
      v19 = v19 + 1.0;
LABEL_44:
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      objc_autoreleasePoolPop(context);
      v20 = v20 + (float)((float)v46 / (float)v44);
      ++v18;
      v54 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
      if (v54 <= v18)
      {
        v16 = (void (**)(id, uint64_t, _BYTE *))a9;
        self = v64;
        goto LABEL_49;
      }
    }
  }
  v54 = 0;
  v20 = 0.0;
  v19 = 0.0;
LABEL_49:
  v55 = a10;
  var0 = a10;
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
  v16[2](v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s data prediction completed.\n"), var0), &v74);
  std::map<int,int>::map[abi:ne180100](v71, (uint64_t)&v76);
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v70, a10->var0.var0.var0.var1.var0, a10->var0.var0.var0.var1.var1);
  else
    v70 = (std::string)a10->var0.var0;
  -[TransferSeqTagMLFHelper showF1ResultsMatrix:labelCounts:perLabelResults:trainingLogger:dataTypeString:](self, "showF1ResultsMatrix:labelCounts:perLabelResults:trainingLogger:dataTypeString:", a8, v71, &v78, v16, &v70);
  v58 = v57;
  v59 = v20 / (float)v54;
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)v71, (_QWORD *)v71[1]);
  v16[2](v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Average Tag Accuracy = %4.2f, Average Instance Accuracy = %4.2f \n"), v59, (float)(v19 / (float)v54)), &v74);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0)
      v55 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
    *(_DWORD *)buf = 134218498;
    *(double *)&buf[4] = v59;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v55;
    *(_WORD *)&buf[22] = 2048;
    v82 = v58;
    _os_log_debug_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Montreal Average Tag Accuracy = %4.2f, %s F-1 score = %4.2f \n", buf, 0x20u);
  }
  v60 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v60)
    -[TransferSeqTagMLFHelper evaluateMontrealModelOnData:evalLabels:evalEmbeddingsCache:embeddingRef:montrealModel:labelArray:trainingLogger:dataTypeString:predictedLabels:].cold.1(v60, v61, v62);
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)&v76, v77[0]);
  std::__tree<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>>>::destroy((uint64_t)&v78, v79[0]);
  return v58;
}

- (void)evaluateInferenceGraphWithInputTensorData:(void *)a3 batchedInputSentences:(void *)a4 batchedLabels:(void *)a5 inferenceGraph:(id)a6 inputPlaceholders:(void *)a7 scalarParams:(void *)a8 labelArray:(void *)a9 dataTypeString:()basic_string<char trainingLogger:()std:(std::allocator<char>> *)a10 :char_traits<char> predictedLabels:
{
  TransferSeqTagMLFHelper *v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t **v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  float v31;
  unint64_t v32;
  const void *v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  int v37;
  int v38;
  uint64_t **v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v47;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  double v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  TransferSeqTagMLFHelper *v60;
  uint64_t v62;
  void *context;
  unsigned int v65;
  unint64_t v66;
  uint64_t v67;
  void *v69;
  std::string v70;
  uint64_t v71[3];
  int v72;
  void *__p;
  void *v74;
  uint64_t v75;
  void **v76[3];
  char v77;
  uint64_t *v78;
  _QWORD *v79[2];
  uint64_t *v80;
  _QWORD *v81[2];
  void **p_p;
  uint8_t buf[24];
  double v84;
  uint8_t v85[4];
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;

  v13 = self;
  v14 = a9;
  v87 = *MEMORY[0x1E0C80C00];
  v15 = -[NSDictionary objectForKeyedSubscript:](self->_trainingParameters, "objectForKeyedSubscript:", CFSTR("maxLength"));
  if (v15)
    v62 = objc_msgSend(v15, "intValue");
  else
    v62 = 30;
  v16 = -[NSDictionary objectForKeyedSubscript:](v13->_trainingParameters, "objectForKeyedSubscript:", CFSTR("batchSize"));
  if (v16)
    v65 = objc_msgSend(v16, "intValue");
  else
    v65 = 32;
  v81[0] = 0;
  v81[1] = 0;
  v79[1] = 0;
  v80 = (uint64_t *)v81;
  v78 = (uint64_t *)v79;
  v79[0] = 0;
  LODWORD(v76[0]) = 0;
  if (*((_QWORD *)a9 + 1) != *(_QWORD *)a9)
  {
    do
    {
      *(_QWORD *)buf = v76;
      *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v78, (int *)v76, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
      LODWORD(__p) = 0;
      if (*((_QWORD *)a9 + 1) == *(_QWORD *)a9)
        break;
      do
      {
        *(_QWORD *)buf = v76;
        v17 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v80, (int *)v76, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(_QWORD *)buf = &__p;
        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v17 + 5, (int *)&__p, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
        v18 = (int)__p + 1;
        LODWORD(__p) = (_DWORD)__p + 1;
        v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a9 + 1) - *(_QWORD *)a9) >> 3);
      }
      while (v19 > v18);
      v20 = SLODWORD(v76[0]) + 1;
      ++LODWORD(v76[0]);
    }
    while (v19 > v20);
  }
  v77 = 0;
  (*(void (**)(uint64_t, uint64_t, char *))(v88 + 16))(v88, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Begin Validation...")), &v77);
  v69 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = *(_QWORD *)a8;
  if (*((_QWORD *)a8 + 1) != *(_QWORD *)a8)
  {
    v22 = 0;
    do
    {
      objc_msgSend(v69, "setObject:forKey:", objc_msgSend(*(id *)(v21 + 8 * v22), "data"), objc_msgSend(*(id *)(*(_QWORD *)a8 + 8 * v22), "label"));
      ++v22;
      v21 = *(_QWORD *)a8;
    }
    while (v22 < (uint64_t)(*((_QWORD *)a8 + 1) - *(_QWORD *)a8) >> 3);
  }
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v23 = 0;
    v24 = v65;
    v25 = (float)(int)v65;
    if (v65 <= 1)
      v24 = 1;
    v67 = v24;
    v26 = 0.0;
    v27 = 0.0;
    v60 = v13;
    v58 = a3;
    v59 = a7;
    while (1)
    {
      context = (void *)MEMORY[0x19401EF04]();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:].cold.3(v85, v23, &v86);
      memset(buf, 0, sizeof(buf));
      memset(v76, 0, sizeof(v76));
      v28 = *(_QWORD *)a7;
      if (*((_QWORD *)a7 + 1) != *(_QWORD *)a7)
      {
        v29 = 0;
        do
        {
          objc_msgSend(v69, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 24 * v23) + 8 * v29), objc_msgSend(*(id *)(v28 + 8 * v29), "label"));
          ++v29;
          v28 = *(_QWORD *)a7;
        }
        while (v29 < (uint64_t)(*((_QWORD *)a7 + 1) - *(_QWORD *)a7) >> 3);
      }
      -[TransferSeqTagMLFHelper executeInferenceGraph:inputsDictionary:batchSize:maxLength:labelSize:predictedLabels:](v13, "executeInferenceGraph:inputsDictionary:batchSize:maxLength:labelSize:predictedLabels:", a6, v69, v65, v62, -1431655765 * ((v14[1] - *v14) >> 3), buf);
      -[TransferSeqTagMLFHelper getMaxIndicesFromOneHotVectors:maxIndicesBatch:](v13, "getMaxIndicesFromOneHotVectors:maxIndicesBatch:", *(_QWORD *)a5 + 24 * v23, v76);
      if (v65)
        break;
      v31 = 0.0;
LABEL_40:
      __p = v76;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      v76[0] = (void **)buf;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](v76);
      objc_autoreleasePoolPop(context);
      v26 = v26 / v25;
      v27 = v27 + (float)(v31 / v25);
      ++v23;
      a3 = v58;
      a7 = v59;
      v14 = a9;
      v13 = v60;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v58[1] - *v58) >> 3) <= v23)
        goto LABEL_43;
    }
    v30 = 0;
    v31 = 0.0;
    v66 = v23;
    while (1)
    {
      if (0xAAAAAAAAAAAAAAABLL
         * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v23) + 24 * v30 + 8)
                    - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v23) + 24 * v30)) >> 3) >= (int)v62)
        v32 = (int)v62;
      else
        v32 = 0xAAAAAAAAAAAAAAABLL
            * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v23) + 24 * v30 + 8)
                       - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v23) + 24 * v30)) >> 3);
      v33 = *(const void **)(*(_QWORD *)buf + 24 * v30);
      v74 = 0;
      v75 = 0;
      __p = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>(&__p, v33, (uint64_t)v33 + 4 * v32, v32);
      std::vector<std::vector<int>>::push_back[abi:ne180100](v89, (uint64_t)&__p);
      if (__p)
      {
        v74 = __p;
        operator delete(__p);
      }
      if (v32)
      {
        v34 = 0;
        v35 = 0;
        v36 = 1;
        do
        {
          v38 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)buf + 24 * v30) + 4 * v34);
          LODWORD(__p) = *((_DWORD *)v76[0][3 * v30] + v34);
          v37 = (int)__p;
          p_p = &__p;
          v39 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v80, (int *)&__p, (uint64_t)&std::piecewise_construct, (_DWORD **)&p_p);
          v72 = v38;
          p_p = (void **)&v72;
          v40 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v39 + 5, &v72, (uint64_t)&std::piecewise_construct, (unsigned int **)&p_p);
          ++*((_DWORD *)v40 + 8);
          LODWORD(__p) = v37;
          p_p = &__p;
          v41 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v78, (int *)&__p, (uint64_t)&std::piecewise_construct, (unsigned int **)&p_p);
          v35 += v37 == v38;
          v36 &= v37 == v38;
          ++*((_DWORD *)v41 + 8);
          ++v34;
        }
        while (v32 != v34);
        v31 = v31 + (float)((float)v35 / (float)v32);
        v23 = v66;
        if ((v36 & 1) == 0)
          goto LABEL_37;
      }
      else
      {
        v31 = v31 + (float)(0.0 / (float)0);
      }
      v26 = v26 + 1.0;
LABEL_37:
      if (++v30 == v67)
        goto LABEL_40;
    }
  }
  v27 = 0.0;
  v26 = 0.0;
LABEL_43:
  v43 = *(_QWORD *)a5;
  v42 = *((_QWORD *)a5 + 1);
  v44 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v44)
    -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:].cold.1(v44, v45, v46);
  v47 = a10;
  var0 = a10;
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
  (*(void (**)(uint64_t, uint64_t, char *))(v88 + 16))(v88, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s data prediction completed.\n"), var0), &v77);
  std::map<int,int>::map[abi:ne180100](v71, (uint64_t)&v78);
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v70, a10->var0.var0.var0.var1.var0, a10->var0.var0.var0.var1.var1);
  else
    v70 = (std::string)a10->var0.var0;
  -[TransferSeqTagMLFHelper showF1ResultsMatrix:labelCounts:perLabelResults:trainingLogger:dataTypeString:](v13, "showF1ResultsMatrix:labelCounts:perLabelResults:trainingLogger:dataTypeString:", v14, v71, &v80, v88, &v70);
  v50 = v49;
  v51 = (float)(0xAAAAAAAAAAAAAAABLL * ((v42 - v43) >> 3));
  v52 = v27 / v51;
  v53 = v26 / v51;
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)v71, (_QWORD *)v71[1]);
  v54 = v52;
  (*(void (**)(uint64_t, uint64_t, char *))(v88 + 16))(v88, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Average Tag Accuracy = %4.2f, Instance Accuracy = %4.2f \n"), *(_QWORD *)&v54, v53), &v77);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0)
      v47 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
    *(_DWORD *)buf = 134218498;
    *(double *)&buf[4] = v54;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2048;
    v84 = v50;
    _os_log_debug_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "MLF Average Tag Accuracy = %4.2f , %s F-1 Score = %4.2f\n", buf, 0x20u);
  }
  v55 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v55)
    -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:].cold.1(v55, v56, v57);
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)&v78, v79[0]);
  std::__tree<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>>>::destroy((uint64_t)&v80, v81[0]);
}

- (void)executeInferenceGraph:(id)a3 inputsDictionary:(id)a4 batchSize:(int)a5 maxLength:(int)a6 labelSize:(int)a7 predictedLabels:(void *)a8
{
  _QWORD v8[7];
  int v9;
  int v10;
  int v11;
  _QWORD v12[6];
  void *__p;
  void *v14;
  uint64_t v15;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x4812000000;
  v12[3] = __Block_byref_object_copy__2;
  v12[4] = __Block_byref_object_dispose__2;
  v12[5] = "";
  __p = 0;
  v14 = 0;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__TransferSeqTagMLFHelper_executeInferenceGraph_inputsDictionary_batchSize_maxLength_labelSize_predictedLabels___block_invoke;
  v8[3] = &unk_1E2DF4DA8;
  v9 = a5;
  v10 = a6;
  v11 = a7;
  v8[4] = self;
  v8[5] = v12;
  v8[6] = a8;
  objc_msgSend(a3, "executeWithInputsData:batchSize:options:completionHandler:", a4, a5, 2, v8);
  _Block_object_dispose(v12, 8);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
}

uint64_t __112__TransferSeqTagMLFHelper_executeInferenceGraph_inputsDictionary_batchSize_maxLength_labelSize_predictedLabels___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  unint64_t v10;
  _DWORD *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  int v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;

  result = objc_msgSend(*(id *)(a1 + 32), "findMaxIndexWithData:batchSize:sequenceLength:numClasses:", objc_msgSend(a2, "data"), *(int *)(a1 + 56), *(int *)(a1 + 60), *(int *)(a1 + 64));
  if (*(_DWORD *)(a1 + 56))
  {
    v4 = (void *)result;
    v5 = 0;
    do
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 48);
      if (*(_DWORD *)(a1 + 60))
      {
        v6 = 0;
        do
        {
          v7 = *(_QWORD *)(objc_msgSend(v4, "bytes") + 8 * (v6 + v5 * *(int *)(a1 + 60)));
          v8 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
          v9 = (char *)v8[7];
          v10 = v8[8];
          if ((unint64_t)v9 >= v10)
          {
            v12 = (char *)v8[6];
            v13 = (v9 - v12) >> 2;
            if ((unint64_t)(v13 + 1) >> 62)
              std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
            v14 = v10 - (_QWORD)v12;
            v15 = (uint64_t)(v10 - (_QWORD)v12) >> 1;
            if (v15 <= v13 + 1)
              v15 = v13 + 1;
            if (v14 >= 0x7FFFFFFFFFFFFFFCLL)
              v16 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v16 = v15;
            if (v16)
            {
              v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v8 + 8), v16);
              v12 = (char *)v8[6];
              v9 = (char *)v8[7];
            }
            else
            {
              v17 = 0;
            }
            v18 = &v17[4 * v13];
            *(_DWORD *)v18 = v7;
            v11 = v18 + 4;
            while (v9 != v12)
            {
              v19 = *((_DWORD *)v9 - 1);
              v9 -= 4;
              *((_DWORD *)v18 - 1) = v19;
              v18 -= 4;
            }
            v8[6] = v18;
            v8[7] = v11;
            v8[8] = &v17[4 * v16];
            if (v12)
              operator delete(v12);
          }
          else
          {
            *(_DWORD *)v9 = v7;
            v11 = v9 + 4;
          }
          v8[7] = v11;
          ++v6;
        }
        while (v6 < *(int *)(a1 + 60));
      }
      v20 = *(uint64_t **)(a1 + 48);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48;
      v22 = v20[1];
      if (v22 >= v20[2])
      {
        result = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v20, v21);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v20, v21);
        result = v22 + 24;
      }
      v20[1] = result;
      ++v5;
    }
    while (v5 < *(int *)(a1 + 56));
  }
  return result;
}

- (NSDictionary)trainingParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)printLstmWeights:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "\n=============================================\n", v3);
  OUTLINED_FUNCTION_1_0();
}

- (double)printLstmWeights:(uint8_t *)buf .cold.2(uint64_t a1, uint64_t a2, uint8_t *buf, double *a4)
{
  double v4;
  double result;

  v4 = *(float *)(a1 + 4 * a2);
  *(_DWORD *)buf = 134217984;
  *a4 = v4;
  _os_log_debug_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "\t%f", buf, 0xCu);
  return result;
}

- (void)printLstmWeights:(uint64_t *)a3 .cold.3(uint8_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend(&unk_1E2DF9078, "objectAtIndexedSubscript:", a2), "UTF8String");
  *(_DWORD *)a1 = 136315138;
  *a3 = v5;
  _os_log_debug_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "\nW_type:%s\n", a1, 0xCu);
}

- (void)printLstmWeights:(_DWORD *)a3 .cold.4(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_3_1(&dword_191C5D000, MEMORY[0x1E0C81028], (uint64_t)a3, "Gate#:%d\n", a1);
}

- (void)printLstmWeights:(_BYTE *)a1 .cold.5(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], v2, "\n====================\n", v3);
}

- (void)printLstmWeights:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "\n===============LSTM Weights==================\n", v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)createTrainingGraphFromGraphObject:(void *)a1 inputPlaceholders:scalarWeights:targetLabels:targeLabelWeights:device:.cold.1(void *a1)
{
  uint64_t v1;
  uint8_t v2[16];

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], v1, "\nError creating Training Graph", v2);
  }
  objc_end_catch();
  OUTLINED_FUNCTION_1_0();
}

- (void)createInferenceGraphFromGraphObject:(void *)a1 inputPlaceholders:scalarWeights:finalLayerTensor:device:.cold.1(void *a1)
{
  uint64_t v1;
  uint8_t v2[16];

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], v1, "\nError creating Inference Graph", v2);
  }
  objc_end_catch();
  OUTLINED_FUNCTION_1_0();
}

- (void)doSeqTagTrainingAndEvalFromData:(_BYTE *)a1 batchedLabels:(_BYTE *)a2 batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.1(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], v2, "\n=========================================================================================\n", v3);
}

- (void)doSeqTagTrainingAndEvalFromData:(_BYTE *)a1 batchedLabels:(_BYTE *)a2 batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.2(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], v2, "\nLast batch completed", v3);
}

- (void)doSeqTagTrainingAndEvalFromData:(_BYTE *)a1 batchedLabels:(_BYTE *)a2 batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.3(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_2_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], v2, "\nWaiting for completion of the last batch", v3);
}

- (void)doSeqTagTrainingAndEvalFromData:(uint64_t)a3 batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "\nCaching Evaluation embeddings", v3);
  OUTLINED_FUNCTION_1_0();
}

double __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke_cold_1(uint64_t a1, float *a2)
{
  uint64_t v2;
  double v3;
  double result;
  _DWORD v5[2];
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *a2;
  v5[0] = 67109376;
  v5[1] = v2;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_191C5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "\nBatch No.: [%d]. Loss = %4.2f", (uint8_t *)v5, 0x12u);
  return result;
}

- (void)evaluateMontrealModelOnData:(uint64_t)a3 evalLabels:evalEmbeddingsCache:embeddingRef:montrealModel:labelArray:trainingLogger:dataTypeString:predictedLabels:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "\n=========================================================================================\n", v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluateInferenceGraphWithInputTensorData:(uint64_t)a3 batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_191C5D000, MEMORY[0x1E0C81028], a3, "=========================================================================================\n", v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluateInferenceGraphWithInputTensorData:(_DWORD *)a3 batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:.cold.3(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_3_1(&dword_191C5D000, MEMORY[0x1E0C81028], (uint64_t)a3, "Eval Batch No.: [%d]. \n", a1);
}

@end

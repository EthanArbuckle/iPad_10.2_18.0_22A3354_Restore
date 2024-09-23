@implementation VNFgBgE5MLProcess

- (VNFgBgE5MLProcess)initWithConfiguration:(id)a3
{
  id v4;
  VNFgBgE5MLProcess *v5;
  uint64_t v6;
  NSURL *modelURL;
  uint64_t v8;
  NSString *inputImageName;
  uint64_t v10;
  NSArray *inputTensorNames;
  uint64_t v12;
  NSArray *outputTensorNames;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNFgBgE5MLProcess;
  v5 = -[VNFgBgE5MLProcess init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "modelURL");
    v6 = objc_claimAutoreleasedReturnValue();
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v6;

    objc_msgSend(v4, "inputImageName");
    v8 = objc_claimAutoreleasedReturnValue();
    inputImageName = v5->_inputImageName;
    v5->_inputImageName = (NSString *)v8;

    objc_msgSend(v4, "inputTensorNames");
    v10 = objc_claimAutoreleasedReturnValue();
    inputTensorNames = v5->_inputTensorNames;
    v5->_inputTensorNames = (NSArray *)v10;

    objc_msgSend(v4, "outputTensorNames");
    v12 = objc_claimAutoreleasedReturnValue();
    outputTensorNames = v5->_outputTensorNames;
    v5->_outputTensorNames = (NSArray *)v12;

  }
  return v5;
}

- (id)newInputsForFunctionDescriptor:(id)a3 inputSurfaces:(id)a4 croppedPixelBuffer:(__CVBuffer *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  if (a5)
  {
    objc_msgSend(v9, "onlyInputImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v11, "assignPixelBuffer:toName:error:", a5, v14, a6);

      if ((v15 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      if (!a6)
        goto LABEL_12;
      +[VNFgBgInstanceSegmenterError genericErrorImageDescription](VNFgBgInstanceSegmenterError, "genericErrorImageDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNFgBgInstanceSegmenterError errorWithCode:description:](VNFgBgInstanceSegmenterError, "errorWithCode:description:", -2, v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    a6 = 0;
    goto LABEL_12;
  }
LABEL_4:
  v16 = 0;
  while (1)
  {
    objc_msgSend(v10, "inputTensors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 <= v16)
      break;
    objc_msgSend(v10, "inputTensors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "valueRef");
    objc_msgSend(v20, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_msgSend(v11, "assignSurface:toName:error:", v21, v22, a6);

    ++v16;
    if ((v21 & 1) == 0)
      goto LABEL_11;
  }
  a6 = (id *)v11;
LABEL_12:

  return a6;
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)inputImageName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)inputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)outputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputImageName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 fromFunctionDescriptor:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "outputNamed:error:", v9, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "strides");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "dataType");
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3575;
    v33 = __Block_byref_object_dispose__3576;
    v34 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__VNFgBgE5MLProcess_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke;
    aBlock[3] = &unk_1E4543920;
    v28 = v15;
    v16 = v23;
    v25 = v16;
    v17 = v14;
    v26 = v17;
    v27 = &v29;
    v18 = _Block_copy(aBlock);
    objc_msgSend(v13, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "accessReadOnlyDataForName:usingBlock:error:", v19, v18, a6);

    if ((v20 & 1) != 0)
      v21 = (id)v30[5];
    else
      v21 = 0;

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __85__VNFgBgE5MLProcess_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  vImage_Buffer dest;
  vImage_Buffer src;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  v4 = (void *)objc_msgSend(v3, "bytes");
  if (*(_QWORD *)(a1 + 56) == 65552)
  {
    v5 = malloc_type_calloc(2 * objc_msgSend(v3, "length"), 1uLL, 0x9960A8BBuLL);
    v6 = objc_msgSend(v3, "length");
    src.data = v4;
    src.height = 1;
    src.width = v6 >> 1;
    src.rowBytes = v6 & 0xFFFFFFFFFFFFFFFELL;
    dest.data = v5;
    dest.height = 1;
    dest.width = v6 >> 1;
    dest.rowBytes = 4 * (v6 >> 1);
    vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  }
  else
  {
    v5 = malloc_type_calloc(objc_msgSend(v3, "length"), 1uLL, 0xA414156FuLL);
    memcpy(v4, v5, objc_msgSend(v3, "length"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "sizes") + 8));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "sizes") + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "sizes") + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "byteOffsets") + 8) / 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "byteOffsets") + 16) / 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "byteOffsets") + 24) / 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", v5, v10, 65568, v14, &__block_literal_global_3579, 0);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  return 1;
}

void __85__VNFgBgE5MLProcess_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke_2(int a1, void *a2)
{
  free(a2);
}

@end

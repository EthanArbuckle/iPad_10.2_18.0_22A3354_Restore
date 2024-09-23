@implementation VCPImageDescriptor

+ (BOOL)usePHAssetData
{
  return 0;
}

+ (int)preferredPixelFormat
{
  return 875704438;
}

+ (id)descriptorWithImage:(__CVBuffer *)a3
{
  return -[VCPImageDescriptor initWithImage:]([VCPImageDescriptor alloc], "initWithImage:", a3);
}

+ (id)descriptorWithData:(id)a3
{
  id v3;
  VCPImageDescriptor *v4;

  v3 = a3;
  v4 = -[VCPImageDescriptor initWithData:]([VCPImageDescriptor alloc], "initWithData:", v3);

  return v4;
}

- (VCPImageDescriptor)initWithImage:(__CVBuffer *)a3
{
  VCPImageDescriptor *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  VNImageprint *imagePrint;
  VCPImageDescriptor *v20;
  int v21;
  int v22;
  VCPImageDescriptor *v23;
  void *context;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)VCPImageDescriptor;
  v4 = -[VCPImageDescriptor init](&v31, sel_init);
  if (v4)
  {
    context = (void *)MEMORY[0x1BCCA1B2C]();
    v5 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v6 = (void *)objc_msgSend(v5, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CEDE38]);
      v8 = v7;
      if (v7
        && (objc_msgSend(v7, "setPreferBackgroundProcessing:", 1),
            v33[0] = v8,
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v6, "performRequests:error:", v9, 0),
            v9,
            (v10 & 1) != 0))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v8, "results");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v12)
        {
          v13 = 0;
          v14 = *(_QWORD *)v28;
          do
          {
            v15 = 0;
            v16 = v13;
            v17 = v12;
            v13 += v12;
            do
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "imageprint");
              v18 = objc_claimAutoreleasedReturnValue();
              imagePrint = v4->_imagePrint;
              v4->_imagePrint = (VNImageprint *)v18;

              ++v15;
            }
            while (v12 != v15);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v12);

          if (v16 + v17 - 1 >= 1
            && (int)MediaAnalysisLogLevel() >= 4
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Image descriptor - found more than 1 VNImageprintObservations", buf, 2u);
          }
        }
        else
        {

        }
        v22 = 0;
        v21 = 1;
      }
      else
      {
        v21 = 0;
        v22 = -18;
      }
    }
    else
    {
      v8 = 0;
      v21 = 0;
      v22 = -108;
    }

    objc_autoreleasePoolPop(context);
    if (v21 && !v4->_imagePrint)
      v22 = -18;
    if (v22)
      v23 = 0;
    else
      v23 = v4;
    v20 = v23;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (VCPImageDescriptor)initWithData:(id)a3
{
  id v4;
  VCPImageDescriptor *v5;
  uint64_t v6;
  id v7;
  VNImageprint *imagePrint;
  VCPImageDescriptor *v9;
  VCPImageDescriptor *v10;
  void *v11;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPImageDescriptor;
  v5 = -[VCPImageDescriptor init](&v14, sel_init);
  if (v5)
  {
    if (v4)
    {
      v13 = 0;
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEDF80]), "initWithState:error:", v4, &v13);
      v7 = v13;
      imagePrint = v5->_imagePrint;
      v5->_imagePrint = (VNImageprint *)v6;

      if (v5->_imagePrint)
      {
        v9 = v5;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v11;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VNImageprint init error: %@", buf, 0xCu);

        }
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      v7 = 0;
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serialize
{
  return (id)-[VNImageprint serializeStateAndReturnError:](self->_imagePrint, "serializeStateAndReturnError:", 0);
}

- (int)computeDistance:(float *)a3 toDescriptor:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  int v8;

  -[VNImageprint distanceToImageprint:error:](self->_imagePrint, "distanceToImageprint:error:", *((_QWORD *)a4 + 1), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    v7 = 0;
    *(_DWORD *)a3 = v8;
  }
  else
  {
    v7 = -18;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePrint, 0);
}

@end

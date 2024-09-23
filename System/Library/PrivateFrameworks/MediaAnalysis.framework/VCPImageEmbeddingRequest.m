@implementation VCPImageEmbeddingRequest

- (VCPImageEmbeddingRequest)initWithOptions:(id)a3
{
  VCPImageEmbeddingRequest *v3;
  VCPImageEmbeddingRequest *v4;
  unsigned int revision;
  uint64_t v6;
  VCPImageBackboneAnalyzer *v7;
  void *v8;
  uint64_t v9;
  VCPImageBackboneAnalyzer *analyzer;
  VCPImageEmbeddingRequest *v11;
  VCPImageEmbeddingRequest *v12;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VCPImageEmbeddingRequest;
  v3 = -[VCPRequest initWithOptions:](&v15, sel_initWithOptions_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_12;
  revision = v3->super._revision;
  if (!revision)
  {
    v6 = 4;
    v3->super._revision = 4;
LABEL_11:
    v7 = [VCPImageBackboneAnalyzer alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VCPImageBackboneAnalyzer initWithRequestedAnalyses:andRevision:useSharedModel:](v7, "initWithRequestedAnalyses:andRevision:useSharedModel:", 0x1000000000000, v8, 0);
    analyzer = v4->_analyzer;
    v4->_analyzer = (VCPImageBackboneAnalyzer *)v9;

    goto LABEL_12;
  }
  if (revision == 5)
    v6 = 5;
  else
    v6 = 4;
  if ((revision & 0xFFFFFFFE) == 4)
    goto LABEL_11;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14[0] = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPImageEmbeddingRequest only supports revision 4 and revision 5", (uint8_t *)v14, 2u);
  }
LABEL_12:
  if (v4->_analyzer)
    v11 = v4;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  __CVBuffer *v6;
  void *v8;
  VCPImageBackboneAnalyzer *analyzer;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VCPImageEmbeddingObservation *v23;
  void *v24;
  void *v25;
  uint8_t buf[16];
  id v28;
  _QWORD v29[2];
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v6 = a3;
  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  analyzer = self->_analyzer;
  v28 = 0;
  LODWORD(v6) = -[VCPImageBackboneAnalyzer analyzePixelBuffer:flags:results:cancel:](analyzer, "analyzePixelBuffer:flags:results:cancel:", v6, 0, &v28, &__block_literal_global_6);
  v10 = v28;
  v11 = v10;
  if (!(_DWORD)v6)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ImageEmbeddingResults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count"))
      goto LABEL_17;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("embeddings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("attributes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19 || objc_msgSend(v19, "intValue") != self->super._revision)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageEmbeddingTask unexpected image embedding version", buf, 2u);
      }
      if (a5)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPMADImageEmbeddingTask unexpected image embedding version. Expect %d, got %d"), self->super._revision, objc_msgSend(v19, "intValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    if (!v14)
      goto LABEL_17;
    v23 = objc_alloc_init(VCPImageEmbeddingObservation);
    -[VCPImageEmbeddingObservation setVersion:](v23, "setVersion:", self->super._revision);
    -[VCPImageEmbeddingObservation setData:](v23, "setData:", v14);
    -[VCPImageEmbeddingObservation setType:](v23, "setType:", 1);
    -[VCPImageEmbeddingObservation setCount:](v23, "setCount:", (unint64_t)objc_msgSend(v14, "length") >> 1);
    v29[0] = &unk_1E6B726C8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VCPImageEmbeddingObservation count](v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPImageEmbeddingObservation setShape:](v23, "setShape:", v25);

    if (v23)
      objc_msgSend(v8, "addObject:", v23);

LABEL_16:
LABEL_17:

    goto LABEL_18;
  }
  if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCPImageEmbeddingRequest image embedding analysis failed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_18:

  return v8;
}

uint64_t __59__VCPImageEmbeddingRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  int width;
  int height;
  int v7;
  int v8;
  objc_super v11;

  width = self->super._width;
  height = self->super._height;
  v11.receiver = self;
  v11.super_class = (Class)VCPImageEmbeddingRequest;
  -[VCPRequest updateWithOptions:error:](&v11, sel_updateWithOptions_error_, a3, a4);
  v7 = self->super._width;
  if (width != v7)
  {
    if (v7 < 1)
      return 1;
    v8 = self->super._height;
    goto LABEL_10;
  }
  v8 = self->super._height;
  if (width >= 1 && height != v8)
  {
LABEL_10:
    if (v8 >= 1)
    {
      self->_preferredWidth = v7;
      self->_preferredHeight = self->super._height;
      self->_preferredFormat = 1111970369;
    }
  }
  return 1;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double preferredWidth;
  double preferredHeight;
  CGSize result;

  preferredWidth = (double)self->_preferredWidth;
  preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  VCPImageBackboneAnalyzer *analyzer;

  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end

@implementation VCPImageLivePhotoBlurAnalyzer

- (VCPImageLivePhotoBlurAnalyzer)initWithMovingObjectsResults:(id)a3
{
  id v5;
  VCPImageLivePhotoBlurAnalyzer *v6;
  VCPImageLivePhotoBlurAnalyzer *v7;
  VCPImageLivePhotoBlurAnalyzer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPImageLivePhotoBlurAnalyzer;
  v6 = -[VCPImageLivePhotoBlurAnalyzer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
      objc_storeStrong((id *)&v6->_movingObjects, a3);
    v8 = v7;
  }

  return v7;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  id v9;
  void *v10;
  int v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = v9;
  if (!v9 || ((*((uint64_t (**)(id))v9 + 2))(v9) & 1) == 0)
  {
    v17 = 1065353216;
    if (-[NSArray count](self->_movingObjects, "count"))
    {
      v11 = -[VCPBlurAnalyzer computeSharpnessScore:forObjects:inImage:](self, "computeSharpnessScore:forObjects:inImage:", &v17, self->_movingObjects, a3);
      if (v11)
        goto LABEL_9;
      LODWORD(v12) = v17;
    }
    else
    {
      LODWORD(v12) = 1.0;
    }
    v21 = CFSTR("IrisSharpnessResults");
    v18 = CFSTR("quality");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    goto LABEL_9;
  }
  v11 = -128;
LABEL_9:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingObjects, 0);
}

@end

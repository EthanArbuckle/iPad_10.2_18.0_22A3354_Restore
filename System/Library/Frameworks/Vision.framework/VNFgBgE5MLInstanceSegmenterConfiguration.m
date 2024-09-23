@implementation VNFgBgE5MLInstanceSegmenterConfiguration

- (id)initDefaultConfig
{
  char *v2;
  _QWORD *v3;
  void *v4;
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
  id v15;
  VNFgBgE5MLInstanceSegmenterThresholds *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VNFgBgE5MLInstanceSegmenterConfiguration;
  v2 = -[VNFgBgE5MLInstanceSegmenterConfiguration init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 88) = xmmword_1A15FB7C0;
    *((_QWORD *)v2 + 1) = 0x4000000001ELL;
    *((_DWORD *)v2 + 4) = 4;
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 3) = 1;
    *((_QWORD *)v2 + 4) = CFSTR("input");

    v5 = (void *)v3[5];
    v3[5] = &unk_1E459E258;

    v6 = (void *)v3[6];
    v3[6] = &unk_1E459E270;

    v7 = (void *)v3[7];
    v3[7] = &unk_1E459E288;

    v8 = (void *)v3[8];
    v3[8] = &unk_1E459E2A0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "resourcePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = CFSTR("foregroundbackgroundsegmenter.mlmodelc");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPathComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v3[9];
    v3[9] = v13;
    v15 = v13;

    v16 = -[VNFgBgE5MLInstanceSegmenterThresholds initWithRevision:error:]([VNFgBgE5MLInstanceSegmenterThresholds alloc], "initWithRevision:error:", 1, 0);
    v17 = (void *)v3[10];
    v3[10] = v16;

  }
  return v3;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (CGSize)inputSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_inputSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)queryNumber
{
  return self->_queryNumber;
}

- (int)maxSpatialLength
{
  return self->_maxSpatialLength;
}

- (int)radius
{
  return self->_radius;
}

- (NSString)inputImageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)inputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)outputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)modelOutputInstanceInvalidMiyoshiCategory
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)modelOutputInstanceInvalidCocoCategory
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (VNFgBgE5MLInstanceSegmenterThresholds)thresholds
{
  return (VNFgBgE5MLInstanceSegmenterThresholds *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_modelOutputInstanceInvalidCocoCategory, 0);
  objc_storeStrong((id *)&self->_modelOutputInstanceInvalidMiyoshiCategory, 0);
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputImageName, 0);
}

+ (id)configurationForRevision:(unint64_t)a3 error:(id *)a4
{
  void *v4;
  void *v6;

  if (a3 == 1)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initDefaultConfig");
  }
  else
  {
    if (a4)
    {
      +[VNFgBgInstanceSegmenterError genericErrorConfigDescription](VNFgBgInstanceSegmenterError, "genericErrorConfigDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNFgBgInstanceSegmenterError errorWithCode:description:](VNFgBgInstanceSegmenterError, "errorWithCode:description:", -4, v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v4 = 0;
  }
  return v4;
}

@end

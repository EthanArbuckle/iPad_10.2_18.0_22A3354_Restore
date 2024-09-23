@implementation FeatureExtractor

+ (unint64_t)numLevels
{
  return 5;
}

- (FeatureExtractor)initWithMode:(int64_t)a3
{
  return -[FeatureExtractor initWithMode:revision:](self, "initWithMode:revision:", a3, 1);
}

- (FeatureExtractor)initWithMode:(int64_t)a3 revision:(int64_t)a4
{
  NSString *espresso_file;
  FeatureExtractor *v8;
  FeatureExtractor *v9;
  objc_super v11;

  -[EspressoModel setUsage:](self, "setUsage:");
  -[FeatureExtractor setRevision:](self, "setRevision:", a4);
  -[FeatureExtractor setupNetworkModel](self, "setupNetworkModel");
  espresso_file = self->_espresso_file;
  v11.receiver = self;
  v11.super_class = (Class)FeatureExtractor;
  v8 = -[EspressoModel initWithModelName:usage:](&v11, sel_initWithModelName_usage_, espresso_file, a3);
  if (v8)
  {
    v8->_numLevels = objc_msgSend((id)objc_opt_class(), "numLevels");
    v9 = v8;
  }

  return v8;
}

- (void)setupNetworkModel
{
  NSString *v3;
  NSString *espresso_file;
  NSString *v5;
  NSString *v6;
  uint64_t v7;
  unint64_t v8;

  self->_inputBlob = "input_image";
  self->_outputBlobs = (const char **)&outputBlobNames;
  v7 = 0;
  v8 = 0;
  FRCGetInputFrameSizeForUsage(-[EspressoModel usage](self, "usage"), (uint64_t *)&v8, &v7);
  if (v8 < 0x3E9)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("optical_flow_feature_extractor_pyrlite"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("optical_flow_feature_extractor_pyrlite_HD"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  espresso_file = self->_espresso_file;
  self->_espresso_file = v3;

  if (self->_revision != 1)
  {
    -[NSString stringByAppendingFormat:](self->_espresso_file, "stringByAppendingFormat:", CFSTR("_rev%ld"), self->_revision);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_espresso_file;
    self->_espresso_file = v5;

  }
}

- (BOOL)extractFeaturesFromImage:(__CVBuffer *)a3 toFeatures:(id *)a4 callback:(id)a5
{
  id v6;
  BOOL v7;
  unint64_t v8;
  int v9;
  uint64_t v11;
  id v12;

  v6 = a5;
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("FeatureExractor: Error ! Failed to bind the input\n"));
LABEL_3:
    v7 = 0;
    goto LABEL_11;
  }
  if (self->_numLevels)
  {
    v8 = 0;
    while (!espresso_network_bind_direct_cvpixelbuffer())
    {
      v8 = (v8 + 1);
      if (self->_numLevels <= v8)
        goto LABEL_8;
    }
    NSLog(CFSTR("FeatureExractor: Error ! Failed to bind the output buffer [%d]"), v8);
    goto LABEL_3;
  }
LABEL_8:
  kdebug_trace();
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v9 = espresso_plan_submit();
  v7 = v9 == 0;
  if (v9)
    NSLog(CFSTR("FeatureExtractor: Error !! Network execution Failed. (Usage:%ld)"), -[EspressoModel usage](self, "usage"), v11, 3221225472, __65__FeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke, &unk_1E9786948, v12);

LABEL_11:
  return v7;
}

uint64_t __65__FeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getOutputTensorSize:(id *)a3 level:(unsigned int)a4
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11[0] = xmmword_1D428E690;
  v11[1] = xmmword_1D428E6A0;
  v11[2] = xmmword_1D428E6B0;
  v9 = 0;
  v10 = 0;
  FRCGetInputFrameSizeForUsage(-[EspressoModel usage](self, "usage"), &v10, &v9);
  v7 = v9;
  v6 = v10;
  v8 = a4 + 1;
  do
  {
    v6 = (unint64_t)(v6 + 1) >> 1;
    v7 = (unint64_t)(v7 + 1) >> 1;
    --v8;
  }
  while (v8);
  a3->var0 = v6;
  a3->var1 = v7;
  a3->var2 = *((_QWORD *)v11 + a4);
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (BOOL)baseStage
{
  return self->_baseStage;
}

- (void)setBaseStage:(BOOL)a3
{
  self->_baseStage = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espresso_file, 0);
}

@end

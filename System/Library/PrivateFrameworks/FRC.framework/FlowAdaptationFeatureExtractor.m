@implementation FlowAdaptationFeatureExtractor

+ (unint64_t)numLevels
{
  return 1;
}

- (FlowAdaptationFeatureExtractor)initWithMode:(int64_t)a3
{
  return -[FlowAdaptationFeatureExtractor initWithMode:revision:](self, "initWithMode:revision:", a3, 1);
}

- (FlowAdaptationFeatureExtractor)initWithMode:(int64_t)a3 revision:(int64_t)a4
{
  NSString *espresso_file;
  FlowAdaptationFeatureExtractor *v8;
  objc_super v10;

  -[EspressoModel setUsage:](self, "setUsage:");
  -[FeatureExtractor setRevision:](self, "setRevision:", a4);
  -[FlowAdaptationFeatureExtractor setupNetworkModel](self, "setupNetworkModel");
  espresso_file = self->super._espresso_file;
  v10.receiver = self;
  v10.super_class = (Class)FlowAdaptationFeatureExtractor;
  v8 = -[EspressoModel initWithModelName:usage:](&v10, sel_initWithModelName_usage_, espresso_file, a3);
  if (!v8)
    NSLog(CFSTR("Error: failed to create FlowAdaptationFeatureExtractor for usage %d"), a3);
  return v8;
}

- (void)setupNetworkModel
{
  NSString *espresso_file;
  NSString *v4;
  NSString *v5;

  self->super._inputBlob = "0";
  self->super._outputBlobs = (const char **)&outputBlobNames_2;
  espresso_file = self->super._espresso_file;
  self->super._espresso_file = (NSString *)CFSTR("flow_adaptation_feature_extractor");

  if (-[FeatureExtractor revision](self, "revision") != 1)
  {
    -[NSString stringByAppendingFormat:](self->super._espresso_file, "stringByAppendingFormat:", CFSTR("_rev%ld"), -[FeatureExtractor revision](self, "revision"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->super._espresso_file;
    self->super._espresso_file = v4;

  }
}

- (BOOL)extractFeaturesFromImage:(__CVBuffer *)a3 toFeatures:(id *)a4 callback:(id)a5
{
  id v6;
  BOOL v7;
  int v9;
  uint64_t v10;
  id v11;

  v6 = a5;
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("FlowAdaptationFeatureExtractor: Error ! Failed to bind the input\n"));
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("FlowAdaptationFeatureExtractor: Error ! Failed to bind the output buffer\n"));
    goto LABEL_5;
  }
  v10 = MEMORY[0x1E0C809B0];
  v11 = v6;
  v9 = espresso_plan_submit();
  v7 = v9 == 0;
  if (v9)
    NSLog(CFSTR("FlowAdaptationFeatureExtractor: Error !! Network execution Failed. (Usage:%ld)"), -[EspressoModel usage](self, "usage"), v10, 3221225472, __79__FlowAdaptationFeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke, &unk_1E9786948, v11);

LABEL_6:
  return v7;
}

uint64_t __79__FlowAdaptationFeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getOutputTensorSize:(id *)a3 level:(unsigned int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FlowAdaptationFeatureExtractor;
  -[FeatureExtractor getOutputTensorSize:level:](&v5, sel_getOutputTensorSize_level_, a3, 0);
  *(uint64x2_t *)&a3->var0 = vshrq_n_u64(*(uint64x2_t *)&a3->var0, 1uLL);
  a3->var2 = 64;
}

@end

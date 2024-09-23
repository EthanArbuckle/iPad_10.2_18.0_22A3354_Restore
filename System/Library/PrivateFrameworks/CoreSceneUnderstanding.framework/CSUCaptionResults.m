@implementation CSUCaptionResults

- (CSUCaptionResults)initWithCaptionResults:(id)a3
{
  id v5;
  CSUCaptionResults *v6;
  CSUCaptionResults *v7;
  CSUBuffer *decoderFeaturesCSUBuffer;
  MLMultiArray *decoderFeaturesMLMultiArray;
  CSUCaptionResults *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUCaptionResults;
  v6 = -[CSUCaptionResults init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_results, a3);
    decoderFeaturesCSUBuffer = v7->_decoderFeaturesCSUBuffer;
    v7->_decoderFeaturesCSUBuffer = 0;

    decoderFeaturesMLMultiArray = v7->_decoderFeaturesMLMultiArray;
    v7->_decoderFeaturesMLMultiArray = 0;

    v10 = v7;
  }

  return v7;
}

+ (id)createCaptionResultsWithResults:(id)a3
{
  id v3;
  CSUCaptionResults *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [CSUCaptionResults alloc];
  v8 = (void *)objc_msgSend_initWithCaptionResults_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (NSArray)results
{
  return self->_results;
}

- (CSUBuffer)decoderFeaturesCSUBuffer
{
  return self->_decoderFeaturesCSUBuffer;
}

- (void)setDecoderFeaturesCSUBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_decoderFeaturesCSUBuffer, a3);
}

- (MLMultiArray)decoderFeaturesMLMultiArray
{
  return self->_decoderFeaturesMLMultiArray;
}

- (void)setDecoderFeaturesMLMultiArray:(id)a3
{
  objc_storeStrong((id *)&self->_decoderFeaturesMLMultiArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderFeaturesMLMultiArray, 0);
  objc_storeStrong((id *)&self->_decoderFeaturesCSUBuffer, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end

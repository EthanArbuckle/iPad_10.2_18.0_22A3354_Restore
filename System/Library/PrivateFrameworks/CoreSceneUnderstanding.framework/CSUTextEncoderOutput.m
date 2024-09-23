@implementation CSUTextEncoderOutput

- (CSUTextEncoderOutput)init
{
  CSUTextEncoderOutput *v2;
  CSUTextEncoderOutput *v3;
  MLMultiArray *CSUTextEmbedding;
  NSDictionary *additionalLayers;
  CSUTextEncoderOutput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSUTextEncoderOutput;
  v2 = -[CSUTextEncoderOutput init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    CSUTextEmbedding = v2->_CSUTextEmbedding;
    v2->_CSUTextEmbedding = 0;

    additionalLayers = v3->_additionalLayers;
    v3->_additionalLayers = 0;

    v6 = v3;
  }

  return v3;
}

- (CSUTextEncoderOutput)initWithTextEmbedding:(id)a3
{
  id v5;
  CSUTextEncoderOutput *v6;
  CSUTextEncoderOutput *v7;
  CSUTextEncoderOutput *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUTextEncoderOutput;
  v6 = -[CSUTextEncoderOutput init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_CSUTextEmbedding, a3);
    v8 = v7;
  }

  return v7;
}

- (MLMultiArray)CSUTextEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCSUTextEmbedding:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLayers, a3);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)tokenIds
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenSegments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)truncatedInput
{
  return self->_truncatedInput;
}

- (void)setTruncatedInput:(BOOL)a3
{
  self->_truncatedInput = a3;
}

- (NSString)processedInput
{
  return self->_processedInput;
}

- (void)setProcessedInput:(id)a3
{
  objc_storeStrong((id *)&self->_processedInput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedInput, 0);
  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_tokenIds, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_CSUTextEmbedding, 0);
}

@end

@implementation ShaderBinaryInfo

- (ShaderBinaryInfo)init
{
  ShaderBinaryInfo *v2;
  ShaderBinaryInfo *v3;
  ShaderBinaryInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ShaderBinaryInfo;
  v2 = -[ShaderBinaryInfo init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (NSData)binary
{
  return self->_binary;
}

- (void)setBinary:(id)a3
{
  objc_storeStrong((id *)&self->_binary, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSNumber)dylib
{
  return self->_dylib;
}

- (void)setDylib:(id)a3
{
  objc_storeStrong((id *)&self->_dylib, a3);
}

- (NSMutableData)uscSamples
{
  return self->_uscSamples;
}

- (void)setUscSamples:(id)a3
{
  objc_storeStrong((id *)&self->_uscSamples, a3);
}

- (DYShaderAnalyzerResult)analyzerResult
{
  return self->_analyzerResult;
}

- (void)setAnalyzerResult:(id)a3
{
  objc_storeStrong((id *)&self->_analyzerResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerResult, 0);
  objc_storeStrong((id *)&self->_uscSamples, 0);
  objc_storeStrong((id *)&self->_dylib, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_binary, 0);
}

@end

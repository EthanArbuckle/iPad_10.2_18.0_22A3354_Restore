@implementation MLAppleWordEmbeddingParameters

- (MLAppleWordEmbeddingParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 metadata:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  MLAppleWordEmbeddingParameters *v19;
  MLAppleWordEmbeddingParameters *v20;
  MLAppleWordEmbeddingParameters *v21;
  id v23;
  id v24;
  objc_super v25;

  v24 = a4;
  v23 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MLAppleWordEmbeddingParameters;
  v19 = -[MLAppleWordEmbeddingParameters init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_revision = a3;
    objc_storeStrong((id *)&v19->_language, a4);
    objc_storeStrong((id *)&v20->_inputFeatureName, a5);
    objc_storeStrong((id *)&v20->_outputFeatureName, a6);
    objc_storeStrong((id *)&v20->_modelParameterData, a7);
    objc_storeStrong((id *)&v20->_metadata, a8);
    v21 = v20;
  }
  else if (a9)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of Word Embedding parameters failed"), v23, v24);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (MLAppleWordEmbeddingParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 error:(id *)a8
{
  return -[MLAppleWordEmbeddingParameters initWithData:language:inputFeatureName:outputFeatureName:modelData:metadata:error:](self, "initWithData:language:inputFeatureName:outputFeatureName:modelData:metadata:error:", a3, a4, a5, a6, a7, MEMORY[0x1E0C9AA70], a8);
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)inputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)outputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)modelParameterData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModelParameterData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_modelParameterData, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end

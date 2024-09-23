@implementation MLAppleWordTaggerParameters

- (MLAppleWordTaggerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 tokensFeatureName:(id)a6 tokenTagsFeatureName:(id)a7 tokenLocationsFeatureName:(id)a8 tokenLengthsFeatureName:(id)a9 modelData:(id)a10 tagNames:(id)a11 metadata:(id)a12 error:(id *)a13
{
  MLAppleWordTaggerParameters *v19;
  MLAppleWordTaggerParameters *v20;
  MLAppleWordTaggerParameters *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a4;
  v31 = a5;
  v30 = a6;
  v29 = a7;
  v28 = a8;
  v27 = a9;
  v26 = a10;
  v25 = a11;
  v24 = a12;
  v33.receiver = self;
  v33.super_class = (Class)MLAppleWordTaggerParameters;
  v19 = -[MLAppleWordTaggerParameters init](&v33, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_revision = a3;
    objc_storeStrong((id *)&v19->_language, a4);
    objc_storeStrong((id *)&v20->_inputFeatureName, a5);
    objc_storeStrong((id *)&v20->_tokensOutputFeatureName, a6);
    objc_storeStrong((id *)&v20->_tokenTagsOutputFeatureName, a7);
    objc_storeStrong((id *)&v20->_tokenLocationsOutputFeatureName, a8);
    objc_storeStrong((id *)&v20->_tokenLengthsOutputFeatureName, a9);
    objc_storeStrong((id *)&v20->_modelParameterData, a10);
    objc_storeStrong((id *)&v20->_tagNames, a11);
    objc_storeStrong((id *)&v20->_metadata, a12);
    v21 = v20;
  }
  else if (a13)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of word tagger parameters failed"));
    *a13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (MLAppleWordTaggerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 tokensFeatureName:(id)a6 tokenTagsFeatureName:(id)a7 tokenLocationsFeatureName:(id)a8 tokenLengthsFeatureName:(id)a9 modelData:(id)a10 tagNames:(id)a11 error:(id *)a12
{
  return -[MLAppleWordTaggerParameters initWithData:language:inputFeatureName:tokensFeatureName:tokenTagsFeatureName:tokenLocationsFeatureName:tokenLengthsFeatureName:modelData:tagNames:metadata:error:](self, "initWithData:language:inputFeatureName:tokensFeatureName:tokenTagsFeatureName:tokenLocationsFeatureName:tokenLengthsFeatureName:modelData:tagNames:metadata:error:", a3, a4, a5, a6, a7, a8, a9, a10, a11, MEMORY[0x1E0C9AA70], a12);
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

- (NSString)tokensOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTokensOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)tokenTagsOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenTagsOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)tokenLocationsOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenLocationsOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)tokenLengthsOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTokenLengthsOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)modelParameterData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModelParameterData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)tagNames
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTagNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tagNames, 0);
  objc_storeStrong((id *)&self->_modelParameterData, 0);
  objc_storeStrong((id *)&self->_tokenLengthsOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_tokenLocationsOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_tokenTagsOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_tokensOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end

@implementation MLAppleImageFeatureExtractorScenePrintParameters

- (id)initScenePrintParameters:(unint64_t)a3 requestClass:(id)a4 error:(id *)a5
{
  id v9;
  MLAppleImageFeatureExtractorScenePrintParameters *v10;
  MLAppleImageFeatureExtractorScenePrintParameters *v11;
  MLAppleImageFeatureExtractorScenePrintParameters *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLAppleImageFeatureExtractorScenePrintParameters;
  v10 = -[MLAppleImageFeatureExtractorScenePrintParameters init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_scenePrintVersion = a3;
    objc_storeStrong((id *)&v10->_requestClassName, a4);
    v12 = v11;
  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of sceneprint parameters failed"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (unint64_t)scenePrintVersion
{
  return self->_scenePrintVersion;
}

- (NSString)requestClassName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestClassName, 0);
}

@end

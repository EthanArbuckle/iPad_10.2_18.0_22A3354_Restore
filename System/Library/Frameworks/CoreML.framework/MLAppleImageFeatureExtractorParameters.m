@implementation MLAppleImageFeatureExtractorParameters

- (MLAppleImageFeatureExtractorParameters)initWithScenePrintParameters:(id)a3 error:(id *)a4
{
  id v7;
  MLAppleImageFeatureExtractorParameters *v8;
  MLAppleImageFeatureExtractorParameters *v9;
  MLAppleImageFeatureExtractorParameters *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLAppleImageFeatureExtractorParameters;
  v8 = -[MLAppleImageFeatureExtractorParameters init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_featureExtractorParameters, a3);
    v10 = v9;
  }
  else if (a4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of image feature extractor parameters failed"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (MLAppleImageFeatureExtractorParameters)initWithObjectPrintParameters:(id)a3 error:(id *)a4
{
  id v7;
  MLAppleImageFeatureExtractorParameters *v8;
  MLAppleImageFeatureExtractorParameters *v9;
  MLAppleImageFeatureExtractorParameters *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLAppleImageFeatureExtractorParameters;
  v8 = -[MLAppleImageFeatureExtractorParameters init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_featureExtractorParameters, a3);
    v10 = v9;
  }
  else if (a4)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of image feature extractor parameters failed"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)featureExtractorParameters
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featureExtractorParameters, 0);
}

@end

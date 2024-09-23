@implementation MLAppleGazetteerParameters

- (MLAppleGazetteerParameters)initWithData:(unint64_t)a3 language:(id)a4 inputFeatureName:(id)a5 outputFeatureName:(id)a6 modelData:(id)a7 labelNames:(id)a8 metadata:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  MLAppleGazetteerParameters *v19;
  MLAppleGazetteerParameters *v20;
  MLAppleGazetteerParameters *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MLAppleGazetteerParameters;
  v19 = -[MLAppleGazetteerParameters init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_revision = a3;
    objc_storeStrong((id *)&v19->_language, a4);
    objc_storeStrong((id *)&v20->_inputFeatureName, a5);
    objc_storeStrong((id *)&v20->_outputFeatureName, a6);
    objc_storeStrong((id *)&v20->_modelParameterData, a7);
    objc_storeStrong((id *)&v20->_labelNames, a8);
    objc_storeStrong((id *)&v20->_metadata, a9);
    v21 = v20;
  }
  else if (a10)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of Gazetteer parameters failed"), v23, v24, v25, v26);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
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

- (NSArray)labelNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLabelNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_labelNames, 0);
  objc_storeStrong((id *)&self->_modelParameterData, 0);
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end

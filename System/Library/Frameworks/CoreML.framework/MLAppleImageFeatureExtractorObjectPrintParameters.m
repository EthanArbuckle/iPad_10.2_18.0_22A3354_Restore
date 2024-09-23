@implementation MLAppleImageFeatureExtractorObjectPrintParameters

- (id)initObjectPrintParameters:(unint64_t)a3 expectedShapes:(id)a4 expectedKeys:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  MLAppleImageFeatureExtractorObjectPrintParameters *v13;
  id *p_isa;
  id *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLAppleImageFeatureExtractorObjectPrintParameters;
  v13 = -[MLAppleImageFeatureExtractorObjectPrintParameters init](&v17, sel_init);
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    v13->_objectPrintVersion = a3;
    objc_storeStrong((id *)&v13->_expectedShapes, a4);
    objc_storeStrong(p_isa + 3, a5);
    v15 = p_isa;
  }
  else if (a6)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Initialization of sceneprint parameters failed"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return p_isa;
}

- (unint64_t)objectPrintVersion
{
  return self->_objectPrintVersion;
}

- (NSArray)expectedShapes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)expectedKeys
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedKeys, 0);
  objc_storeStrong((id *)&self->_expectedShapes, 0);
}

@end

@implementation LCFELChangepointDetectionAnalysisResult

- (id)init:(id)a3 featureCount:(id)a4 detectedChangePointCount:(id)a5 changepointTimestamps:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LCFELChangepointDetectionAnalysisResult *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LCFELChangepointDetectionAnalysisResult;
  v15 = -[LCFELChangepointDetectionAnalysisResult init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSNumber)featureCount
{
  return self->_featureCount;
}

- (NSNumber)detectedChangePointCount
{
  return self->_detectedChangePointCount;
}

- (NSArray)changepointTimestamps
{
  return self->_changepointTimestamps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changepointTimestamps, 0);
  objc_storeStrong((id *)&self->_detectedChangePointCount, 0);
  objc_storeStrong((id *)&self->_featureCount, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end

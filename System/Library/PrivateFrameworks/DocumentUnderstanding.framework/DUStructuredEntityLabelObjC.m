@implementation DUStructuredEntityLabelObjC

- (DUStructuredEntityLabelObjC)init
{
  DUStructuredEntityLabelObjC *v2;
  _TtC21DocumentUnderstanding27DUStructuredExtractionLabel *v3;
  _TtC21DocumentUnderstanding27DUStructuredExtractionLabel *underlying;
  DUStructuredEntityLabelObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUStructuredEntityLabelObjC;
  v2 = -[DUStructuredEntityLabelObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding27DUStructuredExtractionLabel);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)labelName
{
  return -[DUStructuredExtractionLabel labelName](self->_underlying, "labelName");
}

- (void)setLabelName:(id)a3
{
  -[DUStructuredExtractionLabel setLabelName:](self->_underlying, "setLabelName:", a3);
}

- (double)confidenceScore
{
  double result;

  -[DUStructuredExtractionLabel confidenceScore](self->_underlying, "confidenceScore");
  return result;
}

- (void)setConfidenceScore:(double)a3
{
  -[DUStructuredExtractionLabel setConfidenceScore:](self->_underlying, "setConfidenceScore:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end

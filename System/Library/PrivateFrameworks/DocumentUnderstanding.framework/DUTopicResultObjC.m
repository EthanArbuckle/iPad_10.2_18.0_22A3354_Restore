@implementation DUTopicResultObjC

- (DUTopicResultObjC)init
{
  DUTopicResultObjC *v2;
  _TtC21DocumentUnderstanding13DUTopicResult *v3;
  _TtC21DocumentUnderstanding13DUTopicResult *underlying;
  DUTopicResultObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUTopicResultObjC;
  v2 = -[DUTopicResultObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding13DUTopicResult);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (DUGlobalTopicSetIdentifierObjC)topicSet
{
  void *v2;
  void *v3;

  -[DUTopicResult topicSet](self->_underlying, "topicSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:](DUObjCCompatibilityUtils, "objCGlobalTopicSetIdentifierForGlobalTopicSetIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUGlobalTopicSetIdentifierObjC *)v3;
}

- (void)setTopicSet:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:](DUObjCCompatibilityUtils, "globalTopicSetIdentifierForObjCGlobalTopicSetIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUTopicResult setTopicSet:](self->_underlying, "setTopicSet:", v4);

}

- (NSString)topicIdentifier
{
  return -[DUTopicResult topicIdentifier](self->_underlying, "topicIdentifier");
}

- (void)setTopicIdentifier:(id)a3
{
  -[DUTopicResult setTopicIdentifier:](self->_underlying, "setTopicIdentifier:", a3);
}

- (double)topicConfidence
{
  double result;

  -[DUTopicResult topicConfidence](self->_underlying, "topicConfidence");
  return result;
}

- (void)setTopicConfidence:(double)a3
{
  -[DUTopicResult setTopicConfidence:](self->_underlying, "setTopicConfidence:", a3);
}

- (NSArray)topicNames
{
  return -[DUTopicResult topicNames](self->_underlying, "topicNames");
}

- (void)setTopicNames:(id)a3
{
  -[DUTopicResult setTopicNames:](self->_underlying, "setTopicNames:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end

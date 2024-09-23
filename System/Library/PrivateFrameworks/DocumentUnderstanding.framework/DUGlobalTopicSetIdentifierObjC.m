@implementation DUGlobalTopicSetIdentifierObjC

- (DUGlobalTopicSetIdentifierObjC)init
{
  DUGlobalTopicSetIdentifierObjC *v2;
  _TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *v3;
  _TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *underlying;
  DUGlobalTopicSetIdentifierObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUGlobalTopicSetIdentifierObjC;
  v2 = -[DUGlobalTopicSetIdentifierObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (int64_t)topicSetName
{
  return -[DUGlobalTopicSetIdentifier topicSetName](self->_underlying, "topicSetName");
}

- (void)setTopicSetName:(int64_t)a3
{
  -[DUGlobalTopicSetIdentifier setTopicSetName:](self->_underlying, "setTopicSetName:", a3);
}

- (int64_t)topicSetVersion
{
  return -[DUGlobalTopicSetIdentifier topicSetVersion](self->_underlying, "topicSetVersion");
}

- (void)setTopicSetVersion:(int64_t)a3
{
  -[DUGlobalTopicSetIdentifier setTopicSetVersion:](self->_underlying, "setTopicSetVersion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end

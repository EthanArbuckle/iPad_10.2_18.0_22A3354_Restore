@implementation _MPKeyPathEntityRelationshipTranslator

- (_MPKeyPathEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3
{
  _MPKeyPathEntityRelationshipTranslator *v4;
  _MPKeyPathEntityRelationshipTranslator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MPKeyPathEntityRelationshipTranslator;
  v4 = -[_MPKeyPathEntityRelationshipTranslator init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_relatedMPModelClass, a3);
  return v5;
}

- (Class)relatedMPModelClass
{
  return self->_relatedMPModelClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedMPModelClass, 0);
}

@end

@implementation _MPBaseEntityRelationshipTranslator

- (_MPBaseEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3
{
  _MPBaseEntityRelationshipTranslator *v4;
  _MPBaseEntityRelationshipTranslator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MPBaseEntityRelationshipTranslator;
  v4 = -[_MPBaseEntityRelationshipTranslator init](&v7, sel_init);
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

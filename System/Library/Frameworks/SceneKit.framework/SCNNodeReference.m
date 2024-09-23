@implementation SCNNodeReference

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNNodeReference;
  -[SCNReferenceNode dealloc](&v3, sel_dealloc);
}

- (NSString)referenceSceneName
{
  return self->referenceSceneName;
}

- (void)setReferenceSceneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)referenceNodeName
{
  return self->referenceNodeName;
}

- (void)setReferenceNodeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

@end

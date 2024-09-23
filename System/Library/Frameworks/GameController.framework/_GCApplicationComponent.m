@implementation _GCApplicationComponent

- (id)_init
{
  objc_super v1;

  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)_GCApplicationComponent;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (_GCApplicationComponent)init
{
  -[_GCApplicationComponent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

@end

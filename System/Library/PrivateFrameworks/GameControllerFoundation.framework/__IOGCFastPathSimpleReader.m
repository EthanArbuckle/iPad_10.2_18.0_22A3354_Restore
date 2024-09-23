@implementation __IOGCFastPathSimpleReader

- (void)dealloc
{
  objc_super v2;

  self->super.readerInterface = 0;
  v2.receiver = self;
  v2.super_class = (Class)__IOGCFastPathSimpleReader;
  -[__IOGCFastPathReader dealloc](&v2, sel_dealloc);
}

@end

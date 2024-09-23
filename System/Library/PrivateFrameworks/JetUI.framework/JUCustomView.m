@implementation JUCustomView

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___JUCustomView;
  objc_msgSendSuper2(&v2, sel_initialize);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JUCustomView;
  -[JUCustomView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, a3);
}

@end

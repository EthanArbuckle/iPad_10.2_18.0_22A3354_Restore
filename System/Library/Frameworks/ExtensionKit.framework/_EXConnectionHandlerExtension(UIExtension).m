@implementation _EXConnectionHandlerExtension(UIExtension)

- (void)prepareForSceneConnectionWithConfiguration:()UIExtension
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "setSceneClass:", objc_opt_class());

  }
  v6.receiver = a1;
  v6.super_class = (Class)&off_254655580;
  objc_msgSendSuper2(&v6, sel_prepareForSceneConnectionWithConfiguration_, v4);

}

@end

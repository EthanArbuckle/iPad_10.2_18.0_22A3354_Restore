@implementation CSSiriFanInfoManager

- (CSSiriFanInfoManager)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSSiriFanInfoManager;
  -[CSSiriFanInfoManager dealloc](&v2, sel_dealloc);
}

- (void)getCurrentFanInfo:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

+ (id)sharedManager
{
  return 0;
}

@end

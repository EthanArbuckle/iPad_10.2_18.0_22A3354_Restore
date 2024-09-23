@implementation MCProfileViewController

- (MCProfileViewController)initWithStyle:(int64_t)a3 profile:(id)a4 profileViewMode:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCProfileViewController;
  return -[DMCProfileViewController initWithProfile:viewMode:](&v6, sel_initWithProfile_viewMode_, a4, a5);
}

@end

@implementation MessageActivityViewController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MessageActivityViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

void __36__MessageActivityViewController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (MessageActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  MessageActivityViewController *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MessageActivityViewController;
  v8 = -[MessageActivityViewController initWithActivityItems:applicationActivities:](&v11, sel_initWithActivityItems_applicationActivities_, v6, v7);
  if (v8)
  {
    v12[0] = *MEMORY[0x1E0D96E08];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageActivityViewController setExcludedActivityTypes:](v8, "setExcludedActivityTypes:", v9);

  }
  return v8;
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

@end

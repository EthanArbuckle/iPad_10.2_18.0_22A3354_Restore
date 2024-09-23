@implementation AVPublisher

- (AVPublisher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPublisher;
  return -[AVPublisher init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVPublisher;
  -[AVPublisher dealloc](&v2, sel_dealloc);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  return 0;
}

@end

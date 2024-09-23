@implementation INCChronoIntentProvider

- (void)provideIntentWithOptions:(id)a3 completionHandler:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INCChronoIntentProvider;
  -[INCWidgetIntentProvider provideIntentWithOptions:completionHandler:](&v4, sel_provideIntentWithOptions_completionHandler_, a3, a4);
}

@end

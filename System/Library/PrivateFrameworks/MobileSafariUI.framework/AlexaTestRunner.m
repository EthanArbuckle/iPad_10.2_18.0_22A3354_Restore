@implementation AlexaTestRunner

- (AlexaTestRunner)init
{
  AlexaTestRunner *v2;
  AlexaTestRunner *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AlexaTestRunner;
  v2 = -[AlexaTestRunner init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PageLoadTestRunner setFailFast:](v2, "setFailFast:", 0);
  return v3;
}

- (void)collectPPTResults
{
  -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Summary"), CFSTR("pages attempted"), CFSTR("pages"), (double)self->super._attemptCount);
  -[PurplePageLoadTestRunner pptResultFor:measure:value:units:](self, "pptResultFor:measure:value:units:", CFSTR("Summary"), CFSTR("pages loaded"), CFSTR("pages"), (double)self->super._successCount);
}

@end

@implementation StepByStepUIViewController_ExtendWired_Config

- (StepByStepUIViewController_ExtendWired_Config)initWithNibName:(id)a3 bundle:(id)a4
{
  StepByStepUIViewController_ExtendWired_Config *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StepByStepUIViewController_ExtendWired_Config;
  result = -[StepByStepUIViewController_ExtendWireless_Config initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
  {
    result->super.connectionType = &off_2550F49E0[0]->isa;
    result->super.unlocalizedStatusString = (NSString *)CFSTR("StepByStepStatus_ExtendWired%@");
  }
  return result;
}

@end

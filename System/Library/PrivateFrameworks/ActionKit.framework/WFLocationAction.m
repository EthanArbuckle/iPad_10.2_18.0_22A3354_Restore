@implementation WFLocationAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5;

  -[WFLocationAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFLocation"), objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLocationAction setOutput:](self, "setOutput:", v5);

}

@end

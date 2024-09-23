@implementation WFContactsAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  -[WFContactsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContact"), objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactsAction setOutput:](self, "setOutput:", v5);

}

@end

@implementation WFTextAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  -[WFTextAction output](self, "output", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextActionText"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

}

@end

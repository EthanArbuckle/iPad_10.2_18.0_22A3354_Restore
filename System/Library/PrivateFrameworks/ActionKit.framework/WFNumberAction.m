@implementation WFNumberAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[WFNumberAction output](self, "output", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFNumberAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNumberActionNumber"), objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &unk_24F93B390;
  objc_msgSend(v8, "addObject:", v7);

}

@end

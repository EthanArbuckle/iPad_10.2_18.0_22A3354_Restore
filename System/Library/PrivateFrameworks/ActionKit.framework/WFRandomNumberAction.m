@implementation WFRandomNumberAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  -[WFRandomNumberAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRandomNumberMinimum"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  -[WFRandomNumberAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRandomNumberMaximum"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if (v8 >= v6)
  {
    -[WFRandomNumberAction output](self, "output");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", arc4random_uniform(v8 - v6 + 1) + v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

  }
}

@end

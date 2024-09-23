@implementation WFDateAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  -[WFDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDateActionMode"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Current Date")))
  {
    -[WFDateAction output](self, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  else
  {
    -[WFDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDateActionDate"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WFDateAction output](self, "output");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BEC4270];
      v16[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Invalid Date"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v13;
      v16[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please enter a valid date into the Date action."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

@end

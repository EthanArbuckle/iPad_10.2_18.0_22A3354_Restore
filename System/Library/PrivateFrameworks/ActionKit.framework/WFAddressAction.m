@implementation WFAddressAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[WFAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAddressLine1"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAddressLine2"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCity"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFState"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCountry"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPostalCode"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v12, "addObject:", v6);
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v12, "addObject:", v7);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v13, "length")
    || objc_msgSend(v8, "length")
    || objc_msgSend(v9, "length")
    || objc_msgSend(v11, "length")
    || objc_msgSend(v10, "length"))
  {
    -[WFAddressAction output](self, "output");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19618], "streetAddressWithStreet:subLocality:city:subAdministrativeArea:state:postalCode:country:isoCountryCode:label:", v13, 0, v8, 0, v9, v11, v10, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BEC4270];
    v21[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Address"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v20;
    v21[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please enter a valid address into the Street Address action."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 5, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

@end

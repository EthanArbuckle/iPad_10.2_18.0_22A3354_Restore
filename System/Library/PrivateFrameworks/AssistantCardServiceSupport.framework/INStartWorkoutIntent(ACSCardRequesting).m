@implementation INStartWorkoutIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(a3, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v7, "underlyingInteraction"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x24BE84D80], "acs_uniquelyIdentifiedCard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE84F80], "acs_uniquelyIdentifiedCardSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "workoutName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "spokenPhrase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v9, "intentHandlingStatus");
      if (v14 <= 6)
      {
        if (((1 << v14) & 0x67) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("Start a %@");
        }
        else if (v14 == 3)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("%@ Started");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("Failure Starting %@");
        }
        objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24D478830, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v18, v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTitle:", v19);

      }
      v20 = (void *)MEMORY[0x24BDD9EF8];
      v21 = objc_opt_class();
      NSStringFromSelector(sel_workoutName);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "parameterForClass:keyPath:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v30 = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "acs_setParameters:", v24);

      }
      objc_msgSend(v11, "setIsCentered:", 1);
      v29[0] = v11;
      objc_msgSend(MEMORY[0x24BE84F10], "acs_wildCardSection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCardSections:", v26);

      objc_msgSend(v10, "acs_setInteraction:", v9);
      v6[2](v6, v10, 0);

    }
    else
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BE15488];
      v31 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 400, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
    }

  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end

@implementation HMService(HFProgrammableSwitchAdditions)

- (uint64_t)hf_isProgrammableSwitch
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "hf_programmableSwitchServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)hf_programmableSwitchServiceTypes
{
  if (qword_1ED3792C8 != -1)
    dispatch_once(&qword_1ED3792C8, &__block_literal_global_213_0);
  return (id)qword_1ED3792D0;
}

- (uint64_t)hf_fallbackProgrammableSwitchIndex
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_programmableSwitchServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "services");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_filter:", &__block_literal_global_220_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_221_1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "indexOfObject:", a1);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v9 + 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HMService(HFProgrammableSwitchAdditions) hf_fallbackProgrammableSwitchIndex]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("HMService+HFAdditions.m"), 578, CFSTR("HMProgrammableSwitchIndexForService(HMService *service) called w/ non-programmable switch.  Everybody panic."));

    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (uint64_t)hf_labelIndexCharacteristic
{
  return objc_msgSend(a1, "hf_characteristicOfType:", *MEMORY[0x1E0CB8920]);
}

- (id)hf_labelNamespaceCharacteristic
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "hf_programmableSwitchServiceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (!v4)
    goto LABEL_5;
  v5 = *MEMORY[0x1E0CB9A58];
  objc_msgSend(a1, "_hf_firstLinkedServiceOfType:", *MEMORY[0x1E0CB9A58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(a1, "accessory"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "hf_serviceOfType:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    objc_msgSend(v6, "hf_characteristicOfType:", *MEMORY[0x1E0CB8928]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  return v8;
}

- (id)_hf_firstLinkedServiceOfType:()HFProgrammableSwitchAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "linkedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__HMService_HFProgrammableSwitchAdditions___hf_firstLinkedServiceOfType___block_invoke;
  v9[3] = &unk_1EA7283A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

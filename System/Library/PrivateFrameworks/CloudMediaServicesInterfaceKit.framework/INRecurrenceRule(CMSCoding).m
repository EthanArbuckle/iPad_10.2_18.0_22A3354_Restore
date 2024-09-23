@implementation INRecurrenceRule(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "interval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("frequency");
  v7[0] = v2;
  INRecurrenceFrequencyToString(objc_msgSend(a1, "frequency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "cmsUnsignedForKey:withDefault:", CFSTR("interval"), 1);
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("frequency"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = INRecurrenceFrequencyFromString(v6);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9FA8]), "initWithInterval:frequency:", v5, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end

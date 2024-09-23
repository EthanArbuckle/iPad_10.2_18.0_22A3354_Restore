@implementation WFHealthActionStartDateFieldParameter

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
  -[WFHealthActionStartDateFieldParameter attributesDidChange](self, "attributesDidChange");
}

- (id)localizedLabel
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[WFHealthActionStartDateFieldParameter sampleType](self, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2A28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD29A0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD3578]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD35B0]))
  {
    v4 = CFSTR("Start Date");
  }
  else
  {
    v4 = CFSTR("Date");
  }
  WFLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleType, 0);
}

@end

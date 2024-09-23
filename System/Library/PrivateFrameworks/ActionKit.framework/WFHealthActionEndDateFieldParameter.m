@implementation WFHealthActionEndDateFieldParameter

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
  -[WFHealthActionEndDateFieldParameter attributesDidChange](self, "attributesDidChange");
}

- (BOOL)isHidden
{
  void *v2;
  void *v3;
  int v4;

  -[WFHealthActionEndDateFieldParameter sampleType](self, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2A28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD29A0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD3578]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD35B0]) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2A48]) ^ 1;
  }

  return v4;
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

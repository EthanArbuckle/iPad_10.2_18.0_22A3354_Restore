@implementation HKCorrelation(WFNaming)

- (id)wfName
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  objc_super v24;

  objc_msgSend(a1, "correlationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD2B08]);

  if (!v4)
  {
    v24.receiver = a1;
    v24.super_class = (Class)&off_255DE7880;
    objc_msgSendSuper2(&v24, sel_wfName);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    return v22;
  }
  objc_msgSend(MEMORY[0x24BDD3F08], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsForType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3F08], "quantityTypeForIdentifier:", *MEMORY[0x24BDD33A0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "quantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "millimeterOfMercuryUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v12);
  v14 = v13;

  objc_msgSend(v10, "quantity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "millimeterOfMercuryUnit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValueForUnit:", v16);
  v18 = v17;

  v19 = (void *)MEMORY[0x24BDD17C8];
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g"), v14);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@"), v20, CFSTR("--"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v20 = CFSTR("--");
  if (!v10)
    goto LABEL_10;
LABEL_4:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g"), v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
LABEL_5:

LABEL_6:
  return v22;
}

@end

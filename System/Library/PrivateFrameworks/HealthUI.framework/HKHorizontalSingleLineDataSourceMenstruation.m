@implementation HKHorizontalSingleLineDataSourceMenstruation

- (id)queryDescription
{
  return CFSTR("HKHorizonalSingleLineMenstruation");
}

- (void)applyMarkStyleToPoint:(id)a3 sample:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0CB5588]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    v9 = 1;
LABEL_5:
    objc_msgSend(v10, "setMarkStyle:", v9);
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "value") == 5)
  {
    v9 = 3;
    goto LABEL_5;
  }
LABEL_6:

}

@end

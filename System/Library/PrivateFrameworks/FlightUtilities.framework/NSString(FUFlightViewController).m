@implementation NSString(FUFlightViewController)

- (id)localizedTerminalOrGateID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  v4 = objc_msgSend(a1, "integerValue");
  if ((unint64_t)(v4 - 1) > 0x3E6)
    goto LABEL_5;
  v5 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {

LABEL_5:
    v7 = a1;
  }

  return v7;
}

@end

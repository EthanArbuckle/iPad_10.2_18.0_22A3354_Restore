@implementation WFImageConvertFormatPickerParameter

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v12[0] = CFSTR("JPEG");
    v12[1] = CFSTR("PNG");
    v12[2] = CFSTR("TIFF");
    v12[3] = CFSTR("GIF");
    v12[4] = CFSTR("BMP");
    v12[5] = CFSTR("PDF");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(MEMORY[0x24BE19538], "supportedTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (v8)
      objc_msgSend(v5, "addObject:", CFSTR("HEIF"));
    objc_msgSend(v5, "addObject:", CFSTR("Match Input"));
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_26417);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Match Input")) & 1) != 0)
    WFLocalizedString(CFSTR("Match Input"));
  else
    objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __53__WFImageConvertFormatPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end

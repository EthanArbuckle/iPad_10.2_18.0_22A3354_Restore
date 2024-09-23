@implementation WFFileLabelColorPickerParameter

- (WFFileLabelColorPickerParameter)initWithDefinition:(id)a3
{
  WFFileLabelColorPickerParameter *v3;
  uint64_t v4;
  NSArray *possibleStates;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *localizedLabelsForLabelNumbers;
  WFFileLabelColorPickerParameter *v16;
  objc_super v18;
  _QWORD v19[8];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)WFFileLabelColorPickerParameter;
  v3 = -[WFFileLabelColorPickerParameter initWithDefinition:](&v18, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(&unk_24F93C210, "if_map:", &__block_literal_global_212);
    v4 = objc_claimAutoreleasedReturnValue();
    possibleStates = v3->_possibleStates;
    v3->_possibleStates = (NSArray *)v4;

    v19[0] = &unk_24F939980;
    WFLocalizedString(CFSTR("No Color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    v19[1] = &unk_24F939998;
    WFLocalizedString(CFSTR("Red"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v7;
    v19[2] = &unk_24F9399B0;
    WFLocalizedString(CFSTR("Orange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v8;
    v19[3] = &unk_24F9399C8;
    WFLocalizedString(CFSTR("Yellow"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v9;
    v19[4] = &unk_24F9399E0;
    WFLocalizedString(CFSTR("Green"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v10;
    v19[5] = &unk_24F9399F8;
    WFLocalizedString(CFSTR("Blue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v11;
    v19[6] = &unk_24F939A10;
    WFLocalizedString(CFSTR("Purple"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[6] = v12;
    v19[7] = &unk_24F939A28;
    WFLocalizedString(CFSTR("Gray"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[7] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
    v14 = objc_claimAutoreleasedReturnValue();
    localizedLabelsForLabelNumbers = v3->_localizedLabelsForLabelNumbers;
    v3->_localizedLabelsForLabelNumbers = (NSDictionary *)v14;

    v16 = v3;
  }

  return v3;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFFileLabelColorPickerParameter localizedLabelsForLabelNumbers](self, "localizedLabelsForLabelNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v4 = (void *)getUIColorClass_softClass;
  v16 = getUIColorClass_softClass;
  if (!getUIColorClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getUIColorClass_block_invoke;
    v12[3] = &unk_24F8BB430;
    v12[4] = &v13;
    __getUIColorClass_block_invoke((uint64_t)v12);
    v4 = (void *)v14[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v3, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  switch(v7)
  {
    case 0:
      objc_msgSend(v5, "clearColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1:
      objc_msgSend(v5, "systemGrayColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2:
      objc_msgSend(v5, "systemGreenColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      objc_msgSend(v5, "systemPurpleColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4:
      objc_msgSend(v5, "systemBlueColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5:
      objc_msgSend(v5, "systemYellowColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6:
      objc_msgSend(v5, "systemRedColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7:
      objc_msgSend(v5, "systemOrangeColor");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v9 = (void *)v8;
      if (!v8)
        goto LABEL_14;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithPlatformColor:", v8);

      break;
    default:
LABEL_14:
      v10 = 0;
      break;
  }

  return v10;
}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (NSDictionary)localizedLabelsForLabelNumbers
{
  return self->_localizedLabelsForLabelNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLabelsForLabelNumbers, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __54__WFFileLabelColorPickerParameter_initWithDefinition___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC3F20];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithNumber:", v3);

  return v4;
}

@end

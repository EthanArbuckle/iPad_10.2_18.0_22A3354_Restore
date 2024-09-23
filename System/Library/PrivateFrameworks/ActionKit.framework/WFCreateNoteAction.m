@implementation WFCreateNoteAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCreateNoteAction;
  -[WFCreateNoteAction runAsynchronouslyWithInput:](&v3, sel_runAsynchronouslyWithInput_, a3);
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(CFSTR("Title"));
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to save %2$@ in a note?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to create a note?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)inputRequired
{
  return 1;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spokenPhrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = CFSTR("WFCreateNoteInput");
      v10[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDBD1B8];
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)entityName
{
  return CFSTR("note");
}

- (id)parameterSummary
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEC3A50]);
  WFLocalizedStringResourceWithKey(CFSTR("Create note with ${contents} in ${folder}"), CFSTR("Create note with ${contents} in ${folder}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

- (id)overrideDescriptionSummary
{
  return CFSTR("Creates a note using the content passed as input.");
}

- (id)parameterOverrides
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v20[0] = *MEMORY[0x24BEC4488];
  v2 = objc_alloc(MEMORY[0x24BEC3F38]);
  v18 = *MEMORY[0x24BEC4558];
  v19 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDictionary:", v3);
  v21[0] = v4;
  v20[1] = CFSTR("folder");
  v5 = objc_alloc(MEMORY[0x24BEC3F38]);
  v6 = *MEMORY[0x24BEC4510];
  v16[0] = *MEMORY[0x24BEC45A0];
  v16[1] = v6;
  v17[0] = CFSTR("WFNoteGroup");
  v17[1] = CFSTR("WFNoteGroupPickerParameter");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);
  v21[1] = v8;
  v20[2] = CFSTR("contents");
  v9 = objc_alloc(MEMORY[0x24BEC3F38]);
  v14 = *MEMORY[0x24BEC4580];
  v15 = CFSTR("WFCreateNoteInput");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithDictionary:", v10);
  v21[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)openWhenRunParameterIsHidden
{
  return 0;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("apple (Create Note Keyword)"), CFSTR("apple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)outputDisclosureLevel
{
  return 0;
}

+ (id)overrideInputParameterName
{
  return CFSTR("contents");
}

@end

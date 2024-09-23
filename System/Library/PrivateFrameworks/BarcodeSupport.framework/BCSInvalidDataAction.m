@implementation BCSInvalidDataAction

- (BCSInvalidDataAction)initWithData:(id)a3 codePayload:(id)a4
{
  id v6;
  id v7;
  BCSInvalidDataAction *v8;
  BCSInvalidParsedData *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)BCSInvalidDataAction;
    v8 = -[BCSAction initWithData:codePayload:](&v15, sel_initWithData_codePayload_, v6, v7);
  }
  else
  {
    v9 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", objc_msgSend(v6, "type"), 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSInvalidParsedData setInvalidURLScheme:](v9, "setInvalidURLScheme:", v11);

      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCSInvalidParsedData setInvalidContents:](v9, "setInvalidContents:", v12);

    }
    v14.receiver = self;
    v14.super_class = (Class)BCSInvalidDataAction;
    v8 = -[BCSAction initWithData:codePayload:](&v14, sel_initWithData_codePayload_, v9, v7);

  }
  return v8;
}

- (id)localizedDefaultActionDescription
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[BCSAction codePayload](self, "codePayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v2, "version") >= 4)
    v3 = CFSTR("This code is not compatible with this version of iOS");
  else
    v3 = CFSTR("No usable data found");
  _BCSLocalizedString(v3, &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)actionIcon
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v7;

  -[BCSAction codePayload](self, "codePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("appclip"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BCSInvalidDataAction;
    -[BCSAction actionIcon](&v7, sel_actionIcon);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)actionPickerItems
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  BCSCopyActionPickerItem *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[BCSAction data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[BCSAction data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = -[BCSCopyActionPickerItem initWithAction:textToCopy:]([BCSCopyActionPickerItem alloc], "initWithAction:textToCopy:", self, v6);
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isInvalidDataAction
{
  return 1;
}

@end

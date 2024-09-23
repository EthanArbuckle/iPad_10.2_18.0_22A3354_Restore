@implementation WFFocusModeContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("focusMode.symbolImage"), v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Focus"), CFSTR("Focus"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Focuses"), CFSTR("Focuses"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Focuses"));
}

- (id)focusMode
{
  void *v2;
  void *v3;
  id v4;

  -[WFFocusModeContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if ((Class)objc_opt_class() == a3)
  {
    v8 = (void *)MEMORY[0x24BE19590];
    -[WFFocusModeContentItem focusMode](self, "focusMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v10;
    objc_msgSend(v8, "object:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v8 = (void *)MEMORY[0x24BE19590];
    -[WFFocusModeContentItem focusMode](self, "focusMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "symbolImage");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
  return v7;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    -[WFFocusModeContentItem focusMode](self, "focusMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "symbolImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))a3 + 2))(v6, v8, 0);

  }
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    WFLocalizedString(CFSTR("Focus"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v4, v5);

  }
  return 1;
}

- (unint64_t)preferredDisplayStyle
{
  return 2;
}

@end

@implementation WFUlyssesSheetContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("sheet.title"), v20, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("sheet.identifier"), v18, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Contents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("sheet.text"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v8 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Keywords"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("sheet.keywords"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multipleValues:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v11;
  v12 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Notes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyPath:name:class:", CFSTR("sheet.notes"), v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "multipleValues:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Contents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Ulysses sheet"), CFSTR("Ulysses sheet"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Ulysses sheets"), CFSTR("Ulysses sheets"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Ulysses sheets"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
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

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sheet
{
  return (id)-[WFUlyssesSheetContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((Class)objc_opt_class() == a3)
  {
    v7 = (void *)MEMORY[0x24BE19590];
    -[WFUlyssesSheetContentItem sheet](self, "sheet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUlyssesSheetContentItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "object:named:", v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end

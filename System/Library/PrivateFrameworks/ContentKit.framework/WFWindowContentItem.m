@implementation WFWindowContentItem

- (WFWindow)window
{
  return (WFWindow *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)app
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFApp *v9;
  void *v10;
  void *v11;
  WFApp *v12;

  v3 = objc_alloc(MEMORY[0x24BDD9BD0]);
  -[WFWindowContentItem window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", v5);

  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedAppMatchingDescriptor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [WFApp alloc];
    objc_msgSend(v8, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFApp initWithBundleIdentifier:localizedName:](v9, "initWithBundleIdentifier:localizedName:", v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)display
{
  return 0;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFWindowContentItem app](self, "app");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFWindowContentItem window](self, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFContentItem name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v8, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_8;
  }
  v7 = 0;
  return v7;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  void *v3;
  void *v4;

  +[WFContentLocation windowsLocation](WFContentLocation, "windowsLocation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithOrigin:disclosureLevel:](WFContentAttributionSet, "attributionSetWithOrigin:disclosureLevel:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[12];

  v27[10] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("App Name"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("window.applicationName"), v26, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Hidden"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("window.isHidden"), v23, objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Visible"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "negativeName:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v20;
  WFLocalizedContentPropertyNameMarker(CFSTR("Image"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_6093, v19, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  WFLocalizedContentPropertyNameMarker(CFSTR("Width"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_120, v17, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v16;
  WFLocalizedContentPropertyNameMarker(CFSTR("Height"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_123_6096, v15, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v14;
  WFLocalizedContentPropertyNameMarker(CFSTR("X Position"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_126, v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v3;
  WFLocalizedContentPropertyNameMarker(CFSTR("Y Position"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_129_6099, v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v5;
  WFLocalizedContentPropertyNameMarker(CFSTR("Window Index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_132, v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v7;
  WFLocalizedContentPropertyNameMarker(CFSTR("Display"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("display"), v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v9;
  WFLocalizedContentPropertyNameMarker(CFSTR("App"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v11, "count"))
  {
    +[WFWindow allWindows](WFWindow, "allWindows");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "if_map:", &__block_literal_global_151);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___WFWindowContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);

}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
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
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Scripting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Window"), CFSTR("Window"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Windows"), CFSTR("Windows"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Windows"));
}

WFWindowContentItem *__80__WFWindowContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:](WFWindowContentItem, "itemWithObject:", a2);
}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "window");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  double v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "position");
  objc_msgSend(v6, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v9);

}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "window");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "position");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v8);

}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  double v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  objc_msgSend(v6, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v9);

}

void __39__WFWindowContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(a2, "window");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v7, v8);

}

void __39__WFWindowContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "window");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFWindowContentItem window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v7);

  }
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *, void *))a3;
  v6 = (void *)MEMORY[0x24BEC14E0];
  -[WFWindowContentItem window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIconImageForBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v9)
    {
      v13 = *MEMORY[0x24BEC1820];
      v14[0] = &unk_24C50F548;
      v10 = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v9, v11);

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = v9 != 0;
  }

  return v10;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;
  double v9;
  void *v10;

  v4 = (void (**)(id, void *))a3;
  -[WFWindowContentItem window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "size");
  v8 = (unint64_t)v7;
  objc_msgSend(v5, "size");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%lu×%lu"), v8, (unint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, v10);

  return 1;
}

@end

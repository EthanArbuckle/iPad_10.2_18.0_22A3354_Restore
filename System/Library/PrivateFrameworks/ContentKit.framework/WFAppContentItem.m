@implementation WFAppContentItem

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFAppContentItem app](self, "app");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WFAppContentItem app](self, "app");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFAppContentItem intentApplication](self, "intentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return v7;
  }
  v7 = 0;
  return v7;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if ((Class)objc_opt_class() == a3)
  {
    -[WFAppContentItem windows](self, "windows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
      return MEMORY[0x24BDBD1A8];
    -[WFAppContentItem intentApplication](self, "intentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (WFApp)app
{
  return (WFApp *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)windows
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[WFAppContentItem app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWindow allWindowsForBundleIdentifiers:](WFWindow, "allWindowsForBundleIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)displays
{
  return (id)MEMORY[0x24BDBD1A8];
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[12];

  v35[10] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Running"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.isRunning"), v33, objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Running"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "negativeName:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v30;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Hidden"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.isHidden"), v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Visible"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "negativeName:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v25;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Frontmost"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.isFrontmost"), v23, objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Frontmost"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "negativeName:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v20;
  WFLocalizedContentPropertyNameMarker(CFSTR("Icon"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.icon"), v19, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v18;
  WFLocalizedContentPropertyNameMarker(CFSTR("Bundle Identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.bundleIdentifier"), v17, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v16;
  WFLocalizedContentPropertyNameMarker(CFSTR("Process Identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.processIdentifier"), v15, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v14;
  WFLocalizedContentPropertyNameMarker(CFSTR("Bundle Path"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.bundleURL"), v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v3;
  WFLocalizedContentPropertyNameMarker(CFSTR("Launch Date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("app.launchDate"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v5;
  WFLocalizedContentPropertyNameMarker(CFSTR("Windows"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("windows"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multipleValues:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v8;
  WFLocalizedContentPropertyNameMarker(CFSTR("Displays"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("displays"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multipleValues:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
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
    +[WFApp allApps](WFApp, "allApps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "if_map:", &__block_literal_global_7162);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___WFAppContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);

}

+ (BOOL)hasLibrary
{
  return 1;
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
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Sharing");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("App"), CFSTR("App"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("apps-type-description"), CFSTR("Apps"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Apps"));
}

WFAppContentItem *__77__WFAppContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:](WFAppContentItem, "itemWithObject:", a2);
}

- (LNValue)intentApplication
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BE5FDF8]);
  -[WFAppContentItem app](self, "app");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE5FCD8], "applicationValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithValue:valueType:", v5, v6);

  return (LNValue *)v7;
}

@end

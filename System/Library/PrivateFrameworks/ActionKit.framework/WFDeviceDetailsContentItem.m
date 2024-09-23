@implementation WFDeviceDetailsContentItem

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
  void *v17;
  void *v18;
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
  _QWORD v35[13];

  v35[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("OS"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "block:name:class:", &__block_literal_global_29223, v34, objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  WFDevicePossiblePlatformsTypeMapping();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "allValues");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "possibleValues:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v30;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Device Type"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "block:name:class:", &__block_literal_global_10_29225, v29, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  WFDevicePossibleIdiomsTypeMapping();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "possibleValues:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v25;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("System Version"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("device.systemVersion"), v24, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v23;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("System Build Number"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("device.systemBuildNumber"), v22, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v21;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_21, CFSTR("Device Model"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v20;
  v6 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Device Hostname"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("device.hostname"), v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v8;
  v9 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Screen Width"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("screenWidth"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v11;
  v12 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Screen Height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyPath:name:class:", CFSTR("screenHeight"), v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v14;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_36, CFSTR("Current Volume"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v15;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_39, CFSTR("Current Brightness"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v16;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_43, CFSTR("Current Appearance"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196F8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Device Detail"), CFSTR("Device Detail"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Device Details"), CFSTR("Device Details"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Device Details"));
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a2, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_8;
  v8[3] = &unk_24F8B5D58;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "getAppearanceWithCompletion:", v8);

}

uint64_t __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a2, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_6;
  v8[3] = &unk_24F8B5D10;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "getBrightnessWithCompletion:", v8);

}

uint64_t __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  objc_msgSend(a2, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v6, "volumeWithError:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v7);
}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "device");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a2;
  WFDevicePossibleIdiomsTypeMapping();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "idiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v11);

}

void __46__WFDeviceDetailsContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a2;
  WFDevicePossiblePlatformsTypeMapping();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "platform"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v11);

}

- (WFDevice)device
{
  return (WFDevice *)-[WFDeviceDetailsContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)screenWidth
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFDeviceDetailsContentItem device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenBounds");
  objc_msgSend(v2, "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)screenHeight
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFDeviceDetailsContentItem device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screenBounds");
  objc_msgSend(v2, "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

@implementation _GCNintendoNESControllerProfile

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return CFSTR("Switch NES Controller");
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  GCDeviceButtonInputDescription *v6;
  GCDeviceButtonInputDescription *v7;
  GCDeviceButtonInputDescription *v8;
  GCDeviceButtonInputDescription *v9;
  GCDeviceButtonInputDescription *v10;
  GCDeviceDirectionPadDescription *v11;
  _GCDevicePhysicalInputComponentDescription *v12;
  void *v13;
  _GCDevicePhysicalInputComponentDescription *v14;
  GCDeviceButtonInputDescription *v16;
  id v17;
  id v18;
  _QWORD v19[8];

  v19[7] = *MEMORY[0x24BDAC8D0];
  v18 = a5;
  v17 = a4;
  v6 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button A"), 0, 2, CFSTR("BUTTON_A"), CFSTR("a.circle"), 1, 4);
  v16 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button B"), 0, 2, CFSTR("BUTTON_B"), CFSTR("b.circle"), 1, 5);
  v7 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Shoulder"), 0, 2, CFSTR("LEFT_SHOULDER"), CFSTR("l1.rectangle.roundedbottom"), 1, 8);
  v8 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Shoulder"), 0, 2, CFSTR("RIGHT_SHOULDER"), CFSTR("r1.rectangle.roundedbottom"), 1, 9);
  v9 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Menu"), 0, 0x4000, CFSTR("BUTTON_MENU"), CFSTR("line.horizontal.3.circle"), 1, 23);
  v10 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Options"), 0, 49152, CFSTR("BUTTON_OPTIONS"), CFSTR("ellipsis.circle"), 1, 24);
  v11 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:]([GCDeviceDirectionPadDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Direction Pad"), 0, 2, CFSTR("DIRECTION_PAD"), CFSTR("dpad"), 1, 0, 1, 2, 3);
  v12 = [_GCDevicePhysicalInputComponentDescription alloc];
  v19[0] = v6;
  v19[1] = v16;
  v19[2] = v7;
  v19[3] = v8;
  v19[4] = v9;
  v19[5] = v10;
  v19[6] = v11;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v19, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_GCDevicePhysicalInputComponentDescription initWithIdentifier:elements:bindings:](v12, "initWithIdentifier:elements:bindings:", v17, v13, v18);

  return v14;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _GCControllerInputComponentDescription *v28;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[8];

  v33[7] = *MEMORY[0x24BDAC8D0];
  v32 = a5;
  v31 = a4;
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAliases:", v6);

  objc_msgSend(v30, "setLocalizedName:", *MEMORY[0x24BE3A330]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSymbol:", v7);

  objc_msgSend(v30, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAliases:", v9);

  objc_msgSend(v8, "setLocalizedName:", *MEMORY[0x24BE3A338]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSymbol:", v10);

  objc_msgSend(v8, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.l"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAliases:", v12);

  objc_msgSend(v11, "setLocalizedName:", *MEMORY[0x24BE3A478]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l1.rectangle.roundedbottom"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSymbol:", v13);

  objc_msgSend(v11, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.r"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAliases:", v15);

  objc_msgSend(v14, "setLocalizedName:", *MEMORY[0x24BE3A510]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r1.rectangle.roundedbottom"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSymbol:", v16);

  objc_msgSend(v14, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.start"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAliases:", v18);

  objc_msgSend(v17, "setLocalizedName:", *MEMORY[0x24BE3A378]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSymbol:", v19);

  objc_msgSend(v17, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.select"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAliases:", v21);

  objc_msgSend(v20, "setLocalizedName:", *MEMORY[0x24BE3A380]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("ellipsis.circle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSymbol:", v22);

  objc_msgSend(v20, "setEventPressedValueField:", 24);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAliases:", v24);

  objc_msgSend(v23, "setLocalizedName:", *MEMORY[0x24BE3A3B0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSymbol:", v25);

  objc_msgSend(v23, "setAnalog:", 0);
  objc_msgSend(v23, "setEventUpValueField:", 0);
  objc_msgSend(v23, "setEventDownValueField:", 1);
  objc_msgSend(v23, "setEventLeftValueField:", 2);
  objc_msgSend(v23, "setEventRightValueField:", 3);
  v26 = (void *)objc_opt_new();
  v33[0] = v30;
  v33[1] = v8;
  v33[2] = v11;
  v33[3] = v14;
  v33[4] = v17;
  v33[5] = v20;
  v33[6] = v23;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v33, 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setElements:", v27);

  v28 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v31, v26, v32);
  return v28;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

@end

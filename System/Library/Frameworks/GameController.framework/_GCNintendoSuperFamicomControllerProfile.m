@implementation _GCNintendoSuperFamicomControllerProfile

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return CFSTR("Switch SNES Controller");
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  GCDeviceButtonInputDescription *v5;
  GCDeviceButtonInputDescription *v6;
  GCDeviceButtonInputDescription *v7;
  GCDeviceButtonInputDescription *v8;
  GCDeviceButtonInputDescription *v9;
  GCDeviceButtonInputDescription *v10;
  GCDeviceDirectionPadDescription *v11;
  _GCDeviceGamepadComponentDescription *v12;
  void *v13;
  _GCDeviceGamepadComponentDescription *v14;
  GCDeviceButtonInputDescription *v16;
  id v17;
  GCDeviceButtonInputDescription *v18;
  _QWORD v19[10];

  v19[9] = *MEMORY[0x24BDAC8D0];
  v17 = a5;
  v18 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button A"), 0, 2, CFSTR("BUTTON_A"), CFSTR("a.circle"), 1, 4);
  v5 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button B"), 0, 2, CFSTR("BUTTON_B"), CFSTR("b.circle"), 1, 5);
  v6 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button X"), 0, 2, CFSTR("BUTTON_X"), CFSTR("x.circle"), 1, 6);
  v7 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Y"), 0, 2, CFSTR("BUTTON_Y"), CFSTR("y.circle"), 1, 7);
  v8 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Shoulder"), 0, 2, CFSTR("LEFT_SHOULDER"), CFSTR("l1.rectangle.roundedbottom"), 1, 8);
  v9 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Shoulder"), 0, 2, CFSTR("RIGHT_SHOULDER"), CFSTR("r1.rectangle.roundedbottom"), 1, 9);
  v16 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Menu"), 0, 0x4000, CFSTR("BUTTON_MENU"), CFSTR("line.horizontal.3.circle"), 1, 23);
  v10 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:]([GCDeviceButtonInputDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Options"), 0, 49152, CFSTR("BUTTON_OPTIONS"), CFSTR("ellipsis.circle"), 1, 24);
  v11 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:]([GCDeviceDirectionPadDescription alloc], "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Direction Pad"), 0, 2, CFSTR("DIRECTION_PAD"), CFSTR("dpad"), 1, 0, 1, 2, 3);
  v12 = [_GCDeviceGamepadComponentDescription alloc];
  v19[0] = v18;
  v19[1] = v5;
  v19[2] = v6;
  v19[3] = v7;
  v19[4] = v8;
  v19[5] = v9;
  v19[6] = v16;
  v19[7] = v10;
  v19[8] = v11;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v19, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_GCDevicePhysicalInputComponentDescription initWithIdentifier:elements:bindings:](v12, "initWithIdentifier:elements:bindings:", CFSTR("PhysicalInput"), v13, v17);

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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _GCControllerInputComponentDescription *v33;
  void *v35;
  id v36;
  id v37;
  void *v38;
  _QWORD v39[10];

  v39[9] = *MEMORY[0x24BDAC8D0];
  v37 = a5;
  v36 = a4;
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAliases:", v6);

  objc_msgSend(v38, "setLocalizedName:", *MEMORY[0x24BE3A330]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSymbol:", v7);

  objc_msgSend(v38, "setEventPressedValueField:", 4);
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
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAliases:", v12);

  objc_msgSend(v11, "setLocalizedName:", *MEMORY[0x24BE3A3A0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSymbol:", v13);

  objc_msgSend(v11, "setEventPressedValueField:", 6);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAliases:", v15);

  objc_msgSend(v14, "setLocalizedName:", *MEMORY[0x24BE3A3A8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSymbol:", v16);

  objc_msgSend(v14, "setEventPressedValueField:", 7);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.l"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAliases:", v17);

  objc_msgSend(v35, "setLocalizedName:", *MEMORY[0x24BE3A478]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l1.rectangle.roundedbottom"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSymbol:", v18);

  objc_msgSend(v35, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.r"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAliases:", v20);

  objc_msgSend(v19, "setLocalizedName:", *MEMORY[0x24BE3A510]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r1.rectangle.roundedbottom"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSymbol:", v21);

  objc_msgSend(v19, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.start"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAliases:", v23);

  objc_msgSend(v22, "setLocalizedName:", *MEMORY[0x24BE3A378]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSymbol:", v24);

  objc_msgSend(v22, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.select"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAliases:", v26);

  objc_msgSend(v25, "setLocalizedName:", *MEMORY[0x24BE3A380]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("ellipsis.circle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSymbol:", v27);

  objc_msgSend(v25, "setEventPressedValueField:", 24);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAliases:", v29);

  objc_msgSend(v28, "setLocalizedName:", *MEMORY[0x24BE3A3B0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSymbol:", v30);

  objc_msgSend(v28, "setAnalog:", 0);
  objc_msgSend(v28, "setEventUpValueField:", 0);
  objc_msgSend(v28, "setEventDownValueField:", 1);
  objc_msgSend(v28, "setEventLeftValueField:", 2);
  objc_msgSend(v28, "setEventRightValueField:", 3);
  v31 = (void *)objc_opt_new();
  v39[0] = v38;
  v39[1] = v8;
  v39[2] = v11;
  v39[3] = v14;
  v39[4] = v35;
  v39[5] = v19;
  v39[6] = v22;
  v39[7] = v25;
  v39[8] = v28;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v39, 9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setElements:", v32);

  v33 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v36, v31, v37);
  return v33;
}

@end

@implementation _GCNintendoN64ControllerProfile

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return CFSTR("Switch N64 Controller");
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
  GCDeviceButtonInputDescription *v6;
  void *v7;
  GCDeviceButtonInputDescription *v8;
  void *v9;
  GCDeviceButtonInputDescription *v10;
  void *v11;
  GCDeviceButtonInputDescription *v12;
  void *v13;
  GCDeviceButtonInputDescription *v14;
  void *v15;
  GCDeviceButtonInputDescription *v16;
  void *v17;
  GCDeviceButtonInputDescription *v18;
  void *v19;
  GCDeviceButtonInputDescription *v20;
  GCDeviceButtonInputDescription *v21;
  void *v22;
  GCDeviceButtonInputDescription *v23;
  GCDeviceButtonInputDescription *v24;
  void *v25;
  GCDeviceDirectionPadDescription *v26;
  void *v27;
  GCDeviceDirectionPadDescription *v28;
  void *v29;
  GCDeviceDirectionPadDescription *v30;
  void *v31;
  GCDeviceDirectionPadDescription *v32;
  _GCDevicePhysicalInputComponentDescription *v33;
  void *v34;
  _GCDevicePhysicalInputComponentDescription *v35;
  GCDeviceDirectionPadDescription *v37;
  GCDeviceDirectionPadDescription *v38;
  GCDeviceButtonInputDescription *v39;
  GCDeviceButtonInputDescription *v40;
  GCDeviceButtonInputDescription *v41;
  id v42;
  id v43;
  GCDeviceButtonInputDescription *v44;
  GCDeviceButtonInputDescription *v45;
  GCDeviceButtonInputDescription *v46;
  GCDeviceButtonInputDescription *v47;
  _QWORD v48[14];

  v48[12] = *MEMORY[0x24BDAC8D0];
  v43 = a5;
  v42 = a4;
  v6 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A528], "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v6, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button A"), 0, 2, v7, CFSTR("a.circle"), 1, 4);

  v8 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A530], "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v8, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button B"), 0, 2, v9, CFSTR("b.circle"), 1, 5);

  v10 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A578], "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v10, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Shoulder"), 0, 2, v11, CFSTR("l.button.roundedbottom.horizontal"), 1, 8);

  v12 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A5B8], "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v12, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Shoulder"), 0, 2, v13, CFSTR("r.button.roundedbottom.horizontal"), 1, 9);

  v14 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A5B0], "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v14, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Left Trigger"), 0, 2, v15, CFSTR("zl.button.roundedtop.horizontal"), 1, 18);

  v16 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A5C8], "key");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v16, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Right Trigger"), 0, 2, v17, CFSTR("zr.button.roundedtop.horizontal"), 1, 19);

  v18 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A5A0], "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v18, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Menu"), 0, 0x4000, v19, CFSTR("line.horizontal.3.circle"), 1, 23);

  v21 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A538], "key");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v21, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Home"), 0, 49152, v22, CFSTR("house.circle"), 1, 22);

  v24 = [GCDeviceButtonInputDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A398], "key");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[GCDeviceButtonInputDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:](v24, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceExtendedEventField:", CFSTR("Button Share"), 0, 49152, v25, CFSTR("circle.square"), 1, 40);

  v26 = [GCDeviceDirectionPadDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A598], "key");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v26, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Right Thumbstick"), 0, 2, v27, CFSTR("circle.grid.cross"), 1, 14, 15, 16, 17);

  v28 = [GCDeviceDirectionPadDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A590], "key");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v28, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Direction Pad"), 0, 2, v29, CFSTR("dpad"), 1, 0, 1, 2, 3);

  v30 = [GCDeviceDirectionPadDescription alloc];
  objc_msgSend((id)*MEMORY[0x24BE3A5A8], "key");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[GCDeviceDirectionPadDescription initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:](v30, "initWithName:additionalAliases:attributes:nameLocalizationKey:symbolName:sourceAttributes:sourceUpExtendedEventField:sourceDownExtendedEventField:sourceLeftExtendedEventField:sourceRightExtendedEventField:", CFSTR("Left Thumbstick"), 0, 2, v31, CFSTR("l.joystick"), 0, 10, 11, 12, 13);

  v33 = [_GCDevicePhysicalInputComponentDescription alloc];
  v48[0] = v46;
  v48[1] = v44;
  v48[2] = v47;
  v48[3] = v45;
  v48[4] = v41;
  v48[5] = v40;
  v48[6] = v20;
  v48[7] = v23;
  v48[8] = v39;
  v48[9] = v38;
  v48[10] = v37;
  v48[11] = v32;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v48, 12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[_GCDevicePhysicalInputComponentDescription initWithIdentifier:elements:bindings:](v33, "initWithIdentifier:elements:bindings:", v42, v34, v43);

  return v35;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2, a4);
  return 0;
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
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _GCControllerInputComponentDescription *v101;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v115[12];
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[3];

  v127[1] = *MEMORY[0x24BDAC8D0];
  v108 = a5;
  v107 = a4;
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setAliases:", v6);

  objc_msgSend(v114, "setLocalizedName:", *MEMORY[0x24BE3A528]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setSymbol:", v7);

  objc_msgSend(v114, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setAliases:", v8);

  objc_msgSend(v113, "setLocalizedName:", *MEMORY[0x24BE3A530]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setSymbol:", v9);

  objc_msgSend(v113, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.l"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setAliases:", v10);

  objc_msgSend(v112, "setLocalizedName:", *MEMORY[0x24BE3A578]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.button.roundedbottom.horizontal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setSymbol:", v11);

  objc_msgSend(v112, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.r"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setAliases:", v12);

  objc_msgSend(v111, "setLocalizedName:", *MEMORY[0x24BE3A5B8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.button.roundedbottom.horizontal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setSymbol:", v13);

  objc_msgSend(v111, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.z"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setAliases:", v14);

  objc_msgSend(v110, "setLocalizedName:", *MEMORY[0x24BE3A5B0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("zl.button.roundedtop.horizontal"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setSymbol:", v15);

  objc_msgSend(v110, "setEventPressedValueField:", 18);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.zr"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setAliases:", v16);

  objc_msgSend(v106, "setLocalizedName:", *MEMORY[0x24BE3A5C8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("zr.button.roundedtop.horizontal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setSymbol:", v17);

  objc_msgSend(v106, "setEventPressedValueField:", 19);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.start"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setAliases:", v18);

  objc_msgSend(v109, "setLocalizedName:", *MEMORY[0x24BE3A5A0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setSymbol:", v19);

  objc_msgSend(v109, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.home"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setAliases:", v20);

  objc_msgSend(v105, "setLocalizedName:", *MEMORY[0x24BE3A538]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setSymbol:", v21);

  objc_msgSend(v105, "setEventPressedValueField:", 22);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.capture"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Share"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setAliases:", v22);

  objc_msgSend(v104, "setLocalizedName:", *MEMORY[0x24BE3A398]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.square"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setSymbol:", v23);

  objc_msgSend(v104, "setEventPressedValueField:", 40);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setAliases:", v24);

  objc_msgSend(v103, "setLocalizedName:", *MEMORY[0x24BE3A590]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setSymbol:", v25);

  objc_msgSend(v103, "setAnalog:", 0);
  objc_msgSend(v103, "setEventUpValueField:", 0);
  objc_msgSend(v103, "setEventDownValueField:", 1);
  objc_msgSend(v103, "setEventLeftValueField:", 2);
  objc_msgSend(v103, "setEventRightValueField:", 3);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("buttons.c"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAliases:", v27);

  v28 = *MEMORY[0x24BE3A598];
  objc_msgSend(v26, "setLocalizedName:", *MEMORY[0x24BE3A598]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.grid.cross"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSymbol:", v29);

  objc_msgSend(v26, "setAnalog:", 0);
  objc_msgSend(v26, "setEventUpValueField:", 14);
  objc_msgSend(v26, "setEventDownValueField:", 15);
  objc_msgSend(v26, "setEventLeftValueField:", 16);
  objc_msgSend(v26, "setEventRightValueField:", 17);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc((Class)&off_254DF77E0);
  v32 = (void *)objc_msgSend(v31, "initWithFormat:arg:", *MEMORY[0x24BE3A3D8], v28);
  objc_msgSend(v26, "symbol");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v30, v32, v33, 10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v34;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v127, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setXSources:", v35);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_alloc((Class)&off_254DF77E0);
  v38 = (void *)objc_msgSend(v37, "initWithFormat:arg:", *MEMORY[0x24BE3A3E0], v28);
  objc_msgSend(v26, "symbol");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v36, v38, v39, 5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v40;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v126, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setYSources:", v41);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc((Class)&off_254DF77E0);
  v44 = (void *)objc_msgSend(v43, "initWithFormat:arg:", *MEMORY[0x24BE3A3D0], v28);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.grid.cross.up.filled"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v42, v44, v45, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v46;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v125, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUpSources:", v47);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_alloc((Class)&off_254DF77E0);
  v50 = (void *)objc_msgSend(v49, "initWithFormat:arg:", *MEMORY[0x24BE3A3C8], v28);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.grid.cross.right.filled"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v48, v50, v51, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v52;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v124, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setRightSources:", v53);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_alloc((Class)&off_254DF77E0);
  v56 = (void *)objc_msgSend(v55, "initWithFormat:arg:", *MEMORY[0x24BE3A3B8], v28);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.grid.cross.down.filled"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v54, v56, v57, 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v58;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v123, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDownSources:", v59);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_alloc((Class)&off_254DF77E0);
  v62 = (void *)objc_msgSend(v61, "initWithFormat:arg:", *MEMORY[0x24BE3A3C0], v28);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.grid.cross.left.filled"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v60, v62, v63, 8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v64;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v122, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeftSources:", v65);

  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("controlstick"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setAliases:", v67);

  objc_msgSend(v66, "setLocalizedName:", *MEMORY[0x24BE3A5A8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setSymbol:", v68);

  objc_msgSend(v66, "setAnalog:", 1);
  objc_msgSend(v66, "setEventUpValueField:", 10);
  objc_msgSend(v66, "setEventDownValueField:", 11);
  objc_msgSend(v66, "setEventLeftValueField:", 12);
  objc_msgSend(v66, "setEventRightValueField:", 13);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedName");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "symbol");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v69, v70, v71, 10);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v72;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v121, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setXSources:", v73);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedName");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "symbol");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v74, v75, v76, 5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v77;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v120, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setYSources:", v78);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "symbol");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v79, v80, v81, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v82;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v119, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setUpSources:", v83);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedName");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "symbol");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v84, v85, v86, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v87;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v118, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setRightSources:", v88);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedName");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "symbol");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v89, v90, v91, 4);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v92;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v117, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setDownSources:", v93);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "localizedName");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "symbol");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v94, v95, v96, 8);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v97;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v116, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setLeftSources:", v98);

  v99 = (void *)objc_opt_new();
  v115[0] = v105;
  v115[1] = v104;
  v115[2] = v109;
  v115[3] = v114;
  v115[4] = v113;
  v115[5] = v112;
  v115[6] = v111;
  v115[7] = v110;
  v115[8] = v106;
  v115[9] = v66;
  v115[10] = v26;
  v115[11] = v103;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v115, 12);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setElements:", v100);

  v101 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v107, v99, v108);
  return v101;
}

@end

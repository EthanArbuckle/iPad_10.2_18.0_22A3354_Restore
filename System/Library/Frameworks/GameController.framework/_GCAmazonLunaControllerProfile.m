@implementation _GCAmazonLunaControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___GCAmazonLunaControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_4 != -1)
    dispatch_once(&deviceManager_onceToken_4, block);
  return (_GCPhysicalDeviceManager *)(id)deviceManager_deviceManager_4;
}

+ (void)deviceManager:(id)a3 willPublishPhysicalDevice:(id)a4
{
  objc_msgSend(a4, "setDelegate:", a1);
}

+ (void)deviceManager:(id)a3 prepareLogicalDevice:(id)a4
{
  objc_msgSend(a4, "setDelegate:", a1);
}

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return CFSTR("Luna");
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  _GCLunaGamepad *v8;
  uint64_t j;
  _OWORD v11[23];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  char v22;

  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  memset(v11, 0, sizeof(v11));
  GCExtendedGamepadInitInfoMake(v11);
  for (i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v11 + i + 8) = 257;
  BYTE1(v12) = 0;
  BYTE9(v16) = 0;
  v21 = 0;
  v22 = 0;
  v8 = -[GCExtendedGamepad initWithIdentifier:info:]([_GCLunaGamepad alloc], "initWithIdentifier:info:", v6, v11);
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v11 + j));

  return v8;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
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
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _GCControllerInputComponentDescription *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _QWORD v124[14];
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  _QWORD v138[3];

  v138[1] = *MEMORY[0x24BDAC8D0];
  v116 = a5;
  v115 = a4;
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.home"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setAliases:", v6);

  objc_msgSend(v123, "setLocalizedName:", *MEMORY[0x24BE3A4A0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setSymbol:", v7);

  objc_msgSend(v123, "setEventPressedValueField:", 22);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.menu"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setAliases:", v8);

  objc_msgSend(v122, "setLocalizedName:", *MEMORY[0x24BE3A4B0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setSymbol:", v9);

  objc_msgSend(v122, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.action"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setAliases:", v10);

  objc_msgSend(v121, "setLocalizedName:", *MEMORY[0x24BE3A4B8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("ellipsis.circle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setSymbol:", v11);

  objc_msgSend(v121, "setEventPressedValueField:", 24);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setAliases:", v12);

  objc_msgSend(v120, "setLocalizedName:", *MEMORY[0x24BE3A490]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setSymbol:", v13);

  objc_msgSend(v120, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setAliases:", v14);

  objc_msgSend(v119, "setLocalizedName:", *MEMORY[0x24BE3A498]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setSymbol:", v15);

  objc_msgSend(v119, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setAliases:", v16);

  objc_msgSend(v118, "setLocalizedName:", *MEMORY[0x24BE3A4C8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setSymbol:", v17);

  objc_msgSend(v118, "setEventPressedValueField:", 6);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setAliases:", v18);

  objc_msgSend(v117, "setLocalizedName:", *MEMORY[0x24BE3A4D0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setSymbol:", v19);

  objc_msgSend(v117, "setEventPressedValueField:", 7);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.bumper"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setAliases:", v20);

  objc_msgSend(v114, "setLocalizedName:", *MEMORY[0x24BE3A4E0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("lb.rectangle.roundedbottom"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setSymbol:", v21);

  objc_msgSend(v114, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.bumper"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setAliases:", v22);

  objc_msgSend(v113, "setLocalizedName:", *MEMORY[0x24BE3A4F8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("rb.rectangle.roundedbottom"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setSymbol:", v23);

  objc_msgSend(v113, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.trigger"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setAliases:", v24);

  objc_msgSend(v112, "setLocalizedName:", *MEMORY[0x24BE3A4F0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("lt.rectangle.roundedtop"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setSymbol:", v25);

  objc_msgSend(v112, "setAnalog:", 1);
  objc_msgSend(v112, "setEventPressedValueField:", 18);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.trigger"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setAliases:", v26);

  objc_msgSend(v111, "setLocalizedName:", *MEMORY[0x24BE3A508]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("rt.rectangle.roundedtop"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setSymbol:", v27);

  objc_msgSend(v111, "setAnalog:", 1);
  objc_msgSend(v111, "setEventPressedValueField:", 19);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setAliases:", v28);

  objc_msgSend(v110, "setLocalizedName:", *MEMORY[0x24BE3A4D8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setSymbol:", v29);

  objc_msgSend(v110, "setAnalog:", 0);
  objc_msgSend(v110, "setEventUpValueField:", 0);
  objc_msgSend(v110, "setEventDownValueField:", 1);
  objc_msgSend(v110, "setEventLeftValueField:", 2);
  objc_msgSend(v110, "setEventRightValueField:", 3);
  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.left"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), CFSTR("Left Thumbstick Button"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAliases:", v31);

  objc_msgSend(v30, "setLocalizedName:", *MEMORY[0x24BE3A4E8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSymbol:", v32);

  objc_msgSend(v30, "setAnalog:", 1);
  objc_msgSend(v30, "setEventUpValueField:", 10);
  objc_msgSend(v30, "setEventDownValueField:", 11);
  objc_msgSend(v30, "setEventLeftValueField:", 12);
  objc_msgSend(v30, "setEventRightValueField:", 13);
  objc_msgSend(v30, "setEventPressedValueField:", 20);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "symbol");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v33, v34, v35, 10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v36;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v138, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setXSources:", v37);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "symbol");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v38, v39, v40, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v41;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v137, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setYSources:", v42);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "symbol");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v43, v44, v45, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v46;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v136, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUpSources:", v47);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "symbol");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v48, v49, v50, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v51;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v135, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRightSources:", v52);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "symbol");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v53, v54, v55, 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v56;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v134, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDownSources:", v57);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "symbol");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v58, v59, v60, 8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v61;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v133, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLeftSources:", v62);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick Button"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = *MEMORY[0x24BE3A4A8];
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick.press.down"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v66;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v132, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPressedSources:", v67);

  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.right"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Thumbstick"), CFSTR("Right Thumbstick Button"), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAliases:", v69);

  objc_msgSend(v68, "setLocalizedName:", *MEMORY[0x24BE3A500]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setSymbol:", v70);

  objc_msgSend(v68, "setAnalog:", 1);
  objc_msgSend(v68, "setEventUpValueField:", 14);
  objc_msgSend(v68, "setEventDownValueField:", 15);
  objc_msgSend(v68, "setEventLeftValueField:", 16);
  objc_msgSend(v68, "setEventRightValueField:", 17);
  objc_msgSend(v68, "setEventPressedValueField:", 21);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedName");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "symbol");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v71, v72, v73, 10);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v74;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v131, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setXSources:", v75);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "symbol");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v76, v77, v78, 5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v79;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v130, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setYSources:", v80);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedName");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "symbol");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v81, v82, v83, 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v84;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v129, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setUpSources:", v85);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedName");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "symbol");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v86, v87, v88, 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v89;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v128, 1);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setRightSources:", v90);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedName");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "symbol");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v91, v92, v93, 4);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v94;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v127, 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setDownSources:", v95);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedName");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "symbol");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v96, v97, v98, 8);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v99;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v126, 1);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setLeftSources:", v100);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick Button"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = *MEMORY[0x24BE3A4C0];
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick.press.down"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v104;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v125, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setPressedSources:", v105);

  v106 = (void *)objc_opt_new();
  v124[0] = v123;
  v124[1] = v122;
  v124[2] = v121;
  v124[3] = v120;
  v124[4] = v119;
  v124[5] = v118;
  v124[6] = v117;
  v124[7] = v114;
  v124[8] = v113;
  v124[9] = v112;
  v124[10] = v111;
  v124[11] = v110;
  v124[12] = v30;
  v124[13] = v68;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v124, 14);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setElements:", v107);

  v109 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v115, v106, v116);
  return v109;
}

@end

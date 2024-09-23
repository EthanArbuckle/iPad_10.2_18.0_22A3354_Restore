@implementation _GCNintendoProControllerProfile

+ (id)physicalDeviceGetHapticCapabilities:(id)a3
{
  GCHapticActuator *v3;
  GCHapticActuator *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("Left Handle"), 1, 0);
  v7[0] = v3;
  v4 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("Right Handle"), 1, 1);
  v7[1] = v4;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3
{
  uint64_t v3;
  void *v4;
  GCHapticCapabilityGraph *v5;

  v3 = objc_opt_class();
  loadNSDictionaryFromJSON(v3, CFSTR("ProControllerHapticCapabilityGraph"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GCHapticCapabilityGraph initWithJSONDictionaryRepresentation:]([GCHapticCapabilityGraph alloc], "initWithJSONDictionaryRepresentation:", v4);

  return v5;
}

+ (BOOL)physicalDeviceSupportsMotion:(id)a3
{
  return 1;
}

+ (void)physicalDevice:(id)a3 getSensorsEnabledWithReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a3, "motionServiceServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77___GCNintendoProControllerProfile_physicalDevice_getSensorsEnabledWithReply___block_invoke;
  v8[3] = &unk_24D2B49A8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "readSensorsActiveWithReply:", v8);

}

+ (void)physicalDevice:(id)a3 setSensorsActive:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  objc_msgSend(a3, "motionServiceServer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSensorsActive:", v4);

}

+ (id)logicalDeviceControllerProductCategory:(id)a3
{
  return CFSTR("Switch Pro Controller");
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  _GCNintendoSwitchGamepad *v8;
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
  v21 = 1;
  v8 = -[GCExtendedGamepad initWithIdentifier:info:]([_GCNintendoSwitchGamepad alloc], "initWithIdentifier:info:", v6, v11);
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
  void *v64;
  void *v65;
  uint64_t v66;
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
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _GCControllerInputComponentDescription *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  _QWORD v127[15];
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
  void *v138;
  void *v139;
  void *v140;
  _QWORD v141[3];

  v141[1] = *MEMORY[0x24BDAC8D0];
  v118 = a5;
  v117 = a4;
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.home"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setAliases:", v6);

  objc_msgSend(v126, "setLocalizedName:", *MEMORY[0x24BE3A538]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setSymbol:", v7);

  objc_msgSend(v126, "setEventPressedValueField:", 22);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.capture"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setAliases:", v8);

  objc_msgSend(v125, "setLocalizedName:", *MEMORY[0x24BE3A398]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.square"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setSymbol:", v9);

  objc_msgSend(v125, "setEventPressedValueField:", 40);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.plus"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setAliases:", v10);

  objc_msgSend(v124, "setLocalizedName:", *MEMORY[0x24BE3A548]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("plus.circle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "setSymbol:", v11);

  objc_msgSend(v124, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.minus"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setAliases:", v12);

  objc_msgSend(v123, "setLocalizedName:", *MEMORY[0x24BE3A550]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("minus.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setSymbol:", v13);

  objc_msgSend(v123, "setEventPressedValueField:", 24);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setAliases:", v14);

  objc_msgSend(v122, "setLocalizedName:", *MEMORY[0x24BE3A528]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setSymbol:", v15);

  objc_msgSend(v122, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setAliases:", v16);

  objc_msgSend(v121, "setLocalizedName:", *MEMORY[0x24BE3A530]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "setSymbol:", v17);

  objc_msgSend(v121, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setAliases:", v18);

  objc_msgSend(v120, "setLocalizedName:", *MEMORY[0x24BE3A560]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setSymbol:", v19);

  objc_msgSend(v120, "setEventPressedValueField:", 6);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setAliases:", v20);

  objc_msgSend(v119, "setLocalizedName:", *MEMORY[0x24BE3A568]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setSymbol:", v21);

  objc_msgSend(v119, "setEventPressedValueField:", 7);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.l"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setAliases:", v22);

  objc_msgSend(v116, "setLocalizedName:", *MEMORY[0x24BE3A578]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l1.rectangle.roundedbottom"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setSymbol:", v23);

  objc_msgSend(v116, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.r"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setAliases:", v24);

  objc_msgSend(v115, "setLocalizedName:", *MEMORY[0x24BE3A5B8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r1.rectangle.roundedbottom"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setSymbol:", v25);

  objc_msgSend(v115, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.zl"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setAliases:", v26);

  objc_msgSend(v114, "setLocalizedName:", *MEMORY[0x24BE3A588]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("zl.rectangle.roundedtop"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setSymbol:", v27);

  objc_msgSend(v114, "setEventPressedValueField:", 18);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.zr"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setAliases:", v28);

  objc_msgSend(v113, "setLocalizedName:", *MEMORY[0x24BE3A5C8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("zr.rectangle.roundedtop"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setSymbol:", v29);

  objc_msgSend(v113, "setEventPressedValueField:", 19);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setAliases:", v30);

  objc_msgSend(v112, "setLocalizedName:", *MEMORY[0x24BE3A570]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setSymbol:", v31);

  objc_msgSend(v112, "setAnalog:", 0);
  objc_msgSend(v112, "setEventUpValueField:", 0);
  objc_msgSend(v112, "setEventDownValueField:", 1);
  objc_msgSend(v112, "setEventLeftValueField:", 2);
  objc_msgSend(v112, "setEventRightValueField:", 3);
  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.left"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), CFSTR("Left Thumbstick Button"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAliases:", v33);

  objc_msgSend(v32, "setLocalizedName:", *MEMORY[0x24BE3A580]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSymbol:", v34);

  objc_msgSend(v32, "setAnalog:", 1);
  objc_msgSend(v32, "setEventUpValueField:", 10);
  objc_msgSend(v32, "setEventDownValueField:", 11);
  objc_msgSend(v32, "setEventLeftValueField:", 12);
  objc_msgSend(v32, "setEventRightValueField:", 13);
  objc_msgSend(v32, "setEventPressedValueField:", 20);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "symbol");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v35, v36, v37, 10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v141[0] = v38;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v141, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setXSources:", v39);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "symbol");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v40, v41, v42, 5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v43;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v140, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setYSources:", v44);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "symbol");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v45, v46, v47, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v48;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v139, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUpSources:", v49);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "symbol");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v50, v51, v52, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v53;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v138, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setRightSources:", v54);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "symbol");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v55, v56, v57, 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v58;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v137, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDownSources:", v59);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedName");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "symbol");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v60, v61, v62, 8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v63;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v136, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLeftSources:", v64);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick Button"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = *MEMORY[0x24BE3A540];
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick.press.down"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v68;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v135, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPressedSources:", v69);

  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.right"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Thumbstick"), CFSTR("Right Thumbstick Button"), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAliases:", v71);

  objc_msgSend(v70, "setLocalizedName:", *MEMORY[0x24BE3A5C0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setSymbol:", v72);

  objc_msgSend(v70, "setAnalog:", 1);
  objc_msgSend(v70, "setEventUpValueField:", 14);
  objc_msgSend(v70, "setEventDownValueField:", 15);
  objc_msgSend(v70, "setEventLeftValueField:", 16);
  objc_msgSend(v70, "setEventRightValueField:", 17);
  objc_msgSend(v70, "setEventPressedValueField:", 21);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedName");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "symbol");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v73, v74, v75, 10);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v76;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v134, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setXSources:", v77);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedName");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "symbol");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v78, v79, v80, 5);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v81;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v133, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setYSources:", v82);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedName");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "symbol");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v83, v84, v85, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v86;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v132, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setUpSources:", v87);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedName");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "symbol");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v88, v89, v90, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v91;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v131, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setRightSources:", v92);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedName");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "symbol");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v93, v94, v95, 4);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v96;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v130, 1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setDownSources:", v97);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localizedName");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "symbol");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v98, v99, v100, 8);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v101;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v129, 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setLeftSources:", v102);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick Button"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = *MEMORY[0x24BE3A558];
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick.press.down"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v106;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v128, 1);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setPressedSources:", v107);

  v108 = (void *)objc_opt_new();
  v127[0] = v126;
  v127[1] = v125;
  v127[2] = v124;
  v127[3] = v123;
  v127[4] = v122;
  v127[5] = v121;
  v127[6] = v120;
  v127[7] = v119;
  v127[8] = v116;
  v127[9] = v115;
  v127[10] = v114;
  v127[11] = v113;
  v127[12] = v112;
  v127[13] = v32;
  v127[14] = v70;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v127, 15);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setElements:", v109);

  v111 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v117, v108, v118);
  return v111;
}

+ (id)logicalDevice:(id)a3 makeControllerMotionWithIdentifier:(id)a4
{
  id v4;
  GCMotion *v5;

  v4 = a4;
  v5 = -[GCMotion initWithIdentifier:]([GCMotion alloc], "initWithIdentifier:", v4);

  -[GCMotion _setHasRotationRate:](v5, "_setHasRotationRate:", 1);
  -[GCMotion _setHasAttitude:](v5, "_setHasAttitude:", 0);
  return v5;
}

@end

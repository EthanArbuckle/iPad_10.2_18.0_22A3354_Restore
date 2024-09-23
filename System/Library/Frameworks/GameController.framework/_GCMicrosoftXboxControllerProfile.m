@implementation _GCMicrosoftXboxControllerProfile

+ (_GCPhysicalDeviceManager)deviceManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50___GCMicrosoftXboxControllerProfile_deviceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceManager_onceToken_2 != -1)
    dispatch_once(&deviceManager_onceToken_2, block);
  return (_GCPhysicalDeviceManager *)(id)deviceManager_deviceManager_2;
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
  return CFSTR("Xbox One");
}

+ (id)logicalDeviceControllerDetailedProductCategory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;

  objc_msgSend(a3, "underlyingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPropertyForKey:", CFSTR("ProductID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v6 <= 2827)
  {
    if (v6 > 2817)
    {
      if (v6 != 2818 && v6 != 2821)
        goto LABEL_15;
    }
    else
    {
      if (v6 == 654)
      {
        v7 = CFSTR("Xbox 360");
        goto LABEL_16;
      }
      if (v6 != 2816)
      {
LABEL_15:
        v7 = CFSTR("Xbox One");
        goto LABEL_16;
      }
    }
LABEL_11:
    v7 = CFSTR("Xbox Elite");
    goto LABEL_16;
  }
  switch(v6)
  {
    case 2849:
      goto LABEL_14;
    case 2850:
    case 2852:
      goto LABEL_11;
    case 2851:
      goto LABEL_8;
    default:
      if ((v6 - 2834) < 2)
      {
LABEL_8:
        v7 = CFSTR("Xbox Series X");
        break;
      }
      if (v6 != 2828)
        goto LABEL_15;
LABEL_14:
      v7 = CFSTR("Xbox Adaptive");
      break;
  }
LABEL_16:

  return v7;
}

+ (id)logicalDevice:(id)a3 makeControllerPhysicalInputProfileWithIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  GCXboxGamepad *v10;
  uint64_t j;
  _OWORD v13[23];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  char v24;
  char v25;

  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  memset(v13, 0, sizeof(v13));
  GCExtendedGamepadInitInfoMake(v13);
  for (i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v13 + i + 8) = 257;
  BYTE1(v14) = 0;
  BYTE9(v18) = 0;
  v23 = 0;
  v24 = 0;
  v9 = objc_msgSend(a1, "logicalDeviceDeterminePhysicalInputType:", v6);
  if (v9 == 3)
    v25 = 1;
  v10 = -[GCExtendedGamepad initWithIdentifier:info:]([GCXboxGamepad alloc], "initWithIdentifier:info:", v7, v13);
  -[GCXboxGamepad setType:](v10, "setType:", v9);
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v13 + j));

  return v10;
}

+ (int64_t)logicalDeviceDeterminePhysicalInputType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  int64_t v8;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];
  uint8_t v13[16];
  uint8_t v14[16];

  objc_msgSend(a3, "underlyingDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberPropertyForKey:", CFSTR("ProductID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  v7 = (v6 - 2818);
  if (v7 > 0x21)
    goto LABEL_11;
  if (((1 << (v6 - 2)) & 0x200030000) != 0)
  {
    if (!gc_isInternalBuild())
    {
      v8 = 3;
      goto LABEL_13;
    }
    getGCDLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "recognized series x controller", buf, 2u);
    }
    v8 = 3;
LABEL_26:

    goto LABEL_13;
  }
  if (((1 << (v6 - 2)) & 9) == 0)
  {
    if (v7 == 10)
    {
      if (!gc_isInternalBuild())
      {
        v8 = 2;
        goto LABEL_13;
      }
      getGCDLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        v8 = 2;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "recognized adaptive controller", v13, 2u);
      }
      else
      {
        v8 = 2;
      }
      goto LABEL_26;
    }
LABEL_11:
    if (!gc_isInternalBuild())
    {
      v8 = 0;
      goto LABEL_13;
    }
    getGCDLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "recognized standard controller", v11, 2u);
    }
    v8 = 0;
    goto LABEL_26;
  }
  if (gc_isInternalBuild())
  {
    getGCDLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_DEFAULT, "recognized elite controller", v14, 2u);
    }
    v8 = 1;
    goto LABEL_26;
  }
  v8 = 1;
LABEL_13:

  return v8;
}

+ (id)logicalDevice:(id)a3 makeControllerInputDescriptionWithIdentifier:(id)a4 bindings:(id)a5
{
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
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
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
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _GCControllerInputComponentDescription *v133;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  id v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  _QWORD v153[4];
  _QWORD v154[14];
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  _QWORD v168[3];

  v168[1] = *MEMORY[0x24BDAC8D0];
  v143 = a5;
  v142 = a4;
  v140 = objc_msgSend(a1, "logicalDeviceDeterminePhysicalInputType:", a3);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.xbox"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setAliases:", v8);

  objc_msgSend(v139, "setLocalizedName:", *MEMORY[0x24BE3A5E0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("logo.xbox"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setSymbol:", v9);

  objc_msgSend(v139, "setEventPressedValueField:", 22);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.menu"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setAliases:", v10);

  objc_msgSend(v138, "setLocalizedName:", *MEMORY[0x24BE3A5F0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("line.horizontal.3.circle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "setSymbol:", v11);

  objc_msgSend(v138, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.view"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setAliases:", v12);

  objc_msgSend(v137, "setLocalizedName:", *MEMORY[0x24BE3A5F8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("rectangle.fill.on.rectangle.fill.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setSymbol:", v13);

  objc_msgSend(v137, "setEventPressedValueField:", 24);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setAliases:", v14);

  objc_msgSend(v144, "setLocalizedName:", *MEMORY[0x24BE3A5D0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setSymbol:", v15);

  objc_msgSend(v144, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setAliases:", v16);

  objc_msgSend(v152, "setLocalizedName:", *MEMORY[0x24BE3A5D8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setSymbol:", v17);

  objc_msgSend(v152, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setAliases:", v18);

  objc_msgSend(v151, "setLocalizedName:", *MEMORY[0x24BE3A628]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "setSymbol:", v19);

  objc_msgSend(v151, "setEventPressedValueField:", 6);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "setAliases:", v20);

  objc_msgSend(v150, "setLocalizedName:", *MEMORY[0x24BE3A630]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "setSymbol:", v21);

  objc_msgSend(v150, "setEventPressedValueField:", 7);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.bumper"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setAliases:", v22);

  objc_msgSend(v149, "setLocalizedName:", *MEMORY[0x24BE3A640]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("lb.rectangle.roundedbottom"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setSymbol:", v23);

  objc_msgSend(v149, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.bumper"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setAliases:", v24);

  objc_msgSend(v148, "setLocalizedName:", *MEMORY[0x24BE3A658]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("rb.rectangle.roundedbottom"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "setSymbol:", v25);

  objc_msgSend(v148, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.left.trigger"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setAliases:", v26);

  objc_msgSend(v147, "setLocalizedName:", *MEMORY[0x24BE3A650]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("lt.rectangle.roundedtop"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setSymbol:", v27);

  objc_msgSend(v147, "setAnalog:", 1);
  objc_msgSend(v147, "setEventPressedValueField:", 18);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.right.trigger"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setAliases:", v28);

  objc_msgSend(v146, "setLocalizedName:", *MEMORY[0x24BE3A668]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("rt.rectangle.roundedtop"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "setSymbol:", v29);

  objc_msgSend(v146, "setAnalog:", 1);
  objc_msgSend(v146, "setEventPressedValueField:", 19);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setAliases:", v30);

  objc_msgSend(v145, "setLocalizedName:", *MEMORY[0x24BE3A638]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "setSymbol:", v31);

  objc_msgSend(v145, "setAnalog:", 0);
  objc_msgSend(v145, "setEventUpValueField:", 0);
  objc_msgSend(v145, "setEventDownValueField:", 1);
  objc_msgSend(v145, "setEventLeftValueField:", 2);
  objc_msgSend(v145, "setEventRightValueField:", 3);
  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.left"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), CFSTR("Left Thumbstick Button"), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAliases:", v33);

  objc_msgSend(v32, "setLocalizedName:", *MEMORY[0x24BE3A648]);
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
  v168[0] = v38;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v168, 1);
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
  v167 = v43;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v167, 1);
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
  v166 = v48;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v166, 1);
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
  v165 = v53;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v165, 1);
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
  v164 = v58;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v164, 1);
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
  v163 = v63;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v163, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLeftSources:", v64);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick Button"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = *MEMORY[0x24BE3A5E8];
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick.press.down"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v68;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v162, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPressedSources:", v69);

  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.right"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Thumbstick"), CFSTR("Right Thumbstick Button"), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAliases:", v71);

  objc_msgSend(v70, "setLocalizedName:", *MEMORY[0x24BE3A660]);
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
  v161 = v76;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v161, 1);
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
  v160 = v81;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v160, 1);
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
  v159 = v86;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v159, 1);
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
  v158 = v91;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v158, 1);
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
  v157 = v96;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v157, 1);
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
  v156 = v101;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v156, 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setLeftSources:", v102);

  v103 = v144;
  v104 = v137;

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick Button"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = *MEMORY[0x24BE3A620];
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick.press.down"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v108;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v155, 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setPressedSources:", v109);

  v110 = v138;
  v111 = v139;
  v112 = (void *)objc_opt_new();
  v154[0] = v139;
  v154[1] = v138;
  v154[2] = v137;
  v154[3] = v144;
  v154[4] = v152;
  v154[5] = v151;
  v154[6] = v150;
  v154[7] = v149;
  v154[8] = v148;
  v154[9] = v147;
  v154[10] = v146;
  v154[11] = v145;
  v136 = v32;
  v154[12] = v32;
  v154[13] = v70;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v154, 14);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "setElements:", v113);

  if (v140 == 3)
  {
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.share"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Share"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setAliases:", v130);

    objc_msgSend(v129, "setLocalizedName:", *MEMORY[0x24BE3A398]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("square.and.arrow.up"));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setSymbol:", v131);

    objc_msgSend(v129, "setEventPressedValueField:", 40);
    objc_msgSend(v112, "elements");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "arrayByAddingObject:", v129);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setElements:", v120);
    goto LABEL_5;
  }
  if (v140 == 1)
  {
    v141 = v112;
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.paddle.1"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 1"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setAliases:", v115);

    v135 = v114;
    objc_msgSend(v114, "setLocalizedName:", *MEMORY[0x24BE3A600]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("1.circle"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setSymbol:", v116);

    objc_msgSend(v114, "setEventPressedValueField:", 25);
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.paddle.2"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 2"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setAliases:", v118);

    objc_msgSend(v117, "setLocalizedName:", *MEMORY[0x24BE3A608]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("2.circle"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setSymbol:", v119);

    objc_msgSend(v117, "setEventPressedValueField:", 26);
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.paddle.3"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 3"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setAliases:", v121);

    objc_msgSend(v120, "setLocalizedName:", *MEMORY[0x24BE3A610]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("3.circle"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setSymbol:", v122);

    objc_msgSend(v120, "setEventPressedValueField:", 27);
    +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.paddle.4"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Paddle 4"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setAliases:", v124);

    objc_msgSend(v123, "setLocalizedName:", *MEMORY[0x24BE3A618]);
    unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("4.circle"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setSymbol:", v125);

    objc_msgSend(v123, "setEventPressedValueField:", 28);
    objc_msgSend(v141, "elements");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v153[0] = v135;
    v153[1] = v117;
    v153[2] = v120;
    v153[3] = v123;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v153, 4);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "arrayByAddingObjectsFromArray:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setElements:", v128);

    v129 = v135;
    v111 = v139;
    v110 = v138;
    v104 = v137;
    v103 = v144;

    v112 = v141;
LABEL_5:

  }
  v132 = v112;
  v133 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:]([_GCControllerInputComponentDescription alloc], "initWithIdentifier:controllerInputs:bindings:", v142, v112, v143);

  return v133;
}

+ (int64_t)physicalDeviceGetIndicatedPlayerIndex:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  int64_t v6;

  objc_msgSend(a3, "serviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IOHIDServiceClientCopyProperty((IOHIDServiceClientRef)objc_msgSend(v3, "service"), CFSTR("LEDMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "unsignedIntValue");
    if ((v5 - 6) >= 4)
      v6 = -1;
    else
      v6 = (v5 - 6);
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

+ (void)physicalDevice:(id)a3 setIndicatedPlayerIndex:(int64_t)a4
{
  unsigned __int8 v4;
  id v5;

  if ((unint64_t)a4 >= 4)
    v4 = 6;
  else
    v4 = a4 + 6;
  objc_msgSend(a3, "serviceInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  IOHIDServiceClientSetProperty((IOHIDServiceClientRef)objc_msgSend(v5, "service"), CFSTR("LEDMode"), +[NSNumber numberWithUnsignedChar:](&off_254DED908, "numberWithUnsignedChar:", v4));

}

+ (BOOL)physicalDeviceSupportsBattery:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "serviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("ProductID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  return v5 != 654;
}

+ (void)physicalDevice:(id)a3 getBatteryWithReply:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a3, "batteryServiceServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72___GCMicrosoftXboxControllerProfile_physicalDevice_getBatteryWithReply___block_invoke;
  v8[3] = &unk_24D2B3FE0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "readBatteryWithReply:", v8);

}

+ (id)physicalDeviceGetHapticCapabilities:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  GCHapticActuator *v7;
  GCHapticActuator *v8;
  void *v9;
  GCHapticActuator *v10;
  GCHapticActuator *v11;
  _QWORD v13[4];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "serviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("ProductID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  objc_msgSend(v3, "stringPropertyForKey:", CFSTR("Product"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsString:", CFSTR("8BitDo M30")) & 1) != 0 || v5 == 2828)
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    if (v5 == 654)
    {
      v7 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("Low Band"), 0, 0);
      v14[0] = v7;
      v8 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("High Band"), 0, 1);
      v14[1] = v8;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v14, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("Low Band"), 0, 0);
      v13[0] = v7;
      v8 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("High Band"), 0, 1);
      v13[1] = v8;
      v10 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("Left Trigger"), 0, 2);
      v13[2] = v10;
      v11 = -[GCHapticActuator initWithLabel:type:index:]([GCHapticActuator alloc], "initWithLabel:type:index:", CFSTR("Right Trigger"), 0, 3);
      v13[3] = v11;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v13, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

+ (id)physicalDeviceGetHapticCapabilityGraph:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  GCHapticCapabilityGraph *v9;

  objc_msgSend(a3, "serviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberPropertyForKey:", CFSTR("ProductID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  v6 = objc_opt_class();
  if (v5 == 654)
    v7 = CFSTR("Xbox360HapticCapabilityGraph");
  else
    v7 = CFSTR("XboxHapticCapabilityGraph");
  loadNSDictionaryFromJSON(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GCHapticCapabilityGraph initWithJSONDictionaryRepresentation:]([GCHapticCapabilityGraph alloc], "initWithJSONDictionaryRepresentation:", v8);

  return v9;
}

@end

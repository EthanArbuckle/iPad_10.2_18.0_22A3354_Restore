@implementation AccessoryControlListItemsController

- (AccessoryControlListItemsController)init
{
  AccessoryControlListItemsController *v2;
  AccessoryControlListItemsController *v3;
  NSString *currentSelectedSpecifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AccessoryControlListItemsController;
  v2 = -[AccessoryControlListItemsController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80578]) = 0;
    v2->_autoANCSupported = 0;
    v2->_listeningModeConfigs = 0;
    currentSelectedSpecifier = v2->_currentSelectedSpecifier;
    v2->_currentSelectedSpecifier = (NSString *)CFSTR("Left");

  }
  return v3;
}

- (id)device
{
  return self->_currentDevice;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AccessoryControlListItemsController;
  -[PSListItemsController dealloc](&v2, sel_dealloc);
}

- (id)listeningModeCombinations
{
  $9FDB394E5CA5750B7644BE339E11A47B *p_listeningModeConfigs;
  BOOL v4;

  p_listeningModeConfigs = &self->_listeningModeConfigs;
  if (self->_listeningModeConfigs.anc)
  {
    if (self->_listeningModeConfigs.transparency)
    {
      if (p_listeningModeConfigs->normal)
      {
        if (self->_listeningModeConfigs.autoANC)
          return CFSTR("NC&Off&T&Auto");
        else
          return CFSTR("NC&Off&T");
      }
      if (self->_listeningModeConfigs.autoANC)
      {
        if (p_listeningModeConfigs->normal)
          return CFSTR("NC&Off&Auto");
        else
          return CFSTR("NC&T&Auto");
      }
    }
    else if (self->_listeningModeConfigs.autoANC)
    {
      if (p_listeningModeConfigs->normal)
        return CFSTR("NC&Off&Auto");
      v4 = 1;
      goto LABEL_19;
    }
  }
  v4 = !p_listeningModeConfigs->normal;
  if (p_listeningModeConfigs->normal && self->_listeningModeConfigs.transparency && self->_listeningModeConfigs.autoANC)
    return CFSTR("Off&T&Auto");
  if (self->_listeningModeConfigs.anc)
  {
LABEL_19:
    if (self->_listeningModeConfigs.transparency)
      return CFSTR("NC&T");
    if (self->_listeningModeConfigs.autoANC)
      return CFSTR("NC&Auto");
  }
  if (!v4 && self->_listeningModeConfigs.autoANC)
    return CFSTR("Off&Auto");
  if (self->_listeningModeConfigs.transparency)
  {
    if (self->_listeningModeConfigs.autoANC)
      return CFSTR("T&Auto");
  }
  else if (self->_listeningModeConfigs.anc)
  {
    return CFSTR("NC&Off");
  }
  return CFSTR("Off&T");
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BluetoothDeviceProtocol *v9;
  BluetoothDeviceProtocol *currentDevice;
  int v11;
  int v12;
  int *v13;
  void *v14;
  char v15;
  unint64_t v16;
  void *v17;
  int v18;
  char v19;
  _BOOL4 autoANCSupported;
  void *v21;
  int v22;
  NSString *currentSelectedSpecifier;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  NSString *v29;
  void *v30;
  int v31;
  NSString *v32;
  void *v33;
  int v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  uint64_t v45;
  unint64_t v46;
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
  uint64_t v57;
  uint64_t v58;
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
  objc_class *v92;
  uint64_t v93;
  void *v94;
  id v95;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  int v109;
  int v110;
  objc_super v111;
  _QWORD v112[4];

  v112[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v111.receiver = self;
  v111.super_class = (Class)AccessoryControlListItemsController;
  -[PSListItemsController specifiers](&v111, sel_specifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)*MEMORY[0x1E0D80628];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();
  currentDevice = self->_currentDevice;
  self->_currentDevice = v9;

  self->_autoANCSupported = -[BluetoothDeviceProtocol getAutoANCSupport](self->_currentDevice, "getAutoANCSupport");
  v11 = -[BluetoothDeviceProtocol productId](self->_currentDevice, "productId");
  v110 = 0;
  v109 = 0;
  v108 = v5;
  if (v11 != 8230)
  {
    v12 = v11;
    v13 = &v110;
    -[BluetoothDeviceProtocol clickHoldMode:rightAction:](self->_currentDevice, "clickHoldMode:rightAction:", &v110, &v109);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("LEFT_ID"));

    v16 = 0x1E0C99000;
    if ((v15 & 1) == 0)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("RIGHT_ID"));

      if (!v18)
        goto LABEL_38;
      v13 = &v109;
    }
    if (*v13 == 5
      && (!+[HPSProductUtils isBeatsNonWx:](HPSProductUtils, "isBeatsNonWx:", self->_currentDevice)
       || !-[BluetoothDeviceProtocol featureCapability:](self->_currentDevice, "featureCapability:", 30)
       || -[BluetoothDeviceProtocol getAACPCapabilityBit:](self->_currentDevice, "getAACPCapabilityBit:", 12)))
    {
      v19 = -[BluetoothDeviceProtocol listeningModeConfigs](self->_currentDevice, "listeningModeConfigs");
      self->_listeningModeConfigs.anc = (v19 & 2) != 0;
      self->_listeningModeConfigs.transparency = (v19 & 4) != 0;
      self->_listeningModeConfigs.normal = v19 & 1;
      self->_listeningModeConfigs.autoANC = (v19 & 8) != 0;
      autoANCSupported = self->_autoANCSupported;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("LEFT_ID"));

      if (autoANCSupported)
      {
        if (v22)
        {
          currentSelectedSpecifier = self->_currentSelectedSpecifier;
          self->_currentSelectedSpecifier = (NSString *)CFSTR("Left");

          -[AccessoryControlListItemsController listeningModeCombinations](self, "listeningModeCombinations");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v24, CFSTR("cycleBetweenV2LeftBudValue"), 0);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          v28 = CFSTR("CycleBetweenV2LeftBudValue");
        }
        else
        {
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("RIGHT_ID"));

          if (!v31)
            goto LABEL_19;
          v32 = self->_currentSelectedSpecifier;
          self->_currentSelectedSpecifier = (NSString *)CFSTR("Right");

          -[AccessoryControlListItemsController listeningModeCombinations](self, "listeningModeCombinations");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v24, CFSTR("cycleBetweenV2RightBudValue"), 0);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          v28 = CFSTR("CycleBetweenV2RightBudValue");
        }
      }
      else if (v22)
      {
        v29 = self->_currentSelectedSpecifier;
        self->_currentSelectedSpecifier = (NSString *)CFSTR("Left");

        -[AccessoryControlListItemsController listeningModeCombinations](self, "listeningModeCombinations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v24, CFSTR("cycleBetweenLeftBudValue"), 0);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = CFSTR("CycleBetweenLeftBudValue");
      }
      else
      {
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v6), "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("RIGHT_ID"));

        if (!v34)
          goto LABEL_19;
        v35 = self->_currentSelectedSpecifier;
        self->_currentSelectedSpecifier = (NSString *)CFSTR("Right");

        -[AccessoryControlListItemsController listeningModeCombinations](self, "listeningModeCombinations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v24, CFSTR("cycleBetweenRightBudValue"), 0);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        v28 = CFSTR("CycleBetweenRightBudValue");
      }
      objc_msgSend(v26, "postNotificationName:object:userInfo:", v28, 0, v25);

LABEL_19:
      v36 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("NOISE_CONTROL_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v38, self, 0, 0, 0, 0, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("NOISE_CONTROL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 > 8213)
      {
        if (v12 == 8214)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          v44 = CFSTR("DeviceConfig-B607");
          goto LABEL_28;
        }
        if (v12 == 8221)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          v44 = CFSTR("DeviceConfig-B498-v2");
          goto LABEL_28;
        }
      }
      else
      {
        if (v12 == 8209)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          v44 = CFSTR("DeviceConfig-B507");
          goto LABEL_28;
        }
        if (v12 == 8210)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          v44 = CFSTR("DeviceConfig-B494");
LABEL_28:
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("NOISE_CONTROL_FOOTER"), &stru_1EA29D890, v44);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = 0x1E0D80000;

          v41 = (void *)v45;
LABEL_30:
          v101 = v41;
          objc_msgSend(v39, "setProperty:forKey:", v41, *MEMORY[0x1E0D80848]);
          v102 = v39;
          objc_msgSend(v5, "addObject:", v39);
          objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 25.0);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = *(void **)(v46 + 1256);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("ACTIVE_NOISE_CANCELLATION"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, 0, 0, 0, 0, 3, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v105 = *MEMORY[0x1E0D80868];
          objc_msgSend(v50, "setProperty:forKey:", CFSTR("ANC"));
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("ACTIVE_NOISE_CANCELLATION_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = *MEMORY[0x1E0D80950];
          objc_msgSend(v50, "setProperty:forKey:", v52);

          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.closed.fill"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "imageByApplyingSymbolConfiguration:", v107);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v54;
          objc_msgSend(v54, "imageWithTintColor:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = *MEMORY[0x1E0D80870];
          objc_msgSend(v50, "setProperty:forKey:", v56);

          v57 = objc_opt_class();
          v58 = *MEMORY[0x1E0D80780];
          v100 = v50;
          v103 = *MEMORY[0x1E0D80780];
          objc_msgSend(v50, "setProperty:forKey:", v57, *MEMORY[0x1E0D80780]);
          v59 = *(void **)(v46 + 1256);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("ACTIVE_PASS_THROUGH"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v61, 0, 0, 0, 0, 3, 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "setProperty:forKey:", CFSTR("Passthrough"), v105);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("ACTIVE_PASS_THROUGH_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setProperty:forKey:", v64, v104);

          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.open.fill"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "imageByApplyingSymbolConfiguration:", v107);
          v66 = objc_claimAutoreleasedReturnValue();

          v97 = (void *)v66;
          objc_msgSend(v62, "setProperty:forKey:", v66, v106);
          v98 = v62;
          objc_msgSend(v62, "setProperty:forKey:", objc_opt_class(), v58);
          v67 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("BYPASS"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v69, 0, 0, 0, 0, 3, 0);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "setProperty:forKey:", CFSTR("Off"), v105);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("BYPASS_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setProperty:forKey:", v72, v104);

          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.closed.fill"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "colorWithAlphaComponent:", 0.5);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v112[0] = v76;
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v112[1] = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "configurationWithPaletteColors:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "imageByApplyingSymbolConfiguration:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "imageByApplyingSymbolConfiguration:", v107);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "setProperty:forKey:", v81, v106);
          objc_msgSend(v70, "setProperty:forKey:", objc_opt_class(), v103);
          if (self->_autoANCSupported)
          {
            v82 = (void *)MEMORY[0x1E0D804E8];
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("AUTO_ANC"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v84, 0, 0, 0, 0, 3, 0);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v85, "setProperty:forKey:", CFSTR("AutoANC"), v105);
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("AUTO_ANC_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B698"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setProperty:forKey:", v87, v104);

            objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.and.sparkles.fill"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "imageByApplyingSymbolConfiguration:", v107);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "imageWithTintColor:", v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setProperty:forKey:", v91, v106);

            objc_msgSend(v85, "setProperty:forKey:", objc_opt_class(), v103);
          }
          else
          {
            v85 = 0;
          }
          if (-[AccessoryControlListItemsController allowOffListeningMode](self, "allowOffListeningMode"))
            objc_msgSend(v108, "addObject:", v70);
          objc_msgSend(v108, "addObject:", v98);
          if (self->_autoANCSupported)
            objc_msgSend(v108, "addObject:", v85);
          objc_msgSend(v108, "addObject:", v100);

          v16 = 0x1E0C99000uLL;
          goto LABEL_38;
        }
      }
      v46 = 0x1E0D80000uLL;
      goto LABEL_30;
    }
LABEL_38:
    objc_msgSend(*(id *)(v16 + 3360), "arrayWithArray:", v108);
    v92 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v93 = (int)*MEMORY[0x1E0D80590];
    v94 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v93);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v93) = v92;

    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v93);
  }
  v95 = v5;

  return v95;
}

- (void)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  $9FDB394E5CA5750B7644BE339E11A47B *p_listeningModeConfigs;
  $9FDB394E5CA5750B7644BE339E11A47B *p_anc;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL4 autoANC;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  char v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  _BOOL4 v50;
  id v51;
  _BOOL4 normal;
  void *v53;
  objc_super v54;

  v4 = a3;
  if (!objc_msgSend(v4, "section"))
  {
    v54.receiver = self;
    v54.super_class = (Class)AccessoryControlListItemsController;
    -[PSListItemsController listItemSelected:](&v54, sel_listItemSelected_, v4);
    -[AccessoryControlListItemsController reloadSpecifiers](self, "reloadSpecifiers");
    goto LABEL_47;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessoryControlListItemsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  p_listeningModeConfigs = &self->_listeningModeConfigs;
  p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
  v10 = self->_listeningModeConfigs.transparency + self->_listeningModeConfigs.anc + self->_listeningModeConfigs.normal;
  if (self->_autoANCSupported)
    v10 += self->_listeningModeConfigs.autoANC;
  if (v10 == 2)
  {
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("ANC")) && p_anc->normal)
      goto LABEL_10;
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("Passthrough"))
      && self->_listeningModeConfigs.transparency)
    {

LABEL_10:
      goto LABEL_14;
    }
    v53 = v5;
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Off")) & 1) != 0)
    {
      normal = p_listeningModeConfigs->normal;

      v5 = v53;
      if (normal)
      {
LABEL_14:
        sharedBluetoothSettingsLogComponent();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[AccessoryControlListItemsController listItemSelected:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_16:

        goto LABEL_47;
      }
    }
    else
    {

      v5 = v53;
    }
    if (self->_autoANCSupported)
    {
      objc_msgSend(v7, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("AutoANC")) & 1) != 0)
      {
        autoANC = self->_listeningModeConfigs.autoANC;

        if (autoANC)
        {
          sharedBluetoothSettingsLogComponent();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[AccessoryControlListItemsController listItemSelected:].cold.1(v14, v24, v25, v26, v27, v28, v29, v30);
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
  }
  objc_msgSend(v5, "setChecked:", objc_msgSend(v5, "isChecked") ^ 1);
  objc_msgSend(v7, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("ANC"));

  if (v32)
  {
    v33 = objc_msgSend(v5, "isChecked");
  }
  else
  {
    objc_msgSend(v7, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("Passthrough"));

    if (v35)
    {
      v33 = objc_msgSend(v5, "isChecked");
      p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("Off"));

      if (v37)
      {
        v33 = objc_msgSend(v5, "isChecked");
        p_anc = &self->_listeningModeConfigs;
      }
      else
      {
        if (!self->_autoANCSupported)
          goto LABEL_34;
        objc_msgSend(v7, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("AutoANC"));

        if (!v39)
          goto LABEL_34;
        v33 = objc_msgSend(v5, "isChecked");
        p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.autoANC;
      }
    }
  }
  p_anc->normal = v33;
LABEL_34:
  v40 = 2 * self->_listeningModeConfigs.anc;
  if (self->_listeningModeConfigs.transparency)
    v40 |= 4u;
  v41 = v40 | p_listeningModeConfigs->normal;
  if (self->_autoANCSupported)
  {
    v42 = v5;
    if (self->_listeningModeConfigs.autoANC)
      v41 = v41 | 8;
    else
      v41 = v41;
    v43 = -[NSString isEqualToString:](self->_currentSelectedSpecifier, "isEqualToString:", CFSTR("Left"));
    -[AccessoryControlListItemsController listeningModeCombinations](self, "listeningModeCombinations");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_alloc(MEMORY[0x1E0C99D80]);
    if (v43)
    {
      v46 = (void *)objc_msgSend(v45, "initWithObjectsAndKeys:", v44, CFSTR("cycleBetweenV2LeftBudValue"), 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = CFSTR("CycleBetweenV2LeftBudValue");
    }
    else
    {
      v46 = (void *)objc_msgSend(v45, "initWithObjectsAndKeys:", v44, CFSTR("cycleBetweenV2RightBudValue"), 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = CFSTR("CycleBetweenV2RightBudValue");
    }
  }
  else
  {
    v42 = v5;
    v50 = -[NSString isEqualToString:](self->_currentSelectedSpecifier, "isEqualToString:", CFSTR("Left"));
    -[AccessoryControlListItemsController listeningModeCombinations](self, "listeningModeCombinations");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_alloc(MEMORY[0x1E0C99D80]);
    if (v50)
    {
      v46 = (void *)objc_msgSend(v51, "initWithObjectsAndKeys:", v44, CFSTR("cycleBetweenLeftBudValue"), 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = CFSTR("CycleBetweenLeftBudValue");
    }
    else
    {
      v46 = (void *)objc_msgSend(v51, "initWithObjectsAndKeys:", v44, CFSTR("cycleBetweenRightBudValue"), 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      v49 = CFSTR("CycleBetweenRightBudValue");
    }
  }
  objc_msgSend(v47, "postNotificationName:object:userInfo:", v49, 0, v46);

  -[BluetoothDeviceProtocol setListeningModeConfigs:](self->_currentDevice, "setListeningModeConfigs:", v41);
LABEL_47:

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  $9FDB394E5CA5750B7644BE339E11A47B *p_anc;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  id v24;

  v24 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v24;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_13;
  v8 = v24;
  objc_msgSend(v8, "valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 0);

  objc_msgSend(v8, "valueLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(v8, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ANC"));

  if (v13)
  {
    p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.anc;
  }
  else
  {
    objc_msgSend(v8, "specifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Passthrough"));

    if (v17)
    {
      p_anc = ($9FDB394E5CA5750B7644BE339E11A47B *)&self->_listeningModeConfigs.transparency;
    }
    else
    {
      objc_msgSend(v8, "specifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Off"));

      if (!v20)
        goto LABEL_9;
      p_anc = &self->_listeningModeConfigs;
    }
  }
  objc_msgSend(v8, "setChecked:", p_anc->normal);
LABEL_9:
  if (self->_autoANCSupported)
  {
    objc_msgSend(v8, "specifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("AutoANC"));

    if (v23)
      objc_msgSend(v8, "setChecked:", self->_listeningModeConfigs.autoANC);
  }

  v7 = v24;
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSelectedSpecifier, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
}

- (BOOL)allowOffListeningMode
{
  return 1;
}

- (void)listItemSelected:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "Invalid listening mode (Auto ANC) configuration. Early return", a5, a6, a7, a8, 0);
}

- (void)listItemSelected:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "Invalid listening mode configuration. Early return", a5, a6, a7, a8, 0);
}

@end

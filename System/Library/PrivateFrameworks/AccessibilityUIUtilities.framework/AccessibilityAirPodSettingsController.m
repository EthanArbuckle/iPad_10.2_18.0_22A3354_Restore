@implementation AccessibilityAirPodSettingsController

- (BOOL)isInWatchSettings
{
  return 0;
}

- (AccessibilityAirPodSettingsController)init
{
  AccessibilityAirPodSettingsController *v2;
  void *v3;
  AccessibilityAirPodSettingsController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AccessibilityAirPodSettingsController;
  v2 = -[AXUISettingsSetupCapableListController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_reloadSpecifiers, *MEMORY[0x1E0DDDF60], 0);

    v4 = v2;
  }

  return v2;
}

- (double)toneVolumeValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  float v6;
  double v7;

  v3 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "nps_toneVolumeForDeviceAddress:", v5);
    v7 = v6;
  }
  else
  {
    v7 = (double)objc_msgSend(v4, "toneVolumeForDeviceAddress:", v5);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AccessibilityAirPodSettingsController;
  -[AccessibilityAirPodSettingsController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[AccessibilityAirPodSettingsController toneVolumeValue](self, "toneVolumeValue");
  *(float *)&v4 = v4;
  -[AccessibilityAirPodSettingsController _updateToneVolumeFooter:](self, "_updateToneVolumeFooter:", v4);
}

- (BOOL)supportsSpatialAudio
{
  void *v3;
  char v4;

  if (-[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsSpatialAudio");

  return v4;
}

- (void)setSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AccessibilityAirPodSettingsController;
  -[AccessibilityAirPodSettingsController setSpecifier:](&v7, sel_setSpecifier_, a3);
  -[AccessibilityAirPodSettingsController specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("AirPods"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_storeStrong((id *)&self->_btDevice, v6);

}

- (BOOL)isBeatsProduct
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isBeatsProduct:", self->_btDevice);

  return (char)self;
}

- (double)defaultToneVolumeValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  v3 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDevice address](self->_btDevice, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = objc_msgSend(v4, "nps_defaultToneVolumeForDeviceAddress:", v5);
  else
    v6 = objc_msgSend(v4, "defaultToneVolumeForDeviceAddress:", v5);
  v7 = v6;

  return (double)v7;
}

- (double)displayedMaxValue
{
  double v2;

  -[AccessibilityAirPodSettingsController defaultToneVolumeValue](self, "defaultToneVolumeValue");
  return 10000.0 / (double)v2;
}

- (double)holdSpeedValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v3 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "nps_holdDurationForDeviceAddress:", v5);
  else
    objc_msgSend(v4, "holdDurationForDeviceAddress:", v5);
  v7 = v6;

  return v7;
}

- (double)tapSpeedValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v3 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "nps_tapSpeedForDeviceAddress:", v5);
  else
    objc_msgSend(v4, "tapSpeedForDeviceAddress:", v5);
  v7 = v6;

  return v7;
}

- (double)volumeSwipeDurationValue
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v3 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "nps_volumeSwipeDurationForDeviceAddress:", v5);
  else
    objc_msgSend(v4, "volumeSwipeDurationForDeviceAddress:", v5);
  v7 = v6;

  return v7;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  PSSpecifier *v12;
  PSSpecifier *doubleTapGroup;
  uint64_t v14;
  PSSpecifier *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  PSSpecifier *v33;
  PSSpecifier *holdGroup;
  PSSpecifier *v35;
  void *v36;
  PSSpecifier *v37;
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
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
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
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v131;
  void *v132;
  void *v133;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = 0x1E0CF4000uLL;
    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDevice address](self->_btDevice, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "supportsTapSpeedForDeviceAddress:", v8);

    v133 = v5;
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "groupSpecifierWithName:", v11);
      v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      doubleTapGroup = self->_doubleTapGroup;
      self->_doubleTapGroup = v12;

      v14 = *MEMORY[0x1E0D80898];
      -[PSSpecifier setProperty:forKey:](self->_doubleTapGroup, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80898]);
      v15 = self->_doubleTapGroup;
      AXAirPodsLocalizedStringForKey();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0D80848];
      -[PSSpecifier setProperty:forKey:](v15, "setProperty:forKey:", v16, *MEMORY[0x1E0D80848]);

      v18 = *MEMORY[0x1E0D80868];
      -[PSSpecifier setProperty:forKey:](self->_doubleTapGroup, "setProperty:forKey:", CFSTR("TapGroup"), *MEMORY[0x1E0D80868]);
      v19 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, 0, 0, 0, 0, 3, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setProperty:forKey:", CFSTR("TapDefault"), v18);
      v22 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, 0, 0, 0, 0, 3, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setProperty:forKey:", CFSTR("TapSlow"), v18);
      v25 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, 0, 0, 0, 0, 3, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setProperty:forKey:", CFSTR("TapSlowest"), v18);
      -[AccessibilityAirPodSettingsController tapSpeedValue](self, "tapSpeedValue");
      *(float *)&v28 = v28;
      v29 = *(float *)&v28;
      v30 = v21;
      if (fabs(v29 + -0.25) <= 0.0500000007
        || (v30 = v24, fabs(v29 + -0.45) <= 0.0500000007)
        || (v30 = v27, fabs(v29 + -0.65) <= 0.0500000007))
      {
        -[PSSpecifier setProperty:forKey:](self->_doubleTapGroup, "setProperty:forKey:", v30, *MEMORY[0x1E0D808E0]);
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_doubleTapGroup, v21, v24, v27, 0);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:");
      v31 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "groupSpecifierWithName:", v32);
      v33 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      holdGroup = self->_holdGroup;
      self->_holdGroup = v33;

      -[PSSpecifier setProperty:forKey:](self->_holdGroup, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], v14);
      v35 = self->_holdGroup;
      AXAirPodsLocalizedStringForKey();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v35, "setProperty:forKey:", v36, v17);

      -[PSSpecifier setProperty:forKey:](self->_holdGroup, "setProperty:forKey:", CFSTR("HoldGroup"), v18);
      if (-[AccessibilityAirPodSettingsController isBeatsProduct](self, "isBeatsProduct"))
      {
        v37 = self->_holdGroup;
        AXBeats463LocalizedStringForKey();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](v37, "setProperty:forKey:", v38, v17);

      }
      v39 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v40, 0, 0, 0, 0, 3, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "setProperty:forKey:", CFSTR("HoldDefault"), v18);
      v42 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, 0, 0, 0, 0, 3, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "setProperty:forKey:", CFSTR("HoldFast"), v18);
      v45 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v46, 0, 0, 0, 0, 3, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "setProperty:forKey:", CFSTR("HoldFastest"), v18);
      -[AccessibilityAirPodSettingsController holdSpeedValue](self, "holdSpeedValue");
      *(float *)&v48 = v48;
      v49 = *(float *)&v48;
      v50 = v41;
      if (fabs(v49 + -0.5) <= 0.0500000007
        || (v50 = v44, fabs(v49 + -0.4) <= 0.0500000007)
        || (v50 = v47, fabs(v49 + -0.35) <= 0.0500000007))
      {
        -[PSSpecifier setProperty:forKey:](self->_holdGroup, "setProperty:forKey:", v50, *MEMORY[0x1E0D808E0]);
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_holdGroup, v41, v44, v47, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v133;
      objc_msgSend(v133, "addObjectsFromArray:", v51);

      v6 = 0x1E0CF4000uLL;
    }
    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDevice address](self->_btDevice, "address");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "supportsNoiseCancellationEnabledForDeviceAddress:", v53);

    if (v54)
    {
      AXAirPodsLocalizedStringForKey();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[AccessibilityAirPodSettingsController isBeatsProduct](self, "isBeatsProduct"))
      {
        AXAirPodsB494LocalizedStringForKey();
        v56 = objc_claimAutoreleasedReturnValue();

        v55 = (void *)v56;
      }
      v59 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "groupSpecifierWithName:", v60);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v58, "setProperty:forKey:", v55, *MEMORY[0x1E0D80848]);
      v61 = *MEMORY[0x1E0D80868];
      objc_msgSend(v58, "setProperty:forKey:", CFSTR("NoiseControlGroup"), *MEMORY[0x1E0D80868]);
      objc_msgSend(v5, "addObject:", v58);
      v62 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v63, self, sel_setNoiseCancellation_specifier_, sel_noiseCancellation_, 0, 6, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "setProperty:forKey:", CFSTR("NoiseControl"), v61);
      objc_msgSend(v5, "addObject:", v57);

      v6 = 0x1E0CF4000;
    }
    else
    {
      v57 = 0;
      v58 = 0;
    }
    AXDeviceIsPhone();
    AXAirPodsLocalizedStringForKey();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AccessibilityAirPodSettingsController isBeatsProduct](self, "isBeatsProduct"))
    {
      if ((AXDeviceIsPhone() & 1) != 0)
        AXAirPodsLocalizedStringForKey();
      else
        AXAirPodsB494LocalizedStringForKey();
      v65 = objc_claimAutoreleasedReturnValue();

      v64 = (void *)v65;
    }
    v132 = v64;
    if (!-[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings"))
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setProperty:forKey:", v64, *MEMORY[0x1E0D80848]);
      objc_msgSend(v5, "addObject:", v66);
      AXDeviceIsPhone();
      AXAirPodsLocalizedStringForKey();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v67, self, 0, 0, 0, 13, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setButtonAction:", sel_jumpToAVSettings_);
      objc_msgSend(v68, "setProperty:forKey:", CFSTR("PERSONAL_AUDIO_AIRPODS_BUTTON"), *MEMORY[0x1E0D80868]);
      objc_msgSend(v5, "addObject:", v68);

      v6 = 0x1E0CF4000uLL;
    }
    if (-[AccessibilityAirPodSettingsController supportsSpatialAudio](self, "supportsSpatialAudio"))
    {
      objc_msgSend(*(id *)(v6 + 3672), "sharedInstance");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v69, "supportsSpatialAudioForDeviceAddress:", v70);

      if (v71)
      {
        v72 = (void *)MEMORY[0x1E0D804E8];
        AXAirPodsLocalizedStringForKey();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "groupSpecifierWithName:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        AXLocStringKeyForModel();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        AXAirPodsLocalizedStringForKey();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setProperty:forKey:", v76, *MEMORY[0x1E0D80848]);

        v77 = *MEMORY[0x1E0D80868];
        objc_msgSend(v74, "setProperty:forKey:", CFSTR("SPATIAL_AUDIO_GROUP"), *MEMORY[0x1E0D80868]);
        objc_msgSend(v74, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80898]);
        objc_msgSend(v5, "addObject:", v74);
        v78 = (void *)MEMORY[0x1E0D804E8];
        AXLocStringKeyForModel();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        AXAirPodsLocalizedStringForKey();
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v80, self, sel_setSpatialAudioLock_specifier_, sel_spatialAudioLock_, 0, 6, 0);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = 0x1E0CF4000uLL;
        objc_msgSend(v81, "setProperty:forKey:", CFSTR("SPATIAL_AUDIO_SWITCH"), v77);
        objc_msgSend(v5, "addObject:", v81);
        v57 = v81;
        v58 = v74;
      }
    }
    objc_msgSend(*(id *)(v6 + 3672), "sharedInstance");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDevice address](self->_btDevice, "address");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v82, "supportsCaseTonesForDeviceAddress:", v83);

    if (v84)
    {
      v85 = (void *)MEMORY[0x1E0D804E8];
      AXBeats463LocalizedStringForKey();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "groupSpecifierWithName:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v87, "setProperty:forKey:", CFSTR("CASE_TONES"), *MEMORY[0x1E0D80868]);
      AXBeats463LocalizedStringForKey();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setProperty:forKey:", v88, *MEMORY[0x1E0D80848]);

      objc_msgSend(v5, "addObject:", v87);
      AXBeats463LocalizedStringForKey();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v89, self, sel_setCaseTonesEnabled_specifier_, sel_caseTonesEnabled, 0, 6, 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v90);

      v58 = v87;
    }
    objc_msgSend(*(id *)(v6 + 3672), "sharedInstance");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDevice address](self->_btDevice, "address");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v91, "supportsToneVolumeForDeviceAddress:", v92);

    if (v93)
    {
      v94 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsLocalizedStringForKey();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "groupSpecifierWithName:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      v97 = *MEMORY[0x1E0D80868];
      objc_msgSend(v96, "setProperty:forKey:", CFSTR("ToneVolumeFooterID"), *MEMORY[0x1E0D80868]);
      objc_msgSend(v5, "addObject:", v96);
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setToneVolume_specifier_, sel_toneVolume_, 0, 5, 0);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      AXSpeakerMaxImage();
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setProperty:forKey:", v99, *MEMORY[0x1E0D80910]);

      AXSpeakerMuteImage();
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setProperty:forKey:", v100, *MEMORY[0x1E0D80908]);

      v6 = 0x1E0CF4000uLL;
      objc_msgSend(v98, "setProperty:forKey:", &unk_1E76C2258, *MEMORY[0x1E0D807D8]);
      objc_msgSend(v98, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
      objc_msgSend(v98, "setProperty:forKey:", &unk_1E76C2270, *MEMORY[0x1E0D807E0]);
      objc_msgSend(v98, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80878]);
      objc_msgSend(v98, "setProperty:forKey:", CFSTR("TONE_VOLUME"), v97);
      -[BluetoothDevice address](self->_btDevice, "address");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setProperty:forKey:", v101, CFSTR("BTAddress"));

      objc_msgSend(v5, "addObject:", v98);
      v58 = v96;
    }
    objc_msgSend(*(id *)(v6 + 3672), "sharedInstance");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v102, "supportsVolumeSwipeForDeviceAddress:", v103);

    if (v104)
    {
      v105 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsB698LocalizedStringForKey();
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "groupSpecifierWithName:", v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      AXAirPodsB698LocalizedStringForKey();
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = *MEMORY[0x1E0D80848];
      objc_msgSend(v107, "setProperty:forKey:", v108, *MEMORY[0x1E0D80848]);

      objc_msgSend(v5, "addObject:", v107);
      v110 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsB698LocalizedStringForKey();
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v111, self, sel_setVolumeSwipeEnabled_specifier_, sel_volumeSwipeEnabled_, 0, 6, 0);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = *MEMORY[0x1E0D80868];
      objc_msgSend(v112, "setProperty:forKey:", CFSTR("VOLUME_SWIPE_SWITCH"), *MEMORY[0x1E0D80868]);
      objc_msgSend(v5, "addObject:", v112);
      objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      AXAirPodsB698LocalizedStringForKey();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "setProperty:forKey:", v115, v109);

      objc_msgSend(v114, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80898]);
      objc_msgSend(v114, "setProperty:forKey:", CFSTR("VOLUME_SWIPE_GROUP"), v113);
      v116 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsB698LocalizedStringForKey();
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v117, 0, 0, 0, 0, 3, 0);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v118, "setProperty:forKey:", CFSTR("VOLUME_SWIPE_DEFAULT"), v113);
      v119 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsB698LocalizedStringForKey();
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v120, 0, 0, 0, 0, 3, 0);
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v121, "setProperty:forKey:", CFSTR("VOLUME_SWIPE_LONG"), v113);
      v122 = (void *)MEMORY[0x1E0D804E8];
      AXAirPodsB698LocalizedStringForKey();
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v123, 0, 0, 0, 0, 3, 0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v124, "setProperty:forKey:", CFSTR("VOLUME_SWIPE_LONGEST"), v113);
      -[AccessibilityAirPodSettingsController volumeSwipeDurationValue](self, "volumeSwipeDurationValue");
      *(float *)&v125 = v125;
      v126 = *(float *)&v125;
      v127 = v118;
      if (fabs(v126 + -0.5) <= 0.0500000007
        || (v127 = v121, fabs(v126 + -0.4) <= 0.0500000007)
        || (v127 = v124, fabs(v126 + -0.35) <= 0.0500000007))
      {
        objc_msgSend(v114, "setProperty:forKey:", v127, *MEMORY[0x1E0D808E0]);
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v114, v118, v121, v124, 0);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObjectsFromArray:", v128);

      v5 = v133;
      v57 = v112;
      v58 = v107;
    }
    v129 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setVolumeSwipeEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CF4E58];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVolumeSwipeEnabled:forDeviceAddress:", v7, v8);

}

- (id)volumeSwipeEnabled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "volumeSwipeEnabledForDeviceAddress:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)applyHapticIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  NSObject *v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  UIImpactFeedbackGenerator *hapticGenerator;
  UIImpactFeedbackGenerator *v15;
  UIImpactFeedbackGenerator *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (float)objc_msgSend(v5, "defaultToneVolumeForDeviceAddress:", v6);

  AXLogAirPodSettings();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(float *)&v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hapticPlayedValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v10;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1BD892000, v8, OS_LOG_TYPE_INFO, "Apply haptic: %@ value: %@ current hap: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(v4, "floatValue");
  v13 = vabds_f32(v12, v7);
  if (v13 >= 0.5 || self->_hapticPlayedValue)
  {
    if (v13 > 2.0)
      self->_hapticPlayedValue = 0;
  }
  else
  {
    hapticGenerator = self->_hapticGenerator;
    if (!hapticGenerator)
    {
      v15 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
      v16 = self->_hapticGenerator;
      self->_hapticGenerator = v15;

      hapticGenerator = self->_hapticGenerator;
    }
    -[UIImpactFeedbackGenerator impactOccurred](hapticGenerator, "impactOccurred");
    self->_hapticPlayedValue = 1;
  }

}

- (void)setCaseTonesEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CF4E58];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCaseTonesEnabled:forDeviceAddress:", v7, v8);

}

- (id)caseTonesEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "caseTonesEnabledForDeviceAddress:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setToneVolume:(id)a3 specifier:(id)a4
{
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  NSObject *v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "floatValue");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (float)objc_msgSend(v7, "defaultToneVolumeForDeviceAddress:", v8);

  if (vabds_f32(v6, v9) <= 2.0 && (-[UISlider isTracking](self->_toneVolumeSlider, "isTracking") & 1) == 0)
  {
    *(float *)&v10 = v9;
    -[UISlider setValue:animated:](self->_toneVolumeSlider, "setValue:animated:", 1, v10);
    v6 = v9;
  }
  AXLogAirPodSettings();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(float *)&v12 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v13;
    _os_log_impl(&dword_1BD892000, v11, OS_LOG_TYPE_DEFAULT, "Set tone volume value: %@", (uint8_t *)&v19, 0xCu);

  }
  v14 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v17 = v6;
    objc_msgSend(v15, "nps_setToneVolume:forDeviceAddress:", v16, v17);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToneVolume:forDeviceAddress:", v6, v16);
  }

  if ((-[UISlider isTracking](self->_toneVolumeSlider, "isTracking") & 1) == 0)
  {
    *(float *)&v18 = v6;
    -[AccessibilityAirPodSettingsController _updateToneVolumeFooter:](self, "_updateToneVolumeFooter:", v18);
  }
}

- (void)_updateToneVolumeFooter:(float)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  uint64_t v11;
  id v12;

  -[AccessibilityAirPodSettingsController specifierForID:](self, "specifierForID:", CFSTR("ToneVolumeFooterID"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  AXAirPodsLocalizedStringForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AccessibilityAirPodSettingsController isBeatsProduct](self, "isBeatsProduct"))
  {
    AXAirPodsLocalizedStringForKey();
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (float)objc_msgSend(v7, "defaultToneVolumeForDeviceAddress:", v8);

  if (v9 < a3)
  {
    AXAirPodsLocalizedStringForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  objc_msgSend(v12, "setProperty:forKey:", v5, *MEMORY[0x1E0D80848]);
  -[AccessibilityAirPodSettingsController reloadSpecifier:](self, "reloadSpecifier:", v12);

}

- (id)toneVolume:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings", a3);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "nps_toneVolumeForDeviceAddress:", v7);
    objc_msgSend(v5, "numberWithFloat:");
  }
  else
  {
    objc_msgSend(v5, "numberWithUnsignedInt:", objc_msgSend(v6, "toneVolumeForDeviceAddress:", v7));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setSpatialAudioLock:(id)a3 specifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  _AXSSetSpatialAudioHeadTracking();
}

- (id)spatialAudioLock:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _AXSSpatialAudioHeadTracking() != 0);
}

- (void)jumpToAVSettings:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=AUDIO_VISUAL_TITLE"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (id)_btDeviceAddress
{
  return (id)-[BluetoothDevice address](self->_btDevice, "address");
}

- (id)noiseCancellation:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings", a3);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = objc_msgSend(v6, "nps_noiseCancellationEnabledWithOneUnitForDeviceAddress:", v7);
  else
    v8 = objc_msgSend(v6, "noiseCancellationEnabledWithOneUnitForDeviceAddress:", v7);
  objc_msgSend(v5, "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setNoiseCancellation:(id)a3 specifier:(id)a4
{
  id v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
  objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLValue");

  -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v9, "nps_setNoiseCancellationEnabledWithOneUnit:forDeviceAddress:", v7, v8);
  else
    objc_msgSend(v9, "setNoiseCancellationEnabledWithOneUnit:forDeviceAddress:", v7, v8);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v15;
  int v16;
  UISlider *v17;
  UISlider *toneVolumeSlider;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AccessibilityAirPodSettingsController;
  v6 = a4;
  -[AccessibilityAirPodSettingsController tableView:cellForRowAtIndexPath:](&v19, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityAirPodSettingsController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v19.receiver, v19.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D80868];
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D80868]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("NoiseControl")))
  {

LABEL_4:
    objc_msgSend(v7, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 0);

    goto LABEL_5;
  }
  objc_msgSend(v8, "propertyForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PERSONAL_AUDIO_AIRPODS_BUTTON"));

  if (v12)
    goto LABEL_4;
  objc_msgSend(v8, "propertyForKey:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("TONE_VOLUME"));

  if (v16)
  {
    objc_msgSend(v7, "setController:", self);
    objc_msgSend(v7, "slider");
    v17 = (UISlider *)objc_claimAutoreleasedReturnValue();
    toneVolumeSlider = self->_toneVolumeSlider;
    self->_toneVolumeSlider = v17;

    objc_msgSend(v7, "layoutSubviews");
  }
LABEL_5:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  double v38;
  _BOOL4 v39;
  double v40;
  _BOOL4 v41;
  double v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)AccessibilityAirPodSettingsController;
  v6 = a4;
  -[AXUISettingsSetupCapableListController tableView:didSelectRowAtIndexPath:](&v43, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = objc_msgSend(v6, "section", v43.receiver, v43.super_class);

  -[AccessibilityAirPodSettingsController specifierAtIndex:](self, "specifierAtIndex:", -[AccessibilityAirPodSettingsController indexOfGroup:](self, "indexOfGroup:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D80868];
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D80868]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("TapGroup"));

  if (v11)
  {
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D808E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "propertyForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tapSpeedForDeviceAddress:", v15);
    v17 = v16;

    v18 = 0.25;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TapDefault")) & 1) == 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TapSlow")) & 1) != 0)
      {
        v18 = 0.45;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("TapSlowest")))
      {
        v18 = 0.65;
      }
      else
      {
        v18 = v17;
      }
    }
    v35 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v38 = v18;
    if (v35)
      objc_msgSend(v36, "nps_setTapSpeed:forDeviceAddress:", v37, v38);
    else
      objc_msgSend(v36, "setTapSpeed:forDeviceAddress:", v37, v38);
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(v8, "propertyForKey:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("HoldGroup"));

  if (v20)
  {
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D808E0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "propertyForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "holdDurationForDeviceAddress:", v23);
    v25 = v24;

    v26 = 0.5;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HoldDefault")) & 1) == 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HoldFast")) & 1) != 0)
      {
        v26 = 0.4;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("HoldFastest")))
      {
        v26 = 0.35;
      }
      else
      {
        v26 = v25;
      }
    }
    v39 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v40 = v26;
    if (v39)
      objc_msgSend(v36, "nps_setHoldDuration:forDeviceAddress:", v37, v40);
    else
      objc_msgSend(v36, "setHoldDuration:forDeviceAddress:", v37, v40);
    goto LABEL_31;
  }
  objc_msgSend(v8, "propertyForKey:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("VOLUME_SWIPE_GROUP"));

  if (v28)
  {
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0D808E0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "propertyForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "volumeSwipeDurationForDeviceAddress:", v31);
    v33 = v32;

    v34 = 0.5;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VOLUME_SWIPE_DEFAULT")) & 1) == 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VOLUME_SWIPE_LONG")) & 1) != 0)
      {
        v34 = 0.4;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("VOLUME_SWIPE_LONGEST")))
      {
        v34 = 0.35;
      }
      else
      {
        v34 = v33;
      }
    }
    v41 = -[AccessibilityAirPodSettingsController isInWatchSettings](self, "isInWatchSettings");
    objc_msgSend(MEMORY[0x1E0CF4E58], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AccessibilityAirPodSettingsController _btDeviceAddress](self, "_btDeviceAddress");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v42 = v34;
    if (v41)
      objc_msgSend(v36, "nps_setVolumeSwipeDuration:forDeviceAddress:", v37, v42);
    else
      objc_msgSend(v36, "setVolumeSwipeDuration:forDeviceAddress:", v37, v42);
    goto LABEL_31;
  }
LABEL_32:

}

- (BluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_toneVolumeSlider, 0);
  objc_storeStrong((id *)&self->_btDevice, 0);
  objc_storeStrong((id *)&self->_holdGroup, 0);
  objc_storeStrong((id *)&self->_doubleTapGroup, 0);
}

@end

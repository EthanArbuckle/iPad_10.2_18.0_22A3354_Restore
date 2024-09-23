@implementation ELSWhitelist

+ (id)whitelist
{
  if (whitelist_onceToken != -1)
    dispatch_once(&whitelist_onceToken, &__block_literal_global_5);
  return (id)whitelist_whitelist;
}

void __25__ELSWhitelist_whitelist__block_invoke()
{
  ELSWhitelistEntry *v0;
  void *v1;
  ELSWhitelistEntry *v2;
  void *v3;
  ELSWhitelistEntry *v4;
  void *v5;
  ELSWhitelistEntry *v6;
  void *v7;
  ELSWhitelistEntry *v8;
  void *v9;
  ELSWhitelistEntry *v10;
  void *v11;
  ELSWhitelistEntry *v12;
  void *v13;
  ELSWhitelistEntry *v14;
  void *v15;
  ELSWhitelistEntry *v16;
  void *v17;
  ELSWhitelistEntry *v18;
  void *v19;
  ELSWhitelistEntry *v20;
  void *v21;
  ELSWhitelistEntry *v22;
  void *v23;
  ELSWhitelistEntry *v24;
  void *v25;
  ELSWhitelistEntry *v26;
  void *v27;
  ELSWhitelistEntry *v28;
  void *v29;
  ELSWhitelistEntry *v30;
  void *v31;
  ELSWhitelistEntry *v32;
  void *v33;
  ELSWhitelistEntry *v34;
  void *v35;
  ELSWhitelistEntry *v36;
  void *v37;
  ELSWhitelistEntry *v38;
  void *v39;
  ELSWhitelistEntry *v40;
  void *v41;
  ELSWhitelistEntry *v42;
  void *v43;
  ELSWhitelistEntry *v44;
  void *v45;
  ELSWhitelistEntry *v46;
  void *v47;
  ELSWhitelistEntry *v48;
  void *v49;
  ELSWhitelistEntry *v50;
  void *v51;
  ELSWhitelistEntry *v52;
  ELSWhitelistEntry *v53;
  void *v54;
  ELSWhitelistEntry *v55;
  void *v56;
  ELSWhitelistEntry *v57;
  void *v58;
  ELSWhitelistEntry *v59;
  void *v60;
  ELSWhitelistEntry *v61;
  ELSWhitelistEntry *v62;
  void *v63;
  ELSWhitelistEntry *v64;
  ELSWhitelistEntry *v65;
  void *v66;
  ELSWhitelistEntry *v67;
  uint64_t v68;
  void *v69;
  ELSWhitelistEntry *v70;
  ELSWhitelistEntry *v71;
  ELSWhitelistEntry *v72;
  ELSWhitelistEntry *v73;
  ELSWhitelistEntry *v74;
  ELSWhitelistEntry *v75;
  ELSWhitelistEntry *v76;
  ELSWhitelistEntry *v77;
  ELSWhitelistEntry *v78;
  ELSWhitelistEntry *v79;
  ELSWhitelistEntry *v80;
  ELSWhitelistEntry *v81;
  ELSWhitelistEntry *v82;
  ELSWhitelistEntry *v83;
  ELSWhitelistEntry *v84;
  ELSWhitelistEntry *v85;
  ELSWhitelistEntry *v86;
  ELSWhitelistEntry *v87;
  ELSWhitelistEntry *v88;
  ELSWhitelistEntry *v89;
  ELSWhitelistEntry *v90;
  ELSWhitelistEntry *v91;
  ELSWhitelistEntry *v92;
  ELSWhitelistEntry *v93;
  ELSWhitelistEntry *v94;
  ELSWhitelistEntry *v95;
  ELSWhitelistEntry *v96;
  ELSWhitelistEntry *v97;
  _QWORD v98[32];
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  const __CFString *v123;
  _QWORD v124[2];
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  _QWORD v130[8];

  v130[6] = *MEMORY[0x24BDAC8D0];
  v0 = [ELSWhitelistEntry alloc];
  v130[0] = CFSTR("macos");
  v130[1] = CFSTR("ios");
  v130[2] = CFSTR("watchos");
  v130[3] = CFSTR("visionos");
  v130[4] = CFSTR("tvos");
  v130[5] = CFSTR("homepod");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v130, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v0, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"), CFSTR("sysdiagnose"), CFSTR("ENHANCED_LOGGING_SYSDIAGNOSE"), 0, 0, 0, v1);

  v2 = [ELSWhitelistEntry alloc];
  v129 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v129, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v2, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"), CFSTR("coSysdiagnose"), CFSTR("ENHANCED_LOGGING_COSYSDIAGNOSE"), 0, 0, 0, v3);

  v4 = [ELSWhitelistEntry alloc];
  v128 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v128, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v4, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HangTracer.PerformanceLoggingDiagnosticExtension"), CFSTR("performance"), CFSTR("ENHANCED_LOGGING_PERFORMANCE"), 0, 1, 1, v5);

  v6 = [ELSWhitelistEntry alloc];
  v127 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v127, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v6, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.PowerlogCore.DEPowerlogEPL"), CFSTR("power"), CFSTR("ENHANCED_LOGGING_POWER"), 1, 0, 0, v7);

  v8 = [ELSWhitelistEntry alloc];
  v126 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v8, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.DiagnosticExtensions.Cellular"), CFSTR("cellular"), CFSTR("ENHANCED_LOGGING_CELLULAR"), 0, 1, 1, v9);

  v10 = [ELSWhitelistEntry alloc];
  v125 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v125, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v10, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.Diagnostics.diagnosticextension"), CFSTR("diagnostics"), CFSTR("ENHANCED_LOGGING_DIAGNOSTICS"), 0, 0, 0, v11);

  v12 = [ELSWhitelistEntry alloc];
  v124[0] = CFSTR("ios");
  v124[1] = CFSTR("visionos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v12, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.CFNetwork.DiagnosticExtension"), CFSTR("cfnetwork"), CFSTR("ENHANCED_LOGGING_CFNETWORK"), 0, 0, 0, v13);

  v14 = [ELSWhitelistEntry alloc];
  v123 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v14, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.DiagnosticExtensions.CoreLocation"), CFSTR("coreMotionAndLocation"), CFSTR("ENHANCED_LOGGING_LOCATION_AND_MOTION"), 1, 1, 1, v15);

  v16 = [ELSWhitelistEntry alloc];
  v122[0] = CFSTR("ios");
  v122[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v16, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthLite.KaliDiagnosticExtension"), CFSTR("hid_kali"), CFSTR("ENHANCED_LOGGING_HID_KALI"), 0, 1, 1, v17);

  v18 = [ELSWhitelistEntry alloc];
  v121[0] = CFSTR("ios");
  v121[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v18, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthAlgorithms.CycleTrackingDiagnosticExtension"), CFSTR("hid_cycle_tracking"), CFSTR("ENHANCED_LOGGING_HID_CYCLE"), 0, 1, 1, v19);

  v20 = [ELSWhitelistEntry alloc];
  v120[0] = CFSTR("ios");
  v120[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v20, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.AppleElementsSupport.AppleElementsSleepDiagnostic"), CFSTR("hid-sleep-respiration_rate"), CFSTR("ENHANCED_LOGGING_HID_ACACIA"), 0, 1, 1, v21);

  v22 = [ELSWhitelistEntry alloc];
  v119[0] = CFSTR("ios");
  v119[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v22, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.AfibBurden.AfibBurdenDiagnosticExtension"), CFSTR("hid_beryllium"), CFSTR("ENHANCED_LOGGING_HID_BERYLLIUM"), 0, 1, 1, v23);

  v24 = [ELSWhitelistEntry alloc];
  v118[0] = CFSTR("ios");
  v118[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v24, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.AppleElementsSupport.AppleElementsDiagnostic"), CFSTR("optical"), CFSTR("ENHANCED_LOGGING_HID_OPTICAL"), 0, 1, 1, v25);

  v26 = [ELSWhitelistEntry alloc];
  v117[0] = CFSTR("ios");
  v117[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v26, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HeartRhythmAlgorithms.IRNDiagnosticExtension"), CFSTR("irn"), CFSTR("ENHANCED_LOGGING_HID_IRN"), 0, 1, 1, v27);

  v28 = [ELSWhitelistEntry alloc];
  v116[0] = CFSTR("ios");
  v116[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v28, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.DiagnosticExtensions.Cinnamon"), CFSTR("ecg"), CFSTR("ENHANCED_LOGGING_HID_ECG"), 0, 1, 1, v29);

  v30 = [ELSWhitelistEntry alloc];
  v115 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v30, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.DiagnosticExtensions.TypologyDiagnosticExtension"), CFSTR("typology"), CFSTR("ENHANCED_LOGGING_TYPOLOGY"), 0, 1, 1, v31);

  v32 = [ELSWhitelistEntry alloc];
  v114 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v32, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.AuthKit.AKDiagnosticExtension"), CFSTR("authkit"), CFSTR("ENHANCED_LOGGING_AUTHKIT"), 0, 1, 1, v33);

  v34 = [ELSWhitelistEntry alloc];
  v113 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v113, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v34, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.mobilemail.DiagnosticExtension"), CFSTR("mobilemail"), CFSTR("ENHANCED_LOGGING_MOBILEMAIL"), 0, 1, 1, v35);

  v36 = [ELSWhitelistEntry alloc];
  v112[0] = CFSTR("ios");
  v112[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v112, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v36, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.CoreGesture.CoreGestureDiagnosticExtension"), CFSTR("gediagnose"), CFSTR("ENHANCED_LOGGING_GEDIAGNOSE"), 0, 1, 1, v37);

  v38 = [ELSWhitelistEntry alloc];
  v111[0] = CFSTR("ios");
  v111[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v38, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthKit.HealthCustomerDiagnosticExtension"), CFSTR("healthkit"), CFSTR("ENHANCED_LOGGING_HEALTHKIT"), 0, 1, 1, v39);

  v40 = [ELSWhitelistEntry alloc];
  v110[0] = CFSTR("ios");
  v110[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v40, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthKit.HealthResearchLogsDiagnosticExtension"), CFSTR("research_logs"), CFSTR("ENHANCED_LOGGING_HEALTHRESEARCH"), 0, 1, 1, v41);

  v42 = [ELSWhitelistEntry alloc];
  v109[0] = CFSTR("ios");
  v109[1] = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v42, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthKit.HealthRegulatoryCustomerDiagnosticExtension"), CFSTR("healthregulatory"), CFSTR("ENHANCED_LOGGING_HEALTHREGULATORY"), 0, 1, 1, v43);

  v44 = [ELSWhitelistEntry alloc];
  v108[0] = CFSTR("ios");
  v108[1] = CFSTR("macos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v44, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.CloudDocsDaemon.diagnostic"), CFSTR("iclouddriveextradebug"), CFSTR("ENHANCED_LOGGING_ICLOUDDRIVE"), 0, 1, 1, v45);

  v46 = [ELSWhitelistEntry alloc];
  v107 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v107, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v46, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.PassKit.applepay.diagnosticextension"), CFSTR("wallet"), CFSTR("ENHANCED_LOGGING_WALLET"), 0, 1, 1, v47);

  v48 = [ELSWhitelistEntry alloc];
  v106 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v106, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v48, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.BreathingAlgorithms.BDADiagnosticExtension"), CFSTR("hid_nebula_phone"), CFSTR("ENHANCED_LOGGING_NEBULA_PHONE"), 0, 1, 1, v49);

  v50 = [ELSWhitelistEntry alloc];
  v105 = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v105, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v50, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthLite.BreathingDisturbanceDiagnosticExtension"), CFSTR("hid_nebula_watch"), CFSTR("ENHANCED_LOGGING_NEBULA_WATCH"), 0, 1, 1, v51);

  v53 = [ELSWhitelistEntry alloc];
  v104 = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v104, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v53, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthLite.SleepAlgorithmsDiagnosticExtension"), CFSTR("hid_sleep_algorithms"), CFSTR("ENHANCED_LOGGING_SLEEP_ALGORITHMS"), 0, 1, 1, v54);

  v55 = [ELSWhitelistEntry alloc];
  v103 = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v55, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthLite.AccelArchiveDiagnosticExtension"), CFSTR("hid_accel_archive"), CFSTR("ENHANCED_LOGGING_ACCEL_ARCHIVE"), 0, 1, 1, v56);

  v57 = [ELSWhitelistEntry alloc];
  v102 = CFSTR("watchos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v102, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v57, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.HealthLite.WristDetectStateArchiveDE"), CFSTR("hid_wrist_detect_state_archive"), CFSTR("ENHANCED_LOGGING_WRIST_DETECT_STATE_ARCHIVE"), 0, 1, 1, v58);

  v59 = [ELSWhitelistEntry alloc];
  v101 = CFSTR("ios");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v59, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.exchangesync.framework.SyncDiagnosticsExtension"), CFSTR("eas_de"), CFSTR("ENHANCED_LOGGING_EXCHANGE_SYNC"), 0, 1, 1, v60);

  v62 = [ELSWhitelistEntry alloc];
  v100 = CFSTR("visionos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v62, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.Mind.MindfulnessDiagnosticExtension"), CFSTR("mindfulness"), CFSTR("ENHANCED_LOGGING_MINDFULNESS"), 0, 1, 1, v63);

  v65 = [ELSWhitelistEntry alloc];
  v99 = CFSTR("visionos");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[ELSWhitelistEntry initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:](v65, "initWithBundleIdentifier:parameterName:baseLocalizationKey:needsWAPIKeys:requiresFollowup:retry:platforms:", CFSTR("com.apple.RespirationTracking.DiagnosticExtension"), CFSTR("respiration_tracking"), CFSTR("ENHANCED_LOGGING_RESPIRATION_TRACKING"), 0, 1, 1, v66);

  v98[0] = v94;
  v98[1] = v97;
  v98[2] = v96;
  v98[3] = v95;
  v98[4] = v90;
  v98[5] = v93;
  v98[6] = v92;
  v98[7] = v91;
  v98[8] = v88;
  v98[9] = v89;
  v98[10] = v83;
  v98[11] = v87;
  v98[12] = v86;
  v98[13] = v85;
  v98[14] = v84;
  v98[15] = v82;
  v98[16] = v81;
  v98[17] = v80;
  v98[18] = v76;
  v98[19] = v79;
  v98[20] = v78;
  v98[21] = v77;
  v98[22] = v75;
  v98[23] = v74;
  v98[24] = v73;
  v98[25] = v52;
  v98[26] = v72;
  v98[27] = v71;
  v98[28] = v70;
  v98[29] = v61;
  v98[30] = v64;
  v98[31] = v67;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 32);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)whitelist_whitelist;
  whitelist_whitelist = v68;

}

+ (id)findEntryForParameterName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "whitelist", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "parameterName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)findEntryForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "whitelist", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)findEntryForDEDIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "whitelist", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "containsString:", v10);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end

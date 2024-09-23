uint64_t DeviceIdentityIsSupported()
{
  if (is_virtual_machine())
    return libavp_guest_has_host_key(0);
  else
    return 1;
}

BOOL is_virtual_machine()
{
  size_t v2;
  int v3;

  v3 = 0;
  v2 = 4;
  return !sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0) && v3 == 1;
}

uint64_t copy_unsupported_virtual_machine_oids()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("1.2.840.113635.100.10.1"), 0);
}

uint64_t copy_supported_eda_oids()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("1.2.840.113635.100.8.9.1"), CFSTR("1.2.840.113635.100.8.9.2"), CFSTR("1.2.840.113635.100.8.10.1"), CFSTR("1.2.840.113635.100.8.10.2"), CFSTR("1.2.840.113635.100.8.10.3"), CFSTR("1.2.840.113635.100.8.11.1"), CFSTR("1.2.840.113635.100.8.13.1"), CFSTR("1.2.840.113635.100.8.13.2"), CFSTR("1.2.840.113635.100.8.13.3"), CFSTR("1.2.840.113635.100.8.13.4"), CFSTR("1.2.840.113635.100.8.9.3"), CFSTR("1.2.840.113635.100.8.9.4"), 0);
}

id copy_supported_baa_oids()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("1.2.840.113635.100.10.1"), CFSTR("1.2.840.113635.100.10.2"), CFSTR("1.2.840.113635.100.8.1"), CFSTR("1.2.840.113635.100.8.2"), CFSTR("1.2.840.113635.100.8.3"), CFSTR("1.2.840.113635.100.8.4"), CFSTR("1.2.840.113635.100.8.5"), CFSTR("1.2.840.113635.100.8.6"), CFSTR("1.2.840.113635.100.8.7"), CFSTR("1.2.840.113635.100.8.12"), CFSTR("1.2.840.113635.100.6.71.1"), CFSTR("1.2.840.113635.100.6.71.2"), CFSTR("1.2.840.113635.100.6.71.3"), CFSTR("1.2.840.113635.100.8.9.4"), CFSTR("1.2.840.113635.100.8.10.4"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (is_virtual_machine())
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("1.2.840.113635.100.10.1"), 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "minusSet:", v1);

  }
  return v0;
}

CFTypeRef createReferenceKeyBlob(const void *a1, char a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CFTypeRef v28;
  SecKeyRef v29;
  CFErrorRef v30;
  __CFString *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  SecKeyRef v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  CFErrorRef error;

  v7 = a3;
  v8 = (id)*MEMORY[0x1E0CD6A50];
  error = 0;
  if (v7
    && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("KeySizeInBits")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        isNSNumber(v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("KeySizeInBits"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToNumber:", &unk_1E98CE6C8) & 1) == 0
      && (objc_msgSend(v11, "isEqualToNumber:", &unk_1E98CE6E0) & 1) == 0)
    {
      createMobileActivationError((uint64_t)"createReferenceKeyBlob", 73, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): unsupported size (%@)"), v12, v13, (uint64_t)CFSTR("KeySizeInBits"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
LABEL_19:
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v21 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v11 = &unk_1E98CE6C8;
  }
  +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v16, "copyAnswer:", CFSTR("HasPKA"));

  isNSNumber(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", 84, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve PKA state."), v18, v19, v40);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v15, "BOOLValue") && (a2 & 1) == 0)
  {
    v20 = (id)*MEMORY[0x1E0CD6A58];

    v8 = v20;
  }
  if (a1)
  {
    v21 = CFRetain(a1);
    if (v21)
      goto LABEL_22;
  }
  if ((isRunningInRecovery() & 1) == 0 && !isRunningInDiagnosticsMode())
  {
    v21 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68B0], 0x40000000uLL, &error);
    if (v21)
      goto LABEL_22;
    v30 = error;
    v40 = *MEMORY[0x1E0CD68D0];
    v31 = CFSTR("Failed to create access control (%@).");
    v32 = 115;
LABEL_28:
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", v32, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v30, v31, v22, v23, v40);
    goto LABEL_29;
  }
  v21 = (const void *)SecAccessControlCreate();
  if (!v21)
  {
    v30 = error;
    v31 = CFSTR("Failed to create access control.");
    v32 = 104;
    goto LABEL_28;
  }
  v24 = *MEMORY[0x1E0CD68D8];
  if ((SecAccessControlSetProtection() & 1) == 0)
  {
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", 109, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to set ACL protection to %@."), v25, v26, v24);
LABEL_29:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    goto LABEL_30;
  }
LABEL_22:
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = v33;
  if (!v33)
  {
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", 123, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to alloc dictionary."), v34, v35, v40);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    v28 = 0;
    v29 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v33, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD69D8]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6BA0], *MEMORY[0x1E0CD6B98]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6A38]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CD6890]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6A20]);
  v36 = SecKeyCreateRandomKey((CFDictionaryRef)v27, &error);
  v29 = v36;
  if (v36)
  {
    v28 = CFRetain(v36);
    v14 = 0;
  }
  else
  {
    createMobileActivationError((uint64_t)"createReferenceKeyBlob", 141, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create ref key."), v37, v38, v40);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
  }
LABEL_31:
  if (a4 && !v28)
    *a4 = objc_retainAutorelease(v14);
  if (v29)
    CFRelease(v29);
  if (v21)
    CFRelease(v21);
  if (error)
    CFRelease(error);

  return v28;
}

__SecKey *create_baa_info(const __CFData *a1, void *a2, _QWORD *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  const __CFData *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  const __CFData *v34;
  id v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFData *v43;
  __SecKey *v44;
  int v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  __SecKey *v50;
  uint64_t v51;
  uint64_t v52;
  CFDataRef v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const void *v58;
  uint64_t v59;
  uint64_t v60;
  CFTypeRef v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  __SecKey *v135;
  uint64_t v136;
  uint64_t v137;
  CFDataRef v138;
  uint64_t v139;
  uint64_t v140;
  CFDataRef v141;
  id *v142;
  id *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  unint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  const __CFData *v160;
  const __CFData *v161;
  const void *v162;
  __SecKey *v163;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  unint64_t v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  CFErrorRef v174;
  __CFString *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  __SecKey *v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  id v218;
  uint64_t v219;
  uint64_t v220;
  const __CFString *v221;
  void *v222;
  uint64_t v223;
  id v224;
  void *v225;
  void *v226;
  int v227;
  void *v228;
  void *v229;
  uint64_t v230;
  id v231;
  NSObject *v232;
  id v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  NSObject *v238;
  id v239;
  void *v240;
  int v241;
  uint64_t v242;
  id v243;
  NSObject *v244;
  id v245;
  const __CFData *v246;
  uint64_t v247;
  uint64_t v248;
  __SecKey *v249;
  CFDataRef v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  const __CFData *v261;
  __SecKey *v262;
  id v263;
  CFTypeRef cf;
  CFTypeRef v265;
  const void *v266;
  __SecKey *v267;
  void *v268;
  __SecKey *v269;
  int v270;
  CFDataRef v271;
  int v272;
  int v273;
  SecKeyRef key;
  SecKeyRef keya;
  __SecKey *keyb;
  void *v277;
  void *v278;
  void *v279;
  int v280;
  void *v281;
  void *v282;
  void *v283;
  CFDataRef v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  const __CFData *v298;
  uint64_t v299;
  const __CFData *v300;
  void *v301;
  void *v302;
  void *v303;
  int v305;
  id v306;
  void *v307;
  id v308;
  id v309;
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  const __CFData *v315;
  id v316;
  const __CFData *v317;
  id v318;
  id v319;
  id v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  CFErrorRef error;
  _QWORD v326[12];
  _QWORD v327[12];
  _BYTE v328[128];
  _QWORD v329[6];

  v329[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  error = 0;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v329[0] = CFSTR("1.2.840.113635.100.8.4");
  v329[1] = CFSTR("1.2.840.113635.100.8.5");
  v329[2] = CFSTR("1.2.840.113635.100.8.7");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v329, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = v4;
  if (!v4)
  {
    v23 = 0;
    v292 = 0;
    v293 = 0;
    v24 = 0;
    v25 = 0;
    v290 = 0;
    v291 = 0;
    v26 = 0;
    v283 = 0;
    v288 = 0;
    v289 = 0;
    v27 = 0;
    v28 = 0;
    v280 = 0;
    v305 = 0;
    v29 = 1;
    v286 = &unk_1E98CE710;
    v301 = 0;
    v302 = &unk_1E98CE710;
    v287 = &unk_1E98CE6F8;
    goto LABEL_24;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isNSArray(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  key = a1;
  if (v9)
  {
    v303 = v7;
    v323 = 0u;
    v324 = 0u;
    v321 = 0u;
    v322 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v321, v328, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v322;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v322 != v13)
            objc_enumerationMutation(v10);
          isNSString(*(void **)(*((_QWORD *)&v321 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            createMobileActivationError((uint64_t)"create_baa_info", 244, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid options (%@): %@"), v37, v38, (uint64_t)CFSTR("OIDSToInclude"));
            v306 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_29;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v321, v328, 16);
        if (v12)
          continue;
        break;
      }
    }

    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v16, "initWithArray:", v17);

    if (is_virtual_machine())
    {
      copy_unsupported_virtual_machine_oids();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectsInArray:", v19);

    }
  }
  if ((objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.1")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.7")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.10.1")) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.10.2")) & 1) != 0
    || objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.10.3")))
  {
    v280 = objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.1"));
    v305 = 1;
  }
  else
  {
    v280 = 0;
    v305 = 0;
  }
  v20 = objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.7"));
  v303 = v7;
  if ((objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.2")) & 1) != 0
    || objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.8.11.1")))
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("nonce"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      v64 = v20;
      objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("AppSpecificData"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      isNSData(v65);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        createMobileActivationError((uint64_t)"create_baa_info", 281, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing one of the required options: %@ / %@"), v66, v67, (uint64_t)CFSTR("nonce"));
        v306 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
        v281 = 0;
        v282 = 0;
        v36 = 0;
        v288 = 0;
        v289 = 0;
        v300 = 0;
        v301 = 0;
        v291 = 0;
        v292 = 0;
        v283 = 0;
        v284 = 0;
        v278 = 0;
        v279 = 0;
        v290 = 0;
        v296 = 0;
        v297 = 0;
        v285 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v26 = 0;
        a1 = 0;
        v43 = 0;
        v293 = 0;
        v294 = 0;
        v298 = 0;
        v271 = 0;
        keya = 0;
        v44 = 0;
        goto LABEL_116;
      }
      v20 = v64;
    }
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("nonce"));
    v68 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("AppSpecificData"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    v297 = (void *)v68;
    if (v69)
    {
      isNSData(v69);
      v43 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        v296 = v70;
        createMobileActivationError((uint64_t)"create_baa_info", 290, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@)."), v71, v72, (uint64_t)CFSTR("AppSpecificData"));
        v306 = (id)objc_claimAutoreleasedReturnValue();
        v281 = 0;
        v282 = 0;
        v36 = 0;
        v288 = 0;
        v289 = 0;
        v300 = 0;
        v291 = 0;
        v292 = 0;
        v283 = 0;
        v284 = 0;
        v279 = 0;
        v290 = 0;
        v285 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v26 = 0;
        a1 = 0;
LABEL_115:
        v293 = 0;
        v294 = 0;
        v301 = 0;
        v298 = 0;
        v271 = 0;
        keya = 0;
        v278 = 0;
        v44 = 0;
        v15 = 0;
LABEL_116:
        v277 = 0;
        v302 = &unk_1E98CE710;
        v286 = &unk_1E98CE710;
        v287 = &unk_1E98CE6F8;
        goto LABEL_117;
      }
      if ((unint64_t)objc_msgSend(v70, "length") >= 0x41)
      {
        v296 = v70;
        objc_msgSend(v70, "length");
        createMobileActivationError((uint64_t)"create_baa_info", 295, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): unexpected size (%lu)"), v73, v74, (uint64_t)CFSTR("AppSpecificData"));
LABEL_109:
        v306 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:
        v281 = 0;
        v282 = 0;
        v36 = 0;
        v288 = 0;
        v289 = 0;
        v300 = 0;
        v291 = 0;
        v292 = 0;
        goto LABEL_111;
      }
    }
  }
  else
  {
    v297 = 0;
    v70 = 0;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("CertType"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v296 = v70;
  if (v80)
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("CertType"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v81, "isEqualToNumber:", v82) & 1) != 0)
    {
LABEL_60:

      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "isEqualToNumber:", v83))
    {

      goto LABEL_60;
    }
    v272 = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v81, "isEqualToNumber:", v96);

    if ((v97 & 1) == 0)
    {
      v295 = v81;
      createMobileActivationError((uint64_t)"create_baa_info", 305, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), v98, v99, (uint64_t)CFSTR("CertType"));
      goto LABEL_109;
    }
    v20 = v272;
  }
  else
  {
    v81 = v295;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v81, "isEqualToNumber:", v84);

  v295 = v81;
  if (v85)
  {
    if ((device_supports_mfi_certificates() & 1) == 0)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 312, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Certificate type not supported on this platform: %@"), v86, v87, (uint64_t)v81);
      goto LABEL_109;
    }
    if ((objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.1")) & 1) == 0)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 317, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required OID for certificate type (%@): %@"), v88, v89, (uint64_t)v81);
      goto LABEL_109;
    }
  }
  else if ((objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.1")) & 1) != 0
         || (objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.2")) & 1) != 0
         || objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.3")))
  {
    createMobileActivationError((uint64_t)"create_baa_info", 324, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid OID(s) for requested certificate type: %@"), v90, v91, (uint64_t)v81);
    goto LABEL_109;
  }
  if (objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.1"))
    && (objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiProperties")),
        v92 = (void *)objc_claimAutoreleasedReturnValue(),
        isNSData(v92),
        v93 = (void *)objc_claimAutoreleasedReturnValue(),
        v93,
        v92,
        v93))
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiProperties"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "length");

    if (v95 != 32)
    {
      objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiProperties"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "length");
      createMobileActivationError((uint64_t)"create_baa_info", 332, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): unexpected size (%lu)"), v178, v179, (uint64_t)CFSTR("MFiProperties"));
      v306 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_110;
    }
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiProperties"));
    v292 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v292 = 0;
  }
  if (objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.2")))
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiPPUID"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v146);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 342, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required option: %@"), v147, v148, (uint64_t)CFSTR("MFiPPUID"));
      v306 = (id)objc_claimAutoreleasedReturnValue();
      v281 = 0;
      v282 = 0;
      v36 = 0;
      v288 = 0;
      v289 = 0;
      v300 = 0;
      v291 = 0;
      v283 = 0;
      v279 = 0;
LABEL_157:
      v290 = 0;
      v285 = 0;
      v39 = 0;
      goto LABEL_113;
    }
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiPPUID"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = objc_msgSend(v149, "length");

    if (v150 >= 0x25)
    {
      objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiPPUID"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "length");
      createMobileActivationError((uint64_t)"create_baa_info", 347, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): unexpected size (%lu)"), v152, v153, (uint64_t)CFSTR("MFiPPUID"));
      v306 = (id)objc_claimAutoreleasedReturnValue();

      v281 = 0;
      v282 = 0;
      v36 = 0;
      v288 = 0;
      v289 = 0;
      v300 = 0;
      v291 = 0;
LABEL_111:
      v283 = 0;
      v279 = 0;
LABEL_112:
      v290 = 0;
      v285 = 0;
      v39 = 0;
      v40 = 0;
LABEL_113:
      v41 = 0;
      v42 = 0;
      v26 = 0;
LABEL_114:
      v284 = 0;
      a1 = 0;
      v43 = 0;
      goto LABEL_115;
    }
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiPPUID"));
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "stringByPaddingToLength:withString:startingAtIndex:", 36, &stru_1E98C9500, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      createMobileActivationError((uint64_t)"create_baa_info", 356, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Failed to pad string."), v182, v183, v255);
      v306 = (id)objc_claimAutoreleasedReturnValue();
      v281 = 0;
      v282 = 0;
      v36 = 0;
      v288 = 0;
      v289 = 0;
      v300 = 0;
      v290 = 0;
      v291 = 0;
      v283 = 0;
      v279 = 0;
      v285 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      goto LABEL_114;
    }
    objc_msgSend(v26, "dataUsingEncoding:", 4);
    v165 = objc_claimAutoreleasedReturnValue();
    if (!v165)
    {
      v279 = v26;
      createMobileActivationError((uint64_t)"create_baa_info", 362, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Failed to convert string to data."), v184, v185, v255);
      v306 = (id)objc_claimAutoreleasedReturnValue();
      v281 = 0;
      v282 = 0;
      v36 = 0;
      v288 = 0;
      v289 = 0;
      v300 = 0;
      v291 = 0;
      v283 = 0;
      goto LABEL_112;
    }
  }
  else
  {
    v26 = 0;
    v165 = 0;
  }
  v283 = (void *)v165;
  if (!objc_msgSend(v7, "containsObject:", CFSTR("1.2.840.113635.100.6.71.3")))
  {
    v291 = 0;
    goto LABEL_160;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiData"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v166);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    v279 = v26;
    createMobileActivationError((uint64_t)"create_baa_info", 369, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required option: %@"), v167, v168, (uint64_t)CFSTR("MFiData"));
    v306 = (id)objc_claimAutoreleasedReturnValue();
    v281 = 0;
    v282 = 0;
    v36 = 0;
    v288 = 0;
    v289 = 0;
    v300 = 0;
    v291 = 0;
    goto LABEL_157;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiData"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = objc_msgSend(v169, "length");

  if (v170 >= 0x4B0)
  {
    v279 = v26;
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiData"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "length");
    createMobileActivationError((uint64_t)"create_baa_info", 374, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): unexpected size (%lu)"), v172, v173, (uint64_t)CFSTR("MFiData"));
    v306 = (id)objc_claimAutoreleasedReturnValue();

    v281 = 0;
    v282 = 0;
    v36 = 0;
    v288 = 0;
    v289 = 0;
    v300 = 0;
    v291 = 0;
    goto LABEL_112;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("MFiData"));
  v291 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_160:
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("UseRKSigningInterface"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  v273 = v20;
  if (v187)
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("UseRKSigningInterface"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v188, "BOOLValue");

  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("UseSoftwareGeneratedKey"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v189);
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  if (v190)
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("UseSoftwareGeneratedKey"));
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v191, "BOOLValue");

  }
  else
  {
    v29 = 1;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("Validity"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  if (v193)
  {
    v194 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("Validity"));
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "numberWithUnsignedInteger:", objc_msgSend(v195, "unsignedIntegerValue"));
    v287 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v287 = &unk_1E98CE6F8;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("CACert"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();

  if (v197)
  {
    v198 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("CACert"));
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "numberWithUnsignedInteger:", objc_msgSend(v199, "unsignedIntegerValue"));
    v286 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v286 = &unk_1E98CE710;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v200);
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  if (v201)
  {
    v202 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "numberWithUnsignedInteger:", objc_msgSend(v203, "unsignedIntegerValue"));
    v302 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v302 = &unk_1E98CE710;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v204);
  v205 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v205)
  {
    v299 = 0;
    v301 = 0;
LABEL_180:
    v293 = 0;
    goto LABEL_181;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("ClientAttestationPublicKey"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v206);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    v279 = v26;
    createMobileActivationError((uint64_t)"create_baa_info", 411, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required option for %@."), v207, v208, (uint64_t)CFSTR("ClientAttestationPublicKey"));
    v306 = (id)objc_claimAutoreleasedReturnValue();
    v281 = 0;
    v282 = 0;
    v36 = 0;
    v288 = 0;
    v289 = 0;
    v300 = 0;
    v301 = 0;
    v290 = 0;
    v284 = 0;
    v285 = 0;
    v39 = 0;
    v40 = 0;
    v42 = 0;
    v26 = 0;
    a1 = 0;
    v43 = 0;
    v293 = 0;
    goto LABEL_85;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
  v299 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("ClientAttestationPublicKey"));
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("ClientDirectAttestationCertificate"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v303;
  if (!v210)
    goto LABEL_180;
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("ClientDirectAttestationCertificate"));
  v293 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_181:
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("AppID"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  if (v212)
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("AppID"));
    v290 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v290 = 0;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("LiveImage4Manifest"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v213);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  if (v214)
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("LiveImage4Manifest"));
    v289 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v289 = 0;
  }
  objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("RepairImage4Manifest"));
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v215);
  v216 = (void *)objc_claimAutoreleasedReturnValue();

  if (v216)
  {
    objc_msgSend(v307, "objectForKeyedSubscript:", CFSTR("RepairImage4Manifest"));
    v288 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v288 = 0;
  }
  v295 = v81;
  v25 = v296;
  v24 = v297;
  v23 = (const __CFData *)v299;
  v28 = v273;
  a1 = key;
LABEL_24:
  v270 = v28;
  v303 = v7;
  v296 = v25;
  v297 = v24;
  v279 = v26;
  if (is_virtual_machine())
  {
    v32 = v27;
    v33 = v29;
    v34 = a1;
    v320 = 0;
    vm_copy_host_certificate(0, &v320);
    a1 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v35 = v320;
    v300 = a1;
    if (!a1)
    {
      v298 = v23;
      createMobileActivationError((uint64_t)"create_baa_info", 440, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v35, CFSTR("Failed to copy VM host certificate."), v30, v31, v255);
      v306 = (id)objc_claimAutoreleasedReturnValue();

      v281 = 0;
      v282 = 0;
      v36 = 0;
      v300 = 0;
      goto LABEL_71;
    }
    a1 = v34;
    v29 = v33;
    v27 = v32;
    if (!a1)
    {
LABEL_27:
      v298 = v23;
      createMobileActivationError((uint64_t)"create_baa_info", 472, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v30, v31, v255);
      v306 = (id)objc_claimAutoreleasedReturnValue();

      v281 = 0;
      v282 = 0;
      v36 = 0;
LABEL_71:
      v284 = 0;
      v285 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v26 = 0;
LABEL_72:
      v43 = 0;
LABEL_73:
      v271 = 0;
      keya = 0;
      v277 = 0;
      v278 = 0;
      v294 = 0;
      v44 = 0;
      v15 = 0;
      goto LABEL_117;
    }
  }
  else
  {
    v300 = 0;
    v35 = 0;
    if (!a1)
      goto LABEL_27;
  }
  if (v23)
    v45 = 0;
  else
    v45 = v27;
  if (v45 != 1)
  {
    v265 = 0;
    v266 = 0;
    v267 = 0;
LABEL_52:
    v298 = v23;
    v316 = v35;
    v317 = 0;
    v75 = security_copy_system_key(0, &v317, &v316);
    v43 = v317;
    v76 = v316;

    if (v75)
    {
      cf = v75;
      keyb = a1;
      if ((objc_msgSend(v302, "BOOLValue") & 1) != 0)
      {
        a1 = 0;
        v44 = 0;
        goto LABEL_88;
      }
      v314 = v76;
      v315 = 0;
      v44 = security_copy_system_key(2, &v315, &v314);
      a1 = v315;
      v100 = v314;

      if (v44)
      {
        v76 = v100;
LABEL_88:
        v263 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (v263)
        {
          v261 = v43;
          v262 = v44;
          if ((objc_msgSend(v302, "BOOLValue") & 1) != 0)
            goto LABEL_91;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          copy_ucrt_path();
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "stringByAppendingPathComponent:", CFSTR("ucrt.pem"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v105, "fileExistsAtPath:", v107);

          if ((v108 & 1) != 0)
          {
LABEL_91:
            +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = (void *)objc_msgSend(v111, "copyAnswer:", CFSTR("UniqueChipID"));

            v260 = v112;
            isNSNumber(v112);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if (v75)
            {
              +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = (void *)objc_msgSend(v115, "copyAnswer:", CFSTR("ChipID"));

              v268 = v116;
              isNSNumber(v116);
              v75 = (void *)objc_claimAutoreleasedReturnValue();

              if (v75)
              {
                +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (void *)objc_msgSend(v119, "copyAnswer:", CFSTR("BoardId"));

                isNSNumber(v41);
                v75 = (void *)objc_claimAutoreleasedReturnValue();

                if (v75)
                {
                  v258 = v41;
                  +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  v123 = (void *)objc_msgSend(v122, "copyAnswer:", CFSTR("SecurityDomain"));

                  v259 = v123;
                  isNSNumber(v123);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v75)
                  {
                    +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    v127 = (void *)objc_msgSend(v126, "copyAnswer:", CFSTR("SerialNumber"));

                    v257 = v127;
                    isNSString(v127);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v75)
                    {
                      +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
                      v130 = (void *)objc_claimAutoreleasedReturnValue();
                      v131 = (void *)objc_msgSend(v130, "copyAnswer:", CFSTR("BuildVersion"));

                      v285 = v131;
                      isNSString(v131);
                      v132 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v132)
                      {
                        v135 = SecKeyCopyPublicKey(keyb);
                        v75 = v135;
                        if (v135)
                        {
                          v138 = SecKeyCopyExternalRepresentation(v135, &error);
                          v44 = v262;
                          if (!v138)
                          {
                            createMobileActivationError((uint64_t)"create_baa_info", 601, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode RK public key as data."), v139, v140, v255);
                            v306 = (id)objc_claimAutoreleasedReturnValue();

                            keya = 0;
                            v277 = 0;
                            v269 = 0;
                            v271 = 0;
                            v294 = 0;
                            v278 = 0;
                            v284 = 0;
                            v281 = 0;
                            v282 = 0;
                            v26 = v112;
                            v43 = v261;
                            v15 = v263;
LABEL_214:
                            v41 = v258;
                            v40 = v259;
                            v39 = v257;
                            goto LABEL_146;
                          }
                          v141 = v138;
                          if (v293)
                          {
                            v313 = v76;
                            v142 = &v313;
                            v143 = &v313;
                            v144 = (uint64_t)keyb;
                            v145 = 7;
                          }
                          else
                          {
                            if (objc_msgSend(v302, "BOOLValue"))
                              v145 = 0;
                            else
                              v145 = 2;
                            v312 = v76;
                            v142 = &v312;
                            v143 = &v312;
                            v144 = (uint64_t)keyb;
                          }
                          security_create_system_key_attestation(v144, v145, v297, v143);
                          v217 = objc_claimAutoreleasedReturnValue();
                          v218 = *v142;

                          v284 = v141;
                          if (v217)
                          {
                            v221 = CFSTR("RKCertification");
                            v278 = (void *)v217;
                            if (v298)
                            {
                              objc_msgSend(v263, "setObject:forKeyedSubscript:", v298, CFSTR("RKCertification"));
                              objc_msgSend(v263, "setObject:forKeyedSubscript:", v217, CFSTR("RKSigning"));
                              v221 = CFSTR("RKSigningPub");
                              v222 = v263;
                              v223 = (uint64_t)v141;
                            }
                            else
                            {
                              v222 = v263;
                              v223 = v217;
                            }
                            objc_msgSend(v222, "setObject:forKeyedSubscript:", v223, v221);
                            v224 = objc_alloc(MEMORY[0x1E0C99E08]);
                            v326[0] = CFSTR("UniqueChipID");
                            v326[1] = CFSTR("ChipID");
                            v26 = v112;
                            v327[0] = v112;
                            v327[1] = v116;
                            v326[2] = CFSTR("BoardId");
                            v326[3] = CFSTR("SecurityDomain");
                            v41 = v258;
                            v327[2] = v258;
                            v327[3] = v259;
                            v326[4] = CFSTR("SerialNumber");
                            v326[5] = CFSTR("OsBuildVersion");
                            v327[4] = v257;
                            v327[5] = v285;
                            v326[6] = CFSTR("scrtAttestation");
                            v326[7] = CFSTR("CertType");
                            v327[6] = v302;
                            v327[7] = v295;
                            v326[8] = CFSTR("Validity");
                            v326[9] = CFSTR("CACert");
                            v327[8] = v287;
                            v327[9] = v286;
                            v326[10] = CFSTR("OIDSToInclude");
                            v326[11] = CFSTR("SIKPub");
                            v327[10] = v303;
                            v43 = v261;
                            v327[11] = v261;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v327, v326, 12);
                            v225 = (void *)objc_claimAutoreleasedReturnValue();
                            v226 = (void *)objc_msgSend(v224, "initWithDictionary:", v225);

                            v227 = v270;
                            v294 = v226;
                            if (v298)
                            {
                              objc_msgSend(v226, "setObject:forKeyedSubscript:", v301, CFSTR("RKCertificationPub"));
                              objc_msgSend(v226, "setObject:forKeyedSubscript:", v284, CFSTR("RKSigningPub"));
                              v228 = v296;
                              v15 = v263;
                              if (v293)
                                objc_msgSend(v294, "setObject:forKeyedSubscript:", v293, CFSTR("DirectAttestationCertificate"));
                            }
                            else
                            {
                              objc_msgSend(v226, "setObject:forKeyedSubscript:", v284, CFSTR("RKCertificationPub"));
                              v228 = v296;
                              v15 = v263;
                            }
                            v40 = v259;
                            if (v300)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v300, CFSTR("VMHostIdentityCertificate"));
                            if (a1)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", a1, CFSTR("UIKPub"));
                            if (v228)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v228, CFSTR("AppSpecificData"));
                            copy_trusted_local_policy_hash();
                            v229 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v229)
                            {
                              v311 = v218;
                              copyPersonalizedFirmwareData(9, &v311);
                              v230 = objc_claimAutoreleasedReturnValue();
                              v231 = v311;

                              v282 = (void *)v230;
                              if (v230)
                              {
                                v227 = v270;
                              }
                              else
                              {
                                v232 = MEMORY[0x1E0C81028];
                                v233 = MEMORY[0x1E0C81028];
                                if (os_log_type_enabled(v232, OS_LOG_TYPE_FAULT))
                                  create_baa_info_cold_3();

                                v231 = 0;
                                v227 = v270;
                              }
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v282, CFSTR("LocalPolicy"));
                              v218 = v231;
                              v40 = v259;
                            }
                            else
                            {
                              v282 = 0;
                            }
                            if (v305)
                            {
                              v310 = v218;
                              copyPersonalizedFirmwareData(2, &v310);
                              v234 = objc_claimAutoreleasedReturnValue();
                              v235 = v310;

                              if (!v234)
                              {
                                if (v280)
                                {
                                  createMobileActivationError((uint64_t)"create_baa_info", 722, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v235, CFSTR("Failed to load boot manifest."), v236, v237, v255);
                                  v306 = (id)objc_claimAutoreleasedReturnValue();

                                  keya = 0;
                                  v277 = 0;
                                  v269 = 0;
                                  v271 = 0;
                                  goto LABEL_213;
                                }
                                v238 = MEMORY[0x1E0C81028];
                                v239 = MEMORY[0x1E0C81028];
                                if (os_log_type_enabled(v238, OS_LOG_TYPE_FAULT))
                                  create_baa_info_cold_2();

                                v235 = 0;
                                v26 = v260;
                                v43 = v261;
                                v15 = v263;
                                v234 = 0;
                              }
                              v277 = (void *)v234;
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v234, CFSTR("Image4Manifest"));
                              copy_sfr_manifest();
                              v240 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v240, CFSTR("FWImage4Manifest"));

                              v218 = v235;
                              v41 = v258;
                              v40 = v259;
                              v227 = v270;
                            }
                            else
                            {
                              v277 = 0;
                            }
                            if (v229)
                              v241 = v227;
                            else
                              v241 = 0;
                            if (v241 == 1)
                            {
                              v309 = v218;
                              copyPersonalizedFirmwareData(10, &v309);
                              v242 = objc_claimAutoreleasedReturnValue();
                              v243 = v309;

                              v281 = (void *)v242;
                              if (!v242)
                              {
                                v244 = MEMORY[0x1E0C81028];
                                v245 = MEMORY[0x1E0C81028];
                                if (os_log_type_enabled(v244, OS_LOG_TYPE_FAULT))
                                  create_baa_info_cold_1();

                                v243 = 0;
                                v26 = v260;
                                v43 = v261;
                                v15 = v263;
                                v41 = v258;
                                v40 = v259;
                              }
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v242, CFSTR("Cryptex1Image4Manifest"));
                              v218 = v243;
                            }
                            else
                            {
                              v281 = 0;
                            }
                            if (v290)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v290, CFSTR("AppID"));
                            if (v292)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v292, CFSTR("MFiProperties"));
                            if (v283)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v283, CFSTR("MFiPPUID"));
                            if (v291)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v291, CFSTR("MFiData"));
                            v39 = v257;
                            if (v289)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v289, CFSTR("LiveImage4Manifest"));
                            if (v288)
                              objc_msgSend(v294, "setObject:forKeyedSubscript:", v288, CFSTR("RepairImage4Manifest"));
                            v308 = 0;
                            objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v294, 100, 0, &v308);
                            v246 = (const __CFData *)objc_claimAutoreleasedReturnValue();
                            v306 = v308;

                            if (v246)
                            {
                              objc_msgSend(v15, "setObject:forKeyedSubscript:", v246, CFSTR("RKProperties"));
                              v249 = keyb;
                              keya = v246;
                              v250 = SecKeyCreateSignature(v249, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], v246, &error);
                              v44 = v262;
                              if (v250)
                              {
                                v271 = v250;
                                objc_msgSend(v15, "setObject:forKeyedSubscript:", v250, CFSTR("RKPropertiesSignature"));
                                v269 = v15;
                              }
                              else
                              {
                                createMobileActivationError((uint64_t)"create_baa_info", 830, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to sign data with ref key."), v251, v252, v255);
                                v254 = objc_claimAutoreleasedReturnValue();

                                v269 = 0;
                                v271 = 0;
                                v306 = (id)v254;
                              }
                            }
                            else
                            {
                              createMobileActivationError((uint64_t)"create_baa_info", 819, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v306, CFSTR("Could not convert dictionary to xml data."), v247, v248, v255);
                              v253 = objc_claimAutoreleasedReturnValue();

                              v269 = 0;
                              v271 = 0;
                              keya = 0;
                              v306 = (id)v253;
                              v44 = v262;
                            }
                            goto LABEL_146;
                          }
                          createMobileActivationError((uint64_t)"create_baa_info", 614, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v218, CFSTR("Failed to create reference key attestation (nonce: %@)."), v219, v220, (uint64_t)v297);
                          v306 = (id)objc_claimAutoreleasedReturnValue();

                          keya = 0;
                          v277 = 0;
                          v269 = 0;
                          v271 = 0;
                          v294 = 0;
                          v278 = 0;
                        }
                        else
                        {
                          createMobileActivationError((uint64_t)"create_baa_info", 595, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK public key."), v136, v137, v255);
                          v306 = (id)objc_claimAutoreleasedReturnValue();

                          keya = 0;
                          v277 = 0;
                          v269 = 0;
                          v271 = 0;
                          v294 = 0;
                          v278 = 0;
                          v284 = 0;
                        }
                      }
                      else
                      {
                        createMobileActivationError((uint64_t)"create_baa_info", 586, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v76, CFSTR("Failed to retrieve %@."), v133, v134, (uint64_t)CFSTR("BuildVersion"));
                        v306 = (id)objc_claimAutoreleasedReturnValue();

                        keya = 0;
                        v277 = 0;
                        v269 = 0;
                        v271 = 0;
                        v294 = 0;
                        v278 = 0;
                        v284 = 0;
                        v75 = 0;
                      }
                    }
                    else
                    {
                      createMobileActivationError((uint64_t)"create_baa_info", 580, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve %@."), v128, v129, (uint64_t)CFSTR("SerialNumber"));
                      v306 = (id)objc_claimAutoreleasedReturnValue();

                      keya = 0;
                      v277 = 0;
                      v269 = 0;
                      v271 = 0;
                      v294 = 0;
                      v278 = 0;
                      v284 = 0;
                      v285 = 0;
                    }
                    v282 = 0;
LABEL_213:
                    v281 = 0;
                    v26 = v260;
                    v43 = v261;
                    v44 = v262;
                    v15 = v263;
                    goto LABEL_214;
                  }
                  createMobileActivationError((uint64_t)"create_baa_info", 574, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve %@."), v124, v125, (uint64_t)CFSTR("SecurityDomain"));
                  v306 = (id)objc_claimAutoreleasedReturnValue();

                  keya = 0;
                  v277 = 0;
                  v269 = 0;
                  v271 = 0;
                  v294 = 0;
                  v278 = 0;
                  v284 = 0;
                  v285 = 0;
                  v39 = 0;
                  v281 = 0;
                  v282 = 0;
                  v26 = v112;
                  v43 = v261;
                  v44 = v262;
                  v15 = v263;
                  v41 = v258;
                  v40 = v259;
LABEL_146:
                  CFRelease(cf);
                  if (v44)
                    CFRelease(v44);
                  v44 = v269;
LABEL_149:
                  if (v265)
                    CFRelease(v265);
                  v180 = v267;
                  if (!v267)
                    goto LABEL_195;
                  goto LABEL_194;
                }
                createMobileActivationError((uint64_t)"create_baa_info", 568, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve %@."), v120, v121, (uint64_t)CFSTR("BoardId"));
                v306 = (id)objc_claimAutoreleasedReturnValue();

                keya = 0;
                v277 = 0;
                v269 = 0;
                v271 = 0;
                v294 = 0;
                v278 = 0;
                v284 = 0;
LABEL_145:
                v40 = 0;
                v39 = 0;
                v285 = 0;
                v281 = 0;
                v282 = 0;
                v26 = v260;
                v43 = v261;
                v44 = v262;
                v15 = v263;
                goto LABEL_146;
              }
              createMobileActivationError((uint64_t)"create_baa_info", 562, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve %@."), v117, v118, (uint64_t)CFSTR("ChipID"));
              v306 = (id)objc_claimAutoreleasedReturnValue();

              keya = 0;
              v277 = 0;
              v269 = 0;
              v271 = 0;
              v294 = 0;
              v278 = 0;
              v284 = 0;
            }
            else
            {
              createMobileActivationError((uint64_t)"create_baa_info", 556, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve %@."), v113, v114, (uint64_t)CFSTR("UniqueChipID"));
              v306 = (id)objc_claimAutoreleasedReturnValue();

              keya = 0;
              v277 = 0;
              v269 = 0;
              v271 = 0;
              v294 = 0;
              v278 = 0;
              v284 = 0;
              v268 = 0;
            }
            v41 = 0;
            goto LABEL_145;
          }
          createMobileActivationError((uint64_t)"create_baa_info", 548, CFSTR("com.apple.MobileActivation.ErrorDomain"), -4, 0, CFSTR("UCRT is unavailable."), v109, v110, v255);
          v306 = (id)objc_claimAutoreleasedReturnValue();

          keya = 0;
          v277 = 0;
          v269 = 0;
          v271 = 0;
          v294 = 0;
          v278 = 0;
          v284 = 0;
          v285 = 0;
          v26 = 0;
          v268 = 0;
          v41 = 0;
          v40 = 0;
          v39 = 0;
          v75 = 0;
          v281 = 0;
          v282 = 0;
          v43 = v261;
          v44 = v262;
        }
        else
        {
          createMobileActivationError((uint64_t)"create_baa_info", 541, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."), v103, v104, v255);
          v306 = (id)objc_claimAutoreleasedReturnValue();

          keya = 0;
          v277 = 0;
          v269 = 0;
          v271 = 0;
          v294 = 0;
          v278 = 0;
          v284 = 0;
          v285 = 0;
          v26 = 0;
          v268 = 0;
          v41 = 0;
          v40 = 0;
          v39 = 0;
          v75 = 0;
          v281 = 0;
          v282 = 0;
        }
        v15 = v263;
        goto LABEL_146;
      }
      createMobileActivationError((uint64_t)"create_baa_info", 533, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v100, CFSTR("Failed to copy UIK attestation key."), v101, v102, v255);
      v306 = (id)objc_claimAutoreleasedReturnValue();

      CFRelease(cf);
      keya = 0;
      v277 = 0;
      v15 = 0;
      v294 = 0;
      v278 = 0;
      v271 = 0;
      v284 = 0;
      v285 = 0;
      v26 = 0;
      v268 = 0;
      v41 = 0;
      v40 = 0;
      v39 = 0;
      v75 = 0;
    }
    else
    {
      createMobileActivationError((uint64_t)"create_baa_info", 524, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to copy SIK attestation key."), v77, v78, v255);
      v306 = (id)objc_claimAutoreleasedReturnValue();

      keya = 0;
      v277 = 0;
      v15 = 0;
      v44 = 0;
      v294 = 0;
      v278 = 0;
      v271 = 0;
      a1 = 0;
      v284 = 0;
      v285 = 0;
      v26 = 0;
      v268 = 0;
      v41 = 0;
      v40 = 0;
      v39 = 0;
    }
    v281 = 0;
    v282 = 0;
    goto LABEL_149;
  }
  if (objc_msgSend(v302, "BOOLValue"))
    v46 = 0;
  else
    v46 = 2;
  v319 = v35;
  security_create_system_key_attestation((uint64_t)a1, v46, v24, &v319);
  v43 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v47 = v319;

  v298 = v43;
  if (!v43)
  {
    createMobileActivationError((uint64_t)"create_baa_info", 482, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v47, CFSTR("Failed to create reference key attestation."), v48, v49, v255);
    v306 = (id)objc_claimAutoreleasedReturnValue();

    v281 = 0;
    v282 = 0;
    v36 = 0;
    v284 = 0;
    v285 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v26 = 0;
    a1 = 0;
LABEL_85:
    v298 = 0;
    goto LABEL_73;
  }
  v50 = SecKeyCopyPublicKey(a1);
  if (!v50)
  {
    createMobileActivationError((uint64_t)"create_baa_info", 488, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK public key."), v51, v52, v255);
    v306 = (id)objc_claimAutoreleasedReturnValue();

    v281 = 0;
    v282 = 0;
    v36 = 0;
    v284 = 0;
    v285 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v26 = 0;
    a1 = 0;
    goto LABEL_72;
  }
  v267 = v50;
  v53 = SecKeyCopyExternalRepresentation(v50, &error);

  if (!v53)
  {
    v174 = error;
    v175 = CFSTR("Failed to encode RK public key as data.");
    v176 = 494;
LABEL_137:
    createMobileActivationError((uint64_t)"create_baa_info", v176, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v174, v175, v54, v55, v255);
    v306 = (id)objc_claimAutoreleasedReturnValue();
    v266 = 0;
    goto LABEL_193;
  }
  v56 = SecAccessControlCreate();
  if (!v56)
  {
    v174 = error;
    v175 = CFSTR("Failed to create access control.");
    v176 = 502;
    goto LABEL_137;
  }
  v57 = *MEMORY[0x1E0CD68D8];
  v58 = (const void *)v56;
  v266 = (const void *)v56;
  if ((SecAccessControlSetProtection() & 1) != 0)
  {
    v318 = v47;
    v61 = createReferenceKeyBlob(v58, v29, v307, &v318);
    v35 = v318;

    if (v61)
    {
      v301 = v53;
      v265 = v61;
      a1 = (const __CFData *)v61;
      v23 = v298;
      goto LABEL_52;
    }
    createMobileActivationError((uint64_t)"create_baa_info", 513, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v35, CFSTR("Failed to create reference key."), v62, v63, v255);
    v306 = (id)objc_claimAutoreleasedReturnValue();
    v47 = v35;
  }
  else
  {
    createMobileActivationError((uint64_t)"create_baa_info", 507, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to set ACL protection to %@."), v59, v60, v57);
    v306 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_193:

  keya = 0;
  v277 = 0;
  v15 = 0;
  v44 = 0;
  v294 = 0;
  v278 = 0;
  v271 = 0;
  v43 = 0;
  a1 = 0;
  v284 = 0;
  v285 = 0;
  v26 = 0;
  v268 = 0;
  v41 = 0;
  v40 = 0;
  v39 = 0;
  v75 = 0;
  v281 = 0;
  v282 = 0;
  v301 = v53;
  v180 = v267;
LABEL_194:
  CFRelease(v180);
LABEL_195:
  if (v75)
    CFRelease(v75);
  v36 = v266;
  v42 = v268;
LABEL_117:
  if (error)
  {
    v154 = v39;
    v155 = v40;
    v156 = v41;
    v157 = v42;
    v158 = v26;
    v159 = v15;
    v160 = a1;
    v161 = v43;
    v162 = v36;
    CFRelease(error);
    v36 = v162;
    v43 = v161;
    a1 = v160;
    v15 = v159;
    v26 = v158;
    v42 = v157;
    v41 = v156;
    v40 = v155;
    v39 = v154;
  }
  error = 0;
  if (v36)
    CFRelease(v36);
  if (a3 && !v44)
    *a3 = objc_retainAutorelease(v306);
  v163 = v44;

  return v163;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t mobileactivationErrorHasDomainAndErrorCode(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = *MEMORY[0x1E0CB3388];
    do
    {
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v7))
      {
        v11 = objc_msgSend(v5, "code");

        if (v11 == a3)
        {
          v8 = 1;
          goto LABEL_10;
        }
      }
      else
      {

      }
      objc_msgSend(v5, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v13;
    }
    while (v13);
    v8 = 0;
  }
LABEL_10:

  return v8;
}

uint64_t isRunningInRecovery()
{
  return 0;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (isRunningInDiagnosticsMode_onceToken != -1)
    dispatch_once(&isRunningInDiagnosticsMode_onceToken, &__block_literal_global);
  return isRunningInDiagnosticsMode_retval;
}

void __isRunningInDiagnosticsMode_block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  isNSNumber(v1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
    isRunningInDiagnosticsMode_retval = objc_msgSend(v1, "BOOLValue");

}

id isNSNumber(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

uint64_t isSupportedDeviceIdentityClient(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  if (isSupportedDeviceIdentityClient_onceToken != -1)
    dispatch_once(&isSupportedDeviceIdentityClient_onceToken, &__block_literal_global_2);
  copy_process_name();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    createMobileActivationError((uint64_t)"isSupportedDeviceIdentityClient", 287, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query process name."), v3, v4, v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (a2)
    {
LABEL_12:
      v11 = objc_retainAutorelease(v11);
      v12 = 0;
      *a2 = v11;
      goto LABEL_15;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v6 = is_virtual_machine();
  v7 = &isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  if (!v6)
    v7 = &isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  v8 = (id)*v7;
  if ((objc_msgSend(v8, "containsObject:", v5) & 1) == 0)
  {
    createMobileActivationError((uint64_t)"isSupportedDeviceIdentityClient", 294, CFSTR("com.apple.MobileActivation.ErrorDomain"), -25, 0, CFSTR("%@ is not allowed to use this API. File a radar with 'MobileActivation | all' for support."), v9, v10, (uint64_t)v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      isSupportedDeviceIdentityClient_cold_1(v11);
      if (a2)
        goto LABEL_12;
    }
    else if (a2)
    {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v11 = 0;
  v12 = 1;
LABEL_15:

  return v12;
}

void __isSupportedDeviceIdentityClient_block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)isSupportedDeviceIdentityClient_virtualDeviceSupportedList;
  isSupportedDeviceIdentityClient_virtualDeviceSupportedList = (uint64_t)&unk_1E98CE668;

  v1 = (void *)isSupportedDeviceIdentityClient_physicalDeviceSupportedList;
  isSupportedDeviceIdentityClient_physicalDeviceSupportedList = (uint64_t)&unk_1E98CE680;

}

id copy_calling_process_name()
{
  return copy_process_name();
}

id copy_current_process_name()
{
  return copy_process_name();
}

id isNSDictionary(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSArray(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSString(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSData(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSDate(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id copy_process_name()
{
  int v0;
  void *v1;
  void *v2;
  pid_t v3;
  int v4;
  _OWORD v7[16];
  char buffer[4096];
  uint64_t v9;

  v0 = MEMORY[0x1E0C80A78]();
  v9 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x1000uLL);
  memset(v7, 0, sizeof(v7));
  if (v0
    && (objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection"), (v1 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "processIdentifier");

  }
  else
  {
    v3 = getpid();
  }
  proc_pidpath(v3, buffer, 0x1000u);
  v4 = strlen(buffer);
  if ((v4 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v4] == 47)
        break;
    }
    while (v4-- > 0);
  }
  __strlcpy_chk();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), v7);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t device_supports_mfi_certificates()
{
  void *v0;
  uint64_t v1;

  +[DeviceTypeDeviceIdentity sharedInstance](DeviceTypeDeviceIdentity, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "device_supports_mfi_certificates");

  return v1;
}

uint64_t device_supports_eda_certificates()
{
  void *v0;
  uint64_t v1;

  +[DeviceTypeDeviceIdentity sharedInstance](DeviceTypeDeviceIdentity, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "device_supports_eda_certificates");

  return v1;
}

uint64_t platform_supports_activation()
{
  objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String");
  return os_variant_is_darwinos() ^ 1;
}

id copy_trusted_local_policy_hash()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _BYTE *v6;
  _BYTE *v7;

  +[DeviceTypeDeviceIdentity sharedInstance](DeviceTypeDeviceIdentity, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "copyDeviceTreeProperty:key:", v1, CFSTR("trusted-boot-policy-measurement"));

  isNSData(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  v4 = (void *)v3;
  v5 = (id)objc_msgSend(v2, "length");

  if (!v5)
    goto LABEL_9;
  v6 = malloc_type_calloc(1uLL, objc_msgSend(v2, "length"), 0xDA89FFE2uLL);
  if (!v6)
  {
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  objc_msgSend(v2, "getBytes:length:", v6, objc_msgSend(v2, "length"));
  if (!*v7 && !memcmp(v7, v7 + 1, objc_msgSend(v2, "length") - 1))
    v5 = 0;
  else
    v5 = v2;
  free(v7);
LABEL_9:

  return v5;
}

id copy_sfr_manifest()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  +[DeviceTypeDeviceIdentity sharedInstance](DeviceTypeDeviceIdentity, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen/iBoot"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "copyDeviceTreeInt:key:defaultValue:", v1, CFSTR("sfr-manifest-size"), 0);

  if (!v2 || !objc_msgSend(v2, "unsignedIntValue"))
  {
    v6 = 0;
    goto LABEL_8;
  }
  +[DeviceTypeDeviceIdentity sharedInstance](DeviceTypeDeviceIdentity, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen/iBoot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "copyDeviceTreeProperty:key:", v4, CFSTR("sfr-manifest-data"));

  isNSData(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v5, "length");

    if (!v7)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "subdataWithRange:", 0, objc_msgSend(v2, "unsignedIntValue"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v6 = v6;
      v5 = v6;
      goto LABEL_9;
    }
LABEL_8:
    v5 = 0;
  }
LABEL_9:

  return v6;
}

id vm_copy_host_certificate(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;

  v3 = a1;
  if (is_virtual_machine())
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v8)
    {
      v33 = 0;
      libavp_copy_strong_identity_data(v3, &v33);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v33;
      if (v9)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("CopyVMHostCertificateRequest"), CFSTR("Command"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Value"));
        v32 = v12;
        libavp_send_host_message(v8, &v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v32;

        isNSDictionary(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Error"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          isNSString(v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Value"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            isNSDictionary(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("RKCertification"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              isNSData(v23);
              v21 = (id)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                v21 = v23;
                v23 = v21;
                goto LABEL_11;
              }
              createMobileActivationError((uint64_t)"vm_copy_host_certificate", 71, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid response message."), v28, v29, v30);
              v31 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              createMobileActivationError((uint64_t)"vm_copy_host_certificate", 65, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid response message."), v26, v27, v30);
              v31 = objc_claimAutoreleasedReturnValue();

              v21 = 0;
            }
            goto LABEL_17;
          }
          createMobileActivationError((uint64_t)"vm_copy_host_certificate", 59, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Error occurred during request: %@"), v19, v20, (uint64_t)v15);
        }
        else
        {
          createMobileActivationError((uint64_t)"vm_copy_host_certificate", 53, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v14, CFSTR("Failed to receive response."), v16, v17, v30);
        }
        v31 = objc_claimAutoreleasedReturnValue();

        v21 = 0;
        v22 = 0;
        v23 = 0;
LABEL_17:
        v14 = (id)v31;
        goto LABEL_11;
      }
      createMobileActivationError((uint64_t)"vm_copy_host_certificate", 44, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v12, CFSTR("Failed to copy AVP identity data."), v10, v11, v30);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    else
    {
      createMobileActivationError((uint64_t)"vm_copy_host_certificate", 38, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create dictionary."), v6, v7, v30);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v9 = 0;
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"vm_copy_host_certificate", 32, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is not a VM (not supported)."), v4, v5, v30);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v9 = 0;
    v8 = 0;
  }
  v13 = 0;
  v22 = 0;
  v23 = 0;
  v15 = 0;
LABEL_11:
  if (a2 && !v21)
    *a2 = objc_retainAutorelease(v14);
  v24 = v21;

  return v24;
}

id vm_create_host_key_signature(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  id v47;
  id v48;

  v6 = a1;
  v7 = a2;
  v44 = v7;
  v45 = v6;
  if (!is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 101, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is not a VM (not supported)."), v8, v9, v41);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v17 = 0;
    v13 = 0;
LABEL_13:
    v16 = 0;
LABEL_14:
    v21 = 0;
    v31 = 0;
    v23 = 0;
    v32 = 0;
    v26 = 0;
    goto LABEL_15;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v10;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 107, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create dictionary."), v11, v12, v41);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v17 = 0;
    goto LABEL_13;
  }
  if (v7)
    objc_msgSend(v10, "addEntriesFromDictionary:", v7);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v16)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 117, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create dictionary."), v14, v15, v41);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v17 = 0;
    goto LABEL_14;
  }
  v48 = 0;
  libavp_copy_strong_identity_data(v7, &v48);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v48;
  if (!v17)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 123, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, CFSTR("Failed to copy AVP identity data."), v18, v19, v41);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v30 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("BIKData"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("CreateVMHostKeyAttestationRequest"), CFSTR("Command"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, CFSTR("Value"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("Options"));
  v47 = v20;
  libavp_send_host_message(v16, &v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v47;

  isNSDictionary(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 136, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v22, CFSTR("Failed to receive response."), v24, v25, v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    v31 = 0;
    v32 = 0;
    v26 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Error"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 142, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Error occurred during request: %@"), v28, v29, (uint64_t)v26);
    v42 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    v31 = 0;
    v23 = 0;
LABEL_10:
    v32 = 0;
LABEL_22:
    v22 = (id)v42;
    goto LABEL_15;
  }
  v43 = a3;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Value"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 148, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid response message."), v35, v36, v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("RKCertification"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 154, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid response message."), v37, v38, v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("RKSignature"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v32);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    createMobileActivationError((uint64_t)"vm_create_host_key_signature", 160, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid response message."), v39, v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  if (v43)
    *v43 = objc_retainAutorelease(v23);
  v30 = v32;
  v32 = v30;
LABEL_15:
  if (a4 && !v30)
    *a4 = objc_retainAutorelease(v22);
  v33 = v30;

  return v33;
}

uint64_t load_certificate(CFTypeRef *a1, void *a2, void *a3, int *a4, _QWORD *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  OSStatus v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  char v25;
  uint64_t v27;
  CFTypeRef result;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v13 = v10;
  result = 0;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"load_certificate", 252, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid inputs."), v11, v12, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v18 = 0;
    v22 = -1;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = *MEMORY[0x1E0CD6C98];
  v29[0] = *MEMORY[0x1E0CD6A90];
  v29[1] = v14;
  v15 = *MEMORY[0x1E0CD6CA0];
  v30[0] = v10;
  v30[1] = v15;
  v16 = *MEMORY[0x1E0CD70A8];
  v29[2] = *MEMORY[0x1E0CD7028];
  v29[3] = v16;
  v30[2] = MEMORY[0x1E0C9AAB0];
  v30[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v9)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6898]);
  v19 = SecItemCopyMatching((CFDictionaryRef)v18, &result);
  if (v19)
  {
    v22 = v19;
    createMobileActivationError((uint64_t)"load_certificate", 274, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate (%@): %d"), v20, v21, (uint64_t)v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (!a4)
      goto LABEL_9;
LABEL_8:
    *a4 = v22;
    goto LABEL_9;
  }
  v22 = 0;
  v23 = 0;
  if (a1)
    *a1 = CFRetain(result);
  v24 = 1;
  if (a4)
    goto LABEL_8;
LABEL_9:
  if (a5)
    v25 = v24;
  else
    v25 = 1;
  if ((v25 & 1) == 0)
    *a5 = objc_retainAutorelease(v23);
  if (result)
    CFRelease(result);
  result = 0;

  return v24;
}

uint64_t delete_certificate(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  OSStatus v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v9 = v6;
  if (!v6)
  {
    createMobileActivationError((uint64_t)"delete_certificate", 308, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v7, v8, v21);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a3)
      goto LABEL_7;
    goto LABEL_9;
  }
  v10 = *MEMORY[0x1E0CD6C98];
  v22[0] = *MEMORY[0x1E0CD6A90];
  v22[1] = v10;
  v11 = *MEMORY[0x1E0CD6CA0];
  v23[0] = v6;
  v23[1] = v11;
  v12 = *MEMORY[0x1E0CD70A8];
  v22[2] = *MEMORY[0x1E0CD7028];
  v22[3] = v12;
  v23[2] = MEMORY[0x1E0C9AAB0];
  v23[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v5)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD6898]);
  v17 = SecItemDelete((CFDictionaryRef)v14);
  v18 = 0;
  v19 = 1;
  if (v17 != -25300 && v17)
  {
    createMobileActivationError((uint64_t)"delete_certificate", 330, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to remove existing certificate (%@): %d"), v15, v16, (uint64_t)v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      v19 = 0;
      goto LABEL_10;
    }
LABEL_9:
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a3 = v18;
  }
LABEL_10:

  return v19;
}

CFTypeRef copy_keychain_item(void *a1, void *a2, void *a3, OSStatus *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  CFTypeRef v19;
  OSStatus v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  _QWORD *v33;
  CFTypeRef result;
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v14 = v11;
  result = 0;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"copy_keychain_item", 563, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v12, v13, v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = -1;
    if (!a4)
      goto LABEL_24;
    goto LABEL_23;
  }
  v33 = a5;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LocalAuthenticationContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LocalAuthenticationContext"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      getLAContextClass();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LocalAuthenticationContext"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UseAuthenticationUI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UseAuthenticationUI"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    v15 = 0;
  }
  v23 = 0;
LABEL_13:
  v24 = *MEMORY[0x1E0CD6C98];
  v35[0] = *MEMORY[0x1E0CD6A90];
  v35[1] = v24;
  v25 = *MEMORY[0x1E0CD6CC0];
  v36[0] = v10;
  v36[1] = v25;
  v26 = *MEMORY[0x1E0CD70A8];
  v35[2] = *MEMORY[0x1E0CD7028];
  v35[3] = v26;
  v36[2] = MEMORY[0x1E0C9AAB0];
  v36[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  if (v9)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6898]);
  if (v15)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CD7088]);
  if (v23)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CD7090]);
  v20 = SecItemCopyMatching((CFDictionaryRef)v28, &result);
  if (v20)
  {
    createMobileActivationError((uint64_t)"copy_keychain_item", 607, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy keychain item %@: %d"), v29, v30, (uint64_t)v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
  }
  else
  {
    v19 = result;
    result = 0;

    v18 = 0;
  }
  a5 = v33;
  if (a4)
LABEL_23:
    *a4 = v20;
LABEL_24:
  if (a5 && !v19)
    *a5 = objc_retainAutorelease(v18);
  if (result)
    CFRelease(result);
  result = 0;

  return v19;
}

id getLAContextClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLAContextClass_softClass;
  v7 = getLAContextClass_softClass;
  if (!getLAContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLAContextClass_block_invoke;
    v3[3] = &unk_1E98C7E30;
    v3[4] = &v4;
    __getLAContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4F6380C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t delete_keychain_item(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  OSStatus v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v9 = v6;
  if (!v6)
  {
    createMobileActivationError((uint64_t)"delete_keychain_item", 638, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."), v7, v8, v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (!a3)
    {
LABEL_13:
      v18 = 0;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  v10 = *MEMORY[0x1E0CD6C98];
  v22[0] = *MEMORY[0x1E0CD6A90];
  v22[1] = v10;
  v11 = *MEMORY[0x1E0CD6CC0];
  v23[0] = v6;
  v23[1] = v11;
  v22[2] = *MEMORY[0x1E0CD70A8];
  v23[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v5)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD6898]);
  v14 = SecItemDelete((CFDictionaryRef)v13);
  if (v14 != -25300 && v14 != 0)
  {
    createMobileActivationError((uint64_t)"delete_keychain_item", 659, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to remove existing keychain item %@: %d"), v15, v16, (uint64_t)v9);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_13;
LABEL_11:
    v19 = objc_retainAutorelease(v19);
    v18 = 0;
    *a3 = v19;
    goto LABEL_14;
  }
  v19 = 0;
  v18 = 1;
LABEL_14:

  return v18;
}

uint64_t store_keychain_item(uint64_t a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  _QWORD v40[6];

  v40[5] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v14 = v11;
  if (a1 && v10)
  {
    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LocalAuthenticationContext"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_9;
      v16 = (void *)v15;
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LocalAuthenticationContext"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      getLAContextClass();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("LocalAuthenticationContext"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_9:
        v19 = 0;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UseAuthenticationUI"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UseAuthenticationUI"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else
    {
      v19 = 0;
    }
    v22 = 0;
LABEL_14:
    v38 = 0;
    v26 = delete_keychain_item(v9, v10, &v38);
    v20 = v38;
    if ((v26 & 1) != 0)
    {
      v29 = *MEMORY[0x1E0CD6C98];
      v39[0] = *MEMORY[0x1E0CD6A90];
      v39[1] = v29;
      v30 = *MEMORY[0x1E0CD6CC0];
      v40[0] = v10;
      v40[1] = v30;
      v31 = *MEMORY[0x1E0CD70A8];
      v39[2] = *MEMORY[0x1E0CD70E8];
      v39[3] = v31;
      v40[2] = a1;
      v40[3] = MEMORY[0x1E0C9AAB0];
      v39[4] = *MEMORY[0x1E0CD68A0];
      v40[4] = *MEMORY[0x1E0CD68D0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v32, "mutableCopy");

      if (v9)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6898]);
      if (v19)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CD7088]);
      if (v22)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CD7090]);
      if (!SecItemAdd((CFDictionaryRef)v21, 0))
      {
        v23 = 1;
        goto LABEL_27;
      }
      createMobileActivationError((uint64_t)"store_keychain_item", 738, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to add %@ to keychain: %d"), v33, v34, (uint64_t)v10);
      v35 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      createMobileActivationError((uint64_t)"store_keychain_item", 705, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, CFSTR("Failed to delete existing keychain item."), v27, v28, v37);
      v35 = objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    v20 = (id)v35;
    if (!a5)
      goto LABEL_25;
    goto LABEL_8;
  }
  createMobileActivationError((uint64_t)"store_keychain_item", 688, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."), v12, v13, v37);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v19 = 0;
  v22 = 0;
  if (!a5)
  {
LABEL_25:
    v23 = 0;
    goto LABEL_27;
  }
LABEL_8:
  v20 = objc_retainAutorelease(v20);
  v23 = 0;
  *a5 = v20;
LABEL_27:

  return v23;
}

id copy_keychain_data(void *a1, void *a2, OSStatus *a3, _QWORD *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  OSStatus v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  CFTypeRef result;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v11 = v8;
  result = 0;
  if (v8)
  {
    v12 = *MEMORY[0x1E0CD6C98];
    v26[0] = *MEMORY[0x1E0CD6A90];
    v26[1] = v12;
    v13 = *MEMORY[0x1E0CD6CA8];
    v27[0] = v8;
    v27[1] = v13;
    v14 = *MEMORY[0x1E0CD70A8];
    v26[2] = *MEMORY[0x1E0CD7018];
    v26[3] = v14;
    v27[2] = MEMORY[0x1E0C9AAB0];
    v27[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v7)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6898]);
    v19 = SecItemCopyMatching((CFDictionaryRef)v16, &result);
    if (v19)
    {
      createMobileActivationError((uint64_t)"copy_keychain_data", 831, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy keychain item %@: %d"), v17, v18, (uint64_t)v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      if (!a3)
        goto LABEL_9;
    }
    else
    {
      v20 = 0;
      v21 = (void *)result;
      result = 0;
      if (!a3)
        goto LABEL_9;
    }
    goto LABEL_8;
  }
  createMobileActivationError((uint64_t)"copy_keychain_data", 809, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v9, v10, v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v16 = 0;
  v19 = -1;
  if (a3)
LABEL_8:
    *a3 = v19;
LABEL_9:
  if (a4 && !v21)
    *a4 = objc_retainAutorelease(v20);
  if (result)
    CFRelease(result);
  result = 0;
  v22 = v21;

  return v22;
}

uint64_t delete_keychain_data(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  OSStatus v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v9 = v6;
  if (!v6)
  {
    createMobileActivationError((uint64_t)"delete_keychain_data", 862, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."), v7, v8, v21);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (!a3)
    {
LABEL_13:
      v18 = 0;
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  v10 = *MEMORY[0x1E0CD6C98];
  v22[0] = *MEMORY[0x1E0CD6A90];
  v22[1] = v10;
  v11 = *MEMORY[0x1E0CD6CA8];
  v23[0] = v6;
  v23[1] = v11;
  v22[2] = *MEMORY[0x1E0CD70A8];
  v23[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v5)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD6898]);
  v14 = SecItemDelete((CFDictionaryRef)v13);
  if (v14 != -25300 && v14 != 0)
  {
    createMobileActivationError((uint64_t)"delete_keychain_data", 883, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to remove existing keychain item %@: %d"), v15, v16, (uint64_t)v9);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_13;
LABEL_11:
    v19 = objc_retainAutorelease(v19);
    v18 = 0;
    *a3 = v19;
    goto LABEL_14;
  }
  v19 = 0;
  v18 = 1;
LABEL_14:

  return v18;
}

uint64_t store_keychain_data(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;
  _QWORD v30[7];
  _QWORD v31[8];

  v31[7] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v12 = v9;
  if (v7 && v9)
  {
    v29 = 0;
    v13 = delete_keychain_data(v8, v9, &v29);
    v16 = v29;
    if ((v13 & 1) != 0)
    {
      v17 = *MEMORY[0x1E0CD6C98];
      v30[0] = *MEMORY[0x1E0CD6A90];
      v30[1] = v17;
      v18 = *MEMORY[0x1E0CD6CA8];
      v31[0] = v12;
      v31[1] = v18;
      v19 = *MEMORY[0x1E0CD70A8];
      v30[2] = *MEMORY[0x1E0CD70D8];
      v30[3] = v19;
      v31[2] = v7;
      v31[3] = MEMORY[0x1E0C9AAB0];
      v20 = *MEMORY[0x1E0CD68F8];
      v30[4] = *MEMORY[0x1E0CD6B58];
      v30[5] = v20;
      v31[4] = CFSTR("com.apple.mobileactivationd");
      v31[5] = v12;
      v30[6] = *MEMORY[0x1E0CD68A0];
      v31[6] = *MEMORY[0x1E0CD68D0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "mutableCopy");

      if (v8)
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6898]);
      if (!SecItemAdd((CFDictionaryRef)v22, 0))
      {
        v26 = 1;
        goto LABEL_14;
      }
      createMobileActivationError((uint64_t)"store_keychain_data", 941, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to add %@ to keychain: %d"), v23, v24, (uint64_t)v12);
      v25 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      createMobileActivationError((uint64_t)"store_keychain_data", 913, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v16, CFSTR("Failed to delete existing keychain item."), v14, v15, v28);
      v25 = objc_claimAutoreleasedReturnValue();

      v22 = 0;
    }
    v16 = (id)v25;
    if (!a4)
      goto LABEL_12;
  }
  else
  {
    createMobileActivationError((uint64_t)"store_keychain_data", 908, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."), v10, v11, v28);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    if (!a4)
    {
LABEL_12:
      v26 = 0;
      goto LABEL_14;
    }
  }
  v16 = objc_retainAutorelease(v16);
  v26 = 0;
  *a4 = v16;
LABEL_14:

  return v26;
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E98C7E50;
    v5 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    __getLAContextClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LAContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLAContextClass_block_invoke_cold_2();
  getLAContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id lockcrypto_query_certificate_properties(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  id v69;
  unsigned __int8 **v70;
  unsigned __int8 *v71;
  uint64_t *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  unint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unsigned __int8 *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __CFString *v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  int v101;
  id v102;
  unsigned __int8 **v103;
  unsigned __int8 *v104;
  unint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __CFString *v132;
  __CFString *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  __CFString *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  __CFString *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  id v179;
  _QWORD *v180;
  _QWORD *v181;
  id v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  unsigned __int8 *v188;
  uint64_t v189;
  BOOL v190;
  unint64_t v191;
  int v192;
  __int128 v193;
  unint64_t v194;
  __int128 v195;
  unint64_t v196;
  unint64_t v197[2];
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint64_t v209;
  unsigned __int8 *v210;
  unint64_t v211;
  uint64_t v212;
  unsigned __int8 *v213;
  uint64_t v214[16];

  v214[14] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v8 = v5;
  v199 = 0;
  v200 = 0;
  v197[1] = 0;
  v198 = 0;
  v196 = 0;
  v197[0] = 0;
  v195 = 0uLL;
  v193 = 0uLL;
  v194 = 0;
  v192 = 0;
  v191 = 0;
  v190 = 0;
  if (!a1 || !v5)
  {
    createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 229, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."), v6, v7, v174);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
LABEL_15:
    v16 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_181;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v11)
  {
    createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 235, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."), v9, v10, v174);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (MEMORY[0x1E0CD5F78])
  {
    v14 = (void *)SecCertificateCopyExtensionValue();
    v15 = 0;
    if (!v14)
      goto LABEL_179;
    goto LABEL_6;
  }
  v26 = v8;
  if (lockcrypto_query_oid_der_sequence_data_onceToken != -1)
    dispatch_once(&lockcrypto_query_oid_der_sequence_data_onceToken, &__block_literal_global_1);
  v27 = (void *)SecCertificateCopyProperties();
  v30 = v27;
  if (!v27)
  {
    createMobileActivationError((uint64_t)"lockcrypto_query_oid_der_sequence_data", 137, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate properties."), v28, v29, v174);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    goto LABEL_177;
  }
  v175 = v27;
  v176 = v8;
  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v31 = v27;
  v185 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v205, &v212, 16);
  v32 = 0;
  if (!v185)
    goto LABEL_53;
  v182 = v11;
  v184 = *(_QWORD *)v206;
  v179 = v26;
  v180 = a3;
  v178 = v31;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v206 != v184)
        objc_enumerationMutation(v31);
      v34 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * v33);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("label"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v35, "isEqualToString:", v26))
        {
          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("value"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v203 = 0u;
              v204 = 0u;
              v201 = 0u;
              v202 = 0u;
              v32 = v36;
              v37 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v201, &v209, 16);
              if (!v37)
                goto LABEL_46;
              v38 = v37;
              v39 = *(_QWORD *)v202;
              while (1)
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v202 != v39)
                    objc_enumerationMutation(v32);
                  v41 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v42 = 0;
LABEL_43:
                    v14 = 0;
                    goto LABEL_44;
                  }
                  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("label"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v42)
                    goto LABEL_43;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || !objc_msgSend(v42, "isEqualToString:", CFSTR("Unparsed Data")))
                  {
                    goto LABEL_43;
                  }
                  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("value"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v14)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && !objc_msgSend(v14, "isEqualToData:", lockcrypto_query_oid_der_sequence_data_ASN1DERNull))
                    {

                      v138 = 0;
                      v30 = v175;
                      v8 = v176;
                      a3 = v180;
                      v11 = v182;
                      v139 = v178;
                      v26 = v179;
                      goto LABEL_178;
                    }
                  }
LABEL_44:

                }
                v38 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v201, &v209, 16);
                if (!v38)
                {
LABEL_46:

                  a3 = v180;
                  v11 = v182;
                  v31 = v178;
                  v26 = v179;
                  goto LABEL_48;
                }
              }
            }
            v32 = v36;
          }
          else
          {
            v32 = 0;
          }
        }
      }
      else
      {
        v35 = 0;
      }
LABEL_48:

      ++v33;
    }
    while (v33 != v185);
    v43 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v205, &v212, 16);
    v185 = v43;
  }
  while (v43);
LABEL_53:

  v44 = 0;
  v30 = v175;
  v8 = v176;
LABEL_177:
  v139 = objc_retainAutorelease(v44);
  v14 = 0;
  v138 = v139;
LABEL_178:

  v15 = v138;
  if (v14)
  {
LABEL_6:
    v16 = objc_retainAutorelease(v14);
    v199 = objc_msgSend(v16, "bytes");
    v200 = objc_msgSend(v16, "length");
    v17 = DERDecodeSeqInit((uint64_t)&v199, &v198, v197);
    if ((_DWORD)v17 == 2)
    {
      v17 = DERDecodeItem((uint64_t)&v199, (unint64_t *)&v195);
      if (!(_DWORD)v17 && (_QWORD)v195 == 4)
        v17 = DERDecodeSeqInit((uint64_t)&v195 + 8, &v198, v197);
    }
    if ((_DWORD)v17)
    {
      v174 = v17;
      v20 = CFSTR("Failed to intialize DER sequence: %d");
      v21 = 267;
LABEL_12:
      createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v21, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, v20, v18, v19, v174);
      v22 = objc_claimAutoreleasedReturnValue();

      goto LABEL_180;
    }
    if (v198 != 0x2000000000000010)
    {
      if (v198 != 0x2000000000000011)
      {
        v20 = CFSTR("Expected ASN1_CONSTR_SET or ASN1_CONSTR_SEQUENCE tag.");
        v21 = 717;
        goto LABEL_12;
      }
      v205 = 0uLL;
      v201 = 0uLL;
      v212 = 0;
      v213 = 0;
      v214[0] = 0;
      v45 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
      v48 = 0;
      v181 = a3;
      v183 = v11;
      if ((_DWORD)v45 || (v49 = *((_QWORD *)&v195 + 1)) == 0)
      {
        v24 = 0;
        v25 = 0;
LABEL_224:
        a3 = v181;
        if ((_DWORD)v45 != 1)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 468, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode DER sequence: %d"), v46, v47, v45);
          v166 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v166;
        }
        v23 = (void *)v48;
        goto LABEL_181;
      }
      v25 = 0;
      v24 = 0;
      v23 = 0;
      v50 = CFSTR("com.apple.MobileActivation.ErrorDomain");
      while (1)
      {
        *(_QWORD *)&v205 = v49;
        *((_QWORD *)&v205 + 1) = v196;
        v51 = DERDecodeSeqInit((uint64_t)&v205, &v198, &v201);
        if ((_DWORD)v51)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 479, v50, -1, 0, CFSTR("Failed to intialize DER sequence: %d"), v52, v53, v51);
          goto LABEL_238;
        }
        if (v198 != 0x2000000000000010)
        {
          v168 = CFSTR("Expected ASN1_CONSTR_SEQUENCE tag.");
          v169 = 484;
          goto LABEL_237;
        }
        v54 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if ((_DWORD)v54 || !v213)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 492, v50, -1, 0, CFSTR("Failed to decode DER sequence: %d"), v52, v53, v54);
          goto LABEL_238;
        }
        if (v212 != 22)
        {
          v168 = CFSTR("Invalid DER tag.");
          v169 = 497;
          goto LABEL_237;
        }
        v55 = DERParseInteger((char **)&v213, &v192);
        if ((_DWORD)v55)
          break;
        if (v214[0] != 4)
        {
          v174 = v214[0];
          v168 = CFSTR("Invalid property key length: %ld");
          v169 = 508;
LABEL_237:
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v169, v50, -1, 0, v168, v52, v53, v174);
LABEL_238:
          v170 = objc_claimAutoreleasedReturnValue();

LABEL_239:
          v15 = (id)v170;
LABEL_247:
          a3 = v181;
          v11 = v183;
          goto LABEL_181;
        }
        v56 = objc_alloc(MEMORY[0x1E0CB3940]);
        v48 = objc_msgSend(v56, "initWithBytes:length:encoding:", v213, v214[0], 1);

        if (!v48)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 514, v50, -1, 0, CFSTR("Failed to create string."), v57, v58, v174);
          v170 = objc_claimAutoreleasedReturnValue();

          v23 = 0;
          goto LABEL_239;
        }
        v59 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if ((_DWORD)v59 || !v213)
        {
          v174 = v59;
          v172 = CFSTR("Failed to decode DER sequence: %d");
          v173 = 520;
LABEL_242:
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v173, v50, -1, 0, v172, v60, v61, v174);
          goto LABEL_243;
        }
        if (v212 <= 1)
        {
          switch(v212)
          {
            case 0xA000000000000000:
              v73 = v11;
              v74 = &unk_1E98CE7B8;
              break;
            case 0xA000000000000001:
              v73 = v11;
              v74 = &unk_1E98CE7D0;
              break;
            case 1:
              v62 = DERParseBoolean(&v213, &v190);
              if (!(_DWORD)v62)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v190);
                v65 = objc_claimAutoreleasedReturnValue();
LABEL_92:
                v78 = (void *)v65;
                objc_msgSend(v11, "setObject:forKeyedSubscript:", v65, v48);

                goto LABEL_155;
              }
              createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 559, v50, -1, 0, CFSTR("Failed to decode DER encoded ASN1_BOOLEAN: %d"), v63, v64, v62);
              goto LABEL_243;
            default:
              goto LABEL_155;
          }
LABEL_148:
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v74, v48);
          goto LABEL_155;
        }
        if (v212 == 2)
        {
          v75 = DERParseInteger64((char **)&v213, &v191);
          if (!(_DWORD)v75)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v191);
            v65 = objc_claimAutoreleasedReturnValue();
            goto LABEL_92;
          }
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 551, v50, -1, 0, CFSTR("Failed to decode DER encoded ASN1_INTEGER: %d"), v76, v77, v75);
          goto LABEL_243;
        }
        if (v212 != 0x2000000000000011)
        {
          if (v212 != 4)
            goto LABEL_155;

          if (v214[0])
          {
            v66 = 0;
            v67 = 0;
            while (((char)v213[v66] & 0x80000000) == 0)
            {
              v66 = ++v67;
              if (v214[0] <= (unint64_t)v67)
              {
                v68 = DERDecodeItem((uint64_t)&v213, (unint64_t *)&v193);
                v69 = objc_alloc(MEMORY[0x1E0CB3940]);
                v70 = (unsigned __int8 **)&v193 + 1;
                if (v68)
                  v70 = &v213;
                v71 = *v70;
                v72 = (uint64_t *)&v194;
                if (v68)
                  v72 = v214;
                v25 = (void *)objc_msgSend(v69, "initWithBytes:length:encoding:", v71, *v72, 1);
                if (!v25)
                {
                  v172 = CFSTR("Failed to decode DER encoded ANS1_OCTET_STRING.");
                  v173 = 536;
                  goto LABEL_242;
                }
                goto LABEL_144;
              }
            }
          }
          v127 = objc_alloc(MEMORY[0x1E0C99D50]);
          v128 = objc_msgSend(v127, "initWithBytes:length:", v213, v214[0]);

          if (!v128)
          {
            createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 542, v50, -1, 0, CFSTR("Failed to decode DER encoded ANS1_OCTET_STRING."), v129, v130, v174);
            v171 = objc_claimAutoreleasedReturnValue();

            v24 = 0;
            v25 = 0;
            goto LABEL_244;
          }
          v25 = 0;
          v24 = (void *)v128;
LABEL_144:
          if (v25)
            v74 = v25;
          else
            v74 = v24;
          v73 = v11;
          goto LABEL_148;
        }
        v79 = DERDecodeSeqContentInit((unint64_t *)&v213, (unint64_t *)&v201);
        if ((_DWORD)v79)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 571, v50, -1, 0, CFSTR("Failed to intialize DER sequence: %d"), v80, v81, (uint64_t)v79);
LABEL_243:
          v171 = objc_claimAutoreleasedReturnValue();

LABEL_244:
          v15 = (id)v171;
LABEL_246:
          v23 = (void *)v48;
          goto LABEL_247;
        }
        v82 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v82, v48);

        v188 = 0;
        v189 = 0;
        v186 = 0;
        v187 = 0;
        v209 = 0;
        v210 = 0;
        v211 = 0;
        v83 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if (!(_DWORD)v83)
        {
          v86 = v213;
          v177 = v8;
          if (v213)
          {
            while (1)
            {
              v188 = v86;
              v189 = v214[0];
              v87 = DERDecodeSeqInit((uint64_t)&v188, &v198, &v186);
              if ((_DWORD)v87)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 601, v50, -1, 0, CFSTR("Failed to intialize DER sequence: %d"), v84, v85, v87);
                goto LABEL_153;
              }
              if (v198 != 0x2000000000000010)
              {
                v131 = 606;
                v132 = v50;
                v133 = CFSTR("Expected ASN1_CONSTR_SEQUENCE tag.");
                goto LABEL_152;
              }
              v88 = DERDecodeSeqNext(&v186, (unint64_t *)&v209);
              if ((_DWORD)v88 || !v210)
              {
                v174 = v88;
                v131 = 614;
                goto LABEL_151;
              }
              if (v209 != 22)
              {
                v131 = 619;
                v132 = v50;
                v133 = CFSTR("Invalid DER tag.");
                goto LABEL_152;
              }
              v89 = DERParseInteger((char **)&v210, &v192);
              if ((_DWORD)v89)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 625, v50, -1, 0, CFSTR("Failed to parse DER integer: %d"), v90, v91, v89);
                goto LABEL_153;
              }
              if (v211 != 4)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 630, v50, -1, 0, CFSTR("Invalid property key length: %ld"), v90, v91, v214[0]);
                goto LABEL_153;
              }
              v92 = v50;
              v93 = objc_alloc(MEMORY[0x1E0CB3940]);
              v94 = objc_msgSend(v93, "initWithBytes:length:encoding:", v210, v211, 1);
              if (!v94)
              {
                v131 = 636;
                v132 = v50;
                v133 = CFSTR("Failed to create string.");
                goto LABEL_152;
              }
              v95 = (void *)v94;
              v96 = DERDecodeSeqNext(&v186, (unint64_t *)&v209);
              if ((_DWORD)v96 || !v210)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 644, v92, -1, 0, CFSTR("Failed to decode DER sequence: %d"), v97, v98, v96);
LABEL_169:
                v134 = objc_claimAutoreleasedReturnValue();

                v15 = v95;
                v50 = v92;
                goto LABEL_154;
              }
              if (v209 > 0)
                break;
              if (v209 == 0xA000000000000000)
              {
                objc_msgSend(v11, "objectForKeyedSubscript:", v48);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = v108;
                v110 = &unk_1E98CE7B8;
              }
              else
              {
                if (v209 != 0xA000000000000001)
                  goto LABEL_138;
                objc_msgSend(v11, "objectForKeyedSubscript:", v48);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = v108;
                v110 = &unk_1E98CE7D0;
              }
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v110, v95);
LABEL_137:

LABEL_138:
              v124 = DERDecodeSeqNext(&v186, (unint64_t *)&v209);
              if ((_DWORD)v124 != 1)
              {
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 696, v92, -1, 0, CFSTR("DER sequence is invalid: %d"), v125, v126, v124);
                goto LABEL_169;
              }

              v188 = 0;
              v189 = 0;
              v186 = 0;
              v187 = 0;
              v209 = 0;
              v210 = 0;
              v211 = 0;
              v83 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
              if ((_DWORD)v83)
              {
                v50 = v92;
                goto LABEL_149;
              }
              v86 = v213;
              v50 = v92;
              if (!v213)
                goto LABEL_149;
            }
            switch(v209)
            {
              case 1:
                v111 = DERParseBoolean(&v210, &v190);
                if ((_DWORD)v111)
                {
                  createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 683, v92, -1, 0, CFSTR("Failed to decode DER encoded ASN1_BOOLEAN: %d"), v112, v113, v111);
                  goto LABEL_174;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v190);
                v114 = objc_claimAutoreleasedReturnValue();
                break;
              case 2:
                v115 = DERParseInteger64((char **)&v210, &v191);
                if ((_DWORD)v115)
                {
                  createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 675, v92, -1, 0, CFSTR("Failed to decode DER encoded ASN1_INTEGER: %d"), v116, v117, v115);
LABEL_174:
                  v134 = objc_claimAutoreleasedReturnValue();

LABEL_175:
                  v15 = v95;
                  v50 = v92;
                  v8 = v177;
LABEL_154:

                  v15 = (id)v134;
                  goto LABEL_155;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v191);
                v114 = objc_claimAutoreleasedReturnValue();
                break;
              case 4:

                if (v211)
                {
                  v99 = 0;
                  v100 = 0;
                  while (((char)v210[v99] & 0x80000000) == 0)
                  {
                    v99 = ++v100;
                    if (v211 <= v100)
                    {
                      v101 = DERDecodeItem((uint64_t)&v210, (unint64_t *)&v193);
                      v102 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v103 = (unsigned __int8 **)&v193 + 1;
                      if (v101)
                        v103 = &v210;
                      v104 = *v103;
                      v105 = &v194;
                      if (v101)
                        v105 = &v211;
                      v25 = (void *)objc_msgSend(v102, "initWithBytes:length:encoding:", v104, *v105, 1);
                      if (!v25)
                      {
                        createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 660, v92, -1, 0, CFSTR("Failed to decode DER encoded ANS1_OCTET_STRING."), v106, v107, v174);
                        goto LABEL_174;
                      }
                      goto LABEL_132;
                    }
                  }
                }
                v119 = objc_alloc(MEMORY[0x1E0C99D50]);
                v120 = objc_msgSend(v119, "initWithBytes:length:", v210, v211);

                if (!v120)
                {
                  createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 666, v92, -1, 0, CFSTR("Failed to decode DER encoded ANS1_OCTET_STRING."), v121, v122, v174);
                  v134 = objc_claimAutoreleasedReturnValue();

                  v24 = 0;
                  v25 = 0;
                  goto LABEL_175;
                }
                v25 = 0;
                v24 = (void *)v120;
LABEL_132:
                if (v25)
                  v123 = v25;
                else
                  v123 = v24;
                objc_msgSend(v11, "objectForKeyedSubscript:", v48);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "setObject:forKeyedSubscript:", v123, v95);
                goto LABEL_136;
              default:
                goto LABEL_138;
            }
            v109 = (void *)v114;
            objc_msgSend(v11, "objectForKeyedSubscript:", v48);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "setObject:forKeyedSubscript:", v109, v95);

LABEL_136:
            v8 = v177;
            goto LABEL_137;
          }
        }
LABEL_149:
        if ((_DWORD)v83 != 1)
        {
          v174 = v83;
          v131 = 590;
LABEL_151:
          v132 = v50;
          v133 = CFSTR("Failed to decode DER sequence: %d");
LABEL_152:
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", v131, v132, -1, 0, v133, v84, v85, v174);
LABEL_153:
          v134 = objc_claimAutoreleasedReturnValue();
          goto LABEL_154;
        }
LABEL_155:
        if (v15)
          goto LABEL_246;
        v135 = DERDecodeSeqNext((unint64_t *)&v201, (unint64_t *)&v212);
        if ((_DWORD)v135 != 1)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 710, v50, -1, 0, CFSTR("DER sequence is invalid: %d"), v136, v137, v135);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_246;
        }
        v205 = 0uLL;
        v201 = 0uLL;
        v212 = 0;
        v213 = 0;
        v214[0] = 0;
        v45 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
        v15 = 0;
        if (!(_DWORD)v45)
        {
          v49 = *((_QWORD *)&v195 + 1);
          v23 = (void *)v48;
          if (*((_QWORD *)&v195 + 1))
            continue;
        }
        goto LABEL_224;
      }
      createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 503, v50, -1, 0, CFSTR("Failed to parse DER integer: %d"), v52, v53, v55);
      goto LABEL_238;
    }
    v142 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
    v23 = 0;
    v181 = a3;
    v183 = v11;
    if ((_DWORD)v142 || !*((_QWORD *)&v195 + 1))
    {
      v24 = 0;
      v25 = 0;
LABEL_228:
      if ((_DWORD)v142 != 1)
      {
        createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 299, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode DER sequence: %d"), v143, v144, v142);
        v167 = objc_claimAutoreleasedReturnValue();

        v15 = (id)v167;
      }
      goto LABEL_247;
    }
    v25 = 0;
    v24 = 0;
    v23 = 0;
    while (1)
    {
      v145 = v23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)v195 & 0x5FFFFFFFFFFFFFFFLL);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!DERDecodeItem((uint64_t)&v195 + 8, (unint64_t *)&v193))
      {
        v195 = v193;
        v196 = v194;
      }
      v147 = v195 & 0x5FFFFFFFFFFFFFFFLL;
      if ((v195 & 0x5FFFFFFFFFFFFFFFLL) == 1)
      {
        v153 = DERParseBoolean((unsigned __int8 **)&v195 + 1, &v190);
        if ((_DWORD)v153)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 353, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode DER encoded ASN1_BOOLEAN: %d"), v154, v155, v153);
          goto LABEL_206;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v190);
        v164 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v147 != 2)
        {
          if (v147 != 4)
            goto LABEL_217;

          if (v196)
          {
            v148 = 0;
            v149 = 0;
            while ((*(char *)(*((_QWORD *)&v195 + 1) + v148) & 0x80000000) == 0)
            {
              v148 = ++v149;
              if (v196 <= v149)
              {
                v150 = objc_alloc(MEMORY[0x1E0CB3940]);
                v25 = (void *)objc_msgSend(v150, "initWithBytes:length:encoding:", *((_QWORD *)&v195 + 1), v196, 1);
                if (v25)
                {
                  v24 = 0;
                  goto LABEL_210;
                }
                createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 326, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode DER encoded ANS1_OCTET_STRING."), v151, v152, v174);
                v159 = objc_claimAutoreleasedReturnValue();

                v24 = 0;
                goto LABEL_207;
              }
            }
          }
          v160 = objc_alloc(MEMORY[0x1E0C99D50]);
          v24 = (void *)objc_msgSend(v160, "initWithBytes:length:", *((_QWORD *)&v195 + 1), v196);
          if (v24)
          {
            v25 = 0;
LABEL_210:
            if (v25)
              v163 = v25;
            else
              v163 = v24;
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v163, v23);
            goto LABEL_217;
          }
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 332, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode DER encoded ANS1_OCTET_STRING."), v161, v162, v174);
          v159 = objc_claimAutoreleasedReturnValue();

          v25 = 0;
          goto LABEL_207;
        }
        v156 = DERParseInteger64((char **)&v195 + 1, &v191);
        if ((_DWORD)v156)
        {
          createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 343, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode DER encoded ASN1_INTEGER: %d"), v157, v158, v156);
LABEL_206:
          v159 = objc_claimAutoreleasedReturnValue();

LABEL_207:
          v15 = (id)v159;
          goto LABEL_217;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v191);
        v164 = objc_claimAutoreleasedReturnValue();
      }
      v165 = (void *)v164;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v164, v23);

LABEL_217:
      v142 = DERDecodeSeqNext(v197, (unint64_t *)&v195);
      if ((_DWORD)v142 || !*((_QWORD *)&v195 + 1))
        goto LABEL_228;
    }
  }
LABEL_179:
  createMobileActivationError((uint64_t)"lockcrypto_query_certificate_properties", 245, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v15, CFSTR("Failed to query DERSequence data for OID %@."), v12, v13, (uint64_t)v8);
  v22 = objc_claimAutoreleasedReturnValue();

  v16 = 0;
LABEL_180:
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v15 = (id)v22;
LABEL_181:
  if (v15)
  {
LABEL_182:

LABEL_183:
    v11 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v15);
  }
  else
  {
    if (!v11)
      goto LABEL_183;
    if (!objc_msgSend(v11, "count"))
      goto LABEL_182;
  }
  v140 = v11;

  return v140;
}

id lockcrypto_decode_pem(void *a1, const char *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  size_t v12;
  int v13;
  char *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char __little[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char __str[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v8 = v5;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  *(_OWORD *)__str = 0u;
  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)__little = 0u;
  v28 = 0u;
  if (!v5 || !a2)
  {
    v22 = CFSTR("Invalid inputs.");
    v23 = 1489;
    v24 = -2;
    goto LABEL_12;
  }
  v9 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");
  if (v11 < 0)
  {
    v22 = CFSTR("Invalid data length.");
    v23 = 1496;
LABEL_11:
    v24 = -1;
LABEL_12:
    createMobileActivationError((uint64_t)"lockcrypto_decode_pem", v23, CFSTR("com.apple.MobileActivation.ErrorDomain"), v24, 0, v22, v6, v7, v26);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!a3)
    {
LABEL_15:
      v20 = 0;
      goto LABEL_16;
    }
LABEL_13:
    v21 = objc_retainAutorelease(v21);
    v20 = 0;
    *a3 = v21;
    goto LABEL_16;
  }
  v12 = v11;
  v13 = snprintf(__str, 0x50uLL, "-----BEGIN %s-----\n", a2);
  snprintf(__little, 0x50uLL, "\n-----END %s-----", a2);
  v14 = strnstr(v10, __str, v12);
  v15 = strnstr(v10, __little, v12);
  if (!v14 || !v15)
  {
    v22 = CFSTR("Invalid pem data.");
    v23 = 1505;
    goto LABEL_11;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &v14[v13], v15 - &v14[v13], 0);
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v16, 1);
  if (!v17)
  {
    createMobileActivationError((uint64_t)"lockcrypto_decode_pem", 1516, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode data."), v18, v19, v26);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_15;
    goto LABEL_13;
  }
  v20 = (void *)v17;
  v21 = 0;
LABEL_16:

  return v20;
}

SecCertificateRef lockcrypto_cert_from_pem_data(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFData *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  SecCertificateRef v11;
  SecCertificateRef v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  id v19;

  v3 = a1;
  v6 = v3;
  if (!v3)
  {
    createMobileActivationError((uint64_t)"lockcrypto_cert_from_pem_data", 1734, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v4, v5, v18);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a2)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
LABEL_6:
    v10 = objc_retainAutorelease(v10);
    v12 = 0;
    *a2 = v10;
    goto LABEL_11;
  }
  v19 = 0;
  lockcrypto_decode_pem(v3, "CERTIFICATE", &v19);
  v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (!v7)
  {
    v13 = CFSTR("Failed to decode data.");
    v14 = 1740;
    v15 = v10;
    goto LABEL_9;
  }
  v11 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
  if (!v11)
  {
    v13 = CFSTR("Failed to create certificate with cert data.");
    v14 = 1746;
    v15 = 0;
LABEL_9:
    createMobileActivationError((uint64_t)"lockcrypto_cert_from_pem_data", v14, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v15, v13, v8, v9, v18);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v16;
    if (!a2)
      goto LABEL_10;
    goto LABEL_6;
  }
  v12 = v11;
LABEL_11:

  return v12;
}

void __lockcrypto_query_oid_der_sequence_data_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &unk_1D4F7DB60, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lockcrypto_query_oid_der_sequence_data_ASN1DERNull;
  lockcrypto_query_oid_der_sequence_data_ASN1DERNull = v0;

}

id DeviceIdentityCopyAttestationDictionary(__SecKey *a1, void *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  char has_host_key;
  id *v10;
  char valid;
  __SecTask *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  __SecKey *v42;
  __SecKey *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  CFErrorRef v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  CFErrorRef v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  CFErrorRef v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  CFTypeID v74;
  unsigned int v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  __SecKey *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  id *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  CFDataRef v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  __CFString *v109;
  __SecTask *task;
  id v112;
  _QWORD v113[6];
  _QWORD v114[5];
  id v115;
  id v116;
  id v117;
  id obj;
  char v119;
  CFErrorRef error;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t (*v130)(uint64_t, uint64_t);
  void (*v131)(uint64_t);
  id v132;
  const __CFString *v133;
  uint64_t v134;
  const __CFString *v135;
  uint64_t v136;
  const __CFString *v137;
  _QWORD v138[3];

  v138[1] = *MEMORY[0x1E0C80C00];
  v106 = a2;
  v127 = 0;
  v128 = &v127;
  v129 = 0x3032000000;
  v130 = __Block_byref_object_copy_;
  v131 = __Block_byref_object_dispose_;
  v132 = 0;
  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = __Block_byref_object_copy_;
  v125 = __Block_byref_object_dispose_;
  v126 = 0;
  error = 0;
  v119 = 0;
  if (is_virtual_machine())
  {
    v8 = (id *)(v122 + 5);
    obj = (id)v122[5];
    has_host_key = libavp_guest_has_host_key(&obj);
    objc_storeStrong(v8, obj);
    if ((has_host_key & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 354, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, (void *)v122[5], CFSTR("Not supported on this device (VM support disabled)."), v6, v7, v102);
      v37 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
  }
  if (!a1
    || (v10 = (id *)(v122 + 5),
        v117 = (id)v122[5],
        valid = security_valid_security_enclave_reference_key(a1, 0, &v119, &v117, v4, v5, v6, v7),
        objc_storeStrong(v10, v117),
        (valid & 1) == 0))
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 359, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, (void *)v122[5], CFSTR("Invalid reference key."), v6, v7, v102);
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_32:
    v38 = 0;
    v39 = 0;
    v107 = 0;
    v108 = 0;
    v104 = 0;
    v105 = 0;
    v109 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    task = 0;
LABEL_33:
    v44 = 0;
    goto LABEL_34;
  }
  v12 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  task = v12;
  if (!v12)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 365, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create task."), v13, v14, v102);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v109 = (__CFString *)SecTaskCopySigningIdentifier(v12, &error);
  if (!v109)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 371, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to query code signing identifier."), v15, v16, v102);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = 0;
    v107 = 0;
    v108 = 0;
    v104 = 0;
    v109 = 0;
LABEL_51:
    v40 = 0;
    v41 = 0;
    v105 = 0;
LABEL_52:
    v42 = 0;
    v43 = 0;
    goto LABEL_33;
  }
  v108 = (void *)SecTaskCopyValueForEntitlement(task, CFSTR("com.apple.mobileactivationd.spi"), &error);
  isNSNumber(v108);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17 || (v18 = objc_msgSend(v108, "BOOLValue"), v17, (v18 & 1) == 0))
  {
    v51 = error;
    v137 = CFSTR("com.apple.mobileactivationd.spi");
    v138[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, &v137, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 377, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, v51, CFSTR("Missing required entitlement: %@"), v52, v53, (uint64_t)v46);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v122[5];
    v122[5] = v54;

    v38 = 0;
    v39 = 0;
    v107 = 0;
    v104 = 0;
    v105 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    goto LABEL_36;
  }
  v107 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v107)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 383, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."), v19, v20, v102);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = 0;
    v107 = 0;
    v104 = 0;
    goto LABEL_51;
  }
  if (v106)
    objc_msgSend(v107, "addEntriesFromDictionary:", v106);
  if (is_virtual_machine())
    objc_msgSend(v107, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("scrtAttestation"));
  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isNSArray(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v105 = 0;
LABEL_57:
    objc_msgSend(v107, "objectForKeyedSubscript:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
      goto LABEL_67;
    if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 432, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Option (%@) not allowed for processes running in recoveryOS or diagnostics mode."), v62, v63, (uint64_t)CFSTR("AccessControls"));
      v37 = objc_claimAutoreleasedReturnValue();
LABEL_87:
      v38 = 0;
      v39 = 0;
      v104 = 0;
      v40 = 0;
      v41 = 0;
      goto LABEL_52;
    }
    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 437, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("ACLs (%@) not supported with %@."), v66, v67, (uint64_t)CFSTR("AccessControls"));
      v37 = objc_claimAutoreleasedReturnValue();
      goto LABEL_87;
    }
    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("AccessControls"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = CFGetTypeID(v73);
    LODWORD(v74) = v74 == SecAccessControlGetTypeID();

    if ((_DWORD)v74)
    {
      objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("AccessControls"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      CFRetain(v44);
      v75 = 1;
    }
    else
    {
LABEL_67:
      v44 = 0;
      v75 = 0;
    }
    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("AppID"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("AppID"));
      v78 = objc_claimAutoreleasedReturnValue();

      v109 = (__CFString *)v78;
    }
    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("UseXPC"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    isNSNumber(v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("UseXPC"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v80) = objc_msgSend(v81, "BOOLValue");

    }
    if (v119)
      v82 = 1;
    else
      v82 = v75;
    v42 = (__SecKey *)CFRetain(a1);
    v83 = SecKeyCopyPublicKey(v42);
    v43 = v83;
    if (v83)
    {
      v104 = SecKeyCopyExternalRepresentation(v83, &error);
      if (v104)
      {
        v91 = (id *)(v122 + 5);
        v115 = (id)v122[5];
        v116 = 0;
        security_create_external_representation(v42, &v116, &v115, v86, v87, v88, v89, v90);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v116;
        objc_storeStrong(v91, v115);
        if (v41)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v82);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "setObject:forKeyedSubscript:", v94, CFSTR("UseRKSigningInterface"));

          objc_msgSend(v107, "setObject:forKeyedSubscript:", v109, CFSTR("AppID"));
          objc_msgSend(v107, "setObject:forKeyedSubscript:", v40, CFSTR("SigningKeyAttributes"));
          if ((_DWORD)v80)
          {
            objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF012B8);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileactivationd"), 0);
            objc_msgSend(v38, "setRemoteObjectInterface:", v45);
            objc_msgSend(v38, "resume");
            v39 = (void *)objc_msgSend(v107, "mutableCopy");
            objc_msgSend(v39, "objectForKey:", CFSTR("AccessControls"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();

            if (v95)
            {
              objc_msgSend(v39, "removeObjectForKey:", CFSTR("AccessControls"));
              objc_msgSend(v39, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("UseRKSigningInterface"));
            }
            objc_msgSend(v39, "removeObjectForKey:", CFSTR("LocalAuthenticationContext"));
            v114[0] = MEMORY[0x1E0C809B0];
            v114[1] = 3221225472;
            v114[2] = __DeviceIdentityCopyAttestationDictionary_block_invoke;
            v114[3] = &unk_1E98C7E70;
            v114[4] = &v121;
            objc_msgSend(v38, "synchronousRemoteObjectProxyWithErrorHandler:", v114);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v113[0] = MEMORY[0x1E0C809B0];
            v113[1] = 3221225472;
            v113[2] = __DeviceIdentityCopyAttestationDictionary_block_invoke_2;
            v113[3] = &unk_1E98C7E98;
            v113[4] = &v127;
            v113[5] = &v121;
            objc_msgSend(v96, "copyAttestationDictionaryWithCompletionBlock:options:completion:", v41, v39, v113);
            objc_msgSend(v38, "invalidate");
          }
          else
          {
            v97 = (id *)(v122 + 5);
            v112 = (id)v122[5];
            create_baa_info(v42, v107, &v112);
            v98 = objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v97, v112);
            v38 = 0;
            v39 = 0;
            v45 = 0;
            v96 = (void *)v128[5];
            v128[5] = v98;
          }

          v101 = (void *)v128[5];
          if (v101)
          {
            v47 = v101;
LABEL_39:
            CFRelease(task);
            v48 = v47;
            goto LABEL_40;
          }
          createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 548, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)v122[5], CFSTR("Failed to copy certificate info."), v99, v100, v102);
          v37 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 486, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)v122[5], CFSTR("Failed to encode RK as data."), v92, v93, v102);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v39 = 0;
      }
      else
      {
        createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 480, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to encode RK public key as data."), v89, v90, v102);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v39 = 0;
        v104 = 0;
        v40 = 0;
      }
      v41 = 0;
    }
    else
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 474, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK public key."), v84, v85, v102);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v39 = 0;
      v104 = 0;
      v40 = 0;
      v41 = 0;
      v43 = 0;
    }
LABEL_34:
    v45 = 0;
LABEL_35:
    v46 = (void *)v122[5];
    v122[5] = v37;
    goto LABEL_36;
  }
  v23 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend(v23, "initWithArray:", v24);

  if ((objc_msgSend(v105, "containsObject:", CFSTR("1.2.840.113635.100.10.1")) & 1) == 0
    && (objc_msgSend(v105, "containsObject:", CFSTR("1.2.840.113635.100.8.1")) & 1) == 0
    && !objc_msgSend(v105, "containsObject:", CFSTR("1.2.840.113635.100.8.3")))
  {
    goto LABEL_21;
  }
  v103 = (void *)SecTaskCopyValueForEntitlement(task, CFSTR("com.apple.mobileactivationd.device-identifiers"), &error);

  isNSNumber(v103);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = objc_msgSend(v103, "BOOLValue");

    if ((v26 & 1) != 0)
    {
      v108 = v103;
LABEL_21:
      copy_supported_eda_oids();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v105, "intersectsSet:", v27);

      if (!v28)
      {
LABEL_26:
        if (objc_msgSend(v105, "containsObject:", CFSTR("1.2.840.113635.100.8.6")))
        {
          objc_msgSend(v107, "objectForKeyedSubscript:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33 == 0;

          if (v34)
          {
            createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 425, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing required option: %@"), v35, v36, (uint64_t)CFSTR("AccessControls"));
            v37 = objc_claimAutoreleasedReturnValue();
            goto LABEL_87;
          }
        }
        goto LABEL_57;
      }
      if ((device_supports_eda_certificates() & 1) == 0)
      {
        createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 413, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, (void *)v122[5], CFSTR("Enterprise Device Attestation is not supported on this device."), v29, v30, v102);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_87;
      }
      v103 = (void *)SecTaskCopyValueForEntitlement(task, CFSTR("com.apple.mobileactivationd.eda"), &error);

      isNSNumber(v103);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = objc_msgSend(v103, "BOOLValue");

        if ((v32 & 1) != 0)
        {
          v108 = v103;
          goto LABEL_26;
        }
      }
      v68 = error;
      v133 = CFSTR("com.apple.mobileactivationd.eda");
      v134 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 419, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, v68, CFSTR("Missing required entitlement: %@"), v69, v70, (uint64_t)v46);
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)v122[5];
      v122[5] = v71;

      goto LABEL_55;
    }
  }
  v56 = error;
  v135 = CFSTR("com.apple.mobileactivationd.device-identifiers");
  v136 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary", 406, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, v56, CFSTR("Missing required entitlement: %@"), v57, v58, (uint64_t)v46);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v122[5];
  v122[5] = v59;

LABEL_55:
  v38 = 0;
  v39 = 0;
  v104 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v108 = v103;
LABEL_36:

  if (a3)
    *a3 = objc_retainAutorelease((id)v122[5]);
  v47 = 0;
  v48 = 0;
  if (task)
    goto LABEL_39;
LABEL_40:
  if (v42)
    CFRelease(v42);
  if (v43)
    CFRelease(v43);
  if (error)
    CFRelease(error);
  error = 0;
  if (v44)
    CFRelease(v44);
  v49 = v48;

  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v127, 8);

  return v49;
}

void sub_1D4F66BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id DeviceIdentityCreateClientCertificateRequest(CFTypeRef *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  char has_host_key;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  __SecKey *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  _QWORD *v48;
  void *v49;
  id v50;
  uint64_t v52;
  void *v53;
  id v54;
  CFTypeRef *v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  CFTypeRef cf;

  v5 = a2;
  cf = 0;
  v6 = 0;
  if (is_virtual_machine())
  {
    v62 = 0;
    has_host_key = libavp_guest_has_host_key(&v62);
    v6 = v62;
    if ((has_host_key & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 591, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, v6, CFSTR("Not supported on this device (VM support disabled)."), v8, v9, v52);
      v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v18 = 0;
      if (!a3)
        goto LABEL_40;
      goto LABEL_38;
    }
  }
  v61 = v6;
  v10 = isSupportedDeviceIdentityClient(0, &v61);
  v11 = v61;

  if ((v10 & 1) == 0)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 596, CFSTR("com.apple.MobileActivation.ErrorDomain"), -25, v11, CFSTR("Client is not supported."), v12, v13, v52);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClientAttestationData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v18 = (const void *)SecAccessControlCreate();
    if (!v18)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 608, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)cf, CFSTR("Failed to create access control."), v16, v17, v52);
LABEL_16:
      v22 = (id)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      if (!a3)
        goto LABEL_40;
      goto LABEL_38;
    }
    v19 = *MEMORY[0x1E0CD68D8];
    if ((SecAccessControlSetProtection() & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 613, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)cf, CFSTR("Failed to set ACL protection to %@."), v20, v21, v19);
      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UseSoftwareGeneratedKey"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UseSoftwareGeneratedKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

  }
  else
  {
    v32 = 1;
  }
  v60 = v11;
  v28 = (__SecKey *)createReferenceKeyBlob(v18, v32, v5, &v60);
  v33 = v60;

  if (!v28)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 626, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v33, CFSTR("Failed to create reference key."), v34, v35, v52);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    goto LABEL_33;
  }
  v59 = v33;
  DeviceIdentityCopyAttestationDictionary(v28, v5, &v59);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v59;

  if (!v23)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 632, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v36, CFSTR("Failed to copy certificate info."), v37, v38, v52);
    v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    if (!a3)
      goto LABEL_40;
    goto LABEL_38;
  }
  v55 = a1;
  +[GestaltHlprDeviceIdentity getSharedInstance](GestaltHlprDeviceIdentity, "getSharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v39, "copyAnswer:", CFSTR("UniqueDeviceID"));

  v57 = v36;
  v58 = 0;
  v40 = createXMLRequest(v23, &v58, &v57);
  v24 = v58;
  v22 = v57;

  if ((v40 & 1) == 0)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 648, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v22, CFSTR("Failed to create XML request."), v41, v42, v52);
    v56 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v26 = 0;
    goto LABEL_37;
  }
  v54 = objc_alloc(MEMORY[0x1E0CB3940]);
  copy_calling_process_name();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v54, "initWithFormat:", CFSTR("%@ - %@"));

  if (!v26)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateClientCertificateRequest", 654, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create user agent string."), v43, v44, (uint64_t)CFSTR("iOS Device Activator (MobileActivation-1006)"));
    v56 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
LABEL_37:
    v22 = (id)v56;
    if (!a3)
      goto LABEL_40;
    goto LABEL_38;
  }
  objc_msgSend(v24, "setValue:forHTTPHeaderField:", v26, CFSTR("User-Agent"));
  isNSString(v27);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    objc_msgSend(v24, "setValue:forHTTPHeaderField:", v27, CFSTR("x-jmet-deviceid"));
  v46 = (void *)MEMORY[0x1E0C99E98];
  v47 = is_virtual_machine();
  v48 = &VMBAA_URL;
  if (!v47)
    v48 = &BAA_URL;
  objc_msgSend(v46, "URLWithString:", *v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setURL:", v49);

  if (v55)
    *v55 = CFRetain(v28);
  v24 = v24;
  v25 = v24;
  if (a3)
  {
LABEL_38:
    if (!v25)
      *a3 = objc_retainAutorelease(v22);
  }
LABEL_40:
  if (v28)
    CFRelease(v28);
  if (v18)
    CFRelease(v18);
  if (cf)
    CFRelease(cf);
  v50 = v25;

  return v50;
}

void DeviceIdentityIssueClientCertificateWithCompletion(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  char v11;
  id *v12;
  char has_host_key;
  NSObject *v14;
  id *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[2];
  id obj;
  _QWORD block[4];
  _QWORD v25[2];
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v8 = v5;
  v9 = v8;
  if (!v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = v28;
  v26 = v28[5];
  v11 = isSupportedDeviceIdentityClient(0, &v26);
  objc_storeStrong(v10 + 5, v26);
  if ((v11 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke;
    block[3] = &unk_1E98C7EC0;
    v25[1] = &v27;
    v15 = (id *)v25;
    v25[0] = v7;
    v16 = block;
LABEL_8:
    dispatch_async(v9, v16);
    goto LABEL_9;
  }
  if (is_virtual_machine())
  {
    v12 = v28;
    obj = v28[5];
    has_host_key = libavp_guest_has_host_key(&obj);
    objc_storeStrong(v12 + 5, obj);
    if ((has_host_key & 1) == 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_143;
      v21[3] = &unk_1E98C7EC0;
      v22[1] = &v27;
      v15 = (id *)v22;
      v22[0] = v7;
      v16 = v21;
      goto LABEL_8;
    }
  }
  copyDeviceIdentitySerialQueue();
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __DeviceIdentityIssueClientCertificateWithCompletion_block_invoke_144;
  v17[3] = &unk_1E98C7F88;
  v15 = (id *)v20;
  v20[0] = v7;
  v20[1] = &v27;
  v18 = v6;
  v19 = v9;
  dispatch_async(v14, v17);

LABEL_9:
  _Block_object_dispose(&v27, 8);

}

void sub_1D4F674DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id copyDeviceIdentitySerialQueue()
{
  if (copyDeviceIdentitySerialQueue_onceToken != -1)
    dispatch_once(&copyDeviceIdentitySerialQueue_onceToken, &__block_literal_global_2);
  return (id)copyDeviceIdentitySerialQueue_queue;
}

void sub_1D4F6A70C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x330], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Block_object_dispose(&STACK[0x380], 8);
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Block_object_dispose(&STACK[0x3E0], 8);
  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x4A8], 8);
  _Block_object_dispose(&STACK[0x4C8], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Block_object_dispose(&STACK[0x570], 8);
  _Block_object_dispose(&STACK[0x5A0], 8);
  _Unwind_Resume(a1);
}

BOOL isAutomaticTimeEnabledWithError(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF012B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileactivationd"), 4096);
  objc_msgSend(v3, "setRemoteObjectInterface:", v2);
  objc_msgSend(v3, "resume");
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __isAutomaticTimeEnabledWithError_block_invoke;
  v10[3] = &unk_1E98C7E70;
  v10[4] = &v15;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __isAutomaticTimeEnabledWithError_block_invoke_2;
  v9[3] = &unk_1E98C7E98;
  v9[4] = &v11;
  v9[5] = &v15;
  objc_msgSend(v5, "copyAutomaticTimeEnabledWithCompletion:", v9);
  v6 = (void *)v16[5];
  if (v6)
  {
    v7 = 0;
    if (!a1)
      goto LABEL_7;
  }
  else
  {
    v7 = *((_BYTE *)v12 + 24) != 0;
    if (!a1)
      goto LABEL_7;
  }
  if (!v7)
    *a1 = objc_retainAutorelease(v6);
LABEL_7:
  objc_msgSend(v3, "invalidate");

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void sub_1D4F6A9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

double copyMonotonicClock(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF012B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileactivationd"), 4096);
  objc_msgSend(v3, "setRemoteObjectInterface:", v2);
  objc_msgSend(v3, "resume");
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __copyMonotonicClock_block_invoke;
  v10[3] = &unk_1E98C7E70;
  v10[4] = &v15;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __copyMonotonicClock_block_invoke_2;
  v9[3] = &unk_1E98C7E98;
  v9[4] = &v11;
  v9[5] = &v15;
  objc_msgSend(v5, "copyMonotonicClockWithCompletionBlock:", v9);
  v6 = (void *)v16[5];
  v7 = 0.0;
  if (!v6)
    v7 = v12[3];
  if (a1 && v7 == 0.0)
    *a1 = objc_retainAutorelease(v6);
  objc_msgSend(v3, "invalidate");

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void sub_1D4F6AB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t copyRTCResetCountWithError(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF012B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobileactivationd"), 4096);
  objc_msgSend(v3, "setRemoteObjectInterface:", v2);
  objc_msgSend(v3, "resume");
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __copyRTCResetCountWithError_block_invoke;
  v10[3] = &unk_1E98C7E70;
  v10[4] = &v15;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __copyRTCResetCountWithError_block_invoke_2;
  v9[3] = &unk_1E98C7E98;
  v9[4] = &v11;
  v9[5] = &v15;
  objc_msgSend(v5, "copyRTCResetCountWithCompletionBlock:", v9);
  v6 = (void *)v16[5];
  if (v6)
  {
    v7 = 0;
    if (!a1)
      goto LABEL_7;
  }
  else
  {
    v7 = *((unsigned int *)v12 + 6);
    if (!a1)
      goto LABEL_7;
  }
  if (!(_DWORD)v7)
    *a1 = objc_retainAutorelease(v6);
LABEL_7:
  objc_msgSend(v3, "invalidate");

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void sub_1D4F6AD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id copyCertificateOIDsThatDiffer(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (copyCertificateOIDsThatDiffer_onceToken != -1)
      dispatch_once(&copyCertificateOIDsThatDiffer_onceToken, &__block_literal_global_260);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend((id)copyCertificateOIDsThatDiffer_supportedOIDs, "containsObject:", v9))
          {
            v10 = (void *)SecCertificateCopyExtensionValue();

            if (!v10)
              objc_msgSend(v3, "addObject:", v9);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v6);
    }
    v22 = v2;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (id)copyCertificateOIDsThatDiffer_supportedOIDs;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          v17 = SecCertificateCopyExtensionValue();
          if (v17)
          {
            v18 = (void *)v17;
            v19 = objc_msgSend(v4, "containsObject:", v16);

            if ((v19 & 1) == 0)
              objc_msgSend(v3, "addObject:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v13);
    }

    v20 = v3;
    v2 = v22;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t isFactoryMFiCertificate(void *a1, uint64_t a2)
{
  void *v2;
  const void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  if (!a2)
    return 0;
  if (!objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.mfiaccessory")))
    return 0;
  v2 = (void *)SecCertificateCopyIssuerSummary();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("Apple Accessory Host Attestation Authority - 00000002"));
  CFRelease(v3);
  return v4;
}

id DeviceIdentityCreateHostSignature(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char has_host_key;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v10 = a2;
  if (!v7)
  {
    v22 = CFSTR("Invalid input.");
    v23 = 1735;
    v24 = -2;
LABEL_10:
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignature", v23, CFSTR("com.apple.MobileActivation.ErrorDomain"), v24, 0, v22, v8, v9, v27);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = 0;
    v21 = 0;
    goto LABEL_12;
  }
  if (!is_virtual_machine())
  {
    v22 = CFSTR("Device is not a VM (not supported).");
    v23 = 1740;
    v24 = -3;
    goto LABEL_10;
  }
  v30 = 0;
  has_host_key = libavp_guest_has_host_key(&v30);
  v12 = v30;
  v15 = v12;
  if ((has_host_key & 1) == 0)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignature", 1745, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, v12, CFSTR("Not supported on this device (VM support disabled)."), v13, v14, v27);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v28 = v12;
  v29 = 0;
  vm_create_host_key_signature(v7, 0, &v29, &v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v29;
  v18 = v28;

  if (v16)
  {
    v21 = v16;
    if (a3)
    {
      v17 = objc_retainAutorelease(v17);
      *a3 = v17;
      if (!v18)
        goto LABEL_15;
      goto LABEL_13;
    }
LABEL_12:
    if (!v18)
      goto LABEL_15;
    goto LABEL_13;
  }
  createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignature", 1751, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v18, CFSTR("Failed to create host key signature."), v19, v20, v27);
  v26 = objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v18 = (id)v26;
  if (!v26)
    goto LABEL_15;
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
LABEL_15:
  if (a4 && !v21)
    *a4 = objc_retainAutorelease(v18);

  return v21;
}

void DeviceIdentityCreateHostSignatureWithCompletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  char has_host_key;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id obj;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v12 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  if (v8)
  {
    if (is_virtual_machine())
    {
      v15 = (id *)(v31 + 5);
      obj = (id)v31[5];
      has_host_key = libavp_guest_has_host_key(&obj);
      objc_storeStrong(v15, obj);
      if ((has_host_key & 1) != 0)
      {
        v19 = v7;
        if (!v19)
        {
          dispatch_get_global_queue(0, 0);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __DeviceIdentityCreateHostSignatureWithCompletion_block_invoke;
        block[3] = &unk_1E98C7FB0;
        v25 = v8;
        v26 = v9;
        v28 = &v30;
        v27 = v12;
        dispatch_async(v19, block);

        goto LABEL_15;
      }
      createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion", 1792, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, (void *)v31[5], CFSTR("Not supported on this device (VM support disabled)."), v17, v18, v23);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion", 1787, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is not a VM (not supported)."), v13, v14, v23);
      v20 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"DeviceIdentityCreateHostSignatureWithCompletion", 1782, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v10, v11, v23);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v31[5];
  v31[5] = v20;

  if (v31[5] && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v22 = v31[5];
    *(_DWORD *)buf = 138543362;
    v37 = v22;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (v12)
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v12 + 2))(v12, 0, 0, v31[5]);
LABEL_15:
  _Block_object_dispose(&v30, 8);

}

void sub_1D4F6CC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __copyDeviceIdentitySerialQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mobileactivationd.deviceidentity", v2);
  v1 = (void *)copyDeviceIdentitySerialQueue_queue;
  copyDeviceIdentitySerialQueue_queue = (uint64_t)v0;

}

void __isAutomaticTimeEnabledWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  createMobileActivationError((uint64_t)"isAutomaticTimeEnabledWithError_block_invoke", 232, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("IPC Error."), a7, a8, v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __isAutomaticTimeEnabledWithError_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AutomaticTimeEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AutomaticTimeEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "BOOLValue");

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __copyMonotonicClock_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  createMobileActivationError((uint64_t)"copyMonotonicClock_block_invoke", 185, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("IPC Error."), a7, a8, v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __copyMonotonicClock_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MonotonicClockNow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MonotonicClockNow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

void __copyRTCResetCountWithError_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  createMobileActivationError((uint64_t)"copyRTCResetCountWithError_block_invoke", 138, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("IPC Error."), a7, a8, v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __copyRTCResetCountWithError_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TotalRTCResetCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TotalRTCResetCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "unsignedIntValue");

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

void __copyCertificateOIDsThatDiffer_block_invoke()
{
  uint64_t v0;
  void *v1;

  copy_supported_baa_oids();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)copyCertificateOIDsThatDiffer_supportedOIDs;
  copyCertificateOIDsThatDiffer_supportedOIDs = v0;

}

id copy_group_container_path(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (!a1)
    return 0;
  v1 = container_system_group_path_for_identifier();
  if (!v1)
    return 0;
  v2 = (void *)v1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  free(v2);
  return v3;
}

id copy_ucrt_path()
{
  if (copy_ucrt_path_onceToken != -1)
    dispatch_once(&copy_ucrt_path_onceToken, &__block_literal_global_39);
  return (id)copy_ucrt_path_retval;
}

void __copy_ucrt_path_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  copy_group_container_path(objc_msgSend(CFSTR("systemgroup.com.apple.mobileactivationd"), "UTF8String"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/ucrt"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)copy_ucrt_path_retval;
    copy_ucrt_path_retval = v1;

    v0 = v3;
  }

}

id copyPersonalizedFirmwareData(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  id v20;

  if (!getMSUDataAccessorClass())
  {
    createMobileActivationError((uint64_t)"copyPersonalizedFirmwareData", 29, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("MSUDataAccessor is not supported on this platform."), v4, v5, v18);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a2)
      goto LABEL_10;
    goto LABEL_8;
  }
  objc_msgSend(getMSUDataAccessorClass(), "sharedDataAccessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v7 = (void *)objc_msgSend(v6, "copyPathForPersonalizedData:error:", a1, &v20);
  v8 = v20;

  if (!v7)
  {
    createMobileActivationError((uint64_t)"copyPersonalizedFirmwareData", 35, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v8, CFSTR("Failed to retrieve path for firmware data type %d."), v9, v10, a1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!a2)
    {
LABEL_10:
      v15 = 0;
      goto LABEL_11;
    }
LABEL_8:
    v12 = objc_retainAutorelease(v12);
    v15 = 0;
    *a2 = v12;
    goto LABEL_11;
  }
  v19 = v8;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 0, &v19);
  v12 = v19;

  if (!v11)
  {
    createMobileActivationError((uint64_t)"copyPersonalizedFirmwareData", 41, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v12, CFSTR("Failed to load firmware data from %@."), v13, v14, (uint64_t)v7);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v16;
    if (!a2)
      goto LABEL_10;
    goto LABEL_8;
  }
  v15 = v11;
LABEL_11:

  return v15;
}

id getMSUDataAccessorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMSUDataAccessorClass_softClass;
  v7 = getMSUDataAccessorClass_softClass;
  if (!getMSUDataAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMSUDataAccessorClass_block_invoke;
    v3[3] = &unk_1E98C7E30;
    v3[4] = &v4;
    __getMSUDataAccessorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4F6D7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMSUDataAccessorClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!MSUDataAccessorLibraryCore_frameworkLibrary)
    MSUDataAccessorLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("MSUDataAccessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMSUDataAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id createMobileActivationError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = a3;
  v15 = a5;
  v16 = (objc_class *)MEMORY[0x1E0CB37A0];
  v17 = a6;
  v18 = (void *)objc_msgSend([v16 alloc], "initWithFormat:arguments:", v17, &a9);

  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = v19;
  if (v18)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CB2D50]);
  if (v15)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("FunctionName"));

    }
    if ((_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("SourceLine"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v14, a4, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id copyRootCertificate(uint64_t a1, int a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v9;
  const char *v10;
  unsigned int *v11;
  unsigned int *v12;
  id v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  switch((int)a1)
  {
    case 1:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICGDCCAZ+gAwIBAgIIMyDS5tjDo60wCgYIKoZIzj0EAwMwUjEmMCQGA1UEAwwd\n"
              "VEVTVCBVQ1JUIEFUVEVTVEFUSU9OIFJPT1QgQ0ExEzARBgNVBAoMCkFwcGxlIElu\n"
              "Yy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcNMTcwMzE3MTg0NzIzWhcNMzIwMzE3\n"
              "MTg0NzIzWjBSMSYwJAYDVQQDDB1URVNUIFVDUlQgQVRURVNUQVRJT04gUk9PVCBD\n"
              "QTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAG\n"
              "ByqGSM49AgEGBSuBBAAiA2IABK8j8XvaJOsMr8X6albKQ1LFlMi3k+b8Jooja8Qs\n"
              "0lsrRmax8FItjsoWcxj3c1sPjPF59FI2sCb+9cUZ8KgTeJ3b5748pO1XRGByMNHp\n"
              "tmIuLYRvqRHhkWl638PWGRUoYKNCMEAwHQYDVR0OBBYEFGnDBpAIQSifJVW2RWKm\n"
              "f6jT3iIXMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49\n"
              "BAMDA2cAMGQCMBFwSHXop87Ghm50PPMGFHtpB/o3K2Gx5747Q0mlR2qE0DsmrJSu\n"
              "2LO+9QEQL5HZRwIwBMg0g5oYcfMMDWwFSRESii+SqHxFgbmVuzHR5Cu0peL1MiMB\n"
              "nMjKoG3YyhB4geQ9\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICGjCCAaGgAwIBAgIIO0EdkA1/e+swCgYIKoZIzj0EAwMwUzEnMCUGA1UEAwwe\n"
              "QmFzaWMgQXR0ZXN0YXRpb24gVXNlciBSb290IENBMRMwEQYDVQQKDApBcHBsZSBJ\n"
              "bmMuMRMwEQYDVQQIDApDYWxpZm9ybmlhMB4XDTE3MDQxOTIxNDE1NloXDTMyMDMy\n"
              "MjAwMDAwMFowUzEnMCUGA1UEAwweQmFzaWMgQXR0ZXN0YXRpb24gVXNlciBSb290\n"
              "IENBMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxpZm9ybmlhMHYw\n"
              "EAYHKoZIzj0CAQYFK4EEACIDYgAE639EEPCGvFOPAbzd5eGJM46/I+N1rpRhPBc2\n"
              "+hvNC5vlVyv1hVNPSTIcF0sLPgCeEEQqGIZsUPO48ECh03YzXUT86015HwktM439\n"
              "bWGKGE/VRepW8S8EDRLh6+83XZ9do0IwQDAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud\n"
              "DgQWBBSD5aMhnrB0w/lhkP2XTiMQdqSj8jAOBgNVHQ8BAf8EBAMCAQYwCgYIKoZI\n"
              "zj0EAwMDZwAwZAIwQol5uLqv1SXY9G1wHSx2EYIULFlLssYTnTwbSlZPj2yF9cgk\n"
              "7xJO8bw6nTklgnHhAjBgMvsir7UEVzw7uxn8y3GGf9KSCFV5scySrYDZnJhETYlc\n"
              "yPYSFsZIerKNPP6v28Y=\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QABAAUCRTRootCAPEMLen;
      v12 = (unsigned int *)&BAAUCRTRootCAPEMLen;
      goto LABEL_48;
    case 2:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIB/zCCAYWgAwIBAgIIMyDS5tjDo6wwCgYIKoZIzj0EAwMwRTEZMBcGA1UEAwwQ\n"
              "VEVTVCBTRVAgUk9PVCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwK\n"
              "Q2FsaWZvcm5pYTAeFw0xNzAzMTcxNzQ4MzBaFw0zMjAzMTcxNzQ4MzBaMEUxGTAX\n"
              "BgNVBAMMEFRFU1QgU0VQIFJPT1QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzAR\n"
              "BgNVBAgMCkNhbGlmb3JuaWEwdjAQBgcqhkjOPQIBBgUrgQQAIgNiAARPM4laW0B+\n"
              "fOrILxB1SgluOqUops+ps7POnbPvuhEZq3A+/zMJpvuA9r81okf3hb2irmpUAuvd\n"
              "pbjz1pDf73/8VC/uMSJsWXEc39kpm2j6DwBOIxJ++OwnhEU7pf0gCQ6jQjBAMB0G\n"
              "A1UdDgQWBBRWyfg8mg8Ak5e1SZm7V0WL85j2NDAPBgNVHRMBAf8EBTADAQH/MA4G\n"
              "A1UdDwEB/wQEAwIBBjAKBggqhkjOPQQDAwNoADBlAjEAiOkQ9WnIfqiQXIKRjOhu\n"
              "eWd+RPxKGQt1XmVQZGiNDwIu6SVQ0UVDGZg4ywsotyLNAjAOQgMucccaDYgsmELm\n"
              "YpYzgzyReDQx/ajwQdc97/unxkOWYP/5TPptimsc9E0u9bU=\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICIDCCAaWgAwIBAgIIePhG1bNbWBcwCgYIKoZIzj0EAwMwVTEpMCcGA1UEAwwg\n"
              "QmFzaWMgQXR0ZXN0YXRpb24gU3lzdGVtIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxl\n"
              "IEluYy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcNMTcwNDIwMDAyMjA5WhcNMzIw\n"
              "MzIyMDAwMDAwWjBVMSkwJwYDVQQDDCBCYXNpYyBBdHRlc3RhdGlvbiBTeXN0ZW0g\n"
              "Um9vdCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5p\n"
              "YTB2MBAGByqGSM49AgEGBSuBBAAiA2IABN7OnRlUVkOVlHTw7UF9qForIhvM8pLL\n"
              "WTrHm6Be42c3LZFIM2RNT5FZZDkIgQfYLS6vsRpfrhEMKIHIWomtyuCxp2c/AIxu\n"
              "wEml4f2d8IktTRcNHwqKzUgzPJV3CyKh2KNCMEAwDwYDVR0TAQH/BAUwAwEB/zAd\n"
              "BgNVHQ4EFgQU/tHRwggHA9W5PDSyu/18OpklG48wDgYDVR0PAQH/BAQDAgEGMAoG\n"
              "CCqGSM49BAMDA2kAMGYCMQCmU03bvMmBE4X03P8MdpxEE/LpNcRmsnktIav8tpNh\n"
              "Gmo4mv2FyZKKvaJtO2OhIrwCMQDxMBcXge5NpWx/VBcFTj2Tb2VxQ8zMKbWapLE/\n"
              "HPN4kbBaiIIUl52drBlQjS/c3P8=\n"
              "-----END CERTIFICATE-----\n";
      v11 = (unsigned int *)&QABAASCRTRootCAPEMLen;
      v12 = (unsigned int *)&BAASCRTRootCAPEMLen;
      goto LABEL_48;
    case 3:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICGDCCAZ+gAwIBAgIIMyDS5tjDo60wCgYIKoZIzj0EAwMwUjEmMCQGA1UEAwwd\n"
              "VEVTVCBVQ1JUIEFUVEVTVEFUSU9OIFJPT1QgQ0ExEzARBgNVBAoMCkFwcGxlIElu\n"
              "Yy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcNMTcwMzE3MTg0NzIzWhcNMzIwMzE3\n"
              "MTg0NzIzWjBSMSYwJAYDVQQDDB1URVNUIFVDUlQgQVRURVNUQVRJT04gUk9PVCBD\n"
              "QTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAG\n"
              "ByqGSM49AgEGBSuBBAAiA2IABK8j8XvaJOsMr8X6albKQ1LFlMi3k+b8Jooja8Qs\n"
              "0lsrRmax8FItjsoWcxj3c1sPjPF59FI2sCb+9cUZ8KgTeJ3b5748pO1XRGByMNHp\n"
              "tmIuLYRvqRHhkWl638PWGRUoYKNCMEAwHQYDVR0OBBYEFGnDBpAIQSifJVW2RWKm\n"
              "f6jT3iIXMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49\n"
              "BAMDA2cAMGQCMBFwSHXop87Ghm50PPMGFHtpB/o3K2Gx5747Q0mlR2qE0DsmrJSu\n"
              "2LO+9QEQL5HZRwIwBMg0g5oYcfMMDWwFSRESii+SqHxFgbmVuzHR5Cu0peL1MiMB\n"
              "nMjKoG3YyhB4geQ9\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIB9DCCAZqgAwIBAgIUfK8gpf3d6f7acICzvf5MBWnAVEYwCgYIKoZIzj0EAwIw\n"
              "VzErMCkGA1UEAwwiQXBwbGUgQWNjZXNzb3J5IFJvb3QgQ0EgLSAwMDAwMDAwMTET\n"
              "MBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTAgFw0yMDA5\n"
              "MTYxODI5MzRaGA8yMDUwMDkxNDAwMDAwMFowVzErMCkGA1UEAwwiQXBwbGUgQWNj\n"
              "ZXNzb3J5IFJvb3QgQ0EgLSAwMDAwMDAwMTETMBEGA1UECgwKQXBwbGUgSW5jLjET\n"
              "MBEGA1UECAwKQ2FsaWZvcm5pYTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABMGo\n"
              "QSB6dmrLAhjkTUVAoAC1RwaOmEmEk7SYEnnm6aBw9HZZQt5pkncuTXxvL6NDvx4D\n"
              "8Wn3frxp+UOTgEalb0ajQjBAMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFAZD\n"
              "Zup+SdTmXls49aokHuK+fHKjMA4GA1UdDwEB/wQEAwIBBjAKBggqhkjOPQQDAgNI\n"
              "ADBFAiEA4HcCYv5+W+1/HOy1v1cYVozNEW4+2WvR84Japg8rabkCIDP9zynWiR60\n"
              "O06J60wrt0rQfBOPnoeY1+ydbP2g8Tiy\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QABAAMFiRootCAPEMLen;
      v12 = (unsigned int *)&BAAMFiRootCAPEMLen;
      goto LABEL_48;
    case 4:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIBgzCCASkCFDjx/NbFt/axSboRZlQvaFKmOM9cMAoGCCqGSM49BAMCMEQxGDAW\n"
              "BgNVBAMMD1JPT1QgVk1Ib3N0IERFVjETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEG\n"
              "A1UECAwKQ2FsaWZvcm5pYTAeFw0yMjEyMjAyMjQ5MjNaFw0zMjEyMTcyMjQ5MjNa\n"
              "MEQxGDAWBgNVBAMMD1JPT1QgVk1Ib3N0IERFVjETMBEGA1UECgwKQXBwbGUgSW5j\n"
              "LjETMBEGA1UECAwKQ2FsaWZvcm5pYTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA\n"
              "BFEzB9BX594q7qqyNgDRIB2qQm6uhylOPgS3zX6kVNpCe+IGeuYGVKu+n0oVoUEq\n"
              "ah/zwVwo9xZPJycEbHBhGlAwCgYIKoZIzj0EAwIDSAAwRQIhAJxxz1ciDUVxdnIz\n"
              "34ondjHZD90U6Pzvu9abpIU1TsJxAiAKxVubHXInckv6HidbV1J2RghMPdxOyKnw\n"
              "ZR6YEAfSMQ==\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICLDCCAbOgAwIBAgIUfj+NzqI5TD5k+plnCuu7oXn/1NYwCgYIKoZIzj0EAwMw\n"
              "VjEqMCgGA1UEAwwhQmFzaWMgQXR0ZXN0YXRpb24gVk0gUm9vdCBDQSAtIEcxMRMw\n"
              "EQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxpZm9ybmlhMB4XDTIyMTEx\n"
              "NzE5MjQ0NloXDTQ3MTExNzAwMDAwMFowVjEqMCgGA1UEAwwhQmFzaWMgQXR0ZXN0\n"
              "YXRpb24gVk0gUm9vdCBDQSAtIEcxMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYD\n"
              "VQQIDApDYWxpZm9ybmlhMHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEh+bXFjhVZxpY\n"
              "SW1tUJhQc7Mesr7Ua/2EIJDhZnq1eUV666b7j8V1apF7zQdcVc1GHqBMRfeagBk0\n"
              "ktB5PgRQ4hFX3OAbfjSVnmuPVuHznBbS/1f/ABuTlJJjO592E9JVo0IwQDAPBgNV\n"
              "HRMBAf8EBTADAQH/MB0GA1UdDgQWBBTHKW8b5x+bDXk9PC/lPsufj3wUEzAOBgNV\n"
              "HQ8BAf8EBAMCAQYwCgYIKoZIzj0EAwMDZwAwZAIwXsNPIuolYDriFDkULrsZy81O\n"
              "yAk4v7Y4f1p86Ox2J7g4xdGIwAyLw/JNRKGoHGpVAjBk20GA6ZvKKoO+HvE9v2xu\n"
              "wiVPsqk37xSmgK+RHJDMMy+hrhJVsCsBzeYpI9Cz4sI=\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QABAAVMRootCAPEMLen;
      v12 = (unsigned int *)&BAAVMRootCAPEMLen;
      goto LABEL_48;
    case 5:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIB9jCCAXwCFGyFzDAIXLHwUcHOxFEzhqQrOQOPMAoGCCqGSM49BAMDMF8xMzAx\n"
              "BgNVBAMMKkJhc2ljIEF0dGVzdGF0aW9uIFNFUCBBcHAgRGV2IFJvb3QgQ0EgLSBH\n"
              "MTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTAeFw0y\n"
              "MzAxMTkyMTEzNTFaFw0zMzAxMTYyMTEzNTFaMF8xMzAxBgNVBAMMKkJhc2ljIEF0\n"
              "dGVzdGF0aW9uIFNFUCBBcHAgRGV2IFJvb3QgQ0EgLSBHMTETMBEGA1UECgwKQXBw\n"
              "bGUgSW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAi\n"
              "A2IABOnVQFqNs86j5R5dAcjUlpotBUkO2q3+udEnqwkzzcrptPz6FIp5GQagMCQk\n"
              "wDgzXTe3jUqDkGxMNUjLt6DkzbwX7SrHhvIf9RlTXmlgrCUUrR21089VP+FZu8sD\n"
              "38l7PTAKBggqhkjOPQQDAwNoADBlAjEA7qwslEakgN0e+27DzPtrOqbud2pXVdRP\n"
              "qGFmLcklmZWHF1UIn6JlD1TNLVHQlCr3AjBkSmV+m5D/pJVRvg4ewQq+9oeyuYg8\n"
              "JHQGGaubDFMjZXhJ3NXrLHmIWDRQW2lgChA=\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICODCCAb2gAwIBAgIUW5y5rEfNQCu9iSCmlQjrP1Rz/tAwCgYIKoZIzj0EAwMw\n"
              "WzEvMC0GA1UEAwwmQmFzaWMgQXR0ZXN0YXRpb24gU0VQIEFwcCBSb290IENBIC0g\n"
              "RzExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlmb3JuaWEwHhcN\n"
              "MjIwOTEyMTc1OTM0WhcNNDcwOTEyMDAwMDAwWjBbMS8wLQYDVQQDDCZCYXNpYyBB\n"
              "dHRlc3RhdGlvbiBTRVAgQXBwIFJvb3QgQ0EgLSBHMTETMBEGA1UECgwKQXBwbGUg\n"
              "SW5jLjETMBEGA1UECAwKQ2FsaWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAiA2IA\n"
              "BAXaHBhlPwzGbPrirq+GvLIVTB4ym+88OQOB2Aq3ZuWIDz2DV9EWt7/3tpHL276X\n"
              "WE4ObPymHzrbl5aNpIzjm9W0tgiZRWw8l3YEuoz56dh3sZqVdDxszB3CQw1KX+62\n"
              "YaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUywowhXlxUMVVx846sCHP\n"
              "XQIrUR4wDgYDVR0PAQH/BAQDAgEGMAoGCCqGSM49BAMDA2kAMGYCMQC/AZhw1x8+\n"
              "XBPQw3lTl2A4SxY5UvCMjyseU9uUD0qgFDYlvUzH0qi8KB5BZled0cYCMQClhMgI\n"
              "rl3Txh1EJBb5yoWhvs8Gy+qkov9/SIDIEGpmZ7OUngbjN5zheCyJio90Xig=\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QABAAASMFiOSRootCAPEMLen;
      v12 = (unsigned int *)&BAAASMFiOSRootCAPEMLen;
      goto LABEL_48;
    case 6:
      v14 = *(_DWORD *)"&\b";
      v10 = "-----BEGIN CERTIFICATE-----\n"
            "MIIF2DCCA8CgAwIBAgIBADANBgkqhkiG9w0BAQsFADB9MQswCQYDVQQGEwJVUzET\n"
            "MBEGA1UEChMKQXBwbGUgSW5jLjFZMFcGA1UEAxNQRkRSLUNBMS1ST09ULUNNIDg2\n"
            "QkQ1QkFFQ0JBNEQ5RUM0QzdBOUJGRUZEM0I3QTE0Mzc5QTE1RTVGQjM2MDNCQ0U2\n"
            "OTA1MDczRUMwNjBBM0YwHhcNMTQwNjExMjEwODM5WhcNNDQwNjExMjEwODM5WjB9\n"
            "MQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUgSW5jLjFZMFcGA1UEAxNQRkRS\n"
            "LUNBMS1ST09ULUNNIDg2QkQ1QkFFQ0JBNEQ5RUM0QzdBOUJGRUZEM0I3QTE0Mzc5\n"
            "QTE1RTVGQjM2MDNCQ0U2OTA1MDczRUMwNjBBM0YwggIiMA0GCSqGSIb3DQEBAQUA\n"
            "A4ICDwAwggIKAoICAQDRSE8a8Xl+OFgz07qfQf610WJgBhQUMqYqLME8yNW6HRAo\n"
            "ZmRJCZhKzJCW7W77utpo/QZqCs/Tmc8yAuyw06MlLdb/EaFbIJhnd8KvhNO2aBn1\n"
            "0zTF3BrKu/iBj4Cb31nzd+P3BAyIIhnNfqnJ1YDGrXDHApFKs96bRNYfFj/cm55e\n"
            "+5ZaVAE4pGq3I45pO1HMEObvysFnbEw4R5EZ8BsyNaSe+EEprYZQqjfGciVZn+WD\n"
            "nP0g1TONgE8yAplaud+0QQIcLxE82toZqnAEErojrXbb9KYiW6OH+w8p8ITKrA0a\n"
            "byud5ZwU8x2dwJngg2P53vzdaEPgl+oEWm5uTtOBS5kGh9N0Ky3N094qn6Y9OmLD\n"
            "eXsYXGE3Q91AZ6Ps+0cmZYAMvnlTMh6h6TRgIG6kUi/7fIn6umQHgavSMP+XWNET\n"
            "CzbwE7YZnTnhMlW3Oaey40bKDgxZAgVAVKt+qf/B9Exb074GqicYr5RH3MmYYqVo\n"
            "bHZTPkeKykUxUJoNm/jRoyXQnStl0uBclShH3ORMOHL6MeQMSGIEIVbD6AJz3rIX\n"
            "7nidx3ePUeA7QVV/vhL09DU4Q5KKQsbgl4qSGzxA87ClUGworLaWa+AUE+MP5NLJ\n"
            "tSlsY4+Fl3VLq51AJA2oeOwF6KCTRTZWG56anqaSrEU0UKsWgQ6ys+9153eGTwID\n"
            "AQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4E\n"
            "FgQUESXWmKVwOl5LaoSB35L33xPje14wHwYDVR0jBBgwFoAUESXWmKVwOl5LaoSB\n"
            "35L33xPje14wDQYJKoZIhvcNAQELBQADggIBAJcISq7FqhBfFRpgEAiedVPPzff5\n"
            "rU2uNQLpApMb3A6jFSostHTwypA//pc0PbTPTi5t2CcF14Gznqt4Gf1Ej75C+fgK\n"
            "QoWjcgYPCXkK+6KkTW8EMLsL+n8ZL1tqdOuJCOBTRBTU3Lbwon5uYF98CdBlPIam\n"
            "ZqDEbEiwrp/I5uBMkut1P2sftxu5ysu3+A1bGMDI5T84sXbG0eJU6zmx1p/WUHAc\n"
            "HZy9/S7Ad5vJRMQrWx4JDdLvJ+1PXqdJtZUkp4TNPchxA9OzGsatVJJ5T/5EVDuL\n"
            "QgLaZNiWeAC19+clUREnS247RjLNIZZq0hj2Rk5zO6sSyt8vM+kJZrTVdGaSk++l\n"
            "OFWzSdo0Ev/izPkuL/cH146YZS1UWZJI61mdvbvvxqqQaoTmviuMDqDoCZ7crLu3\n"
            "LRoS6/+w+xir5s6hmAF8D6FzAkVmeAroyd6Hclk6CnhlcQP5GxjTQjA2YGe/9X54\n"
            "30qL4fjiDwdLYqxyL5J28/yxt068aoVaukoRAgiGoZouyieTV9DabenxYBOygijS\n"
            "4G4RVf4qVnQ7wGkQokhz4WIkMr4C4ydWU3GhSuM3T9Tx9ASscch/oLMczDMLKYMe\n"
            "3sdtc60+gxrctSq/B3E/5nddDj9vQ7BdRWcvJ+n/ESsXgwk5z15YZUwU/qW0j5rD\n"
            "4bPy9nox5DLds+/l\n"
            "-----END CERTIFICATE-----";
      goto LABEL_52;
    case 7:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIBtDCCAVqgAwIBAgIBJzAKBggqhkjOPQQDAjBIMRwwGgYDVQQDDBNTRVAgUm9v\n"
              "dCBDQSAoTG9jYWwpMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxp\n"
              "Zm9ybmlhMB4XDTE2MDQyMjIyMTgzOVoXDTI2MDQyMDIyMTgzOVowSDEcMBoGA1UE\n"
              "AwwTU0VQIFJvb3QgQ0EgKExvY2FsKTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEG\n"
              "A1UECAwKQ2FsaWZvcm5pYTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABLbmMPmv\n"
              "ubyAcSjOqIvq+HkYPAn68WV+DopU/kfpNtEo0y0kjdxYGyuiaKC3LPqBmgM8pHlJ\n"
              "pP81SMyx900L5YyjNTAzMA8GA1UdEwEB/wQFMAMBAf8wCwYDVR0PBAQDAgEGMBMG\n"
              "CSqGSIb3Y2QGLAQGFgR1Y3J0MAoGCCqGSM49BAMCA0gAMEUCIQCz/HH34JCprRWh\n"
              "srjvjvb0vUjLY22yA/3uJS0zZ2LRGgIgahGt0ZuEvMzPDnG9n8wRXEOB46xu7zDy\n"
              "rXK+zQjBPMY=\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIB9DCCAXugAwIBAgIIMyDS5tjDo6wwCgYIKoZIzj0EAwMwQDEUMBIGA1UEAwwL\n"
              "U0VQIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlm\n"
              "b3JuaWEwHhcNMTQwNjI0MjE0MzI0WhcNMjkwNjI0MjE0MzI0WjBAMRQwEgYDVQQD\n"
              "DAtTRVAgUm9vdCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2Fs\n"
              "aWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAiA2IABEBGXhKwc7q3iFvkUoGDP6j2\n"
              "drpxSCxsSCODaDQIqGwd53wZJ0xIJIv0RTf2TS7+/u4KzhrANzb19r+TQzwqFJMp\n"
              "hp3mI3yY4pukIFc/kWS7DLQAx/ftWBXX6vl4ig3wEqNCMEAwHQYDVR0OBBYEFFjv\n"
              "1r7FgrBUzRimhK2i9nt7On/PMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQD\n"
              "AgEGMAoGCCqGSM49BAMDA2cAMGQCMCWRVB9DxwYdXsJ8KVZwbU5y0rfNEWJwpH5B\n"
              "bH3HoiOT/k7TIzlcXWiWAZVVBsDf/gIwC5wq3OepHwBMMCa3Q4ZvpT4Qs0dmc4oa\n"
              "GYxqUZYACJiGD7vRVavVMFnf0s4xG0JG\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QAUCRTRootCAPEMLen;
      goto LABEL_33;
    case 8:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICXjCCAeWgAwIBAgIJAO5ey/a/ZXo9MAoGCCqGSM49BAMDMGQxNzA1BgNVBAMT\n"
              "LmltZzQgdGVzdCBzZWNwMzg0cjEgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkx\n"
              "FDASBgNVBAoTC0FwcGxlLCBJbmMuMRMwEQYDVQQIEwpDYWxpZm9ybmlhMB4XDTE1\n"
              "MDgyNzA0MTk1MloXDTI1MDgyNDA0MTk1MlowZDE3MDUGA1UEAxMuaW1nNCB0ZXN0\n"
              "IHNlY3AzODRyMSBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eTEUMBIGA1UEChML\n"
              "QXBwbGUsIEluYy4xEzARBgNVBAgTCkNhbGlmb3JuaWEwdjAQBgcqhkjOPQIBBgUr\n"
              "gQQAIgNiAARmiQLNit/MHLEymNygtXRdYvZ2V9ujKbG78XPHs815eRetxfbAe0SU\n"
              "3LOKQ0xvpm77RUDARHdFyNzRSkKxTY2iBUGOapBwlwzfZlUmJU4JRXE9ATRwYNco\n"
              "KfVcrL0BFnejYzBhMB0GA1UdDgQWBBTFrjb8IhN7kz3HMYTxcqKeXtGm5DAPBgNV\n"
              "HRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMWuNvwiE3uTPccxhPFyop5e0abkMA4G\n"
              "A1UdDwEB/wQEAwIBhjAKBggqhkjOPQQDAwNnADBkAjB5ryjJQJlO6BD0fqejchDc\n"
              "HB9su7+GoJMD5Kv9hoDeDlCTYoxE1fUp/36BAM3Ph/4CMB+QED5D9Nf7Fas99Xst\n"
              "xQ+EdLq74wvw/0YFQlsLVUH3UAnFE1uWnmwHkDZYF1EkcA==\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIB9DCCAXugAwIBAgIIMyDS5tjDo6wwCgYIKoZIzj0EAwMwQDEUMBIGA1UEAwwL\n"
              "U0VQIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlm\n"
              "b3JuaWEwHhcNMTQwNjI0MjE0MzI0WhcNMjkwNjI0MjE0MzI0WjBAMRQwEgYDVQQD\n"
              "DAtTRVAgUm9vdCBDQTETMBEGA1UECgwKQXBwbGUgSW5jLjETMBEGA1UECAwKQ2Fs\n"
              "aWZvcm5pYTB2MBAGByqGSM49AgEGBSuBBAAiA2IABEBGXhKwc7q3iFvkUoGDP6j2\n"
              "drpxSCxsSCODaDQIqGwd53wZJ0xIJIv0RTf2TS7+/u4KzhrANzb19r+TQzwqFJMp\n"
              "hp3mI3yY4pukIFc/kWS7DLQAx/ftWBXX6vl4ig3wEqNCMEAwHQYDVR0OBBYEFFjv\n"
              "1r7FgrBUzRimhK2i9nt7On/PMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQD\n"
              "AgEGMAoGCCqGSM49BAMDA2cAMGQCMCWRVB9DxwYdXsJ8KVZwbU5y0rfNEWJwpH5B\n"
              "bH3HoiOT/k7TIzlcXWiWAZVVBsDf/gIwC5wq3OepHwBMMCa3Q4ZvpT4Qs0dmc4oa\n"
              "GYxqUZYACJiGD7vRVavVMFnf0s4xG0JG\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QAUCRTRootCAP384PEMLen;
LABEL_33:
      v12 = (unsigned int *)&UCRTRootCAPEMLen;
      goto LABEL_48;
    case 9:
      v9 = a2 == 0;
      if (a2)
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIIBtjCCAVugAwIBAgIBJTAKBggqhkjOPQQDAjBIMRwwGgYDVQQDDBNTRVAgUm9v\n"
              "dCBDQSAoTG9jYWwpMRMwEQYDVQQKDApBcHBsZSBJbmMuMRMwEQYDVQQIDApDYWxp\n"
              "Zm9ybmlhMB4XDTE2MDQyMjIyMDMwMloXDTI2MDQyMDIyMDMwMlowSTETMBEGA1UE\n"
              "CAwKQ2FsaWZvcm5pYTETMBEGA1UECgwKQXBwbGUgSW5jLjEdMBsGA1UEAwwUdWNy\n"
              "dCBWZW5kaW5nIFNlcnZpY2UwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQooWKn\n"
              "j4PQnKhSGEpmJok/4CSDeG6fIk6A4vCDtuC5T2twqSmM0VWT3SY5B8QKMAspxnnT\n"
              "fxPmUJ+d2vhNPocFozUwMzAPBgNVHRMBAf8EBTADAQH/MAsGA1UdDwQEAwIBBjAT\n"
              "BgkqhkiG92NkBiwEBhYEdWNydDAKBggqhkjOPQQDAgNJADBGAiEAq6YVB2GvW4uu\n"
              "b17G+wTS/pehuM8tHLOH6RfJzUarkpUCIQDViFsKmYnrNx3yi9whnCHUE2SqvdRK\n"
              "YFSjST8cXO8B2g==\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "-----BEGIN CERTIFICATE-----\n"
              "MIICFzCCAZygAwIBAgIIOcUqQ8IC/hswCgYIKoZIzj0EAwIwQDEUMBIGA1UEAwwL\n"
              "U0VQIFJvb3QgQ0ExEzARBgNVBAoMCkFwcGxlIEluYy4xEzARBgNVBAgMCkNhbGlm\n"
              "b3JuaWEwHhcNMTYwNDI1MjM0NTQ3WhcNMjkwNjI0MjE0MzI0WjBFMRMwEQYDVQQI\n"
              "DApDYWxpZm9ybmlhMRMwEQYDVQQKDApBcHBsZSBJbmMuMRkwFwYDVQQDDBBGRFJE\n"
              "Qy1VQ1JULVNVQkNBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEaDc2O/MruYvP\n"
              "VPaUbKR7RRzn66B14/8KoUMsEDb7nHkGEMX6eC+0gStGHe4HYMrLyWcap1tDFYmE\n"
              "DykGQ3uM2aN7MHkwHQYDVR0OBBYEFLSqOkOtG+V+zgoMOBq10hnLlTWzMA8GA1Ud\n"
              "EwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUWO/WvsWCsFTNGKaEraL2e3s6f88wDgYD\n"
              "VR0PAQH/BAQDAgEGMBYGCSqGSIb3Y2QGLAEB/wQGFgR1Y3J0MAoGCCqGSM49BAMC\n"
              "A2kAMGYCMQDf5zNiiKN/Jqms1w+3CDYkESOPieJMpEkLe9a0UjWXEBDL0VEsq/Cd\n"
              "E3aKXkc6R10CMQDS4MiWiymY+Rxkvy/hicDDQqI/BL+N3LHqzJZUuw2Sx0afDX7B\n"
              "6LyKk+sLq4urkMY=\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QAUCRTSubCAPEMLen;
      v12 = (unsigned int *)&UCRTSubCAPEMLen;
      goto LABEL_48;
    case 10:
      v14 = 1115;
      v10 = "-----BEGIN CERTIFICATE-----\n"
            "MIIDCjCCAnOgAwIBAgIJAKLEjm9wthY+MA0GCSqGSIb3DQEBBQUAMGIxCzAJBgNV\n"
            "BAYTAlVTMQswCQYDVQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQK\n"
            "EwpBcHBsZSBJbmMuMQwwCgYDVQQLEwNFVFMxDzANBgNVBAMTBlJhcHRvcjAeFw0x\n"
            "MTA2MjMxOTA1NDNaFw0xOTA5MDkxOTA1NDNaMGIxCzAJBgNVBAYTAlVTMQswCQYD\n"
            "VQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQKEwpBcHBsZSBJbmMu\n"
            "MQwwCgYDVQQLEwNFVFMxDzANBgNVBAMTBlJhcHRvcjCBnzANBgkqhkiG9w0BAQEF\n"
            "AAOBjQAwgYkCgYEAyckOSUo0WP7JAPTWXeVyEfeJ7JUm1cVzL4hURR/Kr9PR8x1g\n"
            "ptLaxWVcni+9D6eHmn9FxmmQFXRbIQCs5/qj4PhFZLC3c77wvi/8OL2EwSIOq9MN\n"
            "Hpm0P0jh/0e8AxJZS98gPfz6YF58H1/Vi5yYlM7zsGPdXaUiQokAbTcyXZUCAwEA\n"
            "AaOBxzCBxDAdBgNVHQ4EFgQUMSXJGuBw9hqPqJDExjgE206NyD4wgZQGA1UdIwSB\n"
            "jDCBiYAUMSXJGuBw9hqPqJDExjgE206NyD6hZqRkMGIxCzAJBgNVBAYTAlVTMQsw\n"
            "CQYDVQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQKEwpBcHBsZSBJ\n"
            "bmMuMQwwCgYDVQQLEwNFVFMxDzANBgNVBAMTBlJhcHRvcoIJAKLEjm9wthY+MAwG\n"
            "A1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAqrgiRsSNB4ubv2ZDUqH7p1a1\n"
            "Hca1vMmXZy1bTBXTbxoNJ/tHnkBZrQHoRq31931Sd6CDLnN/8h+Zpcg7C40vKMBu\n"
            "nJ4gaPVrPZlv36rrW/xNf6ZLETt0Q8VM554/P2QfT4aU/2v2rFb/orAqsKSW6wtJ\n"
            "9WmL1qAfmVJAPdcwYbY=\n"
            "-----END CERTIFICATE-----";
      goto LABEL_52;
    case 11:
      v14 = 1143;
      v10 = "-----BEGIN CERTIFICATE-----\n"
            "MIIDHzCCAoigAwIBAgIJAK/qJPz+p+3XMA0GCSqGSIb3DQEBBQUAMGkxCzAJBgNV\n"
            "BAYTAlVTMQswCQYDVQQIEwJDQTESMBAGA1UEBxMJQ3VwZXJ0aW5vMRMwEQYDVQQK\n"
            "EwpBcHBsZSBJbmMuMQwwCgYDVQQLEwNFVFMxFjAUBgNVBAMTDVJhcHRvciBEZXZp\n"
            "Y2UwHhcNMTEwNjIzMTkwNjE3WhcNMTkwOTA5MTkwNjE3WjBpMQswCQYDVQQGEwJV\n"
            "UzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzETMBEGA1UEChMKQXBw\n"
            "bGUgSW5jLjEMMAoGA1UECxMDRVRTMRYwFAYDVQQDEw1SYXB0b3IgRGV2aWNlMIGf\n"
            "MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDOPR58emAZ3QBW6U3tZXmTjELxK495\n"
            "JavHz3yZm1lX1z7K9tmbqcmUuEXpBbxHtgEkTTmwZQIgM3f6asTn8CKln8kq7aYj\n"
            "AWbSNOCy35hLDCy+hCN9hi++3LqqHiuQ9whVAvyrqpX7xPfgGwheIgpp/sPoPbZF\n"
            "x5EiwPt7/uHzfQIDAQABo4HOMIHLMB0GA1UdDgQWBBSWWwNRWUp2XVKrcZ8yKR4r\n"
            "Zh/4wDCBmwYDVR0jBIGTMIGQgBSWWwNRWUp2XVKrcZ8yKR4rZh/4wKFtpGswaTEL\n"
            "MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRIwEAYDVQQHEwlDdXBlcnRpbm8xEzAR\n"
            "BgNVBAoTCkFwcGxlIEluYy4xDDAKBgNVBAsTA0VUUzEWMBQGA1UEAxMNUmFwdG9y\n"
            "IERldmljZYIJAK/qJPz+p+3XMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQAD\n"
            "gYEAP2PMyy+666s+vDH4mLhFb2ZUFUM/nyxnLbjEyxgxR5Z5iZ/H0BEp7s59Matv\n"
            "dO0dzhP1+khkcM6opicPG3Vu5eDI0odn41m7LDj6Z3lgrxFTKIm/Ghc7c7c0qdWA\n"
            "YLTvijBQsDqsY1YoAXr+80ReSSouJgkNvljBAoPFPpoK2xQ=\n"
            "-----END CERTIFICATE-----";
      goto LABEL_52;
    case 12:
      v9 = a2 == 0;
      if (a2)
        v10 = "Certificate:\n"
              "    Data:\n"
              "        Version: 3 (0x2)\n"
              "        Serial Number: 1 (0x1)\n"
              "        Signature Algorithm: sha1WithRSAEncryption\n"
              "        Issuer: C=US, O=Apple Inc., OU=Apple Certification Authority, CN=[TEST] Apple iPhone Certification"
              " Authority\n"
              "        Validity\n"
              "            Not Before: Mar 21 06:20:50 2007 GMT\n"
              "            Not After : Mar 12 06:20:50 2022 GMT\n"
              "        Subject: C=US, O=Apple Inc., OU=Apple iPhone, CN=[TEST] Apple iPhone Device CA\n"
              "        Subject Public Key Info:\n"
              "            Public Key Algorithm: rsaEncryption\n"
              "            RSA Public Key: (1024 bit)\n"
              "                Modulus (1024 bit):\n"
              "                    00:d7:60:52:2a:fa:93:52:dc:db:ae:92:6b:d6:ac:\n"
              "                    59:17:1f:9a:20:ed:34:ae:c2:15:e8:e3:f0:3b:63:\n"
              "                    84:d8:6d:8d:02:65:74:e6:62:18:27:d1:fc:78:c3:\n"
              "                    2f:36:83:39:91:9f:3d:32:e0:95:7f:90:3b:ab:47:\n"
              "                    be:f1:47:85:8c:5d:ab:1c:5c:bb:10:69:47:56:b8:\n"
              "                    15:bf:34:4a:f0:49:6e:8a:35:4a:4f:47:bb:3e:ea:\n"
              "                    cc:df:2e:f4:b8:96:16:94:dd:38:f6:f0:82:cf:26:\n"
              "                    fd:67:a1:73:01:43:d8:25:bd:02:2c:82:89:7c:70:\n"
              "                    01:68:c2:8a:85:60:84:77:83\n"
              "                Exponent: 65537 (0x10001)\n"
              "        X509v3 extensions:\n"
              "            X509v3 Key Usage: critical\n"
              "                Digital Signature, Certificate Sign, CRL Sign\n"
              "            X509v3 Basic Constraints: critical\n"
              "                CA:TRUE\n"
              "            X509v3 Subject Key Identifier:\n"
              "                38:05:20:A9:3F:C6:79:F4:EC:9A:6F:7F:47:02:5E:6E:A4:79:11:F5\n"
              "            X509v3 Authority Key Identifier:\n"
              "                keyid:45:A2:4C:A9:8A:5B:4A:27:5E:85:A6:4D:05:1C:27:44:A5:87:76:17\n"
              "\n"
              "            X509v3 CRL Distribution Points:\n"
              "                URI:http://www.apple.com/appleca/iphone.crl\n"
              "\n"
              "    Signature Algorithm: sha1WithRSAEncryption\n"
              "        8d:be:6b:c8:4e:80:9e:78:86:0c:09:d0:6e:ed:c1:dc:30:f7:\n"
              "        29:4b:20:4e:2c:6c:b3:24:72:fd:ce:24:34:60:95:30:d7:32:\n"
              "        61:31:e5:d4:d5:63:aa:3f:89:81:f6:44:ab:71:d0:bc:17:db:\n"
              "        ab:bc:ec:bb:a4:40:6a:e7:e4:57:c6:28:6f:11:72:fc:0c:51:\n"
              "        07:31:db:40:54:ee:b5:e6:1e:e3:dc:9b:f9:3c:6a:ba:d8:c3:\n"
              "        20:f1:dd:49:cb:3a:a6:29:cd:52:f9:f3:f3:18:5e:dd:82:83:\n"
              "        b8:e8:4e:94:10:7a:1e:11:a0:63:4d:8e:60:4a:1d:45:72:4d:\n"
              "        a0:ac:1f:b0:98:8b:b4:33:5a:85:60:cf:7f:89:35:62:65:d1:\n"
              "        1b:48:a4:ec:ca:60:1a:9d:a6:d1:b9:3d:f3:64:a4:67:d1:a5:\n"
              "        1b:b6:d9:e7:65:75:cb:af:2f:7a:db:d8:a1:f4:f3:09:bf:9a:\n"
              "        99:1a:34:a6:ed:1f:82:84:0b:b6:a8:68:5d:ec:49:d4:b3:34:\n"
              "        84:af:cb:a4:d9:00:f0:bc:07:6c:17:e7:95:bb:c3:3d:d9:bb:\n"
              "        6a:13:1d:34:bd:2f:c1:9a:f1:4d:67:5f:56:33:90:b2:ef:ff:\n"
              "        27:da:19:60:55:b0:78:c2:8c:34:5b:61:3a:e1:ec:61:92:8b:\n"
              "        2f:04:9a:c6\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDeDCCAmCgAwIBAgIBATANBgkqhkiG9w0BAQUFADCBgDELMAkGA1UEBhMCVVMx\n"
              "EzARBgNVBAoTCkFwcGxlIEluYy4xJjAkBgNVBAsTHUFwcGxlIENlcnRpZmljYXRp\n"
              "b24gQXV0aG9yaXR5MTQwMgYDVQQDFCtbVEVTVF0gQXBwbGUgaVBob25lIENlcnRp\n"
              "ZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MDMyMTA2MjA1MFoXDTIyMDMxMjA2MjA1\n"
              "MFowYTELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFwcGxlIEluYy4xFTATBgNVBAsT\n"
              "DEFwcGxlIGlQaG9uZTEmMCQGA1UEAxQdW1RFU1RdIEFwcGxlIGlQaG9uZSBEZXZp\n"
              "Y2UgQ0EwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANdgUir6k1Lc266Sa9as\n"
              "WRcfmiDtNK7CFejj8DtjhNhtjQJldOZiGCfR/HjDLzaDOZGfPTLglX+QO6tHvvFH\n"
              "hYxdqxxcuxBpR1a4Fb80SvBJboo1Sk9Huz7qzN8u9LiWFpTdOPbwgs8m/WehcwFD\n"
              "2CW9AiyCiXxwAWjCioVghHeDAgMBAAGjgZ4wgZswDgYDVR0PAQH/BAQDAgGGMA8G\n"
              "A1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFDgFIKk/xnn07Jpvf0cCXm6keRH1MB8G\n"
              "A1UdIwQYMBaAFEWiTKmKW0onXoWmTQUcJ0Slh3YXMDgGA1UdHwQxMC8wLaAroCmG\n"
              "J2h0dHA6Ly93d3cuYXBwbGUuY29tL2FwcGxlY2EvaXBob25lLmNybDANBgkqhkiG\n"
              "9w0BAQUFAAOCAQEAjb5ryE6AnniGDAnQbu3B3DD3KUsgTixssyRy/c4kNGCVMNcy\n"
              "YTHl1NVjqj+JgfZEq3HQvBfbq7zsu6RAaufkV8YobxFy/AxRBzHbQFTuteYe49yb\n"
              "+TxqutjDIPHdScs6pinNUvnz8xhe3YKDuOhOlBB6HhGgY02OYEodRXJNoKwfsJiL\n"
              "tDNahWDPf4k1YmXRG0ik7MpgGp2m0bk982SkZ9GlG7bZ52V1y68vetvYofTzCb+a\n"
              "mRo0pu0fgoQLtqhoXexJ1LM0hK/LpNkA8LwHbBfnlbvDPdm7ahMdNL0vwZrxTWdf\n"
              "VjOQsu//J9oZYFWweMKMNFthOuHsYZKLLwSaxg==\n"
              "-----END CERTIFICATE-----";
      else
        v10 = "Bag Attributes\n"
              "    localKeyID: 7C 29 15 15 12 C9 CF F6 15 2B 5B 25 70 3D A7 9A 98 14 36 06\n"
              "subject=/C=US/O=Apple Inc./OU=Apple iPhone/CN=Apple iPhone Device CA\n"
              "issuer=/C=US/O=Apple Inc./OU=Apple Certification Authority/CN=Apple iPhone Certification Authority\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDaTCCAlGgAwIBAgIBATANBgkqhkiG9w0BAQUFADB5MQswCQYDVQQGEwJVUzET\n"
              "MBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlv\n"
              "biBBdXRob3JpdHkxLTArBgNVBAMTJEFwcGxlIGlQaG9uZSBDZXJ0aWZpY2F0aW9u\n"
              "IEF1dGhvcml0eTAeFw0wNzA0MTYyMjU0NDZaFw0xNDA0MTYyMjU0NDZaMFoxCzAJ\n"
              "BgNVBAYTAlVTMRMwEQYDVQQKEwpBcHBsZSBJbmMuMRUwEwYDVQQLEwxBcHBsZSBp\n"
              "UGhvbmUxHzAdBgNVBAMTFkFwcGxlIGlQaG9uZSBEZXZpY2UgQ0EwgZ8wDQYJKoZI\n"
              "hvcNAQEBBQADgY0AMIGJAoGBAPGUSsnquloYYK3Lok1NTlQZaRdZB2bLl+hmmkdf\n"
              "Rq5nerVKc1SxywT2vTa4DFU4ioSDMVJl+TPhl3ecK0wmsCU/6TKqewh0lOzBSzgd\n"
              "Z04IUpRai1mjXNeT9KD+VYW7TEaXXm6yd0UvZ1y8Cxi/WblshvcqdXbSGXH0KWO5\n"
              "JQuvAgMBAAGjgZ4wgZswDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8w\n"
              "HQYDVR0OBBYEFLL+ISNEhpVqedWBJo5zENinTI50MB8GA1UdIwQYMBaAFOc0Ki4i\n"
              "3jlga7SUzneDYS8xoHw1MDgGA1UdHwQxMC8wLaAroCmGJ2h0dHA6Ly93d3cuYXBw\n"
              "bGUuY29tL2FwcGxlY2EvaXBob25lLmNybDANBgkqhkiG9w0BAQUFAAOCAQEAd13P\n"
              "Z3pMViukVHe9WUg8Hum+0I/0kHKvjhwVd/IMwGlXyU7DhUYWdja2X/zqj7W24Aq5\n"
              "7dEKm3fqqxK5XCFVGY5HI0cRsdENyTP7lxSiiTRYj2mlPedheCn+k6T5y0U4Xr40\n"
              "FXwWb2nWqCF1AgIudhgvVbxlvqcxUm8Zz7yDeJ0JFovXQhyO5fLUHRLCQFssAbf8\n"
              "B4i8rYYsBUhYTspVJcxVpIIltkYpdIRSIARA49HNvKK4hzjzMS/OhKQpVKw+OCEZ\n"
              "xptCVeN2pjbdt9uzi175oVo/u6B2ArKAW17u6XEHIdDMOe7cb33peVI6TD15W4MI\n"
              "pyQPbp8orlXe+tA8JA==\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QAIphoneDeviceCAPEMLen;
      v12 = (unsigned int *)&iPhoneDeviceCAPEMLen;
      goto LABEL_48;
    case 13:
      v9 = a2 == 0;
      if (a2)
        v10 = "Certificate:\n"
              "    Data:\n"
              "        Version: 3 (0x2)\n"
              "        Serial Number: 2 (0x2)\n"
              "        Signature Algorithm: sha1WithRSAEncryption\n"
              "        Issuer: C=US, O=Apple Inc., OU=Apple Certification Authority, CN=[TEST] Apple iPhone Certification"
              " Authority\n"
              "        Validity\n"
              "            Not Before: Mar 21 06:20:50 2007 GMT\n"
              "            Not After : Mar 12 06:20:50 2022 GMT\n"
              "        Subject: C=US, O=Apple Inc., OU=Apple iPhone, CN=[TEST] Apple iPhone Activation\n"
              "        Subject Public Key Info:\n"
              "            Public Key Algorithm: rsaEncryption\n"
              "            RSA Public Key: (1024 bit)\n"
              "                Modulus (1024 bit):\n"
              "                    00:b3:62:65:ec:48:dd:dd:ed:44:d4:f1:fe:fb:c2:\n"
              "                    6f:42:d0:82:09:03:00:a6:01:e8:b1:07:09:26:5b:\n"
              "                    12:65:db:7f:51:15:ef:4f:45:b3:8f:ce:4d:16:1d:\n"
              "                    38:84:01:10:57:4e:8c:71:e1:5e:de:67:14:75:da:\n"
              "                    48:9a:4c:6f:f0:45:65:66:e8:9c:b5:a2:4c:f4:53:\n"
              "                    c1:ec:98:62:90:b0:94:be:12:f2:a0:ac:5c:77:16:\n"
              "                    07:73:72:5a:97:ba:50:4e:67:30:52:1e:f0:30:4e:\n"
              "                    8f:b2:a4:d3:d1:fa:f8:66:79:87:91:2f:a1:ef:4e:\n"
              "                    e6:41:8d:94:18:29:e0:f2:cf\n"
              "                Exponent: 65537 (0x10001)\n"
              "        X509v3 extensions:\n"
              "            X509v3 Key Usage: critical\n"
              "                Digital Signature\n"
              "            X509v3 Basic Constraints: critical\n"
              "                CA:FALSE\n"
              "            X509v3 Subject Key Identifier:\n"
              "                C0:6F:3A:4A:1B:ED:51:DD:9D:A3:4B:C0:41:F6:6A:11:F9:AB:8B:F1\n"
              "            X509v3 Authority Key Identifier:\n"
              "                keyid:45:A2:4C:A9:8A:5B:4A:27:5E:85:A6:4D:05:1C:27:44:A5:87:76:17\n"
              "\n"
              "            X509v3 CRL Distribution Points:\n"
              "                URI:http://www.apple.com/appleca/iphone.crl\n"
              "\n"
              "    Signature Algorithm: sha1WithRSAEncryption\n"
              "        0e:4f:55:00:9d:1e:4c:75:28:e8:79:bb:db:5c:5c:cc:45:93:\n"
              "        46:d3:3b:14:00:2d:5b:b0:8c:2e:15:3e:19:60:43:25:59:7f:\n"
              "        7b:3a:b2:7c:cf:c2:96:dd:b0:d7:70:5a:8e:28:c4:cc:32:2c:\n"
              "        f4:c2:43:e3:e1:1f:b3:b1:df:ec:86:dd:43:93:45:60:a1:53:\n"
              "        05:ba:6a:70:43:44:11:a1:9e:dd:c1:71:8b:cb:30:cd:d3:15:\n"
              "        21:e0:27:30:35:8a:76:8e:c2:23:fb:44:22:bd:96:f6:aa:55:\n"
              "        bf:4d:11:b1:0e:c4:7f:cf:86:8d:f8:30:dd:80:48:5d:9e:41:\n"
              "        4e:e0:29:96:25:cc:d6:4a:0d:47:05:87:c4:61:f6:b0:1e:1a:\n"
              "        da:48:56:a3:c1:c1:56:95:b3:4e:84:82:1b:a5:4d:d3:d0:5d:\n"
              "        60:cf:fd:e5:75:3c:91:13:e2:e4:f1:60:4a:58:93:de:3f:e9:\n"
              "        3c:bf:da:c9:f6:ef:9b:9e:b1:6e:78:9e:81:f6:e7:4c:09:b3:\n"
              "        1c:87:25:bf:8f:6e:3f:d6:03:53:1e:09:a3:5b:00:4b:9e:98:\n"
              "        fb:ae:13:86:e4:47:6a:1a:44:f8:15:c8:fb:30:c7:bd:b0:e8:\n"
              "        8c:ac:2d:73:08:af:ed:b2:e8:f5:6d:a1:e2:d9:45:de:d5:b9:\n"
              "        98:89:16:72\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDdjCCAl6gAwIBAgIBAjANBgkqhkiG9w0BAQUFADCBgDELMAkGA1UEBhMCVVMx\n"
              "EzARBgNVBAoTCkFwcGxlIEluYy4xJjAkBgNVBAsTHUFwcGxlIENlcnRpZmljYXRp\n"
              "b24gQXV0aG9yaXR5MTQwMgYDVQQDFCtbVEVTVF0gQXBwbGUgaVBob25lIENlcnRp\n"
              "ZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MDMyMTA2MjA1MFoXDTIyMDMxMjA2MjA1\n"
              "MFowYjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFwcGxlIEluYy4xFTATBgNVBAsT\n"
              "DEFwcGxlIGlQaG9uZTEnMCUGA1UEAxQeW1RFU1RdIEFwcGxlIGlQaG9uZSBBY3Rp\n"
              "dmF0aW9uMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCzYmXsSN3d7UTU8f77\n"
              "wm9C0IIJAwCmAeixBwkmWxJl239RFe9PRbOPzk0WHTiEARBXToxx4V7eZxR12kia\n"
              "TG/wRWVm6Jy1okz0U8HsmGKQsJS+EvKgrFx3FgdzclqXulBOZzBSHvAwTo+ypNPR\n"
              "+vhmeYeRL6HvTuZBjZQYKeDyzwIDAQABo4GbMIGYMA4GA1UdDwEB/wQEAwIHgDAM\n"
              "BgNVHRMBAf8EAjAAMB0GA1UdDgQWBBTAbzpKG+1R3Z2jS8BB9moR+auL8TAfBgNV\n"
              "HSMEGDAWgBRFokypiltKJ16Fpk0FHCdEpYd2FzA4BgNVHR8EMTAvMC2gK6Aphido\n"
              "dHRwOi8vd3d3LmFwcGxlLmNvbS9hcHBsZWNhL2lwaG9uZS5jcmwwDQYJKoZIhvcN\n"
              "AQEFBQADggEBAA5PVQCdHkx1KOh5u9tcXMxFk0bTOxQALVuwjC4VPhlgQyVZf3s6\n"
              "snzPwpbdsNdwWo4oxMwyLPTCQ+PhH7Ox3+yG3UOTRWChUwW6anBDRBGhnt3BcYvL\n"
              "MM3TFSHgJzA1inaOwiP7RCK9lvaqVb9NEbEOxH/Pho34MN2ASF2eQU7gKZYlzNZK\n"
              "DUcFh8Rh9rAeGtpIVqPBwVaVs06EghulTdPQXWDP/eV1PJET4uTxYEpYk94/6Ty/\n"
              "2sn275uesW54noH250wJsxyHJb+Pbj/WA1MeCaNbAEuemPuuE4bkR2oaRPgVyPsw\n"
              "x72w6IysLXMIr+2y6PVtoeLZRd7VuZiJFnI=\n"
              "-----END CERTIFICATE-----\n";
      else
        v10 = "Bag Attributes\n"
              "    localKeyID: 75 60 9A FA 74 F6 E1 90 9C 00 2D 77 E5 10 D6 1C B3 E5 1F 4B\n"
              "subject=/C=US/O=Apple Inc./OU=Apple iPhone/CN=Apple iPhone Activation\n"
              "issuer=/C=US/O=Apple Inc./OU=Apple Certification Authority/CN=Apple iPhone Certification Authority\n"
              "-----BEGIN CERTIFICATE-----\n"
              "MIIDZzCCAk+gAwIBAgIBAjANBgkqhkiG9w0BAQUFADB5MQswCQYDVQQGEwJVUzET\n"
              "MBEGA1UEChMKQXBwbGUgSW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlv\n"
              "biBBdXRob3JpdHkxLTArBgNVBAMTJEFwcGxlIGlQaG9uZSBDZXJ0aWZpY2F0aW9u\n"
              "IEF1dGhvcml0eTAeFw0wNzA0MTYyMjU1MDJaFw0xNDA0MTYyMjU1MDJaMFsxCzAJ\n"
              "BgNVBAYTAlVTMRMwEQYDVQQKEwpBcHBsZSBJbmMuMRUwEwYDVQQLEwxBcHBsZSBp\n"
              "UGhvbmUxIDAeBgNVBAMTF0FwcGxlIGlQaG9uZSBBY3RpdmF0aW9uMIGfMA0GCSqG\n"
              "SIb3DQEBAQUAA4GNADCBiQKBgQDFAXzRImArmoiHfbS2oPcqAfbEv0d1jk7GbnX7\n"
              "+4YUlyIfprzBVdlmz2JHYv1+04IzJtL7cL97UI7fk0i0OMY0al8a+JPQa4Ug611T\n"
              "bqEt+njAmAkge3HXWDBdAXD9MhkC7T/9o77zOQ1oli4cUdzlnYWfzmW0PduOxuve\n"
              "AeYY4wIDAQABo4GbMIGYMA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8EAjAAMB0G\n"
              "A1UdDgQWBBShoNL+t7Rz/psUaq/NPXNPH+/WlDAfBgNVHSMEGDAWgBTnNCouIt45\n"
              "YGu0lM53g2EvMaB8NTA4BgNVHR8EMTAvMC2gK6AphidodHRwOi8vd3d3LmFwcGxl\n"
              "LmNvbS9hcHBsZWNhL2lwaG9uZS5jcmwwDQYJKoZIhvcNAQEFBQADggEBAF9qmrUN\n"
              "dA+FROYGP7pWcYTAK+pLyOf9zOaE7aeVI885V8Y/BKHhlwAo+zEkiOU3FbEPCS9V\n"
              "tS18ZBcwD/+d5ZQTMFknhcUJwdPqqjnm9LqTfH/x4pw8ONHRDzxHdp96gOV3A4+8\n"
              "abkoASfcYqvIRypXnbur3bRRhTzAs4VILS6jTyFYymZeSewtBubmmigo1kCQiZGc\n"
              "76c5feDAyHb2bzEqtvx3WprljtS46QT5CR6YelinZnio32jAzRYTxtS6r3JsvZDi\n"
              "J07+EHcmfGdpxwgO+7btW1pFar0ZjF9/jYKKnOYNyvCrwszhafbSYwzAG5EJoXFB\n"
              "4d+piWHUDcPxtcc=\n"
              "-----END CERTIFICATE-----";
      v11 = (unsigned int *)&QAIphoneActivationPEMLen;
      v12 = (unsigned int *)&iPhoneActivationPEMLen;
LABEL_48:
      if (v9)
        v11 = v12;
      v14 = *v11;
      goto LABEL_52;
    case 14:
      v14 = 4721;
      v10 = iPhoneCAPEM;
      goto LABEL_52;
    default:
      createMobileActivationError((uint64_t)"copyRootCertificate", 118, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid certificate type: %d"), a7, a8, a1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_55;
      v14 = 0;
      v10 = 0;
LABEL_52:
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v10, v14, 0);
      if (v15)
      {
        v18 = (void *)v15;
        v13 = 0;
      }
      else
      {
        createMobileActivationError((uint64_t)"copyRootCertificate", 128, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate."), v16, v17, v20);
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:
        if (a3)
        {
          v13 = objc_retainAutorelease(v13);
          v18 = 0;
          *a3 = v13;
        }
        else
        {
          v18 = 0;
        }
      }

      return v18;
  }
}

id libavp_send_host_message(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  CFTypeRef cf;
  __int128 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  cf = 0;
  if (!is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 60, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is not a VM (not supported)."), v4, v5, v30);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v20 = (id)v26;
    v25 = 0;
    v18 = 0;
    v10 = 0;
    v19 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_19;
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    v34 = xmmword_1E98C8030;
    v35 = 0;
    AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 65, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Virtualization library not loaded on this platform."), v4, v5, v30);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!v3)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 70, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid intput."), v4, v5, v30);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  copy_calling_process_name();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 76, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve process name."), v6, v7, v30);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v9 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("HostProcessName"));
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 100, 0, &v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v32;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 85, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v13, CFSTR("Could not convert dictionary to xml data."), v11, v12, v30);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v18 = 0;
    v10 = 0;
LABEL_27:
    v19 = 0;
    goto LABEL_19;
  }
  *(_QWORD *)&v34 = 0;
  *((_QWORD *)&v34 + 1) = &v34;
  v35 = 0x2020000000;
  v14 = getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr;
  v36 = getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr;
  if (!getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr)
  {
    v15 = (void *)AppleVirtualPlatformLibrary();
    v14 = dlsym(v15, "AppleVirtualPlatformSendSubsystemMessageToHost");
    *(_QWORD *)(*((_QWORD *)&v34 + 1) + 24) = v14;
    getAppleVirtualPlatformSendSubsystemMessageToHostSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(&v34, 8);
  if (!v14)
    libavp_send_host_message_cold_1();
  v18 = (void *)((uint64_t (*)(uint64_t, void *, CFTypeRef *))v14)(6, v10, &cf);
  if (!v18)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 91, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (void *)cf, CFSTR("Failed to send message to host."), v16, v17, v30);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v18 = 0;
    goto LABEL_27;
  }
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, 0, &v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v31;

  isNSDictionary(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v22)
  {
    createMobileActivationError((uint64_t)"libavp_send_host_message", 97, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, CFSTR("Failed to serialize data as dictionary."), v23, v24, v30);
    v29 = objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v20 = (id)v29;
  }
  else
  {
    v25 = v19;
    v19 = v25;
  }
LABEL_19:
  if (a2 && !v25)
    *a2 = objc_retainAutorelease(v20);
  if (cf)
    CFRelease(cf);
  v27 = v25;

  return v27;
}

void sub_1D4F6E178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id libavp_copy_strong_identity_data(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  CFTypeRef cf;
  __int128 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  cf = 0;
  if (is_virtual_machine())
  {
    if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
    {
      v41 = xmmword_1E98C8030;
      v42 = 0;
      AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (AppleVirtualPlatformLibraryCore_frameworkLibrary)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v8)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NetworkTimeoutInterval"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        isNSNumber(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NetworkTimeoutInterval"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          if (v14 <= 0.0)
          {
            createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 144, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid network timeout requested: %@"), v12, v13, (uint64_t)v11);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SkipNetworkRequest"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        isNSNumber(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SkipNetworkRequest"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "BOOLValue");

        }
        else
        {
          v22 = 0;
        }
        *(_QWORD *)&v41 = 0;
        *((_QWORD *)&v41 + 1) = &v41;
        v42 = 0x2020000000;
        v23 = (_QWORD *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr;
        v43 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr;
        if (!getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr)
        {
          v24 = (void *)AppleVirtualPlatformLibrary();
          v23 = dlsym(v24, "kAppleVirtualPlatformGuestStrongIdentityOptionSynchronous");
          *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) = v23;
          getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousSymbolLoc_ptr = (uint64_t)v23;
        }
        _Block_object_dispose(&v41, 8);
        if (!v23)
          libavp_copy_strong_identity_data_cold_1();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *v23);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v41 = 0;
        *((_QWORD *)&v41 + 1) = &v41;
        v42 = 0x2020000000;
        v26 = (_QWORD *)getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr;
        v43 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr;
        if (!getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr)
        {
          v27 = (void *)AppleVirtualPlatformLibrary();
          v26 = dlsym(v27, "kAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly");
          *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) = v26;
          getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnlySymbolLoc_ptr = (uint64_t)v26;
        }
        _Block_object_dispose(&v41, 8);
        if (!v26)
          libavp_copy_strong_identity_data_cold_2();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, *v26);

        if (v11)
        {
          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "doubleValue");
          objc_msgSend(v28, "numberWithDouble:", v29 * 1000000000.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v41 = 0;
          *((_QWORD *)&v41 + 1) = &v41;
          v42 = 0x2020000000;
          v31 = (_QWORD *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr;
          v43 = (void *)getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr;
          if (!getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr)
          {
            v32 = (void *)AppleVirtualPlatformLibrary();
            v31 = dlsym(v32, "kAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec");
            *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) = v31;
            getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsecSymbolLoc_ptr = (uint64_t)v31;
          }
          _Block_object_dispose(&v41, 8);
          if (!v31)
            libavp_copy_strong_identity_data_cold_4();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, *v31);

        }
        *(_QWORD *)&v41 = 0;
        *((_QWORD *)&v41 + 1) = &v41;
        v42 = 0x2020000000;
        v33 = getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr;
        v43 = getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr;
        if (!getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr)
        {
          v34 = (void *)AppleVirtualPlatformLibrary();
          v33 = dlsym(v34, "AppleVirtualPlatformGuestCopyStrongIdentityData");
          *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) = v33;
          getAppleVirtualPlatformGuestCopyStrongIdentityDataSymbolLoc_ptr = v33;
        }
        _Block_object_dispose(&v41, 8);
        if (!v33)
          libavp_copy_strong_identity_data_cold_3();
        v35 = (void *)((uint64_t (*)(id, CFTypeRef *))v33)(v8, &cf);
        if (v35)
        {
          v18 = v35;
          v17 = 0;
          goto LABEL_37;
        }
        createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 162, CFSTR("com.apple.MobileActivation.ErrorDomain"), -24, (void *)cf, CFSTR("Failed to copy AVP guest identity data."), v36, v37, v39);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_35:
        v17 = (id)v15;
        if (!a2)
          goto LABEL_36;
LABEL_13:
        v17 = objc_retainAutorelease(v17);
        v18 = 0;
        *a2 = v17;
        goto LABEL_37;
      }
      createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 137, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."), v6, v7, v39);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 131, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Virtualization library not loaded on this platform."), v4, v5, v39);
      v16 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"libavp_copy_strong_identity_data", 126, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is not a VM (not supported)."), v4, v5, v39);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (id)v16;
  v8 = 0;
  v11 = 0;
  if (a2)
    goto LABEL_13;
LABEL_36:
  v18 = 0;
LABEL_37:
  if (cf)
    CFRelease(cf);

  return v18;
}

void sub_1D4F6E688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const void *libavp_copy_host_key_and_certs_with_data(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  __SecCertificate *v24;
  uint64_t v25;
  uint64_t v26;
  __SecCertificate *v27;
  uint64_t v28;
  uint64_t v29;
  CFDataRef v30;
  __SecCertificate *v31;
  uint64_t v32;
  uint64_t v33;
  __SecCertificate *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  CFDataRef v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  Class (*v48)(uint64_t);
  void *v49;
  uint64_t *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v41 = a2;
  if (is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 192, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is a VM (not supported)."), v8, v9, v39);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    v47 = xmmword_1E98C8030;
    v48 = 0;
    AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 197, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Virtualization library not loaded on this platform."), v8, v9, v39);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!v7)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 202, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid intput."), v8, v9, v39);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (!v13)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 208, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate data."), v11, v12, v39);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v19 = (id)v10;
    v16 = 0;
    v13 = 0;
    v30 = 0;
    v27 = 0;
    v34 = 0;
    v23 = 0;
    if (!a4)
      goto LABEL_24;
    goto LABEL_23;
  }
  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v14 = (void *)getAppleVirtualPlatformHostCertificateClass_softClass;
  v46 = getAppleVirtualPlatformHostCertificateClass_softClass;
  if (!getAppleVirtualPlatformHostCertificateClass_softClass)
  {
    *(_QWORD *)&v47 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v47 + 1) = 3221225472;
    v48 = __getAppleVirtualPlatformHostCertificateClass_block_invoke;
    v49 = &unk_1E98C7E30;
    v50 = &v43;
    __getAppleVirtualPlatformHostCertificateClass_block_invoke((uint64_t)&v47);
    v14 = (void *)v44[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v43, 8);
  v42 = 0;
  v16 = (void *)objc_msgSend([v15 alloc], "initWithDataRepresentation:error:", v7, &v42);
  v19 = v42;
  if (!v16)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 214, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v19, CFSTR("Failed to initialize identity data."), v17, v18, v39);
    v38 = objc_claimAutoreleasedReturnValue();

    v16 = 0;
LABEL_33:
    v30 = 0;
    v27 = 0;
    v34 = 0;
    v23 = 0;
    goto LABEL_38;
  }
  v20 = (const void *)objc_msgSend(v16, "hostKey");
  v23 = v20;
  if (!v20)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 220, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy AVP host key."), v21, v22, v39);
    v38 = objc_claimAutoreleasedReturnValue();

    goto LABEL_33;
  }
  CFRetain(v20);
  v24 = (__SecCertificate *)objc_msgSend(v16, "leafCertificate");
  v27 = v24;
  if (!v24)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 228, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy AVP host leaf certificate."), v25, v26, v39);
    v38 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    v27 = 0;
LABEL_37:
    v34 = 0;
    goto LABEL_38;
  }
  CFRetain(v24);
  v30 = SecCertificateCopyData(v27);
  if (!v30)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 236, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create PEM data from cert."), v28, v29, v39);
    v38 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    goto LABEL_37;
  }
  objc_msgSend(v13, "appendData:", v30);
  v31 = (__SecCertificate *)objc_msgSend(v16, "intermediateCertificate");
  v34 = v31;
  if (!v31)
  {
    createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 244, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy AVP host intermediate certificate."), v32, v33, v39);
    v38 = objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  CFRetain(v31);
  v40 = SecCertificateCopyData(v34);

  if (v40)
  {
    objc_msgSend(v13, "appendData:");
    if (a3)
    {
      v13 = objc_retainAutorelease(v13);
      *a3 = v13;
    }
    v30 = v40;
    goto LABEL_27;
  }
  createMobileActivationError((uint64_t)"libavp_copy_host_key_and_certs_with_data", 252, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create PEM data from cert."), v35, v36, v39);
  v38 = objc_claimAutoreleasedReturnValue();

  v30 = 0;
LABEL_38:
  v19 = (id)v38;
  if (a4)
LABEL_23:
    *a4 = objc_retainAutorelease(v19);
LABEL_24:
  if (v23)
    CFRelease(v23);
  v23 = 0;
  if (v27)
LABEL_27:
    CFRelease(v27);
  if (v34)
    CFRelease(v34);

  return v23;
}

void sub_1D4F6EBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t libavp_guest_has_host_key(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"libavp_guest_has_host_key", 285, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is not a VM (not supported)."), v2, v3, v11);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    v11 = xmmword_1E98C8030;
    v12 = 0;
    AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    createMobileActivationError((uint64_t)"libavp_guest_has_host_key", 290, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Virtualization library not loaded on this platform."), v2, v3, v11);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v8 = (void *)v9;
    v7 = 0;
    if (!a1)
      goto LABEL_15;
    goto LABEL_13;
  }
  *(_QWORD *)&v11 = 0;
  *((_QWORD *)&v11 + 1) = &v11;
  v12 = 0x2020000000;
  v4 = getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr;
  v13 = getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr;
  if (!getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr)
  {
    v5 = (void *)AppleVirtualPlatformLibrary();
    v4 = dlsym(v5, "AppleVirtualPlatformGuestHasHostKey");
    *(_QWORD *)(*((_QWORD *)&v11 + 1) + 24) = v4;
    getAppleVirtualPlatformGuestHasHostKeySymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
    libavp_guest_has_host_key_cold_1();
  v7 = ((uint64_t (*)(uint64_t))v4)(v6);
  v8 = 0;
  if (a1)
  {
LABEL_13:
    if ((v7 & 1) == 0)
      *a1 = objc_retainAutorelease(v8);
  }
LABEL_15:

  return v7;
}

void sub_1D4F6ED70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AppleVirtualPlatformLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E98C8030;
    v3 = 0;
    AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
    AppleVirtualPlatformLibrary_cold_1(&v1);
  return AppleVirtualPlatformLibraryCore_frameworkLibrary;
}

Class __getAppleVirtualPlatformHostCertificateClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AppleVirtualPlatformLibraryCore_frameworkLibrary)
    AppleVirtualPlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("AppleVirtualPlatformHostCertificate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAppleVirtualPlatformHostCertificateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_0_1()
{
  return dlerror();
}

id parseDERCertificatesFromChain(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  _OWORD v21[3];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v6 = v3;
  memset(v21, 0, sizeof(v21));
  v20 = 0;
  if (!v3)
  {
    v15 = CFSTR("Invalid input.");
    v16 = 106;
    v17 = -2;
    goto LABEL_13;
  }
  v7 = objc_retainAutorelease(v3);
  v8 = objc_msgSend(v7, "bytes");
  v9 = CTParseCertificateSet(v8, v8 + objc_msgSend(v7, "length"), v21, 3, &v20);
  if ((_DWORD)v9 || !v20)
  {
    v19 = v9;
    v15 = CFSTR("Failed to parse certificate set: 0x%08x");
    v16 = 115;
    v17 = -1;
LABEL_13:
    createMobileActivationError((uint64_t)"parseDERCertificatesFromChain", v16, CFSTR("com.apple.MobileActivation.ErrorDomain"), v17, 0, v15, v4, v5, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!a2)
      goto LABEL_16;
    goto LABEL_14;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10)
  {
    if (v20)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)&v21[v11], *((_QWORD *)&v21[v11] + 1));
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v13, v11);

        v11 = ++v12;
      }
      while (v20 > v12);
    }
    v10 = v10;
  }
  v14 = 0;
  if (a2)
  {
LABEL_14:
    if (!v10)
      *a2 = objc_retainAutorelease(v14);
  }
LABEL_16:

  return v10;
}

uint64_t evaluateBAATrust(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v23;

  v7 = a1;
  v10 = a2;
  if (v7)
  {
    v11 = objc_retainAutorelease(v7);
    v12 = objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    v14 = objc_retainAutorelease(v10);
    v15 = objc_msgSend(v14, "bytes");
    v16 = objc_msgSend(v14, "length");
    if (a3)
    {
      v17 = CTEvaluateBAASystemTestRoot(v12, v13, v15, v16, 0, 0, 0);
      if ((_DWORD)v17)
      {
LABEL_4:
        createMobileActivationError((uint64_t)"evaluateBAATrust", 286, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to evaluate trust: 0x%08x"), v18, v19, v17);
        goto LABEL_6;
      }
    }
    else
    {
      v17 = CTEvaluateBAAUserTestRoot(v12, v13, v15, v16, 0, 0, 0);
      if ((_DWORD)v17)
        goto LABEL_4;
    }
    v20 = 0;
    v21 = 1;
    goto LABEL_11;
  }
  createMobileActivationError((uint64_t)"evaluateBAATrust", 276, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v8, v9, v23);
LABEL_6:
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v20 = objc_retainAutorelease(v20);
    v21 = 0;
    *a4 = v20;
  }
  else
  {
    v21 = 0;
  }
LABEL_11:

  return v21;
}

uint64_t evaluateBAATrustWithCerts(__SecCertificate *a1, __SecCertificate *a2, __SecCertificate *a3, int a4, int a5, void *a6, _QWORD *a7)
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  CFDataRef v23;
  CFDataRef v24;
  CFDataRef v25;
  uint64_t v26;
  uint64_t v27;
  CFDataRef v28;
  uint64_t v29;
  uint64_t v30;
  __SecKey *v31;
  uint64_t v32;
  uint64_t v33;
  __SecKey *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  CFErrorRef error;

  v13 = a6;
  v16 = v13;
  error = 0;
  if (!a1 || !a2 || !a3)
  {
    v17 = CFSTR("Invalid input(s).");
    v18 = 313;
    v19 = -2;
LABEL_21:
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", v18, CFSTR("com.apple.MobileActivation.ErrorDomain"), v19, 0, v17, v14, v15, (uint64_t)v47);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
LABEL_22:
    v28 = 0;
LABEL_23:
    v25 = 0;
LABEL_24:
    v34 = 0;
    goto LABEL_25;
  }
  if (v13)
  {
    if (!a5)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_12;
  }
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  if (!SecCertificateIsValid()
    || (objc_msgSend(v16, "timeIntervalSinceReferenceDate"), !SecCertificateIsValid())
    || (objc_msgSend(v16, "timeIntervalSinceReferenceDate"), (SecCertificateIsValid() & 1) == 0))
  {
    v17 = CFSTR("Certificate is expired.");
    v18 = 325;
    v19 = -1;
    goto LABEL_21;
  }
LABEL_12:
  v22 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (!v22)
  {
    v44 = CFSTR("Failed to allocate data.");
    v45 = 334;
LABEL_34:
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", v45, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, v44, v20, v21, (uint64_t)v47);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v23 = SecCertificateCopyData(a1);
  if (!v23)
  {
    v44 = CFSTR("Failed to copy certificate.");
    v45 = 340;
    goto LABEL_34;
  }
  v24 = v23;
  objc_msgSend(v22, "appendData:", v23);
  v25 = SecCertificateCopyData(a2);

  if (!v25)
  {
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 348, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate."), v26, v27, (uint64_t)v47);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v22, "appendData:", v25);
  v28 = SecCertificateCopyData(a3);

  if (!v28)
  {
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 356, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate."), v29, v30, (uint64_t)v47);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_msgSend(v22, "appendData:", v28);
  v31 = SecCertificateCopyKey(a3);
  v34 = v31;
  if (v31)
  {
    v25 = SecKeyCopyExternalRepresentation(v31, &error);
    if (v25)
    {
      v47 = 0;
      v37 = evaluateBAATrust(v22, v25, a4, &v47);
      v40 = v47;
      if ((v37 & 1) != 0)
      {
        v41 = 1;
LABEL_28:
        CFRelease(v34);
        v42 = v41;
        goto LABEL_29;
      }
      createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 383, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v40, CFSTR("Failed to verify BAA certificate."), v38, v39, (uint64_t)v47);
      v46 = objc_claimAutoreleasedReturnValue();

      v40 = (id)v46;
    }
    else
    {
      createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 376, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to copy public key data."), v35, v36, (uint64_t)v47);
      v40 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    createMobileActivationError((uint64_t)"evaluateBAATrustWithCerts", 370, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy public key."), v32, v33, (uint64_t)v47);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
LABEL_25:
  if (a7)
    *a7 = objc_retainAutorelease(v40);
  v41 = 0;
  v42 = 0;
  if (v34)
    goto LABEL_28;
LABEL_29:
  if (error)
    CFRelease(error);

  return v42;
}

id DeviceIdentityProcessVMRequest(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __SecTask *v10;
  __SecTask *v11;
  uint64_t v12;
  uint64_t v13;
  CFStringRef v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  CFErrorRef v33;
  CFErrorRef v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  unint64_t v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  id v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  __SecTask *v56;
  __CFString *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  CFErrorRef error;
  __CFString *v63;
  void *v64;
  uint8_t buf[4];
  __CFString *v66;
  __int16 v67;
  void *v68;
  const __CFString *v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  error = 0;
  v4 = 0x1E0CB3000uLL;
  if (is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 160, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is a VM (not supported)."), v2, v3, v54);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = 0;
    v57 = 0;
    v58 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_19;
  }
  v11 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v10 = v11;
  if (!v11)
  {
    v31 = CFSTR("Failed to create task.");
    v32 = 168;
    v33 = 0;
LABEL_18:
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", v32, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v33, v31, v12, v13, v54);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = 0;
    v57 = 0;
    v58 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_19;
  }
  v14 = SecTaskCopySigningIdentifier(v11, &error);
  if (!v14)
  {
    v33 = error;
    v31 = CFSTR("Failed to query code signing identifier.");
    v32 = 174;
    goto LABEL_18;
  }
  v15 = v1;
  v8 = (__CFString *)v14;
  v9 = (void *)SecTaskCopyValueForEntitlement(v10, CFSTR("com.apple.mobileactivationd.spi"), &error);
  isNSNumber(v9);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16 || (v17 = (void *)v16, v18 = objc_msgSend(v9, "BOOLValue"), v17, (v18 & 1) == 0))
  {
    v34 = error;
    v69 = CFSTR("com.apple.mobileactivationd.spi");
    v70[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 180, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, v34, CFSTR("Missing required entitlement: %@"), v36, v37, (uint64_t)v35);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v7 = 0;
    v57 = 0;
    v58 = 0;
    v4 = 0x1E0CB3000uLL;
    v1 = v15;
    goto LABEL_19;
  }
  v4 = 0x1E0CB3000uLL;
  v61 = 0;
  v1 = v15;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v15, 0, 0, &v61);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v61;
  isNSDictionary(v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v19;
  if (!v7)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 186, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, CFSTR("Failed to create dictionary from data."), v21, v22, v54);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v57 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HostProcessName"));
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  isNSString(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {

    v23 = CFSTR("unknown");
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Command"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v23;
  if (!v26)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 197, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Request missing required key: %@"), v27, v28, (uint64_t)CFSTR("Command"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v7 = v25;
    v1 = v15;
    v4 = 0x1E0CB3000;
    goto LABEL_19;
  }
  v7 = v25;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v66 = v23;
    v67 = 2114;
    v68 = v25;
    _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Host connection (%{public}@): %{public}@", buf, 0x16u);
  }
  v29 = objc_msgSend(v25, "isEqualToString:", CFSTR("CopyVMHostCertificateRequest"));
  v1 = v15;
  v4 = 0x1E0CB3000;
  if (v29)
  {
    v60 = v20;
    process_copy_host_certificate_request(v19, &v60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v60;
LABEL_36:
    v5 = v30;

    goto LABEL_19;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("CreateVMHostKeyAttestationRequest")))
  {
    v59 = v20;
    process_create_host_key_signature_request(v19, &v59);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v59;
    goto LABEL_36;
  }
  createMobileActivationError((uint64_t)"DeviceIdentityProcessVMRequest", 208, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid request: %@"), v52, v53, (uint64_t)v7);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
LABEL_19:
  if (v5)
  {
    v38 = v7;
    v55 = v9;
    v56 = v10;
    v39 = v8;
    v40 = v4;
    v41 = v1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v5;
      _os_log_impl(&dword_1D4F5D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error occurred processing request: %@", buf, 0xCu);
    }
    v42 = CFSTR("Error");
    v43 = (void *)MEMORY[0x1E0CB3940];
    -[__CFString localizedDescription](v5, "localizedDescription");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString userInfo](v5, "userInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ (%@)"), v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = v42;
    v64 = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v47 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v47;
    v48 = v40;
    v8 = v39;
    v9 = v55;
    v10 = v56;
  }
  else
  {
    v48 = v4;
    v41 = v1;
    v38 = v7;
    v42 = 0;
    v46 = 0;
  }
  if (v6)
    v49 = v6;
  else
    v49 = (void *)MEMORY[0x1E0C9AA70];
  objc_msgSend(*(id *)(v48 + 2224), "dataWithPropertyList:format:options:error:", v49, 100, 0, 0);
  v50 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    CFRelease(v10);
  if (error)
    CFRelease(error);

  return v50;
}

id process_copy_host_certificate_request(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;
  id v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v6 = v3;
  if (!v3)
  {
    createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 39, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v4, v5, v24);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = 0;
    v8 = 0;
LABEL_14:
    v22 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    isNSDictionary(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 45, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid key: %@"), v10, v11, (uint64_t)CFSTR("Options"));
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_14;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v12);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 51, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing or invalid required option: %@"), v13, v14, (uint64_t)CFSTR("BIKData"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v25 = 0;
  v26 = 0;
  v15 = libavp_copy_host_key_and_certs_with_data(v12, v8, &v26, &v25);
  v9 = v26;
  v18 = v25;
  if (v15)
    v19 = v9 == 0;
  else
    v19 = 1;
  if (v19)
  {
    createMobileActivationError((uint64_t)"process_copy_host_certificate_request", 57, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v18, CFSTR("Failed to decode host identity data."), v16, v17, v24);
    v20 = objc_claimAutoreleasedReturnValue();

    v22 = 0;
    v18 = (id)v20;
  }
  else
  {
    v29 = CFSTR("RKCertification");
    v30[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("Value");
    v28 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:
  if (a2 && !v22)
    *a2 = objc_retainAutorelease(v18);
  if (v15)
    CFRelease(v15);

  return v22;
}

id process_create_host_key_signature_request(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __SecKey *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  BOOL v22;
  CFDataRef v23;
  void *v24;
  CFDataRef Signature;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  CFTypeRef cf;
  const __CFString *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v6 = v3;
  cf = 0;
  if (!v3)
  {
    createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 89, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v4, v5, v29);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v12 = 0;
    v9 = 0;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    isNSDictionary(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 95, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid key: %@"), v10, v11, (uint64_t)CFSTR("Options"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BIKData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v32 = 0;
      v33 = 0;
      v18 = (__SecKey *)libavp_copy_host_key_and_certs_with_data(v12, v8, &v33, &v32);
      v13 = v33;
      v21 = v32;
      if (v18)
        v22 = v13 == 0;
      else
        v22 = 1;
      if (v22)
      {
        createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 113, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v21, CFSTR("Failed to decode host identity data."), v19, v20, v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v23 = 0;
      }
      else
      {
        Signature = SecKeyCreateSignature(v18, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)v9, (CFErrorRef *)&cf);
        v23 = Signature;
        if (Signature)
        {
          v37[0] = CFSTR("RKSignature");
          v37[1] = CFSTR("RKCertification");
          v38[0] = Signature;
          v38[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = CFSTR("Value");
          v36 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 119, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, (void *)cf, CFSTR("Failed to create signature."), v27, v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();

      }
      v24 = 0;
      v21 = (id)v30;
      goto LABEL_17;
    }
    createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 107, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing or invalid required option: %@"), v16, v17, (uint64_t)CFSTR("Value"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    createMobileActivationError((uint64_t)"process_create_host_key_signature_request", 101, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Missing or invalid required option: %@"), v14, v15, (uint64_t)CFSTR("BIKData"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
LABEL_16:
  v23 = 0;
  v24 = 0;
  v18 = 0;
LABEL_17:
  if (a2 && !v24)
    *a2 = objc_retainAutorelease(v21);
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (v18)
    CFRelease(v18);

  return v24;
}

uint64_t DeviceIdentityValidateIdentity(__SecKey *a1, __SecCertificate *a2, __SecCertificate *a3, void *a4, BOOL *a5, _QWORD *a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __SecCertificate *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int valid;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  _BOOL4 v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  _BOOL4 v59;
  unsigned int v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  int v81;
  BOOL *v82;
  int v83;
  char v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;

  v11 = a4;
  if ((isRunningInRecovery() & 1) != 0 || isRunningInDiagnosticsMode())
  {
    v16 = CFSTR("SPI not allowed for processes running in recoveryOS or diagnostics mode.");
    v17 = 256;
    v18 = -3;
LABEL_4:
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", v17, CFSTR("com.apple.MobileActivation.ErrorDomain"), v18, 0, v16, v12, v13, v79);
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_6;
  }
  if (!a2 || !a3)
  {
    v16 = CFSTR("Invalid input(s).");
    v17 = 263;
    v18 = -2;
    goto LABEL_4;
  }
  if (a1)
  {
    v91 = 0;
    valid = security_valid_security_enclave_reference_key(a1, 0, 0, &v91, v14, v15, v12, v13);
    v29 = v91;
    v32 = v29;
    if (!valid
      || (v90 = v29,
          v33 = security_certificate_matches_key(a1, 0, a2, &v90),
          v34 = v90,
          v32,
          v85 = v34,
          v32 = v34,
          (v33 & 1) == 0))
    {
      createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 270, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, v32, CFSTR("Invalid reference key."), v30, v31, v79);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_5;
    }
  }
  else
  {
    v85 = 0;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = a5;
  if (v36)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");

  }
  else
  {
    v38 = 0;
  }
  v39 = is_virtual_machine();
  v40 = objc_alloc(MEMORY[0x1E0C99EA0]);
  objc_msgSend(v40, "persistentDomainForName:", CFSTR("com.apple.mobileactivationd"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String");
  if (os_variant_allows_internal_security_policies()
    && (objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("UseQACertificates")),
        v41 = (void *)objc_claimAutoreleasedReturnValue(),
        isNSNumber(v41),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("UseQACertificates"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v43, "BOOLValue");

  }
  else
  {
    v83 = 0;
  }
  v44 = v39 | v38;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CertType"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    v22 = 0;
LABEL_35:
    v58 = v83;
    v59 = is_virtual_machine();
    if (v44)
      v60 = 2;
    else
      v60 = 1;
    if (v59)
      v61 = 4;
    else
      v61 = v60;
    goto LABEL_41;
  }
  v81 = v44;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CertType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToNumber:", v47))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v22, "isEqualToNumber:", v48);

    if ((v80 & 1) == 0)
    {
      createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 299, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), v49, v50, (uint64_t)CFSTR("CertType"));
      goto LABEL_52;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v22, "isEqualToNumber:", v51);

  if (!v52)
  {
    v44 = v81;
    goto LABEL_35;
  }
  if (is_virtual_machine())
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 310, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Certificate type (%@) is not supported on virtual machines."), v56, v57, (uint64_t)v22);
LABEL_52:
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v21 = 0;
LABEL_6:
    v24 = 0;
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v61 = 3;
  v44 = v81;
  v58 = v83;
LABEL_41:
  v89 = v85;
  copyRootCertificate(v61, v58, &v89, v53, v54, v55, v56, v57);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v89;

  if (!v21)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 325, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v62, CFSTR("Failed to load BAA root CA certificate."), v63, v64, v79);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    goto LABEL_6;
  }
  v88 = v62;
  v20 = lockcrypto_cert_from_pem_data(v21, &v88);
  v86 = v88;

  if (!v20)
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 331, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v86, CFSTR("Failed to create certificate from pem data."), v65, v66, v79);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v87 = v86;
  v84 = evaluateBAATrustWithCerts(a2, a3, v20, v44, 1, 0, &v87);
  v19 = v87;

  if ((v84 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceReferenceDate");
    if (SecCertificateIsValid())
    {
      objc_msgSend(v24, "timeIntervalSinceReferenceDate");
      if (SecCertificateIsValid())
      {
        SecCertificateNotValidAfter();
        v72 = v71;
        SecCertificateNotValidBefore();
        v74 = v73;
        objc_msgSend(v24, "timeIntervalSinceReferenceDate");
        v76 = v75;
        SecCertificateNotValidBefore();
        if (v82)
          *v82 = v76 - v77 >= (v72 - v74) * 0.9;
        v25 = 1;
        goto LABEL_9;
      }
    }
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 355, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v19, CFSTR("BAA certificate is expired."), v69, v70, v79);
    v78 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    createMobileActivationError((uint64_t)"DeviceIdentityValidateIdentity", 338, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v19, CFSTR("Failed to verify BAA certificate."), v67, v68, v79);
    v78 = objc_claimAutoreleasedReturnValue();

    v24 = 0;
  }
  v19 = (id)v78;
  if (a6)
LABEL_7:
    *a6 = objc_retainAutorelease(v19);
LABEL_8:
  v25 = 0;
  v26 = 0;
  if (v20)
  {
LABEL_9:
    CFRelease(v20);
    v26 = v25;
  }

  return v26;
}

uint64_t createXMLRequest(void *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  id v24;

  v7 = a1;
  if (!v7)
  {
    createMobileActivationError((uint64_t)"createXMLRequest", 57, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), v5, v6, v23);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!a3)
    {
LABEL_12:
      v17 = 0;
      v13 = 0;
      goto LABEL_13;
    }
LABEL_8:
    v11 = objc_retainAutorelease(v11);
    v17 = 0;
    v13 = 0;
    *a3 = v11;
    goto LABEL_13;
  }
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (!v8)
  {
    v18 = CFSTR("Failed to convert dictionary to data");
    v19 = 67;
    v20 = v11;
    goto LABEL_11;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  if (!v12)
  {
    v18 = CFSTR("Failed to allocate request.");
    v19 = 74;
    v20 = 0;
LABEL_11:
    createMobileActivationError((uint64_t)"createXMLRequest", v19, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, v18, v9, v10, v23);
    v21 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v21;
    if (!a3)
      goto LABEL_12;
    goto LABEL_8;
  }
  v13 = v12;
  objc_msgSend(v12, "setCachePolicy:", 0);
  LODWORD(v14) = NETWORK_TIMEOUT_SECONDS;
  objc_msgSend(v13, "setTimeoutInterval:", (double)v14);
  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("application/xml"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v15, CFSTR("Content-Type"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v8, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v16, CFSTR("Content-Length"));

  objc_msgSend(v13, "setHTTPBody:", v8);
  if (a2)
  {
    v13 = objc_retainAutorelease(v13);
    *a2 = v13;
  }
  v17 = 1;
LABEL_13:

  return v17;
}

uint64_t security_committed_uik_is_legacy(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(CFSTR("systemgroup.com.apple.mobileactivationd"), "UTF8String");
  v4 = (void *)container_system_group_path_for_identifier();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Library/uik/uik.pem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

    v9 = 0;
    if (!a1)
      goto LABEL_7;
  }
  else
  {
    createMobileActivationError((uint64_t)"security_committed_uik_is_legacy", 142, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query group container path: %d"), v2, v3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!a1)
      goto LABEL_7;
  }
  if ((v8 & 1) == 0)
    *a1 = objc_retainAutorelease(v9);
LABEL_7:
  if (v4)
    free(v4);

  return v8;
}

__SecKey *security_copy_system_key(uint64_t a1, const __CFData **a2, _QWORD *a3)
{
  void *v6;
  int is_legacy;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __SecKey *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  SecAccessControlRef v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFDictionary *v33;
  SecKeyRef v34;
  uint64_t v35;
  uint64_t v36;
  SecKeyRef v37;
  uint64_t v38;
  uint64_t v39;
  __SecKey *v40;
  uint64_t v41;
  uint64_t v42;
  __SecKey *v43;
  CFDataRef v44;
  const __CFData *v45;
  __CFString *v46;
  uint64_t v47;
  CFErrorRef v48;
  const __CFData *v49;
  __SecKey *v50;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  SecAccessControlRef cf;
  CFTypeRef cfa;
  id v60;
  CFErrorRef v61;
  id v62;
  uint64_t v63;
  CFErrorRef error;
  _QWORD v65[4];
  _QWORD v66[5];

  v6 = 0;
  v66[4] = *MEMORY[0x1E0C80C00];
  v61 = 0;
  if ((_DWORD)a1 != 2)
    goto LABEL_12;
  v60 = 0;
  is_legacy = security_committed_uik_is_legacy(&v60);
  v8 = v60;
  v6 = v8;
  if ((is_legacy & 1) == 0 && v8)
  {
    createMobileActivationError((uint64_t)"security_copy_system_key", 180, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v8, CFSTR("Failed to query legacy UIK support."), v9, v10, v56);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
LABEL_19:
    v43 = 0;
    goto LABEL_23;
  }
  if (!is_legacy)
  {
LABEL_12:
    v12 = (__SecKey *)SecKeyCopySystemKey();
    if (!v12)
    {
      createMobileActivationError((uint64_t)"security_copy_system_key", 195, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v61, CFSTR("Failed to copy system key (%d)."), v38, v39, a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  v63 = 1;
  error = 0;
  objc_msgSend(CFSTR("systemgroup.com.apple.mobileactivationd"), "UTF8String");
  v15 = (void *)container_system_group_path_for_identifier();
  if (!v15)
  {
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 44, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query group container path: %d"), v13, v14, v63);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v23 = 0;
    v17 = 0;
LABEL_34:
    v37 = 0;
    v12 = 0;
    goto LABEL_40;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("Library/uik/uik.pem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

  if ((v19 & 1) == 0)
  {
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 50, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Legacy UIK does not exist."), v20, v21, v56);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v23 = 0;
    goto LABEL_34;
  }
  v22 = objc_alloc(MEMORY[0x1E0C99D50]);
  v62 = 0;
  v23 = (void *)objc_msgSend(v22, "initWithContentsOfFile:options:error:", v17, 0, &v62);
  v26 = v62;
  if (v23)
  {
    v27 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68D0], 0x40000000uLL, &error);
    if (v27)
    {
      v30 = *MEMORY[0x1E0CD6B98];
      v65[0] = *MEMORY[0x1E0CD69D8];
      v65[1] = v30;
      v31 = *MEMORY[0x1E0CD6BA0];
      v66[0] = MEMORY[0x1E0C9AAA0];
      v66[1] = v31;
      v32 = *MEMORY[0x1E0CD6890];
      v65[2] = *MEMORY[0x1E0CD6BB8];
      v65[3] = v32;
      v66[2] = v23;
      v66[3] = v27;
      cf = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
      v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v34 = SecKeyCreateWithData((CFDataRef)objc_msgSend(MEMORY[0x1E0C99D50], "data"), v33, &error);
      v37 = v34;
      if (v34)
      {
        v12 = (__SecKey *)CFRetain(v34);
      }
      else
      {
        createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 74, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to query UIK."), v35, v36, v56);
        v57 = objc_claimAutoreleasedReturnValue();

        v12 = 0;
        v26 = (id)v57;
      }
      CFRelease(cf);
      goto LABEL_40;
    }
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 62, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create access control."), v28, v29, v56);
  }
  else
  {
    createMobileActivationError((uint64_t)"copy_legacy_committed_uik", 56, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v26, CFSTR("Failed to load %@."), v24, v25, (uint64_t)v17);
  }
  cfa = (CFTypeRef)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v37 = 0;
  v12 = 0;
  v26 = (id)cfa;
LABEL_40:
  if (error)
    CFRelease(error);
  error = 0;
  if (v37)
    CFRelease(v37);
  if (v15)
    free(v15);
  v52 = v6;
  if (!v12)
    v52 = objc_retainAutorelease(v26);

  v53 = v52;
  if (!v12)
  {
    createMobileActivationError((uint64_t)"security_copy_system_key", 189, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v53, CFSTR("Failed to copy system key (legacy)."), v54, v55, v56);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v6 = v53;
    goto LABEL_23;
  }
  v6 = v53;
LABEL_13:
  v40 = SecKeyCopyPublicKey(v12);
  v43 = v40;
  if (v40)
  {
    v44 = SecKeyCopyExternalRepresentation(v40, &v61);
    if (v44)
    {
      v45 = v44;
      if (a2)
      {
        v45 = objc_retainAutorelease(v44);
        *a2 = v45;
      }
      v11 = v6;
      goto LABEL_28;
    }
    v48 = v61;
    v46 = CFSTR("Failed to copy public key buffer.");
    v47 = 208;
  }
  else
  {
    v46 = CFSTR("Failed to copy public key.");
    v47 = 202;
    v48 = 0;
  }
  createMobileActivationError((uint64_t)"security_copy_system_key", v47, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v48, v46, v41, v42, v56);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  if (a3)
    *a3 = objc_retainAutorelease(v11);
  if (v12)
    CFRelease(v12);
  v45 = 0;
  v12 = 0;
  v49 = 0;
  v50 = 0;
  if (v43)
  {
LABEL_28:
    CFRelease(v43);
    v49 = v45;
    v50 = v12;
  }
  if (v61)
    CFRelease(v61);
  v61 = 0;

  return v50;
}

id security_create_system_key_attestation(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  __SecKey *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *Attestation;
  id v19;
  uint64_t v20;
  void *v21;
  id v23;
  CFTypeRef cf;

  v9 = a3;
  cf = 0;
  if (!a1)
  {
    createMobileActivationError((uint64_t)"security_create_system_key_attestation", 242, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input(s)"), v7, v8, (uint64_t)v23);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    if (!a4)
    {
LABEL_16:
      v19 = 0;
      v21 = 0;
      if (!v10)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_15:
    *a4 = objc_retainAutorelease(v13);
    goto LABEL_16;
  }
  v23 = 0;
  v10 = security_copy_system_key(a2, 0, &v23);
  v13 = v23;
  if (!v10)
  {
    v14 = CFSTR("Failed to copy attestation key.");
    v15 = 248;
    v16 = -1;
    v17 = v13;
    goto LABEL_14;
  }
  if (v9)
  {
    if ((unint64_t)objc_msgSend(v9, "length") >= 0x21)
    {
      v14 = CFSTR("Nonce is too big (> 32 bytes).");
      v15 = 254;
      v16 = -2;
      v17 = 0;
      goto LABEL_14;
    }
    if (!SecKeySetParameter())
    {
      v17 = (void *)cf;
      v14 = CFSTR("Failed to set nonce.");
      v15 = 259;
      v16 = -1;
LABEL_14:
      createMobileActivationError((uint64_t)"security_create_system_key_attestation", v15, CFSTR("com.apple.MobileActivation.ErrorDomain"), v16, v17, v14, v11, v12, (uint64_t)v23);
      v20 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v20;
      if (!a4)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  Attestation = (void *)SecKeyCreateAttestation();
  if (!Attestation)
  {
    v17 = (void *)cf;
    v14 = CFSTR("Failed to create attestation.");
    v15 = 266;
    v16 = -11;
    goto LABEL_14;
  }
  v19 = Attestation;
LABEL_17:
  CFRelease(v10);
  v21 = v19;
LABEL_18:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v21;
}

id security_create_attestation(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *Attestation;
  id v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  if (a1 && a2)
  {
    Attestation = (void *)SecKeyCreateAttestation();
    if (Attestation)
    {
      v10 = Attestation;
      v11 = 0;
      goto LABEL_10;
    }
    v12 = CFSTR("Failed to create attestation.");
    v13 = 299;
    v14 = -11;
  }
  else
  {
    v12 = CFSTR("Invalid input(s)");
    v13 = 293;
    v14 = -1;
  }
  createMobileActivationError((uint64_t)"security_create_attestation", v13, CFSTR("com.apple.MobileActivation.ErrorDomain"), v14, 0, v12, a7, a8, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (a3)
  {
    v11 = objc_retainAutorelease(v15);
    v10 = 0;
    *a3 = v11;
  }
  else
  {
    v10 = 0;
  }
LABEL_10:

  return v10;
}

id security_create_external_representation(__SecKey *a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef v10;
  uint64_t v11;
  uint64_t v12;
  CFDictionaryRef v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    createMobileActivationError((uint64_t)"security_create_external_representation", 328, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."), a7, a8, v23);
    a2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    if (a3)
    {
LABEL_11:
      a2 = objc_retainAutorelease(a2);
      v18 = 0;
      *a3 = a2;
      goto LABEL_12;
    }
LABEL_7:
    v18 = 0;
    goto LABEL_12;
  }
  v10 = SecKeyCopyAttributes(a1);
  v13 = v10;
  if (!v10)
  {
    v20 = CFSTR("Failed to copy RK attributes.");
    v21 = 334;
    goto LABEL_10;
  }
  -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6BB8]);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v20 = CFSTR("Failed to encode RK as data.");
    v21 = 340;
LABEL_10:
    createMobileActivationError((uint64_t)"security_create_external_representation", v21, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, v20, v11, v12, v23);
    a2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_11;
    goto LABEL_7;
  }
  v15 = (void *)v14;
  v16 = *MEMORY[0x1E0CD70C0];
  -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70C0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v15;
  if (a2)
  {
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17 != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    a2 = 0;
  }
LABEL_12:

  return v18;
}

uint64_t security_valid_security_enclave_reference_key(SecKeyRef key, int a2, char *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __SecKey *Duplicate;
  const __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFDataRef v39;
  CFDataRef v40;
  __SecKey *v41;
  const void *v42;
  SecKeyRef v43;
  id v44;
  const __CFDictionary *v45;
  void *v46;
  const __CFDictionary *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CFDataRef v52;
  void *v53;
  char v55;
  __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  CFErrorRef v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const __CFDictionary *v67;
  SecKeyRef v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  const __CFDictionary *theDict;
  const __CFDictionary *v80;
  void *v81;
  const void *v82;
  void *v83;
  id v84;
  CFErrorRef error;
  _QWORD v86[5];
  _QWORD v87[7];

  Duplicate = key;
  v87[5] = *MEMORY[0x1E0C80C00];
  error = 0;
  if (!key)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 394, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input."), a7, a8, v77);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v82 = 0;
    v43 = 0;
LABEL_23:
    v16 = 0;
    v80 = 0;
    v81 = 0;
    v83 = 0;
    goto LABEL_35;
  }
  v12 = SecKeyCopyAttributes(key);
  if (!v12)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 400, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query attributes."), v13, v14, v77);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v82 = 0;
    v43 = 0;
    Duplicate = 0;
    goto LABEL_23;
  }
  v15 = *MEMORY[0x1E0CD6B98];
  theDict = v12;
  CFDictionaryGetValue(v12, (const void *)*MEMORY[0x1E0CD6B98]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 406, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query attribute '%@'."), v18, v19, v15);
LABEL_27:
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    v82 = 0;
LABEL_32:
    v43 = 0;
    Duplicate = 0;
    v83 = 0;
    goto LABEL_33;
  }
  if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CD6BB0]) & 1) == 0
    && (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CD6BA0]) & 1) == 0)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 412, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid key type (actual, expected): (%@, %@)"), v20, v21, (uint64_t)v16);
    goto LABEL_27;
  }
  v22 = *MEMORY[0x1E0CD6A20];
  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CD6A20]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v23;
  if (!v24)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 418, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query attribute '%@'."), v25, v26, v22);
LABEL_31:
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    goto LABEL_32;
  }
  if (objc_msgSend(v23, "unsignedIntValue") != 256
    && objc_msgSend(v23, "unsignedIntValue") != 384)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 423, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Unsupported key size: %@"), v27, v28, (uint64_t)v23);
    goto LABEL_31;
  }
  v78 = a3;
  v29 = *MEMORY[0x1E0CD6A38];
  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CD6A38]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = v30;
  if (!v31)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 429, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to query attribute '%@'."), v32, v33, v29);
LABEL_29:
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    v43 = 0;
    Duplicate = 0;
LABEL_33:
    v80 = 0;
LABEL_34:
    v45 = theDict;
    goto LABEL_35;
  }
  v34 = *MEMORY[0x1E0CD6A50];
  if ((objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CD6A50]) & 1) == 0
    && (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CD6A58]) & 1) == 0
    && (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CD6A80]) & 1) == 0
    && (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CD6A78]) & 1) == 0)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 441, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Unsupported key type: %@"), v35, v36, (uint64_t)v30);
    goto LABEL_29;
  }
  if (!a2)
  {
    v42 = 0;
    v43 = 0;
    v41 = 0;
    goto LABEL_49;
  }
  Duplicate = (__SecKey *)SecKeyCreateDuplicate();
  if (!Duplicate)
  {
    v56 = CFSTR("Failed to create duplicate RK.");
    v57 = 448;
    v58 = -1;
    v59 = 0;
LABEL_61:
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", v57, CFSTR("com.apple.MobileActivation.ErrorDomain"), v58, v59, v56, v37, v38, v77);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v82 = 0;
LABEL_62:
    v43 = 0;
    goto LABEL_33;
  }
  if (!SecKeySetParameter())
  {
    v59 = error;
    v56 = CFSTR("Failed to set RK parameter.");
    v57 = 456;
LABEL_60:
    v58 = -1;
    goto LABEL_61;
  }
  if ((objc_msgSend(v30, "isEqualToString:", v34) & 1) != 0
    || objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CD6A58]))
  {
    v39 = SecKeyCreateSignature(Duplicate, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)objc_msgSend(MEMORY[0x1E0C99D50], "data"), &error);
    if (v39)
    {
      v40 = v39;
      v41 = Duplicate;
      v42 = 0;
      v43 = 0;
LABEL_50:
      v50 = 0;
      v80 = 0;
      v44 = 0;
      v45 = theDict;
LABEL_51:
      v82 = v42;
      if (v78)
      {
        v46 = v16;
        if ((objc_msgSend(v83, "isEqualToString:", *MEMORY[0x1E0CD6A80]) & 1) != 0)
          v55 = 1;
        else
          v55 = objc_msgSend(v83, "isEqualToString:", *MEMORY[0x1E0CD6A78]);
        v45 = theDict;
        *v78 = v55;
      }
      else
      {
        v46 = v16;
      }
      v49 = 1;
LABEL_38:
      CFRelease(v45);
      v51 = v49;
      v52 = v40;
      v53 = (void *)v50;
      goto LABEL_39;
    }
    if (mobileactivationErrorHasDomainAndErrorCode(error, (void *)*MEMORY[0x1E0CA9B28], -3))
    {
      v59 = error;
      v56 = CFSTR("Failed to create test signature.");
      v57 = 464;
      v58 = -2;
      goto LABEL_61;
    }
    v41 = Duplicate;
    v42 = 0;
    v43 = 0;
LABEL_49:
    v40 = 0;
    goto LABEL_50;
  }
  v60 = SecAccessControlCreate();
  if (!v60)
  {
    v59 = error;
    v56 = CFSTR("Failed to create access control.");
    v57 = 470;
    goto LABEL_60;
  }
  v61 = *MEMORY[0x1E0CD68D8];
  v62 = v60;
  v82 = (const void *)v60;
  if ((SecAccessControlSetProtection() & 1) == 0)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 475, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to set ACL protection to %@."), v63, v64, v61);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  v86[0] = *MEMORY[0x1E0CD69D8];
  v86[1] = v15;
  v65 = *MEMORY[0x1E0CD6BA0];
  v87[0] = MEMORY[0x1E0C9AAA0];
  v87[1] = v65;
  v66 = *MEMORY[0x1E0CD6890];
  v86[2] = v29;
  v86[3] = v66;
  v87[2] = v34;
  v87[3] = v62;
  v86[4] = v22;
  v87[4] = &unk_1E98CE7E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 5);
  v67 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v68 = SecKeyCreateRandomKey(v67, &error);
  v43 = v68;
  v80 = v67;
  if (!v68)
  {
    createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 488, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create reference key."), v72, v73, v77);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v84 = 0;
  v41 = Duplicate;
  security_create_attestation((uint64_t)v68, (uint64_t)Duplicate, &v84, v69, v70, v71, v72, v73);
  v50 = objc_claimAutoreleasedReturnValue();
  v44 = v84;
  if (v50)
  {
    v40 = 0;
    v45 = theDict;
    v42 = v82;
    goto LABEL_51;
  }
  createMobileActivationError((uint64_t)"security_valid_security_enclave_reference_key", 494, CFSTR("com.apple.MobileActivation.ErrorDomain"), -11, v44, CFSTR("Failed to create test attestation."), v74, v75, v77);
  v76 = objc_claimAutoreleasedReturnValue();

  v44 = (id)v76;
  v45 = theDict;
  Duplicate = v41;
LABEL_35:
  v41 = Duplicate;
  v46 = v16;
  if (a4)
  {
    v47 = v45;
    v48 = objc_retainAutorelease(v44);
    v45 = v47;
    *a4 = v48;
  }
  v49 = 0;
  v40 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  if (v45)
    goto LABEL_38;
LABEL_39:
  if (error)
    CFRelease(error);
  error = 0;
  if (v82)
    CFRelease(v82);
  if (v43)
    CFRelease(v43);
  if (v41)
    CFRelease(v41);

  return v51;
}

uint64_t security_certificate_matches_key(__SecKey *a1, void *a2, __SecCertificate *a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  __SecKey *v10;
  uint64_t v11;
  uint64_t v12;
  __SecKey *v13;
  CFDataRef v14;
  void *v15;
  __SecKey *v16;
  uint64_t v17;
  uint64_t v18;
  __SecKey *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFDataRef v24;
  uint64_t v25;
  CFErrorRef v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  CFErrorRef error;

  v9 = a2;
  error = 0;
  if (!a1 || !a3)
  {
    createMobileActivationError((uint64_t)"security_certificate_matches_key", 533, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."), v7, v8, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v16 = 0;
    v13 = 0;
    goto LABEL_20;
  }
  v10 = SecKeyCopyPublicKey(a1);
  v13 = v10;
  if (!v10)
  {
    createMobileActivationError((uint64_t)"security_certificate_matches_key", 539, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK public key."), v11, v12, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_19:
    v16 = 0;
LABEL_20:
    v24 = 0;
    if (!a4)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v9)
  {
    v14 = (CFDataRef)v9;
    goto LABEL_9;
  }
  v14 = SecKeyCopyExternalRepresentation(v10, &error);
  if (!v14)
  {
    createMobileActivationError((uint64_t)"security_certificate_matches_key", 548, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to copy RK public key buffer."), v17, v18, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_9:
  v19 = SecCertificateCopyKey(a3);
  v16 = v19;
  if (!v19)
  {
    createMobileActivationError((uint64_t)"security_certificate_matches_key", 557, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve certificate public key."), v20, v21, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v24 = SecKeyCopyExternalRepresentation(v19, &error);
  if (!v24)
  {
    v26 = error;
    v27 = CFSTR("Failed to encode certificate public key as data.");
    v28 = 563;
    goto LABEL_16;
  }
  if ((-[__CFData isEqualToData:](v14, "isEqualToData:", v24) & 1) == 0)
  {
    v27 = CFSTR("Certificate public key does not match RK public key.");
    v28 = 570;
    v26 = 0;
LABEL_16:
    createMobileActivationError((uint64_t)"security_certificate_matches_key", v28, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v26, v27, v22, v23, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
    {
LABEL_22:
      v25 = 0;
      v29 = 0;
      if (!v13)
        goto LABEL_24;
      goto LABEL_23;
    }
LABEL_21:
    *a4 = objc_retainAutorelease(v15);
    goto LABEL_22;
  }
  v15 = 0;
  v25 = 1;
LABEL_23:
  CFRelease(v13);
  v29 = v25;
LABEL_24:
  if (v16)
    CFRelease(v16);
  if (error)
    CFRelease(error);
  error = 0;

  return v29;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result)
              return result;
            v3 = 0x1000000000;
          }
          else
          {
            v3 = 0x800000000;
          }
        }
        else
        {
          v3 = 0x400000000;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 3840;
    }
    *(_QWORD *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  double result;
  time_t v3;
  tm v4;
  time_t v5;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6))
      goto LABEL_3;
    v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      v3 = timegm(&v4);
      result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(_QWORD *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6))
          *(_QWORD *)(a1 + 240) |= 0x1000000000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!result)
    return result;
  v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  v4 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(_BYTE *)(v3 + 17))
      result = X509PolicySetFlagsForTestAnchor((_QWORD *)v3, a2);
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0)
    goto LABEL_15;
  result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result)
    goto LABEL_13;
  v5 = *(_QWORD *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(_QWORD *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(_QWORD *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= 0x6400000uLL;
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[2];
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!(_DWORD)result)
  {
    result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= a1[1];
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t vars0;

  result = 0;
  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              v21 = 0xAAAAAAAAAAAAAAAALL;
              v22 = 0xAAAAAAAAAAAAAAAALL;
              v10 = a5[9];
              v9 = a5[10];
              if (__CFADD__(v10, v9))
                goto LABEL_31;
              if (v10 > v10 + v9)
                goto LABEL_32;
              v21 = a5[9];
              v22 = v10 + v9;
              if (!v9 || (result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    result = ccder_decode_rsa_pub_n();
                    if (!result)
                      return result;
                    v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    v12 = result << 6;
                    if (result << 6 < 0x400)
                      return 0;
                    v25 = 0xAAAAAAAAAAAAAAAALL;
                    v26 = -21846;
                    v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          v14 = __memcpy_chk();
                          if (v12 > 0x1068)
                            return 0;
                          result = MEMORY[0x1E0C80A78](v14);
                          v16 = (unint64_t *)((char *)&v20 - v15);
                          v17 = 0;
                          *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v19 = &v16[v17 / 8];
                            *(_OWORD *)v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *v16 = v11;
                            if (ccrsa_import_pub())
                              return 0;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs())
                              return v23 != 0;
                            result = 0;
                            v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  BOOL v7;

  v6 = 0;
  v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3))
      break;
    v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0;
  int is_supported;
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v0 = ccec_x963_import_pub_size();
  is_supported = ccec_keysize_is_supported();
  v2 = &CTOidSECP256r1;
  v3 = &CTOidSECP521r1;
  v4 = &CTOidSECP384r1;
  if (v0 != 384)
    v4 = 0;
  if (v0 != 521)
    v3 = v4;
  if (v0 != 256)
    v2 = v3;
  if (is_supported)
    return v2;
  else
    return 0;
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  result = 0;
  v18 = *MEMORY[0x1E0C80C00];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                v8 = *(_QWORD *)result;
                if (*(_QWORD *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  v9 = 24 * v8;
                  v10 = __CFADD__(v9, 16);
                  v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    result = MEMORY[0x1E0C80A78](result);
                    v14 = (uint64_t *)((char *)&v17 - v12);
                    v15 = 0;
                    do
                    {
                      v16 = &v14[v15 / 8];
                      *v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *v14 = result;
                      if (v12 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          result = ccec_x963_import_pub_size();
                          if (result == 256 && *(_QWORD *)(a5 + 96) == 64)
                          {
                            if (*(_QWORD *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite())
                                return HIBYTE(v17) != 0;
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify())
LABEL_24:
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  int *v1;
  int *v3;
  int v5;
  int v6;

  if (!a1)
    return 0;
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(_QWORD *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793)
      JUMPOUT(0x1D826CDC4);
    return 0;
  }
  v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497)
    JUMPOUT(0x1D826CDD0);
  v5 = *v3;
  v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713)
    return 0;
  return ccec_cp_521();
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 <= *(_QWORD *)(a2 + 8))
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1])
      goto LABEL_20;
    v5 = *a1;
    v6 = *a1;
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (a2)
    {
      if (v6 < v5)
        goto LABEL_20;
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      result = ccder_blob_decode_tl();
      if (!(_DWORD)result)
        return result;
      if (v5 != v6)
        return 0;
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(_QWORD *a1)
{
  if (*a1 > a1[1])
    goto LABEL_6;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return 0;
  if (*a1 > a1[1])
LABEL_6:
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = 327696;
  if (!result || !a2)
    return v3;
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, v12);
    v6 = 327697;
    if (!v5 && !HIDWORD(v12[0]))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        v6 = 327699;
        if (!v7)
        {
          v8 = v10;
          if (v10 <= 0xFF)
          {
            v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12[0];
              *(_QWORD *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(_QWORD *)(a3 + 24) = 0;
              *(_QWORD *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, _QWORD *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  signed int v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;

  v2 = *(unsigned __int8 **)result;
  v3 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result > v3)
    goto LABEL_50;
  v4 = (_QWORD *)result;
  v5 = *(unsigned __int8 **)result;
  if (*(_QWORD *)result < v3)
  {
    v6 = v3 - (_QWORD)v2;
    v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7)
        goto LABEL_50;
      *(_QWORD *)result = v7;
      ++v5;
      if (!--v6)
      {
        v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5)
    goto LABEL_50;
  result = 327708;
  if (v5 == (unsigned __int8 *)v3)
    return result;
  v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16)
    return result;
  if (v5 == (unsigned __int8 *)-1)
    goto LABEL_51;
  v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_50:
    __break(0x5519u);
LABEL_51:
    __break(0x5513u);
LABEL_52:
    __break(0x5500u);
    return result;
  }
  v10 = 0;
  *v4 = v9;
  if (v2 >= v5 || (v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_46:
    result = 0;
    if (a2)
      *a2 = v10;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v13 = v11 >> 1;
    v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte)
          goto LABEL_51;
        v17 = &asciiNibbleToByte[v16];
        v18 = v17 < byte_1D4F853B2 && v17 >= asciiNibbleToByte;
        if (!v18)
          goto LABEL_50;
        if (v2 == (unsigned __int8 *)-1)
          goto LABEL_51;
        if (v2 + 1 > v5 || v2 > v2 + 1)
          goto LABEL_50;
        v15 = *v17;
        ++v2;
      }
      else
      {
        v15 = 0;
      }
      if (v2 >= v5)
        return 327703;
      v19 = &asciiNibbleToByte[*v2];
      if (v19 >= byte_1D4F853B2 || v19 < asciiNibbleToByte)
        goto LABEL_50;
      v21 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v21)
        goto LABEL_50;
      if (v15 > 0xF)
        return 327703;
      v22 = *v19;
      if (v22 > 0xF)
        return 327703;
      v23 = (unint64_t)(v22 | (16 * v15)) << (v14 & 0xF8);
      v18 = __CFADD__(v10, v23);
      v10 += v23;
      if (v18)
        goto LABEL_52;
      if (v21 < v5)
      {
        v14 -= 8;
        v12 = 1;
        v2 = v21;
        if (v13-- > 1)
          continue;
      }
      goto LABEL_46;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, __int128 *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  _BYTE *v22;
  BOOL v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[4];
  _BYTE v39[272];
  uint64_t v40;
  _QWORD v41[117];

  v41[116] = *MEMORY[0x1E0C80C00];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_42;
  v36 = a1 + a2;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v35 = a1;
  result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if ((_DWORD)result)
    return result;
  if (v35 != v36)
    return 327690;
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    v20 = v38[0];
    v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0])
      v21 = &v38[1];
    *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7)
      v23 = a8 == 0;
    else
      v23 = 1;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23)
      v25 = a3;
    else
      v25 = 1;
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      v27 = (_UNKNOWN **)*((_QWORD *)a11 + 5);
    }
    else
    {
      v26 = *((_QWORD *)a11 + 4);
      *(_QWORD *)&v32[8] = v34;
      *(_QWORD *)&v32[16] = v26;
      v27 = oidForPubKeyLength();
    }
    v28 = *((_QWORD *)a11 + 6);
    *(_QWORD *)&v32[24] = v27;
    v33 = v28;
    result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!(_DWORD)result)
    {
      v29 = (_QWORD *)v38[0];
      if (!a5 || !a6 || !v38[0] || (result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        result = 0;
        if (a9)
        {
          if (v29)
          {
            result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        v22 = (_BYTE *)*((_QWORD *)v22 + 34);
        if (!v22)
        {
          v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = v39;
  }
  result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result)
    goto LABEL_20;
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  if ((a1 & 0x800000) != 0 && a4)
  {
    result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  else if (!a4)
  {
    return 0;
  }
  result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      result = 0;
      *(_QWORD *)(a4 + 24) = a2;
      *(_QWORD *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  int v40;
  int v41;
  unint64_t v43;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _OWORD v70[10];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v68 = 0;
  v69 = 0;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v66 = *a2;
  v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return v10;
  v12 = v69;
  v13 = v66;
  v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v67)
    goto LABEL_186;
  v64 = v13;
  v65 = v15;
  v62 = v13;
  v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68))
      goto LABEL_187;
    v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63)
        goto LABEL_186;
      v64 = v62 + v68;
      v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl())
    return 720917;
  v18 = v64;
  v17 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v19 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v64;
  *(_QWORD *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19))
    goto LABEL_187;
  v20 = v18 + v19;
  if (v18 > v20 || v20 > v17)
    goto LABEL_186;
  v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl())
    return 720919;
  v22 = v64;
  v21 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v23 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v64;
  *(_QWORD *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23))
    goto LABEL_187;
  v24 = v22 + v23;
  if (v22 > v24 || v24 > v21)
    goto LABEL_186;
  v64 = v24;
  if (!ccder_blob_decode_tl())
    return 720920;
  v26 = v64;
  v25 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v27 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v64;
  *(_QWORD *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27))
    goto LABEL_187;
  v28 = v26 + v27;
  if (v26 > v28 || v28 > v25)
    goto LABEL_186;
  v64 = v28;
  if (!ccder_blob_decode_tl())
    return 720921;
  v29 = v64;
  v30 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v31 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v64;
  *(_QWORD *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31))
    goto LABEL_187;
  v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30)
    goto LABEL_186;
  v64 = v29 + v31;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return 720922;
  v33 = v64;
  v34 = v68;
  v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v32;
    *(_QWORD *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34))
      goto LABEL_187;
    v36 = v33 + v34;
    if (v33 > v36 || v36 > v65)
      goto LABEL_186;
    v63 = v65;
    v64 = v36;
    v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720923;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720924;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if (ccder_blob_decode_tl())
    {
      v60 = 0xAAAAAAAAAAAAAAAALL;
      v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68))
        goto LABEL_187;
      if (v62 > v62 + v68 || v62 + v68 > v63)
        goto LABEL_186;
      v60 = v62;
      v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68)
        return 720925;
      v37 = v60;
      if (__CFADD__(v60, v68))
LABEL_187:
        __break(0x5513u);
      v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61)
        goto LABEL_186;
      v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3)
        v39 = a4 == 0;
      else
        v39 = 1;
      v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        v53 = 0;
        v41 = 0;
        do
        {
          v58 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0;
          v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0)
            return 720926;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          if (v60 > v60 + v56 || v60 + v56 > v61)
            goto LABEL_186;
          v54 = v60;
          v55 = v60 + v56;
          if (!ccder_blob_decode_tl())
            return 720927;
          if (v55 < v54 || v68 > v55 - v54)
            goto LABEL_186;
          v58 = v54;
          v59 = v68;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57))
            return 720928;
          if (!ccder_blob_decode_tl())
            return 720929;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v55 != v54 + v68)
            return 720929;
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54)
              goto LABEL_186;
            v43 = v68;
            if (v68 > v55 - v54)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v54;
            *(_QWORD *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0)
                return v16;
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53))
              return v16;
            result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result)
              return v16;
            if (v53 == 0xFF)
              goto LABEL_189;
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (v57)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v54 != v55)
            return 720926;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          v37 = v60 + v56;
          if (v60 > v60 + v56)
            goto LABEL_186;
          v38 = v61;
          if (v37 > v61)
            goto LABEL_186;
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38)
        return 720925;
      if (v37 > v65 || v64 > v37)
        goto LABEL_186;
      v64 = v37;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v16 = 720915;
      if (v64 != v65)
        return v16;
LABEL_170:
      if (__CFADD__(v66, v69))
        goto LABEL_187;
      if (v66 > v66 + v69 || v66 + v69 > v67)
        goto LABEL_186;
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v60 = 0;
      result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result)
        return 720938;
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v70[0] + 1) >= *(_QWORD *)&v70[0])
        {
          v51 = (v60 + 7) >> 3;
          if (v51 <= *((_QWORD *)&v70[0] + 1) - *(_QWORD *)&v70[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v70[0];
            *(_QWORD *)(a1 + 64) = v51;
            v52 = v67;
            if (v66 <= v67)
            {
              v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3)
          return 0;
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_15;
    if (v7 - 0x5555555555555556 != a1[1])
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_16;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_16;
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = ccder_blob_decode_tl();
  result = 0;
  if (v6)
  {
    if (*a1 > a1[1])
      goto LABEL_11;
    v10 = *a1;
    v11 = a1[1];
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_11;
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1])
LABEL_11:
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return X509ExtensionParseGenericSSLMarker();
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null();
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null();
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = der_get_BOOLean((_QWORD *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  if (!ccder_blob_decode_tl())
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556)
    return v8;
  v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556)
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = *a1;
  v5 = a1[1];
  if (__CFADD__(*a1, v5))
    goto LABEL_31;
  v6 = v4 + v5;
  if (v4 > v6)
    goto LABEL_30;
  v10 = 655361;
  v14 = *a1;
  v15 = v6;
  if (!ccder_blob_decode_tl())
    return v10;
  if (!ccder_blob_decode_tl())
    return 655363;
  if (v14 >= 0x5555555555555556)
LABEL_31:
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15)
    goto LABEL_30;
  v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl())
    return 655362;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13)
    goto LABEL_30;
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13)
    goto LABEL_30;
  if (!ccder_blob_decode_bitstring())
    return 655364;
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15)
    return 0;
  else
    return 655365;
}

uint64_t X509CertificateParseKey(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = 327691;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v8 = 0;
      v9 = 0;
      result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v9;
  uint64_t result;
  unsigned int (*v11)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v28 = 0uLL;
  v27 = 0uLL;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9)
    return v9;
  v9 = 655632;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string((uint64_t)&v28, (uint64_t)&ecPublicKey))
      return 655617;
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  memset(v14, 0, sizeof(v14));
  v19 = *a5;
  v15 = *a4;
  v17 = v28;
  v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }
  result = v25;
  if (v26 || !v25)
  {
    v12 = *a3;
    v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14))
        return 0;
      else
        return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  __int128 v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11[2];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64;
  v10 = 0uLL;
  result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result)
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_8;
  result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(_QWORD *)(a3 + 8) < 0x20uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_12;
  result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(_QWORD *)(a3 + 8) < 0x14uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result)
    return 656640;
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(_QWORD *)(a3 + 8) >= 0x30uLL)
  {
    *(_QWORD *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  __int128 v11;
  uint64_t matched;
  unsigned int (*v13)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  v30 = v32;
  v31 = 64;
  v29 = 0uLL;
  matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)matched)
    return matched;
  matched = 655617;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string(a2, (uint64_t)&ecPublicKey))
      return matched;
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  v28 = 0;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v18 = 0u;
  v21 = *a5;
  v17 = 0;
  v23 = *a6;
  v19 = v29;
  if (a3)
    v14 = *a3;
  else
    v14 = null_octet;
  v22 = v14;
  result = *a1;
  v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    if (v13(result, v16, (uint64_t)v30, v31, &v17))
      return 0;
    else
      return 655648;
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *a1;
  v3 = a1[1];
  v20 = v3;
  if (__CFADD__(*a1, v3))
    goto LABEL_59;
  v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  v6 = 720901;
  v18 = *a1;
  v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20)
        return 720898;
      v2 = v18;
      if (__CFADD__(v18, v20))
        break;
      v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19)
        goto LABEL_58;
      v16 = v18;
      v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl())
          return 720899;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20 || v16 + v20 > v17)
          goto LABEL_58;
        v15 = v16 + v20;
        if (!ccder_blob_decode_tl())
          return 720900;
        v2 = v16 + v20;
        if (v16 > v15)
          goto LABEL_58;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20)
          goto LABEL_58;
        v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          v12 = v16 + v20;
          v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15)
              goto LABEL_58;
            v12 = v16 + v20;
            v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15)
                goto LABEL_58;
              v12 = v16 + v20;
              v13 = v16 + v20;
              if (!ccder_blob_decode_tl())
                return v6;
            }
          }
          if (__CFADD__(v12, v20))
            goto LABEL_59;
          v2 = v12 + v20;
          if (v15 != v12 + v20)
            return 720902;
          if (v13 < v12 || v20 > v13 - v12)
            goto LABEL_58;
          *a2 = v12;
          a2[1] = v20;
        }
        v7 = v18 + v20;
        if (v2 > v17 || v16 > v2)
          goto LABEL_58;
        v16 = v2;
      }
      if (v2 != v7)
        return 720903;
      v4 = v19;
      if (v2 > v19 || v18 > v2)
        goto LABEL_58;
      v18 = v2;
      if (v2 >= v19)
        goto LABEL_46;
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4)
    return 720904;
  if (a2[1] && *a2)
    return 0;
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  _BOOL8 result;
  time_t v5;
  time_t v6[2];

  result = 0;
  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1)
    return !X509CertificateGetNotBefore(a1, v6)
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x1E0C80C00];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x1E0C80C00];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2;

  v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = 720906;
  if (!result)
    return v1;
  v2 = *(_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 80);
  if (!v2 || v3 == 0)
    return v1;
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(_QWORD *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6))
        return 720907;
      if (ccder_blob_decode_Time(v6))
        return 0;
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v2;
  const char *v4;
  __int128 v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  time_t v10;
  tm v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = 720909;
  if (!a1)
    return v2;
  v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF)
    return v2;
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  v7 = *a1;
  if (v4 == (const char *)13)
  {
    result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150)
      v11.tm_year -= 100;
  }
  else
  {
    result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(_QWORD)*a1])
      return 720910;
    v10 = timegm(&v11);
    if (v10 == -1)
      return 720911;
    v2 = 0;
    if (a2)
      *a2 = v10;
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0)
    goto LABEL_5;
  if (*a1 > a1[1])
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    v8 = v12;
    v7 = v13;
    if (v12 > v13)
      goto LABEL_19;
    *a1 = v12;
    a1[1] = v13;
    v9 = v11;
  }
  else
  {
    v8 = *a1;
    v7 = a1[1];
    v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9))
    goto LABEL_20;
  if (v7 == v8 + v9)
  {
    if (!v9)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8)
        goto LABEL_12;
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556)
        return 0;
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556)
        return 0;
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL)
          goto LABEL_13;
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_17;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_18;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
            goto LABEL_18;
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  BOOL v6;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v21;

  v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = result;
    v10 = 0;
    v11 = a2 + 304 * a3;
    v12 = ~a2;
    v13 = a4 + 1;
    v14 = (_QWORD *)(a2 + 272);
    v15 = a3 - 1;
    v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      v16 = v14 - 34;
      if (v14 != (_QWORD *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result)
        return result;
      if (v10)
      {
        if ((unint64_t)v16 < a2)
          goto LABEL_30;
        if ((unint64_t)(v14 + 4) > v11)
          goto LABEL_30;
        v17 = (_QWORD *)*v13;
        *v14 = 0;
        v14[1] = v17;
        if (v14 != (_QWORD *)272 && (unint64_t)v16 >= v11)
          goto LABEL_30;
        *v17 = v16;
        *v13 = (unint64_t)v14;
      }
      else
      {
        v18 = *a4;
        *(_QWORD *)(a2 + 272) = *a4;
        if (v18)
          v19 = (unint64_t *)(v18 + 280);
        else
          v19 = v13;
        *v19 = v21;
        *a4 = v16;
        *(_QWORD *)(a2 + 280) = a4;
      }
      v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        v6 = v15 == v10++;
        if (!v6)
          continue;
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  uint64_t i;

  for (i = *a1; i; i = *(_QWORD *)(i + 272))
  {
    if (*(_QWORD *)(i + 192) && !compare_octet_string(a2, i + 184))
      break;
  }
  return i;
}

_QWORD *X509ChainResetChain(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  *result = 0;
  result[1] = result;
  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      v2 = (_QWORD *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t CertificateUsingKeyIdentifier;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t BAARootUsingKeyIdentifier;
  unsigned int v16;

  if (!a1)
    return 327691;
  v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  v8 = (uint64_t)(a1 + 15);
  result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (v7 = (_QWORD *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        v7 = (_QWORD *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1))
            return 0;
          BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4)
            v16 = 0;
          else
            v16 = 524296;
          if (BAARootUsingKeyIdentifier)
            return 0;
          else
            return v16;
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          v7 = (_QWORD *)v7[34];
          if (!v7)
            goto LABEL_16;
        }
      }
      v12 = (_QWORD *)*a3;
      if (*a3)
        break;
LABEL_13:
      v13 = (_QWORD *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *v13 = v7;
      a3[1] = v7 + 36;
      v8 = (uint64_t)(v7 + 15);
      v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      result = 0;
      if (!v14)
        return result;
    }
    while (v12 != v7)
    {
      v12 = (_QWORD *)v12[36];
      if (!v12)
        goto LABEL_13;
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;

  v2 = &numAppleRoots;
  if (!a2)
    v2 = &numAppleProdRoots;
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    for (i = (uint64_t *)&AppleRoots; i < (uint64_t *)&BlockedYonkersSPKI && i >= (uint64_t *)&AppleRoots; ++i)
    {
      v7 = *i;
      result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result)
        return v7;
      if (!--v3)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t v5;

  v1 = numBAARoots;
  if (numBAARoots)
  {
    v2 = result;
    for (i = (uint64_t *)&BAARoots; i < (uint64_t *)&rsaEncryption && i >= (uint64_t *)&BAARoots; ++i)
    {
      v5 = *i;
      result = compare_octet_string(v2, *i + 184);
      if (!(_DWORD)result)
        return v5;
      if (!--v1)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t AppleRootUsingKeyIdentifier;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  unint64_t v34[2];
  unint64_t v35[5];

  v6 = a2;
  v35[4] = *MEMORY[0x1E0C80C00];
  v8 = *a2;
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 48);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208))
          return 327701;
        v8 = *v6;
      }
    }
  }
  if (v8)
  {
    v31 = v6;
    v32 = a4;
    v11 = 0;
    v12 = 0;
    v33 = 0;
    v13 = -1;
    while (1)
    {
      v14 = *(_QWORD *)(v8 + 288);
      v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        v16 = 0;
        v15 = v8 + 304;
        v14 = v8;
        goto LABEL_11;
      }
      if (!a3)
        return v12 | 0x9000Du;
      if (*(_BYTE *)(a3 + 16))
      {
        AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(_QWORD *)(a3 + 24))
          goto LABEL_58;
        AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier)
        goto LABEL_10;
LABEL_58:
      if (!*(_BYTE *)(a3 + 19))
        return v12 | 0x9000Du;
      v14 = 0;
      v16 = 1;
LABEL_11:
      if (v11 && *(_QWORD *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          v30 = 589825;
          return v12 | v30;
        }
        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          v30 = 589826;
          return v12 | v30;
        }
      }
      v17 = *(_QWORD *)(v8 + 200);
      if (v17)
        v18 = v17 >= v11;
      else
        v18 = 1;
      if (!v18)
      {
        v30 = 589827;
        return v12 | v30;
      }
      if (*(_BYTE *)(v8 + 266))
      {
        v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(_QWORD *)(v8 + 168) && *(_QWORD *)(v8 + 176))
      {
        if (v14 >= v15)
          goto LABEL_100;
        if (compare_octet_string(v8 + 168, v14 + 184))
          return v12 | 0x9000Au;
      }
      if (a3 && v11 && (*(_QWORD *)(v8 + 240) & *(_QWORD *)(a3 + 8)) == 0)
        X509PolicySetFlagsForCommonNames(v8);
      if (v14 == v8 && !*(_QWORD *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8))
            return v12 | 0x90009u;
          v19 = *(_QWORD *)(a3 + 8);
          if (!v11 && (*(_QWORD *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            v19 = *(_QWORD *)(a3 + 8);
          }
          v13 &= *(_QWORD *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(_QWORD *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15)
          goto LABEL_100;
        result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result)
          return result;
      }
      v21 = v11 + 1;
      if (v11 == -1)
        goto LABEL_99;
      v8 = *(_QWORD *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3)
          goto LABEL_61;
        goto LABEL_87;
      }
    }
  }
  v21 = 0;
  v13 = -1;
  if (!a3)
    goto LABEL_87;
LABEL_61:
  if (*(_QWORD *)a3)
  {
    v22 = v21;
    if ((v8 & 1) != 0)
    {
      v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(_QWORD *)a3 != v22)
      return ((_DWORD)v22 << 8) | 0x90006u;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 || !*(_QWORD *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16))
      goto LABEL_87;
    v24 = (_DWORD)v21 << 8;
    v25 = **(_QWORD **)(v6[1] + 8);
LABEL_75:
    v27 = 184;
    if ((v8 & 1) != 0)
      v27 = 168;
    v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28)
      return v24 | 0x9000Bu;
    v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }
    v26 = 589836;
    return v24 | v26;
  }
  v24 = (_DWORD)v21 << 8;
  v25 = **(_QWORD **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16))
    goto LABEL_75;
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(_QWORD *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(_QWORD *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(_QWORD *)(a3 + 32), *(__int128 **)(a3 + 40), v25 + 16, (__int128 *)(v25 + 40), (__int128 *)(v25 + 56)))goto LABEL_72;
  }
  else if (!compare_octet_string(*(_QWORD *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(_QWORD *)(a3 + 40));
  }
LABEL_87:
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

void create_baa_info_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  copy_current_process_name();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D4F5D000, MEMORY[0x1E0C81028], v1, "%{public}@ failed to load cryptex1 manifest (%@) (non-fatal). Client should adopt new option (kMAOptionsBAAPerformOperationsOverIPC=True), or update entitlements and/or sandbox rules.", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2();
}

void create_baa_info_cold_2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  copy_current_process_name();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D4F5D000, MEMORY[0x1E0C81028], v1, "%{public}@ failed to load boot manifest (%@) (non-fatal). Client should adopt new option (kMAOptionsBAAPerformOperationsOverIPC=True), or update entitlements and/or sandbox rules.", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2();
}

void create_baa_info_cold_3()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  copy_current_process_name();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D4F5D000, MEMORY[0x1E0C81028], v1, "%{public}@ failed to load cryptex1 local policy (%@) (non-fatal). Client should adopt new option (kMAOptionsBAAPerformOperationsOverIPC=True), or update entitlements and/or sandbox rules.", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2();
}

void isSupportedDeviceIdentityClient_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1D4F5D000, MEMORY[0x1E0C81028], v2, "%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

void __getLAContextClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LocalAuthenticationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("identity_support.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLAContextClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLAContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("identity_support.m"), 22, CFSTR("Unable to find class %s"), "LAContext");

  __break(1u);
}

void libavp_send_host_message_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef gAppleVirtualPlatformSendSubsystemMessageToHost(AppleVirtualPlatformMessageSubsystem, CFDataRef, CFErrorRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronous(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDataRef gAppleVirtualPlatformGuestCopyStrongIdentityData(CFDictionaryRef, CFErrorRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void libavp_copy_strong_identity_data_cold_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void libavp_guest_has_host_key_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool gAppleVirtualPlatformGuestHasHostKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_0_1());

  __break(1u);
}

void AppleVirtualPlatformLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;
  CFDictionaryRef v4;
  const void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppleVirtualPlatformLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("vm_libavp.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
  CFDictionaryGetValue(v4, v5);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x1E0CD5E98]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

CFTypeID SecAccessControlGetTypeID(void)
{
  return MEMORY[0x1E0CD5ED0]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x1E0CD5EF0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

uint64_t SecCertificateCopyExtensionValue()
{
  return MEMORY[0x1E0CD5F78]();
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x1E0CD5F90]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1E0CD5FC0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecCertificateIsValid()
{
  return MEMORY[0x1E0CD6068]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1E0CD6070]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1E0CD6078]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD62F0](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x1E0CD6330]();
}

uint64_t SecKeyCreateAttestation()
{
  return MEMORY[0x1E0CD6338]();
}

uint64_t SecKeyCreateDuplicate()
{
  return MEMORY[0x1E0CD6350]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x1E0CD6408]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1E0C819E8]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1E0C81A10]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1E0C81A18]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1E0C81A88]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C81C70]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1E0C81D20]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1E0C81D28]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1E0C81DD0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1E0C81E00]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1E0C82340]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1E0C82388]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1E0C823E8]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x1E0C82B98](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1E0C855D8](a1, a2, a3);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C85958](a1);
}


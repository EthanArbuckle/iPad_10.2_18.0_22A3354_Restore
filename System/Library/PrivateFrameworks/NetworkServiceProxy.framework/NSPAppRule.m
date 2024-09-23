@implementation NSPAppRule

+ (id)validateRuleDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  unint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  const __CFString *v66;
  void *v67;
  double v68;
  const __CFString *v69;
  void *v70;
  double v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  const __CFString *v93;
  uint64_t v95;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("dictionary parameter is not a dictionary: %@"), v3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_190;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("app"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v116 = v3;
  v117 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@\n"), CFSTR("label"), v6);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("bundle"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@\n"), CFSTR("bundle"), v7);
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("ExecutablePath"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@\n"), CFSTR("ExecutablePath"), v8);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("EnableOptIn"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableOptIn"), v9);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("EnableOptInPerTask"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableOptInPerTask"), v10);
    }
    v105 = (void *)v10;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("DisableDivertDNS"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("DisableDivertDNS"), v11);
    }
    v104 = (void *)v11;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("EnableDivertDNSOnly"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableDivertDNSOnly"), v12);
    }
    v103 = (void *)v12;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("NoDNSDelegation"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("NoDNSDelegation"), v13);
    }
    v102 = (void *)v13;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("service"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@\n"), CFSTR("service"), v14);
    }
    v101 = (void *)v14;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("edges"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@\n"), CFSTR("edges"), v15);
    }
    v100 = (void *)v15;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("UseCustomProtocol"));
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("UseCustomProtocol"), v16);
    }
    v99 = (void *)v16;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("UseLocalFlowDivert"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("UseLocalFlowDivert"), v17);
    }
    v98 = (void *)v17;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("EnableDirectRace"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableDirectRace"), v18);
    }
    v97 = (void *)v18;
    v107 = (void *)v9;
    v108 = (void *)v8;
    v111 = (void *)v7;
    v114 = (void *)v6;
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("ComposeInitialData"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("ComposeInitialData"), v19);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v5, CFSTR("matchDomains"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v20, "count"))
        {
          v21 = 0;
          do
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "appendFormat:", CFSTR("%@ does not contain string: %@\n"), CFSTR("matchDomains"), v26);

              }
            }
            ++v21;
          }
          while (v21 < objc_msgSend(v20, "count"));
        }
      }
      else
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not an array: %@\n"), CFSTR("matchDomains"), v20);
      }
    }
    v96 = (void *)v19;
    v28 = CFSTR("matchEffectiveApplications");
    -[NSDictionary objectForPlatformSpecificKey:](v117, CFSTR("matchEffectiveApplications"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v29, "count"))
        {
          v30 = 0;
          v31 = CFSTR("matchEffectiveAppSigningIdentifier");
          v110 = v4;
          do
          {
            objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
            v32 = objc_claimAutoreleasedReturnValue();
            if (v32
              && (v33 = (void *)v32,
                  objc_msgSend(v29, "objectAtIndexedSubscript:", v30),
                  v34 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v35 = objc_opt_isKindOfClass(),
                  v34,
                  v33,
                  (v35 & 1) == 0))
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "appendFormat:", CFSTR("%@ does not contain dictionary: %@\n"), v28, v44);
            }
            else
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v31);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("matchEffectiveAppPath"));
                v39 = v20;
                v40 = v28;
                v41 = v31;
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v43 = objc_opt_isKindOfClass();

                v31 = v41;
                v28 = v40;
                v20 = v39;
                v4 = v110;

                if ((v43 & 1) != 0)
                  goto LABEL_68;
              }
              else
              {

              }
              objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "appendFormat:", CFSTR("%@ does not contain dictionary with App signing identifier, designated requirement or path: %@\n"), v28, v44);
            }

LABEL_68:
            ++v30;
          }
          while (v30 < objc_msgSend(v29, "count"));
        }
      }
      else
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not an array: %@\n"), CFSTR("matchEffectiveApplications"), v29);
      }
    }
    -[NSDictionary objectForPlatformSpecificKey:](v117, CFSTR("locationBundlePath"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@\n"), CFSTR("locationBundlePath"), v45);
    }

    v3 = v116;
    v5 = v117;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("direct"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v115 = v46;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("DisableFallback"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("DisableFallback"), v47);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("EnableDirectMultipath"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableDirectMultipath"), v48);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("EnableDirectTFO"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableDirectTFO"), v49);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("EnableDirectExtendedValidation"));
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@\n"), CFSTR("EnableDirectExtendedValidation"), v50);
    }
    v112 = (void *)v50;
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("DirectTLSPorts"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v106 = v49;
        v109 = v47;
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v52 = v51;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v119;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v119 != v55)
                objc_enumerationMutation(v52);
              v57 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                objc_msgSend(v4, "appendFormat:", CFSTR("%@ contains a non-number: %@"), CFSTR("DirectTLSPorts"), v57);
            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
          }
          while (v54);
        }

        v47 = v109;
        v49 = v106;
      }
      else
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not an array: %@\n"), CFSTR("DirectTLSPorts"), v51);
      }
    }
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("FallbackBufferLimit"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v58, "integerValue") & 0x8000000000000000) == 0)
          goto LABEL_107;
        v59 = CFSTR("%@ must be a positive number or 0: %@\n");
      }
      else
      {
        v59 = CFSTR("%@ is not a number: %@\n");
      }
      objc_msgSend(v4, "appendFormat:", v59, CFSTR("FallbackBufferLimit"), v58);
    }
LABEL_107:
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("FallbackCountBeforeImmediateFallback"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60)
      goto LABEL_113;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v60, "integerValue") & 0x8000000000000000) == 0)
        goto LABEL_113;
      v61 = CFSTR("%@ must be a positive number or 0: %@\n");
    }
    else
    {
      v61 = CFSTR("%@ is not a number: %@\n");
    }
    objc_msgSend(v4, "appendFormat:", v61, CFSTR("FallbackCountBeforeImmediateFallback"), v60);
LABEL_113:
    -[NSDictionary objectForPlatformSpecificKey:](v46, CFSTR("ProxyEvaluationPath"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a string: %@"), CFSTR("ProxyEvaluationPath"), v62);
    }

    v3 = v116;
    v5 = v117;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timer"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_137;
  -[NSDictionary objectForPlatformSpecificKey:](v63, CFSTR("fallback"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v64, "doubleValue");
      if (v65 >= 0.0)
        goto LABEL_124;
      v66 = CFSTR("%@ must be a positive number or 0: %@");
    }
    else
    {
      v66 = CFSTR("%@ is not a number: %@");
    }
    objc_msgSend(v4, "appendFormat:", v66, CFSTR("fallback"), v64);
  }
LABEL_124:
  -[NSDictionary objectForPlatformSpecificKey:](v63, CFSTR("connection"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v67)
    goto LABEL_130;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v67, "doubleValue");
    if (v68 >= 0.0)
      goto LABEL_130;
    v69 = CFSTR("%@ must be a positive number or 0: %@");
  }
  else
  {
    v69 = CFSTR("%@ is not a number: %@");
  }
  objc_msgSend(v4, "appendFormat:", v69, CFSTR("connection"), v67);
LABEL_130:
  -[NSDictionary objectForPlatformSpecificKey:](v63, CFSTR("idle"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v72 = CFSTR("%@ is not a number: %@");
      goto LABEL_135;
    }
    objc_msgSend(v70, "doubleValue");
    if (v71 < 0.0)
    {
      v72 = CFSTR("%@ must be a positive number or 0: %@");
LABEL_135:
      objc_msgSend(v4, "appendFormat:", v72, CFSTR("idle"), v70);
    }
  }

LABEL_137:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("transport"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v113 = v63;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_160;
  -[NSDictionary objectForPlatformSpecificKey:](v73, CFSTR("tfo"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("tfo"), v74);
  }
  -[NSDictionary objectForPlatformSpecificKey:](v73, CFSTR("notfocookie"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("notfocookie"), v75);
  }
  -[NSDictionary objectForPlatformSpecificKey:](v73, CFSTR("mptcp"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("mptcp"), v76);
  }
  -[NSDictionary objectForPlatformSpecificKey:](v73, CFSTR("udp"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("udp"), v77);
  }
  -[NSDictionary objectForPlatformSpecificKey:](v73, CFSTR("rwnd"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v78, "integerValue") & 0x8000000000000000) == 0)
        goto LABEL_156;
      v79 = CFSTR("%@ must be a positive number or 0: %@");
    }
    else
    {
      v79 = CFSTR("%@ is not a number: %@");
    }
    objc_msgSend(v4, "appendFormat:", v79, CFSTR("rwnd"), v78);
  }
LABEL_156:
  -[NSDictionary objectForPlatformSpecificKey:](v73, CFSTR("must-tfo"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("must-tfo"), v80);
  }

  v3 = v116;
  v5 = v117;
  v63 = v113;
LABEL_160:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enable"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_177;
  -[NSDictionary objectForPlatformSpecificKey:](v81, CFSTR("Enabled"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("Enabled"), v82);
  }
  -[NSDictionary objectForPlatformSpecificKey:](v81, CFSTR("ratio"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v83, "doubleValue");
      if (v84 < 0.0 || (objc_msgSend(v83, "doubleValue"), v85 > 1.0))
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ must be a number between 0.0 and 1.0 inclusive"), CFSTR("ratio"), v95);
    }
    else
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%@ is not a number: %@"), CFSTR("ratio"), v83);
    }
  }
  -[NSDictionary objectForPlatformSpecificKey:](v81, CFSTR("interval"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v88 = CFSTR("%@ is not a number: %@");
      goto LABEL_175;
    }
    objc_msgSend(v86, "doubleValue");
    if (v87 < 0.0)
    {
      v88 = CFSTR("%@ must be a positive number or 0: %@");
LABEL_175:
      objc_msgSend(v4, "appendFormat:", v88, CFSTR("interval"), v86);
    }
  }

  v63 = v113;
LABEL_177:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("telemetry"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForPlatformSpecificKey:](v89, CFSTR("ratio"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v90, "doubleValue");
        if (v91 >= 0.0)
        {
          objc_msgSend(v90, "doubleValue");
          if (v92 <= 1.0)
            goto LABEL_185;
        }
        v93 = CFSTR("%@ must be a positive number or 0: %@");
      }
      else
      {
        v93 = CFSTR("%@ is not a number: %@");
      }
      objc_msgSend(v4, "appendFormat:", v93, CFSTR("ratio"), v90);
    }
LABEL_185:

  }
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

LABEL_190:
  return v27;
}

- (id)initFromDictionary:(id)a3
{

  return 0;
}

+ (void)loadAppRules:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  getServerConnection();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "Failed to create the XPC connection to the server", v9, 2u);
    }

    v6[2](v6, 0);
  }
  objc_msgSend(v7, "fetchAppRuleForLabel:completionHandler:", v5, v6);

}

- (void)saveWithCompletionHandler:(id)a3
{
  void (**v4)(id, const __CFString *);
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (void (**)(id, const __CFString *))a3;
  getServerConnection();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "Failed to create the XPC connection to the server", v8, 2u);
    }

    v4[2](v4, CFSTR("Failed to connect to networkserviceproxy"));
  }
  -[NSPAppRule label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppRule:forLabel:completionHandler:", self, v7, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPAppRule)initWithCoder:(id)a3
{
  id v4;
  NSPAppRule *v5;
  uint64_t v6;
  NSNumber *divertDNSOnly;
  uint64_t v8;
  NSNumber *noDNSDelegation;
  uint64_t v10;
  NSNumber *disableFallback;
  uint64_t v12;
  NSNumber *enableDirectMultipath;
  uint64_t v14;
  NSNumber *enableDirectExtendedValidation;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *directTLSPorts;
  uint64_t v21;
  NSNumber *enableDirectTFO;
  uint64_t v23;
  NSNumber *serviceID;
  uint64_t v25;
  NSNumber *enabled;
  uint64_t v27;
  NSNumber *fallbackTimeout;
  uint64_t v29;
  NSNumber *fallbackBufferLimit;
  uint64_t v31;
  NSNumber *fallbackCountBeforeImmediateFallback;
  uint64_t v33;
  NSString *proxyEvaluationPath;
  uint64_t v35;
  NSNumber *useCustomProtocol;
  uint64_t v37;
  NSNumber *useLocalFlowDivert;
  uint64_t v39;
  NSNumber *enableDirectRace;
  uint64_t v41;
  NSNumber *shouldComposeInitialData;
  uint64_t v43;
  NSString *label;
  uint64_t v45;
  NSString *edgeSetIdentifier;
  uint64_t v47;
  NSNumber *connectionTimeout;
  uint64_t v49;
  NSNumber *connectionIdleTimeout;
  uint64_t v51;
  NSNumber *enableTFO;
  uint64_t v53;
  NSNumber *requireTFO;
  uint64_t v55;
  NSNumber *enableNoTFOCookie;
  uint64_t v57;
  NSNumber *enableMultipath;
  uint64_t v59;
  NSNumber *enableUDPRace;
  uint64_t v61;
  NSNumber *enableRatio;
  uint64_t v63;
  NSNumber *reenableInterval;
  uint64_t v65;
  NSNumber *telemetryRatio;
  uint64_t v67;
  NSUUID *configurationIdentifier;
  uint64_t v69;
  NSNumber *enableOptInPerTask;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSArray *matchEffectiveApplications;
  uint64_t v76;
  NSDate *enableCheckDate;
  uint64_t v78;
  NSString *locationBundlePath;
  uint64_t v80;
  NSNumber *initialWindowSize;
  uint64_t v82;
  NSData *updateHash;
  objc_super v85;

  v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)NSPAppRule;
  v5 = -[NEAppRule initWithCoder:](&v85, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableDivertDNSOnly"));
    v6 = objc_claimAutoreleasedReturnValue();
    divertDNSOnly = v5->_divertDNSOnly;
    v5->_divertDNSOnly = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NoDNSDelegation"));
    v8 = objc_claimAutoreleasedReturnValue();
    noDNSDelegation = v5->_noDNSDelegation;
    v5->_noDNSDelegation = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisableFallback"));
    v10 = objc_claimAutoreleasedReturnValue();
    disableFallback = v5->_disableFallback;
    v5->_disableFallback = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableDirectMultipath"));
    v12 = objc_claimAutoreleasedReturnValue();
    enableDirectMultipath = v5->_enableDirectMultipath;
    v5->_enableDirectMultipath = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableDirectExtendedValidation"));
    v14 = objc_claimAutoreleasedReturnValue();
    enableDirectExtendedValidation = v5->_enableDirectExtendedValidation;
    v5->_enableDirectExtendedValidation = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("DirectTLSPorts"));
    v19 = objc_claimAutoreleasedReturnValue();
    directTLSPorts = v5->_directTLSPorts;
    v5->_directTLSPorts = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableDirectTFO"));
    v21 = objc_claimAutoreleasedReturnValue();
    enableDirectTFO = v5->_enableDirectTFO;
    v5->_enableDirectTFO = (NSNumber *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServiceID"));
    v23 = objc_claimAutoreleasedReturnValue();
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSNumber *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Enabled"));
    v25 = objc_claimAutoreleasedReturnValue();
    enabled = v5->_enabled;
    v5->_enabled = (NSNumber *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallback"));
    v27 = objc_claimAutoreleasedReturnValue();
    fallbackTimeout = v5->_fallbackTimeout;
    v5->_fallbackTimeout = (NSNumber *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FallbackBufferLimit"));
    v29 = objc_claimAutoreleasedReturnValue();
    fallbackBufferLimit = v5->_fallbackBufferLimit;
    v5->_fallbackBufferLimit = (NSNumber *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FallbackCountBeforeImmediateFallback"));
    v31 = objc_claimAutoreleasedReturnValue();
    fallbackCountBeforeImmediateFallback = v5->_fallbackCountBeforeImmediateFallback;
    v5->_fallbackCountBeforeImmediateFallback = (NSNumber *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyEvaluationPath"));
    v33 = objc_claimAutoreleasedReturnValue();
    proxyEvaluationPath = v5->_proxyEvaluationPath;
    v5->_proxyEvaluationPath = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UseCustomProtocol"));
    v35 = objc_claimAutoreleasedReturnValue();
    useCustomProtocol = v5->_useCustomProtocol;
    v5->_useCustomProtocol = (NSNumber *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UseLocalFlowDivert"));
    v37 = objc_claimAutoreleasedReturnValue();
    useLocalFlowDivert = v5->_useLocalFlowDivert;
    v5->_useLocalFlowDivert = (NSNumber *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableDirectRace"));
    v39 = objc_claimAutoreleasedReturnValue();
    enableDirectRace = v5->_enableDirectRace;
    v5->_enableDirectRace = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ComposeInitialData"));
    v41 = objc_claimAutoreleasedReturnValue();
    shouldComposeInitialData = v5->_shouldComposeInitialData;
    v5->_shouldComposeInitialData = (NSNumber *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v43 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edges"));
    v45 = objc_claimAutoreleasedReturnValue();
    edgeSetIdentifier = v5->_edgeSetIdentifier;
    v5->_edgeSetIdentifier = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connection"));
    v47 = objc_claimAutoreleasedReturnValue();
    connectionTimeout = v5->_connectionTimeout;
    v5->_connectionTimeout = (NSNumber *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idle"));
    v49 = objc_claimAutoreleasedReturnValue();
    connectionIdleTimeout = v5->_connectionIdleTimeout;
    v5->_connectionIdleTimeout = (NSNumber *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tfo"));
    v51 = objc_claimAutoreleasedReturnValue();
    enableTFO = v5->_enableTFO;
    v5->_enableTFO = (NSNumber *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("must-tfo"));
    v53 = objc_claimAutoreleasedReturnValue();
    requireTFO = v5->_requireTFO;
    v5->_requireTFO = (NSNumber *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notfocookie"));
    v55 = objc_claimAutoreleasedReturnValue();
    enableNoTFOCookie = v5->_enableNoTFOCookie;
    v5->_enableNoTFOCookie = (NSNumber *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mptcp"));
    v57 = objc_claimAutoreleasedReturnValue();
    enableMultipath = v5->_enableMultipath;
    v5->_enableMultipath = (NSNumber *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("udp"));
    v59 = objc_claimAutoreleasedReturnValue();
    enableUDPRace = v5->_enableUDPRace;
    v5->_enableUDPRace = (NSNumber *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enable-ratio"));
    v61 = objc_claimAutoreleasedReturnValue();
    enableRatio = v5->_enableRatio;
    v5->_enableRatio = (NSNumber *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
    v63 = objc_claimAutoreleasedReturnValue();
    reenableInterval = v5->_reenableInterval;
    v5->_reenableInterval = (NSNumber *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("telemetry-ratio"));
    v65 = objc_claimAutoreleasedReturnValue();
    telemetryRatio = v5->_telemetryRatio;
    v5->_telemetryRatio = (NSNumber *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configID"));
    v67 = objc_claimAutoreleasedReturnValue();
    configurationIdentifier = v5->_configurationIdentifier;
    v5->_configurationIdentifier = (NSUUID *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableOptInPerTask"));
    v69 = objc_claimAutoreleasedReturnValue();
    enableOptInPerTask = v5->_enableOptInPerTask;
    v5->_enableOptInPerTask = (NSNumber *)v69;

    v71 = (void *)MEMORY[0x1E0C99E60];
    v72 = objc_opt_class();
    objc_msgSend(v71, "setWithObjects:", v72, objc_opt_class(), 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v73, CFSTR("matchEffectiveApplications"));
    v74 = objc_claimAutoreleasedReturnValue();
    matchEffectiveApplications = v5->_matchEffectiveApplications;
    v5->_matchEffectiveApplications = (NSArray *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enableCheckDate"));
    v76 = objc_claimAutoreleasedReturnValue();
    enableCheckDate = v5->_enableCheckDate;
    v5->_enableCheckDate = (NSDate *)v76;

    v5->_disabledByRatio = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disabledByRatio"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationBundlePath"));
    v78 = objc_claimAutoreleasedReturnValue();
    locationBundlePath = v5->_locationBundlePath;
    v5->_locationBundlePath = (NSString *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rwnd"));
    v80 = objc_claimAutoreleasedReturnValue();
    initialWindowSize = v5->_initialWindowSize;
    v5->_initialWindowSize = (NSNumber *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appRuleUpdateHash"));
    v82 = objc_claimAutoreleasedReturnValue();
    updateHash = v5->_updateHash;
    v5->_updateHash = (NSData *)v82;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSNumber *divertDNSOnly;
  void *v6;
  NSNumber *noDNSDelegation;
  void *v8;
  NSNumber *disableFallback;
  void *v10;
  NSNumber *enableDirectMultipath;
  void *v12;
  NSNumber *enableDirectExtendedValidation;
  void *v14;
  NSArray *directTLSPorts;
  void *v16;
  NSNumber *enableDirectTFO;
  void *v18;
  NSNumber *serviceID;
  void *v20;
  NSNumber *enabled;
  void *v22;
  NSNumber *fallbackTimeout;
  void *v24;
  NSNumber *fallbackBufferLimit;
  void *v26;
  NSNumber *fallbackCountBeforeImmediateFallback;
  void *v28;
  NSString *proxyEvaluationPath;
  void *v30;
  NSNumber *useCustomProtocol;
  void *v32;
  NSNumber *useLocalFlowDivert;
  void *v34;
  NSNumber *enableDirectRace;
  void *v36;
  NSNumber *shouldComposeInitialData;
  void *v38;
  NSString *label;
  void *v40;
  NSNumber *connectionTimeout;
  void *v42;
  NSNumber *connectionIdleTimeout;
  void *v44;
  NSNumber *enableTFO;
  void *v46;
  NSNumber *requireTFO;
  void *v48;
  NSNumber *enableNoTFOCookie;
  void *v50;
  NSNumber *enableMultipath;
  void *v52;
  NSNumber *enableUDPRace;
  void *v54;
  NSNumber *enableRatio;
  void *v56;
  NSNumber *reenableInterval;
  void *v58;
  NSNumber *telemetryRatio;
  void *v60;
  NSNumber *enableOptInPerTask;
  void *v62;
  NSArray *matchEffectiveApplications;
  void *v64;
  NSString *locationBundlePath;
  void *v66;
  NSNumber *initialWindowSize;
  void *v68;
  void *v69;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)NSPAppRule;
  -[NEAppRule encodeWithCoder:](&v70, sel_encodeWithCoder_, v4);
  divertDNSOnly = self->_divertDNSOnly;
  -[NSPAppRule divertDNSOnly](self->_defaults, "divertDNSOnly");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(divertDNSOnly) = myIsEqual(divertDNSOnly, v6);

  if ((divertDNSOnly & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_divertDNSOnly, CFSTR("EnableDivertDNSOnly"));
  noDNSDelegation = self->_noDNSDelegation;
  -[NSPAppRule noDNSDelegation](self->_defaults, "noDNSDelegation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(noDNSDelegation) = myIsEqual(noDNSDelegation, v8);

  if ((noDNSDelegation & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_noDNSDelegation, CFSTR("NoDNSDelegation"));
  disableFallback = self->_disableFallback;
  -[NSPAppRule disableFallback](self->_defaults, "disableFallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(disableFallback) = myIsEqual(disableFallback, v10);

  if ((disableFallback & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_disableFallback, CFSTR("DisableFallback"));
  enableDirectMultipath = self->_enableDirectMultipath;
  -[NSPAppRule enableDirectMultipath](self->_defaults, "enableDirectMultipath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableDirectMultipath) = myIsEqual(enableDirectMultipath, v12);

  if ((enableDirectMultipath & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableDirectMultipath, CFSTR("EnableDirectMultipath"));
  enableDirectExtendedValidation = self->_enableDirectExtendedValidation;
  -[NSPAppRule enableDirectExtendedValidation](self->_defaults, "enableDirectExtendedValidation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableDirectExtendedValidation) = myIsEqual(enableDirectExtendedValidation, v14);

  if ((enableDirectExtendedValidation & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableDirectExtendedValidation, CFSTR("EnableDirectExtendedValidation"));
  directTLSPorts = self->_directTLSPorts;
  -[NSPAppRule directTLSPorts](self->_defaults, "directTLSPorts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(directTLSPorts) = myIsEqual(directTLSPorts, v16);

  if ((directTLSPorts & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_directTLSPorts, CFSTR("DirectTLSPorts"));
  enableDirectTFO = self->_enableDirectTFO;
  -[NSPAppRule enableDirectTFO](self->_defaults, "enableDirectTFO");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableDirectTFO) = myIsEqual(enableDirectTFO, v18);

  if ((enableDirectTFO & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableDirectTFO, CFSTR("EnableDirectTFO"));
  serviceID = self->_serviceID;
  -[NSPAppRule serviceID](self->_defaults, "serviceID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(serviceID) = myIsEqual(serviceID, v20);

  if ((serviceID & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_serviceID, CFSTR("ServiceID"));
  enabled = self->_enabled;
  -[NSPAppRule enabled](self->_defaults, "enabled");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enabled) = myIsEqual(enabled, v22);

  if ((enabled & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enabled, CFSTR("Enabled"));
  fallbackTimeout = self->_fallbackTimeout;
  -[NSPAppRule fallbackTimeout](self->_defaults, "fallbackTimeout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fallbackTimeout) = myIsEqual(fallbackTimeout, v24);

  if ((fallbackTimeout & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackTimeout, CFSTR("fallback"));
  fallbackBufferLimit = self->_fallbackBufferLimit;
  -[NSPAppRule fallbackBufferLimit](self->_defaults, "fallbackBufferLimit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fallbackBufferLimit) = myIsEqual(fallbackBufferLimit, v26);

  if ((fallbackBufferLimit & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackBufferLimit, CFSTR("FallbackBufferLimit"));
  fallbackCountBeforeImmediateFallback = self->_fallbackCountBeforeImmediateFallback;
  -[NSPAppRule fallbackCountBeforeImmediateFallback](self->_defaults, "fallbackCountBeforeImmediateFallback");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fallbackCountBeforeImmediateFallback) = myIsEqual(fallbackCountBeforeImmediateFallback, v28);

  if ((fallbackCountBeforeImmediateFallback & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackCountBeforeImmediateFallback, CFSTR("FallbackCountBeforeImmediateFallback"));
  proxyEvaluationPath = self->_proxyEvaluationPath;
  -[NSPAppRule proxyEvaluationPath](self->_defaults, "proxyEvaluationPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(proxyEvaluationPath) = myIsEqual(proxyEvaluationPath, v30);

  if ((proxyEvaluationPath & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_proxyEvaluationPath, CFSTR("ProxyEvaluationPath"));
  useCustomProtocol = self->_useCustomProtocol;
  -[NSPAppRule useCustomProtocol](self->_defaults, "useCustomProtocol");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(useCustomProtocol) = myIsEqual(useCustomProtocol, v32);

  if ((useCustomProtocol & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_useCustomProtocol, CFSTR("UseCustomProtocol"));
  useLocalFlowDivert = self->_useLocalFlowDivert;
  -[NSPAppRule useLocalFlowDivert](self->_defaults, "useLocalFlowDivert");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(useLocalFlowDivert) = myIsEqual(useLocalFlowDivert, v34);

  if ((useLocalFlowDivert & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_useLocalFlowDivert, CFSTR("UseLocalFlowDivert"));
  enableDirectRace = self->_enableDirectRace;
  -[NSPAppRule enableDirectRace](self->_defaults, "enableDirectRace");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableDirectRace) = myIsEqual(enableDirectRace, v36);

  if ((enableDirectRace & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableDirectRace, CFSTR("EnableDirectRace"));
  shouldComposeInitialData = self->_shouldComposeInitialData;
  -[NSPAppRule shouldComposeInitialData](self->_defaults, "shouldComposeInitialData");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(shouldComposeInitialData) = myIsEqual(shouldComposeInitialData, v38);

  if ((shouldComposeInitialData & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_shouldComposeInitialData, CFSTR("ComposeInitialData"));
  label = self->_label;
  -[NSPAppRule label](self->_defaults, "label");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(label) = myIsEqual(label, v40);

  if ((label & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_edgeSetIdentifier, CFSTR("edges"));
  connectionTimeout = self->_connectionTimeout;
  -[NSPAppRule connectionTimeout](self->_defaults, "connectionTimeout");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(connectionTimeout) = myIsEqual(connectionTimeout, v42);

  if ((connectionTimeout & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_connectionTimeout, CFSTR("connection"));
  connectionIdleTimeout = self->_connectionIdleTimeout;
  -[NSPAppRule connectionIdleTimeout](self->_defaults, "connectionIdleTimeout");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(connectionIdleTimeout) = myIsEqual(connectionIdleTimeout, v44);

  if ((connectionIdleTimeout & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_connectionIdleTimeout, CFSTR("idle"));
  enableTFO = self->_enableTFO;
  -[NSPAppRule enableTFO](self->_defaults, "enableTFO");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableTFO) = myIsEqual(enableTFO, v46);

  if ((enableTFO & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableTFO, CFSTR("tfo"));
  requireTFO = self->_requireTFO;
  -[NSPAppRule requireTFO](self->_defaults, "requireTFO");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(requireTFO) = myIsEqual(requireTFO, v48);

  if ((requireTFO & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_requireTFO, CFSTR("must-tfo"));
  enableNoTFOCookie = self->_enableNoTFOCookie;
  -[NSPAppRule enableNoTFOCookie](self->_defaults, "enableNoTFOCookie");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableNoTFOCookie) = myIsEqual(enableNoTFOCookie, v50);

  if ((enableNoTFOCookie & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableTFO, CFSTR("notfocookie"));
  enableMultipath = self->_enableMultipath;
  -[NSPAppRule enableMultipath](self->_defaults, "enableMultipath");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableMultipath) = myIsEqual(enableMultipath, v52);

  if ((enableMultipath & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableMultipath, CFSTR("mptcp"));
  enableUDPRace = self->_enableUDPRace;
  -[NSPAppRule enableUDPRace](self->_defaults, "enableUDPRace");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableUDPRace) = myIsEqual(enableUDPRace, v54);

  if ((enableUDPRace & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableUDPRace, CFSTR("udp"));
  enableRatio = self->_enableRatio;
  -[NSPAppRule enableRatio](self->_defaults, "enableRatio");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableRatio) = myIsEqual(enableRatio, v56);

  if ((enableRatio & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableRatio, CFSTR("enable-ratio"));
  reenableInterval = self->_reenableInterval;
  -[NSPAppRule reenableInterval](self->_defaults, "reenableInterval");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(reenableInterval) = myIsEqual(reenableInterval, v58);

  if ((reenableInterval & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_reenableInterval, CFSTR("interval"));
  telemetryRatio = self->_telemetryRatio;
  -[NSPAppRule telemetryRatio](self->_defaults, "telemetryRatio");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(telemetryRatio) = myIsEqual(telemetryRatio, v60);

  if ((telemetryRatio & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_telemetryRatio, CFSTR("telemetry-ratio"));
  enableOptInPerTask = self->_enableOptInPerTask;
  -[NSPAppRule enableOptInPerTask](self->_defaults, "enableOptInPerTask");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(enableOptInPerTask) = myIsEqual(enableOptInPerTask, v62);

  if ((enableOptInPerTask & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_enableOptInPerTask, CFSTR("EnableOptInPerTask"));
  matchEffectiveApplications = self->_matchEffectiveApplications;
  -[NSPAppRule matchEffectiveApplications](self->_defaults, "matchEffectiveApplications");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(matchEffectiveApplications) = myIsEqual(matchEffectiveApplications, v64);

  if ((matchEffectiveApplications & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_matchEffectiveApplications, CFSTR("matchEffectiveApplications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_configurationIdentifier, CFSTR("configID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_enableCheckDate, CFSTR("enableCheckDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disabledByRatio, CFSTR("disabledByRatio"));
  locationBundlePath = self->_locationBundlePath;
  -[NSPAppRule locationBundlePath](self->_defaults, "locationBundlePath");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(locationBundlePath) = myIsEqual(locationBundlePath, v66);

  if ((locationBundlePath & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_locationBundlePath, CFSTR("locationBundlePath"));
  initialWindowSize = self->_initialWindowSize;
  -[NSPAppRule initialWindowSize](self->_defaults, "initialWindowSize");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(initialWindowSize) = myIsEqual(initialWindowSize, v68);

  if ((initialWindowSize & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_initialWindowSize, CFSTR("rwnd"));
  -[NSPAppRule updateHash](self, "updateHash");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v69, CFSTR("appRuleUpdateHash"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *matchEffectiveApplications;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  id v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  NSNumber *disableFallback;
  NSNumber *divertDNSOnly;
  NSNumber *noDNSDelegation;
  NSArray *directTLSPorts;
  NSNumber *enableDirectMultipath;
  NSNumber *enableDirectTFO;
  NSNumber *enableDirectExtendedValidation;
  NSNumber *serviceID;
  NSNumber *fallbackTimeout;
  NSNumber *fallbackBufferLimit;
  NSNumber *fallbackCountBeforeImmediateFallback;
  NSNumber *enabled;
  NSNumber *useCustomProtocol;
  NSNumber *useLocalFlowDivert;
  NSNumber *enableDirectRace;
  NSString *proxyEvaluationPath;
  NSString *v51;
  NSString *label;
  NSString *edgeSetIdentifier;
  NSNumber *connectionTimeout;
  NSNumber *connectionIdleTimeout;
  NSNumber *enableTFO;
  NSNumber *requireTFO;
  NSNumber *enableNoTFOCookie;
  NSNumber *enableMultipath;
  NSNumber *enableUDPRace;
  NSNumber *enableRatio;
  NSNumber *reenableInterval;
  NSNumber *telemetryRatio;
  NSNumber *enableOptInPerTask;
  NSString *locationBundlePath;
  NSNumber *initialWindowSize;
  void *v67;
  char v68;
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
  int v106;
  void *v107;
  void *v108;
  _BYTE v109[28];
  _BYTE v110[12];
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  _BYTE v115[20];
  _BOOL8 v116;
  int IsEqual;
  void *v118;
  id v119;
  uint64_t v120;

  v4 = a3;
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchSigningIdentifier");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v5;
  IsEqual = myIsEqual(v5, v118);
  if (!IsEqual)
  {
    v20 = 0;
    v120 = 0;
    v12 = 0;
    v13 = 0;
    v114 = 0;
    memset(v115, 0, sizeof(v115));
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_10;
  }
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchAccountIdentifiers");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v7;
  if (!myIsEqual(v7, v107))
  {
    v120 = 0;
    v12 = 0;
    v13 = 0;
    v114 = 0;
    memset(v115, 0, sizeof(v115));
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_10;
  }
  -[NEAppRule matchPath](self, "matchPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchPath");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v8;
  if (!myIsEqual(v8, v104))
  {
    v12 = 0;
    v13 = 0;
    v114 = 0;
    memset(v115, 0, sizeof(v115));
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    goto LABEL_10;
  }
  -[NEAppRule matchDomains](self, "matchDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchDomains");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v9;
  if (!myIsEqual(v9, v102))
  {
    *(_QWORD *)v115 = 0;
    *(_QWORD *)&v115[8] = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v114 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    goto LABEL_10;
  }
  matchEffectiveApplications = self->_matchEffectiveApplications;
  objc_msgSend(v4, "matchEffectiveApplications");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(matchEffectiveApplications, v101)
    || (v11 = -[NEAppRule noDivertDNS](self, "noDivertDNS"), v11 != objc_msgSend(v4, "noDivertDNS")))
  {
    *(_QWORD *)v115 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v114 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 1;
    goto LABEL_10;
  }
  disableFallback = self->_disableFallback;
  objc_msgSend(v4, "disableFallback");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(disableFallback, v100))
  {
    *(_QWORD *)v115 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v114 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    goto LABEL_10;
  }
  divertDNSOnly = self->_divertDNSOnly;
  objc_msgSend(v4, "divertDNSOnly");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(divertDNSOnly, v99))
  {
    v12 = 0;
    v13 = 0;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000000;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    goto LABEL_10;
  }
  noDNSDelegation = self->_noDNSDelegation;
  objc_msgSend(v4, "noDNSDelegation");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(noDNSDelegation, v98))
  {
    v13 = 0;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000000;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    goto LABEL_10;
  }
  directTLSPorts = self->_directTLSPorts;
  objc_msgSend(v4, "directTLSPorts");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(directTLSPorts, v97))
  {
    v114 = 0;
    *(_QWORD *)v115 = 0x100000000;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    goto LABEL_10;
  }
  enableDirectMultipath = self->_enableDirectMultipath;
  objc_msgSend(v4, "enableDirectMultipath");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(enableDirectMultipath, v96))
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    goto LABEL_10;
  }
  enableDirectTFO = self->_enableDirectTFO;
  objc_msgSend(v4, "enableDirectTFO");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(enableDirectTFO, v95))
  {
    v15 = 0;
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    goto LABEL_10;
  }
  enableDirectExtendedValidation = self->_enableDirectExtendedValidation;
  objc_msgSend(v4, "enableDirectExtendedValidation");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(enableDirectExtendedValidation, v94))
  {
    v16 = 0;
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    goto LABEL_10;
  }
  serviceID = self->_serviceID;
  objc_msgSend(v4, "serviceID");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(serviceID, v93))
  {
    v113 = 0;
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    goto LABEL_10;
  }
  fallbackTimeout = self->_fallbackTimeout;
  objc_msgSend(v4, "fallbackTimeout");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(fallbackTimeout, v92))
  {
    v112 = 0;
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    goto LABEL_10;
  }
  fallbackBufferLimit = self->_fallbackBufferLimit;
  objc_msgSend(v4, "fallbackBufferLimit");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(fallbackBufferLimit, v91))
  {
    v111 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    goto LABEL_10;
  }
  fallbackCountBeforeImmediateFallback = self->_fallbackCountBeforeImmediateFallback;
  objc_msgSend(v4, "fallbackCountBeforeImmediateFallback");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(fallbackCountBeforeImmediateFallback, v90))
  {
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    v111 = 0x100000000;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    goto LABEL_10;
  }
  enabled = self->_enabled;
  objc_msgSend(v4, "enabled");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(enabled, v89))
  {
    *(_QWORD *)v110 = 0;
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    goto LABEL_10;
  }
  useCustomProtocol = self->_useCustomProtocol;
  objc_msgSend(v4, "useCustomProtocol");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(useCustomProtocol, v88))
  {
    v116 = 0;
    memset(v109, 0, sizeof(v109));
    *(_QWORD *)v110 = 0x100000000;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    goto LABEL_10;
  }
  useLocalFlowDivert = self->_useLocalFlowDivert;
  objc_msgSend(v4, "useLocalFlowDivert");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(useLocalFlowDivert, v87))
  {
    v116 = 0;
    memset(v109, 0, 24);
    *(_QWORD *)v110 = 0x100000000;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    *(_DWORD *)&v109[24] = 1;
    goto LABEL_10;
  }
  enableDirectRace = self->_enableDirectRace;
  objc_msgSend(v4, "enableDirectRace");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (!myIsEqual(enableDirectRace, v86))
  {
    v116 = 0;
    memset(v109, 0, 20);
    *(_QWORD *)v110 = 0x100000000;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v120 = 1;
    *(_DWORD *)&v115[16] = 1;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    v111 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    *(_DWORD *)&v109[24] = 1;
    *(_DWORD *)&v109[20] = 1;
    goto LABEL_10;
  }
  proxyEvaluationPath = self->_proxyEvaluationPath;
  HIDWORD(v116) = proxyEvaluationPath == 0;
  if (proxyEvaluationPath
    || (objc_msgSend(v4, "proxyEvaluationPath"), (v84 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "proxyEvaluationPath");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v85)
    {
      v85 = 0;
      memset(v109, 0, 20);
      *(_QWORD *)v110 = 0x100000000;
      v111 = 0x100000000;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v120 = 0x100000001;
      *(_DWORD *)&v115[16] = 1;
      LOBYTE(v116) = 0;
      *(_QWORD *)&v115[8] = 0x100000001;
      v12 = 1;
      v13 = 1;
      v114 = 0;
      *(_QWORD *)v115 = 0x100000001;
      v14 = 1;
      v15 = 1;
      v16 = 1;
      v113 = 0x100000000;
      v112 = 0x100000000;
      *(_DWORD *)&v110[8] = 1;
      *(_DWORD *)&v109[20] = 1;
      *(_DWORD *)&v109[24] = 1;
      goto LABEL_10;
    }
    v51 = self->_proxyEvaluationPath;
    objc_msgSend(v4, "proxyEvaluationPath");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v120) = 1;
    if (!-[NSString isEqualToString:](v51, "isEqualToString:"))
    {
      *(_OWORD *)&v109[4] = 0uLL;
      *(_QWORD *)v110 = 0x100000000;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      *(_DWORD *)&v115[16] = 1;
      LOBYTE(v116) = 0;
      *(_QWORD *)&v115[8] = 0x100000001;
      v12 = 1;
      v13 = 1;
      v114 = 0;
      *(_QWORD *)v115 = 0x100000001;
      v14 = 1;
      v15 = 1;
      v16 = 1;
      v113 = 0x100000000;
      v112 = 0x100000000;
      v111 = 0x100000000;
      *(_DWORD *)&v110[8] = 1;
      *(_DWORD *)&v109[20] = 1;
      *(_DWORD *)&v109[24] = 1;
      HIDWORD(v120) = 1;
      *(_DWORD *)v109 = 1;
      goto LABEL_10;
    }
    HIDWORD(v120) = 1;
  }
  else
  {
    v84 = 0;
    HIDWORD(v120) = 0;
  }
  label = self->_label;
  objc_msgSend(v4, "label");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if (myIsEqual(label, v82))
  {
    edgeSetIdentifier = self->_edgeSetIdentifier;
    objc_msgSend(v4, "edgeSetIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (myIsEqual(edgeSetIdentifier, v81))
    {
      connectionTimeout = self->_connectionTimeout;
      objc_msgSend(v4, "connectionTimeout");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (myIsEqual(connectionTimeout, v80))
      {
        connectionIdleTimeout = self->_connectionIdleTimeout;
        objc_msgSend(v4, "connectionIdleTimeout");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (myIsEqual(connectionIdleTimeout, v79))
        {
          enableTFO = self->_enableTFO;
          objc_msgSend(v4, "enableTFO");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (myIsEqual(enableTFO, v78))
          {
            requireTFO = self->_requireTFO;
            objc_msgSend(v4, "requireTFO");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if (myIsEqual(requireTFO, v77))
            {
              enableNoTFOCookie = self->_enableNoTFOCookie;
              objc_msgSend(v4, "enableNoTFOCookie");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              if (myIsEqual(enableNoTFOCookie, v76))
              {
                enableMultipath = self->_enableMultipath;
                objc_msgSend(v4, "enableMultipath");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                if (myIsEqual(enableMultipath, v75))
                {
                  enableUDPRace = self->_enableUDPRace;
                  objc_msgSend(v4, "enableUDPRace");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  if (myIsEqual(enableUDPRace, v74))
                  {
                    enableRatio = self->_enableRatio;
                    objc_msgSend(v4, "enableRatio");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    if (myIsEqual(enableRatio, v73))
                    {
                      reenableInterval = self->_reenableInterval;
                      objc_msgSend(v4, "reenableInterval");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      if (myIsEqual(reenableInterval, v72))
                      {
                        telemetryRatio = self->_telemetryRatio;
                        objc_msgSend(v4, "telemetryRatio");
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        if (myIsEqual(telemetryRatio, v71))
                        {
                          enableOptInPerTask = self->_enableOptInPerTask;
                          objc_msgSend(v4, "enableOptInPerTask");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          if (myIsEqual(enableOptInPerTask, v70))
                          {
                            locationBundlePath = self->_locationBundlePath;
                            objc_msgSend(v4, "locationBundlePath");
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            if (myIsEqual(locationBundlePath, v69))
                            {
                              initialWindowSize = self->_initialWindowSize;
                              objc_msgSend(v4, "initialWindowSize");
                              v67 = (void *)objc_claimAutoreleasedReturnValue();
                              v68 = myIsEqual(initialWindowSize, v67);
                              v6 = v67;
                              LODWORD(v120) = 1;
                              *(_DWORD *)&v115[16] = 1;
                              LOBYTE(v116) = v68;
                              *(_DWORD *)&v115[8] = 1;
                              *(_DWORD *)&v115[12] = 1;
                              *(_DWORD *)v115 = 1;
                              *(_DWORD *)&v115[4] = 1;
                              v12 = 1;
                              v13 = 1;
                              v14 = 1;
                              v15 = 1;
                              v16 = 1;
                              HIDWORD(v113) = 1;
                              HIDWORD(v112) = 1;
                              HIDWORD(v111) = 1;
                              *(_DWORD *)&v110[4] = 1;
                              *(_DWORD *)&v110[8] = 1;
                              *(_DWORD *)&v109[20] = 1;
                              *(_DWORD *)&v109[24] = 1;
                              v22 = 1;
                            }
                            else
                            {
                              v22 = 0;
                              LODWORD(v120) = 1;
                              *(_DWORD *)&v115[16] = 1;
                              LOBYTE(v116) = 0;
                              *(_DWORD *)&v115[8] = 1;
                              *(_DWORD *)&v115[12] = 1;
                              *(_DWORD *)v115 = 1;
                              *(_DWORD *)&v115[4] = 1;
                              v12 = 1;
                              v13 = 1;
                              v14 = 1;
                              v15 = 1;
                              v16 = 1;
                              HIDWORD(v113) = 1;
                              HIDWORD(v112) = 1;
                              HIDWORD(v111) = 1;
                              *(_DWORD *)&v110[4] = 1;
                              *(_DWORD *)&v110[8] = 1;
                              *(_DWORD *)&v109[20] = 1;
                              *(_DWORD *)&v109[24] = 1;
                            }
                            *(_DWORD *)v109 = HIDWORD(v120);
                            *(_DWORD *)&v109[4] = 1;
                            *(_DWORD *)&v109[8] = 1;
                            *(_DWORD *)&v109[12] = 1;
                            *(_DWORD *)&v109[16] = 1;
                            *(_DWORD *)v110 = 1;
                            LODWORD(v111) = 1;
                            LODWORD(v112) = 1;
                            LODWORD(v113) = 1;
                            v114 = 1;
                            v17 = 1;
                            v18 = 1;
                            v19 = 1;
                            v20 = 1;
                            v21 = 1;
                          }
                          else
                          {
                            v21 = 0;
                            v22 = 0;
                            LODWORD(v120) = 1;
                            *(_DWORD *)&v115[16] = 1;
                            LOBYTE(v116) = 0;
                            *(_QWORD *)&v115[8] = 0x100000001;
                            *(_QWORD *)v115 = 0x100000001;
                            v12 = 1;
                            v13 = 1;
                            v14 = 1;
                            v15 = 1;
                            v16 = 1;
                            *(_DWORD *)&v110[8] = 1;
                            *(_DWORD *)&v109[24] = 1;
                            v6 = (void *)HIDWORD(v120);
                            *(_DWORD *)v109 = HIDWORD(v120);
                            *(_DWORD *)&v109[4] = 1;
                            *(_DWORD *)&v109[8] = 1;
                            *(_DWORD *)&v109[12] = 1;
                            *(_QWORD *)&v109[16] = 0x100000001;
                            *(_QWORD *)v110 = 0x100000001;
                            v111 = 0x100000001;
                            v112 = 0x100000001;
                            v113 = 0x100000001;
                            v114 = 1;
                            v17 = 1;
                            v18 = 1;
                            v19 = 1;
                            v20 = 1;
                          }
                        }
                        else
                        {
                          v20 = 0;
                          v21 = 0;
                          v22 = 0;
                          LODWORD(v120) = 1;
                          *(_DWORD *)&v115[16] = 1;
                          LOBYTE(v116) = 0;
                          *(_QWORD *)&v115[8] = 0x100000001;
                          *(_QWORD *)v115 = 0x100000001;
                          v12 = 1;
                          v13 = 1;
                          v14 = 1;
                          v15 = 1;
                          v16 = 1;
                          *(_DWORD *)&v110[8] = 1;
                          *(_DWORD *)&v109[24] = 1;
                          v6 = (void *)HIDWORD(v120);
                          *(_DWORD *)v109 = HIDWORD(v120);
                          *(_DWORD *)&v109[4] = 1;
                          *(_DWORD *)&v109[8] = 1;
                          *(_DWORD *)&v109[12] = 1;
                          *(_QWORD *)&v109[16] = 0x100000001;
                          *(_QWORD *)v110 = 0x100000001;
                          v111 = 0x100000001;
                          v112 = 0x100000001;
                          v113 = 0x100000001;
                          v114 = 1;
                          v17 = 1;
                          v18 = 1;
                          v19 = 1;
                        }
                      }
                      else
                      {
                        v19 = 0;
                        v20 = 0;
                        v21 = 0;
                        v22 = 0;
                        LODWORD(v120) = 1;
                        *(_DWORD *)&v115[16] = 1;
                        LOBYTE(v116) = 0;
                        *(_QWORD *)&v115[8] = 0x100000001;
                        *(_QWORD *)v115 = 0x100000001;
                        v12 = 1;
                        v13 = 1;
                        v14 = 1;
                        v15 = 1;
                        v16 = 1;
                        *(_DWORD *)&v110[8] = 1;
                        *(_DWORD *)&v109[24] = 1;
                        v6 = (void *)HIDWORD(v120);
                        *(_DWORD *)v109 = HIDWORD(v120);
                        *(_DWORD *)&v109[4] = 1;
                        *(_DWORD *)&v109[8] = 1;
                        *(_DWORD *)&v109[12] = 1;
                        *(_QWORD *)&v109[16] = 0x100000001;
                        *(_QWORD *)v110 = 0x100000001;
                        v111 = 0x100000001;
                        v112 = 0x100000001;
                        v113 = 0x100000001;
                        v114 = 1;
                        v17 = 1;
                        v18 = 1;
                      }
                    }
                    else
                    {
                      v18 = 0;
                      v19 = 0;
                      v20 = 0;
                      v21 = 0;
                      v22 = 0;
                      LODWORD(v120) = 1;
                      *(_DWORD *)&v115[16] = 1;
                      LOBYTE(v116) = 0;
                      *(_QWORD *)&v115[8] = 0x100000001;
                      *(_QWORD *)v115 = 0x100000001;
                      v12 = 1;
                      v13 = 1;
                      v14 = 1;
                      v15 = 1;
                      v16 = 1;
                      *(_DWORD *)&v110[8] = 1;
                      *(_DWORD *)&v109[24] = 1;
                      v6 = (void *)HIDWORD(v120);
                      *(_DWORD *)v109 = HIDWORD(v120);
                      *(_DWORD *)&v109[4] = 1;
                      *(_DWORD *)&v109[8] = 1;
                      *(_DWORD *)&v109[12] = 1;
                      *(_QWORD *)&v109[16] = 0x100000001;
                      *(_QWORD *)v110 = 0x100000001;
                      v111 = 0x100000001;
                      v112 = 0x100000001;
                      v113 = 0x100000001;
                      v114 = 1;
                      v17 = 1;
                    }
                  }
                  else
                  {
                    v17 = 0;
                    v18 = 0;
                    v19 = 0;
                    v20 = 0;
                    v21 = 0;
                    v22 = 0;
                    LODWORD(v120) = 1;
                    *(_DWORD *)&v115[16] = 1;
                    LOBYTE(v116) = 0;
                    *(_QWORD *)&v115[8] = 0x100000001;
                    *(_QWORD *)v115 = 0x100000001;
                    v12 = 1;
                    v13 = 1;
                    v14 = 1;
                    v15 = 1;
                    v16 = 1;
                    *(_DWORD *)&v110[8] = 1;
                    *(_DWORD *)&v109[24] = 1;
                    v6 = (void *)HIDWORD(v120);
                    *(_DWORD *)v109 = HIDWORD(v120);
                    *(_DWORD *)&v109[4] = 1;
                    *(_DWORD *)&v109[8] = 1;
                    *(_DWORD *)&v109[12] = 1;
                    *(_QWORD *)&v109[16] = 0x100000001;
                    *(_QWORD *)v110 = 0x100000001;
                    v111 = 0x100000001;
                    v112 = 0x100000001;
                    v113 = 0x100000001;
                    v114 = 1;
                  }
                }
                else
                {
                  v17 = 0;
                  v18 = 0;
                  v19 = 0;
                  v20 = 0;
                  v21 = 0;
                  v22 = 0;
                  LODWORD(v120) = 1;
                  *(_DWORD *)&v115[16] = 1;
                  LOBYTE(v116) = 0;
                  *(_QWORD *)&v115[8] = 0x100000001;
                  v12 = 1;
                  v13 = 1;
                  v114 = 0;
                  *(_QWORD *)v115 = 0x100000001;
                  v14 = 1;
                  v15 = 1;
                  v16 = 1;
                  *(_DWORD *)&v110[8] = 1;
                  *(_DWORD *)&v109[24] = 1;
                  v6 = (void *)HIDWORD(v120);
                  *(_DWORD *)v109 = HIDWORD(v120);
                  *(_DWORD *)&v109[4] = 1;
                  *(_DWORD *)&v109[8] = 1;
                  *(_DWORD *)&v109[12] = 1;
                  *(_QWORD *)&v109[16] = 0x100000001;
                  *(_QWORD *)v110 = 0x100000001;
                  v111 = 0x100000001;
                  v112 = 0x100000001;
                  v113 = 0x100000001;
                }
              }
              else
              {
                v17 = 0;
                v18 = 0;
                v19 = 0;
                v20 = 0;
                v21 = 0;
                v22 = 0;
                LODWORD(v120) = 1;
                *(_DWORD *)&v115[16] = 1;
                LOBYTE(v116) = 0;
                *(_QWORD *)&v115[8] = 0x100000001;
                v12 = 1;
                v13 = 1;
                v114 = 0;
                *(_QWORD *)v115 = 0x100000001;
                v14 = 1;
                v15 = 1;
                v16 = 1;
                v113 = 0x100000000;
                *(_DWORD *)&v110[8] = 1;
                *(_DWORD *)&v109[24] = 1;
                v6 = (void *)HIDWORD(v120);
                *(_DWORD *)v109 = HIDWORD(v120);
                *(_DWORD *)&v109[4] = 1;
                *(_DWORD *)&v109[8] = 1;
                *(_DWORD *)&v109[12] = 1;
                *(_QWORD *)&v109[16] = 0x100000001;
                *(_QWORD *)v110 = 0x100000001;
                v111 = 0x100000001;
                v112 = 0x100000001;
              }
            }
            else
            {
              v17 = 0;
              v18 = 0;
              v19 = 0;
              v20 = 0;
              v21 = 0;
              v22 = 0;
              LODWORD(v120) = 1;
              *(_DWORD *)&v115[16] = 1;
              LOBYTE(v116) = 0;
              *(_QWORD *)&v115[8] = 0x100000001;
              v12 = 1;
              v13 = 1;
              v114 = 0;
              *(_QWORD *)v115 = 0x100000001;
              v14 = 1;
              v15 = 1;
              v16 = 1;
              v113 = 0x100000000;
              v112 = 0x100000000;
              *(_DWORD *)&v110[8] = 1;
              *(_DWORD *)&v109[24] = 1;
              v6 = (void *)HIDWORD(v120);
              *(_DWORD *)v109 = HIDWORD(v120);
              *(_DWORD *)&v109[4] = 1;
              *(_DWORD *)&v109[8] = 1;
              *(_DWORD *)&v109[12] = 1;
              *(_QWORD *)&v109[16] = 0x100000001;
              *(_QWORD *)v110 = 0x100000001;
              v111 = 0x100000001;
            }
          }
          else
          {
            v111 = 0x100000000;
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            LODWORD(v120) = 1;
            *(_DWORD *)&v115[16] = 1;
            LOBYTE(v116) = 0;
            *(_QWORD *)&v115[8] = 0x100000001;
            v12 = 1;
            v13 = 1;
            v114 = 0;
            *(_QWORD *)v115 = 0x100000001;
            v14 = 1;
            v15 = 1;
            v16 = 1;
            v113 = 0x100000000;
            v112 = 0x100000000;
            *(_DWORD *)&v110[8] = 1;
            *(_DWORD *)&v109[24] = 1;
            v6 = (void *)HIDWORD(v120);
            *(_DWORD *)v109 = HIDWORD(v120);
            *(_DWORD *)&v109[4] = 1;
            *(_DWORD *)&v109[8] = 1;
            *(_DWORD *)&v109[12] = 1;
            *(_QWORD *)&v109[16] = 0x100000001;
            *(_QWORD *)v110 = 0x100000001;
          }
        }
        else
        {
          *(_QWORD *)v110 = 0x100000000;
          v111 = 0x100000000;
          v17 = 0;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v22 = 0;
          LODWORD(v120) = 1;
          *(_DWORD *)&v115[16] = 1;
          LOBYTE(v116) = 0;
          *(_QWORD *)&v115[8] = 0x100000001;
          v12 = 1;
          v13 = 1;
          v114 = 0;
          *(_QWORD *)v115 = 0x100000001;
          v14 = 1;
          v15 = 1;
          v16 = 1;
          v113 = 0x100000000;
          v112 = 0x100000000;
          *(_DWORD *)&v110[8] = 1;
          *(_DWORD *)&v109[24] = 1;
          v6 = (void *)HIDWORD(v120);
          *(_DWORD *)v109 = HIDWORD(v120);
          *(_DWORD *)&v109[4] = 1;
          *(_DWORD *)&v109[8] = 1;
          *(_DWORD *)&v109[12] = 1;
          *(_QWORD *)&v109[16] = 0x100000001;
        }
      }
      else
      {
        *(_QWORD *)&v109[16] = 0x100000000;
        *(_QWORD *)v110 = 0x100000000;
        v111 = 0x100000000;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        LODWORD(v120) = 1;
        *(_DWORD *)&v115[16] = 1;
        LOBYTE(v116) = 0;
        *(_QWORD *)&v115[8] = 0x100000001;
        v12 = 1;
        v13 = 1;
        v114 = 0;
        *(_QWORD *)v115 = 0x100000001;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        v113 = 0x100000000;
        v112 = 0x100000000;
        *(_DWORD *)&v110[8] = 1;
        *(_DWORD *)&v109[24] = 1;
        v6 = (void *)HIDWORD(v120);
        *(_DWORD *)v109 = HIDWORD(v120);
        *(_DWORD *)&v109[4] = 1;
        *(_DWORD *)&v109[8] = 1;
        *(_DWORD *)&v109[12] = 1;
      }
    }
    else
    {
      *(_QWORD *)&v109[12] = 0;
      *(_QWORD *)v110 = 0x100000000;
      v111 = 0x100000000;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v120) = 1;
      *(_DWORD *)&v115[16] = 1;
      LOBYTE(v116) = 0;
      *(_QWORD *)&v115[8] = 0x100000001;
      v12 = 1;
      v13 = 1;
      v114 = 0;
      *(_QWORD *)v115 = 0x100000001;
      v14 = 1;
      v15 = 1;
      v16 = 1;
      v113 = 0x100000000;
      v112 = 0x100000000;
      *(_DWORD *)&v110[8] = 1;
      *(_DWORD *)&v109[20] = 1;
      *(_DWORD *)&v109[24] = 1;
      v6 = (void *)HIDWORD(v120);
      *(_DWORD *)v109 = HIDWORD(v120);
      *(_DWORD *)&v109[4] = 1;
      *(_DWORD *)&v109[8] = 1;
    }
  }
  else
  {
    *(_QWORD *)&v109[8] = 0;
    *(_QWORD *)&v109[16] = 0x100000000;
    *(_QWORD *)v110 = 0x100000000;
    v111 = 0x100000000;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    LODWORD(v120) = 1;
    *(_DWORD *)&v115[16] = 1;
    LOBYTE(v116) = 0;
    *(_QWORD *)&v115[8] = 0x100000001;
    v12 = 1;
    v13 = 1;
    v114 = 0;
    *(_QWORD *)v115 = 0x100000001;
    v14 = 1;
    v15 = 1;
    v16 = 1;
    v113 = 0x100000000;
    v112 = 0x100000000;
    *(_DWORD *)&v110[8] = 1;
    *(_DWORD *)&v109[24] = 1;
    *(_DWORD *)v109 = HIDWORD(v120);
    *(_DWORD *)&v109[4] = 1;
  }
LABEL_10:
  if (v22)
  {
    v106 = v16;
    v23 = v4;
    v24 = v15;
    v25 = v17;
    v26 = v14;
    v27 = v18;
    v28 = v19;
    v29 = v13;
    v30 = v20;
    v31 = v12;
    v32 = v21;

    v33 = v32;
    v12 = v31;
    v20 = v30;
    v13 = v29;
    v19 = v28;
    v18 = v27;
    v14 = v26;
    v17 = v25;
    v15 = v24;
    v4 = v23;
    v16 = v106;
    if (!v33)
      goto LABEL_12;
  }
  else if (!v21)
  {
LABEL_12:
    if (v20)
      goto LABEL_13;
    goto LABEL_19;
  }

  if (v20)
  {
LABEL_13:

    if (!v19)
      goto LABEL_14;
    goto LABEL_20;
  }
LABEL_19:
  if (!v19)
  {
LABEL_14:
    if (v18)
      goto LABEL_15;
LABEL_21:
    if (!v17)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_20:

  if (!v18)
    goto LABEL_21;
LABEL_15:

  if (v17)
LABEL_22:

LABEL_23:
  if (v114)

  if ((_DWORD)v113)
  if ((_DWORD)v112)

  if ((_DWORD)v111)
  if (*(_DWORD *)v110)

  if (*(_DWORD *)&v109[16])
  if (*(_DWORD *)&v109[12])

  if (*(_DWORD *)&v109[8])
  if (*(_DWORD *)&v109[4])

  if (*(_DWORD *)v109)
  if (HIDWORD(v120))

  if (HIDWORD(v116))
  if (*(_DWORD *)&v109[20])

  if (*(_DWORD *)&v109[24])
  if (*(_DWORD *)&v110[4])

  if (*(_DWORD *)&v110[8])
  if (HIDWORD(v111))

  if (HIDWORD(v112))
  if (HIDWORD(v113))
  {

    if (!v16)
      goto LABEL_61;
  }
  else if (!v16)
  {
LABEL_61:
    if (v15)
      goto LABEL_62;
LABEL_66:
    if (!v14)
      goto LABEL_68;
    goto LABEL_67;
  }

  if (!v15)
    goto LABEL_66;
LABEL_62:

  if (v14)
LABEL_67:

LABEL_68:
  if (*(_DWORD *)v115)
  {

    if (!v13)
      goto LABEL_70;
  }
  else if (!v13)
  {
LABEL_70:
    if (!v12)
      goto LABEL_72;
    goto LABEL_71;
  }

  if (v12)
LABEL_71:

LABEL_72:
  if (*(_DWORD *)&v115[4])

  if (*(_DWORD *)&v115[12])
  if (*(_DWORD *)&v115[8])

  if (*(_DWORD *)&v115[16])
  {

  }
  if ((_DWORD)v120)
  {

  }
  if (IsEqual)
  {

  }
  return v116;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSPAppRule;
  v4 = -[NEAppRule copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDisableFallback:", self->_disableFallback);
  objc_msgSend(v4, "setEnableDirectMultipath:", self->_enableDirectMultipath);
  objc_msgSend(v4, "setEnableDirectTFO:", self->_enableDirectTFO);
  objc_msgSend(v4, "setEnableDirectExtendedValidation:", self->_enableDirectExtendedValidation);
  objc_msgSend(v4, "setDirectTLSPorts:", self->_directTLSPorts);
  objc_msgSend(v4, "setDivertDNSOnly:", self->_divertDNSOnly);
  objc_msgSend(v4, "setNoDNSDelegation:", self->_noDNSDelegation);
  objc_msgSend(v4, "setServiceID:", self->_serviceID);
  objc_msgSend(v4, "setEnabled:", self->_enabled);
  objc_msgSend(v4, "setFallbackTimeout:", self->_fallbackTimeout);
  objc_msgSend(v4, "setFallbackBufferLimit:", self->_fallbackBufferLimit);
  objc_msgSend(v4, "setFallbackCountBeforeImmediateFallback:", self->_fallbackCountBeforeImmediateFallback);
  objc_msgSend(v4, "setProxyEvaluationPath:", self->_proxyEvaluationPath);
  objc_msgSend(v4, "setUseCustomProtocol:", self->_useCustomProtocol);
  objc_msgSend(v4, "setUseLocalFlowDivert:", self->_useLocalFlowDivert);
  objc_msgSend(v4, "setEnableDirectRace:", self->_enableDirectRace);
  objc_msgSend(v4, "setShouldComposeInitialData:", self->_shouldComposeInitialData);
  objc_msgSend(v4, "setLabel:", self->_label);
  objc_msgSend(v4, "setEdgeSetIdentifier:", self->_edgeSetIdentifier);
  objc_msgSend(v4, "setConnectionTimeout:", self->_connectionTimeout);
  objc_msgSend(v4, "setConnectionIdleTimeout:", self->_connectionIdleTimeout);
  objc_msgSend(v4, "setEnableTFO:", self->_enableTFO);
  objc_msgSend(v4, "setRequireTFO:", self->_requireTFO);
  objc_msgSend(v4, "setEnableNoTFOCookie:", self->_enableNoTFOCookie);
  objc_msgSend(v4, "setEnableMultipath:", self->_enableMultipath);
  objc_msgSend(v4, "setEnableUDPRace:", self->_enableUDPRace);
  objc_msgSend(v4, "setEnableRatio:", self->_enableRatio);
  objc_msgSend(v4, "setReenableInterval:", self->_reenableInterval);
  objc_msgSend(v4, "setTelemetryRatio:", self->_telemetryRatio);
  objc_msgSend(v4, "setConfigurationIdentifier:", self->_configurationIdentifier);
  objc_msgSend(v4, "setEnableOptInPerTask:", self->_enableOptInPerTask);
  objc_msgSend(v4, "setMatchEffectiveApplications:", self->_matchEffectiveApplications);
  objc_msgSend(v4, "setEnableCheckDate:", self->_enableCheckDate);
  objc_msgSend(v4, "setDisabledByRatio:", self->_disabledByRatio);
  objc_msgSend(v4, "setLocationBundlePath:", self->_locationBundlePath);
  objc_msgSend(v4, "setInitialWindowSize:", self->_initialWindowSize);
  objc_msgSend(v4, "setUpdateHash:", self->_updateHash);
  return v4;
}

- (id)copyExecutableConditions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppRule matchPath](self, "matchPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[NSPAppRule copyUUIDsForSigningIdentifier:executablePath:](NSPAppRule, "copyUUIDsForSigningIdentifier:executablePath:", v3, v4);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!v9)
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0CD0848], "effectiveApplication:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyAccountIdentifierConditions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!v6)
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0CD0848], "accountIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.assistantd"));

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CD0848], "accountIdentifier:", CFSTR("ace.siri.apple.com"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

  }
  return v6;
}

- (id)copyMatchDomainConditions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NEAppRule matchDomains](self, "matchDomains", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!v5)
          v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0CD0848], "domain:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyMatchEffectiveApplicationConditions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSPAppRule matchEffectiveApplications](self, "matchEffectiveApplications", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!v5)
          v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9 = (void *)objc_msgSend(v8, "copyExecutableConditions");
        objc_msgSend(v5, "addObjectsFromArray:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)copyUUIDsForSigningIdentifier:(id)a3 executablePath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD applier[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "UTF8String");
  v9 = NEHelperCacheCopyAppUUIDMapping();
  v10 = (void *)v9;
  if (v9 && MEMORY[0x1A1AEADA0](v9) == MEMORY[0x1E0C812C8])
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __59__NSPAppRule_copyUUIDsForSigningIdentifier_executablePath___block_invoke;
    applier[3] = &unk_1E4137DA8;
    applier[4] = &v14;
    xpc_array_apply(v10, applier);
  }
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __59__NSPAppRule_copyUUIDsForSigningIdentifier_executablePath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const uint8_t *bytes;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (MEMORY[0x1A1AEADA0]() == MEMORY[0x1E0C813A0])
  {
    bytes = xpc_uuid_get_bytes(v4);
    if (bytes)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", bytes);
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v7, "addObject:", v6);

    }
  }

  return 1;
}

- (id)initFromTLVs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSPAppRule *v7;
  NSPAppRule *v8;
  id *v9;
  NSPAppRule *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, int, unsigned int, double *);
  void *v15;
  id *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  objc_super v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v4 = a3;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  v55 = 0;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __27__NSPAppRule_initFromTLVs___block_invoke;
  v49[3] = &unk_1E4137DD0;
  v49[4] = &v50;
  -[NSMutableData enumerateTLVsUsingBlock:](v5, v49);
  if (v51[5])
  {
    v48.receiver = self;
    v48.super_class = (Class)NSPAppRule;
    v7 = -[NEAppRule initWithSigningIdentifier:](&v48, sel_initWithSigningIdentifier_);
    v8 = v7;
    if (v7)
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__1;
      v46 = __Block_byref_object_dispose__1;
      v47 = 0;
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x3032000000;
      v40[3] = __Block_byref_object_copy__1;
      v40[4] = __Block_byref_object_dispose__1;
      v41 = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__1;
      v38 = __Block_byref_object_dispose__1;
      v39 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      v33 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__1;
      v26 = __Block_byref_object_dispose__1;
      v27 = 0;
      v12 = v6;
      v13 = 3221225472;
      v14 = __27__NSPAppRule_initFromTLVs___block_invoke_2;
      v15 = &unk_1E4137DF8;
      v9 = v7;
      v16 = v9;
      v17 = &v28;
      v18 = &v22;
      v19 = &v42;
      v20 = v40;
      v21 = &v34;
      -[NSMutableData enumerateTLVsUsingBlock:](v5, &v12);
      objc_storeStrong(v9 + 14, (id)v43[5]);
      objc_msgSend(v9, "setMatchAccountIdentifiers:", v35[5], v12, v13, v14, v15);
      objc_msgSend(v9, "setMatchDomains:", v29[5]);
      objc_msgSend(v9, "setMatchEffectiveApplications:", v23[5]);

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(v40, 8);

      _Block_object_dispose(&v42, 8);
    }
    self = v8;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v50, 8);
  return v10;
}

BOOL __27__NSPAppRule_initFromTLVs___block_invoke(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a2 == 1)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  return a2 != 1;
}

uint64_t __27__NSPAppRule_initFromTLVs___block_invoke_2(uint64_t a1, int a2, unsigned int a3, double *a4)
{
  int v7;
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
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;

  switch(a2)
  {
    case 2:
      v7 = *(_DWORD *)a4;
      v8 = (void *)MEMORY[0x1E0C9AAB0];
      v9 = (void *)MEMORY[0x1E0C9AAA0];
      if ((*(_DWORD *)a4 & 0x800) != 0)
        v10 = (void *)MEMORY[0x1E0C9AAB0];
      else
        v10 = (void *)MEMORY[0x1E0C9AAA0];
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), v10);
      if ((v7 & 1) != 0)
        v11 = v8;
      else
        v11 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v11);
      if ((v7 & 2) != 0)
        v12 = v8;
      else
        v12 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), v12);
      if ((v7 & 8) != 0)
        v13 = v8;
      else
        v13 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v13);
      if ((v7 & 4) != 0)
        v14 = v8;
      else
        v14 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v14);
      if ((v7 & 0x10) != 0)
        v15 = v8;
      else
        v15 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), v15);
      if ((v7 & 0x100) != 0)
        v16 = v8;
      else
        v16 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 304), v16);
      if ((v7 & 0x40) != 0)
        v17 = v8;
      else
        v17 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), v17);
      if ((v7 & 0x10000) != 0)
        v18 = v8;
      else
        v18 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 256), v18);
      if ((v7 & 0x8000) != 0)
        v19 = v8;
      else
        v19 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), v19);
      if ((v7 & 0x20) != 0)
        v20 = v8;
      else
        v20 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), v20);
      if ((v7 & 0x80) != 0)
        v21 = v8;
      else
        v21 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), v21);
      if ((v7 & 0x200) != 0)
        v22 = v8;
      else
        v22 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), v22);
      if ((v7 & 0x400) != 0)
        v23 = v8;
      else
        v23 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), v23);
      if ((v7 & 0x1000) != 0)
        v24 = v8;
      else
        v24 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v24);
      if ((v7 & 0x2000) != 0)
        v25 = v8;
      else
        v25 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v25);
      if ((v7 & 0x4000) != 0)
        v26 = v8;
      else
        v26 = v9;
      v27 = *(_QWORD *)(a1 + 32);
      v28 = v26;
      v29 = *(void **)(v27 + 200);
      *(_QWORD *)(v27 + 200) = v28;
      goto LABEL_90;
    case 3:
      v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v30)
      {
        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v31;

        v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)a4);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    case 4:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *(_QWORD *)a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 136;
      goto LABEL_89;
    case 5:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", *a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 152;
      goto LABEL_89;
    case 6:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(unsigned int *)a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 160;
      goto LABEL_89;
    case 7:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(unsigned int *)a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 168;
      goto LABEL_89;
    case 8:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 176;
      goto LABEL_89;
    case 9:
      v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v30)
      {
        v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v40 = *(void **)(v39 + 40);
        *(_QWORD *)(v39 + 40) = v38;

        v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a4);
LABEL_65:
      v29 = (void *)v34;
      v41 = v30;
      goto LABEL_79;
    case 10:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      {
        v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v43 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v44 = *(void **)(v43 + 40);
        *(_QWORD *)(v43 + 40) = v42;

      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
      if (!v29)
        goto LABEL_90;
      v45 = *(_QWORD *)(a1 + 72);
      goto LABEL_78;
    case 12:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", *a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 224;
      goto LABEL_89;
    case 13:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", *a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 232;
      goto LABEL_89;
    case 16:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", *a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 296;
      goto LABEL_89;
    case 17:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 208;
      goto LABEL_89;
    case 18:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v47 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v48 = *(void **)(v47 + 40);
        *(_QWORD *)(v47 + 40) = v46;

      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
      if (!v29)
        goto LABEL_90;
      v45 = *(_QWORD *)(a1 + 40);
LABEL_78:
      v41 = *(void **)(*(_QWORD *)(v45 + 8) + 40);
LABEL_79:
      objc_msgSend(v41, "addObject:", v29);
      goto LABEL_90;
    case 19:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v50 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v51 = *(void **)(v50 + 40);
        *(_QWORD *)(v50 + 40) = v49;

      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, a3, 0);
      v52 = -[NSPAppRule initFromTLVs:]([NSPAppRule alloc], "initFromTLVs:", v29);
      if (v52)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v52);

      goto LABEL_90;
    case 20:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 216;
      goto LABEL_89;
    case 21:
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a4, a3, 4);
      objc_msgSend(*(id *)(a1 + 32), "setMatchPath:", v29);
      goto LABEL_90;
    case 22:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", *(_QWORD *)a4);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 336;
      goto LABEL_89;
    case 23:
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a4, a3);
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 384;
LABEL_89:
      v29 = *(void **)(v36 + v37);
      *(_QWORD *)(v36 + v37) = v35;
LABEL_90:

      break;
    default:
      return 1;
  }
  return 1;
}

- (id)copyTLVData
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  int v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unsigned __int16 v20;
  const char *v21;
  uint64_t v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  const char *v32;
  unsigned __int16 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  const char *v39;
  unsigned __int16 v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  unsigned __int16 v47;
  id v48;
  NSString *edgeSetIdentifier;
  const char *v50;
  unsigned __int16 v51;
  NSNumber *initialWindowSize;
  void *v53;
  void *v54;
  unsigned __int16 v55;
  id v56;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;
  unint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  int v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  -[NEAppRule matchPath](self, "matchPath");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v82 = 0;
  if (v5)
  {
    v8 = strlen(v5);
    -[NSMutableData appendType:length:value:](v3, 1, v8, (uint64_t)v5);
  }
  if (v7)
  {
    v9 = strlen(v7);
    -[NSMutableData appendType:length:value:](v3, 21, v9, (uint64_t)v7);
  }
  if (-[NSNumber BOOLValue](self->_enabled, "BOOLValue"))
  {
    v10 = 2048;
    v82 = 2048;
  }
  else
  {
    v10 = 0;
  }
  if (-[NSNumber BOOLValue](self->_disableFallback, "BOOLValue"))
  {
    v10 |= 1u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableDirectMultipath, "BOOLValue"))
  {
    v10 |= 2u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableDirectTFO, "BOOLValue"))
  {
    v10 |= 8u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableDirectExtendedValidation, "BOOLValue"))
  {
    v10 |= 4u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_useCustomProtocol, "BOOLValue"))
  {
    v10 |= 0x10u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_useLocalFlowDivert, "BOOLValue"))
  {
    v10 |= 0x400u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableDirectRace, "BOOLValue"))
  {
    v10 |= 0x4000u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_divertDNSOnly, "BOOLValue"))
  {
    v10 |= 0x1000u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_noDNSDelegation, "BOOLValue"))
  {
    v10 |= 0x2000u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_shouldComposeInitialData, "BOOLValue"))
  {
    v10 |= 0x100u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableTFO, "BOOLValue"))
  {
    v10 |= 0x40u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_requireTFO, "BOOLValue"))
  {
    v10 |= 0x10000u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableNoTFOCookie, "BOOLValue"))
  {
    v10 |= 0x8000u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableMultipath, "BOOLValue"))
  {
    v10 |= 0x20u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableUDPRace, "BOOLValue"))
  {
    v10 |= 0x80u;
    v82 = v10;
  }
  if (-[NSNumber BOOLValue](self->_enableOptInPerTask, "BOOLValue"))
    v82 = v10 | 0x200;
  -[NSMutableData appendType:length:value:](v3, 2, 4u, (uint64_t)&v82);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v11 = self->_directTLSPorts;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v79 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        LODWORD(v77) = 0;
        LODWORD(v77) = objc_msgSend(v16, "intValue");
        -[NSMutableData appendType:length:value:](v3, 3, 4u, (uint64_t)&v77);
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    }
    while (v13);
  }

  v77 = -[NSNumber unsignedLongLongValue](self->_serviceID, "unsignedLongLongValue");
  -[NSMutableData appendType:length:value:](v3, 4, 8u, (uint64_t)&v77);
  -[NSNumber doubleValue](self->_fallbackTimeout, "doubleValue");
  v76 = v17;
  -[NSMutableData appendType:length:value:](v3, 5, 8u, (uint64_t)&v76);
  v75 = -[NSNumber unsignedIntValue](self->_fallbackBufferLimit, "unsignedIntValue");
  -[NSMutableData appendType:length:value:](v3, 6, 4u, (uint64_t)&v75);
  v74 = -[NSNumber unsignedIntValue](self->_fallbackCountBeforeImmediateFallback, "unsignedIntValue");
  -[NSMutableData appendType:length:value:](v3, 7, 4u, (uint64_t)&v74);
  v18 = -[NSString UTF8String](self->_proxyEvaluationPath, "UTF8String");
  if (v18)
  {
    v19 = (uint64_t)v18;
    v20 = strlen(v18);
    -[NSMutableData appendType:length:value:](v3, 8, v20, v19);
  }
  v21 = -[NSString UTF8String](self->_label, "UTF8String");
  if (v21)
  {
    v22 = (uint64_t)v21;
    v23 = strlen(v21);
    -[NSMutableData appendType:length:value:](v3, 17, v23, v22);
  }
  -[NSNumber doubleValue](self->_connectionTimeout, "doubleValue");
  v73 = v24;
  -[NSMutableData appendType:length:value:](v3, 12, 8u, (uint64_t)&v73);
  -[NSNumber doubleValue](self->_connectionIdleTimeout, "doubleValue");
  v72 = v25;
  -[NSMutableData appendType:length:value:](v3, 13, 8u, (uint64_t)&v72);
  -[NSNumber doubleValue](self->_telemetryRatio, "doubleValue");
  v71 = v26;
  -[NSMutableData appendType:length:value:](v3, 16, 8u, (uint64_t)&v71);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v68 != v30)
          objc_enumerationMutation(v27);
        v32 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j)), "UTF8String");
        v33 = strlen(v32);
        -[NSMutableData appendType:length:value:](v3, 10, v33, (uint64_t)v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
    }
    while (v29);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[NEAppRule matchDomains](self, "matchDomains");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v84, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v64 != v37)
          objc_enumerationMutation(v34);
        v39 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k)), "UTF8String");
        v40 = strlen(v39);
        -[NSMutableData appendType:length:value:](v3, 18, v40, (uint64_t)v39);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v63, v84, 16);
    }
    while (v36);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v41 = self->_matchEffectiveApplications;
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v59, v83, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(v41);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * m), "copyTLVData");
        v47 = objc_msgSend(v46, "length");
        v48 = objc_retainAutorelease(v46);
        -[NSMutableData appendType:length:value:](v3, 19, v47, objc_msgSend(v48, "bytes"));

      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v59, v83, 16);
    }
    while (v43);
  }

  edgeSetIdentifier = self->_edgeSetIdentifier;
  if (edgeSetIdentifier)
  {
    v50 = -[NSString UTF8String](edgeSetIdentifier, "UTF8String");
    v51 = strlen(v50);
    -[NSMutableData appendType:length:value:](v3, 20, v51, (uint64_t)v50);
  }
  initialWindowSize = self->_initialWindowSize;
  if (initialWindowSize)
  {
    v58 = -[NSNumber unsignedIntegerValue](initialWindowSize, "unsignedIntegerValue");
    -[NSMutableData appendType:length:value:](v3, 22, 8u, (uint64_t)&v58);
  }
  -[NSPAppRule updateHash](self, "updateHash");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[NSPAppRule updateHash](self, "updateHash");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "length");
    -[NSPAppRule updateHash](self, "updateHash");
    v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[NSMutableData appendType:length:value:](v3, 23, v55, objc_msgSend(v56, "bytes"));

  }
  return v3;
}

- (void)merge:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL *v10;
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
  BOOL *v46;

  v46 = (BOOL *)a3;
  objc_msgSend(v46, "matchAccountIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v46, "matchAccountIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppRule setMatchAccountIdentifiers:](self, "setMatchAccountIdentifiers:", v5);

  }
  objc_msgSend(v46, "matchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v46, "matchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppRule setMatchDomains:](self, "setMatchDomains:", v7);

  }
  objc_msgSend(v46, "matchPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v46, "matchPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppRule setMatchPath:](self, "setMatchPath:", v9);

  }
  v10 = v46;
  v11 = (void *)*((_QWORD *)v46 + 10);
  if (v11)
  {
    objc_storeStrong((id *)&self->_disableFallback, v11);
    v10 = v46;
  }
  v12 = (void *)*((_QWORD *)v10 + 11);
  if (v12)
  {
    objc_storeStrong((id *)&self->_enableDirectMultipath, v12);
    v10 = v46;
  }
  v13 = (void *)*((_QWORD *)v10 + 12);
  if (v13)
  {
    objc_storeStrong((id *)&self->_enableDirectTFO, v13);
    v10 = v46;
  }
  v14 = (void *)*((_QWORD *)v10 + 13);
  if (v14)
  {
    objc_storeStrong((id *)&self->_enableDirectExtendedValidation, v14);
    v10 = v46;
  }
  v15 = (void *)*((_QWORD *)v10 + 14);
  if (v15)
  {
    objc_storeStrong((id *)&self->_directTLSPorts, v15);
    v10 = v46;
  }
  v16 = (void *)*((_QWORD *)v10 + 15);
  if (v16)
  {
    objc_storeStrong((id *)&self->_divertDNSOnly, v16);
    v10 = v46;
  }
  v17 = (void *)*((_QWORD *)v10 + 16);
  if (v17)
  {
    objc_storeStrong((id *)&self->_noDNSDelegation, v17);
    v10 = v46;
  }
  v18 = (void *)*((_QWORD *)v10 + 17);
  if (v18)
  {
    objc_storeStrong((id *)&self->_serviceID, v18);
    v10 = v46;
  }
  v19 = (void *)*((_QWORD *)v10 + 18);
  if (v19)
  {
    objc_storeStrong((id *)&self->_enabled, v19);
    v10 = v46;
  }
  v20 = (void *)*((_QWORD *)v10 + 19);
  if (v20)
  {
    objc_storeStrong((id *)&self->_fallbackTimeout, v20);
    v10 = v46;
  }
  v21 = (void *)*((_QWORD *)v10 + 20);
  if (v21)
  {
    objc_storeStrong((id *)&self->_fallbackBufferLimit, v21);
    v10 = v46;
  }
  v22 = (void *)*((_QWORD *)v10 + 21);
  if (v22)
  {
    objc_storeStrong((id *)&self->_fallbackCountBeforeImmediateFallback, v22);
    v10 = v46;
  }
  v23 = (void *)*((_QWORD *)v10 + 22);
  if (v23)
  {
    objc_storeStrong((id *)&self->_proxyEvaluationPath, v23);
    v10 = v46;
  }
  v24 = (void *)*((_QWORD *)v10 + 23);
  if (v24)
  {
    objc_storeStrong((id *)&self->_useCustomProtocol, v24);
    v10 = v46;
  }
  v25 = (void *)*((_QWORD *)v10 + 24);
  if (v25)
  {
    objc_storeStrong((id *)&self->_useLocalFlowDivert, v25);
    v10 = v46;
  }
  v26 = (void *)*((_QWORD *)v10 + 25);
  if (v26)
  {
    objc_storeStrong((id *)&self->_enableDirectRace, v26);
    v10 = v46;
  }
  v27 = (void *)*((_QWORD *)v10 + 38);
  if (v27)
  {
    objc_storeStrong((id *)&self->_shouldComposeInitialData, v27);
    v10 = v46;
  }
  v28 = (void *)*((_QWORD *)v10 + 26);
  if (v28)
  {
    objc_storeStrong((id *)&self->_label, v28);
    v10 = v46;
  }
  v29 = (void *)*((_QWORD *)v10 + 27);
  if (v29)
  {
    objc_storeStrong((id *)&self->_edgeSetIdentifier, v29);
    v10 = v46;
  }
  v30 = (void *)*((_QWORD *)v10 + 28);
  if (v30)
  {
    objc_storeStrong((id *)&self->_connectionTimeout, v30);
    v10 = v46;
  }
  v31 = (void *)*((_QWORD *)v10 + 29);
  if (v31)
  {
    objc_storeStrong((id *)&self->_connectionIdleTimeout, v31);
    v10 = v46;
  }
  v32 = (void *)*((_QWORD *)v10 + 30);
  if (v32)
  {
    objc_storeStrong((id *)&self->_enableMultipath, v32);
    v10 = v46;
  }
  v33 = (void *)*((_QWORD *)v10 + 31);
  if (v33)
  {
    objc_storeStrong((id *)&self->_enableTFO, v33);
    v10 = v46;
  }
  v34 = (void *)*((_QWORD *)v10 + 32);
  if (v34)
  {
    objc_storeStrong((id *)&self->_requireTFO, v34);
    v10 = v46;
  }
  v35 = (void *)*((_QWORD *)v10 + 33);
  if (v35)
  {
    objc_storeStrong((id *)&self->_enableNoTFOCookie, v35);
    v10 = v46;
  }
  v36 = (void *)*((_QWORD *)v10 + 34);
  if (v36)
  {
    objc_storeStrong((id *)&self->_enableUDPRace, v36);
    v10 = v46;
  }
  v37 = (void *)*((_QWORD *)v10 + 35);
  if (v37)
  {
    objc_storeStrong((id *)&self->_enableRatio, v37);
    v10 = v46;
  }
  v38 = (void *)*((_QWORD *)v10 + 36);
  if (v38)
  {
    objc_storeStrong((id *)&self->_reenableInterval, v38);
    v10 = v46;
  }
  v39 = (void *)*((_QWORD *)v10 + 37);
  if (v39)
  {
    objc_storeStrong((id *)&self->_telemetryRatio, v39);
    v10 = v46;
  }
  v40 = (void *)*((_QWORD *)v10 + 40);
  if (v40)
  {
    objc_storeStrong((id *)&self->_matchEffectiveApplications, v40);
    v10 = v46;
  }
  v41 = (void *)*((_QWORD *)v10 + 46);
  if (v41)
  {
    objc_storeStrong((id *)&self->_configurationIdentifier, v41);
    v10 = v46;
  }
  v42 = (void *)*((_QWORD *)v10 + 39);
  if (v42)
  {
    objc_storeStrong((id *)&self->_enableOptInPerTask, v42);
    v10 = v46;
  }
  v43 = (void *)*((_QWORD *)v10 + 41);
  if (v43)
  {
    objc_storeStrong((id *)&self->_locationBundlePath, v43);
    v10 = v46;
  }
  v44 = (void *)*((_QWORD *)v10 + 42);
  if (v44)
  {
    objc_storeStrong((id *)&self->_initialWindowSize, v44);
    v10 = v46;
  }
  v45 = (void *)*((_QWORD *)v10 + 48);
  if (v45)
  {
    objc_storeStrong((id *)&self->_updateHash, v45);
    v10 = v46;
  }
  objc_storeStrong((id *)&self->_enableCheckDate, *((id *)v10 + 47));
  self->_disabledByRatio = v46[72];

}

- (BOOL)updateNetworkAgent
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  NSUUID *v7;
  NSUUID *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NWNetworkAgentRegistration *agentRegistration;
  NSUUID *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSUUID *configurationIdentifier;
  NSUUID *v30;
  NSUUID *v31;
  NSUUID *v32;
  _QWORD v33[5];
  _QWORD v34[6];
  uint8_t v35[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  NSUUID *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[NWNetworkAgentRegistration isRegistered](self->_agentRegistration, "isRegistered"))
  {
    *(_QWORD *)v35 = 0;
    v36 = v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__1;
    v39 = __Block_byref_object_dispose__1;
    v40 = 0;
    if (self->_configurationIdentifier)
    {
      nplog_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        configurationIdentifier = self->_configurationIdentifier;
        *(_DWORD *)buf = 138412290;
        v42 = configurationIdentifier;
        _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "Looking for existing config agent registration with configuration ID %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __32__NSPAppRule_updateNetworkAgent__block_invoke;
      v34[3] = &unk_1E4137E20;
      v34[4] = self;
      v34[5] = v35;
      objc_msgSend(v6, "iterateFileHandlesWithBlock:", v34);

    }
    else
    {
      v7 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
      v8 = self->_configurationIdentifier;
      self->_configurationIdentifier = v7;

      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v31 = self->_configurationIdentifier;
        *(_DWORD *)buf = 138412290;
        v42 = v31;
        _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, "Creating a new config agent configuration identifier: %@", buf, 0xCu);
      }

    }
    v10 = *((_QWORD *)v36 + 5);
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "Re-using existing network agent registration file handle", buf, 2u);
      }

      objc_msgSend(*((id *)v36 + 5), "handle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = dup(objc_msgSend(v13, "fileDescriptor"));

      objc_msgSend(*((id *)v36 + 5), "agentUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPNetworkAgent setAgentUUID:](self->_agent, "setAgentUUID:", v15);

      nplog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[NSPNetworkAgent agentUUID](self->_agent, "agentUUID");
        v30 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v30;
        _os_log_debug_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_DEBUG, "Set config agent UUID: %@", buf, 0xCu);

      }
      if ((-[NWNetworkAgentRegistration setRegisteredNetworkAgent:fileDescriptor:](self->_agentRegistration, "setRegisteredNetworkAgent:fileDescriptor:", self->_agent, v14) & 1) == 0)
      {
        close(v14);
LABEL_29:
        v4 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "Setting up new network agent registration", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPNetworkAgent setAgentUUID:](self->_agent, "setAgentUUID:", v17);

      nplog_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[NSPNetworkAgent agentUUID](self->_agent, "agentUUID");
        v32 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v32;
        _os_log_debug_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_DEBUG, "Created a new config agent UUID: %@", buf, 0xCu);

      }
      -[NWNetworkAgentRegistration registerNetworkAgent:](self->_agentRegistration, "registerNetworkAgent:", self->_agent);
      if ((-[NWNetworkAgentRegistration isRegistered](self->_agentRegistration, "isRegistered") & 1) == 0)
      {
        nplog_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v27, OS_LOG_TYPE_ERROR, "Failed to register configuration network agent", buf, 2u);
        }

        goto LABEL_29;
      }
      v19 = objc_alloc(MEMORY[0x1E0CD0820]);
      agentRegistration = self->_agentRegistration;
      v21 = self->_configurationIdentifier;
      -[NSPNetworkAgent agentUUID](self->_agent, "agentUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:", agentRegistration, &unk_1E4151570, v21, v22);
      v24 = (void *)*((_QWORD *)v36 + 5);
      *((_QWORD *)v36 + 5) = v23;

      objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *((_QWORD *)v36 + 5);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __32__NSPAppRule_updateNetworkAgent__block_invoke_159;
      v33[3] = &unk_1E4137E48;
      v33[4] = self;
      objc_msgSend(v25, "setFileHandle:matchingPredicate:", v26, v33);

    }
    v4 = 1;
LABEL_30:
    _Block_object_dispose(v35, 8);

    return v4;
  }
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v35 = 0;
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "Updating existing configuration agent", v35, 2u);
  }

  return -[NWNetworkAgentRegistration updateNetworkAgent:](self->_agentRegistration, "updateNetworkAgent:", self->_agent);
}

uint64_t __32__NSPAppRule_updateNetworkAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v3, "sessionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", &unk_1E4151570);
  if (v5)
  {
    objc_msgSend(v3, "configurationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));

    if (v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = v3;
      v4 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
      goto LABEL_5;
    }
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
LABEL_5:
  v10 = v5 ^ 1u;

LABEL_7:
  return v10;
}

uint64_t __32__NSPAppRule_updateNetworkAgent__block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1E4151570))
    {
      objc_msgSend(v3, "configurationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)teardownNetworkAgent
{
  NWNetworkAgentRegistration *agentRegistration;
  void *v4;
  NSPNetworkAgent *agent;
  NWNetworkAgentRegistration *v6;
  _QWORD v7[5];

  agentRegistration = self->_agentRegistration;
  if (agentRegistration)
  {
    -[NWNetworkAgentRegistration unregisterNetworkAgent](agentRegistration, "unregisterNetworkAgent");
    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__NSPAppRule_teardownNetworkAgent__block_invoke;
    v7[3] = &unk_1E4137E48;
    v7[4] = self;
    objc_msgSend(v4, "removeFileHandleMatchingPredicate:", v7);

    agent = self->_agent;
    self->_agent = 0;

    v6 = self->_agentRegistration;
    self->_agentRegistration = 0;

  }
}

uint64_t __34__NSPAppRule_teardownNetworkAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1E4151570))
    {
      objc_msgSend(v3, "configurationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368));

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSNumber)disableFallback
{
  return self->_disableFallback;
}

- (void)setDisableFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)enableDirectMultipath
{
  return self->_enableDirectMultipath;
}

- (void)setEnableDirectMultipath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)enableDirectTFO
{
  return self->_enableDirectTFO;
}

- (void)setEnableDirectTFO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)enableDirectExtendedValidation
{
  return self->_enableDirectExtendedValidation;
}

- (void)setEnableDirectExtendedValidation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)directTLSPorts
{
  return self->_directTLSPorts;
}

- (void)setDirectTLSPorts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)divertDNSOnly
{
  return self->_divertDNSOnly;
}

- (void)setDivertDNSOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)noDNSDelegation
{
  return self->_noDNSDelegation;
}

- (void)setNoDNSDelegation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)fallbackTimeout
{
  return self->_fallbackTimeout;
}

- (void)setFallbackTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)fallbackBufferLimit
{
  return self->_fallbackBufferLimit;
}

- (void)setFallbackBufferLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)fallbackCountBeforeImmediateFallback
{
  return self->_fallbackCountBeforeImmediateFallback;
}

- (void)setFallbackCountBeforeImmediateFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)proxyEvaluationPath
{
  return self->_proxyEvaluationPath;
}

- (void)setProxyEvaluationPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)useCustomProtocol
{
  return self->_useCustomProtocol;
}

- (void)setUseCustomProtocol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)useLocalFlowDivert
{
  return self->_useLocalFlowDivert;
}

- (void)setUseLocalFlowDivert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)enableDirectRace
{
  return self->_enableDirectRace;
}

- (void)setEnableDirectRace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)edgeSetIdentifier
{
  return self->_edgeSetIdentifier;
}

- (void)setEdgeSetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)connectionIdleTimeout
{
  return self->_connectionIdleTimeout;
}

- (void)setConnectionIdleTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)enableMultipath
{
  return self->_enableMultipath;
}

- (void)setEnableMultipath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)enableTFO
{
  return self->_enableTFO;
}

- (void)setEnableTFO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)requireTFO
{
  return self->_requireTFO;
}

- (void)setRequireTFO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)enableNoTFOCookie
{
  return self->_enableNoTFOCookie;
}

- (void)setEnableNoTFOCookie:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)enableUDPRace
{
  return self->_enableUDPRace;
}

- (void)setEnableUDPRace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)enableRatio
{
  return self->_enableRatio;
}

- (void)setEnableRatio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSNumber)reenableInterval
{
  return self->_reenableInterval;
}

- (void)setReenableInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)telemetryRatio
{
  return self->_telemetryRatio;
}

- (void)setTelemetryRatio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)shouldComposeInitialData
{
  return self->_shouldComposeInitialData;
}

- (void)setShouldComposeInitialData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)enableOptInPerTask
{
  return self->_enableOptInPerTask;
}

- (void)setEnableOptInPerTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSArray)matchEffectiveApplications
{
  return self->_matchEffectiveApplications;
}

- (void)setMatchEffectiveApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)locationBundlePath
{
  return self->_locationBundlePath;
}

- (void)setLocationBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSNumber)initialWindowSize
{
  return self->_initialWindowSize;
}

- (void)setInitialWindowSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSPAppRule)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (NSPNetworkAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
  objc_storeStrong((id *)&self->_agent, a3);
}

- (NWNetworkAgentRegistration)agentRegistration
{
  return self->_agentRegistration;
}

- (void)setAgentRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_agentRegistration, a3);
}

- (NSUUID)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (void)setConfigurationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_configurationIdentifier, a3);
}

- (NSDate)enableCheckDate
{
  return self->_enableCheckDate;
}

- (void)setEnableCheckDate:(id)a3
{
  objc_storeStrong((id *)&self->_enableCheckDate, a3);
}

- (BOOL)disabledByRatio
{
  return self->_disabledByRatio;
}

- (void)setDisabledByRatio:(BOOL)a3
{
  self->_disabledByRatio = a3;
}

- (NSData)updateHash
{
  return self->_updateHash;
}

- (void)setUpdateHash:(id)a3
{
  objc_storeStrong((id *)&self->_updateHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHash, 0);
  objc_storeStrong((id *)&self->_enableCheckDate, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_agentRegistration, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_initialWindowSize, 0);
  objc_storeStrong((id *)&self->_locationBundlePath, 0);
  objc_storeStrong((id *)&self->_matchEffectiveApplications, 0);
  objc_storeStrong((id *)&self->_enableOptInPerTask, 0);
  objc_storeStrong((id *)&self->_shouldComposeInitialData, 0);
  objc_storeStrong((id *)&self->_telemetryRatio, 0);
  objc_storeStrong((id *)&self->_reenableInterval, 0);
  objc_storeStrong((id *)&self->_enableRatio, 0);
  objc_storeStrong((id *)&self->_enableUDPRace, 0);
  objc_storeStrong((id *)&self->_enableNoTFOCookie, 0);
  objc_storeStrong((id *)&self->_requireTFO, 0);
  objc_storeStrong((id *)&self->_enableTFO, 0);
  objc_storeStrong((id *)&self->_enableMultipath, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimeout, 0);
  objc_storeStrong((id *)&self->_connectionTimeout, 0);
  objc_storeStrong((id *)&self->_edgeSetIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_enableDirectRace, 0);
  objc_storeStrong((id *)&self->_useLocalFlowDivert, 0);
  objc_storeStrong((id *)&self->_useCustomProtocol, 0);
  objc_storeStrong((id *)&self->_proxyEvaluationPath, 0);
  objc_storeStrong((id *)&self->_fallbackCountBeforeImmediateFallback, 0);
  objc_storeStrong((id *)&self->_fallbackBufferLimit, 0);
  objc_storeStrong((id *)&self->_fallbackTimeout, 0);
  objc_storeStrong((id *)&self->_enabled, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_noDNSDelegation, 0);
  objc_storeStrong((id *)&self->_divertDNSOnly, 0);
  objc_storeStrong((id *)&self->_directTLSPorts, 0);
  objc_storeStrong((id *)&self->_enableDirectExtendedValidation, 0);
  objc_storeStrong((id *)&self->_enableDirectTFO, 0);
  objc_storeStrong((id *)&self->_enableDirectMultipath, 0);
  objc_storeStrong((id *)&self->_disableFallback, 0);
}

@end

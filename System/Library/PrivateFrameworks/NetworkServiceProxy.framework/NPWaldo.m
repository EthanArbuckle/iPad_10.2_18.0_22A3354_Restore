@implementation NPWaldo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPWaldo)init
{
  NPWaldo *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *reprocessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPWaldo;
  v2 = -[NPWaldo init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Waldo reprocess queue", 0);
    reprocessQueue = v2->_reprocessQueue;
    v2->_reprocessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (NPWaldo)initWithIdentifier:(id)a3 timestamp:(id)a4 fromDictionary:(id)a5 source:(int64_t)a6
{
  id v11;
  id v12;
  NPWaldo *v13;
  void *v14;
  char isKindOfClass;
  uint64_t v16;
  NSNumber *version;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NPWaldo *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSURL *telemetryURL;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  unint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  int v102;
  NSObject *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  const char *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  double v114;
  double v115;
  double v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  NPTuscanyEdge *v120;
  NSObject *v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  NSData *updateHash;
  NSObject *v126;
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
  char v140;
  NPLocation *v141;
  uint64_t v142;
  NSObject *v143;
  void *v144;
  void *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  NSObject *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  void *v159;
  void *v160;
  id v161;
  id v162;
  void *obj;
  uint64_t obja;
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint8_t buf[4];
  id v175;
  __int16 v176;
  NSObject *v177;
  __int16 v178;
  NSObject *v179;
  _BYTE v180[128];
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v165 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[NPWaldo init](self, "init");

  if (!v13)
  {
    v25 = 0;
    goto LABEL_211;
  }
  v157 = v11;
  objc_storeStrong((id *)&v13->_identifier, a3);
  objc_storeStrong((id *)&v13->_timestamp, a4);
  v13->_source = a6;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("version"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("version"));
    v16 = objc_claimAutoreleasedReturnValue();
    version = v13->_version;
    v13->_version = (NSNumber *)v16;

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("nsp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v158 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_139;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("pki"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v159 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v18;
    -[NSDictionary objectForPlatformSpecificKey:](v19, CFSTR("session"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_dayPassEnableSessionTicket, v21);
    -[NSDictionary objectForPlatformSpecificKey:](v19, CFSTR("ev"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_dayPassExtendedValidation, v22);
    -[NSDictionary objectForPlatformSpecificKey:](v159, CFSTR("host"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length"))
        objc_storeStrong((id *)&v13->_dayPassHostname, v24);
    }
    else
    {
      v24 = v23;
    }
    -[NSDictionary objectForPlatformSpecificKey:](v159, CFSTR("host-prepend-label"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_dayPassHostnamePrependLabel, v26);
    if (a6 != 1)
    {
      -[NSDictionary objectForPlatformSpecificKey:](v159, CFSTR("leafOID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v28, "length"))
          objc_storeStrong((id *)&v13->_dayPassLeafOID, v28);
      }
      else
      {
        v28 = v27;
      }
      -[NSDictionary objectForPlatformSpecificKey:](v159, CFSTR("revocationFailClosed"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v13->_dayPassRevocationFailClosed, v29);

    }
    v18 = v20;
    v19 = v159;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("daypass"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForPlatformSpecificKey:](v30, CFSTR("retry"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v31, "doubleValue");
      if (v32 > 0.0)
        objc_storeStrong((id *)&v13->_retryPause, v31);
    }
    -[NSDictionary objectForPlatformSpecificKey:](v30, CFSTR("expiry"));
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_47;
    objc_opt_class();
    v151 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject count](v33, "count"))
    {
      v149 = v31;
      v154 = v18;
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v170 = 0u;
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v35 = v33;
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v170, v181, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v171;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v171 != v38)
              objc_enumerationMutation(v35);
            v40 = *(NSObject **)(*((_QWORD *)&v170 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject integerValue](v40, "integerValue") > 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 60 * -[NSObject unsignedIntegerValue](v40, "unsignedIntegerValue"));
              v41 = objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v34, "addObject:", v41);
            }
            else
            {
              nplog_obj();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v175 = v165;
                v176 = 2112;
                v177 = v40;
                _os_log_error_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_ERROR, "%@: Invalid expiry minutes: %@", buf, 0x16u);
              }
            }

          }
          v37 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v170, v181, 16);
        }
        while (v37);
      }

      v42 = -[NSObject count](v34, "count");
      if (v42 == -[NSObject count](v35, "count"))
      {
        objc_storeStrong((id *)&v13->_dayPassSoftExpiry, v34);

        v33 = v151;
        v18 = v154;
        v31 = v149;
LABEL_47:
        -[NSDictionary objectForPlatformSpecificKey:](v30, CFSTR("request-timeout"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v43, "doubleValue");
          if (v44 > 0.0)
            objc_storeStrong((id *)&v13->_dayPassRequestTimeout, v43);
        }

        v19 = v159;
        goto LABEL_51;
      }
      v11 = v157;
      v12 = v158;
      v18 = v154;
      v31 = v149;
    }
    else
    {
      nplog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v175 = v165;
        v176 = 2112;
        v177 = v33;
        _os_log_error_impl(&dword_19E8FE000, v34, OS_LOG_TYPE_ERROR, "%@: Invalid expiry: %@", buf, 0x16u);
      }
      v11 = v157;
      v12 = v158;
    }

    v25 = 0;
    v50 = v159;
    goto LABEL_210;
  }
LABEL_51:
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("telemetry"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v30;
    v47 = v18;
    -[NSDictionary objectForPlatformSpecificKey:](v45, CFSTR("service"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v49, "length"))
        objc_storeStrong((id *)&v13->_telemetryService, v49);
    }
    else
    {
      v49 = v48;
    }
    -[NSDictionary objectForPlatformSpecificKey:](v45, CFSTR("url"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v52, "length"))
      {
        v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v52);
        telemetryURL = v13->_telemetryURL;
        v13->_telemetryURL = (NSURL *)v53;

      }
    }
    else
    {
      v52 = v51;
    }
    -[NSDictionary objectForPlatformSpecificKey:](v45, CFSTR("tag"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v56, "length"))
        objc_storeStrong((id *)&v13->_tag, v56);
    }
    else
    {
      v56 = v55;
    }

    v18 = v47;
    v19 = v159;
    v30 = v46;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("constraint"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LatencyDerivationEnabled"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_enableLatencyDerivation, v58);
    v150 = v58;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("useGeoFromServer"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_useGeohashFromServer, v59);
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("EdgeFairnessFactor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v60, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_edgeFairnessFactor, v60);
    v147 = v60;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LatencyFactorX"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v61, "doubleValue");
      if (v62 > 0.0)
        objc_storeStrong((id *)&v13->_latencyFactorX, v61);
    }
    v144 = v61;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LatencyFactorA"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v63, "doubleValue");
      if (v64 > 1.0)
        objc_storeStrong((id *)&v13->_latencyFactorA, v63);
    }
    v148 = v59;
    v139 = v63;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LatencyFactorB"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v65, "doubleValue");
      if (v66 > 1.0)
        objc_storeStrong((id *)&v13->_latencyFactorB, v65);
    }
    v138 = v65;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LocationCheckInterval"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v67, "doubleValue");
      if (v68 >= 0.0)
        objc_storeStrong((id *)&v13->_locationCheckInterval, v67);
    }
    v137 = v67;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LocationToleranceDistance"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v69, "integerValue") & 0x8000000000000000) == 0)
      objc_storeStrong((id *)&v13->_locationToleranceDistance, v69);
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("LocationTTL"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v70, "doubleValue");
      if (v71 >= 0.0)
        objc_storeStrong((id *)&v13->_locationTTL, v70);
    }
    v135 = v70;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ProbePause"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v72, "doubleValue");
      if (v73 >= 0.0)
        objc_storeStrong((id *)&v13->_probePause, v72);
    }
    v134 = v72;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ProbeTFO"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    obj = v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_probeTFO, v74);
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ProbeNoTFOCookie"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_probeNoTFOCookie, v75);
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ProbeTimeout"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v76, "doubleValue");
      if (v77 >= 0.0)
        objc_storeStrong((id *)&v13->_probeTimeout, v76);
    }
    v132 = v76;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ViewCount"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v78, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_viewSize, v78);
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ConnectionIdleTimeoutMaximum"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v79, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_connectionIdleTimeoutMaximum, v79);
    v130 = v79;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("NetworkSignatureLimit"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v80, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_signatureLimit, v80);
    v155 = v18;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ObservedRTTSampleSize"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v81, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_observedRTTSampleSize, v81);
    v128 = v81;
    v136 = v69;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ReprocessSamplingInterval"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v82, "doubleValue");
      if (v83 > 0.0)
        objc_storeStrong((id *)&v13->_reprocessSamplingInterval, v82);
    }
    v131 = v78;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("ReprocessSampleSize"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v84, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_reprocessSampleSize, v84);
    v161 = v30;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("EdgeSelectionEnabled"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_edgeSelectionEnabled, v85);
    v129 = v80;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("EdgeSelectionAlpha"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v86, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_edgeSelectionAlpha, v86);
    v133 = v75;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("EdgeSelectionWindowSize"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v87, "integerValue") >= 1)
      objc_storeStrong((id *)&v13->_edgeSelectionWindowSize, v87);
    v152 = v45;
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("EnableIPv6"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v13->_enableIPv6, v88);
    -[NSDictionary objectForPlatformSpecificKey:](v57, CFSTR("TFOLeeway"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v89, "doubleValue");
      if (v90 >= 0.0)
      {
        objc_msgSend(v89, "doubleValue");
        if (v91 <= 1.0)
          objc_storeStrong((id *)&v13->_TFOLeeway, v89);
      }
    }

    v45 = v152;
    v18 = v155;
    v19 = v159;
    v30 = v161;
  }

  v12 = v158;
LABEL_139:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("where"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v92 = 0x1E4135000;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_205;
  v156 = v18;
  v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v50, "count"));
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v162 = v50;
  v94 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v166, v180, 16);
  if (!v94)
    goto LABEL_202;
  v95 = v94;
  obja = *(_QWORD *)v167;
  v160 = v50;
  v153 = v93;
  do
  {
    v96 = 0;
    do
    {
      if (*(_QWORD *)v167 != obja)
        objc_enumerationMutation(v162);
      v97 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v96);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        nplog_obj();
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v165;
          _os_log_error_impl(&dword_19E8FE000, v126, OS_LOG_TYPE_ERROR, "%@: Edge specification is not a dictionary", buf, 0xCu);
        }

LABEL_209:
        v50 = v162;

        v25 = 0;
        v11 = v157;
        v12 = v158;
        v18 = v156;
        goto LABEL_210;
      }
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("label"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        nplog_obj();
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v165;
          _os_log_error_impl(&dword_19E8FE000, v103, OS_LOG_TYPE_ERROR, "%@: Label is not a string", buf, 0xCu);
        }
        v101 = 0;
        v104 = 0;
        v102 = 1;
        v99 = v98;
        goto LABEL_168;
      }
      +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("probe"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      if (v100)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          nplog_obj();
          v103 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v175 = v165;
            _os_log_error_impl(&dword_19E8FE000, v103, OS_LOG_TYPE_ERROR, "%@: Probe hosts is not an array", buf, 0xCu);
          }
          v101 = 0;
          v102 = 1;
          v104 = v100;
          goto LABEL_168;
        }
      }
      if (objc_msgSend(v100, "count"))
      {
        +[NPWaldo createEndpointFromHostList:defaultPortString:allowIPv6:](NPWaldo, "createEndpointFromHostList:defaultPortString:allowIPv6:", v100, CFSTR("5223"), -[NSNumber BOOLValue](v13->_enableIPv6, "BOOLValue"));
        v101 = objc_claimAutoreleasedReturnValue();
        if (!v101)
        {
          v102 = 1;
          goto LABEL_170;
        }
      }
      else
      {
        v101 = 0;
      }
      objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("hosts"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v104, "count"))
      {
        nplog_obj();
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v175 = v165;
          _os_log_error_impl(&dword_19E8FE000, v103, OS_LOG_TYPE_ERROR, "%@: Edge onramp list is not a non-empty array", buf, 0xCu);
        }
        goto LABEL_167;
      }
      +[NPWaldo createEndpointFromHostList:defaultPortString:allowIPv6:](NPWaldo, "createEndpointFromHostList:defaultPortString:allowIPv6:", v104, CFSTR("443"), -[NSNumber BOOLValue](v13->_enableIPv6, "BOOLValue"));
      v105 = objc_claimAutoreleasedReturnValue();
      if (!v105)
      {
        v102 = 1;
        goto LABEL_169;
      }
      v103 = v105;
      v106 = objc_opt_class();
      if (v106 == objc_opt_class())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
LABEL_181:
          objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("where"));
          v111 = objc_claimAutoreleasedReturnValue();
          if (v111)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject count](v111, "count") == 2)
            {
              -[NSObject objectAtIndexedSubscript:](v111, "objectAtIndexedSubscript:", 0);
              v112 = objc_claimAutoreleasedReturnValue();
              v146 = v111;
              -[NSObject objectAtIndexedSubscript:](v111, "objectAtIndexedSubscript:", 1);
              v113 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v141 = [NPLocation alloc];
                  -[NSObject doubleValue](v112, "doubleValue");
                  v115 = v114;
                  -[NSObject doubleValue](v113, "doubleValue");
                  v142 = -[NPLocation initWithLatitude:longtitude:timestamp:](v141, "initWithLatitude:longtitude:timestamp:", 0, v115, v116);

                  v117 = v142;
                  goto LABEL_191;
                }
              }
              v143 = v112;
              v121 = v113;
              nplog_obj();
              v122 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v175 = v165;
                v176 = 2112;
                v177 = v143;
                v178 = 2112;
                v179 = v121;
                _os_log_error_impl(&dword_19E8FE000, v122, OS_LOG_TYPE_ERROR, "%@: Invalid edge latitude %@, longtitude %@", buf, 0x20u);
              }

              v119 = v143;
              v102 = 1;
LABEL_195:
              v111 = v146;
            }
            else
            {
              nplog_obj();
              v118 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v175 = v165;
                v176 = 2112;
                v177 = v111;
                _os_log_error_impl(&dword_19E8FE000, v118, OS_LOG_TYPE_ERROR, "%@: Missing edge latitude / longtitude: %@", buf, 0x16u);
              }
              v119 = v118;
              v102 = 1;
            }

            goto LABEL_168;
          }
          v146 = 0;
          v117 = 0;
LABEL_191:
          v120 = -[NPTuscanyEdge initWithLabel:index:onRampEndpoint:probeEndpoint:location:]([NPTuscanyEdge alloc], "initWithLabel:index:onRampEndpoint:probeEndpoint:location:", v99, objc_msgSend(v153, "count"), v103, v101, v117);
          -[NPTuscanyEdge setParentWaldo:](v120, "setParentWaldo:", v13);
          objc_msgSend(v153, "addObject:", v120);

          v119 = v117;
          v102 = 0;
          goto LABEL_195;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject hostname](v101, "hostname");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject hostname](v103, "hostname");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = objc_msgSend(v145, "isEqualToString:", v108);

          if ((v140 & 1) != 0)
            goto LABEL_181;
          nplog_obj();
          v107 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            goto LABEL_164;
          *(_DWORD *)buf = 138412802;
          v175 = v165;
          v176 = 2112;
          v177 = v101;
          v178 = 2112;
          v179 = v103;
          v109 = v107;
          v110 = "%@: Probe endpoint (%@) is a hostname and does not match the onramp endpoint (%@)";
        }
        else
        {
          if ((-[NSObject isEqual:](v101, "isEqual:", v103) & 1) != 0)
            goto LABEL_181;
          nplog_obj();
          v107 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            goto LABEL_164;
          *(_DWORD *)buf = 138412802;
          v175 = v165;
          v176 = 2112;
          v177 = v101;
          v178 = 2112;
          v179 = v103;
          v109 = v107;
          v110 = "%@: Probe endpoint (%@) does not equal onramp endpoint (%@)";
        }
        goto LABEL_198;
      }
      nplog_obj();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v175 = v165;
        v176 = 2112;
        v177 = v101;
        v178 = 2112;
        v179 = v103;
        v109 = v107;
        v110 = "%@: Probe endpoint (%@) and onRampEndpoint (%@) types do not match";
LABEL_198:
        _os_log_error_impl(&dword_19E8FE000, v109, OS_LOG_TYPE_ERROR, v110, buf, 0x20u);
      }
LABEL_164:

LABEL_167:
      v102 = 1;
LABEL_168:

LABEL_169:
      v100 = v104;
LABEL_170:

      if (v102)
        goto LABEL_209;
      ++v96;
    }
    while (v95 != v96);
    v123 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v166, v180, 16);
    v95 = v123;
    v50 = v160;
    v93 = v153;
    v92 = 0x1E4135000uLL;
  }
  while (v123);
LABEL_202:

  if (objc_msgSend(v93, "count"))
    objc_storeStrong((id *)&v13->_edges, v93);

  v18 = v156;
LABEL_205:
  objc_msgSend(*(id *)(v92 + 728), "getHashForObject:", v13);
  v124 = objc_claimAutoreleasedReturnValue();
  updateHash = v13->_updateHash;
  v13->_updateHash = (NSData *)v124;

  v25 = v13;
  v11 = v157;
  v12 = v158;
LABEL_210:

LABEL_211:
  return v25;
}

+ (id)createEndpointFromHostList:(id)a3 defaultPortString:(id)a4 allowIPv6:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NPTunnelTuscanyEndpoint *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NPTunnelTuscanyEndpoint *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (!v9)
  {

    v11 = 0;
    goto LABEL_24;
  }
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v27;
  obj = v8;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(obj);
      v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        nplog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v19 = "host is not a string";
        v20 = v17;
        v21 = 2;
LABEL_30:
        _os_log_error_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
        goto LABEL_36;
      }
      +[NPUtilities endpointFromString:defaultPortString:](NPUtilities, "endpointFromString:defaultPortString:", v15, v7);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        nplog_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        v19 = "Failed to create an endpoint from string: %@";
        v20 = v17;
        v21 = 12;
        goto LABEL_30;
      }
      v17 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v12)
        {
          nplog_obj();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
LABEL_40:
            _os_log_error_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_ERROR, "A hostname endpoint was specified and it is not the only endpoint", buf, 2u);
          }
          goto LABEL_35;
        }
        if (a5 || -[NSObject addressFamily](v17, "addressFamily") != 30)
        {
          if (!v11)
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v11, "addObject:", v17);
        }
        v12 = 0;
      }
      else
      {
        if (v12 || objc_msgSend(v11, "count"))
        {
          nplog_obj();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            goto LABEL_40;
          }
LABEL_35:

LABEL_36:
          v8 = obj;

          goto LABEL_37;
        }
        v12 = v17;
      }

    }
    v8 = obj;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v10)
      continue;
    break;
  }

  if (v12)
  {
    v12 = v12;
    v18 = v12;
    goto LABEL_38;
  }
LABEL_24:
  if (objc_msgSend(v11, "count"))
  {
    v18 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v11);
    v12 = 0;
  }
  else
  {
    v12 = 0;
LABEL_37:
    v18 = 0;
  }
LABEL_38:

  return v18;
}

- (void)resolveWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[3];
  char v23;

  v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__610;
  v20 = __Block_byref_object_dispose__611;
  v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__4;
  v14[4] = __Block_byref_object_dispose__4;
  v15 = (id)os_transaction_create();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__NPWaldo_resolveWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E4138320;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  v11 = v22;
  v12 = v14;
  v13 = &v16;
  v6 = (void *)MEMORY[0x1A1AEA9EC](v9);
  v7 = MEMORY[0x1A1AEA9EC]();
  v8 = (void *)v17[5];
  v17[5] = v7;

  (*(void (**)(void))(v17[5] + 16))();
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);

}

void __40__NPWaldo_resolveWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[8];

  objc_msgSend(*(id *)(a1 + 32), "edges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = *(void **)(a1 + 32);
  if (v7 != a2)
  {
    objc_msgSend(v8, "edges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__NPWaldo_resolveWithCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E41382F8;
    v13 = *(_QWORD *)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 32);
    v19[5] = v13;
    v19[6] = *(_QWORD *)(a1 + 64);
    v19[7] = a2;
    objc_msgSend(v12, "resolveWithCompletionHandler:", v19);

    return;
  }
  objc_msgSend(v8, "currentNetworkInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  if (!a3)
  {
    v10 = 28;
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "lastFallbackReason") == 28)
  {
    v10 = 0;
    v9 = v18;
LABEL_7:
    objc_msgSend(v9, "setLastFallbackReason:", v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = 0;

}

uint64_t __40__NPWaldo_resolveWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, int a3)
{
  void *v5;

  if ((a2 & 1) != 0)
  {
    if (!a3)
      return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "edges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "count");

  if (a3)
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
}

- (void)setReResolve:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "Re-resolving edge hostnames", buf, 2u);
    }

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NPWaldo edges](self, "edges", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setReResolve:", v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)reResolve
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NPWaldo edges](self, "edges", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "reResolve") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)linkLatenciesAllSignatures:(BOOL)a3
{
  NPWaldo *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NPWaldo *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v3 = self;
  v50 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v6;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v44;
    v30 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v7);
        -[NPWaldo networkInformation](v3, "networkInformation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v27 = v10;
        objc_msgSend(v10, "edgeLatencies");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v32)
        {
          v31 = *(_QWORD *)v40;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v40 != v31)
                objc_enumerationMutation(v29);
              v33 = v11;
              v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v11);
              objc_msgSend(v12, "setEdgeIndex:", 0xFFFFFFFFLL);
              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              -[NPWaldo edges](v3, "edges");
              v34 = (id)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v36;
                do
                {
                  for (i = 0; i != v14; ++i)
                  {
                    if (*(_QWORD *)v36 != v15)
                      objc_enumerationMutation(v34);
                    v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                    objc_msgSend(v17, "probeEndpoint");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v17, "probeEndpoint");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "hosts");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "probeEndpoint");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = objc_msgSend(v21, "containsObject:", v22);

                      if (v23)
                        objc_msgSend(v12, "setEdgeIndex:", objc_msgSend(v17, "index"));

                    }
                  }
                  v14 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
                }
                while (v14);
              }

              v11 = v33 + 1;
              v3 = v30;
            }
            while (v33 + 1 != v32);
            v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v32);
        }

        v7 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v26);
  }

  -[NPWaldo rebuildLatencyMapAllSignatures:](v3, "rebuildLatencyMapAllSignatures:", 1);
}

- (void)link
{
  -[NPWaldo linkAllSignatures:](self, "linkAllSignatures:", 1);
}

- (void)linkAllSignatures:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t i;
  int64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[NPWaldo linkLatenciesAllSignatures:](self, "linkLatenciesAllSignatures:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NPWaldo edges](self, "edges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = !v3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "linkWithOnRampsRetainMissingAddressFamilies:", v9);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = -[NPWaldo indexOfBestEdge](self, "indexOfBestEdge");
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    -[NPWaldo setCurrentEdgeIndex:](self, "setCurrentEdgeIndex:", v11);
}

- (NPWaldo)initWithCoder:(id)a3
{
  id v4;
  NPWaldo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSNumber *timestamp;
  uint64_t v10;
  NSString *hostname;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSNumber *retryPause;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *networkInformation;
  NSMutableDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSNumber *dayPassRequestTimeout;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *dayPassSoftExpiry;
  uint64_t v41;
  NSNumber *enableLatencyDerivation;
  uint64_t v43;
  NSNumber *latencyFactorX;
  uint64_t v45;
  NSNumber *latencyFactorA;
  uint64_t v47;
  NSNumber *latencyFactorB;
  uint64_t v49;
  NSNumber *edgeFairnessFactor;
  uint64_t v51;
  NSNumber *observedRTTSampleSize;
  uint64_t v53;
  NSNumber *signatureLimit;
  uint64_t v55;
  NSNumber *reprocessSamplingInterval;
  uint64_t v57;
  NSNumber *reprocessSampleSize;
  uint64_t v59;
  NSNumber *viewSize;
  uint64_t v61;
  NSNumber *connectionIdleTimeoutMaximum;
  uint64_t v63;
  NSNumber *locationCheckInterval;
  uint64_t v65;
  NSNumber *locationToleranceDistance;
  uint64_t v67;
  NSNumber *locationTTL;
  uint64_t v69;
  NSNumber *probePause;
  uint64_t v71;
  NSNumber *probeTFO;
  uint64_t v73;
  NSNumber *probeNoTFOCookie;
  uint64_t v75;
  NSNumber *probeTimeout;
  uint64_t v77;
  NSNumber *requireTFO;
  uint64_t v79;
  NPLocation *cachedLocation;
  uint64_t v81;
  NSDate *locationCheckTimestamp;
  uint64_t v83;
  NSString *dayPassHostname;
  uint64_t v85;
  NSNumber *dayPassHostnamePrependLabel;
  uint64_t v87;
  NSNumber *dayPassExtendedValidation;
  uint64_t v89;
  NSNumber *dayPassEnableSessionTicket;
  uint64_t v91;
  NSString *dayPassLeafOID;
  uint64_t v93;
  NSNumber *dayPassRevocationFailClosed;
  uint64_t v95;
  NSString *tag;
  uint64_t v97;
  NSURL *telemetryURL;
  uint64_t v99;
  NSString *telemetryService;
  uint64_t v101;
  NSNumber *useGeohashFromServer;
  uint64_t v103;
  NSUUID *configurationIdentifier;
  uint64_t v105;
  NSNumber *edgeSelectionEnabled;
  uint64_t v107;
  NSNumber *edgeSelectionAlpha;
  uint64_t v109;
  NSNumber *edgeSelectionWindowSize;
  uint64_t v111;
  NSNumber *enableIPv6;
  uint64_t v113;
  NSNumber *TFOLeeway;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  NSNumber *edgesGeneration;
  uint64_t v121;
  NSNumber *usedEdgesGeneration;
  uint64_t v123;
  NSData *updateHash;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NPWaldo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v8;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("waldoHostname"));
    v10 = objc_claimAutoreleasedReturnValue();
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("EdgeList"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo setEdges:](v5, "setEdges:", v15);

    v5->_currentEdgeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CurrentEdgeIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("retryPause"));
    v16 = objc_claimAutoreleasedReturnValue();
    retryPause = v5->_retryPause;
    v5->_retryPause = (NSNumber *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("NetworkInformation"));
    v23 = objc_claimAutoreleasedReturnValue();
    networkInformation = v5->_networkInformation;
    v5->_networkInformation = (NSMutableDictionary *)v23;

    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v25 = v5->_networkInformation;
    v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v127;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v127 != v28)
            objc_enumerationMutation(v25);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_networkInformation, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * v29));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            objc_msgSend(v30, "edgeSelection");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v31, "edgeSelection");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setWaldoInfo:", v5);

            }
          }

          ++v29;
        }
        while (v27 != v29);
        v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
      }
      while (v27);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request-timeout"));
    v34 = objc_claimAutoreleasedReturnValue();
    dayPassRequestTimeout = v5->_dayPassRequestTimeout;
    v5->_dayPassRequestTimeout = (NSNumber *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("DayPassExpiry"));
    v39 = objc_claimAutoreleasedReturnValue();
    dayPassSoftExpiry = v5->_dayPassSoftExpiry;
    v5->_dayPassSoftExpiry = (NSArray *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableLatencyDerivation"));
    v41 = objc_claimAutoreleasedReturnValue();
    enableLatencyDerivation = v5->_enableLatencyDerivation;
    v5->_enableLatencyDerivation = (NSNumber *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatencyFactorX"));
    v43 = objc_claimAutoreleasedReturnValue();
    latencyFactorX = v5->_latencyFactorX;
    v5->_latencyFactorX = (NSNumber *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatencyFactorA"));
    v45 = objc_claimAutoreleasedReturnValue();
    latencyFactorA = v5->_latencyFactorA;
    v5->_latencyFactorA = (NSNumber *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LatencyFactorB"));
    v47 = objc_claimAutoreleasedReturnValue();
    latencyFactorB = v5->_latencyFactorB;
    v5->_latencyFactorB = (NSNumber *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EdgeFairnessFactor"));
    v49 = objc_claimAutoreleasedReturnValue();
    edgeFairnessFactor = v5->_edgeFairnessFactor;
    v5->_edgeFairnessFactor = (NSNumber *)v49;

    v5->_generation = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Generation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObservedRTTSampleSizeKey"));
    v51 = objc_claimAutoreleasedReturnValue();
    observedRTTSampleSize = v5->_observedRTTSampleSize;
    v5->_observedRTTSampleSize = (NSNumber *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NetworkSignatureLimit"));
    v53 = objc_claimAutoreleasedReturnValue();
    signatureLimit = v5->_signatureLimit;
    v5->_signatureLimit = (NSNumber *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReprocessSamplingIntervalKey"));
    v55 = objc_claimAutoreleasedReturnValue();
    reprocessSamplingInterval = v5->_reprocessSamplingInterval;
    v5->_reprocessSamplingInterval = (NSNumber *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReprocessSampleSizeKey"));
    v57 = objc_claimAutoreleasedReturnValue();
    reprocessSampleSize = v5->_reprocessSampleSize;
    v5->_reprocessSampleSize = (NSNumber *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ViewSize"));
    v59 = objc_claimAutoreleasedReturnValue();
    viewSize = v5->_viewSize;
    v5->_viewSize = (NSNumber *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ConnectionIdleTimeoutMaximum"));
    v61 = objc_claimAutoreleasedReturnValue();
    connectionIdleTimeoutMaximum = v5->_connectionIdleTimeoutMaximum;
    v5->_connectionIdleTimeoutMaximum = (NSNumber *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationCheckInterval"));
    v63 = objc_claimAutoreleasedReturnValue();
    locationCheckInterval = v5->_locationCheckInterval;
    v5->_locationCheckInterval = (NSNumber *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationToleranceDistance"));
    v65 = objc_claimAutoreleasedReturnValue();
    locationToleranceDistance = v5->_locationToleranceDistance;
    v5->_locationToleranceDistance = (NSNumber *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationTTL"));
    v67 = objc_claimAutoreleasedReturnValue();
    locationTTL = v5->_locationTTL;
    v5->_locationTTL = (NSNumber *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbePause"));
    v69 = objc_claimAutoreleasedReturnValue();
    probePause = v5->_probePause;
    v5->_probePause = (NSNumber *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeTFO"));
    v71 = objc_claimAutoreleasedReturnValue();
    probeTFO = v5->_probeTFO;
    v5->_probeTFO = (NSNumber *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeNoTFOCookie"));
    v73 = objc_claimAutoreleasedReturnValue();
    probeNoTFOCookie = v5->_probeNoTFOCookie;
    v5->_probeNoTFOCookie = (NSNumber *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeTimeout"));
    v75 = objc_claimAutoreleasedReturnValue();
    probeTimeout = v5->_probeTimeout;
    v5->_probeTimeout = (NSNumber *)v75;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RequireTFO"));
    v77 = objc_claimAutoreleasedReturnValue();
    requireTFO = v5->_requireTFO;
    v5->_requireTFO = (NSNumber *)v77;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CachedLocation"));
    v79 = objc_claimAutoreleasedReturnValue();
    cachedLocation = v5->_cachedLocation;
    v5->_cachedLocation = (NPLocation *)v79;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationCheckTimestamp"));
    v81 = objc_claimAutoreleasedReturnValue();
    locationCheckTimestamp = v5->_locationCheckTimestamp;
    v5->_locationCheckTimestamp = (NSDate *)v81;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayPassHostname"));
    v83 = objc_claimAutoreleasedReturnValue();
    dayPassHostname = v5->_dayPassHostname;
    v5->_dayPassHostname = (NSString *)v83;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("host-prepend-label"));
    v85 = objc_claimAutoreleasedReturnValue();
    dayPassHostnamePrependLabel = v5->_dayPassHostnamePrependLabel;
    v5->_dayPassHostnamePrependLabel = (NSNumber *)v85;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DayPassEV"));
    v87 = objc_claimAutoreleasedReturnValue();
    dayPassExtendedValidation = v5->_dayPassExtendedValidation;
    v5->_dayPassExtendedValidation = (NSNumber *)v87;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session"));
    v89 = objc_claimAutoreleasedReturnValue();
    dayPassEnableSessionTicket = v5->_dayPassEnableSessionTicket;
    v5->_dayPassEnableSessionTicket = (NSNumber *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leafOID"));
    v91 = objc_claimAutoreleasedReturnValue();
    dayPassLeafOID = v5->_dayPassLeafOID;
    v5->_dayPassLeafOID = (NSString *)v91;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("revocationFailClosed"));
    v93 = objc_claimAutoreleasedReturnValue();
    dayPassRevocationFailClosed = v5->_dayPassRevocationFailClosed;
    v5->_dayPassRevocationFailClosed = (NSNumber *)v93;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Tag"));
    v95 = objc_claimAutoreleasedReturnValue();
    tag = v5->_tag;
    v5->_tag = (NSString *)v95;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TelemetryURL"));
    v97 = objc_claimAutoreleasedReturnValue();
    telemetryURL = v5->_telemetryURL;
    v5->_telemetryURL = (NSURL *)v97;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TelemetryService"));
    v99 = objc_claimAutoreleasedReturnValue();
    telemetryService = v5->_telemetryService;
    v5->_telemetryService = (NSString *)v99;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UseGeoFromServer"));
    v101 = objc_claimAutoreleasedReturnValue();
    useGeohashFromServer = v5->_useGeohashFromServer;
    v5->_useGeohashFromServer = (NSNumber *)v101;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configID"));
    v103 = objc_claimAutoreleasedReturnValue();
    configurationIdentifier = v5->_configurationIdentifier;
    v5->_configurationIdentifier = (NSUUID *)v103;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeSelectionEnabled"));
    v105 = objc_claimAutoreleasedReturnValue();
    edgeSelectionEnabled = v5->_edgeSelectionEnabled;
    v5->_edgeSelectionEnabled = (NSNumber *)v105;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeSelectionAlpha"));
    v107 = objc_claimAutoreleasedReturnValue();
    edgeSelectionAlpha = v5->_edgeSelectionAlpha;
    v5->_edgeSelectionAlpha = (NSNumber *)v107;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeSelectionWindowSize"));
    v109 = objc_claimAutoreleasedReturnValue();
    edgeSelectionWindowSize = v5->_edgeSelectionWindowSize;
    v5->_edgeSelectionWindowSize = (NSNumber *)v109;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EnableIPv6"));
    v111 = objc_claimAutoreleasedReturnValue();
    enableIPv6 = v5->_enableIPv6;
    v5->_enableIPv6 = (NSNumber *)v111;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TFOLeeway"));
    v113 = objc_claimAutoreleasedReturnValue();
    TFOLeeway = v5->_TFOLeeway;
    v5->_TFOLeeway = (NSNumber *)v113;

    v115 = (void *)MEMORY[0x1E0C99E60];
    v116 = objc_opt_class();
    objc_msgSend(v115, "setWithObjects:", v116, objc_opt_class(), 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v117, CFSTR("allOnRamps"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo setAllOnRamps:](v5, "setAllOnRamps:", v118);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgesGeneration"));
    v119 = objc_claimAutoreleasedReturnValue();
    edgesGeneration = v5->_edgesGeneration;
    v5->_edgesGeneration = (NSNumber *)v119;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usedEdgesGeneration"));
    v121 = objc_claimAutoreleasedReturnValue();
    usedEdgesGeneration = v5->_usedEdgesGeneration;
    v5->_usedEdgesGeneration = (NSNumber *)v121;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("waldoUpdateHash"));
    v123 = objc_claimAutoreleasedReturnValue();
    updateHash = v5->_updateHash;
    v5->_updateHash = (NSData *)v123;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char IsEqual;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  char v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  char v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  char v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  char v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  char v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  char v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  char v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  char v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  char v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  char v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  char v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  char v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  char v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  char v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  id v201;

  v201 = a3;
  -[NPWaldo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v4, CFSTR("Identifier"));

  -[NPWaldo timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v5, CFSTR("timestamp"));

  objc_msgSend(v201, "encodeInteger:forKey:", -[NPWaldo source](self, "source"), CFSTR("source"));
  -[NPWaldo hostname](self, "hostname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v6, CFSTR("waldoHostname"));

  -[NPWaldo edges](self, "edges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v7, CFSTR("EdgeList"));

  objc_msgSend(v201, "encodeInteger:forKey:", -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex"), CFSTR("CurrentEdgeIndex"));
  -[NPWaldo retryPause](self, "retryPause");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retryPause");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqual = myIsEqual(v8, v10);

  if ((IsEqual & 1) == 0)
  {
    -[NPWaldo retryPause](self, "retryPause");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v12, CFSTR("retryPause"));

  }
  -[NPWaldo probePause](self, "probePause");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "probePause");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = myIsEqual(v13, v15);

  if ((v16 & 1) == 0)
  {
    -[NPWaldo probePause](self, "probePause");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v17, CFSTR("ProbePause"));

  }
  -[NPWaldo requireTFO](self, "requireTFO");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "requireTFO");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = myIsEqual(v18, v20);

  if ((v21 & 1) == 0)
  {
    -[NPWaldo requireTFO](self, "requireTFO");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v22, CFSTR("RequireTFO"));

  }
  -[NPWaldo probeTFO](self, "probeTFO");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "probeTFO");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = myIsEqual(v23, v25);

  if ((v26 & 1) == 0)
  {
    -[NPWaldo probeTFO](self, "probeTFO");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v27, CFSTR("ProbeTFO"));

  }
  -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "probeNoTFOCookie");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = myIsEqual(v28, v30);

  if ((v31 & 1) == 0)
  {
    -[NPWaldo probeTFO](self, "probeTFO");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v32, CFSTR("ProbeNoTFOCookie"));

  }
  -[NPWaldo probeTimeout](self, "probeTimeout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "probeTimeout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = myIsEqual(v33, v35);

  if ((v36 & 1) == 0)
  {
    -[NPWaldo probeTimeout](self, "probeTimeout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v37, CFSTR("ProbeTimeout"));

  }
  -[NPWaldo networkInformation](self, "networkInformation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v38, CFSTR("NetworkInformation"));

  -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dayPassSoftExpiry");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = myIsEqual(v39, v41);

  if ((v42 & 1) == 0)
  {
    -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v43, CFSTR("DayPassExpiry"));

  }
  -[NPWaldo dayPassRequestTimeout](self, "dayPassRequestTimeout");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "dayPassRequestTimeout");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = myIsEqual(v44, v46);

  if ((v47 & 1) == 0)
  {
    -[NPWaldo dayPassRequestTimeout](self, "dayPassRequestTimeout");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v48, CFSTR("request-timeout"));

  }
  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "enableLatencyDerivation");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = myIsEqual(v49, v51);

  if ((v52 & 1) == 0)
  {
    -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v53, CFSTR("EnableLatencyDerivation"));

  }
  -[NPWaldo latencyFactorX](self, "latencyFactorX");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "latencyFactorX");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = myIsEqual(v54, v56);

  if ((v57 & 1) == 0)
  {
    -[NPWaldo latencyFactorX](self, "latencyFactorX");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v58, CFSTR("LatencyFactorX"));

  }
  -[NPWaldo latencyFactorA](self, "latencyFactorA");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "latencyFactorA");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = myIsEqual(v59, v61);

  if ((v62 & 1) == 0)
  {
    -[NPWaldo latencyFactorA](self, "latencyFactorA");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v63, CFSTR("LatencyFactorA"));

  }
  -[NPWaldo latencyFactorB](self, "latencyFactorB");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "latencyFactorB");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = myIsEqual(v64, v66);

  if ((v67 & 1) == 0)
  {
    -[NPWaldo latencyFactorB](self, "latencyFactorB");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v68, CFSTR("LatencyFactorB"));

  }
  -[NPWaldo edgeFairnessFactor](self, "edgeFairnessFactor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "edgeFairnessFactor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = myIsEqual(v69, v71);

  if ((v72 & 1) == 0)
  {
    -[NPWaldo edgeFairnessFactor](self, "edgeFairnessFactor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v73, CFSTR("EdgeFairnessFactor"));

  }
  objc_msgSend(v201, "encodeInt32:forKey:", -[NPWaldo generation](self, "generation"), CFSTR("Generation"));
  -[NPWaldo observedRTTSampleSize](self, "observedRTTSampleSize");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "observedRTTSampleSize");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = myIsEqual(v74, v76);

  if ((v77 & 1) == 0)
  {
    -[NPWaldo observedRTTSampleSize](self, "observedRTTSampleSize");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v78, CFSTR("ObservedRTTSampleSizeKey"));

  }
  -[NPWaldo signatureLimit](self, "signatureLimit");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "signatureLimit");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = myIsEqual(v79, v81);

  if ((v82 & 1) == 0)
  {
    -[NPWaldo signatureLimit](self, "signatureLimit");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v83, CFSTR("NetworkSignatureLimit"));

  }
  -[NPWaldo reprocessSamplingInterval](self, "reprocessSamplingInterval");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "reprocessSamplingInterval");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = myIsEqual(v84, v86);

  if ((v87 & 1) == 0)
  {
    -[NPWaldo reprocessSamplingInterval](self, "reprocessSamplingInterval");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v88, CFSTR("ReprocessSamplingIntervalKey"));

  }
  -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "reprocessSampleSize");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = myIsEqual(v89, v91);

  if ((v92 & 1) == 0)
  {
    -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v93, CFSTR("ReprocessSampleSizeKey"));

  }
  -[NPWaldo viewSize](self, "viewSize");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "viewSize");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = myIsEqual(v94, v96);

  if ((v97 & 1) == 0)
  {
    -[NPWaldo viewSize](self, "viewSize");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v98, CFSTR("ViewSize"));

  }
  -[NPWaldo connectionIdleTimeoutMaximum](self, "connectionIdleTimeoutMaximum");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "connectionIdleTimeoutMaximum");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = myIsEqual(v99, v101);

  if ((v102 & 1) == 0)
  {
    -[NPWaldo connectionIdleTimeoutMaximum](self, "connectionIdleTimeoutMaximum");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v103, CFSTR("ConnectionIdleTimeoutMaximum"));

  }
  -[NPWaldo locationCheckInterval](self, "locationCheckInterval");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "locationCheckInterval");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = myIsEqual(v104, v106);

  if ((v107 & 1) == 0)
  {
    -[NPWaldo locationCheckInterval](self, "locationCheckInterval");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v108, CFSTR("LocationCheckInterval"));

  }
  -[NPWaldo locationToleranceDistance](self, "locationToleranceDistance");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "locationToleranceDistance");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = myIsEqual(v109, v111);

  if ((v112 & 1) == 0)
  {
    -[NPWaldo locationToleranceDistance](self, "locationToleranceDistance");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v113, CFSTR("LocationToleranceDistance"));

  }
  -[NPWaldo locationTTL](self, "locationTTL");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "locationTTL");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = myIsEqual(v114, v116);

  if ((v117 & 1) == 0)
  {
    -[NPWaldo locationTTL](self, "locationTTL");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v118, CFSTR("LocationTTL"));

  }
  -[NPWaldo cachedLocation](self, "cachedLocation");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v119, CFSTR("CachedLocation"));

  -[NPWaldo locationCheckTimestamp](self, "locationCheckTimestamp");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v120, CFSTR("LocationCheckTimestamp"));

  -[NPWaldo dayPassHostname](self, "dayPassHostname");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "dayPassHostname");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = myIsEqual(v121, v123);

  if ((v124 & 1) == 0)
  {
    -[NPWaldo dayPassHostname](self, "dayPassHostname");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v125, CFSTR("DayPassHostname"));

  }
  -[NPWaldo dayPassHostnamePrependLabel](self, "dayPassHostnamePrependLabel");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "dayPassHostnamePrependLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = myIsEqual(v126, v128);

  if ((v129 & 1) == 0)
  {
    -[NPWaldo dayPassHostnamePrependLabel](self, "dayPassHostnamePrependLabel");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v130, CFSTR("host-prepend-label"));

  }
  -[NPWaldo dayPassExtendedValidation](self, "dayPassExtendedValidation");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "dayPassExtendedValidation");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = myIsEqual(v131, v133);

  if ((v134 & 1) == 0)
  {
    -[NPWaldo dayPassExtendedValidation](self, "dayPassExtendedValidation");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v135, CFSTR("DayPassEV"));

  }
  -[NPWaldo dayPassEnableSessionTicket](self, "dayPassEnableSessionTicket");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "dayPassEnableSessionTicket");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = myIsEqual(v136, v138);

  if ((v139 & 1) == 0)
  {
    -[NPWaldo dayPassEnableSessionTicket](self, "dayPassEnableSessionTicket");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v140, CFSTR("session"));

  }
  -[NPWaldo dayPassLeafOID](self, "dayPassLeafOID");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "dayPassLeafOID");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = myIsEqual(v141, v143);

  if ((v144 & 1) == 0)
  {
    -[NPWaldo dayPassLeafOID](self, "dayPassLeafOID");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v145, CFSTR("leafOID"));

  }
  -[NPWaldo dayPassRevocationFailClosed](self, "dayPassRevocationFailClosed");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "dayPassRevocationFailClosed");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = myIsEqual(v146, v148);

  if ((v149 & 1) == 0)
  {
    -[NPWaldo dayPassRevocationFailClosed](self, "dayPassRevocationFailClosed");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v150, CFSTR("revocationFailClosed"));

  }
  -[NPWaldo tag](self, "tag");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "tag");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = myIsEqual(v151, v153);

  if ((v154 & 1) == 0)
  {
    -[NPWaldo tag](self, "tag");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v155, CFSTR("Tag"));

  }
  -[NPWaldo telemetryURL](self, "telemetryURL");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "telemetryURL");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = myIsEqual(v156, v158);

  if ((v159 & 1) == 0)
  {
    -[NPWaldo telemetryURL](self, "telemetryURL");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v160, CFSTR("TelemetryURL"));

  }
  -[NPWaldo telemetryService](self, "telemetryService");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "telemetryService");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = myIsEqual(v161, v163);

  if ((v164 & 1) == 0)
  {
    -[NPWaldo telemetryService](self, "telemetryService");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v165, CFSTR("TelemetryService"));

  }
  -[NPWaldo useGeohashFromServer](self, "useGeohashFromServer");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "useGeohashFromServer");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = myIsEqual(v166, v168);

  if ((v169 & 1) == 0)
  {
    -[NPWaldo useGeohashFromServer](self, "useGeohashFromServer");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v170, CFSTR("UseGeoFromServer"));

  }
  -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "edgeSelectionEnabled");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = myIsEqual(v171, v173);

  if ((v174 & 1) == 0)
  {
    -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v175, CFSTR("edgeSelectionEnabled"));

  }
  -[NPWaldo edgeSelectionAlpha](self, "edgeSelectionAlpha");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "edgeSelectionAlpha");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = myIsEqual(v176, v178);

  if ((v179 & 1) == 0)
  {
    -[NPWaldo edgeSelectionAlpha](self, "edgeSelectionAlpha");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v180, CFSTR("edgeSelectionAlpha"));

  }
  -[NPWaldo edgeSelectionWindowSize](self, "edgeSelectionWindowSize");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "edgeSelectionWindowSize");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = myIsEqual(v181, v183);

  if ((v184 & 1) == 0)
  {
    -[NPWaldo edgeSelectionWindowSize](self, "edgeSelectionWindowSize");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v185, CFSTR("edgeSelectionWindowSize"));

  }
  -[NPWaldo enableIPv6](self, "enableIPv6");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "enableIPv6");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = myIsEqual(v186, v188);

  if ((v189 & 1) == 0)
  {
    -[NPWaldo enableIPv6](self, "enableIPv6");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v190, CFSTR("EnableIPv6"));

  }
  -[NPWaldo TFOLeeway](self, "TFOLeeway");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo defaults](self, "defaults");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "TFOLeeway");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = myIsEqual(v191, v193);

  if ((v194 & 1) == 0)
  {
    -[NPWaldo TFOLeeway](self, "TFOLeeway");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "encodeObject:forKey:", v195, CFSTR("TFOLeeway"));

  }
  -[NPWaldo configurationIdentifier](self, "configurationIdentifier");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v196, CFSTR("configID"));

  -[NPWaldo allOnRamps](self, "allOnRamps");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v197, CFSTR("allOnRamps"));

  -[NPWaldo edgesGeneration](self, "edgesGeneration");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v198, CFSTR("edgesGeneration"));

  -[NPWaldo usedEdgesGeneration](self, "usedEdgesGeneration");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v199, CFSTR("usedEdgesGeneration"));

  -[NPWaldo updateHash](self, "updateHash");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "encodeObject:forKey:", v200, CFSTR("waldoUpdateHash"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NPWaldo *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *hostname;
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
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = -[NPWaldo init](+[NPWaldo allocWithZone:](NPWaldo, "allocWithZone:", a3), "init");
  -[NPWaldo identifier](self, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v4->_source = -[NPWaldo source](self, "source");
  -[NPWaldo hostname](self, "hostname");
  v7 = objc_claimAutoreleasedReturnValue();
  hostname = v4->_hostname;
  v4->_hostname = (NSString *)v7;

  -[NPWaldo timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setTimestamp:](v4, "setTimestamp:", v9);

  -[NPWaldo retryPause](self, "retryPause");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setRetryPause:](v4, "setRetryPause:", v10);

  -[NPWaldo probePause](self, "probePause");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setProbePause:](v4, "setProbePause:", v11);

  -[NPWaldo probeTFO](self, "probeTFO");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setProbeTFO:](v4, "setProbeTFO:", v12);

  -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setProbeNoTFOCookie:](v4, "setProbeNoTFOCookie:", v13);

  -[NPWaldo probeTimeout](self, "probeTimeout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setProbeTimeout:](v4, "setProbeTimeout:", v14);

  -[NPWaldo dayPassRequestTimeout](self, "dayPassRequestTimeout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassRequestTimeout:](v4, "setDayPassRequestTimeout:", v15);

  -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassSoftExpiry:](v4, "setDayPassSoftExpiry:", v16);

  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEnableLatencyDerivation:](v4, "setEnableLatencyDerivation:", v17);

  -[NPWaldo latencyFactorX](self, "latencyFactorX");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setLatencyFactorX:](v4, "setLatencyFactorX:", v18);

  -[NPWaldo latencyFactorA](self, "latencyFactorA");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setLatencyFactorA:](v4, "setLatencyFactorA:", v19);

  -[NPWaldo latencyFactorB](self, "latencyFactorB");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setLatencyFactorB:](v4, "setLatencyFactorB:", v20);

  -[NPWaldo edgeFairnessFactor](self, "edgeFairnessFactor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEdgeFairnessFactor:](v4, "setEdgeFairnessFactor:", v21);

  -[NPWaldo observedRTTSampleSize](self, "observedRTTSampleSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setObservedRTTSampleSize:](v4, "setObservedRTTSampleSize:", v22);

  -[NPWaldo reprocessSamplingInterval](self, "reprocessSamplingInterval");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setReprocessSamplingInterval:](v4, "setReprocessSamplingInterval:", v23);

  -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setReprocessSampleSize:](v4, "setReprocessSampleSize:", v24);

  -[NPWaldo viewSize](self, "viewSize");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setViewSize:](v4, "setViewSize:", v25);

  -[NPWaldo locationCheckInterval](self, "locationCheckInterval");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setLocationCheckInterval:](v4, "setLocationCheckInterval:", v26);

  -[NPWaldo locationToleranceDistance](self, "locationToleranceDistance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setLocationToleranceDistance:](v4, "setLocationToleranceDistance:", v27);

  -[NPWaldo locationTTL](self, "locationTTL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setLocationTTL:](v4, "setLocationTTL:", v28);

  -[NPWaldo dayPassHostname](self, "dayPassHostname");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassHostname:](v4, "setDayPassHostname:", v29);

  -[NPWaldo dayPassHostnamePrependLabel](self, "dayPassHostnamePrependLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassHostnamePrependLabel:](v4, "setDayPassHostnamePrependLabel:", v30);

  -[NPWaldo dayPassExtendedValidation](self, "dayPassExtendedValidation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassExtendedValidation:](v4, "setDayPassExtendedValidation:", v31);

  -[NPWaldo dayPassEnableSessionTicket](self, "dayPassEnableSessionTicket");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassEnableSessionTicket:](v4, "setDayPassEnableSessionTicket:", v32);

  -[NPWaldo dayPassLeafOID](self, "dayPassLeafOID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassLeafOID:](v4, "setDayPassLeafOID:", v33);

  -[NPWaldo dayPassRevocationFailClosed](self, "dayPassRevocationFailClosed");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setDayPassRevocationFailClosed:](v4, "setDayPassRevocationFailClosed:", v34);

  -[NPWaldo tag](self, "tag");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setTag:](v4, "setTag:", v35);

  -[NPWaldo telemetryURL](self, "telemetryURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setTelemetryURL:](v4, "setTelemetryURL:", v36);

  -[NPWaldo telemetryService](self, "telemetryService");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setTelemetryService:](v4, "setTelemetryService:", v37);

  -[NPWaldo useGeohashFromServer](self, "useGeohashFromServer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setUseGeohashFromServer:](v4, "setUseGeohashFromServer:", v38);

  -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEdgeSelectionEnabled:](v4, "setEdgeSelectionEnabled:", v39);

  -[NPWaldo edgeSelectionAlpha](self, "edgeSelectionAlpha");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEdgeSelectionAlpha:](v4, "setEdgeSelectionAlpha:", v40);

  -[NPWaldo edgeSelectionWindowSize](self, "edgeSelectionWindowSize");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEdgeSelectionWindowSize:](v4, "setEdgeSelectionWindowSize:", v41);

  -[NPWaldo enableIPv6](self, "enableIPv6");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEnableIPv6:](v4, "setEnableIPv6:", v42);

  -[NPWaldo TFOLeeway](self, "TFOLeeway");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setTFOLeeway:](v4, "setTFOLeeway:", v43);

  v44 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[NPWaldo edges](self, "edges");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "initWithArray:copyItems:", v45, 1);
  -[NPWaldo setEdges:](v4, "setEdges:", v46);

  v47 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[NPWaldo allOnRamps](self, "allOnRamps");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithArray:copyItems:", v48, 1);
  -[NPWaldo setAllOnRamps:](v4, "setAllOnRamps:", v49);

  -[NPWaldo edgesGeneration](self, "edgesGeneration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setEdgesGeneration:](v4, "setEdgesGeneration:", v50);

  -[NPWaldo usedEdgesGeneration](self, "usedEdgesGeneration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setUsedEdgesGeneration:](v4, "setUsedEdgesGeneration:", v51);

  -[NPWaldo updateHash](self, "updateHash");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setUpdateHash:](v4, "setUpdateHash:", v52);

  return v4;
}

- (void)merge:(id)a3 missingSettingsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
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
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
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
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
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
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[128];
  uint64_t v188;

  v4 = a4;
  v188 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "source") && (!v4 || !-[NPWaldo source](self, "source")))
    self->_source = objc_msgSend(v6, "source");
  objc_msgSend(v6, "edges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && v4)
  {
    -[NPWaldo edges](self, "edges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_10;
  }
  else
  {

    if (v8)
    {
LABEL_10:
      objc_msgSend(v6, "edges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEdges:](self, "setEdges:", v10);

    }
  }
  objc_msgSend(v6, "allOnRamps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && v4)
  {
    -[NPWaldo allOnRamps](self, "allOnRamps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_16;
  }
  else
  {

    if (v12)
    {
LABEL_16:
      objc_msgSend(v6, "allOnRamps");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setAllOnRamps:](self, "setAllOnRamps:", v14);

    }
  }
  objc_msgSend(v6, "retryPause");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && v4)
  {
    -[NPWaldo retryPause](self, "retryPause");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_22;
  }
  else
  {

    if (v16)
    {
LABEL_22:
      objc_msgSend(v6, "retryPause");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setRetryPause:](self, "setRetryPause:", v18);

    }
  }
  objc_msgSend(v6, "probePause");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && v4)
  {
    -[NPWaldo probePause](self, "probePause");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_28;
  }
  else
  {

    if (v20)
    {
LABEL_28:
      objc_msgSend(v6, "probePause");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setProbePause:](self, "setProbePause:", v22);

    }
  }
  objc_msgSend(v6, "probeTFO");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && v4)
  {
    -[NPWaldo probeTFO](self, "probeTFO");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_34;
  }
  else
  {

    if (v24)
    {
LABEL_34:
      objc_msgSend(v6, "probeTFO");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setProbeTFO:](self, "setProbeTFO:", v26);

    }
  }
  objc_msgSend(v6, "probeNoTFOCookie");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27 && v4)
  {
    -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_40;
  }
  else
  {

    if (v28)
    {
LABEL_40:
      objc_msgSend(v6, "probeNoTFOCookie");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setProbeNoTFOCookie:](self, "setProbeNoTFOCookie:", v30);

    }
  }
  objc_msgSend(v6, "probeTimeout");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31 && v4)
  {
    -[NPWaldo probeTimeout](self, "probeTimeout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
      goto LABEL_46;
  }
  else
  {

    if (v32)
    {
LABEL_46:
      objc_msgSend(v6, "probeTimeout");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setProbeTimeout:](self, "setProbeTimeout:", v34);

    }
  }
  objc_msgSend(v6, "dayPassRequestTimeout");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35 && v4)
  {
    -[NPWaldo dayPassRequestTimeout](self, "dayPassRequestTimeout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
      goto LABEL_52;
  }
  else
  {

    if (v36)
    {
LABEL_52:
      objc_msgSend(v6, "dayPassRequestTimeout");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassRequestTimeout:](self, "setDayPassRequestTimeout:", v38);

    }
  }
  objc_msgSend(v6, "dayPassSoftExpiry");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39 && v4)
  {
    -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
      goto LABEL_58;
  }
  else
  {

    if (v40)
    {
LABEL_58:
      objc_msgSend(v6, "dayPassSoftExpiry");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassSoftExpiry:](self, "setDayPassSoftExpiry:", v42);

    }
  }
  objc_msgSend(v6, "enableLatencyDerivation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43 && v4)
  {
    -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
      goto LABEL_64;
  }
  else
  {

    if (v44)
    {
LABEL_64:
      objc_msgSend(v6, "enableLatencyDerivation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEnableLatencyDerivation:](self, "setEnableLatencyDerivation:", v46);

    }
  }
  objc_msgSend(v6, "latencyFactorX");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47 && v4)
  {
    -[NPWaldo latencyFactorX](self, "latencyFactorX");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
      goto LABEL_70;
  }
  else
  {

    if (v48)
    {
LABEL_70:
      objc_msgSend(v6, "latencyFactorX");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setLatencyFactorX:](self, "setLatencyFactorX:", v50);

    }
  }
  objc_msgSend(v6, "latencyFactorA");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51 && v4)
  {
    -[NPWaldo latencyFactorA](self, "latencyFactorA");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v53)
      goto LABEL_76;
  }
  else
  {

    if (v52)
    {
LABEL_76:
      objc_msgSend(v6, "latencyFactorA");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setLatencyFactorA:](self, "setLatencyFactorA:", v54);

    }
  }
  objc_msgSend(v6, "latencyFactorB");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55 && v4)
  {
    -[NPWaldo latencyFactorB](self, "latencyFactorB");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
      goto LABEL_82;
  }
  else
  {

    if (v56)
    {
LABEL_82:
      objc_msgSend(v6, "latencyFactorB");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setLatencyFactorB:](self, "setLatencyFactorB:", v58);

    }
  }
  objc_msgSend(v6, "edgeFairnessFactor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59 && v4)
  {
    -[NPWaldo edgeFairnessFactor](self, "edgeFairnessFactor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
      goto LABEL_88;
  }
  else
  {

    if (v60)
    {
LABEL_88:
      objc_msgSend(v6, "edgeFairnessFactor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEdgeFairnessFactor:](self, "setEdgeFairnessFactor:", v62);

    }
  }
  objc_msgSend(v6, "observedRTTSampleSize");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63 && v4)
  {
    -[NPWaldo observedRTTSampleSize](self, "observedRTTSampleSize");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
      goto LABEL_94;
  }
  else
  {

    if (v64)
    {
LABEL_94:
      objc_msgSend(v6, "observedRTTSampleSize");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setObservedRTTSampleSize:](self, "setObservedRTTSampleSize:", v66);

    }
  }
  objc_msgSend(v6, "signatureLimit");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67 && v4)
  {
    -[NPWaldo signatureLimit](self, "signatureLimit");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v69)
      goto LABEL_100;
  }
  else
  {

    if (v68)
    {
LABEL_100:
      objc_msgSend(v6, "signatureLimit");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setSignatureLimit:](self, "setSignatureLimit:", v70);

    }
  }
  objc_msgSend(v6, "reprocessSamplingInterval");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (v71 && v4)
  {
    -[NPWaldo reprocessSamplingInterval](self, "reprocessSamplingInterval");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v73)
      goto LABEL_106;
  }
  else
  {

    if (v72)
    {
LABEL_106:
      objc_msgSend(v6, "reprocessSamplingInterval");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setReprocessSamplingInterval:](self, "setReprocessSamplingInterval:", v74);

    }
  }
  objc_msgSend(v6, "reprocessSampleSize");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75 && v4)
  {
    -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v77)
      goto LABEL_112;
  }
  else
  {

    if (v76)
    {
LABEL_112:
      objc_msgSend(v6, "reprocessSampleSize");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setReprocessSampleSize:](self, "setReprocessSampleSize:", v78);

    }
  }
  objc_msgSend(v6, "viewSize");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v79 && v4)
  {
    -[NPWaldo viewSize](self, "viewSize");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v81)
      goto LABEL_118;
  }
  else
  {

    if (v80)
    {
LABEL_118:
      objc_msgSend(v6, "viewSize");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setViewSize:](self, "setViewSize:", v82);

    }
  }
  objc_msgSend(v6, "connectionIdleTimeoutMaximum");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (v83 && v4)
  {
    -[NPWaldo connectionIdleTimeoutMaximum](self, "connectionIdleTimeoutMaximum");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v85)
      goto LABEL_124;
  }
  else
  {

    if (v84)
    {
LABEL_124:
      objc_msgSend(v6, "connectionIdleTimeoutMaximum");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setConnectionIdleTimeoutMaximum:](self, "setConnectionIdleTimeoutMaximum:", v86);

    }
  }
  objc_msgSend(v6, "locationCheckInterval");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87 && v4)
  {
    -[NPWaldo locationCheckInterval](self, "locationCheckInterval");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v89)
      goto LABEL_130;
  }
  else
  {

    if (v88)
    {
LABEL_130:
      objc_msgSend(v6, "locationCheckInterval");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setLocationCheckInterval:](self, "setLocationCheckInterval:", v90);

    }
  }
  objc_msgSend(v6, "locationToleranceDistance");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91;
  if (v91 && v4)
  {
    -[NPWaldo locationToleranceDistance](self, "locationToleranceDistance");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v93)
      goto LABEL_136;
  }
  else
  {

    if (v92)
    {
LABEL_136:
      objc_msgSend(v6, "locationToleranceDistance");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setLocationToleranceDistance:](self, "setLocationToleranceDistance:", v94);

    }
  }
  objc_msgSend(v6, "locationTTL");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95 && v4)
  {
    -[NPWaldo locationTTL](self, "locationTTL");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v97)
      goto LABEL_142;
  }
  else
  {

    if (v96)
    {
LABEL_142:
      objc_msgSend(v6, "locationTTL");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setLocationTTL:](self, "setLocationTTL:", v98);

    }
  }
  objc_msgSend(v6, "dayPassHostname");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99;
  if (v99 && v4)
  {
    -[NPWaldo dayPassHostname](self, "dayPassHostname");
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v101)
      goto LABEL_148;
  }
  else
  {

    if (v100)
    {
LABEL_148:
      objc_msgSend(v6, "dayPassHostname");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassHostname:](self, "setDayPassHostname:", v102);

    }
  }
  objc_msgSend(v6, "dayPassHostnamePrependLabel");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v103;
  if (v103 && v4)
  {
    -[NPWaldo dayPassHostnamePrependLabel](self, "dayPassHostnamePrependLabel");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v105)
      goto LABEL_154;
  }
  else
  {

    if (v104)
    {
LABEL_154:
      objc_msgSend(v6, "dayPassHostnamePrependLabel");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassHostnamePrependLabel:](self, "setDayPassHostnamePrependLabel:", v106);

    }
  }
  objc_msgSend(v6, "dayPassExtendedValidation");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  if (v107 && v4)
  {
    -[NPWaldo dayPassExtendedValidation](self, "dayPassExtendedValidation");
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v109)
      goto LABEL_160;
  }
  else
  {

    if (v108)
    {
LABEL_160:
      objc_msgSend(v6, "dayPassExtendedValidation");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassExtendedValidation:](self, "setDayPassExtendedValidation:", v110);

    }
  }
  objc_msgSend(v6, "dayPassEnableSessionTicket");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (v111 && v4)
  {
    -[NPWaldo dayPassEnableSessionTicket](self, "dayPassEnableSessionTicket");
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v113)
      goto LABEL_166;
  }
  else
  {

    if (v112)
    {
LABEL_166:
      objc_msgSend(v6, "dayPassEnableSessionTicket");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassEnableSessionTicket:](self, "setDayPassEnableSessionTicket:", v114);

    }
  }
  objc_msgSend(v6, "dayPassLeafOID");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v115;
  if (v115 && v4)
  {
    -[NPWaldo dayPassLeafOID](self, "dayPassLeafOID");
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v117)
      goto LABEL_172;
  }
  else
  {

    if (v116)
    {
LABEL_172:
      objc_msgSend(v6, "dayPassLeafOID");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassLeafOID:](self, "setDayPassLeafOID:", v118);

    }
  }
  objc_msgSend(v6, "dayPassRevocationFailClosed");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v119;
  if (v119 && v4)
  {
    -[NPWaldo dayPassRevocationFailClosed](self, "dayPassRevocationFailClosed");
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v121)
      goto LABEL_178;
  }
  else
  {

    if (v120)
    {
LABEL_178:
      objc_msgSend(v6, "dayPassRevocationFailClosed");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setDayPassRevocationFailClosed:](self, "setDayPassRevocationFailClosed:", v122);

    }
  }
  objc_msgSend(v6, "tag");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v123;
  if (v123 && v4)
  {
    -[NPWaldo tag](self, "tag");
    v125 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v125)
      goto LABEL_184;
  }
  else
  {

    if (v124)
    {
LABEL_184:
      objc_msgSend(v6, "tag");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setTag:](self, "setTag:", v126);

    }
  }
  objc_msgSend(v6, "telemetryService");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v127;
  if (v127 && v4)
  {
    -[NPWaldo telemetryService](self, "telemetryService");
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v129)
      goto LABEL_190;
  }
  else
  {

    if (v128)
    {
LABEL_190:
      objc_msgSend(v6, "telemetryService");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setTelemetryService:](self, "setTelemetryService:", v130);

    }
  }
  objc_msgSend(v6, "telemetryURL");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131;
  if (v131 && v4)
  {
    -[NPWaldo telemetryURL](self, "telemetryURL");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v133)
      goto LABEL_196;
  }
  else
  {

    if (v132)
    {
LABEL_196:
      objc_msgSend(v6, "telemetryURL");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setTelemetryURL:](self, "setTelemetryURL:", v134);

    }
  }
  objc_msgSend(v6, "useGeohashFromServer");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v135;
  if (v135 && v4)
  {
    -[NPWaldo useGeohashFromServer](self, "useGeohashFromServer");
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v137)
      goto LABEL_202;
  }
  else
  {

    if (v136)
    {
LABEL_202:
      objc_msgSend(v6, "useGeohashFromServer");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setUseGeohashFromServer:](self, "setUseGeohashFromServer:", v138);

    }
  }
  objc_msgSend(v6, "configurationIdentifier");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v139;
  if (v139 && v4)
  {
    -[NPWaldo configurationIdentifier](self, "configurationIdentifier");
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v141)
      goto LABEL_208;
  }
  else
  {

    if (v140)
    {
LABEL_208:
      objc_msgSend(v6, "configurationIdentifier");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setConfigurationIdentifier:](self, "setConfigurationIdentifier:", v142);

    }
  }
  objc_msgSend(v6, "timestamp");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v143;
  if (v143 && v4)
  {
    -[NPWaldo timestamp](self, "timestamp");
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v145)
      goto LABEL_214;
  }
  else
  {

    if (v144)
    {
LABEL_214:
      objc_msgSend(v6, "timestamp");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setTimestamp:](self, "setTimestamp:", v146);

    }
  }
  objc_msgSend(v6, "edgeSelectionEnabled");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v147;
  if (v147 && v4)
  {
    -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v149)
      goto LABEL_220;
  }
  else
  {

    if (v148)
    {
LABEL_220:
      objc_msgSend(v6, "edgeSelectionEnabled");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEdgeSelectionEnabled:](self, "setEdgeSelectionEnabled:", v150);

    }
  }
  objc_msgSend(v6, "edgeSelectionAlpha");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v151;
  if (v151 && v4)
  {
    -[NPWaldo edgeSelectionAlpha](self, "edgeSelectionAlpha");
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v153)
      goto LABEL_226;
  }
  else
  {

    if (v152)
    {
LABEL_226:
      objc_msgSend(v6, "edgeSelectionAlpha");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEdgeSelectionAlpha:](self, "setEdgeSelectionAlpha:", v154);

    }
  }
  objc_msgSend(v6, "edgeSelectionWindowSize");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v155;
  if (v155 && v4)
  {
    -[NPWaldo edgeSelectionWindowSize](self, "edgeSelectionWindowSize");
    v157 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v157)
      goto LABEL_232;
  }
  else
  {

    if (v156)
    {
LABEL_232:
      objc_msgSend(v6, "edgeSelectionWindowSize");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEdgeSelectionWindowSize:](self, "setEdgeSelectionWindowSize:", v158);

    }
  }
  objc_msgSend(v6, "enableIPv6");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v159;
  if (v159 && v4)
  {
    -[NPWaldo enableIPv6](self, "enableIPv6");
    v161 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v161)
      goto LABEL_238;
  }
  else
  {

    if (v160)
    {
LABEL_238:
      objc_msgSend(v6, "enableIPv6");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setEnableIPv6:](self, "setEnableIPv6:", v162);

    }
  }
  objc_msgSend(v6, "requireTFO");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v163;
  if (v163 && v4)
  {
    -[NPWaldo requireTFO](self, "requireTFO");
    v165 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v165)
      goto LABEL_244;
  }
  else
  {

    if (v164)
    {
LABEL_244:
      objc_msgSend(v6, "requireTFO");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setRequireTFO:](self, "setRequireTFO:", v166);

    }
  }
  objc_msgSend(v6, "TFOLeeway");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v167;
  if (v167 && v4)
  {
    -[NPWaldo TFOLeeway](self, "TFOLeeway");
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v169)
      goto LABEL_250;
  }
  else
  {

    if (v168)
    {
LABEL_250:
      objc_msgSend(v6, "TFOLeeway");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setTFOLeeway:](self, "setTFOLeeway:", v170);

    }
  }
  objc_msgSend(v6, "updateHash");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v171;
  if (v171 && v4)
  {
    -[NPWaldo updateHash](self, "updateHash");
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    if (v173)
      goto LABEL_257;
  }
  else
  {

    if (!v172)
      goto LABEL_257;
  }
  objc_msgSend(v6, "updateHash");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo setUpdateHash:](self, "setUpdateHash:", v174);

LABEL_257:
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  -[NPWaldo networkInformation](self, "networkInformation", 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v183, v187, 16);
  if (v176)
  {
    v177 = v176;
    v178 = *(_QWORD *)v184;
    do
    {
      v179 = 0;
      do
      {
        if (*(_QWORD *)v184 != v178)
          objc_enumerationMutation(v175);
        v180 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * v179);
        -[NPWaldo networkInformation](self, "networkInformation");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "objectForKeyedSubscript:", v180);
        v182 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v182, "setProbeRateLimit:", 0);
        ++v179;
      }
      while (v177 != v179);
      v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v183, v187, 16);
    }
    while (v177);
  }

  -[NPWaldo setShouldSave:](self, "setShouldSave:", 1);
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *edges;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setParentWaldo:", self);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  edges = self->_edges;
  self->_edges = v4;

}

- (NSArray)allOnRamps
{
  return self->_allOnRamps;
}

- (void)setAllOnRamps:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *allOnRamps;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "resetParentWaldo:", self);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  allOnRamps = self->_allOnRamps;
  self->_allOnRamps = v4;

}

- (void)updateNetworkAgentWithKeybag:(id)a3 networkInfo:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  NSPNetworkAgent *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  BOOL v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  NPKeyBag *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  BOOL v61;
  NSObject *v62;
  _BOOL4 v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  BOOL v92;
  uint64_t v93;
  unsigned int v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  BOOL v104;
  void *v105;
  void *v106;
  char v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  char *v113;
  void *v114;
  int *v115;
  char *v116;
  void *v117;
  void *v118;
  char *v119;
  void *v120;
  void *v121;
  NPKeyBag *v122;
  id v123;
  id v124;
  id obj;
  _QWORD v126[5];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _QWORD v131[6];
  uint8_t v132[128];
  uint8_t v133[4];
  void *v134;
  __int16 v135;
  char *v136;
  _BYTE buf[40];
  id v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v124 = a3;
  v123 = a4;
  -[NPWaldo agent](self, "agent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Creating a new keybag agent", buf, 0xCu);

    }
    v9 = objc_alloc_init(NSPNetworkAgent);
    -[NPWaldo setAgent:](self, "setAgent:", v9);

    v10 = objc_alloc(MEMORY[0x1E0CCEC90]);
    -[NPWaldo agent](self, "agent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithNetworkAgentClass:", objc_opt_class());
    -[NPWaldo setAgentRegistration:](self, "setAgentRegistration:", v12);

  }
  -[NPWaldo agentRegistration](self, "agentRegistration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isRegistered");

  if (!v14)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
    *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4;
    v138 = 0;
    nplog_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[NPWaldo identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo configurationIdentifier](self, "configurationIdentifier");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v133 = 138412546;
      v134 = v20;
      v135 = 2112;
      v136 = v21;
      _os_log_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_INFO, "%@: Looking for keybag agent registration with configuration ID %@", v133, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke;
    v131[3] = &unk_1E4137E20;
    v131[4] = self;
    v131[5] = buf;
    objc_msgSend(v22, "iterateFileHandlesWithBlock:", v131);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      nplog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NPWaldo identifier](self, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v133 = 138412290;
        v134 = v24;
        _os_log_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEFAULT, "%@: Re-using existing keybag network agent registration file handle", v133, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "handle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = dup(objc_msgSend(v25, "fileDescriptor"));

      if ((v26 & 0x80000000) != 0)
      {
        nplog_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          -[NPWaldo identifier](self, "identifier");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = __error();
          v116 = strerror(*v115);
          *(_DWORD *)v133 = 138412546;
          v134 = v114;
          v135 = 2080;
          v136 = v116;
          _os_log_error_impl(&dword_19E8FE000, v44, OS_LOG_TYPE_ERROR, "%@: Failed to dup the keybag network agent registration file descriptor: %s", v133, 0x16u);

        }
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "agentUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPWaldo agent](self, "agent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAgentUUID:", v27);

        nplog_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          -[NPWaldo identifier](self, "identifier");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPWaldo agent](self, "agent");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "agentUUID");
          v113 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v133 = 138412546;
          v134 = v111;
          v135 = 2112;
          v136 = v113;
          _os_log_debug_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_DEBUG, "%@: Re-set UUID for keybag agent: %@", v133, 0x16u);

        }
        -[NPWaldo agentRegistration](self, "agentRegistration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPWaldo agent](self, "agent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "setRegisteredNetworkAgent:fileDescriptor:", v31, v26);

        if ((v32 & 1) != 0)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
          objc_msgSend(v33, "setAccount:", CFSTR("com.apple.NetworkServiceProxy"));
          v121 = v33;
          v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", 0, v33);
          objc_msgSend(v120, "path");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "networkAgentsOfType:", objc_opt_class());
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          obj = v35;
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v128;
            while (2)
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v128 != v37)
                  objc_enumerationMutation(obj);
                v39 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v39, "agentUUID");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NPWaldo agent](self, "agent");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "agentUUID");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v40, "isEqual:", v42);

                  if (v43)
                  {
                    objc_msgSend(v39, "parseAgentData");
                    objc_msgSend(v39, "keybag");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = v46 == 0;

                    if (!v47)
                    {
                      nplog_obj();
                      v48 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                      {
                        -[NPWaldo identifier](self, "identifier");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v133 = 138412290;
                        v134 = v49;
                        _os_log_impl(&dword_19E8FE000, v48, OS_LOG_TYPE_DEFAULT, "%@: Setting current keybag to keybag obtained from the kernel", v133, 0xCu);

                      }
                      objc_msgSend(v39, "keybag");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NPWaldo agent](self, "agent");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "setKeybag:", v50);

                    }
                    goto LABEL_39;
                  }
                }
              }
              v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v132, 16);
              if (v36)
                continue;
              break;
            }
          }
LABEL_39:

          goto LABEL_40;
        }
        nplog_obj();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          -[NPWaldo identifier](self, "identifier");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPWaldo agent](self, "agent");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "agentUUID");
          v119 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v133 = 138412546;
          v134 = v117;
          v135 = 2112;
          v136 = v119;
          _os_log_error_impl(&dword_19E8FE000, v45, OS_LOG_TYPE_ERROR, "%@: Failed to set the registered network agent for %@", v133, 0x16u);

        }
        close(v26);
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_71;
    }
LABEL_40:
    _Block_object_dispose(buf, 8);

    goto LABEL_41;
  }
  nplog_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[NPWaldo identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo agent](self, "agent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "agentUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_INFO, "%@: Updating existing keybag agent with UUID %@", buf, 0x16u);

  }
LABEL_41:
  -[NPWaldo agentRegistration](self, "agentRegistration");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isRegistered");

  if (v53)
  {
    v54 = [NPKeyBag alloc];
    -[NPWaldo agent](self, "agent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "keybag");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = -[NPKeyBag initWithData:](v54, "initWithData:", v56);

    if ((objc_msgSend(v123, "hasIPv6") & 1) == 0)
      -[NPKeyBag removeIPv6Keys](v122, "removeIPv6Keys");
    objc_msgSend(v124, "keys");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v57, "count"))
    {
      objc_msgSend(v124, "updateHash");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKeyBag updateHash](v122, "updateHash");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v58, "isEqual:", v59) & 1) != 0)
      {
        -[NPKeyBag keys](v122, "keys");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "count") == 0;

        if (!v61)
        {
          -[NPKeyBag setTFOStatusOverride:](v122, "setTFOStatusOverride:", 3);
          -[NPKeyBag setGeneration:](v122, "setGeneration:", objc_msgSend(v124, "generation"));
          nplog_obj();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);

          if (v63)
          {
            -[NPWaldo identifier](self, "identifier");
            v64 = objc_claimAutoreleasedReturnValue();
            -[NPKeyBag logWithMessage:identifier:](v122, "logWithMessage:identifier:", CFSTR("New keybag does not have any keys, re-pushing current keybag with TFO disabled and updated generation"), v64);
          }
          else
          {
            nplog_obj();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              -[NPWaldo identifier](self, "identifier");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v109;
              _os_log_impl(&dword_19E8FE000, v64, OS_LOG_TYPE_DEFAULT, "%@: New keybag does not have any keys, re-pushing current keybag with TFO disabled and updated generation", buf, 0xCu);

            }
          }

          -[NPKeyBag data](v122, "data");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPWaldo agent](self, "agent");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setKeybag:", v88);
          goto LABEL_61;
        }
LABEL_60:
        objc_msgSend(v124, "data");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPWaldo agent](self, "agent");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setKeybag:", v88);
LABEL_61:

        -[NPWaldo keybag](self, "keybag");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "keys");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "count") == 0;

        if (!v92)
        {
          v93 = 0;
          v94 = 1;
          do
          {
            -[NPWaldo keybag](self, "keybag");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "keys");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "objectAtIndexedSubscript:", v93);
            v97 = (void *)objc_claimAutoreleasedReturnValue();

            nplog_obj();
            v98 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              -[NPWaldo identifier](self, "identifier");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "uuid");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v97, "session_counter");
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v99;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v94 - 1;
              *(_WORD *)&buf[18] = 2112;
              *(_QWORD *)&buf[20] = v100;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v101;
              _os_log_impl(&dword_19E8FE000, v98, OS_LOG_TYPE_DEFAULT, "%@: Pushing %u [%@] [%u session counter]", buf, 0x22u);

            }
            -[NPWaldo keybag](self, "keybag");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "keys");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v94;
            v104 = objc_msgSend(v103, "count") > (unint64_t)v94;

            ++v94;
          }
          while (v104);
        }
        -[NPWaldo agentRegistration](self, "agentRegistration");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPWaldo agent](self, "agent");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v105, "updateNetworkAgent:", v106);

        if ((v107 & 1) == 0)
        {
          nplog_obj();
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19E8FE000, v108, OS_LOG_TYPE_ERROR, "Failed to update the keybag network agent", buf, 2u);
          }

        }
        goto LABEL_71;
      }

    }
    goto LABEL_60;
  }
  nplog_obj();
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    -[NPWaldo identifier](self, "identifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v66;
    _os_log_impl(&dword_19E8FE000, v65, OS_LOG_TYPE_DEFAULT, "%@: Setting up new keybag network agent registration", buf, 0xCu);

  }
  objc_msgSend(v124, "data");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo agent](self, "agent");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setKeybag:", v67);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo agent](self, "agent");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAgentUUID:", v69);

  nplog_obj();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    -[NPWaldo identifier](self, "identifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo agent](self, "agent");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "agentUUID");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v72;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v74;
    _os_log_impl(&dword_19E8FE000, v71, OS_LOG_TYPE_DEFAULT, "%@: Created new UUID for keybag agent: %@", buf, 0x16u);

  }
  -[NPWaldo delegate](self, "delegate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "waldoNeedsPolicyReset");

  -[NPWaldo agentRegistration](self, "agentRegistration");
  v76 = objc_claimAutoreleasedReturnValue();
  -[NPWaldo agent](self, "agent");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v76, "registerNetworkAgent:", v77);

  -[NPWaldo agentRegistration](self, "agentRegistration");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v76) = objc_msgSend(v78, "isRegistered");

  if ((v76 & 1) != 0)
  {
    v79 = objc_alloc(MEMORY[0x1E0CD0820]);
    -[NPWaldo agentRegistration](self, "agentRegistration");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo configurationIdentifier](self, "configurationIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo agent](self, "agent");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "agentUUID");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend(v79, "initWithNetworkAgentRegistration:sessionType:configurationIdentifier:agentUUID:", v80, &unk_1E41515A0, v81, v83);

    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke_688;
    v126[3] = &unk_1E4137E48;
    v126[4] = self;
    objc_msgSend(v85, "setFileHandle:matchingPredicate:", v84, v126);

    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "commit");

  }
  else
  {
    nplog_obj();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      -[NPWaldo identifier](self, "identifier");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v110;
      _os_log_error_impl(&dword_19E8FE000, v87, OS_LOG_TYPE_ERROR, "%@: Failed to register keybag network agent", buf, 0xCu);

    }
  }
LABEL_71:

}

uint64_t __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v3, "sessionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", &unk_1E41515A0);
  if (v5)
  {
    objc_msgSend(v3, "configurationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configurationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = v3;
      v4 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v10;
      goto LABEL_5;
    }
LABEL_6:
    v11 = 1;
    goto LABEL_7;
  }
LABEL_5:
  v11 = v5 ^ 1u;

LABEL_7:
  return v11;
}

uint64_t __52__NPWaldo_updateNetworkAgentWithKeybag_networkInfo___block_invoke_688(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1E41515A0))
    {
      objc_msgSend(v3, "configurationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "configurationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)teardownNetworkAgent
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NPWaldo agentRegistration](self, "agentRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRegistered");

  if (v4)
  {
    -[NPWaldo agentRegistration](self, "agentRegistration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterNetworkAgent");

    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __31__NPWaldo_teardownNetworkAgent__block_invoke;
    v17[3] = &unk_1E4137E48;
    v17[4] = self;
    objc_msgSend(v6, "removeFileHandleMatchingPredicate:", v17);

    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commit");

  }
  -[NPWaldo setAgent:](self, "setAgent:", 0);
  -[NPWaldo setAgentRegistration:](self, "setAgentRegistration:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NPWaldo edges](self, "edges", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "iterateOnRampsForAddressFamily:withBlock:", 0, &__block_literal_global_689);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

uint64_t __31__NPWaldo_teardownNetworkAgent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sessionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", &unk_1E41515A0))
    {
      objc_msgSend(v3, "configurationIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "configurationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __31__NPWaldo_teardownNetworkAgent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_msgSend(a4, "unregisterAgent");
  return 1;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NPWaldo identifier](self, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex");
  -[NPWaldo retryPause](self, "retryPause");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo probePause](self, "probePause");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo probeTFO](self, "probeTFO");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "BOOLValue"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v33 = v4;
  -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "BOOLValue"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = CFSTR("YES");
  v32 = v5;
  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo latencyFactorX](self, "latencyFactorX");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo latencyFactorA](self, "latencyFactorA");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo latencyFactorB](self, "latencyFactorB");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo edgeFairnessFactor](self, "edgeFairnessFactor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo locationCheckInterval](self, "locationCheckInterval");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo locationToleranceDistance](self, "locationToleranceDistance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo locationTTL](self, "locationTTL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo viewSize](self, "viewSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo dayPassRequestTimeout](self, "dayPassRequestTimeout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[NPWaldo generation](self, "generation");
  -[NPWaldo cachedLocation](self, "cachedLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo locationCheckTimestamp](self, "locationCheckTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo useGeohashFromServer](self, "useGeohashFromServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("YES");
  if (!objc_msgSend(v10, "BOOLValue"))
    v6 = CFSTR("NO");
  if (!-[NPWaldo isIPv6Enabled](self, "isIPv6Enabled"))
    v11 = CFSTR("NO");
  -[NPWaldo requireTFO](self, "requireTFO");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = CFSTR("YES");
  if (!v13)
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier = %@, currentEdgeIndex = %ld, retryPause = %@, probePause = %@, probeTFO = %@, probeNoTFOCookie = %@ enableLatencyDerivation = %@, latencyFactorX = %@, latencyFactorA = %@, latencyFactorB = %@, edgeFairnessFactor = %@, locationCheckInterval = %@, locationToleranceDistance = %@, locationTTL = %@, viewSize = %@, daypassRequestTimeout = %@, daypassSoftExpiry = %@, generation = %u, cachedLocation = %@, locationCheckTimestamp %@, useGeoFromServer %@, enableIPv6 %@, requireTFO %@"), v43, v34, v42, v41, v33, v32, v40, v39, v38, v31, v30, v37, v29, v28, v7, v27,
    v26,
    v25,
    v8,
    v9,
    v6,
    v11,
    v14);

  objc_msgSend(v3, "appendFormat:", CFSTR("\nEdges (ordered by distance if available) :"));
  -[NPWaldo edges](self, "edges");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      -[NPWaldo edges](self, "edges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@"), v19);

      ++v17;
      -[NPWaldo edges](self, "edges");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v17 < v21);
  }
  if (-[NPWaldo edgeCount](self, "edgeCount"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\nEdges (current network RTT order):"));
    if (-[NPWaldo edgeCount](self, "edgeCount"))
    {
      v22 = 0;
      do
      {
        -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@"), v23);

        ++v22;
      }
      while (v22 < -[NPWaldo edgeCount](self, "edgeCount"));
    }
  }
  return v3;
}

- (id)initFromKeychainWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NPWaldo *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  NPWaldo *v21;
  NSObject *v22;
  void *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.NetworkServiceProxy.WaldoInfo"), v4);
  v6 = +[NPUtilities copyDataFromKeychainWithIdentifier:accountName:](NPUtilities, "copyDataFromKeychainWithIdentifier:accountName:", v5, CFSTR("waldo"));
  if (v6)
  {
    v30 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v30);
    v8 = v30;
    if (v7)
    {
      v9 = -[NPWaldo initWithCoder:](self, "initWithCoder:", v7);
      nplog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        v24 = v7;
        v25 = v8;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = v12;
          _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "%@: Loaded Waldo from keychain", buf, 0xCu);

        }
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[NPWaldo networkInformation](v9, "networkInformation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              -[NPWaldo networkInformation](v9, "networkInformation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v20, "isProbeInProgress"))
              {
                objc_msgSend(v20, "setIsProbeInProgress:", 0);
                objc_msgSend(v20, "setLastFallbackReason:", 38);
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          }
          while (v15);
        }

        self = v9;
        v21 = self;
        v7 = v24;
        v8 = v25;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v4;
        _os_log_error_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_ERROR, "%@: Failed to decode from the keychain", buf, 0xCu);
      }

      self = 0;
    }
    else
    {
      nplog_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v4;
        v34 = 2112;
        v35 = v8;
        _os_log_error_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_ERROR, "%@: Failed to create a decoder: %@", buf, 0x16u);
      }

    }
    v21 = 0;
LABEL_26:

    goto LABEL_27;
  }
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "%@: No Waldo info in the keychain", buf, 0xCu);
  }
  v21 = 0;
LABEL_27:

  return v21;
}

- (void)saveToKeychain
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NPWaldo *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[NPWaldo shouldSave](self, "shouldSave"))
  {
    -[NPWaldo setShouldSave:](self, "setShouldSave:", 0);
    -[NPWaldo delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "waldoDidSaveToKeychain:", self);

    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      nplog_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[NPWaldo identifier](self, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v21;
        v29 = 2112;
        v30 = self;
        _os_log_debug_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEBUG, "%@: Saving Waldo info to keychain: %@", buf, 0x16u);

      }
    }
    -[NPWaldo ageOutLatencyMap](self, "ageOutLatencyMap");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NPWaldo edges](self, "edges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++), "iterateOnRampsForAddressFamily:withBlock:", 0, &__block_literal_global_709);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    +[NSPConfiguration defaultConfiguration](NSPConfiguration, "defaultConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "edgeSets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[NPWaldo setDefaults:](self, "setDefaults:", v15);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    -[NPWaldo encodeWithCoder:](self, "encodeWithCoder:", v16);
    -[NPWaldo setDefaults:](self, "setDefaults:", 0);
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NPWaldo identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.NetworkServiceProxy.WaldoInfo"), v18);

    objc_msgSend(v16, "encodedData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPUtilities saveDataToKeychain:withIdentifier:accountName:](NPUtilities, "saveDataToKeychain:withIdentifier:accountName:", v20, v19, CFSTR("waldo"));

  }
}

uint64_t __25__NPWaldo_saveToKeychain__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_msgSend(a4, "updateSessionCounterFromKernel");
  return 1;
}

- (void)removeFromKeychain
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NPWaldo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.NetworkServiceProxy.WaldoInfo"), v4);

  +[NPUtilities removeDataFromKeychainWithIdentifier:](NPUtilities, "removeDataFromKeychainWithIdentifier:", v5);
}

- (void)establishTrustWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4138420;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NPWaldo resolveWithCompletionHandler:](self, "resolveWithCompletionHandler:", v6);

}

void __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke(uint64_t a1, char a2, int a3)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    if (a3)
      objc_msgSend(*(id *)(a1 + 32), "linkAllSignatures:", 1);
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shouldCheckLocation");

    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_712;
    v10[3] = &unk_1E41383F8;
    v6 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    objc_msgSend(v5, "sortEdgesByDistanceWithCompletionHandler:", v10);

  }
  else
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "%@: Failed to resolve while establishing trust", buf, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);
  }
}

void __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_712(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E41383A8;
  v5 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = a2;
  v6 = (void *)MEMORY[0x1A1AEA9EC](v11);
  if ((a2 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isLatenciesCompleteForNetwork:", 0) & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_713;
    v8[3] = &unk_1E41383D0;
    v8[4] = v7;
    v9 = v6;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "reprocessWithCompletionHandler:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshDayPassesWithCompletionHandler:", v6);
  }

}

uint64_t __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  NSObject *v6;
  void *v7;
  uint64_t result;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Day Pass refresh failed", (uint8_t *)&v10, 0xCu);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (*(_BYTE *)(a1 + 48))
      v9 = 1;
    else
      v9 = a3;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, v9);
  }
  return result;
}

uint64_t __47__NPWaldo_establishTrustWithCompletionHandler___block_invoke_713(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setShouldSave:", a2);
  v4 = objc_msgSend(*(id *)(a1 + 32), "edgeCount");
  v5 = *(void **)(a1 + 32);
  if (v4)
    return objc_msgSend(v5, "refreshDayPassesWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "pushKeybagToKernel");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a2);
  return result;
}

- (void)pushKeybagToKernelUpdateGeneration:(BOOL)a3
{
  if (a3)
    ++self->_generation;
  -[NPWaldo pushKeybagToKernelCanReuse:](self, "pushKeybagToKernelCanReuse:", 1);
}

- (void)pushKeybagToKernel
{
  ++self->_generation;
  -[NPWaldo pushKeybagToKernelCanReuse:](self, "pushKeybagToKernelCanReuse:", 0);
}

- (void)pushKeybagToKernelCanReuse:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  NPTuscanyOnRamp *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  NPKeyBag *v26;
  int64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NPKeyBag *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint8_t buf[16];

  -[NPWaldo currentEdgeList](self, "currentEdgeList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo currentNetworkInfo](self, "currentNetworkInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NPWaldo dayPassFetchCount](self, "dayPassFetchCount") >= 1)
  {
    v8 = 0;
    do
    {
      -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "getCurrentOnRamp:", v10);
        v11 = (NPTuscanyOnRamp *)objc_claimAutoreleasedReturnValue();
        if (v11 || (v11 = objc_alloc_init(NPTuscanyOnRamp)) != 0)
        {
          objc_msgSend(v7, "addObject:", v11);

        }
      }

      ++v8;
    }
    while (v8 < -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount"));
  }
  if ((!objc_msgSend(v6, "lastFallbackReason") || objc_msgSend(v6, "lastFallbackReason") == 18)
    && !objc_msgSend(v7, "count"))
  {
    -[NPWaldo signatureLimit](self, "signatureLimit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NPWaldo signatureLimit](self, "signatureLimit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

    }
    else
    {
      v14 = 50;
    }

    -[NPWaldo networkInformation](self, "networkInformation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 <= v14)
    {
      -[NPWaldo edgesGeneration](self, "edgesGeneration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedIntValue");
      -[NPWaldo usedEdgesGeneration](self, "usedEdgesGeneration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntValue");

      if (v19 == v21)
      {
        v17 = 18;
      }
      else
      {
        -[NPWaldo edgesGeneration](self, "edgesGeneration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntValue");

        if (v23 == 1)
          v17 = 43;
        else
          v17 = 44;
      }
    }
    else
    {
      v17 = 42;
    }
    objc_msgSend(v6, "setLastFallbackReason:", v17);
  }
  -[NPWaldo setShouldSave:](self, "setShouldSave:", 1);
  -[NPWaldo saveToKeychain](self, "saveToKeychain");
  -[NPWaldo configurationIdentifier](self, "configurationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    -[NPWaldo setConfigurationIdentifier:](self, "setConfigurationIdentifier:", v25);

  }
  v26 = [NPKeyBag alloc];
  v27 = -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex");
  v28 = -[NPWaldo generation](self, "generation");
  -[NPWaldo identifier](self, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo updateHash](self, "updateHash");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[NPKeyBag initWithOnRamps:currentNetworkInfo:currentEdgeIndex:currentEdgeList:generation:identifier:updateHash:](v26, "initWithOnRamps:currentNetworkInfo:currentEdgeIndex:currentEdgeList:generation:identifier:updateHash:", v7, v6, v27, v5, v28, v29, v30);
  -[NPWaldo setKeybag:](self, "setKeybag:", v31);

  -[NPWaldo keybag](self, "keybag");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (!a3)
    {
      -[NPWaldo agent](self, "agent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setKeybag:", 0);

    }
    -[NPWaldo keybag](self, "keybag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo identifier](self, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logWithMessage:identifier:", CFSTR("pushCurrentDayPassesToKernel setting keybag in kernel"), v35);

    -[NPWaldo keybag](self, "keybag");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo updateNetworkAgentWithKeybag:networkInfo:](self, "updateNetworkAgentWithKeybag:networkInfo:", v36, v6);

  }
  else
  {
    nplog_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v37, OS_LOG_TYPE_ERROR, "Failed to create a keybag", buf, 2u);
    }

  }
}

- (void)removeDayPassesFromKernel
{
  void *v3;
  int v4;
  NPKeyBag *v5;
  void *v6;
  void *v7;
  NPKeyBag *v8;
  void *v9;
  void *v10;
  id v11;

  -[NPWaldo agentRegistration](self, "agentRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRegistered");

  if (v4)
  {
    v5 = [NPKeyBag alloc];
    -[NPWaldo identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo updateHash](self, "updateHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NPKeyBag initWithOnRamps:currentNetworkInfo:currentEdgeIndex:currentEdgeList:generation:identifier:updateHash:](v5, "initWithOnRamps:currentNetworkInfo:currentEdgeIndex:currentEdgeList:generation:identifier:updateHash:", 0, 0, 0, 0, 0, v6, v7);
    -[NPWaldo setKeybag:](self, "setKeybag:", v8);

    -[NPWaldo keybag](self, "keybag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NPWaldo agent](self, "agent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setKeybag:", 0);

      -[NPWaldo keybag](self, "keybag");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[NPWaldo updateNetworkAgentWithKeybag:networkInfo:](self, "updateNetworkAgentWithKeybag:networkInfo:", v11, 0);

    }
  }
}

- (void)ageOutLatencyMap
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  _QWORD v41[5];

  v41[2] = *MEMORY[0x1E0C80C00];
  -[NPWaldo signatureLimit](self, "signatureLimit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPWaldo signatureLimit](self, "signatureLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 50;
  }

  -[NPWaldo networkInformation](self, "networkInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > v5)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - v5;

    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo networkInformation](self, "networkInformation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v11;
      v38 = 2048;
      v39 = objc_msgSend(v12, "count");
      v40 = 1024;
      LODWORD(v41[0]) = v5;
      WORD2(v41[0]) = 2048;
      *(_QWORD *)((char *)v41 + 6) = v9;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Stored network signature count (%lu) exceeded max (%d), aging %ld network signature", buf, 0x26u);

    }
    -[NPWaldo networkInformation](self, "networkInformation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keysSortedByValueUsingSelector:", sel_compareLastVisited_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v18 = v16;
      v19 = *(_QWORD *)v32;
      *(_QWORD *)&v17 = 138412802;
      v28 = v17;
LABEL_9:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v20);
        -[NPWaldo networkInformation](self, "networkInformation", v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          nplog_obj();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            -[NPWaldo identifier](self, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPWaldo networkInformation](self, "networkInformation");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v21);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastVisited");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v37 = v26;
            v38 = 2112;
            v39 = v21;
            v40 = 2112;
            v41[0] = v27;
            _os_log_debug_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_DEBUG, "%@: Aging out network signature %@ (%@)", buf, 0x20u);

          }
          -[NPWaldo networkInformation](self, "networkInformation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v21);

          if (!--v9)
            break;
        }
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v18)
            goto LABEL_9;
          break;
        }
      }
    }

  }
}

- (BOOL)isLatenciesCompleteForNetwork:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  NSObject *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    || (-[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature")), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NPWaldo networkInformation](self, "networkInformation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "edgeLatencies");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v8;
        if (v8 && objc_msgSend(v8, "count"))
        {
          -[NPWaldo probeTFO](self, "probeTFO");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "BOOLValue");

          v59 = 0u;
          v60 = 0u;
          if (v10)
            v11 = &unk_1E4151678;
          else
            v11 = &unk_1E4151690;
          v57 = 0uLL;
          v58 = 0uLL;
          -[NPWaldo edges](self, "edges");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v58;
            while (2)
            {
              v15 = 0;
              v43 = v13;
              do
              {
                if (*(_QWORD *)v58 != v14)
                {
                  v16 = v15;
                  objc_enumerationMutation(v12);
                  v15 = v16;
                }
                v45 = v15;
                v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v15);
                objc_msgSend(v17, "probeEndpoint");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0)
                {
                  v33 = 0;
                  goto LABEL_47;
                }
                objc_msgSend(v17, "probeEndpoint");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = 0u;
                v54 = 0u;
                v55 = 0u;
                v56 = 0u;
                v48 = v20;
                objc_msgSend(v20, "hosts");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
                if (v22)
                {
                  v23 = *(_QWORD *)v54;
                  v46 = v21;
                  v47 = v12;
                  v40 = *(_QWORD *)v54;
                  v41 = v14;
                  while (2)
                  {
                    v24 = 0;
                    v42 = v22;
                    do
                    {
                      if (*(_QWORD *)v54 != v23)
                      {
                        v25 = v24;
                        objc_enumerationMutation(v21);
                        v24 = v25;
                      }
                      v44 = v24;
                      v26 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * v24);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_45;
                      v51 = 0u;
                      v52 = 0u;
                      v49 = 0u;
                      v50 = 0u;
                      v27 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
                      if (v27)
                      {
                        v28 = v27;
                        v29 = *(_QWORD *)v50;
LABEL_24:
                        v30 = 0;
                        while (1)
                        {
                          if (*(_QWORD *)v50 != v29)
                            objc_enumerationMutation(v11);
                          v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v30);
                          *(_WORD *)buf = 0;
                          buf[0] = objc_msgSend(v31, "BOOLValue");
                          -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          buf[1] = objc_msgSend(v32, "BOOLValue");

                          if (!-[NPWaldo isEndpointProbed:parameters:latencies:checkSampleSize:incompleteLatency:](self, "isEndpointProbed:parameters:latencies:checkSampleSize:incompleteLatency:", v26, buf, v5, 1, 0))break;
                          if (v28 == ++v30)
                          {
                            v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
                            if (v28)
                              goto LABEL_24;
                            goto LABEL_30;
                          }
                        }
LABEL_45:

                        v33 = 0;
                        v12 = v47;
                        goto LABEL_47;
                      }
LABEL_30:

                      v24 = v44 + 1;
                      v14 = v41;
                      v21 = v46;
                      v12 = v47;
                      v23 = v40;
                    }
                    while (v44 + 1 != v42);
                    v22 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
                    if (v22)
                      continue;
                    break;
                  }
                }

                v15 = v45 + 1;
              }
              while (v45 + 1 != v43);
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
              v33 = 1;
              if (v13)
                continue;
              break;
            }
          }
          else
          {
            v33 = 1;
          }
LABEL_47:

          nplog_obj();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            -[NPWaldo identifier](self, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = CFSTR("incomplete");
            *(_DWORD *)buf = 138412802;
            v62 = v36;
            v63 = 2112;
            if (v33)
              v37 = CFSTR("complete");
            v64 = (void *)v37;
            v65 = 2112;
            v66 = v4;
            _os_log_debug_impl(&dword_19E8FE000, v34, OS_LOG_TYPE_DEBUG, "%@: %@ latencies for network %@", buf, 0x20u);

          }
          goto LABEL_40;
        }
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    nplog_obj();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      -[NPWaldo identifier](self, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v62 = v38;
      v63 = 2112;
      v64 = v4;
      _os_log_debug_impl(&dword_19E8FE000, v34, OS_LOG_TYPE_DEBUG, "%@: No latencies for network %@", buf, 0x16u);

    }
    LOBYTE(v33) = 0;
LABEL_40:

    goto LABEL_41;
  }
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[NPWaldo identifier](self, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v62 = v39;
    _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to check latency completeness, no signature", buf, 0xCu);

  }
  LOBYTE(v33) = 0;
LABEL_41:

  return v33;
}

- (void)handleUsageReport:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  const char *v21;
  _BOOL4 v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  BOOL v29;
  NSObject *v30;
  void *v31;
  char *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  char *v40;
  void *v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  os_log_t log;
  _QWORD v47[9];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  const char *v65;
  uint8_t v66[128];
  _BYTE v67[24];
  char v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[NPWaldo generation](self, "generation");
    if (v5 == objc_msgSend(v4, "keybagGeneration"))
    {
      -[NPWaldo cleanupStaleKeys](self, "cleanupStaleKeys");
      v44 = objc_msgSend(v4, "rtt");
      objc_msgSend(v4, "geohash");
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](log, "length"))
      {
        -[NPWaldo locationManager](self, "locationManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setCurrentGeohash:", log);

      }
      v7 = objc_msgSend(v4, "fallbackReason");
      v43 = objc_msgSend(v4, "addressFamily");
      v42 = objc_msgSend(v4, "edgeIndex");
      *(_QWORD *)v67 = 0;
      *(_QWORD *)&v67[8] = v67;
      *(_QWORD *)&v67[16] = 0x2020000000;
      v68 = 0;
      v56 = 0;
      v57 = &v56;
      v58 = 0x2020000000;
      v59 = 0;
      v52 = 0;
      v53 = &v52;
      v54 = 0x2020000000;
      v55 = 0;
      v45 = v7;
      if (!-[NPWaldo isLatenciesCompleteForNetwork:](self, "isLatenciesCompleteForNetwork:", 0))
      {
        nplog_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = (uint64_t)v9;
          _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Latency information incomplete for the current network, re-probing", buf, 0xCu);

        }
        *((_BYTE *)v57 + 24) = 1;
      }
      if (!+[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:](NSPConnectionInfo, "shouldMoveToNextEdgeForFallbackReason:", objc_msgSend(v4, "fallbackReason"))|| (objc_msgSend(v4, "dayPassUUID"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = v10 == 0, v10, v11))
      {
        v21 = (const char *)v45;
        if (!*((_BYTE *)v57 + 24) && v44 != 0xFFFFFFFFLL)
        {
          v22 = -[NPWaldo reprocessWithNewRTT:reProbe:](self, "reprocessWithNewRTT:reProbe:", v44, v57 + 3);
          *(_BYTE *)(*(_QWORD *)&v67[8] + 24) = v22;
          v23 = *((_BYTE *)v57 + 24) || v22;
          if (v23 == 1)
          {
            nplog_obj();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              -[NPWaldo identifier](self, "identifier");
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = (void *)v25;
              if (*((_BYTE *)v57 + 24))
                v27 = "re-probing";
              else
                v27 = "";
              if (*(_BYTE *)(*(_QWORD *)&v67[8] + 24))
                v28 = " refreshing day passes";
              else
                v28 = "";
              *(_DWORD *)buf = 138412802;
              v61 = v25;
              v62 = 2080;
              v63 = v27;
              v64 = 2080;
              v65 = v28;
              _os_log_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_DEFAULT, "%@: Change in observed RTT, %s%s", buf, 0x20u);

            }
            v21 = (const char *)v45;
          }
        }
        if (!*(_BYTE *)(*(_QWORD *)&v67[8] + 24))
        {
          v29 = -[NPWaldo shouldPerformDayPassRefresh](self, "shouldPerformDayPassRefresh");
          *(_BYTE *)(*(_QWORD *)&v67[8] + 24) = v29;
        }
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[NPWaldo allOnRamps](self, "allOnRamps");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v49;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v49 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v16, "dayPassUUID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "dayPassUUID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqual:", v18);

              if (v19)
              {
                if ((objc_msgSend(v16, "isDayPassExpired") & 1) != 0 || v45 == 23 || v45 == 5)
                  *(_BYTE *)(*(_QWORD *)&v67[8] + 24) = 1;
                nplog_obj();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  -[NPWaldo identifier](self, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "dayPassUUID");
                  v32 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v61 = (uint64_t)v31;
                  v62 = 2112;
                  v63 = v32;
                  _os_log_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_DEFAULT, "%@: Invalidating day pass %@", buf, 0x16u);

                }
                objc_msgSend(v16, "invalidateDayPass");
                goto LABEL_46;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v66, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_46:

        -[NPWaldo setCurrentEdgeIndex:](self, "setCurrentEdgeIndex:", v42);
        -[NPWaldo currentNetworkInfo](self, "currentNetworkInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33)
          objc_msgSend(v33, "setLastFallbackReason:", 45);
        -[NPWaldo pushKeybagToKernel](self, "pushKeybagToKernel");
        *((_BYTE *)v53 + 24) = 1;

        v21 = (const char *)v45;
      }
      if (v21 == (const char *)26)
      {
        nplog_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v61 = (uint64_t)v36;
          v62 = 1024;
          LODWORD(v63) = v43;
          _os_log_impl(&dword_19E8FE000, v35, OS_LOG_TYPE_DEFAULT, "%@: client reports that TFO failed, marking TFO as failed for current latency map where address family = %d", buf, 0x12u);

        }
        -[NPWaldo currentNetworkInfo](self, "currentNetworkInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleTFOFailedForAddressFamily:", v43);
        -[NPWaldo rebuildLatencyMapAllSignatures:](self, "rebuildLatencyMapAllSignatures:", 0);
        *((_BYTE *)v53 + 24) = 1;

        v21 = (const char *)v45;
      }
      if (+[NSPConnectionInfo shouldResolveForFallbackReason:](NSPConnectionInfo, "shouldResolveForFallbackReason:", v21))
      {
        nplog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", v21);
          v40 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v61 = (uint64_t)v39;
          v62 = 2048;
          v63 = v21;
          v64 = 2112;
          v65 = v40;
          _os_log_impl(&dword_19E8FE000, v38, OS_LOG_TYPE_DEFAULT, "%@: usage update contains fallback reason %ld (%@), un-resolving edges", buf, 0x20u);

        }
        -[NPWaldo setReResolve:](self, "setReResolve:", 1);
      }
      if (*((_BYTE *)v57 + 24) || *(_BYTE *)(*(_QWORD *)&v67[8] + 24) || *((_BYTE *)v53 + 24))
        -[NPWaldo setReResolve:](self, "setReResolve:", 1);
      -[NPWaldo edgesGeneration](self, "edgesGeneration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo setUsedEdgesGeneration:](self, "setUsedEdgesGeneration:", v41);

      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __29__NPWaldo_handleUsageReport___block_invoke;
      v47[3] = &unk_1E4138448;
      v47[4] = self;
      v47[5] = &v56;
      v47[6] = v67;
      v47[7] = &v52;
      v47[8] = v44;
      -[NPWaldo resolveWithCompletionHandler:](self, "resolveWithCompletionHandler:", v47);
      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(v67, 8);
    }
    else
    {
      nplog_obj();
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        -[NPWaldo identifier](self, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v67 = 138412802;
        *(_QWORD *)&v67[4] = v20;
        *(_WORD *)&v67[12] = 1024;
        *(_DWORD *)&v67[14] = objc_msgSend(v4, "keybagGeneration");
        *(_WORD *)&v67[18] = 1024;
        *(_DWORD *)&v67[20] = -[NPWaldo generation](self, "generation");
        _os_log_impl(&dword_19E8FE000, log, OS_LOG_TYPE_DEFAULT, "%@: Usage report keybag generation (%u) != current keybag generation (%u), ignoring report", v67, 0x18u);

      }
    }

  }
}

uint64_t __29__NPWaldo_handleUsageReport___block_invoke(uint64_t a1, int a2, int a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "linkAllSignatures:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isLatenciesCompleteForNetwork:", 0) ^ 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "shouldPerformDayPassRefresh");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    return objc_msgSend(*(id *)(a1 + 32), "updateMetaDataNeedProbe:refresh:push:minRTT:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 64));
  }
  else
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "%@: resolution failed while handling a usage update", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setReResolve:", 1);
    objc_msgSend(*(id *)(a1 + 32), "linkAllSignatures:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "pushKeybagToKernel");
  }
}

- (void)updateMetaDataNeedProbe:(BOOL)a3 refresh:(BOOL)a4 push:(BOOL)a5 minRTT:(unint64_t)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NPNetworkInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[6];
  BOOL v30;
  BOOL v31;
  BOOL v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  -[NPWaldo locationManager](self, "locationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldCheckLocation");

  if (v12)
  {
    nplog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v14;
      _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEFAULT, "%@: Location condition changed, re-evaluate view", buf, 0xCu);

    }
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    -[NPWaldo locationManager](self, "locationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke;
    v29[3] = &unk_1E4138498;
    v30 = v9;
    v31 = v8;
    v32 = v7;
    v29[4] = self;
    v29[5] = a6;
    objc_msgSend(v15, "sortEdgesByDistanceWithCompletionHandler:", v29);

    v16 = 1;
    goto LABEL_16;
  }
  if (v8)
  {
    nplog_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "%@: One or more day passes has expired, refreshing", buf, 0xCu);

    }
    -[NPWaldo refreshDayPassesWithCompletionHandler:](self, "refreshDayPassesWithCompletionHandler:", 0);
  }
  else if (v7)
  {
    nplog_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEFAULT, "%@: Pushing keybag to the kernel", buf, 0xCu);

    }
    -[NPWaldo pushKeybagToKernel](self, "pushKeybagToKernel");
  }
  v16 = 0;
LABEL_16:
  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = objc_alloc_init(NPNetworkInfo);
      -[NPWaldo networkInformation](self, "networkInformation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v21);

    }
    -[NPWaldo networkInformation](self, "networkInformation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      objc_msgSend(v27, "setLastUsed:", v28);

    }
  }
  if ((v16 & 1) == 0)
    -[NPWaldo updateEdgeSelection:](self, "updateEdgeSelection:", a6);
  -[NPWaldo saveToKeychain](self, "saveToKeychain");

}

uint64_t __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentEdgeList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count") || *(_BYTE *)(a1 + 48) && (a2 & 1) != 0)
  {

LABEL_5:
    v5 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke_2;
    v12[3] = &unk_1E4138470;
    v12[4] = v5;
    return objc_msgSend(v5, "reprocessWithCompletionHandler:", v12);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_5;
  }
  else
  {

  }
  if (*(_BYTE *)(a1 + 49))
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Not re-probing, check for day pass refresh", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "refreshDayPassesWithCompletionHandler:", 0);
  }
  else if (*(_BYTE *)(a1 + 50))
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Pushing keybag to the kernel", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "pushKeybagToKernel");
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateEdgeSelection:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__NPWaldo_updateMetaDataNeedProbe_refresh_push_minRTT___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "edgeCount");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "refreshDayPassesWithCompletionHandler:", 0);
  else
    return objc_msgSend(v3, "pushKeybagToKernel");
}

- (int64_t)indexOfBestEdge
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[NPWaldo currentEdgeList](self, "currentEdgeList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount") >= 1)
  {
    v4 = 0;
    while (1)
    {
      -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getCurrentOnRamp:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        if ((objc_msgSend(v7, "isDayPassExpired") & 1) == 0)
          break;
      }

      if (++v4 >= -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount"))
        goto LABEL_7;
    }

  }
  else
  {
LABEL_7:
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (int64_t)dayPassFetchCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;

  -[NPWaldo currentEdgeList](self, "currentEdgeList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_msgSend(v4, "count");
    -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 >= objc_msgSend(v6, "count"))
    {
      -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "count");

    }
    else
    {
      v7 = objc_msgSend(v4, "count");
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NPTuscanyEdge)currentEdge
{
  int64_t v3;
  void *v4;

  v3 = -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex");
  if (v3 >= -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount"))
  {
    v4 = 0;
  }
  else
  {
    -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NPTuscanyEdge *)v4;
}

- (BOOL)shouldPerformDayPassRefresh
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  if (!-[NPWaldo edgeCount](self, "edgeCount"))
  {
LABEL_10:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (-[NPWaldo dayPassFetchCount](self, "dayPassFetchCount") >= 1)
  {
    v3 = 0;
    while (1)
    {
      -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo currentEdgeList](self, "currentEdgeList");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getCurrentOnRamp:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v10 = objc_msgSend(v7, "isDayPassPastExpiry:");

      if (!v10 && ++v3 < -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount"))
        continue;
      return v10;
    }

    goto LABEL_10;
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (void)timestampNetworkSignature:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NPNetworkInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[NPWaldo networkInformation](self, "networkInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NPWaldo setNetworkInformation:](self, "setNetworkInformation:", v5);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo networkInformation](self, "networkInformation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastVisited:", v9);

    }
  }
  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Signature"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NPWaldo networkInformation](self, "networkInformation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = objc_alloc_init(NPNetworkInfo);
        -[NPWaldo networkInformation](self, "networkInformation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPWaldo networkInformation](self, "networkInformation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLastVisited:", v17);

    }
  }
  else
  {
    v12 = v6;
  }

}

- (void)setCurrentNetworkCharacteristics:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  nplog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NPWaldo identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[NPUtilities copyNetworkDescription:](NPUtilities, "copyNetworkDescription:", v5);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Waldo info setting current network characteristics to %@", (uint8_t *)&v9, 0x16u);

  }
  if (v5)
  {
    -[NPWaldo cancelProbes](self, "cancelProbes");
    -[NPWaldo timestampNetworkSignature:](self, "timestampNetworkSignature:", v5);
    objc_storeStrong((id *)&self->_currentNetworkCharacteristics, a3);
    -[NPWaldo setReResolve:](self, "setReResolve:", 1);
  }

}

- (int64_t)getCurrentNetworkInterfaceType
{
  NSDictionary *currentNetworkCharacteristics;
  void *v3;
  void *v4;
  int64_t v5;

  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("InterfaceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (void)cancelProbes
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[NPWaldo reprocessPending](self, "reprocessPending"))
  {
    -[NPWaldo setReprocessCancelled:](self, "setReprocessCancelled:", 1);
    -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[NPWaldo networkInformation](self, "networkInformation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProbeRateLimit:", 0);

    }
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[NPWaldo identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEBUG, "%@: Cancelling probe", (uint8_t *)&v10, 0xCu);

    }
  }
  -[NPWaldo reprocessSamplingTimer](self, "reprocessSamplingTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NPWaldo reprocessSamplingTimer](self, "reprocessSamplingTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    -[NPWaldo setReprocessSamplingTimer:](self, "setReprocessSamplingTimer:", 0);
  }
}

- (void)initializeEdgeSelection
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NPEdgeSelection *v7;
  void *v8;
  void *v9;
  NPNetworkInfo *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("InterfaceType"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = -[NPEdgeSelection initWithWaldo:signature:interfaceType:]([NPEdgeSelection alloc], "initWithWaldo:signature:interfaceType:", self, v5, v6);
      if (v7)
      {
        -[NPWaldo networkInformation](self, "networkInformation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v10 = objc_alloc_init(NPNetworkInfo);
          -[NPWaldo networkInformation](self, "networkInformation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v5);

        }
        -[NPWaldo networkInformation](self, "networkInformation");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEdgeSelection:", v7);

      }
      else
      {
        nplog_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = 138412546;
          v15 = v5;
          v16 = 2112;
          v17 = v6;
          _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Edge selection initialize failed for %@ (%@)", (uint8_t *)&v14, 0x16u);
        }
      }

    }
    else
    {
      nplog_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "Edge selection initialize, no current network characteristics", (uint8_t *)&v14, 2u);
      }
    }

  }
}

- (void)updateEdgeSelection:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  __int16 v17;
  __int16 v18;

  -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NPWaldo networkInformation](self, "networkInformation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "edgeSelection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[NPWaldo networkInformation](self, "networkInformation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "edgeSelection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateEdgeSelection:", a3);

LABEL_9:
        return;
      }
      nplog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      v17 = 0;
      v15 = "Edge selection update, no edge selection";
      v16 = (uint8_t *)&v17;
    }
    else
    {
      nplog_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v18 = 0;
      v15 = "Edge selection update, no current network characteristics";
      v16 = (uint8_t *)&v18;
    }
    _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    goto LABEL_8;
  }
}

- (id)copyEdgeSelectionTelemetry
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  -[NPWaldo edgeSelectionEnabled](self, "edgeSelectionEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "edgeSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyEdgeSelectionTelemetry");

  }
  else
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Edge selection initialize, no current network characteristics", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)reprocessWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  char v6;
  NSDictionary *currentNetworkCharacteristics;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  NPWaldo *v30;
  id v31;
  void (**v32)(id, _QWORD);
  _BYTE *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    nplog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[NPWaldo identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_INFO, "%@: Latency derivation is disabled, not probing", buf, 0xCu);

    }
    goto LABEL_12;
  }
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
  {
    nplog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_19E8FE000, v16, OS_LOG_TYPE_DEFAULT, "%@: No current network characteristics, not probing", buf, 0xCu);

    }
LABEL_12:

    v4[2](v4, 0);
    goto LABEL_28;
  }
  -[NSDictionary objectForKeyedSubscript:](currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "probeRateLimit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "compare:", v12),
            v12,
            v13 == 1))
      {
        nplog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEFAULT, "%@: Skipping re-probing of edges because the re-probe date (%@) has not passed", buf, 0x16u);

        }
        v4[2](v4, 0);
      }
      else
      {
        nplog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_DEFAULT, "%@: Re-probe date (%@) has passed, re-probing edges", buf, 0x16u);

        }
        v22 = objc_alloc(MEMORY[0x1E0C99D68]);
        -[NPWaldo probePause](self, "probePause");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v24 = (void *)objc_msgSend(v22, "initWithTimeIntervalSinceNow:");
        objc_msgSend(v10, "setProbeRateLimit:", v24);

        objc_msgSend(v10, "setIsProbeInProgress:", 1);
        -[NPWaldo setShouldSave:](self, "setShouldSave:", 1);
        -[NPWaldo saveToKeychain](self, "saveToKeychain");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v35 = __Block_byref_object_copy__4;
        v36 = __Block_byref_object_dispose__4;
        v37 = (id)os_transaction_create();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __42__NPWaldo_reprocessWithCompletionHandler___block_invoke;
        v28[3] = &unk_1E41384C0;
        v29 = v10;
        v30 = self;
        v31 = v8;
        v32 = v4;
        v33 = buf;
        -[NPWaldo reprocessEdgeAtIndex:networkSignature:completionHandler:](self, "reprocessEdgeAtIndex:networkSignature:completionHandler:", 0xFFFFFFFFLL, v31, v28);

        _Block_object_dispose(buf, 8);
      }

    }
    else
    {
      nplog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[NPWaldo identifier](self, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v27;
        _os_log_error_impl(&dword_19E8FE000, v25, OS_LOG_TYPE_ERROR, "%@: No network info available for the current network signature, cannot probe", buf, 0xCu);

      }
      v4[2](v4, 0);
    }

  }
  else
  {
    nplog_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[NPWaldo identifier](self, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_ERROR, "%@: No network signature available, cannot probe", buf, 0xCu);

    }
    v4[2](v4, 0);
  }

LABEL_28:
}

void __42__NPWaldo_reprocessWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsProbeInProgress:", 0);
  v5 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v5, "setLastFallbackReason:", a3);
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "mergeEdgeList:forNetworkSignature:", v10, *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "setShouldSave:", 1);
      objc_msgSend(*(id *)(a1 + 40), "saveToKeychain");
    }
    goto LABEL_6;
  }
  objc_msgSend(v5, "setLastFallbackReason:", 0);
  if (!objc_msgSend(v10, "count"))
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 40), "loadObservedRTTSamples:", v10);
  objc_msgSend(*(id *)(a1 + 40), "mergeEdgeList:forNetworkSignature:", v10, *(_QWORD *)(a1 + 48));
  v6 = 1;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "waldo:didFinishProbingWithSuccess:", *(_QWORD *)(a1 + 40), v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)reprocessAdHocWithEdgeIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__4;
  v12[4] = __Block_byref_object_dispose__4;
  v13 = (id)os_transaction_create();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__NPWaldo_reprocessAdHocWithEdgeIndex_completionHandler___block_invoke;
  v9[3] = &unk_1E41384E8;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = v12;
  -[NPWaldo reprocessEdgeAtIndex:networkSignature:completionHandler:](self, "reprocessEdgeAtIndex:networkSignature:completionHandler:", a3, v7, v9);

  _Block_object_dispose(v12, 8);
}

void __57__NPWaldo_reprocessAdHocWithEdgeIndex_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v10 = v5;
  if (a3 || !objc_msgSend(v5, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "latencyComparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingComparator:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)reprocessEdgeAtIndex:(unint64_t)a3 networkSignature:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  -[NPWaldo reprocessQueue](self, "reprocessQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke;
  v13[3] = &unk_1E4138538;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "reprocessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  NPGetInternalQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4138538;
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v9 = v5;
  dispatch_async(v3, v6);

}

void __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasNetworkPath");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", CFSTR("Signature"));
    v4 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", v4) & 1) != 0)
    {
      v22 = 0;
      objc_msgSend(*(id *)(a1 + 32), "createEdgeLatenciesToProbeWithEdgeIndex:startSampleCount:", *(_QWORD *)(a1 + 56), &v22);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      nplog_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v24 = v17;
          v25 = 2048;
          v26 = v22;
          v27 = 2112;
          v28 = v5;
          _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "%@: probing latency list starting at %luth sample: %@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "setReprocessPending:", 1);
        objc_msgSend(*(id *)(a1 + 32), "setReprocessCancelled:", 0);
        v9 = *(void **)(a1 + 32);
        v10 = v22;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_733;
        v19[3] = &unk_1E4138510;
        v19[4] = v9;
        v20 = v5;
        v21 = *(id *)(a1 + 48);
        objc_msgSend(v9, "reprocessLatencies:sampleCount:completionHandler:", v20, v10, v19);

      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v18;
          _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "%@: no probe endpoints to probe", buf, 0xCu);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_msgSend(*(id *)(a1 + 32), "reprocessQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v16);

      }
    }
    else
    {
      nplog_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        _os_log_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_DEFAULT, "%@: Network signature has changed since probing was initiated, not probing", buf, 0xCu);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "reprocessQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v15);

    }
  }
  else
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "%@: Skip RTT reprocess, no usable network path", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "reprocessQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v4);
  }

}

void __67__NPWaldo_reprocessEdgeAtIndex_networkSignature_completionHandler___block_invoke_733(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setReprocessPending:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v7, "TFOStatus", (_QWORD)v9))
          objc_msgSend(v7, "setTFOStatus:", 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "reprocessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v8);

}

- (BOOL)isEndpointProbed:(id)a3 parameters:(networkParameters *)a4 latencies:(id)a5 checkSampleSize:(BOOL)a6 incompleteLatency:(id *)a7
{
  _BOOL4 v8;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  id v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  _BOOL4 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v8 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "count");
    v15 = 0;
    if (v11 && v14)
    {
      v36 = v8;
      if (a7)
        *a7 = 0;
      v35 = a7;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v16 = v13;
      v17 = -[__CFString countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v38;
LABEL_8:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v20);
          objc_msgSend(v21, "probeEndpoint");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v21, "isMatched:parameters:", v11, a4))
              break;
          }

          if (v18 == ++v20)
          {
            v18 = -[__CFString countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            if (v18)
              goto LABEL_8;
            goto LABEL_15;
          }
        }
        if (!v36 || objc_msgSend(v21, "isComplete:", 1))
        {
          nplog_obj();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v21, "connectionParametersString");
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "roundTripAverage");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "samples");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "count");
            *(_DWORD *)buf = 138412802;
            v42 = v22;
            v43 = 2112;
            v44 = v27;
            v45 = 2048;
            v46 = v30;
            _os_log_debug_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEBUG, "Found complete latency for %@ <%@, sample size %lu>", buf, 0x20u);

          }
          v15 = 1;
          goto LABEL_27;
        }
        nplog_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v21, "connectionParametersString");
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "roundTripAverage");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "samples");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "count");
          *(_DWORD *)buf = 138412802;
          v42 = v22;
          v43 = 2112;
          v44 = v31;
          v45 = 2048;
          v46 = v34;
          _os_log_debug_impl(&dword_19E8FE000, v25, OS_LOG_TYPE_DEBUG, "Found incomplete latency for %@ <%@, sample size %lu>", buf, 0x20u);

        }
        if (v35)
        {
          v26 = objc_retainAutorelease(v21);
          v15 = 0;
          *v35 = v26;
          goto LABEL_27;
        }
      }
      else
      {
LABEL_15:

        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<TFO %d, NoCookie %d>"), a4->var0, a4->var1);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = &stru_1E4138CF8;
        }
        nplog_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v42 = v11;
          v43 = 2112;
          v44 = v16;
          _os_log_debug_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_DEBUG, "Latency not found for %@ %@", buf, 0x16u);
        }
      }
      v15 = 0;
LABEL_27:

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)createEdgeLatenciesToProbeWithEdgeIndex:(unint64_t)a3 startSampleCount:(unint64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  BOOL v26;
  id v27;
  id v28;
  NPEdgeLatency *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v55;
  unint64_t v56;
  id obj;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  unint64_t v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  unint64_t v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v6, "unsignedIntegerValue");

  -[NPWaldo currentNetworkInfo](self, "currentNetworkInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v7;
  if (v7)
  {
    objc_msgSend(v7, "edgeLatencies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
  if (a3)
  {
    if (a3 != 0xFFFFFFFF)
    {
      -[NPWaldo edges](self, "edges");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "count") > a3;
    }
    if (a3 != 0xFFFFFFFF)

  }
  if (v9)
  {
    v10 = a3 + 1;
  }
  else
  {
    v10 = -[NPWaldo probeSize](self, "probeSize");
    a3 = 0;
  }
  -[NPWaldo probeTFO](self, "probeTFO");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v13 = &unk_1E41516C0;
  if (v12)
    v13 = &unk_1E41516A8;
  v65 = v13;
  if (a3 >= v10)
  {
    v14 = 0;
LABEL_56:
    v52 = 0;
    goto LABEL_57;
  }
  v56 = v10;
  v14 = 0;
  v63 = v8;
  do
  {
    -[NPWaldo edges](self, "edges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "probeEndpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v16, "probeEndpoint");
      v19 = objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      -[NSObject hosts](v19, "hosts");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      if (v61)
      {
        v58 = *(_QWORD *)v74;
        v59 = v19;
        v60 = v16;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v74 != v58)
              objc_enumerationMutation(obj);
            v21 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * v20);
            objc_opt_class();
            v62 = v20;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v71 = 0u;
              v72 = 0u;
              v69 = 0u;
              v70 = 0u;
              v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
              if (v67)
              {
                v22 = *(_QWORD *)v70;
                v64 = *(_QWORD *)v70;
                do
                {
                  for (i = 0; i != v67; ++i)
                  {
                    if (*(_QWORD *)v70 != v22)
                      objc_enumerationMutation(v65);
                    v24 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                    *(_WORD *)buf = 0;
                    buf[0] = objc_msgSend(v24, "BOOLValue");
                    -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    buf[1] = objc_msgSend(v25, "BOOLValue");

                    v68 = 0;
                    v26 = -[NPWaldo isEndpointProbed:parameters:latencies:checkSampleSize:incompleteLatency:](self, "isEndpointProbed:parameters:latencies:checkSampleSize:incompleteLatency:", v21, buf, v8, 1, &v68);
                    v27 = v68;
                    if (!v26)
                    {
                      v28 = v14;
                      v29 = -[NPEdgeLatency initWithProbeEndpoint:probeTFO:]([NPEdgeLatency alloc], "initWithProbeEndpoint:probeTFO:", v21, objc_msgSend(v24, "BOOLValue"));
                      -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NPEdgeLatency setProbeNoTFOCookie:](v29, "setProbeNoTFOCookie:", objc_msgSend(v30, "BOOLValue"));

                      v31 = a3;
                      -[NPEdgeLatency setEdgeIndex:](v29, "setEdgeIndex:", a3);
                      -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v32)
                      {
                        -[NPWaldo reprocessSampleSize](self, "reprocessSampleSize");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = objc_msgSend(v33, "unsignedIntegerValue");
                        -[NPEdgeLatency roundTripAverage](v29, "roundTripAverage");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "setSize:", v34);

                      }
                      -[NPWaldo observedRTTSampleSize](self, "observedRTTSampleSize");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v36)
                      {
                        -[NPWaldo observedRTTSampleSize](self, "observedRTTSampleSize");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        v38 = objc_msgSend(v37, "unsignedIntegerValue");
                        -[NPEdgeLatency roundTripAverageObserved](v29, "roundTripAverageObserved");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "setSize:", v38);

                      }
                      if (v27)
                      {
                        objc_msgSend(v27, "roundTripAverage");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v41 = objc_msgSend(v40, "isAnyValid");

                        if (v41)
                        {
                          -[NPEdgeLatency roundTripAverage](v29, "roundTripAverage");
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v27, "roundTripAverage");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v43, "samples");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v42, "addSamples:", v44);

                        }
                      }
                      -[NPEdgeLatency roundTripAverage](v29, "roundTripAverage");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "samples");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = objc_msgSend(v46, "count");

                      if (v66 > v47)
                      {
                        -[NPEdgeLatency roundTripAverage](v29, "roundTripAverage");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v48, "samples");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v66 = objc_msgSend(v49, "count");

                      }
                      a3 = v31;
                      v14 = v28;
                      if (!v28)
                        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend(v14, "addObject:", v29);

                      v8 = v63;
                      v22 = v64;
                    }

                  }
                  v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
                }
                while (v67);
              }
            }

            v20 = v62 + 1;
            v19 = v59;
            v16 = v60;
          }
          while (v62 + 1 != v61);
          v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
        }
        while (v61);
      }

    }
    else
    {
      nplog_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[NPWaldo identifier](self, "identifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "probeEndpoint");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v80 = v50;
        v81 = 2048;
        v82 = a3;
        v83 = 2112;
        v84 = v51;
        _os_log_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEFAULT, "%@: skipping edge %lu because it has a un-resolved probe endpoint %@", buf, 0x20u);

      }
    }

    ++a3;
  }
  while (a3 != v56);
  if (!v14)
    goto LABEL_56;
  if (a4)
    *a4 = v66;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v14);
LABEL_57:

  return v52;
}

- (void)reprocessLatencies:(id)a3 sampleCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke;
  v12[3] = &unk_1E4138538;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[NPWaldo startProbingEdges:atIndex:doneCount:sampleCount:completionHandler:](self, "startProbingEdges:atIndex:doneCount:sampleCount:completionHandler:", v11, 0, 0, a4, v12);

}

void __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD handler[5];

  objc_msgSend(*(id *)(a1 + 32), "logEdgeList:debug:toStdout:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waldo:didFinishSampleProbingWithSuccess:", *(_QWORD *)(a1 + 32), 1);

  if ((objc_msgSend(*(id *)(a1 + 32), "reprocessCancelled") & 1) != 0
    || (v3 = *(_QWORD *)(a1 + 56) + 1,
        objc_msgSend(*(id *)(a1 + 32), "reprocessSampleSize"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "unsignedIntegerValue"),
        v4,
        v3 >= v5))
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "getFallbackReasonForLatencies:", *(_QWORD *)(a1 + 40)));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reprocessSamplingInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1000000000 * objc_msgSend(v6, "unsignedLongLongValue");

    NPGetInternalQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
    objc_msgSend(*(id *)(a1 + 32), "setReprocessSamplingTimer:", v9);

    objc_msgSend(*(id *)(a1 + 32), "reprocessSamplingTimer");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_time(0, v7);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    objc_msgSend(*(id *)(a1 + 32), "reprocessSamplingTimer");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_2;
    handler[3] = &unk_1E4137410;
    handler[4] = *(_QWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v12, handler);

    objc_msgSend(*(id *)(a1 + 32), "reprocessSamplingTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_3;
    v18[3] = &unk_1E4138538;
    v18[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 56);
    v19 = v15;
    v21 = v16;
    dispatch_source_set_cancel_handler(v14, v18);

    objc_msgSend(*(id *)(a1 + 32), "reprocessSamplingTimer");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v17);

  }
}

uint64_t __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "reprocessSamplingTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  return objc_msgSend(*(id *)(a1 + 32), "setReprocessSamplingTimer:", 0);
}

uint64_t __60__NPWaldo_reprocessLatencies_sampleCount_completionHandler___block_invoke_3(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "reprocessCancelled");
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Reprocessing has been aborted", (uint8_t *)&v8, 0xCu);

    }
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "getFallbackReasonForLatencies:", *(_QWORD *)(a1 + 40)));
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Reprocessing due to reprocess sampling timer", (uint8_t *)&v8, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "reprocessLatencies:sampleCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
  }
}

- (int64_t)getFallbackReasonForLatencies:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NPWaldo reprocessCancelled](self, "reprocessCancelled"))
  {
    v5 = 19;
  }
  else if (-[NPWaldo validateEdgeList:](self, "validateEdgeList:", v4))
  {
    v5 = 0;
  }
  else
  {
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[NPWaldo identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to measure RTT", (uint8_t *)&v14, 0xCu);

    }
    -[NPWaldo delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "status") == 1)
    {
      objc_msgSend(v8, "interface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "type");

      v11 = 39;
      if (v10 != 2)
        v11 = 40;
      if (v10 == 1)
        v5 = 21;
      else
        v5 = v11;
    }
    else
    {
      v5 = 41;
    }

  }
  return v5;
}

- (BOOL)reprocessWithNewRTT:(unint64_t)a3 reProbe:(BOOL *)a4
{
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSObject *p_super;
  void *v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v34;
  double v35;
  double v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  unint64_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  void *v69;
  double v70;
  unint64_t v71;
  unint64_t v72;
  double v73;
  void *v74;
  double v75;
  NSObject *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  unint64_t v81;
  void *v82;
  double v83;
  unint64_t v84;
  _BOOL8 v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  char v92;
  void *v93;
  BOOL v94;
  BOOL v95;
  unint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  void *v103;
  unint64_t v104;
  NSObject *v105;
  void *v106;
  void *v107;
  unint64_t v108;
  unint64_t v109;
  void *v110;
  void *v111;
  double v112;
  unint64_t v113;
  unint64_t v114;
  void *v115;
  unint64_t v116;
  NSObject *v117;
  void *v118;
  void *v119;
  unint64_t v120;
  double v121;
  void *v122;
  double v123;
  unint64_t v124;
  void *v125;
  void *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  unint64_t v135;
  void *v136;
  unint64_t v137;
  unint64_t v138;
  void *v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  void *v144;
  void *v145;
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  void *v149;
  __int16 v150;
  unint64_t v151;
  __int16 v152;
  unint64_t v153;
  __int16 v154;
  unint64_t v155;
  __int16 v156;
  unint64_t v157;
  __int16 v158;
  unint64_t v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  -[NPWaldo TFOLeeway](self, "TFOLeeway");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  if (v8 <= 0.0)
  {
    v11 = 0.66;
  }
  else
  {
    -[NPWaldo TFOLeeway](self, "TFOLeeway");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  *a4 = 0;
  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "BOOLValue"))
  {
    p_super = &self->_currentNetworkCharacteristics->super;

    if (p_super)
    {
      -[NPWaldo currentEdgeList](self, "currentEdgeList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14
        || -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex") < 0
        || (v15 = -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex"), v15 >= objc_msgSend(v14, "count")))
      {
        LOBYTE(p_super) = 0;
LABEL_18:

        return (char)p_super;
      }
      v16 = -[NPWaldo currentEdgeIndex](self, "currentEdgeIndex");
      -[NPWaldo currentEdge](self, "currentEdge");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a3)
      {
        nplog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "label");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v147 = v24;
          v148 = 2112;
          v149 = v25;
          v150 = 2048;
          v151 = 0;
          _os_log_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEFAULT, "%@: Skip re-processing latency to %@ with current connection observed RTT %lu", buf, 0x20u);
          goto LABEL_22;
        }
LABEL_24:
        LOBYTE(p_super) = 0;
LABEL_25:

        goto LABEL_18;
      }
      -[NPWaldo latencyFactorA](self, "latencyFactorA");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      if (v20 == 0.0)
        goto LABEL_13;
      -[NPWaldo latencyFactorB](self, "latencyFactorB");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      if (v22 == 0.0)
      {

LABEL_13:
        goto LABEL_14;
      }
      -[NPWaldo latencyFactorX](self, "latencyFactorX");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = v35;

      if (v36 == 0.0)
      {
LABEL_14:
        nplog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[NPWaldo identifier](self, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPWaldo latencyFactorA](self, "latencyFactorA");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;
          -[NPWaldo latencyFactorB](self, "latencyFactorB");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v30 = v29;
          -[NPWaldo latencyFactorX](self, "latencyFactorX");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          *(_DWORD *)buf = 138413058;
          v147 = v24;
          v148 = 2048;
          v149 = v27;
          v150 = 2048;
          v151 = v30;
          v152 = 2048;
          v153 = v32;
          _os_log_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEFAULT, "%@: Skip re-processing latency because the latency factors are invalid (A = %f, B = %f, X = %f)", buf, 0x2Au);

LABEL_22:
LABEL_23:

          goto LABEL_24;
        }
        goto LABEL_24;
      }
      v140 = v16;
      objc_msgSend(v18, "addRoundTripSampleObserved:", a3);
      objc_msgSend(v18, "roundTripAverageObserved");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "average");

      v39 = objc_msgSend(v18, "roundTripTime");
      v40 = objc_msgSend(v18, "probeTFO");
      v41 = (unint64_t)fmax(v11 * (double)v38, 1.0);
      v42 = fmax(v11 * (double)v39, 1.0);
      if (v40)
        v43 = (unint64_t)v42;
      else
        v43 = v39;
      if (v40)
        v44 = v41;
      else
        v44 = v38;
      nplog_obj();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        -[NPWaldo identifier](self, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "label");
        v142 = v43;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v147 = v46;
        v148 = 2112;
        v149 = v47;
        v150 = 2048;
        v151 = a3;
        v152 = 2048;
        v153 = v44;
        _os_log_impl(&dword_19E8FE000, v45, OS_LOG_TYPE_DEFAULT, "%@: Re-processing latency to %@ with current connection observed RTT %lu (avg RTT %lu)", buf, 0x2Au);

        v43 = v142;
      }

      if (!v44)
      {
        nplog_obj();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          goto LABEL_24;
        -[NPWaldo identifier](self, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v147 = v24;
        _os_log_debug_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEBUG, "%@: Skip re-processing latency due to insufficient observed RTT samples", buf, 0xCu);
        goto LABEL_23;
      }
      v141 = v44;
      v130 = v18;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLastUsed:", v48);

      -[NPWaldo latencyFactorX](self, "latencyFactorX");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v51 = (unint64_t)(v50 * (double)(unint64_t)objc_msgSend(v14, "count"));

      -[NPWaldo cachedLocation](self, "cachedLocation");
      v52 = objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v53 = (void *)v52;
        -[NPWaldo viewSize](self, "viewSize");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "unsignedIntegerValue");

        if (v55)
        {
          -[NPWaldo viewSize](self, "viewSize");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v56, "unsignedIntegerValue") - 1;

        }
      }
      if (v140 >= v51)
      {
        v59 = 0;
      }
      else
      {
        v57 = objc_msgSend(v14, "count");
        v58 = v51;
        if (v51 >= v57)
          v58 = objc_msgSend(v14, "count", v51) - 1;
        objc_msgSend(v14, "objectAtIndexedSubscript:", v58);
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59)
        {
          -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v51);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[NSObject roundTripTime](v59, "roundTripTime");
          if (-[NSObject probeTFO](v59, "probeTFO"))
            v61 = (unint64_t)fmax(v11 * (double)v61, 1.0);
          nplog_obj();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            -[NPWaldo identifier](self, "identifier");
            v137 = v61;
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "label");
            v143 = v43;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPWaldo latencyFactorB](self, "latencyFactorB");
            v127 = v59;
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "doubleValue");
            v67 = v66;
            objc_msgSend(v60, "label");
            v131 = v17;
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413826;
            v147 = v63;
            v148 = 2112;
            v149 = v64;
            v150 = 2048;
            v151 = v141;
            v152 = 2048;
            v153 = v67;
            v154 = 2112;
            v155 = (unint64_t)v68;
            v156 = 2048;
            v157 = v137;
            v158 = 2048;
            v159 = v51;
            _os_log_impl(&dword_19E8FE000, v62, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is greater than %f times the latency to %@ (rtt %lu) (index %lu)", buf, 0x48u);

            v17 = v131;
            v59 = v127;

            v43 = v143;
            v61 = v137;
          }

          -[NPWaldo latencyFactorB](self, "latencyFactorB");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "doubleValue");
          v71 = (unint64_t)(v70 * (double)v61);

          if (v141 > v71)
          {
            v18 = v130;
            if ((objc_msgSend(v130, "passedReprobeThreshold") & 1) != 0)
            {
              v72 = v140;
LABEL_63:
              v86 = v59;
              nplog_obj();
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                -[NPWaldo identifier](self, "identifier");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "label");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v147 = v88;
                v148 = 2112;
                v149 = v89;
                _os_log_impl(&dword_19E8FE000, v87, OS_LOG_TYPE_DEFAULT, "%@: Edge %@ observed RTT has passed reprobe threshold", buf, 0x16u);

              }
              if (-[NPWaldo dayPassFetchCount](self, "dayPassFetchCount") < 1)
              {
LABEL_69:
                nplog_obj();
                p_super = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
                {
                  -[NPWaldo identifier](self, "identifier");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v147 = v93;
                  _os_log_impl(&dword_19E8FE000, p_super, OS_LOG_TYPE_DEFAULT, "%@: Re-measuring latency due to all top edge observed RTTs exceeded threshold", buf, 0xCu);

                }
                LOBYTE(p_super) = 0;
                v94 = 1;
                v23 = v86;
LABEL_101:
                *a4 = v94;
                goto LABEL_25;
              }
              v90 = 0;
              while (1)
              {
                objc_msgSend(v14, "objectAtIndexedSubscript:", v90, v127);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = objc_msgSend(v91, "passedReprobeThreshold");

                if ((v92 & 1) == 0)
                  break;
                if (++v90 >= -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount"))
                  goto LABEL_69;
              }
              v59 = v86;
LABEL_76:
              v96 = objc_msgSend(v14, "count", v127);
              -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = v17;
              v128 = v59;
              if (v96 >= objc_msgSend(v97, "count"))
              {
                -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v138 = objc_msgSend(v98, "count");

              }
              else
              {
                v138 = objc_msgSend(v14, "count");
              }

              v99 = 0;
              do
              {
                v100 = v99;
                v101 = v72 + v99;
                v102 = v72 + v99 + 1;
                if (v102 >= v138)
                  break;
                objc_msgSend(v14, "objectAtIndexedSubscript:", v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v102);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                v104 = objc_msgSend(v103, "roundTripTime");
                if (objc_msgSend(v103, "probeTFO"))
                  v104 = (unint64_t)fmax(v11 * (double)v104, 1.0);
                nplog_obj();
                v105 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  -[NPWaldo identifier](self, "identifier");
                  v135 = v101;
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v132, "label");
                  v134 = v103;
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NPWaldo latencyFactorA](self, "latencyFactorA");
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v133, "doubleValue");
                  v109 = v108;
                  objc_msgSend(v144, "label");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413826;
                  v147 = v106;
                  v148 = 2112;
                  v149 = v107;
                  v150 = 2048;
                  v151 = v141;
                  v152 = 2048;
                  v153 = v109;
                  v154 = 2112;
                  v155 = (unint64_t)v110;
                  v156 = 2048;
                  v157 = v104;
                  v158 = 2048;
                  v159 = v102;
                  _os_log_impl(&dword_19E8FE000, v105, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is greater than %f times the latency to %@ (rtt %lu) (index %lu)", buf, 0x48u);

                  v103 = v134;
                  v101 = v135;
                }

                -[NPWaldo latencyFactorA](self, "latencyFactorA");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "doubleValue");
                v113 = (unint64_t)(v112 * (double)v104);

                v99 = v100 + 1;
                v72 = v140;
              }
              while (v141 > v113);
              if (v72 && !v100)
              {
                v101 = 0;
                v114 = v141;
                while (1)
                {
                  objc_msgSend(v14, "objectAtIndexedSubscript:", v101, v128);
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v101);
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  v116 = objc_msgSend(v115, "roundTripTime");
                  if (objc_msgSend(v115, "probeTFO"))
                    v116 = (unint64_t)fmax(v11 * (double)v116, 1.0);
                  nplog_obj();
                  v117 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                  {
                    -[NPWaldo identifier](self, "identifier");
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v132, "label");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v145, "label");
                    v136 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NPWaldo latencyFactorA](self, "latencyFactorA");
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v119, "doubleValue");
                    *(_DWORD *)buf = 138413826;
                    v147 = v139;
                    v148 = 2112;
                    v149 = v118;
                    v150 = 2048;
                    v151 = v141;
                    v152 = 2112;
                    v153 = (unint64_t)v136;
                    v154 = 2048;
                    v155 = v116;
                    v156 = 2048;
                    v157 = v120;
                    v158 = 2048;
                    v159 = v101;
                    _os_log_impl(&dword_19E8FE000, v117, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is less than the latency to %@ (rtt %lu) divided by %f (index %lu)", buf, 0x48u);

                    v114 = v141;
                    v72 = v140;

                  }
                  v121 = (double)v116;
                  -[NPWaldo latencyFactorA](self, "latencyFactorA");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "doubleValue");
                  v124 = (unint64_t)(v121 / v123);

                  if (v114 < v124)
                    break;
                  if (v72 == ++v101)
                  {
                    v101 = v72;
                    break;
                  }
                }
              }
              objc_msgSend(v130, "roundTripAverageObserved", v128);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "setRoundTripTime:", objc_msgSend(v125, "average"));

              -[NPWaldo setShouldSave:](self, "setShouldSave:", 1);
              v17 = v132;
              if (v101 == v72)
              {
                v94 = 0;
                LOBYTE(p_super) = 0;
                v23 = v129;
                v18 = v130;
              }
              else
              {
                nplog_obj();
                p_super = objc_claimAutoreleasedReturnValue();
                v23 = v129;
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
                {
                  -[NPWaldo identifier](self, "identifier");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v147 = v126;
                  _os_log_impl(&dword_19E8FE000, p_super, OS_LOG_TYPE_DEFAULT, "%@: Re-sorting edge latencies and rebuilding the latency map for the current network signature", buf, 0xCu);

                }
                -[NPWaldo resortEdgeListForCurrentNetworkSignature](self, "resortEdgeListForCurrentNetworkSignature");
                -[NPWaldo rebuildLatencyMapAllSignatures:](self, "rebuildLatencyMapAllSignatures:", 0);
                v94 = 0;
                LOBYTE(p_super) = 1;
                v18 = v130;
              }
              goto LABEL_101;
            }
            v85 = 1;
            goto LABEL_62;
          }
        }
      }
      v18 = v130;
      v73 = (double)v43;
      -[NPWaldo latencyFactorB](self, "latencyFactorB");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "doubleValue");
      if (v75 >= (double)v43)
      {

      }
      else
      {

        if (v43 >= 6)
        {
          v127 = v59;
          nplog_obj();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            -[NPWaldo identifier](self, "identifier");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "label");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPWaldo latencyFactorB](self, "latencyFactorB");
            v79 = v43;
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "doubleValue");
            *(_DWORD *)buf = 138413314;
            v147 = v77;
            v148 = 2112;
            v149 = v78;
            v150 = 2048;
            v151 = v141;
            v152 = 2048;
            v153 = v79;
            v154 = 2048;
            v155 = v81;
            _os_log_impl(&dword_19E8FE000, v76, OS_LOG_TYPE_DEFAULT, "%@: Checking to see if new minimum latency to %@ (%lu) is less than its current latency (%lu) divided by %f", buf, 0x34u);

          }
          -[NPWaldo latencyFactorB](self, "latencyFactorB");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "doubleValue");
          v84 = (unint64_t)(v73 / v83);
          v85 = v141 < v84;

          if (objc_msgSend(v130, "passedReprobeThreshold") == v85)
          {
            v95 = v141 >= v84;
            v59 = v127;
            v72 = v140;
            if (v95)
              goto LABEL_76;
            goto LABEL_63;
          }
          v59 = v127;
          goto LABEL_62;
        }
      }
      if ((objc_msgSend(v130, "passedReprobeThreshold") & 1) == 0)
      {
        v72 = v140;
        goto LABEL_76;
      }
      v85 = 0;
LABEL_62:
      v72 = v140;
      objc_msgSend(v18, "setPassedReprobeThreshold:", v85, v127);
      -[NPWaldo setShouldSave:](self, "setShouldSave:", 1);
      if (!v85)
        goto LABEL_76;
      goto LABEL_63;
    }
  }
  else
  {

    LOBYTE(p_super) = 0;
  }
  return (char)p_super;
}

- (void)startProbingEdges:(id)a3 atIndex:(unint64_t)a4 doneCount:(unint64_t)a5 sampleCount:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  _BOOL8 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  unint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(_QWORD))a7;
  if (objc_msgSend(v12, "count") <= a5)
  {
    v13[2](v13);
  }
  else
  {
    v39 = v13;
    v14 = objc_msgSend(v12, "count");
    v15 = v14 != a4;
    v52 = 0;
    v53 = &v52;
    if (v14 == a4)
      v16 = a4;
    else
      v16 = a4 + 1;
    v54 = 0x2020000000;
    v55 = v14 != a4;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = a5;
    v38 = v16;
    if (v16 > a4)
    {
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "roundTripAverage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "samples");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count") > a6;

        nplog_obj();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22)
          {
            -[NPWaldo identifier](self, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "probeEndpoint");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "description");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v28);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "description");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v57 = v34;
            v58 = 2112;
            v59 = v29;
            v60 = 2112;
            v61 = v30;
            v62 = 2048;
            v63 = a6;
            _os_log_debug_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_DEBUG, "%@: Skip Measuring RTT to edge %@ (current latency %@) at %luth round", buf, 0x2Au);

          }
          v23 = v49;
          ++v49[3];
          v24 = v53[3] - 1;
          v53[3] = v24;
          if (!v24)
            -[NPWaldo startProbingEdges:atIndex:doneCount:sampleCount:completionHandler:](self, "startProbingEdges:atIndex:doneCount:sampleCount:completionHandler:", v12, v38, v23[3], a6, v39);
        }
        else
        {
          if (v22)
          {
            -[NPWaldo identifier](self, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "probeEndpoint");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "description");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v31);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "description");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v57 = v35;
            v58 = 2112;
            v59 = v32;
            v60 = 2112;
            v61 = v33;
            v62 = 2048;
            v63 = a6;
            _os_log_debug_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_DEBUG, "%@: Measuring RTT to edge %@ (current latency %@) at %luth round", buf, 0x2Au);

          }
          +[NSPManager sharedManager](NSPManager, "sharedManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "resetTestLatencyMapIndex:", a6);

          -[NPWaldo probeTimeout](self, "probeTimeout");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __77__NPWaldo_startProbingEdges_atIndex_doneCount_sampleCount_completionHandler___block_invoke;
          v40[3] = &unk_1E4138560;
          v44 = &v52;
          v40[4] = self;
          v27 = v17;
          v41 = v27;
          v43 = v39;
          v45 = &v48;
          v42 = v12;
          v46 = v38;
          v47 = a6;
          objc_msgSend(v27, "measureLatencyWithTimeout:completionHandler:", v26, v40);

        }
        ++a4;
        --v15;
      }
      while (v15);
    }
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    v13 = (void (**)(_QWORD))v39;
  }

}

void __77__NPWaldo_startProbingEdges_atIndex_doneCount_sampleCount_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 32), "reprocessCancelled"))
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "probeEndpoint");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = (uint64_t)v4;
      _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_DEFAULT, "%@: RTT probe to %@ was aborted", (uint8_t *)&v13, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 40), "roundTripTime");
      objc_msgSend(*(id *)(a1 + 40), "probeEndpoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "roundTripAverage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413058;
      v14 = v6;
      v15 = 2048;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "%@: Current RTT average is %lu for edge %@, (RTT samples: %@)", (uint8_t *)&v13, 0x2Au);

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "startProbingEdges:atIndex:doneCount:sampleCount:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 56));
  }
}

- (void)logEdgeList:(id)a3 debug:(BOOL)a4 toStdout:(BOOL)a5
{
  uint64_t i;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  const char *v35;
  const char *v36;
  id v37;
  const char *v38;
  id v39;
  const char *v40;
  id v41;
  const __CFString *v42;
  _BOOL4 v43;
  id obj;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NPWaldo *v54;
  _BOOL4 v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  __CFString *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v55 = a5;
  v43 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = a3;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v56)
  {
    v53 = *(_QWORD *)v62;
    v54 = self;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v62 != v53)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "edgeIndex");
        -[NPWaldo edges](self, "edges");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        v11 = CFSTR("<inactive>");
        if (v8 < v10)
        {
          -[NPWaldo edges](self, "edges");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "edgeIndex"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "label");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v7, "roundTripAverage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "roundTripAverageObserved");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "description");
        v17 = objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
          -[__CFString appendFormat:](v18, "appendFormat:", CFSTR("(observed %@)"), v17);
        }
        else
        {
          v18 = 0;
        }
        v58 = (void *)v17;
        v59 = v11;
        v57 = v18;
        if (v55)
        {
          v50 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v11), "UTF8String");
          objc_msgSend(v7, "probeEndpoint");
          v60 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "description");
          v19 = objc_claimAutoreleasedReturnValue();
          +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v19);
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v48 = (const char *)objc_msgSend(v20, "UTF8String");
          v46 = objc_msgSend(v7, "roundTripTime");
          if (v15)
            v45 = (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          else
            v45 = "null";
          v52 = v15;
          if (v18)
            v35 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v18), "UTF8String");
          else
            v35 = "";
          if (objc_msgSend(v7, "passedReprobeThreshold"))
            v36 = "(passed reprobe threshold)";
          else
            v36 = "";
          +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(v7, "interfaceType"));
          v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v38 = (const char *)objc_msgSend(v37, "UTF8String");
          objc_msgSend(v7, "connectionParametersString");
          v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v40 = (const char *)objc_msgSend(v39, "UTF8String");
          objc_msgSend(v7, "TFOStatusString");
          v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          printf("    %s(%s) rtt %lu (%s) %s %s (%s) %s %s\n", v50, v48, v46, v45, v35, v36, v38, v40, (const char *)objc_msgSend(v41, "UTF8String"));

          self = v54;
          v31 = v58;
          v33 = v59;
          v29 = v52;
        }
        else
        {
          v60 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          -[NPWaldo identifier](self, "identifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = -[__CFString UTF8String](objc_retainAutorelease(v11), "UTF8String");
          objc_msgSend(v7, "probeEndpoint");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "description");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[NPUtilities stripWhitespace:](NPUtilities, "stripWhitespace:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v7, "roundTripTime");
          v24 = &stru_1E4138CF8;
          if (v18)
            v25 = v18;
          else
            v25 = &stru_1E4138CF8;
          if (objc_msgSend(v7, "passedReprobeThreshold"))
            v24 = CFSTR("(passed reprobe threshold)");
          +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", objc_msgSend(v7, "interfaceType"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "connectionParametersString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "TFOStatusString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v25;
          v29 = v15;
          objc_msgSend(v60, "appendFormat:", CFSTR("%@:    %s(%@) rtt %lu (%@) %@ %@ (%@) %@ %@"), v49, v47, v22, v23, v15, v42, v24, v26, v27, v28);

          nplog_obj();
          v30 = objc_claimAutoreleasedReturnValue();
          v19 = v30;
          if (v43)
          {
            v31 = v58;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v60;
              v66 = v60;
              _os_log_debug_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
LABEL_24:
              self = v54;
              v33 = v59;
              v34 = v57;
              goto LABEL_35;
            }
          }
          else
          {
            v31 = v58;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v60;
              v66 = v60;
              _os_log_impl(&dword_19E8FE000, v19, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
              goto LABEL_24;
            }
          }
          self = v54;
          v33 = v59;
        }
        v34 = v57;
        v32 = v60;
LABEL_35:

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v56);
  }

}

- (id)copyEdgeList:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "edgeIndex");
        -[NPWaldo edges](self, "edges");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v10 < v12)
        {
          -[NPWaldo edges](self, "edges");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v9, "edgeIndex"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "probeEndpoint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "hostname");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v9, "roundTripTime");
          objc_msgSend(v9, "connectionParametersString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "appendFormat:", CFSTR("%@(%@):%lu %@ | "), v15, v17, v18, v19);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v23, "length"))
    v20 = v23;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (id)copyEdgeListRTTAverage:(id)a3 observed:(BOOL)a4 shortDescription:(BOOL)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NPWaldo *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v30;
  uint64_t v31;
  id v32;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    v31 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "edgeIndex");
        -[NPWaldo edges](self, "edges");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v12 < v14)
        {
          -[NPWaldo edges](self, "edges");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v11, "edgeIndex"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (a5)
          {
            if (a4)
              objc_msgSend(v11, "roundTripAverageObserved");
            else
              objc_msgSend(v11, "roundTripAverage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "shortDescription");
            v18 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (a4)
              objc_msgSend(v11, "roundTripAverageObserved");
            else
              objc_msgSend(v11, "roundTripAverage");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "description");
            v18 = objc_claimAutoreleasedReturnValue();
          }
          v19 = (void *)v18;

          if (v19)
          {
            objc_msgSend(v16, "label");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "probeEndpoint");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hostname");
            v22 = v8;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = self;
            if (objc_msgSend(v11, "passedReprobeThreshold"))
              v25 = CFSTR("R ");
            else
              v25 = &stru_1E4138CF8;
            objc_msgSend(v11, "connectionParametersString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v25;
            self = v24;
            objc_msgSend(v32, "appendFormat:", CFSTR("%@(%@):(%@) %@ %@ | "), v20, v23, v19, v30, v26);

            v8 = v22;
            v9 = v31;

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v32, "length"))
    v27 = v32;
  else
    v27 = 0;
  v28 = v27;

  return v28;
}

- (BOOL)validateEdgeList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "roundTripAverage", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isAnyValid");

        if ((v8 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)loadObservedRTTSamples:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "roundTripAverage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "samples");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v8, "roundTripAverageObserved");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "roundTripAverage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "samples");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addSamples:", v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (BOOL)shouldFetchWaldo
{
  void *v2;
  BOOL v3;

  -[NPWaldo edges](self, "edges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (unint64_t)probeSize
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  -[NPWaldo cachedLocation](self, "cachedLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NPWaldo viewSize](self, "viewSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    -[NPWaldo edges](self, "edges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 <= objc_msgSend(v6, "count"))
    {
      -[NPWaldo viewSize](self, "viewSize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
    }
    else
    {
      -[NPWaldo edges](self, "edges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
    }
    v9 = v8;

  }
  else
  {
    -[NPWaldo edges](self, "edges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "count");
  }

  return v9;
}

- (NSArray)currentEdgeList
{
  NSDictionary *currentNetworkCharacteristics;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_7:

      v5 = 0;
      v8 = 0;
      goto LABEL_8;
    }
    -[NPWaldo identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    v11 = "%@: No network characteristics available";
LABEL_10:
    _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_7;
  }
  -[NSDictionary objectForKeyedSubscript:](currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    -[NPWaldo identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    v11 = "%@: No network signature available";
    goto LABEL_10;
  }
  v5 = (void *)v4;
  -[NPWaldo networkInformation](self, "networkInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentLatencyMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return (NSArray *)v8;
}

- (id)currentNetworkInfo
{
  NSDictionary *currentNetworkCharacteristics;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
  if (!currentNetworkCharacteristics)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_7:

      v5 = 0;
      v7 = 0;
      goto LABEL_8;
    }
    -[NPWaldo identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    v11 = "%@: No network characteristics available";
LABEL_10:
    _os_log_debug_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_7;
  }
  -[NSDictionary objectForKeyedSubscript:](currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    -[NPWaldo identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v10;
    v11 = "%@: No network signature available";
    goto LABEL_10;
  }
  v5 = (void *)v4;
  -[NPWaldo networkInformation](self, "networkInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("HasIPv6"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHasIPv6:", objc_msgSend(v8, "BOOLValue"));

LABEL_8:
  return v7;
}

- (void)resortEdgeListForCurrentNetworkSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    -[NPWaldo networkInformation](self, "networkInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NPWaldo latencyComparator](self, "latencyComparator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resortEdgeLatenciesUsingComparator:", v6);

    }
    v3 = v7;
  }

}

- (void)rebuildLatencyMapAllSignatures:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, 0);
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:

  if (objc_msgSend(v6, "count"))
  {
    -[NPWaldo delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "waldoRequiresTFO:", self);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NPWaldo setRequireTFO:](self, "setRequireTFO:", v8);
    v25 = (void *)v8;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NPWaldo networkInformation](self, "networkInformation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = 0;
          -[NPWaldo requireTFO](self, "requireTFO");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v26) = objc_msgSend(v17, "BOOLValue");

          -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          HIBYTE(v26) = objc_msgSend(v18, "BOOLValue");

          -[NPWaldo viewSize](self, "viewSize");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPWaldo edges](self, "edges");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v19, objc_msgSend(v20, "count"), &v26);

          objc_msgSend(v16, "currentLatencyMap");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "count"))
          {
            -[NPWaldo requireTFO](self, "requireTFO");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "BOOLValue");

            if (!v23)
              goto LABEL_18;
            -[NPWaldo viewSize](self, "viewSize");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPWaldo edges](self, "edges");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v21, objc_msgSend(v24, "count"), 0);

          }
LABEL_18:

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

  }
}

- (void)mergeEdgeList:(id)a3 forNetworkSignature:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NPNetworkInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BYTE v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7 || !objc_msgSend(v6, "count"))
    goto LABEL_22;
  -[NPWaldo delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waldoRequiresTFO:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[NPWaldo setRequireTFO:](self, "setRequireTFO:", v9);
  -[NPWaldo networkInformation](self, "networkInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (NPNetworkInfo *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    v11 = objc_alloc_init(NPNetworkInfo);
  -[NPWaldo latencyComparator](self, "latencyComparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPNetworkInfo mergeNewLatencies:usingComparator:](v11, "mergeNewLatencies:usingComparator:", v6, v12);

  -[NPWaldo requireTFO](self, "requireTFO");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = objc_msgSend(v13, "BOOLValue");

  -[NPWaldo probeNoTFOCookie](self, "probeNoTFOCookie");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = objc_msgSend(v14, "BOOLValue");

  -[NPWaldo viewSize](self, "viewSize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo edges](self, "edges");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPNetworkInfo rebuildLatencyMapWithViewSize:edgeCount:parameters:](v11, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v15, objc_msgSend(v16, "count"), v33);

  -[NPNetworkInfo currentLatencyMap](v11, "currentLatencyMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
    goto LABEL_10;
  -[NPWaldo requireTFO](self, "requireTFO");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    -[NPWaldo viewSize](self, "viewSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPWaldo edges](self, "edges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPNetworkInfo rebuildLatencyMapWithViewSize:edgeCount:parameters:](v11, "rebuildLatencyMapWithViewSize:edgeCount:parameters:", v17, objc_msgSend(v20, "count"), 0);

LABEL_10:
  }
  -[NPNetworkInfo currentLatencyMap](v11, "currentLatencyMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {

  }
  else
  {
    v22 = -[NPWaldo reprocessCancelled](self, "reprocessCancelled");

    if (!v22)
    {
      nplog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[NPWaldo identifier](self, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v24;
        v36 = 2112;
        v37 = v7;
        _os_log_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_DEFAULT, "%@: probing completed for %@ but latency map is empty, un-resolving edges", buf, 0x16u);

      }
      -[NPWaldo setReResolve:](self, "setReResolve:", 1);
    }
  }
  -[NPWaldo networkInformation](self, "networkInformation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NPWaldo setNetworkInformation:](self, "setNetworkInformation:", v26);

  }
  -[NPWaldo networkInformation](self, "networkInformation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v11, v7);

  nplog_obj();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    -[NPWaldo identifier](self, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v29;
    _os_log_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_DEFAULT, "%@: Merged current edge list: ", buf, 0xCu);

  }
  -[NPWaldo networkInformation](self, "networkInformation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "currentLatencyMap");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPWaldo logEdgeList:debug:toStdout:](self, "logEdgeList:debug:toStdout:", v32, 0, 0);

LABEL_22:
}

- (id)edgeAtIndex:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;

  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[NPWaldo currentEdgeList](self, "currentEdgeList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
    if (a3 < 0 || !v7)
      goto LABEL_13;
    if (objc_msgSend(v7, "count") > a3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "edgeIndex");
      -[NPWaldo edges](self, "edges");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v11 < v13)
      {
        -[NPWaldo edges](self, "edges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v10, "edgeIndex"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        return v9;
      }

    }
    v9 = 0;
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    -[NPWaldo edges](self, "edges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 > a3)
    {
      -[NPWaldo edges](self, "edges");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v9 = 0;
  return v9;
}

- (unint64_t)edgeCount
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;

  -[NPWaldo enableLatencyDerivation](self, "enableLatencyDerivation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    -[NPWaldo currentEdgeList](self, "currentEdgeList");
  else
    -[NPWaldo edges](self, "edges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (BOOL)hasEdges
{
  void *v2;
  BOOL v3;

  -[NPWaldo edges](self, "edges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)getDayPassRTT
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[NPWaldo currentEdgeList](self, "currentEdgeList");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NPWaldo dayPassFetchCount](self, "dayPassFetchCount") >= 1)
  {
    v3 = 0;
    do
    {
      -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getCurrentOnRamp:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v4)
      {
        v8 = objc_msgSend(v6, "rtt");
        if (v5)
        {
          if (v8)
            objc_msgSend(v5, "addRoundTripSampleObserved:", objc_msgSend(v7, "rtt"));
        }
      }

      ++v3;
    }
    while (v3 < -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount"));
  }

}

- (void)refreshDayPassesWithCompletionHandler:(id)a3
{
  void *v4;
  int64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  __int128 v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  NPWaldo *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[5];
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[5];
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  int64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  int64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  -[NPWaldo currentNetworkInfo](self, "currentNetworkInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NPWaldo edgeCount](self, "edgeCount"))
  {
    -[NPWaldo currentEdgeList](self, "currentEdgeList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v75 = 0;
      v76 = &v75;
      v77 = 0x2020000000;
      v78 = 0;
      v78 = -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount");
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x3032000000;
      v73[3] = __Block_byref_object_copy__4;
      v73[4] = __Block_byref_object_dispose__4;
      v74 = (id)os_transaction_create();
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__610;
      v71 = __Block_byref_object_dispose__611;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke;
      v63[3] = &unk_1E4138588;
      v63[4] = self;
      v64 = v51;
      v65 = v52;
      v66 = v73;
      v5 = 0;
      v72 = (id)MEMORY[0x1A1AEA9EC](v63);
      *(_QWORD *)&v6 = 138413058;
      v50 = v6;
      while (1)
      {
        if (v5 >= -[NPWaldo dayPassFetchCount](self, "dayPassFetchCount", v50))
        {
          if (!v76[3])
          {
            v44 = v68[5];
            if (v44)
            {
              (*(void (**)(uint64_t, _QWORD))(v44 + 16))(v44, *((unsigned __int8 *)v80 + 24));
              v45 = (void *)v68[5];
              v68[5] = 0;

            }
          }
          _Block_object_dispose(&v67, 8);

          _Block_object_dispose(v73, 8);
          _Block_object_dispose(&v75, 8);
          goto LABEL_48;
        }
        -[NPWaldo edgeAtIndex:](self, "edgeAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -1;
        -[NPWaldo dayPassSoftExpiry](self, "dayPassSoftExpiry");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (!v7)
          break;
        if (!v12)
        {
          nplog_obj();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            -[NPWaldo identifier](self, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v84 = v41;
            v85 = 2048;
            v86 = v5;
            _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to fetch a Day Pass for edge %ld: latency is nil", buf, 0x16u);

          }
LABEL_21:

          --v76[3];
          goto LABEL_22;
        }
        objc_msgSend(v7, "getCurrentOnRamp:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && (objc_msgSend(v14, "isDayPassPastExpiry:", v11) & 1) == 0)
        {
          nplog_obj();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            -[NPWaldo identifier](self, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "label");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v84 = v25;
            v85 = 2048;
            v86 = v5;
            v87 = 2112;
            v88 = v26;
            _os_log_impl(&dword_19E8FE000, v24, OS_LOG_TYPE_DEFAULT, "%@: Current day pass for edge %ld %@ has not soft expired, sticking with the current onramp", buf, 0x20u);

          }
          --v76[3];

        }
        else
        {
          objc_msgSend(v7, "nextOnRampForLatency:outIndex:", v13, &v62);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16 || v62 == -1)
          {
            nplog_obj();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              -[NPWaldo identifier](self, "identifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "label");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v84 = v42;
              v85 = 2048;
              v86 = v5;
              v87 = 2112;
              v88 = v43;
              _os_log_error_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_ERROR, "%@: Failed to fetch a Day Pass for Edge: %ld %@, next onramp is nil", buf, 0x20u);

            }
            goto LABEL_15;
          }
          if (objc_msgSend(v16, "dayPassPending"))
          {
            objc_msgSend(v17, "dayPassSession");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

            if (!v19)
            {
              nplog_obj();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                -[NPWaldo identifier](self, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "label");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v50;
                v84 = v21;
                v85 = 2048;
                v86 = v5;
                v87 = 2112;
                v88 = v22;
                v89 = 2112;
                v90 = (uint64_t)v17;
                _os_log_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_DEFAULT, "%@: Skip, pending for previous day pass response for edge %ld %@ %@", buf, 0x2Au);

              }
LABEL_15:

              --v76[3];
              goto LABEL_22;
            }
          }
          v27 = objc_msgSend(v17, "dayPassRefreshAllowed");
          nplog_obj();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if ((v27 & 1) != 0)
          {
            if (v29)
            {
              -[NPWaldo identifier](self, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "label");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v84 = v30;
              v85 = 2048;
              v86 = v5;
              v87 = 2112;
              v88 = v31;
              v89 = 2048;
              v90 = v62;
              v91 = 2112;
              v92 = v17;
              _os_log_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_DEFAULT, "%@: Fetching a new Day Pass for Edge: %ld %@, (onRamp: %ld %@)", buf, 0x34u);

            }
            objc_msgSend(v17, "setDayPassPending:", 1);
            -[NPWaldo delegate](self, "delegate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPWaldo retryPause](self, "retryPause");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "doubleValue");
            v35 = v34;
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke_761;
            v53[3] = &unk_1E41385B0;
            v36 = v17;
            v54 = v36;
            v37 = v7;
            v55 = v37;
            v56 = v13;
            v57 = self;
            v58 = &v79;
            v61 = v62;
            v59 = &v75;
            v60 = &v67;
            objc_msgSend(v36, "refreshDayPassWithWaldoDelegate:softExpiry:retryInterval:edge:completionHandler:", v32, v37, v53, v11, v35);

          }
          else
          {
            if (v29)
            {
              -[NPWaldo identifier](self, "identifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "daypassEndpoint");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v84 = v38;
              v85 = 2112;
              v86 = (int64_t)v39;
              _os_log_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_DEFAULT, "%@: Skipping Day Pass fetch for %@ because the retry date has not passed", buf, 0x16u);

            }
            --v76[3];

          }
        }
LABEL_22:

        ++v5;
      }
      nplog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[NPWaldo identifier](self, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v84 = v40;
        v85 = 2048;
        v86 = v5;
        _os_log_error_impl(&dword_19E8FE000, v23, OS_LOG_TYPE_ERROR, "%@: Failed to fetch a Day Pass for edge %ld: edge is nil", buf, 0x16u);

      }
      goto LABEL_21;
    }
    nplog_obj();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v49;
      _os_log_impl(&dword_19E8FE000, v48, OS_LOG_TYPE_DEFAULT, "%@: No latency map available, not fetching day passes", buf, 0xCu);

    }
    if (v52)
      (*((void (**)(id, uint64_t, _QWORD))v52 + 2))(v52, 1, 0);
LABEL_48:

  }
  else
  {
    nplog_obj();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      -[NPWaldo identifier](self, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v84 = v47;
      _os_log_impl(&dword_19E8FE000, v46, OS_LOG_TYPE_DEFAULT, "%@: No edges available, not fetching day passes", buf, 0xCu);

    }
    if (v52)
      (*((void (**)(id, uint64_t, _QWORD))v52 + 2))(v52, 1, 0);
  }

  _Block_object_dispose(&v79, 8);
}

void __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfBestEdge");
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEFAULT, "%@: No valid day passes after a day pass refresh", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "setLastFallbackReason:", 17);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentEdgeIndex:", objc_msgSend(*(id *)(a1 + 32), "dayPassFetchCount"));
    objc_msgSend(*(id *)(a1 + 32), "setShouldSave:", 1);
    if (!(_DWORD)a2)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "getDayPassRTT");
    objc_msgSend(*(id *)(a1 + 32), "setShouldSave:", 1);
    goto LABEL_10;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_INFO, "%@: Using best edge %ld", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentEdgeIndex:", v4);
  if ((_DWORD)a2)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "pushKeybagToKernel");
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, BOOL, uint64_t))(v9 + 16))(v9, v4 != 0x7FFFFFFFFFFFFFFFLL, a2);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __49__NPWaldo_refreshDayPassesWithCompletionHandler___block_invoke_761(uint64_t a1, int a2, int a3, char a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  objc_msgSend(*(id *)(a1 + 32), "setDayPassPending:", 0);
  if (a2)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "addressFamily");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "currentIndex:", v9);
    v11 = *(_QWORD *)(a1 + 88);

    if (v10 != v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "getCurrentOnRamp:", *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && objc_msgSend(v12, "isDayPassExpired"))
        objc_msgSend(v13, "invalidateDayPass");

    }
    v14 = *(_QWORD *)(a1 + 88);
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "addressFamily");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCurrentIndex:addressFamily:", v14, v16);
  }
  else
  {
    if ((a4 & 1) != 0)
      goto LABEL_12;
    v17 = *(_QWORD *)(a1 + 88);
    v18 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "addressFamily");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getOnRamp:addressFamily:", v17, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "setDayPassFailed:", 1);
      objc_msgSend(*(id *)(a1 + 56), "setReResolve:", 1);
    }
  }

LABEL_12:
  if (a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v20)
    {
      (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

    }
  }
}

- (void)logLatencyInfoToStdout:(BOOL)a3 logAll:(BOOL)a4 logEdgeSelection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  NSObject *v8;
  _BOOL4 v9;
  NSDictionary *currentNetworkCharacteristics;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  _BOOL4 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v33 = a5;
  v5 = a4;
  v6 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  if (a3
    || (nplog_obj(),
        v8 = objc_claimAutoreleasedReturnValue(),
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG),
        v8,
        v9))
  {
    currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
    if (currentNetworkCharacteristics)
    {
      -[NSDictionary objectForKeyedSubscript:](currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = +[NPUtilities copyNetworkDescription:](NPUtilities, "copyNetworkDescription:", self->_currentNetworkCharacteristics);
        v13 = v12;
        if (v6)
        {
          printf("Current Network Signature %s\n\n", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
        }
        else
        {
          nplog_obj();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[NPWaldo identifier](self, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v40 = v30;
            v41 = 2112;
            v42 = v13;
            _os_log_debug_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEBUG, "%@: Current Network Signature %@", buf, 0x16u);

          }
        }

      }
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[NPWaldo networkInformation](self, "networkInformation");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v20 = +[NPUtilities copyDataHexString:](NPUtilities, "copyDataHexString:", v19);
          v21 = v20;
          if (v6)
          {
            printf("Latency results for network signature %s:\n", (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
          }
          else
          {
            nplog_obj();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              -[NPWaldo identifier](self, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v40 = v29;
              v41 = 2112;
              v42 = v21;
              _os_log_debug_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_DEBUG, "%@: Latency results for network signature %@:", buf, 0x16u);

            }
          }
          -[NPWaldo networkInformation](self, "networkInformation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v5)
            objc_msgSend(v24, "edgeLatencies");
          else
            objc_msgSend(v24, "currentLatencyMap");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPWaldo logEdgeList:debug:toStdout:](self, "logEdgeList:debug:toStdout:", v25, 1, v6);

          if (v33 && v24)
          {
            objc_msgSend(v24, "edgeSelection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26)
            {
              if (v6)
              {
                objc_msgSend(v26, "description");
                v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                printf("\n%s\n", (const char *)-[NSObject UTF8String](v28, "UTF8String"));
              }
              else
              {
                nplog_obj();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v27, "description");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v40 = v31;
                  _os_log_debug_impl(&dword_19E8FE000, v28, OS_LOG_TYPE_DEBUG, "\n%@", buf, 0xCu);

                }
              }

            }
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v16);
    }

  }
}

- (id)copyLatencyInfoDictionary:(BOOL)a3 copyAll:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSDictionary *currentNetworkCharacteristics;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NPWaldo *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  NPWaldo *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  id v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  id obj;
  uint64_t v46;
  void *v47;
  __CFString *v48;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  _QWORD v56[4];
  _BYTE v57[128];
  _QWORD v58[5];
  _QWORD v59[7];

  v4 = a3;
  v59[5] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  if (v4)
  {
    currentNetworkCharacteristics = self->_currentNetworkCharacteristics;
    if (currentNetworkCharacteristics)
    {
      -[NSDictionary objectForKeyedSubscript:](currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("InterfaceType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        +[NPUtilities getInterfaceTypeString:](NPUtilities, "getInterfaceTypeString:", (int)objc_msgSend(v9, "intValue"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = CFSTR("unknown");
      }
      -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v48 = v11;
        -[NPWaldo networkInformation](self, "networkInformation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (a4)
          objc_msgSend(v30, "edgeLatencies");
        else
          objc_msgSend(v30, "currentLatencyMap");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = -[NPWaldo copyEdgeList:](self, "copyEdgeList:", v32);
        v34 = self;
        v35 = -[NPWaldo copyEdgeListRTTAverage:observed:shortDescription:](self, "copyEdgeListRTTAverage:observed:shortDescription:", v32, 0, 0);
        v36 = -[NPWaldo copyEdgeListRTTAverage:observed:shortDescription:](v34, "copyEdgeListRTTAverage:observed:shortDescription:", v32, 1, 0);
        v37 = -[NPWaldo copyEdgeListRTTAverage:observed:shortDescription:](v34, "copyEdgeListRTTAverage:observed:shortDescription:", v32, 1, 1);
        v38 = +[NPUtilities copyDataHexString:](NPUtilities, "copyDataHexString:", v28);
        v58[0] = CFSTR("InterfaceType");
        v58[1] = CFSTR("RTT");
        v39 = CFSTR("None");
        if (v33)
          v40 = v33;
        else
          v40 = CFSTR("None");
        v59[0] = v48;
        v59[1] = v40;
        if (v35)
          v41 = v35;
        else
          v41 = CFSTR("None");
        v58[2] = CFSTR("RTTAverage");
        v58[3] = CFSTR("RTTAverageObserved");
        if (v36)
          v42 = v36;
        else
          v42 = CFSTR("None");
        v59[2] = v41;
        v59[3] = v42;
        v58[4] = CFSTR("RTTAverageObservedLast");
        if (v37)
          v39 = v37;
        v59[4] = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 5);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v43, v38);

        v11 = v48;
      }
      v27 = v7;

    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v47 = v6;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[NPWaldo networkInformation](self, "networkInformation");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v50)
    {
      v46 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v52 != v46)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          -[NPWaldo networkInformation](self, "networkInformation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (a4)
            objc_msgSend(v15, "edgeLatencies");
          else
            objc_msgSend(v15, "currentLatencyMap");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[NPWaldo copyEdgeList:](self, "copyEdgeList:", v16);
          objc_msgSend(v15, "lastVisitedDesc");
          v18 = self;
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastUsedDesc");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "lastFallbackReason"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[NPUtilities copyDataHexString:](NPUtilities, "copyDataHexString:", v13);
          if (v17)
            v23 = v17;
          else
            v23 = CFSTR("None");
          v55[0] = CFSTR("RTT");
          v55[1] = CFSTR("LastVisited");
          if (v19)
            v24 = v19;
          else
            v24 = CFSTR("None");
          v56[0] = v23;
          v56[1] = v24;
          if (v20)
            v25 = v20;
          else
            v25 = CFSTR("None");
          v55[2] = CFSTR("LastUsed");
          v55[3] = CFSTR("FallbackReason");
          v56[2] = v25;
          v56[3] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v26, v22);

          self = v18;
        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v50);
    }

    v7 = v47;
    v27 = v47;
  }

  return v27;
}

- (NSDate)expirationDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NPWaldo edges](self, "edges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __25__NPWaldo_expirationDate__block_invoke;
        v10[3] = &unk_1E41382D0;
        v10[4] = &v15;
        objc_msgSend(v7, "iterateOnRampsForAddressFamily:withBlock:", 0, v10);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
    }
    while (v3);
  }

  v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSDate *)v8;
}

uint64_t __25__NPWaldo_expirationDate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a4;
  if ((objc_msgSend(v5, "isDayPassExpired") & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "dayPassHardExpiry");
    v8 = v7;
    objc_msgSend(v5, "dayPassCreationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithTimeInterval:sinceDate:", v9, v8);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      objc_msgSend(v12, "laterDate:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      v16 = v10;
      v15 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v16;
    }

  }
  return 1;
}

- (NSDate)currentNetworkLastUsed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_currentNetworkCharacteristics, "objectForKeyedSubscript:", CFSTR("Signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPWaldo networkInformation](self, "networkInformation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastUsed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (id)edgeContainingOnRamp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  void *v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NPWaldo edges](self, "edges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __32__NPWaldo_edgeContainingOnRamp___block_invoke;
      v14[3] = &unk_1E41385D8;
      v11 = v4;
      v16 = v10;
      v17 = &v22;
      v15 = v11;
      objc_msgSend(v10, "iterateOnRampsForAddressFamily:withBlock:", 0, v14);
      LOBYTE(v10) = v23[5] == 0;

      if ((v10 & 1) == 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

uint64_t __32__NPWaldo_edgeContainingOnRamp___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "tuscanyEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hosts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v11, "hostname");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "port");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@:%@"), v13, v14);

        if (objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 32)))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));

          v16 = 0;
          goto LABEL_11;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (id)copyStateIncludeDistance:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v35;
  id obj;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v37 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  -[NPWaldo currentEdgeList](self, "currentEdgeList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = v4;
    obj = v4;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v39)
    {
      v38 = *(_QWORD *)v41;
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v6);
        v8 = objc_msgSend(v5, "count");
        -[NPWaldo viewSize](self, "viewSize");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");

        if (v8 >= v10)
          break;
        -[NPWaldo edges](self, "edges");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "edgeIndex"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v7, "creationDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceNow");
          v16 = v15;

          if (v37)
          {
            objc_msgSend(v12, "distance");
            if ((unint64_t)v17 % 0x64 <= 0x32)
              v18 = (unint64_t)v17 / 0x64;
            else
              v18 = (unint64_t)v17 / 0x64 + 1;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100 * v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("distance"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "roundTripTime"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("rtt"));

          objc_msgSend(v12, "label");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          if (v22)
          {
            objc_msgSend(v12, "label");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("label"));

          }
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "roundTripAverageObserved");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "size"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("samples"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)fabs(v16));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("age"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "probeCount"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("probes"));

          objc_msgSend(v12, "lastUsed");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v12, "lastUsed");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSinceNow");
            objc_msgSend(v30, "numberWithUnsignedInteger:", (unint64_t)fabs(v32));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("idleSeconds"));

          }
          else
          {
            objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, CFSTR("idleSeconds"));
          }

          objc_msgSend(v5, "addObject:", v13);
        }

        if (v39 == ++v6)
        {
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v39)
            goto LABEL_4;
          break;
        }
      }
    }

    v4 = v35;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isIPv6Enabled
{
  void *v3;
  void *v4;
  char v5;

  -[NPWaldo enableIPv6](self, "enableIPv6");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPWaldo enableIPv6](self, "enableIPv6");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)onRampForIndex:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(v4, "unsignedIntegerValue"),
        -[NPWaldo allOnRamps](self, "allOnRamps"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 < v8))
  {
    -[NPWaldo allOnRamps](self, "allOnRamps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "unsignedIntegerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)latencyComparator
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__NPWaldo_latencyComparator__block_invoke;
  v5[3] = &unk_1E4138600;
  v5[4] = self;
  v2 = (void *)MEMORY[0x1A1AEA9EC](v5, a2);
  v3 = (void *)MEMORY[0x1A1AEA9EC]();

  return v3;
}

uint64_t __28__NPWaldo_latencyComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = objc_msgSend(v7, "roundTripTime");
  v10 = objc_msgSend(v8, "roundTripTime");
  objc_msgSend(*(id *)(a1 + 32), "TFOLeeway");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  if (v12 <= 0.0)
  {
    v15 = 0.66;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "TFOLeeway");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

  }
  if (objc_msgSend(v7, "probeTFO"))
    v9 = (unint64_t)fmax(v15 * (double)v9, 1.0);
  if (objc_msgSend(v8, "probeTFO"))
    v10 = (unint64_t)fmax(v15 * (double)v10, 1.0);
  if (v9 >= v10)
  {
    if (v9 == v10)
    {
      v17 = objc_msgSend(v7, "TFOStatus");
      if (v17 == objc_msgSend(v8, "TFOStatus"))
      {
        v16 = 0;
      }
      else if (objc_msgSend(v7, "TFOStatus") == 2)
      {
        v16 = -1;
      }
      else
      {
        v16 = 1;
      }
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = -1;
  }

  return v16;
}

- (void)cleanupStaleKeys
{
  void *v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__NPWaldo_cleanupStaleKeys__block_invoke;
  v5[3] = &unk_1E4137E20;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "removeFileHandleMatchingPredicate:", v5);

  if (*((_BYTE *)v7 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CD07F8], "sharedMaintainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commit");

  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __27__NPWaldo_cleanupStaleKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSPKeyNetworkAgent *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v3, "sessionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", &unk_1E4151588) & 1) == 0)
  {

    goto LABEL_14;
  }
  objc_msgSend(v3, "configurationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configurationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  v8 = v3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = a1;
  objc_msgSend(*(id *)(a1 + 32), "allOnRamps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
      objc_msgSend(v14, "dayPassUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "agentUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v11)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
    objc_msgSend(v14, "dayPassUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_18;
    v18 = 0;
  }
  else
  {
LABEL_12:

LABEL_18:
    nplog_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(v35 + 32), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "agentUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = v22;
      v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_DEFAULT, "%@: Removing stale key %@", buf, 0x16u);

    }
    v24 = objc_alloc_init(NSPKeyNetworkAgent);
    objc_msgSend(v8, "agentUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPNetworkAgent setAgentUUID:](v24, "setAgentUUID:", v25);

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC90]), "initWithNetworkAgentClass:", objc_opt_class());
    objc_msgSend(v8, "handle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = dup(objc_msgSend(v27, "fileDescriptor"));

    if ((v28 & 0x80000000) != 0)
    {
      nplog_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v35 + 32), "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPNetworkAgent agentUUID](v24, "agentUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v31;
        v42 = 2112;
        v43 = v32;
        _os_log_error_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_ERROR, "%@: While cleaning up stale keys, failed to dup the agent registration file descriptor for agent with UUID %@", buf, 0x16u);

      }
    }
    else if (objc_msgSend(v26, "setRegisteredNetworkAgent:fileDescriptor:", v24, v28))
    {
      objc_msgSend(v26, "unregisterNetworkAgent");
    }
    else
    {
      nplog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v35 + 32), "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSPNetworkAgent agentUUID](v24, "agentUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v33;
        v42 = 2112;
        v43 = v34;
        _os_log_error_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_ERROR, "%@: While cleaning up stale keys, failed to register key agent with UUID %@", buf, 0x16u);

      }
      close(v28);
    }
    v18 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v35 + 40) + 8) + 24) = 1;

    v20 = 0;
  }

LABEL_15:
  return v18;
}

- (void)incrementSessionCounters
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NPWaldo allOnRamps](self, "allOnRamps", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "dayPassSessionCounter");
        if (v8)
          objc_msgSend(v7, "setDayPassSessionCounter:", (v8 + 1));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (NSNumber)timestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)dayPassHostname
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDayPassHostname:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)dayPassHostnamePrependLabel
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDayPassHostnamePrependLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSNumber)dayPassPort
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDayPassPort:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSNumber)dayPassRequestTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDayPassRequestTimeout:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)dayPassLeafOID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDayPassLeafOID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)dayPassRevocationFailClosed
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDayPassRevocationFailClosed:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSNumber)dayPassExtendedValidation
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDayPassExtendedValidation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSNumber)dayPassEnableSessionTicket
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDayPassEnableSessionTicket:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSArray)dayPassSoftExpiry
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDayPassSoftExpiry:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSNumber)enableLatencyDerivation
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEnableLatencyDerivation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSNumber)latencyFactorA
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLatencyFactorA:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSNumber)latencyFactorB
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLatencyFactorB:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSNumber)latencyFactorX
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLatencyFactorX:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSNumber)edgeFairnessFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setEdgeFairnessFactor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSNumber)locationCheckInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLocationCheckInterval:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSNumber)locationTTL
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLocationTTL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSNumber)locationToleranceDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLocationToleranceDistance:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSNumber)viewSize
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setViewSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSNumber)probePause
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProbePause:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSNumber)probeTFO
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setProbeTFO:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSNumber)probeNoTFOCookie
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setProbeNoTFOCookie:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSNumber)probeTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setProbeTimeout:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSNumber)retryPause
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setRetryPause:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (NSNumber)signatureLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSignatureLimit:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSNumber)observedRTTSampleSize
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setObservedRTTSampleSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (NSNumber)reprocessSamplingInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setReprocessSamplingInterval:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (NSNumber)reprocessSampleSize
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setReprocessSampleSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (NSNumber)connectionIdleTimeoutMaximum
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setConnectionIdleTimeoutMaximum:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTag:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (NSURL)telemetryURL
{
  return (NSURL *)objc_getProperty(self, a2, 304, 1);
}

- (void)setTelemetryURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (NSString)telemetryService
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setTelemetryService:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (NSNumber)useGeohashFromServer
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setUseGeohashFromServer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (NSNumber)edgeSelectionEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setEdgeSelectionEnabled:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (NSNumber)edgeSelectionAlpha
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setEdgeSelectionAlpha:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

- (NSNumber)edgeSelectionWindowSize
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setEdgeSelectionWindowSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (NSNumber)enableIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setEnableIPv6:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (NSNumber)requireTFO
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setRequireTFO:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (NSNumber)TFOLeeway
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTFOLeeway:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (NSNumber)edgesGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setEdgesGeneration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 376);
}

- (NSNumber)usedEdgesGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setUsedEdgesGeneration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 384);
}

- (int64_t)currentEdgeIndex
{
  return self->_currentEdgeIndex;
}

- (void)setCurrentEdgeIndex:(int64_t)a3
{
  self->_currentEdgeIndex = a3;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
  objc_storeStrong((id *)&self->_hostname, a3);
}

- (NPWaldoDelegate)delegate
{
  return (NPWaldoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldSave
{
  return self->_shouldSave;
}

- (void)setShouldSave:(BOOL)a3
{
  self->_shouldSave = a3;
}

- (NPLocation)cachedLocation
{
  return self->_cachedLocation;
}

- (void)setCachedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocation, a3);
}

- (NSDate)locationCheckTimestamp
{
  return self->_locationCheckTimestamp;
}

- (void)setLocationCheckTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_locationCheckTimestamp, a3);
}

- (NSDate)locationExpiration
{
  return self->_locationExpiration;
}

- (void)setLocationExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_locationExpiration, a3);
}

- (NPWaldo)defaults
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

- (NPKeyBag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
  objc_storeStrong((id *)&self->_keybag, a3);
}

- (NPWaldoLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (BOOL)reprocessPending
{
  return self->_reprocessPending;
}

- (void)setReprocessPending:(BOOL)a3
{
  self->_reprocessPending = a3;
}

- (NSMutableDictionary)networkInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 472, 1);
}

- (void)setNetworkInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (BOOL)daypassRefreshInProgress
{
  return self->_daypassRefreshInProgress;
}

- (void)setDaypassRefreshInProgress:(BOOL)a3
{
  self->_daypassRefreshInProgress = a3;
}

- (NSArray)currentEdges
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (NPTuscanyEdge)nextEdge
{
  return (NPTuscanyEdge *)objc_getProperty(self, a2, 488, 1);
}

- (BOOL)reprocessCancelled
{
  return self->_reprocessCancelled;
}

- (void)setReprocessCancelled:(BOOL)a3
{
  self->_reprocessCancelled = a3;
}

- (unsigned)generation
{
  return self->_generation;
}

- (void)setGeneration:(unsigned int)a3
{
  self->_generation = a3;
}

- (OS_dispatch_source)reprocessSamplingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 496, 1);
}

- (void)setReprocessSamplingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (NWNetworkAgentRegistration)agentRegistration
{
  return (NWNetworkAgentRegistration *)objc_getProperty(self, a2, 504, 1);
}

- (void)setAgentRegistration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSUUID)configurationIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 512, 1);
}

- (void)setConfigurationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (OS_dispatch_queue)reprocessQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 520, 1);
}

- (NSData)updateHash
{
  return (NSData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setUpdateHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHash, 0);
  objc_storeStrong((id *)&self->_reprocessQueue, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_agentRegistration, 0);
  objc_storeStrong((id *)&self->_reprocessSamplingTimer, 0);
  objc_storeStrong((id *)&self->_nextEdge, 0);
  objc_storeStrong((id *)&self->_currentEdges, 0);
  objc_storeStrong((id *)&self->_networkInformation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_locationExpiration, 0);
  objc_storeStrong((id *)&self->_locationCheckTimestamp, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_usedEdgesGeneration, 0);
  objc_storeStrong((id *)&self->_edgesGeneration, 0);
  objc_storeStrong((id *)&self->_TFOLeeway, 0);
  objc_storeStrong((id *)&self->_requireTFO, 0);
  objc_storeStrong((id *)&self->_enableIPv6, 0);
  objc_storeStrong((id *)&self->_edgeSelectionWindowSize, 0);
  objc_storeStrong((id *)&self->_edgeSelectionAlpha, 0);
  objc_storeStrong((id *)&self->_edgeSelectionEnabled, 0);
  objc_storeStrong((id *)&self->_useGeohashFromServer, 0);
  objc_storeStrong((id *)&self->_telemetryService, 0);
  objc_storeStrong((id *)&self->_telemetryURL, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimeoutMaximum, 0);
  objc_storeStrong((id *)&self->_reprocessSampleSize, 0);
  objc_storeStrong((id *)&self->_reprocessSamplingInterval, 0);
  objc_storeStrong((id *)&self->_observedRTTSampleSize, 0);
  objc_storeStrong((id *)&self->_signatureLimit, 0);
  objc_storeStrong((id *)&self->_retryPause, 0);
  objc_storeStrong((id *)&self->_probeTimeout, 0);
  objc_storeStrong((id *)&self->_probeNoTFOCookie, 0);
  objc_storeStrong((id *)&self->_probeTFO, 0);
  objc_storeStrong((id *)&self->_probePause, 0);
  objc_storeStrong((id *)&self->_viewSize, 0);
  objc_storeStrong((id *)&self->_locationToleranceDistance, 0);
  objc_storeStrong((id *)&self->_locationTTL, 0);
  objc_storeStrong((id *)&self->_locationCheckInterval, 0);
  objc_storeStrong((id *)&self->_edgeFairnessFactor, 0);
  objc_storeStrong((id *)&self->_latencyFactorX, 0);
  objc_storeStrong((id *)&self->_latencyFactorB, 0);
  objc_storeStrong((id *)&self->_latencyFactorA, 0);
  objc_storeStrong((id *)&self->_enableLatencyDerivation, 0);
  objc_storeStrong((id *)&self->_dayPassSoftExpiry, 0);
  objc_storeStrong((id *)&self->_dayPassEnableSessionTicket, 0);
  objc_storeStrong((id *)&self->_dayPassExtendedValidation, 0);
  objc_storeStrong((id *)&self->_dayPassRevocationFailClosed, 0);
  objc_storeStrong((id *)&self->_dayPassLeafOID, 0);
  objc_storeStrong((id *)&self->_dayPassRequestTimeout, 0);
  objc_storeStrong((id *)&self->_dayPassPort, 0);
  objc_storeStrong((id *)&self->_dayPassHostnamePrependLabel, 0);
  objc_storeStrong((id *)&self->_dayPassHostname, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allOnRamps, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_currentNetworkCharacteristics, 0);
}

@end

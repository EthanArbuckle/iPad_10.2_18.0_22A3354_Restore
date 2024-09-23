@implementation NEIKEv2IKEAuthPacket

+ (NSObject)createIKEAuthForInitiatorIKESA:(void *)a3 childSA:
{
  id *v4;
  _BYTE *v5;
  const char *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NEIKEv2InitiatorIdentifierPayload *v10;
  SEL v11;
  const char *v12;
  _BYTE *v13;
  SEL v14;
  void *v15;
  const char *v16;
  void *v17;
  SEL v18;
  uint64_t v19;
  void *v20;
  SEL v21;
  void *v22;
  char v23;
  const char *v24;
  void *v25;
  const char *v26;
  _BYTE *v27;
  const char *v28;
  NEIKEv2ResponderIdentifierPayload *v29;
  SEL v30;
  const char *v31;
  _BYTE *v32;
  SEL v33;
  void *v34;
  const char *v35;
  void *v36;
  SEL v37;
  void *v38;
  char v39;
  NEIKEv2ChildSAPayload *v40;
  SEL v41;
  const char *v42;
  void *v43;
  SEL v44;
  void *v45;
  const char *v46;
  void *v47;
  SEL v48;
  void *v49;
  char v50;
  NEIKEv2InitiatorTrafficSelectorPayload *v51;
  SEL v52;
  const char *v53;
  void *v54;
  SEL v55;
  void *v56;
  const char *v57;
  void *v58;
  SEL v59;
  void *v60;
  char v61;
  NEIKEv2ResponderTrafficSelectorPayload *v62;
  SEL v63;
  const char *v64;
  void *v65;
  SEL v66;
  void *v67;
  const char *v68;
  void *v69;
  SEL v70;
  void *v71;
  char v72;
  const char *v73;
  id Property;
  id v75;
  uint64_t v76;
  const char *v77;
  id v78;
  id v79;
  int v80;
  const char *v81;
  NEIKEv2NotifyPayload *v82;
  BOOL v83;
  id v84;
  void *v85;
  const char *v86;
  _BYTE *v87;
  NEIKEv2ConfigPayload *v88;
  SEL v89;
  SEL v90;
  id v91;
  void *v92;
  SEL v93;
  id v94;
  const char *v95;
  void *v96;
  SEL v97;
  id v98;
  char v99;
  NSObject *v100;
  const char *v101;
  const char *v102;
  NSObject *v103;
  id v104;
  void *v105;
  _BYTE *v106;
  id v107;
  uint64_t v108;
  void *v109;
  id v110;
  SEL v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t j;
  void *v117;
  NEIKEv2ConfigurationMessage *v118;
  NEIKEv2ConfigPayload *v119;
  SEL v120;
  SEL v121;
  id v122;
  const char *v123;
  void *v124;
  SEL v125;
  id v126;
  char v127;
  NSObject *v128;
  NSObject *v129;
  id v130;
  char v131;
  const char *v132;
  id v133;
  int v134;
  const char *v135;
  void *v136;
  const char *v137;
  const char *v138;
  id v139;
  void *v140;
  uint64_t v141;
  NSObject *v142;
  NEIKEv2CertificateRequestPayload *v143;
  const char *v144;
  NEIKEv2CertificateRequestPayload *v145;
  void *v146;
  SEL v147;
  const char *v148;
  id *v149;
  NEIKEv2CertificatePayload *v150;
  NEIKEv2GSPMPayload *v151;
  SEL v152;
  NSData *v153;
  SEL v154;
  id v155;
  SEL v156;
  const char *v157;
  id v158;
  int v159;
  const char *v160;
  NSObject *p_super;
  uint32_t v162;
  id v163;
  char v164;
  id v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  NEIKEv2NotifyPayload *v172;
  unsigned int v173;
  void *v174;
  SEL v175;
  uint64_t v176;
  SEL v177;
  id v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t i;
  void *v184;
  NEIKEv2VendorIDPayload *v185;
  const char *v186;
  void *v187;
  SEL v188;
  void *v189;
  const char *v190;
  void *v191;
  void *v192;
  SEL v193;
  SEL v194;
  SEL v195;
  id v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  NEIKEv2CustomPayload *v203;
  uint64_t v204;
  void *v205;
  SEL v206;
  SEL v207;
  void *v208;
  const char *v209;
  void *v210;
  void *v211;
  SEL v212;
  SEL v213;
  uint64_t v214;
  SEL v215;
  id v216;
  void *v217;
  const char *v218;
  id v219;
  void *v220;
  char v221;
  NSObject *v222;
  NSObject *v223;
  uint32_t v224;
  NEIKEv2AuthPayload *v226;
  SEL v227;
  SEL v228;
  void *v229;
  char v230;
  const char *v231;
  id v232;
  char v233;
  const char *v234;
  id v235;
  NSObject *v236;
  const char *v237;
  id v238;
  char v239;
  NSObject *v240;
  Class isa;
  objc_class *v242;
  BOOL v243;
  const char *v244;
  id v245;
  void *v246;
  uint64_t v247;
  const char *v248;
  NSObject *v249;
  const char *v250;
  NSObject *v251;
  SEL v252;
  id v253;
  id v254;
  void *v255;
  SEL v256;
  const char *v257;
  NSObject *v258;
  uint32_t v259;
  NSObject *v260;
  const char *v261;
  NSObject *v262;
  uint32_t v263;
  const char *v264;
  NSObject *v265;
  uint32_t v266;
  NSObject *v267;
  _BYTE *v268;
  id *v269;
  NSObject *self;
  char v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  NEIKEv2CustomPayload *v288;
  _BYTE v289[128];
  NEIKEv2VendorIDPayload *v290;
  _BYTE v291[128];
  _BYTE v292[128];
  NEIKEv2CertificatePayload *v293;
  NEIKEv2CertificateRequestPayload *v294;
  int buf;
  const char *v296;
  uint64_t v297;

  v297 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (!v4)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_153;
    buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null ikeSA";
    goto LABEL_43;
  }
  if (!v5 && (*((_BYTE *)v4 + 23) & 1) == 0)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_153;
    buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null childSA";
    goto LABEL_43;
  }
  v7 = objc_getProperty(v4, v6, 96, 1);

  if (!v7)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_153:
      v129 = 0;
      goto LABEL_154;
    }
    buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    v102 = "%s called with null ikeSA.chosenProposal";
LABEL_43:
    _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, v102, (uint8_t *)&buf, 0xCu);
    goto LABEL_153;
  }
  v8 = -[NEIKEv2Packet initOutbound]([NEIKEv2IKEAuthPacket alloc]);
  if (!v8)
  {
    ne_log_obj();
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_19BD16000, v103, OS_LOG_TYPE_FAULT, "[[NEIKEv2IKEAuthPacket alloc] initOutbound:] failed", (uint8_t *)&buf, 2u);
    }

    v9 = 0;
    goto LABEL_153;
  }
  v9 = v8;
  v10 = objc_alloc_init(NEIKEv2InitiatorIdentifierPayload);
  objc_setProperty_atomic(v9, v11, v10, 96);

  v13 = -[NEIKEv2IKESA copyInitiatorIdentifier](v4, v12);
  objc_getProperty(v9, v14, 96, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  if (v15)
    objc_setProperty_atomic(v15, v16, v13, 24);

  objc_getProperty(v9, v18, 96, 1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    objc_storeWeak((id *)(v19 + 32), v4);

  objc_getProperty(v9, v21, 96, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[NEIKEv2Payload isValid]((uint64_t)v22);

  if ((v23 & 1) == 0)
  {
    ne_log_obj();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      buf = 136315138;
      v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
      v101 = "%s called with null packet.idi.isValid";
      goto LABEL_150;
    }
LABEL_152:

    goto LABEL_153;
  }
  objc_getProperty(v9, v24, 96, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v4 + 41, v25);

  v27 = -[NEIKEv2IKESA copyResponderIdentifier](v4, v26);
  if (v27)
  {
    v29 = objc_alloc_init(NEIKEv2ResponderIdentifierPayload);
    objc_setProperty_atomic(v9, v30, v29, 104);

    v32 = -[NEIKEv2IKESA copyResponderIdentifier](v4, v31);
    objc_getProperty(v9, v33, 104, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v34;
    if (v34)
      objc_setProperty_atomic(v34, v35, v32, 24);

    objc_getProperty(v9, v37, 104, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[NEIKEv2Payload isValid]((uint64_t)v38);

    if ((v39 & 1) == 0)
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.idr.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
  }
  v269 = v4;
  self = v9;
  if ((*((_BYTE *)v4 + 23) & 1) == 0)
  {
    v40 = objc_alloc_init(NEIKEv2ChildSAPayload);
    objc_setProperty_atomic(v9, v41, v40, 88);

    -[NEIKEv2ChildSA configProposalsWithoutKEM](v5, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getProperty(v9, v44, 88, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v45;
    if (v45)
      objc_setProperty_atomic(v45, v46, v43, 24);

    objc_getProperty(v9, v48, 88, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[NEIKEv2Payload isValid]((uint64_t)v49);

    if ((v50 & 1) == 0)
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.sa.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
    v51 = objc_alloc_init(NEIKEv2InitiatorTrafficSelectorPayload);
    objc_setProperty_atomic(v9, v52, v51, 160);

    -[NEIKEv2ChildSA configuredInitiatorTrafficSelectors](v5, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getProperty(v9, v55, 160, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v56;
    if (v56)
      objc_setProperty_atomic(v56, v57, v54, 24);

    objc_getProperty(v9, v59, 160, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[NEIKEv2Payload isValid]((uint64_t)v60);

    if ((v61 & 1) == 0)
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.tsi.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
    v62 = objc_alloc_init(NEIKEv2ResponderTrafficSelectorPayload);
    objc_setProperty_atomic(v9, v63, v62, 168);

    -[NEIKEv2ChildSA configuredResponderTrafficSelectors](v5, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getProperty(v9, v66, 168, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v67;
    if (v67)
      objc_setProperty_atomic(v67, v68, v65, 24);

    objc_getProperty(v9, v70, 168, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[NEIKEv2Payload isValid]((uint64_t)v71);

    if ((v72 & 1) == 0)
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        buf = 136315138;
        v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
        v101 = "%s called with null packet.tsr.isValid";
        goto LABEL_150;
      }
      goto LABEL_152;
    }
    if (v5)
      Property = objc_getProperty(v5, v73, 48, 1);
    else
      Property = 0;
    v75 = Property;
    v76 = objc_msgSend(v75, "mode");

    if (v76 == 1 && !-[NEIKEv2Packet addNotification:data:](v9, 0x4007uLL, 0))
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        goto LABEL_152;
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeUseTransportMode] failed";
      goto LABEL_187;
    }
    if (!-[NEIKEv2Packet addNotification:data:](v9, 0x400AuLL, 0))
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        goto LABEL_152;
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeESPTFCPaddingNotSupported] failed";
      goto LABEL_187;
    }
    if (!-[NEIKEv2Packet addNotification:data:](v9, 0x400BuLL, 0))
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        goto LABEL_152;
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeNonFirstFragmentsAlso] failed";
      goto LABEL_187;
    }
    if (v5)
      v78 = objc_getProperty(v5, v77, 48, 1);
    else
      v78 = 0;
    v79 = v78;
    v80 = objc_msgSend(v79, "sequencePerTrafficClass");

    if (v80)
    {
      v82 = +[NEIKEv2NotifyPayload createNotifyPayloadType:]();
      v83 = -[NEIKEv2Packet addNotifyPayload:](v9, v82);

      if (!v83)
      {
        ne_log_obj();
        v100 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
          goto LABEL_152;
        LOWORD(buf) = 0;
        v101 = "[packet addNotifyPayload:notifyPayload] failed";
        goto LABEL_187;
      }
    }
    v84 = objc_getProperty(v4, v81, 88, 1);
    objc_msgSend(v84, "configurationRequest");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85)
    {
      v87 = v5;
      v88 = objc_alloc_init(NEIKEv2ConfigPayload);
      objc_setProperty_atomic(v9, v89, v88, 152);

      v91 = objc_getProperty(v4, v90, 88, 1);
      objc_msgSend(v91, "configurationRequest");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_getProperty(v9, v93, 152, 1);
      v96 = v94;
      if (v94)
        objc_setProperty_atomic(v94, v95, v92, 24);

      v98 = objc_getProperty(v9, v97, 152, 1);
      v99 = -[NEIKEv2Payload isValid]((uint64_t)v98);

      v5 = v87;
      if ((v99 & 1) == 0)
      {
        ne_log_obj();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        {
          buf = 136315138;
          v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
          v101 = "%s called with null packet.config.isValid";
LABEL_150:
          v223 = v100;
          v224 = 12;
LABEL_151:
          _os_log_fault_impl(&dword_19BD16000, v223, OS_LOG_TYPE_FAULT, v101, (uint8_t *)&buf, v224);
          goto LABEL_152;
        }
        goto LABEL_152;
      }
    }
LABEL_77:
    v130 = objc_getProperty(v4, v86, 88, 1);
    v131 = objc_msgSend(v130, "initialContactDisabled");

    if ((v131 & 1) != 0 || -[NEIKEv2Packet addNotification:data:](v9, 0x4000uLL, 0))
    {
      v133 = objc_getProperty(v4, v132, 88, 1);
      v134 = objc_msgSend(v133, "negotiateMOBIKE");

      if (!v134 || -[NEIKEv2Packet addNotification:data:](v9, 0x400CuLL, 0))
      {
        v268 = v5;
        -[NEIKEv2IKESA remoteAuthentication](v4, v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v136, "method"))
        {
          if (objc_msgSend(v136, "isSignature"))
          {
            v139 = objc_getProperty(v4, v138, 88, 1);
            if (!v139 || (v140 = v139, v141 = objc_msgSend(v139, "remotePublicKeyRef"), v140, !v141))
            {
              v142 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityHashData](v4);
              if (v142)
              {
                v143 = objc_alloc_init(NEIKEv2CertificateRequestPayload);
                if (!v143)
                {
                  ne_log_obj();
                  v267 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v267, OS_LOG_TYPE_FAULT))
                  {
                    buf = 136315138;
                    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
                    _os_log_fault_impl(&dword_19BD16000, v267, OS_LOG_TYPE_FAULT, "%s called with null certReq", (uint8_t *)&buf, 0xCu);
                  }

                  goto LABEL_208;
                }
                v145 = v143;
                objc_setProperty_atomic(v143, v144, v142, 32);
                v145->_encoding = 4;
                v294 = v145;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v294, 1);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_setProperty_atomic(v9, v147, v146, 120);

              }
            }
          }
          if (objc_msgSend(v136, "isSecurePassword"))
          {
            v149 = -[NEIKEv2GSPM initWithIKESA:]((id *)[NEIKEv2GSPM alloc], v4);
            if (v149)
            {
              v150 = (NEIKEv2CertificatePayload *)v149;
              v151 = objc_alloc_init(NEIKEv2GSPMPayload);
              objc_setProperty_atomic(v9, v152, v151, 144);

              v153 = v150->super._payloadData;
              v155 = objc_getProperty(v9, v154, 144, 1);
              -[NEIKEv2GSPMPayload setGspmData:]((uint64_t)v155, v153);

              objc_setProperty_atomic(v4, v156, v150, 456);
LABEL_92:

LABEL_102:
              v282 = 0u;
              v283 = 0u;
              v280 = 0u;
              v281 = 0u;
              v165 = objc_getProperty(v4, v157, 88, 1);
              objc_msgSend(v165, "customIKEAuthPrivateNotifies");
              v166 = (void *)objc_claimAutoreleasedReturnValue();

              v167 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v280, v292, 16);
              if (v167)
              {
                v168 = v167;
                v169 = *(_QWORD *)v281;
                while (2)
                {
                  v170 = 0;
                  do
                  {
                    if (*(_QWORD *)v281 != v169)
                      objc_enumerationMutation(v166);
                    v171 = *(void **)(*((_QWORD *)&v280 + 1) + 8 * v170);
                    v172 = objc_alloc_init(NEIKEv2NotifyPayload);
                    v173 = objc_msgSend(v171, "notifyStatus");
                    if (v172)
                    {
                      v172->_notifyType = v173;
                      objc_msgSend(v171, "notifyData");
                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setProperty_atomic(v172, v175, v174, 32);
                    }
                    else
                    {
                      objc_msgSend(v171, "notifyData");
                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    if (!-[NEIKEv2Packet addNotifyPayload:](self, v172))
                    {
                      ne_log_obj();
                      v222 = objc_claimAutoreleasedReturnValue();
                      v4 = v269;
                      if (os_log_type_enabled(v222, OS_LOG_TYPE_FAULT))
                      {
                        LOWORD(buf) = 0;
                        _os_log_fault_impl(&dword_19BD16000, v222, OS_LOG_TYPE_FAULT, "[packet addNotifyPayload:notifyPayload] failed", (uint8_t *)&buf, 2u);
                      }

                      v129 = 0;
                      v5 = v268;
                      goto LABEL_147;
                    }

                    ++v170;
                    v4 = v269;
                  }
                  while (v168 != v170);
                  v176 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v280, v292, 16);
                  v168 = v176;
                  if (v176)
                    continue;
                  break;
                }
              }

              v278 = 0u;
              v279 = 0u;
              v276 = 0u;
              v277 = 0u;
              v178 = objc_getProperty(v4, v177, 88, 1);
              objc_msgSend(v178, "customIKEAuthVendorPayloads");
              v179 = (void *)objc_claimAutoreleasedReturnValue();

              v180 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v276, v291, 16);
              v9 = self;
              if (v180)
              {
                v181 = v180;
                v182 = *(_QWORD *)v277;
                do
                {
                  for (i = 0; i != v181; ++i)
                  {
                    if (*(_QWORD *)v277 != v182)
                      objc_enumerationMutation(v179);
                    v184 = *(void **)(*((_QWORD *)&v276 + 1) + 8 * i);
                    v185 = objc_alloc_init(NEIKEv2VendorIDPayload);
                    objc_msgSend(v184, "vendorData");
                    v187 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v185)
                      objc_setProperty_atomic(v185, v186, v187, 24);

                    objc_getProperty(v9, v188, 176, 1);
                    v189 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v189)
                    {
                      objc_getProperty(v9, v190, 176, 1);
                      v191 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v191, "arrayByAddingObject:", v185);
                      v192 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setProperty_atomic(self, v193, v192, 176);

                      v9 = self;
                    }
                    else
                    {
                      v290 = v185;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v290, 1);
                      v191 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setProperty_atomic(v9, v194, v191, 176);
                    }

                  }
                  v181 = objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v276, v291, 16);
                }
                while (v181);
              }

              v274 = 0u;
              v275 = 0u;
              v272 = 0u;
              v273 = 0u;
              v196 = objc_getProperty(v269, v195, 88, 1);
              objc_msgSend(v196, "customIKEAuthPayloads");
              v197 = (void *)objc_claimAutoreleasedReturnValue();

              v198 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v272, v289, 16);
              if (v198)
              {
                v199 = v198;
                v200 = *(_QWORD *)v273;
                do
                {
                  v201 = 0;
                  do
                  {
                    if (*(_QWORD *)v273 != v200)
                      objc_enumerationMutation(v197);
                    v202 = *(void **)(*((_QWORD *)&v272 + 1) + 8 * v201);
                    v203 = objc_alloc_init(NEIKEv2CustomPayload);
                    v204 = objc_msgSend(v202, "customType");
                    if (v203)
                    {
                      v203->_customType = v204;
                      objc_msgSend(v202, "customData");
                      v205 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setProperty_atomic(v203, v206, v205, 32);
                    }
                    else
                    {
                      objc_msgSend(v202, "customData");
                      v205 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_getProperty(v9, v207, 56, 1);
                    v208 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v208)
                    {
                      objc_getProperty(v9, v209, 56, 1);
                      v210 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v210, "arrayByAddingObject:", v203);
                      v211 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setProperty_atomic(self, v212, v211, 56);

                      v9 = self;
                    }
                    else
                    {
                      v288 = v203;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v288, 1);
                      v210 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_setProperty_atomic(v9, v213, v210, 56);
                    }

                    ++v201;
                  }
                  while (v199 != v201);
                  v214 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v272, v289, 16);
                  v199 = v214;
                }
                while (v214);
              }

              v4 = v269;
              v216 = objc_getProperty(v269, v215, 88, 1);
              objc_msgSend(v216, "pduSessionID");
              v217 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v217)
                goto LABEL_143;
              v219 = objc_getProperty(v269, v218, 88, 1);
              objc_msgSend(v219, "pduSessionID");
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              v221 = objc_msgSend(v220, "unsignedCharValue");

              LOBYTE(v284) = v221;
              v271 = 1;
              v150 = (NEIKEv2CertificatePayload *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
              -[NEIKEv2CertificatePayload appendBytes:length:](v150, "appendBytes:length:", &v271, 1);
              -[NEIKEv2CertificatePayload appendBytes:length:](v150, "appendBytes:length:", &v284, 1);
              if (-[NEIKEv2Packet addNotification:data:](v9, 0xC747uLL, v150))
              {

LABEL_143:
                v129 = v9;
LABEL_201:
                v5 = v268;
LABEL_202:

                goto LABEL_154;
              }
              ne_log_obj();
              v236 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v236, OS_LOG_TYPE_FAULT))
                goto LABEL_199;
              LOWORD(buf) = 0;
              v257 = "[packet addNotification:NEIKEv2NotifyTypeMOBIKESupported] failed";
              v258 = v236;
              v259 = 2;
LABEL_179:
              _os_log_fault_impl(&dword_19BD16000, v258, OS_LOG_TYPE_FAULT, v257, (uint8_t *)&buf, v259);
LABEL_199:

              goto LABEL_200;
            }
            ne_log_obj();
            v142 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
            {
LABEL_208:

              v129 = 0;
              v5 = v268;
LABEL_147:
              v9 = self;
              goto LABEL_202;
            }
            LOWORD(buf) = 0;
            v264 = "[NEIKEv2GSPM initWithIKESA:] failed";
            v265 = v142;
            v266 = 2;
LABEL_215:
            _os_log_fault_impl(&dword_19BD16000, v265, OS_LOG_TYPE_FAULT, v264, (uint8_t *)&buf, v266);
            goto LABEL_208;
          }
          v163 = objc_getProperty(v4, v148, 96, 1);
          v164 = -[NEIKEv2IKESAProposal hasEAPMethods](v163);

          if ((v164 & 1) != 0)
            goto LABEL_102;
          v226 = -[NEIKEv2IKESA copyAuthenticationPayloadUsingPrimeKey:](v4, 0);
          objc_setProperty_atomic(v9, v227, v226, 128);

          objc_getProperty(v9, v228, 128, 1);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          v230 = -[NEIKEv2Payload isValid]((uint64_t)v229);

          if ((v230 & 1) != 0)
          {
            if (((_BYTE)v4[3] & 1) == 0)
              goto LABEL_168;
            LOBYTE(v284) = 0;
            v232 = objc_getProperty(v4, v231, 88, 1);
            v233 = objc_msgSend(v232, "ppkIDType");

            LOBYTE(v284) = v233;
            if (v233)
            {
              v235 = objc_getProperty(v4, v234, 88, 1);
              objc_msgSend(v235, "ppkID");
              v150 = (NEIKEv2CertificatePayload *)objc_claimAutoreleasedReturnValue();

              if (v284 != 2 || v150)
              {
                v236 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", -[NEIKEv2CertificatePayload length](v150, "length") + 1);
                -[NSObject appendBytes:length:](v236, "appendBytes:length:", &v284, 1);
                -[NSObject appendData:](v236, "appendData:", v150);
                if (!-[NEIKEv2Packet addNotification:data:](v9, 0x4034uLL, v236))
                {
                  ne_log_obj();
                  v240 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v240, OS_LOG_TYPE_FAULT))
                  {
                    LOWORD(buf) = 0;
                    _os_log_fault_impl(&dword_19BD16000, v240, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypePPKIdentity] failed", (uint8_t *)&buf, 2u);
                  }
                  goto LABEL_198;
                }
                v238 = objc_getProperty(v4, v237, 88, 1);
                v239 = objc_msgSend(v238, "ppkMandatory");

                if ((v239 & 1) != 0)
                {
LABEL_167:

                  v4 = v269;
LABEL_168:
                  -[NEIKEv2IKESA authenticationProtocol](v4, v231);
                  v150 = (NEIKEv2CertificatePayload *)objc_claimAutoreleasedReturnValue();
                  if (-[NEIKEv2CertificatePayload isSignature](v150, "isSignature"))
                  {
                    v245 = objc_getProperty(v4, v244, 88, 1);
                    if (v245)
                    {
                      v246 = v245;
                      v247 = objc_msgSend(v245, "localPrivateKeyRef");

                      if (v247)
                        goto LABEL_102;
                    }
                    else
                    {

                    }
                    v150 = objc_alloc_init(NEIKEv2CertificatePayload);
                    v249 = -[NEIKEv2IKESA copyLocalCertificateData](v4, v248);
                    v251 = v249;
                    if (v150)
                    {
                      objc_setProperty_atomic(v150, v250, v249, 32);

                      v150->_encoding = 4;
                      v253 = objc_getProperty(v150, v252, 32, 1);
                    }
                    else
                    {

                      v253 = 0;
                    }
                    v254 = v253;

                    if (!v254)
                    {
                      ne_log_obj();
                      v236 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v236, OS_LOG_TYPE_FAULT))
                        goto LABEL_199;
                      buf = 136315138;
                      v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
                      v257 = "%s called with null cert.certificateData";
                      v258 = v236;
                      v259 = 12;
                      goto LABEL_179;
                    }
                    v293 = v150;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v293, 1);
                    v255 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_setProperty_atomic(v9, v256, v255, 112);

                  }
                  goto LABEL_92;
                }
                v240 = -[NEIKEv2IKESA copyAuthenticationPayloadUsingPrimeKey:](v269, (const char *)1);
                if ((-[NEIKEv2Payload isValid]((uint64_t)v240) & 1) != 0)
                {
                  if (v240)
                    isa = v240[4].isa;
                  else
                    isa = 0;
                  v242 = isa;
                  v243 = -[NEIKEv2Packet addNotification:data:](v9, 0x4035uLL, v242);

                  if (v243)
                  {

                    v9 = self;
                    goto LABEL_167;
                  }
                  ne_log_obj();
                  v260 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v260, OS_LOG_TYPE_FAULT))
                    goto LABEL_197;
                  LOWORD(buf) = 0;
                  v261 = "[packet addNotification:NEIKEv2NotifyTypeNoPPKAuth] failed";
                  v262 = v260;
                  v263 = 2;
                }
                else
                {
                  ne_log_obj();
                  v260 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v260, OS_LOG_TYPE_FAULT))
                    goto LABEL_197;
                  buf = 136315138;
                  v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
                  v261 = "%s called with null primeAuth.isValid";
                  v262 = v260;
                  v263 = 12;
                }
                _os_log_fault_impl(&dword_19BD16000, v262, OS_LOG_TYPE_FAULT, v261, (uint8_t *)&buf, v263);
LABEL_197:
                v9 = self;

                v4 = v269;
LABEL_198:

                goto LABEL_199;
              }
              ne_log_obj();
              v142 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
                goto LABEL_208;
              buf = 136315138;
              v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
              v264 = "%s called with null ppkID";
            }
            else
            {
              ne_log_obj();
              v142 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
                goto LABEL_208;
              buf = 136315138;
              v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
              v264 = "%s called with null ppkIDType";
            }
            v265 = v142;
            v266 = 12;
            goto LABEL_215;
          }
          ne_log_obj();
          v150 = (NEIKEv2CertificatePayload *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v150->super.super, OS_LOG_TYPE_FAULT))
          {
            buf = 136315138;
            v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
            v160 = "%s called with null packet.auth.isValid";
            p_super = &v150->super.super;
            v162 = 12;
            goto LABEL_182;
          }
        }
        else
        {
          v158 = objc_getProperty(v4, v137, 96, 1);
          v159 = -[NEIKEv2IKESAProposal hasEAPMethods](v158);

          if (!v159 || -[NEIKEv2Packet addNotification:data:](v9, 0x4021uLL, 0))
            goto LABEL_102;
          ne_log_obj();
          v150 = (NEIKEv2CertificatePayload *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v150->super.super, OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf) = 0;
            v160 = "[packet addNotification:NEIKEv2NotifyTypeEAPOnlyAuthentication] failed";
            p_super = &v150->super.super;
            v162 = 2;
LABEL_182:
            _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, v160, (uint8_t *)&buf, v162);
          }
        }
LABEL_200:

        v129 = 0;
        goto LABEL_201;
      }
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        goto LABEL_152;
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeMOBIKESupported] failed";
    }
    else
    {
      ne_log_obj();
      v100 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
        goto LABEL_152;
      LOWORD(buf) = 0;
      v101 = "[packet addNotification:NEIKEv2NotifyTypeInitialContact] failed";
    }
LABEL_187:
    v223 = v100;
    v224 = 2;
    goto LABEL_151;
  }
  v104 = objc_getProperty(v4, v28, 88, 1);
  objc_msgSend(v104, "configurationRequest");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v105)
    goto LABEL_77;
  v106 = v5;
  v107 = objc_getProperty(v4, v86, 88, 1);
  objc_msgSend(v107, "configurationRequest");
  v108 = objc_claimAutoreleasedReturnValue();
  if (!v108)
  {

    v118 = 0;
LABEL_76:

    v5 = v106;
    goto LABEL_77;
  }
  v109 = (void *)v108;
  v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v284 = 0u;
  v285 = 0u;
  v286 = 0u;
  v287 = 0u;
  v112 = objc_getProperty(v109, v111, 16, 1);
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v284, &buf, 16);
  if (v113)
  {
    v114 = v113;
    v115 = *(_QWORD *)v285;
    do
    {
      for (j = 0; j != v114; ++j)
      {
        if (*(_QWORD *)v285 != v115)
          objc_enumerationMutation(v112);
        v117 = *(void **)(*((_QWORD *)&v284 + 1) + 8 * j);
        if (objc_msgSend(v117, "validForChildlessSA"))
          objc_msgSend(v110, "addObject:", v117);
      }
      v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v284, &buf, 16);
    }
    while (v114);
  }

  if (objc_msgSend(v110, "count"))
    v118 = -[NEIKEv2ConfigurationMessage initWithWithAttributes:]([NEIKEv2ConfigurationMessage alloc], "initWithWithAttributes:", v110);
  else
    v118 = 0;
  v4 = v269;
  v9 = self;

  if (!v118)
    goto LABEL_76;
  v119 = objc_alloc_init(NEIKEv2ConfigPayload);
  objc_setProperty_atomic(self, v120, v119, 152);

  v122 = objc_getProperty(self, v121, 152, 1);
  v124 = v122;
  if (v122)
    objc_setProperty_atomic(v122, v123, v118, 24);

  v126 = objc_getProperty(self, v125, 152, 1);
  v127 = -[NEIKEv2Payload isValid]((uint64_t)v126);

  if ((v127 & 1) != 0)
    goto LABEL_76;
  ne_log_obj();
  v128 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_FAULT))
  {
    buf = 136315138;
    v296 = "+[NEIKEv2IKEAuthPacket(Exchange) createIKEAuthForInitiatorIKESA:childSA:]";
    _os_log_fault_impl(&dword_19BD16000, v128, OS_LOG_TYPE_FAULT, "%s called with null packet.config.isValid", (uint8_t *)&buf, 0xCu);
  }

  v129 = 0;
  v5 = v106;
LABEL_154:

  return v129;
}

- (uint64_t)validateFirstAuthPayloadsForInitiator:(void *)a1
{
  _BYTE *v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  void *Property;
  const char *v9;
  void *v10;
  id v11;
  SEL v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  int v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *ErrorAuthentication;
  const char *v36;
  uint64_t v37;
  void *v38;
  char v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  const char *v62;
  void *v63;
  char *v64;
  const char *v65;
  void *v66;
  char *v67;
  uint64_t v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (!v3 || (v3[9] & 1) == 0)
  {
    ne_log_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v70 = "-[NEIKEv2IKEAuthPacket(Exchange) validateFirstAuthPayloadsForInitiator:]";
    v36 = "%s called with null ikeSA.isInitiator";
    goto LABEL_16;
  }
  v6 = objc_getProperty(v3, v4, 96, 1);

  if (!v6)
  {
    ne_log_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
LABEL_24:
      v37 = 0;
LABEL_25:

      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v70 = "-[NEIKEv2IKEAuthPacket(Exchange) validateFirstAuthPayloadsForInitiator:]";
    v36 = "%s called with null ikeSA.chosenProposal";
LABEL_16:
    _os_log_fault_impl(&dword_19BD16000, v20, OS_LOG_TYPE_FAULT, v36, buf, 0xCu);
    goto LABEL_24;
  }
  objc_getProperty(a1, v7, 104, 1);
  Property = (void *)objc_claimAutoreleasedReturnValue();
  v10 = Property;
  if (Property)
    Property = objc_getProperty(Property, v9, 24, 1);
  v11 = Property;
  objc_setProperty_atomic(v5, v12, v11, 504);

  -[NEIKEv2IKESA remoteAuthentication](v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "method");

  if (v15)
  {
    objc_getProperty(a1, v16, 128, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = *(void **)(v17 + 24);
    else
      v19 = 0;
    v20 = v19;

    -[NEIKEv2IKESA setRemoteAuthProtocolUsed:]((uint64_t)v5, v20);
    -[NEIKEv2IKESA remoteAuthentication](v5, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isSecurePassword");

    if (v23)
    {
      if (v20)
      {
        ne_log_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v61 = (char *)objc_msgSend(a1, "copyShortDescription");
          -[NEIKEv2IKESA remoteAuthentication](v5, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v70 = v61;
          v71 = 2112;
          v72 = v20;
          v73 = 2112;
          v74 = v63;
          _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "%@ Initiator packet authentication method %@ is not compatible with configuration %@", buf, 0x20u);

        }
        -[NEIKEv2IKESA remoteAuthentication](v5, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Initiator packet authentication method %@ is not compatible with configuration %@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v20);
LABEL_22:
        v49 = ErrorAuthentication;
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorAuthentication);

LABEL_23:
        goto LABEL_24;
      }
      if (a1)
        v51 = objc_getProperty(a1, v24, 144, 1);
      else
        v51 = 0;
      v52 = v51;

      if (!v52)
      {
        ne_log_obj();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v67 = (char *)objc_msgSend(a1, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v70 = v67;
          _os_log_error_impl(&dword_19BD16000, v53, OS_LOG_TYPE_ERROR, "%@ Packet missing GSPM payload", buf, 0xCu);

        }
        v27 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Packet missing GSPM payload"), v54, v55, v56, v57, v58, v59, v60, v68);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v27);
        goto LABEL_23;
      }
      v20 = 0;
    }
    else
    {
      -[NEIKEv2IKESA remoteAuthentication](v5, v24);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]((uint64_t)NEIKEv2Crypto, v20, v38);

      if ((v39 & 1) == 0)
      {
        ne_log_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v64 = (char *)objc_msgSend(a1, "copyShortDescription");
          -[NEIKEv2IKESA remoteAuthentication](v5, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v70 = v64;
          v71 = 2112;
          v72 = v20;
          v73 = 2112;
          v74 = v66;
          _os_log_error_impl(&dword_19BD16000, v40, OS_LOG_TYPE_ERROR, "%@ Initiator packet authentication method %@ is not compatible with configuration %@", buf, 0x20u);

        }
        -[NEIKEv2IKESA remoteAuthentication](v5, v41);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Packet authentication method %@ is not compatible with configuration %@"), v42, v43, v44, v45, v46, v47, v48, (uint64_t)v20);
        goto LABEL_22;
      }
    }
    v37 = 1;
    goto LABEL_25;
  }
  v37 = 1;
LABEL_26:

  return v37;
}

- (uint64_t)validateAuthAsInitiator:(void *)a3 childSA:
{
  _BYTE *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  char *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  SEL v42;
  id v43;
  const char *v44;
  const char *v45;
  id v46;
  const char *v47;
  id v48;
  const char *v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  const char *v53;
  ptrdiff_t v54;
  NSObject *v55;
  __CFString *v56;
  SEL v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  BOOL v62;
  char v63;
  void *v64;
  id v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  BOOL v73;
  char v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *ErrorAuthentication;
  void *v84;
  id v85;
  int v86;
  NSObject *v87;
  void *v88;
  const char *v89;
  void *v90;
  int v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  id v95;
  __SecKey *v96;
  const char *v97;
  SEL v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id v102;
  char v103;
  const char *v104;
  char v105;
  const char *v106;
  id v107;
  NSObject *v108;
  SEL v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  NSObject *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  char v134;
  char v135;
  NSObject *v136;
  char *v137;
  char *v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  const char *v150;
  id v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  id v159;
  id v160;
  const char *v161;
  id v162;
  id v163;
  uint64_t v164;
  SecKeyRef v165;
  id v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSObject *v175;
  char *v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  id v180;
  id v181;
  char v182;
  const char *v183;
  NSObject *v184;
  NSObject *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  char *v196;
  char *v197;
  char *v198;
  SEL v199;
  __CFString *v200;
  void *v201;
  NSObject *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  char *v211;
  void *v212;
  const char *v213;
  void *v214;
  _BYTE *v215;
  const char *v216;
  const char *v217;
  id v218;
  id v219;
  const char *v220;
  _BYTE *v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  NSObject *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  NSObject *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  id v246;
  NSObject *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *ErrorInternal;
  id v256;
  NSObject *v257;
  __CFString *v258;
  NSObject *v259;
  const char *v260;
  char *v261;
  NSObject *v262;
  SEL v263;
  id v264;
  int v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  NSObject *v273;
  char *v274;
  id v275;
  NSObject *v276;
  const char *v277;
  NSObject *v278;
  SEL v279;
  id v280;
  id v281;
  NSObject *v282;
  NSObject *v283;
  const char *v284;
  __CFString *v285;
  id v286;
  _BYTE *v287;
  const char *v288;
  const char *v289;
  id v290;
  id v291;
  int v292;
  const char *v293;
  NSObject *v294;
  NSObject *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  void *v312;
  char *v313;
  char *v314;
  int v315;
  char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  char *v325;
  void *v326;
  const char *v327;
  void *v328;
  id v329;
  const char *v330;
  void *v331;
  const char *v332;
  void *v333;
  const char *v334;
  void *v335;
  id v336;
  const char *v337;
  void *v338;
  id v339;
  const char *v340;
  id Property;
  const char *v342;
  void *v343;
  id v344;
  SEL v345;
  id v346;
  int v347;
  NSObject *v348;
  char *v349;
  __CFString *v350;
  NSObject *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  __CFString *v359;
  NSObject *v360;
  void *ErrorPeerInvalidSyntax;
  id v362;
  const char *v363;
  __CFString *v364;
  id v365;
  id v366;
  void *v367;
  char *v368;
  char *v369;
  char *v370;
  char *v371;
  char *v372;
  uint64_t v373;
  id obj;
  id obja;
  id v376;
  id v377;
  void *self;
  void *selfa;
  void *selfb;
  void *v381;
  void *v382;
  _BYTE *v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  unsigned __int8 v396;
  uint8_t buf[4];
  const char *v398;
  __int16 v399;
  __CFString *v400;
  __int16 v401;
  _BYTE *v402;
  __int16 v403;
  void *v404;
  _BYTE v405[128];
  _BYTE v406[128];
  _BYTE v407[128];
  uint64_t v408;

  v408 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (!a1)
    goto LABEL_248;
  if (!v5)
  {
    ne_log_obj();
    v259 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v259, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v398 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthAsInitiator:childSA:]";
      v260 = "%s called with null ikeSA";
LABEL_246:
      _os_log_fault_impl(&dword_19BD16000, v259, OS_LOG_TYPE_FAULT, v260, buf, 0xCu);
    }
LABEL_247:

LABEL_248:
    v194 = 0;
    goto LABEL_175;
  }
  if (!v6 && (v5[23] & 1) == 0)
  {
    ne_log_obj();
    v259 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v259, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v398 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthAsInitiator:childSA:]";
      v260 = "%s called with null childSA";
      goto LABEL_246;
    }
    goto LABEL_247;
  }
  if ((v5[9] & 1) == 0)
  {
    ne_log_obj();
    v259 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v259, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v398 = "-[NEIKEv2IKEAuthPacket(Exchange) validateAuthAsInitiator:childSA:]";
      v260 = "%s called with null ikeSA.isInitiator";
      goto LABEL_246;
    }
    goto LABEL_247;
  }
  v383 = v5;
  if (-[NEIKEv2Packet hasErrors](a1, v7))
  {
    v394 = 0u;
    v395 = 0u;
    v392 = 0u;
    v393 = 0u;
    v10 = objc_getProperty(a1, v9, 64, 1);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v392, v407, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v393;
      v381 = v8;
      do
      {
        v15 = a1;
        v16 = 0;
        do
        {
          if (*(_QWORD *)v393 != v14)
            objc_enumerationMutation(v10);
          v17 = *(_QWORD *)(*((_QWORD *)&v392 + 1) + 8 * v16);
          if (v17 && (unint64_t)(*(_QWORD *)(v17 + 24) - 1) <= 0x3FFE)
          {
            v18 = (__CFString *)-[NEIKEv2NotifyPayload copyError](*(const __CFString **)(*((_QWORD *)&v392 + 1) + 8 * v16));

            ne_log_obj();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v25 = (char *)objc_msgSend(v15, "copyShortDescription");
              *(_DWORD *)buf = 138412546;
              v398 = v25;
              v399 = 2112;
              v400 = v18;
              _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "%@ Initiator auth received notify error %@", buf, 0x16u);

            }
            v5 = v383;
            if ((*(_QWORD *)(v17 + 24) & 0xFFFFFFFFFFFFE000) != 0x2000
              || (v383[18] & 1) != 0
              || ((objc_getProperty(v15, v20, 128, 1),
                   v21 = objc_claimAutoreleasedReturnValue(),
                   (v22 = (void *)v21) == 0)
                ? (v23 = 0)
                : (v23 = *(void **)(v21 + 32)),
                  v24 = v23,
                  v24,
                  v22,
                  !v24))
            {
              -[NEIKEv2IKESA setState:error:]((uint64_t)v383, 3uLL, v18);
              v396 = 0;

              v8 = v381;
              goto LABEL_174;
            }
            v13 = v18;
          }
          ++v16;
        }
        while (v12 != v16);
        v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v392, v407, 16);
        v12 = v26;
        v8 = v381;
        a1 = v15;
      }
      while (v26);
    }
    else
    {
      v13 = 0;
    }

    v18 = v13;
  }
  else
  {
    v18 = 0;
  }
  if (!-[NEIKEv2IKESA usesEAPOnlyAuthentication](v5, v9) || (v5[20] & 1) != 0)
  {
    if ((v5[24] & 1) != 0 && (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4034) & 1) == 0)
    {
      v37 = 1;
      v85 = objc_getProperty(v5, v27, 88, 1);
      v86 = objc_msgSend(v85, "ppkMandatory");

      if (v86)
      {
        ne_log_obj();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          v197 = (char *)objc_msgSend(a1, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v398 = v197;
          _os_log_error_impl(&dword_19BD16000, v87, OS_LOG_TYPE_ERROR, "%@ No PPK ID notify received with mandatory PPK auth", buf, 0xCu);

        }
        v36 = CFSTR("No PPK ID received with mandatory PPK auth");
        goto LABEL_82;
      }
    }
    else
    {
      v37 = 0;
    }
    objc_getProperty(a1, v27, 128, 1);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v38;
    if (v38)
      v40 = *(void **)(v38 + 24);
    else
      v40 = 0;
    v41 = v40;

    v43 = objc_getProperty(v5, v42, 448, 1);
    if (v43)
    {
      if (objc_msgSend(v41, "method") != 2)
      {
        ne_log_obj();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          v138 = (char *)objc_msgSend(a1, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v398 = v138;
          _os_log_error_impl(&dword_19BD16000, v75, OS_LOG_TYPE_ERROR, "%@ Authentication method for EAP was not shared key", buf, 0xCu);

        }
        ErrorAuthentication = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Authentication method for EAP was not shared key"), v76, v77, v78, v79, v80, v81, v82, v373);
        goto LABEL_76;
      }
      v46 = objc_getProperty(v5, v45, 448, 1);

      if (v46)
      {
        v48 = objc_getProperty(v5, v47, 96, 1);

        if (v48)
        {
          self = a1;
          v50 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v5, (const char *)v37);
          if (v50)
          {
            v51 = objc_getProperty(v5, v49, 448, 1);
            -[NEIKEv2EAP sessionKey]((uint64_t)v51);
            v52 = objc_claimAutoreleasedReturnValue();

            if (v52
              || (!(_DWORD)v37 ? (v54 = 248) : (v54 = 256),
                  objc_getProperty(v5, v53, v54, 1),
                  (v52 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v55 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v5, v52, v50);
              if (v55)
              {
                v56 = (__CFString *)v55;

                objc_getProperty(self, v57, 128, 1);
                v58 = objc_claimAutoreleasedReturnValue();
                v59 = (void *)v58;
                if (v58)
                  v60 = *(void **)(v58 + 32);
                else
                  v60 = 0;
                v61 = v60;
                v62 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v56, v61);

                if (v62)
                {
                  v5[18] = 1;
                  if ((v5[24] & 1) != 0)
                    v63 = v37;
                  else
                    v63 = 1;
                  if ((v63 & 1) == 0)
                    v5[19] = 1;
                  v64 = self;
LABEL_150:

                  if ((_DWORD)v37)
                    -[NEIKEv2IKESA restorePrimeKeys](v5, v177);
                  if (v18)
                  {
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v18);
                    goto LABEL_77;
                  }
                  if (-[NEIKEv2Packet hasNotification:](v64, (const char *)0x4017))
                  {
                    v179 = 5;
LABEL_156:
                    ErrorAuthentication = (void *)NEIKEv2CreateError(v179);
LABEL_76:
                    v84 = ErrorAuthentication;
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorAuthentication);

LABEL_77:
                    v396 = 0;
                    goto LABEL_173;
                  }
                  if ((v5[23] & 1) != 0)
                  {
LABEL_261:
                    v339 = objc_getProperty(v64, v178, 152, 1);

                    if (v339)
                    {
                      Property = objc_getProperty(v64, v340, 152, 1);
                      v343 = Property;
                      if (Property)
                        Property = objc_getProperty(Property, v342, 24, 1);
                      v344 = Property;
                      objc_setProperty_atomic(v5, v345, v344, 488);

                    }
                    v346 = objc_getProperty(v5, v340, 88, 1);
                    if (objc_msgSend(v346, "negotiateMOBIKE"))
                    {
                      v347 = -[NEIKEv2Packet hasNotification:](v64, (const char *)0x400C);

                      if (v347)
                      {
                        ne_log_obj();
                        v348 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v348, OS_LOG_TYPE_DEBUG))
                        {
                          v349 = (char *)objc_msgSend(v64, "copyShortDescription");
                          *(_DWORD *)buf = 138412290;
                          v398 = v349;
                          _os_log_debug_impl(&dword_19BD16000, v348, OS_LOG_TYPE_DEBUG, "%@ Server MOBIKE supported", buf, 0xCu);

                        }
                        v5[11] = 1;
                      }
                    }
                    else
                    {

                    }
                    v396 = 1;
                    goto LABEL_173;
                  }
                  if (v8)
                    v180 = objc_getProperty(v8, v178, 48, 1);
                  else
                    v180 = 0;
                  v181 = v180;
                  if (objc_msgSend(v181, "mode") == 1)
                  {
                    v182 = -[NEIKEv2Packet hasNotification:](v64, (const char *)0x4007);

                    if ((v182 & 1) == 0)
                    {
                      ne_log_obj();
                      v184 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                      {
                        v325 = (char *)objc_msgSend(v64, "copyShortDescription");
                        *(_DWORD *)buf = 138412290;
                        v398 = v325;
                        _os_log_error_impl(&dword_19BD16000, v184, OS_LOG_TYPE_ERROR, "%@ Transport mode Child SA was not accepted", buf, 0xCu);

                      }
                      v179 = 9;
                      goto LABEL_156;
                    }
                  }
                  else
                  {

                  }
                  objc_getProperty(v64, v183, 88, 1);
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  v214 = v212;
                  if (v212)
                    v212 = objc_getProperty(v212, v213, 24, 1);
                  v56 = v212;

                  if (-[__CFString count](v56, "count") == 1)
                  {
                    -[__CFString firstObject](v56, "firstObject");
                    v215 = (_BYTE *)objc_claimAutoreleasedReturnValue();
                    if ((-[NEIKEv2ChildSAProposal isAValidResponse](v215, v216) & 1) != 0)
                    {
                      if (v215)
                        v218 = objc_getProperty(v215, v217, 80, 1);
                      else
                        v218 = 0;
                      v219 = v218;

                      if (v219)
                      {
                        selfb = v64;
                        v386 = 0u;
                        v387 = 0u;
                        v384 = 0u;
                        v385 = 0u;
                        v221 = v8;
                        -[NEIKEv2ChildSA configProposalsWithoutKEM](v8, v220);
                        v222 = (void *)objc_claimAutoreleasedReturnValue();
                        v223 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v384, v405, 16);
                        if (v223)
                        {
                          v224 = v223;
                          v225 = *(_QWORD *)v385;
LABEL_190:
                          v226 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v385 != v225)
                              objc_enumerationMutation(v222);
                            v227 = *(void **)(*((_QWORD *)&v384 + 1) + 8 * v226);
                            if ((-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]((uint64_t)v227, v215, 0, 0) & 1) != 0)break;
                            if (v224 == ++v226)
                            {
                              v224 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v384, v405, 16);
                              if (v224)
                                goto LABEL_190;
                              goto LABEL_196;
                            }
                          }
                          v275 = v227;

                          if (!v275)
                            goto LABEL_237;
                          v276 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v275, v215, 0, 0);
                          v278 = v276;
                          v5 = v383;
                          v8 = v221;
                          if (v221)
                          {
                            objc_setProperty_atomic(v221, v277, v276, 56);

                            v280 = objc_getProperty(v221, v279, 56, 1);
                          }
                          else
                          {

                            v280 = 0;
                          }
                          v281 = v280;

                          ne_log_obj();
                          v282 = objc_claimAutoreleasedReturnValue();
                          v283 = v282;
                          if (v281)
                          {
                            if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
                            {
                              v285 = (__CFString *)objc_msgSend(selfb, "copyShortDescription");
                              if (v221)
                                v286 = objc_getProperty(v221, v284, 56, 1);
                              else
                                v286 = 0;
                              v287 = v286;
                              *(_DWORD *)buf = 138412802;
                              v8 = v221;
                              v398 = v221;
                              v399 = 2112;
                              v400 = v285;
                              v401 = 2112;
                              v402 = v287;
                              _os_log_impl(&dword_19BD16000, v283, OS_LOG_TYPE_DEFAULT, "%@ %@ Chose responder auth child proposal %@", buf, 0x20u);

                            }
                            -[NEIKEv2ChildSA setConfigProposalsWithoutKEM:](v8, v288);
                            if (v8)
                              v290 = objc_getProperty(v8, v289, 48, 1);
                            else
                              v290 = 0;
                            v291 = v290;
                            if (objc_msgSend(v291, "sequencePerTrafficClass"))
                            {
                              v292 = -[NEIKEv2Packet hasNotification:](selfb, (const char *)0xC350);

                              if (v292)
                              {
                                ne_log_obj();
                                v294 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v294, OS_LOG_TYPE_DEBUG))
                                {
                                  v371 = (char *)objc_msgSend(selfb, "copyShortDescription");
                                  *(_DWORD *)buf = 138412290;
                                  v398 = v371;
                                  _os_log_debug_impl(&dword_19BD16000, v294, OS_LOG_TYPE_DEBUG, "%@ Server Sequence Per Traffic Class supported", buf, 0xCu);

                                }
                                if (v221)
                                  v221[10] = 1;
                              }
                            }
                            else
                            {

                            }
                            objc_getProperty(selfb, v293, 160, 1);
                            v326 = (void *)objc_claimAutoreleasedReturnValue();
                            v328 = v326;
                            if (v326)
                              v326 = objc_getProperty(v326, v327, 24, 1);
                            v329 = v326;
                            -[NEIKEv2ChildSA setInitiatorTrafficSelectors:](v221, v329);

                            -[NEIKEv2ChildSA initiatorTrafficSelectors](v221, v330);
                            v331 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v331)
                            {
                              objc_getProperty(selfb, v332, 168, 1);
                              v333 = (void *)objc_claimAutoreleasedReturnValue();
                              v335 = v333;
                              if (v333)
                                v333 = objc_getProperty(v333, v334, 24, 1);
                              v336 = v333;
                              -[NEIKEv2ChildSA setResponderTrafficSelectors:](v221, v336);

                              -[NEIKEv2ChildSA responderTrafficSelectors](v221, v337);
                              v338 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v338)
                              {

                                v5 = v383;
                                v8 = v221;
                                v18 = 0;
                                v64 = selfb;
                                goto LABEL_261;
                              }
                              ne_log_obj();
                              v360 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
                              {
                                v372 = (char *)objc_msgSend(selfb, "copyShortDescription");
                                *(_DWORD *)buf = 138412290;
                                v398 = v372;
                                _os_log_error_impl(&dword_19BD16000, v360, OS_LOG_TYPE_ERROR, "%@ Could not set responder traffic selectors", buf, 0xCu);

                              }
                              v359 = CFSTR("Could not set responder traffic selectors");
                            }
                            else
                            {
                              ne_log_obj();
                              v351 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
                              {
                                v370 = (char *)objc_msgSend(selfb, "copyShortDescription");
                                *(_DWORD *)buf = 138412290;
                                v398 = v370;
                                _os_log_error_impl(&dword_19BD16000, v351, OS_LOG_TYPE_ERROR, "%@ Could not set initiator traffic selectors", buf, 0xCu);

                              }
                              v359 = CFSTR("Could not set initiator traffic selectors");
                            }
                            ErrorPeerInvalidSyntax = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v359, v352, v353, v354, v355, v356, v357, v358, v373);
                            v5 = v383;
                            -[NEIKEv2IKESA setState:error:]((uint64_t)v383, 3uLL, ErrorPeerInvalidSyntax);

                            v396 = 0;
                            v8 = v221;
                          }
                          else
                          {
                            if (os_log_type_enabled(v282, OS_LOG_TYPE_ERROR))
                            {
                              v369 = (char *)objc_msgSend(selfb, "copyShortDescription");
                              *(_DWORD *)buf = 138412290;
                              v398 = v369;
                              _os_log_error_impl(&dword_19BD16000, v283, OS_LOG_TYPE_ERROR, "%@ Could not set chosen proposal values", buf, 0xCu);

                            }
                            v324 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Could not set chosen proposal values"), v317, v318, v319, v320, v321, v322, v323, v373);
                            -[NEIKEv2IKESA setState:error:]((uint64_t)v383, 3uLL, v324);

                            v396 = 0;
                          }
                        }
                        else
                        {
LABEL_196:

LABEL_237:
                          ne_log_obj();
                          v295 = objc_claimAutoreleasedReturnValue();
                          v5 = v383;
                          v8 = v221;
                          if (os_log_type_enabled(v295, OS_LOG_TYPE_ERROR))
                          {
                            v362 = v41;
                            v364 = (__CFString *)objc_msgSend(selfb, "copyShortDescription");
                            if (v221)
                              v365 = objc_getProperty(v221, v363, 48, 1);
                            else
                              v365 = 0;
                            v366 = v365;
                            objc_msgSend(v366, "proposals");
                            v367 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138413058;
                            v8 = v221;
                            v398 = v221;
                            v399 = 2112;
                            v400 = v364;
                            v401 = 2112;
                            v402 = v215;
                            v403 = 2112;
                            v404 = v367;
                            _os_log_error_impl(&dword_19BD16000, v295, OS_LOG_TYPE_ERROR, "%@ %@ Received child proposal %@ does not match config %@", buf, 0x2Au);

                            v5 = v383;
                            v41 = v362;
                          }

                          v303 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Received child proposal does not match config"), v296, v297, v298, v299, v300, v301, v302, v373);
                          -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v303);

                          v396 = 0;
                        }

                        v18 = 0;
                        goto LABEL_173;
                      }
                      v256 = v41;
                      ne_log_obj();
                      v257 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v257, OS_LOG_TYPE_ERROR))
                      {
                        v368 = (char *)objc_msgSend(v64, "copyShortDescription");
                        *(_DWORD *)buf = 138412290;
                        v398 = v368;
                        _os_log_error_impl(&dword_19BD16000, v257, OS_LOG_TYPE_ERROR, "%@ Child SA proposal missing SPI", buf, 0xCu);

                      }
                      v258 = CFSTR("Received child proposal missing SPI %@");
                    }
                    else
                    {
                      v256 = v41;
                      ne_log_obj();
                      v257 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v257, OS_LOG_TYPE_ERROR))
                      {
                        v350 = (__CFString *)objc_msgSend(v64, "copyShortDescription");
                        *(_DWORD *)buf = 138412802;
                        v398 = (const char *)v8;
                        v399 = 2112;
                        v400 = v350;
                        v401 = 2112;
                        v402 = v215;
                        _os_log_error_impl(&dword_19BD16000, v257, OS_LOG_TYPE_ERROR, "%@ %@ Received invalid child proposal %@", buf, 0x20u);

                      }
                      v258 = CFSTR("Received invalid child proposal %@");
                    }

                    v311 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(v258, v304, v305, v306, v307, v308, v309, v310, (uint64_t)v215);
                    -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v311);

                    v396 = 0;
                    v41 = v256;
LABEL_173:

                    goto LABEL_174;
                  }
                  ne_log_obj();
                  v228 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
                  {
                    v314 = (char *)objc_msgSend(v64, "copyShortDescription");
                    v315 = -[__CFString count](v56, "count");
                    *(_DWORD *)buf = 138412546;
                    v398 = v314;
                    v399 = 1024;
                    LODWORD(v400) = v315;
                    _os_log_error_impl(&dword_19BD16000, v228, OS_LOG_TYPE_ERROR, "%@ Received %u child SA proposals, require 1", buf, 0x12u);

                  }
                  v229 = -[__CFString count](v56, "count");
                  v147 = (void *)NEIKEv2CreateErrorPeerInvalidSyntax(CFSTR("Received %u child SA proposals"), v230, v231, v232, v233, v234, v235, v236, v229);
                  goto LABEL_171;
                }
                a1 = self;
                goto LABEL_168;
              }
              ne_log_obj();
              v136 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v136, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_19BD16000, v136, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret failed", buf, 2u);
              }

              goto LABEL_166;
            }
            ne_log_obj();
            v52 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
            {
LABEL_166:

              a1 = self;
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            v128 = "skPr failed";
          }
          else
          {
            ne_log_obj();
            v52 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
              goto LABEL_166;
            *(_WORD *)buf = 0;
            v128 = "createResponderSignedOctetsUsingPrimeKey: failed";
          }
          _os_log_fault_impl(&dword_19BD16000, v52, OS_LOG_TYPE_FAULT, v128, buf, 2u);
          goto LABEL_166;
        }
        ne_log_obj();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v398 = "-[NEIKEv2IKESA(Crypto) createResponderEAPAuthenticationDataUsingPrimeKey:]";
          v106 = "%s called with null self.chosenProposal";
          goto LABEL_106;
        }
      }
      else
      {
        ne_log_obj();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v398 = "-[NEIKEv2IKESA(Crypto) createResponderEAPAuthenticationDataUsingPrimeKey:]";
          v106 = "%s called with null self.eapClient";
LABEL_106:
          _os_log_fault_impl(&dword_19BD16000, v50, OS_LOG_TYPE_FAULT, v106, buf, 0xCu);
        }
      }
LABEL_167:

      v56 = 0;
LABEL_168:
      ne_log_obj();
      v185 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
      {
        v196 = (char *)objc_msgSend(a1, "copyShortDescription");
        *(_DWORD *)buf = 138412290;
        v398 = v196;
        _os_log_error_impl(&dword_19BD16000, v185, OS_LOG_TYPE_ERROR, "%@ EAP authentication data could not be verified", buf, 0xCu);

      }
      v147 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("EAP authentication data could not be verified"), v186, v187, v188, v189, v190, v191, v192, v373);
      goto LABEL_171;
    }
    v65 = objc_getProperty(v5, v44, 456, 1);

    if (v65)
    {
      if (objc_msgSend(v41, "method") != 12)
      {
        v107 = v41;
        ne_log_obj();
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
        {
          v198 = (char *)objc_msgSend(a1, "copyShortDescription");
          objc_getProperty(a1, v199, 128, 1);
          v200 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v398 = v198;
          v399 = 2112;
          v400 = v200;
          _os_log_error_impl(&dword_19BD16000, v108, OS_LOG_TYPE_ERROR, "%@ Wrong authentication method %@ for GSPM", buf, 0x16u);

        }
        objc_getProperty(a1, v109, 128, 1);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Wrong authentication method %@ for GSPM"), v111, v112, v113, v114, v115, v116, v117, (uint64_t)v110);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v118);

        v396 = 0;
        v41 = v107;
        goto LABEL_173;
      }
      v376 = v41;
      v66 = a1;
      v68 = -[NEIKEv2IKESA createResponderGSPMAuthenticationDataUsingPrimeKey:](v5, (const char *)v37);
      if (!v68)
        goto LABEL_101;
      objc_getProperty(a1, v67, 128, 1);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = (void *)v69;
      v71 = v69 ? *(void **)(v69 + 32) : 0;
      v72 = v71;
      v73 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v68, v72);

      if (!v73)
      {
LABEL_101:
        ne_log_obj();
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          v211 = (char *)objc_msgSend(v66, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v398 = v211;
          _os_log_error_impl(&dword_19BD16000, v119, OS_LOG_TYPE_ERROR, "%@ GSPM authentication data could not be verified", buf, 0xCu);

        }
        v127 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("GSPM authentication data could not be verified"), v120, v121, v122, v123, v124, v125, v126, v373);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v127);

        v396 = 0;
        v41 = v376;
        goto LABEL_173;
      }
      v5[18] = 1;
      if ((v5[24] & 1) != 0)
        v74 = v37;
      else
        v74 = 1;
      if ((v74 & 1) == 0)
        v5[19] = 1;
      v64 = v66;
      v56 = (__CFString *)v68;
      v41 = v376;
      goto LABEL_150;
    }
    if ((-[NEIKEv2IKEAuthPacket validateFirstAuthPayloadsForInitiator:](a1, v5) & 1) == 0)
      goto LABEL_77;
    v56 = (__CFString *)v41;
    -[NEIKEv2IKESA remoteAuthentication](v5, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "isNonStandard");

    if (v91)
    {
      -[NEIKEv2IKESA remoteAuthentication](v5, v92);
      v93 = objc_claimAutoreleasedReturnValue();

      v56 = (__CFString *)v93;
    }
    if (!-[__CFString isSignature](v56, "isSignature"))
    {
      objc_getProperty(a1, v94, 128, 1);
      v129 = objc_claimAutoreleasedReturnValue();
      v130 = (void *)v129;
      v131 = a1;
      if (v129)
        v132 = *(void **)(v129 + 32);
      else
        v132 = 0;
      v133 = v132;
      v134 = -[NEIKEv2IKESA checkSharedKeyAuthData:usingPrimeKey:]((uint64_t)v5, v133, (const char *)v37);

      if ((v134 & 1) != 0)
      {
        v5[18] = 1;
        if ((v5[24] & 1) != 0)
          v135 = v37;
        else
          v135 = 1;
        if ((v135 & 1) == 0)
          v5[19] = 1;
        v64 = v131;
        goto LABEL_150;
      }
      ne_log_obj();
      v139 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      {
        v261 = (char *)objc_msgSend(v131, "copyShortDescription");
        *(_DWORD *)buf = 138412546;
        v398 = v261;
        v399 = 2112;
        v400 = v56;
        _os_log_error_impl(&dword_19BD16000, v139, OS_LOG_TYPE_ERROR, "%@ Initiator failed to validate remote authentication data %@", buf, 0x16u);

      }
      v147 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Failed to validate remote authentication data %@"), v140, v141, v142, v143, v144, v145, v146, (uint64_t)v56);
LABEL_171:
      v193 = v147;
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v147);

      v396 = 0;
LABEL_172:

      goto LABEL_173;
    }
    selfa = a1;
    v95 = objc_getProperty(v5, v94, 88, 1);
    v96 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v95);

    if (v96)
    {
LABEL_88:
      obj = (id)-[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:]((uint64_t)v5, (const char *)v37);
      objc_getProperty(selfa, v98, 128, 1);
      v99 = objc_claimAutoreleasedReturnValue();
      v100 = (void *)v99;
      if (v99)
        v101 = *(void **)(v99 + 32);
      else
        v101 = 0;
      v102 = v101;
      v103 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]((uint64_t)NEIKEv2Crypto, v102, obj, v56, v96);

      CFRelease(v96);
      if ((v103 & 1) != 0)
      {
        v5 = v383;
        v383[18] = 1;
        if ((v383[24] & 1) != 0)
          v105 = v37;
        else
          v105 = 1;
        v64 = selfa;
        if ((v105 & 1) == 0)
          v383[19] = 1;
      }
      else
      {
        v5 = v383;
        v166 = objc_getProperty(v383, v104, 88, 1);
        v167 = objc_msgSend(v166, "disableRemoteCertificateValidation");

        if (!v167)
        {
          v201 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Authentication data could not be verified %@"), v168, v169, v170, v171, v172, v173, v174, (uint64_t)v56);
          -[NEIKEv2IKESA setState:error:]((uint64_t)v383, 3uLL, v201);

          v396 = 0;
          goto LABEL_172;
        }
        ne_log_obj();
        v175 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
        {
          v176 = (char *)objc_msgSend(selfa, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v398 = v176;
          _os_log_impl(&dword_19BD16000, v175, OS_LOG_TYPE_INFO, "%@ Passing authentication because configuration does not require remote signature validation", buf, 0xCu);

        }
        v64 = selfa;
      }

      goto LABEL_150;
    }
    v382 = v8;
    objc_getProperty(selfa, v97, 112, 1);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "count");

    if (!v149)
    {
      ne_log_obj();
      v202 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
      {
        v313 = (char *)objc_msgSend(selfa, "copyShortDescription");
        *(_DWORD *)buf = 138412290;
        v398 = v313;
        _os_log_error_impl(&dword_19BD16000, v202, OS_LOG_TYPE_ERROR, "%@ No certificate payload received", buf, 0xCu);

      }
      v210 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("No certificate payload received"), v203, v204, v205, v206, v207, v208, v209, v373);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v210);

      v396 = 0;
      goto LABEL_172;
    }
    v151 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v151)
    {
      v390 = 0u;
      v391 = 0u;
      v388 = 0u;
      v389 = 0u;
      objc_getProperty(selfa, v150, 112, 1);
      obja = (id)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v388, v406, 16);
      if (v152)
      {
        v154 = v152;
        v155 = *(_QWORD *)v389;
        v377 = v41;
        while (2)
        {
          v156 = 0;
          do
          {
            v157 = v151;
            if (*(_QWORD *)v389 != v155)
              objc_enumerationMutation(obja);
            v158 = *(void **)(*((_QWORD *)&v388 + 1) + 8 * v156);
            if (v158)
              v159 = objc_getProperty(*(id *)(*((_QWORD *)&v388 + 1) + 8 * v156), v153, 32, 1);
            else
              v159 = 0;
            v160 = v159;

            if (!v160)
            {
              ne_log_obj();
              v237 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
              {
                v316 = (char *)objc_msgSend(selfa, "copyShortDescription");
                *(_DWORD *)buf = 138412290;
                v398 = v316;
                _os_log_error_impl(&dword_19BD16000, v237, OS_LOG_TYPE_ERROR, "%@ Certificate missing data", buf, 0xCu);

              }
              v245 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Certificate missing data"), v238, v239, v240, v241, v242, v243, v244, v373);
              v5 = v383;
              -[NEIKEv2IKESA setState:error:]((uint64_t)v383, 3uLL, v245);

              v396 = 0;
              v8 = v382;
              v41 = v377;
              v151 = v157;
              goto LABEL_206;
            }
            if (v158)
              v162 = objc_getProperty(v158, v161, 32, 1);
            else
              v162 = 0;
            v163 = v162;
            v151 = v157;
            objc_msgSend(v157, "addObject:", v163);

            ++v156;
          }
          while (v154 != v156);
          v164 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v388, v406, 16);
          v154 = v164;
          v41 = v377;
          if (v164)
            continue;
          break;
        }
      }

      v5 = v383;
      v165 = -[NEIKEv2IKESA checkValidityOfCertificates:](v383, v151);
      if (v165)
      {
        v96 = v165;

        v8 = v382;
        goto LABEL_88;
      }
      ne_log_obj();
      v262 = objc_claimAutoreleasedReturnValue();
      v8 = v382;
      if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v262, OS_LOG_TYPE_ERROR, "Certificate chain could not be verified", buf, 2u);
      }

      v264 = objc_getProperty(v383, v263, 88, 1);
      v265 = objc_msgSend(v264, "disableRemoteCertificateValidation");

      if (v265)
      {
        ne_log_obj();
        v273 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v273, OS_LOG_TYPE_INFO))
        {
          v274 = (char *)objc_msgSend(selfa, "copyShortDescription");
          *(_DWORD *)buf = 138412290;
          v398 = v274;
          _os_log_impl(&dword_19BD16000, v273, OS_LOG_TYPE_INFO, "%@ Passing authentication because configuration does not require certificate validation", buf, 0xCu);

        }
        v396 = 1;
        v8 = v382;
      }
      else
      {
        v312 = (void *)NEIKEv2CreateErrorAuthentication(CFSTR("Certificate chain could not be verified"), v266, v267, v268, v269, v270, v271, v272, v373);
        -[NEIKEv2IKESA setState:error:]((uint64_t)v383, 3uLL, v312);

        v396 = 0;
      }
    }
    else
    {
      v246 = v41;
      ne_log_obj();
      v247 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v247, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v247, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
      }

      ErrorInternal = (void *)NEIKEv2CreateErrorInternal(CFSTR("[[NSMutableArray alloc] init] failed"), v248, v249, v250, v251, v252, v253, v254, v373);
      -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, ErrorInternal);

      v396 = 0;
      v41 = v246;
    }
LABEL_206:

    goto LABEL_172;
  }
  ne_log_obj();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v137 = (char *)objc_msgSend(a1, "copyShortDescription");
    *(_DWORD *)buf = 138412290;
    v398 = v137;
    _os_log_error_impl(&dword_19BD16000, v28, OS_LOG_TYPE_ERROR, "%@ EAP only authentication incomplete", buf, 0xCu);

  }
  v36 = CFSTR("EAP only authentication did not complete");
LABEL_82:
  v88 = (void *)NEIKEv2CreateErrorAuthentication(v36, v29, v30, v31, v32, v33, v34, v35, v373);
  -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v88);

  v396 = 0;
LABEL_174:

  v194 = v396;
LABEL_175:

  return v194;
}

+ (id)prepareDeviceIdentityNotifyPayload:(void *)a3 IMEISV:(void *)a4 lastResponderPacket:
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;
  int8x8x2_t v22;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (!v7 || objc_msgSend(v7, "length") != 16)
  {
    if (!v6)
      goto LABEL_9;
    if (objc_msgSend(v6, "length") != 15)
      goto LABEL_9;
    v20[0] = -1;
    v12 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend(v6, "dataUsingEncoding:", 4, *(_QWORD *)v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataWithData:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 1;
    objc_msgSend(v14, "appendBytes:length:", v20, 1);
    v15 = objc_retainAutorelease(v14);
    v10 = (const char *)objc_msgSend(v15, "bytes");

    if (!v10)
      goto LABEL_9;
LABEL_8:
    v22 = vld2_s8(v10);
    *(_WORD *)v20 = 2304;
    v20[2] = v11;
    *(int8x8_t *)&v20[3] = vsli_n_s8(v22.val[0], v22.val[1], 4uLL);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v20, 11);
    goto LABEL_12;
  }
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "bytes");

  v11 = 2;
  if (v10)
    goto LABEL_8;
LABEL_9:
  ne_log_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(v8, "copyShortDescription");
    *(_DWORD *)v20 = 138412290;
    *(_QWORD *)&v20[4] = v19;
    _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "%@ Could not find Device Identity (IMEI) data", v20, 0xCu);

  }
  v16 = 0;
LABEL_12:

  return v16;
}

+ (id)createIKEAuthResponse:(unint64_t)a3 refusalError:
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  __int16 v12;

  v4 = a2;
  objc_opt_self();
  v5 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2IKEAuthPacket alloc], v4);

  if (!v5)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_7:

      v6 = 0;
      goto LABEL_8;
    }
    v12 = 0;
    v8 = "[[NEIKEv2IKESAInitPacket alloc] initResponse:] failed";
    v9 = (uint8_t *)&v12;
LABEL_10:
    _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, v8, v9, 2u);
    goto LABEL_7;
  }
  if (!-[NEIKEv2Packet addNotification:data:](v5, a3, 0))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_7;
    v11 = 0;
    v8 = "[packet addNotification:refusalError] failed";
    v9 = (uint8_t *)&v11;
    goto LABEL_10;
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)gatherPayloads
{
  NEIKEv2IKEAuthPacket *v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  SEL v7;
  SEL v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  SEL v18;
  SEL v19;
  SEL v20;
  id v21;

  v2 = self;
  if (self)
    self = (NEIKEv2IKEAuthPacket *)objc_getProperty(self, a2, 64, 1);
  v21 = (id)-[NEIKEv2IKEAuthPacket mutableCopy](self, "mutableCopy");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v3;
  if (v2)
  {
    if (objc_getProperty(v2, v4, 96, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v6, 96, 1));
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v6, 112, 1));
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 0x4000, v21, v5);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16392, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v7, 120, 1));
    if (objc_getProperty(v2, v8, 104, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v9, 104, 1));
    if (objc_getProperty(v2, v9, 128, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v10, 128, 1));
    if (objc_getProperty(v2, v10, 152, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v11, 152, 1));
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", 0);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 0x4000, v21, v5);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16392, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", 0);
  }
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16387, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16391, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16394, v21, v5);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16395, v21, v5);
  if (v2)
  {
    if (objc_getProperty(v2, v12, 136, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v13, 136, 1));
    if (objc_getProperty(v2, v13, 144, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v14, 144, 1));
    if (objc_getProperty(v2, v14, 88, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v15, 88, 1));
    if (objc_getProperty(v2, v15, 160, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v16, 160, 1));
    if (objc_getProperty(v2, v16, 168, 1))
      objc_msgSend(v5, "addObject:", objc_getProperty(v2, v17, 168, 1));
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16386, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v18, 176, 1));
    objc_msgSend(v5, "addObjectsFromArray:", v21);
    objc_msgSend(v5, "addObjectsFromArray:", objc_getProperty(v2, v19, 56, 1));
    objc_setProperty_atomic(v2, v20, v5, 80);
  }
  else
  {
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0, 16386, v21, v5);
    objc_msgSend(v5, "addObjectsFromArray:", 0);
    objc_msgSend(v5, "addObjectsFromArray:", v21);
    objc_msgSend(v5, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2IKEAuthPacket *v2;
  NEIKEv2IKEAuthPacket *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  ptrdiff_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  ptrdiff_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  NEIKEv2IKEAuthPacket *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (self)
    self = (NEIKEv2IKEAuthPacket *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2IKEAuthPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 88;
LABEL_35:
          objc_setProperty_atomic(v2, v9, v8, v10);
          goto LABEL_36;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 96;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 104;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 128;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 136;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 144;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 152;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 160;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2)
            goto LABEL_36;
          v10 = 168;
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2 && objc_getProperty(v2, v11, 112, 1))
          {
            objc_msgSend(objc_getProperty(v2, v12, 112, 1), "arrayByAddingObject:", v8);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:
            v19 = 112;
            goto LABEL_66;
          }
          v35 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1, (_QWORD)v27);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2)
            goto LABEL_51;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v15, 120, 1))
            {
              objc_msgSend(objc_getProperty(v2, v16, 120, 1), "arrayByAddingObject:", v8);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
              v19 = 120;
              goto LABEL_66;
            }
            v34 = v8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1, (_QWORD)v27);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
              goto LABEL_57;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (v2 && objc_getProperty(v2, v17, 64, 1))
              {
                objc_msgSend(objc_getProperty(v2, v18, 64, 1), "arrayByAddingObject:", v8);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_63:
                v24 = v2;
                v25 = v14;
                v19 = 64;
                goto LABEL_67;
              }
              v33 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1, (_QWORD)v27);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v2)
                goto LABEL_63;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_36;
                if (v2 && objc_getProperty(v2, v22, 56, 1))
                {
                  objc_msgSend(objc_getProperty(v2, v23, 56, 1), "arrayByAddingObject:", v8);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v31 = v8;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1, (_QWORD)v27);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v2)
                    goto LABEL_68;
                }
                v24 = v2;
                v25 = v14;
                v19 = 56;
                goto LABEL_67;
              }
              if (v2 && objc_getProperty(v2, v20, 176, 1))
              {
                objc_msgSend(objc_getProperty(v2, v21, 176, 1), "arrayByAddingObject:", v8);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_65:
                v19 = 176;
LABEL_66:
                v24 = v2;
                v25 = v14;
LABEL_67:
                objc_setProperty_atomic(v24, v13, v25, v19);
                goto LABEL_68;
              }
              v32 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1, (_QWORD)v27);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v2)
                goto LABEL_65;
            }
          }
        }
LABEL_68:

LABEL_36:
        ++v7;
      }
      while (v5 != v7);
      v26 = -[NEIKEv2IKEAuthPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      v5 = v26;
    }
    while (v26);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIDs, 0);
  objc_storeStrong((id *)&self->_tsr, 0);
  objc_storeStrong((id *)&self->_tsi, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_gspm, 0);
  objc_storeStrong((id *)&self->_eap, 0);
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_certificateRequests, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_idr, 0);
  objc_storeStrong((id *)&self->_idi, 0);
  objc_storeStrong((id *)&self->_sa, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("IKE_AUTH");
}

+ (unint64_t)exchangeType
{
  return 35;
}

@end

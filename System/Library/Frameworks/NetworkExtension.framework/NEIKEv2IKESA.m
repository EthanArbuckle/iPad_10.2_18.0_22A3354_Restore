@implementation NEIKEv2IKESA

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1
{
  const char *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  SEL v9;
  SEL v10;
  id v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = objc_getProperty(a1, v3, 160, 1);

    if (v5)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v13 = 136315138;
        v14 = "-[NEIKEv2IKESA(Crypto) generateLocalValuesForKEMProtocol:]";
        _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v8 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:]((uint64_t)NEIKEv2KeyExchangeHandler, objc_msgSend(v4, "method"));
      objc_setProperty_atomic(a1, v9, v8, 160);

      v7 = 1;
      v11 = objc_getProperty(a1, v10, 160, 1);

      if (v11)
        goto LABEL_8;
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = (const char *)v4;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", (uint8_t *)&v13, 0xCu);
      }
    }

  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a3 peerPayload:
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NEIKEv2KeyExchangeHandlerKyber *v11;
  SEL v12;
  SEL v13;
  id v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = objc_getProperty(a1, v6, 160, 1);

    if (v8)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v16 = 136315138;
        v17 = "-[NEIKEv2IKESA(Crypto) generateLocalValuesForKEMProtocol:peerPayload:]";
        _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      v11 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:peerPayload:]((uint64_t)NEIKEv2KeyExchangeHandler, objc_msgSend(v5, "method"), v7);
      objc_setProperty_atomic(a1, v12, v11, 160);

      v10 = 1;
      v14 = objc_getProperty(a1, v13, 160, 1);

      if (v14)
        goto LABEL_8;
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = (const char *)v5;
        _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", (uint8_t *)&v16, 0xCu);
      }
    }

  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (uint64_t)generateInitialValues
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  unsigned int v8;
  const char *v9;
  id v10;
  int v11;
  const char *v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSObject *v32;
  id v33;
  const char *v34;
  void *v35;
  id v36;
  NSObject *v37;
  SEL v38;
  SEL v39;
  id v40;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  NSObject *v45;
  unsigned int v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  _BYTE v58[10];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a1;
  -[NEIKEv2IKESA preferredKEMProtocol](a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "method") == 11001 || objc_msgSend(v4, "method") == 11002)
  {
    ne_log_obj();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v58 = v4;
      _os_log_fault_impl(&dword_19BD16000, v45, OS_LOG_TYPE_FAULT, "KE method %@ is not Diffie-Hellman", buf, 0xCu);
    }

    return 0;
  }
  v5 = -[NEIKEv2IKESA generateLocalValuesForKEMProtocol:](v2, v4);

  if ((_DWORD)v5)
  {
    v7 = objc_getProperty(v2, v6, 80, 1);
    v8 = objc_msgSend(v7, "nonceSize");

    if (v8 - 257 <= 0xFFFFFF0E)
    {
      ne_log_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v58 = v8;
      v42 = "Invalid nonce size %u";
      v43 = v32;
      v44 = 8;
      goto LABEL_36;
    }
    v10 = objc_getProperty(v2, v9, 80, 1);
    v11 = objc_msgSend(v10, "strictNonceSizeChecks");

    if (v11)
    {
      v13 = objc_getProperty(v2, v12, 96, 1);

      if (v13)
      {
        v15 = objc_getProperty(v2, v14, 96, 1);
        -[NEIKEv2IKESAProposal prfProtocol](v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "nonceSize");

      }
      else
      {
        v46 = v8;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v47 = v2;
        v19 = objc_getProperty(v2, v14, 80, 1);
        objc_msgSend(v19, "proposals");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 16;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, buf, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v53;
          v18 = 16;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v53 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v51 = 0u;
              objc_msgSend(v25, "prfProtocols");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v49;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v49 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                    if (objc_msgSend(v31, "nonceSize") > v18)
                      v18 = objc_msgSend(v31, "nonceSize");
                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                }
                while (v28);
              }

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, buf, 16);
          }
          while (v22);
        }

        v2 = v47;
        v8 = v46;
      }
      if (v8 < v18)
      {
        ne_log_obj();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
LABEL_29:

          return 0;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v58 = v8;
        *(_WORD *)&v58[4] = 1024;
        *(_DWORD *)&v58[6] = v18;
        v42 = "Nonce size %u < minimum %u";
        v43 = v32;
        v44 = 14;
LABEL_36:
        _os_log_fault_impl(&dword_19BD16000, v43, OS_LOG_TYPE_FAULT, v42, buf, v44);
        goto LABEL_29;
      }
    }
    v33 = objc_getProperty(v2, v12, 280, 1);
    if (!v33
      || (v35 = v33,
          v5 = 1,
          v36 = objc_getProperty(v2, v34, 128, 1),
          v36,
          v35,
          !v36))
    {
      v37 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v8);
      objc_setProperty_atomic(v2, v38, v37, 128);

      v40 = objc_getProperty(v2, v39, 128, 1);
      v5 = v40 != 0;

    }
  }
  return v5;
}

- (uint64_t)processCurrentKeyExchange
{
  id v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  SEL v9;
  id Property;
  id v11;
  uint64_t v12;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v2 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (self)
    self = objc_getProperty(self, a2, 160, 1);
  v3 = self;

  if (!v3)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      return 0;
    }
    v16 = 136315138;
    v17 = "-[NEIKEv2IKESA(Crypto) processCurrentKeyExchange]";
    v15 = "%s called with null self.currentKEHandler";
LABEL_14:
    _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  objc_getProperty(v2, v4, 152, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v16 = 136315138;
    v17 = "-[NEIKEv2IKESA(Crypto) processCurrentKeyExchange]";
    v15 = "%s called with null self.remoteKeyExchangeData";
    goto LABEL_14;
  }
  objc_getProperty(v2, v6, 152, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_setProperty_atomic(v2, v7, 0, 152);
    Property = objc_getProperty(v2, v9, 160, 1);
  }
  else
  {
    Property = 0;
  }
  v11 = Property;
  v12 = objc_msgSend(v11, "processPeerPayload:", v8);

  return v12;
}

- (uint64_t)processPrimaryKeyExchange
{
  void *v2;
  const char *v3;
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  SEL v8;

  if (result)
  {
    v2 = (void *)result;
    result = -[NEIKEv2IKESA processCurrentKeyExchange]((id)result, a2);
    if ((_DWORD)result)
    {
      v4 = objc_getProperty(v2, v3, 160, 1);
      v6 = v4;
      if (v4)
        v7 = (void *)*((_QWORD *)v4 + 3);
      else
        v7 = 0;
      objc_setProperty_atomic(v2, v5, v7, 168);

      objc_setProperty_atomic(v2, v8, 0, 160);
      return 1;
    }
  }
  return result;
}

- (uint64_t)generateAllValuesForSAInit
{
  NSObject *v4;
  uint8_t v5[16];

  if (a1)
  {
    if ((-[NEIKEv2IKESA processPrimaryKeyExchange]((uint64_t)a1, a2) & 1) != 0)
      return -[NEIKEv2IKESA generateAllValuesUsingSA:](a1, 0);
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "Failed to process KE data", v5, 2u);
    }

  }
  return 0;
}

- (uint64_t)generateAllValuesUsingSA:(_BYTE *)a1
{
  const char *v3;
  _BYTE *v4;
  id Property;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  void *v20;
  SEL v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  NSObject *v29;
  const char *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  CFIndex v36;
  CFMutableDataRef v37;
  const char *v38;
  CFMutableDataRef v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  CFMutableDataRef v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  CFIndex v49;
  CFMutableDataRef v50;
  const char *v51;
  CFMutableDataRef v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  int Hkdf;
  const char *v63;
  id v64;
  id v65;
  const char *v66;
  void *v67;
  const char *v68;
  id v69;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  unint64_t v75;
  id v76;
  id v77;
  const char *v78;
  void *v79;
  unsigned int v80;
  const char *v81;
  id v82;
  id v83;
  const char *v84;
  void *v85;
  unsigned int v86;
  int v87;
  unsigned int v88;
  __CFData *v89;
  const char *v90;
  __CFData *v91;
  id v92;
  id v93;
  const char *v94;
  void *v95;
  int v96;
  const UInt8 *v97;
  CFDataRef v98;
  SEL v99;
  const char *v100;
  id v101;
  id v102;
  CFDataRef v103;
  CFDataRef v104;
  uint64_t v105;
  const __CFAllocator *v106;
  CFDataRef v107;
  uint64_t v108;
  unsigned int v109;
  CFDataRef v110;
  NSObject *v111;
  uint64_t v112;
  CFDataRef v113;
  CFDataRef v114;
  int v115;
  CFDataRef v116;
  SEL v117;
  SEL v118;
  void *v119;
  CFDataRef v120;
  SEL v121;
  SEL v122;
  void *v123;
  NSObject *v124;
  const char *v125;
  int v126;
  id v127;
  id v128;
  const char *v129;
  _QWORD *v130;
  CFDataRef v131;
  CFDataRef v132;
  const char *v133;
  unint64_t v134;
  CFDataRef v135;
  id v136;
  id v137;
  const char *v138;
  void *v139;
  CFDataRef v140;
  const __CFData *v141;
  const __CFData *v142;
  NEIKEv2SecurityContextCBCPlusHMAC *v143;
  _QWORD *v144;
  id v145;
  const __CFData *v146;
  const __CFData *v147;
  const __CFData *v148;
  unint64_t v149;
  int v150;
  NEIKEv2SecurityContextCBCPlusHMAC *v151;
  NEIKEv2EncryptionProtocol *encryptionProtocol;
  unint64_t wireType;
  _QWORD *v154;
  CCAlgorithm v155;
  uint64_t v156;
  NSObject *v158;
  const char *v159;
  id *v160;
  NSObject *v161;
  NSObject *v162;
  CCCryptorStatus v163;
  CCCryptorStatus v164;
  unint64_t v165;
  NSObject *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  void *v171;
  uint64_t v172;
  const char *v173;
  void *v174;
  CFIndex v175;
  CFMutableDataRef v176;
  const char *v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  id v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t j;
  const char *v188;
  id v189;
  const char *v190;
  int v191;
  __CFString *String;
  NSObject *v193;
  int v194;
  NSObject *v195;
  NSObject *v196;
  NSObject *v197;
  NSObject *v198;
  CFDataRef v199;
  NSObject *v200;
  NSObject *v201;
  NSObject *v202;
  NSObject *v203;
  NSObject *v204;
  const char *v205;
  NSObject *v206;
  NSObject *v207;
  uint32_t v208;
  NSObject *v209;
  const char *v210;
  CFDataRef v211;
  __CFData *v212;
  const __CFData *v213;
  unsigned int v214;
  const __CFData *v215;
  unsigned int v216;
  const __CFData *v217;
  const __CFData *v218;
  CFMutableDataRef v219;
  CFDataRef v220;
  _BYTE *v221;
  _BOOL4 v222;
  const __CFData *v223;
  unsigned int v224;
  const __CFData *v225;
  CFMutableDataRef v226;
  CFDataRef v227;
  uint64_t v228;
  uint64_t v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  unsigned __int8 v238;
  CCCryptorRef cryptorRef;
  uint8_t buf[4];
  const char *v241;
  __int16 v242;
  id v243;
  _BYTE v244[128];
  _BYTE v245[128];
  uint64_t v246;

  v246 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
    Property = objc_getProperty(a1, v3, 96, 1);
  else
    Property = 0;
  v6 = Property;

  if (!v6)
  {
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.chosenProposal";
LABEL_109:
    _os_log_fault_impl(&dword_19BD16000, v29, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
    goto LABEL_110;
  }
  -[NEIKEv2IKESA initiatorNonce](a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.initiatorNonce";
    goto LABEL_109;
  }
  -[NEIKEv2IKESA responderNonce](a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.responderNonce";
    goto LABEL_109;
  }
  objc_getProperty(a1, v11, 168, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null self.primarySharedSecret";
    goto LABEL_109;
  }
  v14 = v4 != a1;
  if (!v4)
    v14 = 0;
  v222 = v14;
  v15 = v4 == a1 || v4 != 0;
  v221 = v4;
  if (!v15)
  {
    objc_getProperty(a1, v13, 168, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1)
      objc_setProperty_atomic(a1, v31, 0, 168);
    -[NEIKEv2IKESA initiatorNonce](a1, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length");
    -[NEIKEv2IKESA responderNonce](a1, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length") + v33;

    v37 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v36);
    if (v37)
    {
      v39 = v37;
      -[NEIKEv2IKESA initiatorNonce](a1, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v39, "appendData:", v40);

      -[NEIKEv2IKESA responderNonce](a1, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v39, "appendData:", v42);

      v44 = v20;
      v219 = v44;
      goto LABEL_38;
    }
    ne_log_obj();
    v198 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v241 = (const char *)v36;
      goto LABEL_234;
    }
LABEL_191:

    v39 = 0;
    v44 = 0;
    v238 = 0;
    goto LABEL_150;
  }
  if (v4)
    v16 = objc_getProperty(v4, v13, 216, 1);
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_getProperty(a1, v18, 168, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1)
    {
      objc_setProperty_atomic(a1, v19, 0, 168);
      v237 = 0u;
      v235 = 0u;
      v236 = 0u;
      v234 = 0u;
      v22 = objc_getProperty(a1, v21, 184, 1);
    }
    else
    {
      v22 = 0;
      v237 = 0u;
      v235 = 0u;
      v236 = 0u;
      v234 = 0u;
    }
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v234, v245, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v235;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v235 != v27)
            objc_enumerationMutation(v23);
          v26 += objc_msgSend(*(id *)(*((_QWORD *)&v234 + 1) + 8 * i), "length");
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v234, v245, 16);
      }
      while (v25);
    }
    else
    {
      v26 = 0;
    }

    v169 = objc_msgSend(v20, "length");
    -[NEIKEv2IKESA initiatorNonce](a1, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v171, "length");
    -[NEIKEv2IKESA responderNonce](a1, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v169 + objc_msgSend(v174, "length") + v26 + v172;

    v176 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v175);
    if (v176)
    {
      v44 = v176;
      -[__CFData appendData:](v176, "appendData:", v20);
      -[NEIKEv2IKESA initiatorNonce](a1, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v44, "appendData:", v178);

      -[NEIKEv2IKESA responderNonce](a1, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v44, "appendData:", v180);

      v232 = 0u;
      v233 = 0u;
      v230 = 0u;
      v231 = 0u;
      if (a1)
        v182 = objc_getProperty(a1, v181, 184, 1);
      else
        v182 = 0;
      v183 = v182;
      v184 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v230, v244, 16);
      if (v184)
      {
        v185 = v184;
        v186 = *(_QWORD *)v231;
        do
        {
          for (j = 0; j != v185; ++j)
          {
            if (*(_QWORD *)v231 != v186)
              objc_enumerationMutation(v183);
            -[__CFData appendData:](v44, "appendData:", *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * j));
          }
          v185 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v230, v244, 16);
        }
        while (v185);
      }

      if (a1)
        objc_setProperty_atomic(a1, v188, 0, 184);
      if (v4)
        v189 = objc_getProperty(v4, v188, 216, 1);
      else
        v189 = 0;
      v219 = (CFMutableDataRef)v20;
      v39 = (CFMutableDataRef)v189;
LABEL_38:
      -[NEIKEv2IKESA initiatorNonce](a1, v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");
      -[NEIKEv2IKESA responderNonce](a1, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v46 + objc_msgSend(v48, "length") + 16;

      v50 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v49);
      if (v50)
      {
        v52 = v50;
        -[NEIKEv2IKESA initiatorSPI](a1, v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "value");

        v229 = v54;
        -[NEIKEv2IKESA responderSPI](a1, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "value");

        v228 = v57;
        -[NEIKEv2IKESA initiatorNonce](a1, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFData appendData:](v52, "appendData:", v59);

        -[NEIKEv2IKESA responderNonce](a1, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFData appendData:](v52, "appendData:", v61);

        -[__CFData appendBytes:length:](v52, "appendBytes:length:", &v229, 8);
        -[__CFData appendBytes:length:](v52, "appendBytes:length:", &v228, 8);
        -[__CFData bytes](v39, "bytes");
        -[__CFData length](v39, "length");
        -[__CFData bytes](v52, "bytes");
        -[__CFData length](v52, "length");
        Hkdf = CCKDFParametersCreateHkdf();
        if (!Hkdf)
        {
          if (a1)
            v64 = objc_getProperty(a1, v63, 96, 1);
          else
            v64 = 0;
          v65 = v64;
          -[NEIKEv2IKESAProposal prfProtocol](v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v224 = -[NEIKEv2PRFProtocol length]((uint64_t)v67);

          if (a1)
            v69 = objc_getProperty(a1, v68, 96, 1);
          else
            v69 = 0;
          v70 = v69;
          -[NEIKEv2IKESAProposal encryptionProtocol](v70, v71);
          v72 = objc_claimAutoreleasedReturnValue();
          v74 = (void *)v72;
          if (v72 && (v75 = *(_QWORD *)(v72 + 16), v75 <= 0x1F) && ((0xD01C0000 >> v75) & 1) != 0)
          {
            v80 = 0;
          }
          else
          {
            if (a1)
              v76 = objc_getProperty(a1, v73, 96, 1);
            else
              v76 = 0;
            v77 = v76;
            -[NEIKEv2IKESAProposal integrityProtocol](v77, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = -[NEIKEv2IntegrityProtocol keyLength]((uint64_t)v79);

          }
          v226 = v52;
          if (a1)
            v82 = objc_getProperty(a1, v81, 96, 1);
          else
            v82 = 0;
          v83 = v82;
          -[NEIKEv2IKESAProposal encryptionProtocol](v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = -[NEIKEv2EncryptionProtocol keyLength]((uint64_t)v85);

          if (v222)
            v87 = 1;
          else
            v87 = 3;
          v88 = v224 * v87 + 2 * (v80 + v86);
          v89 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v88);
          if (!v89)
          {
            ne_log_obj();
            v196 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v196, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v88;
              _os_log_fault_impl(&dword_19BD16000, v196, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", buf, 8u);
            }

            v91 = 0;
            v238 = 0;
            v20 = v219;
            v4 = v221;
            goto LABEL_148;
          }
          v91 = v89;
          v216 = v80;
          v214 = v86;
          if (a1)
            v92 = objc_getProperty(a1, v90, 96, 1);
          else
            v92 = 0;
          v93 = v92;
          -[NEIKEv2IKESAProposal prfProtocol](v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEIKEv2PRFProtocol ccDigest](v95);
          -[__CFData bytes](v44, "bytes");
          -[__CFData length](v44, "length");
          -[__CFData mutableBytes](v91, "mutableBytes");
          -[__CFData length](v91, "length");
          v96 = CCDeriveKey();

          CCKDFParametersDestroy();
          if (v96)
          {
            ne_log_obj();
            v197 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v197, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v96;
              _os_log_fault_impl(&dword_19BD16000, v197, OS_LOG_TYPE_FAULT, "CCDeriveKey failed %d", buf, 8u);
            }

            v238 = 0;
            v20 = v219;
            v4 = v221;
            goto LABEL_148;
          }

          v97 = (const UInt8 *)-[__CFData bytes](v91, "bytes");
          v98 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], v97, v224);
          objc_setProperty_atomic(a1, v99, v98, 216);

          v4 = v221;
          if (a1)
            v101 = objc_getProperty(a1, v100, 216, 1);
          else
            v101 = 0;
          v102 = v101;

          if (!v102)
          {
            ne_log_obj();
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v224;
              _os_log_fault_impl(&dword_19BD16000, v111, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
            }

            v226 = 0;
            v39 = 0;
            v44 = 0;
            v20 = 0;
            v238 = 0;
            goto LABEL_148;
          }
          v212 = v91;
          if (v216)
          {
            v103 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v97[v224], v216);
            if (!v103)
            {
              ne_log_obj();
              v202 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v202, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v241) = v216;
                _os_log_fault_impl(&dword_19BD16000, v202, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
              }

              v226 = 0;
              v39 = 0;
              v44 = 0;
              v20 = 0;
              v238 = 0;
              goto LABEL_206;
            }
            v104 = v103;
            v105 = v216 + v224;
            objc_opt_self();
            v106 = (const __CFAllocator *)SecCFAllocatorZeroize();
            v107 = CFDataCreate(v106, &v97[v105], v216);
            if (!v107)
            {
              ne_log_obj();
              v203 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v203, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v241) = v216;
                _os_log_fault_impl(&dword_19BD16000, v203, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
              }

              v238 = 0;
LABEL_205:

              v226 = 0;
              v39 = 0;
              v44 = 0;
              v20 = 0;
LABEL_206:
              v4 = v221;
              goto LABEL_147;
            }
            v108 = v105 + v216;
            v109 = v105 + v216;
            v110 = v107;
          }
          else
          {
            v104 = 0;
            v110 = 0;
            v108 = v224;
            v109 = v224;
          }
          v227 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v97[v108], v214);
          if (v227)
          {
            v112 = v109 + v214;
            v113 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v97[v112], v214);
            if (v113)
            {
              v114 = v113;
              v220 = v113;
              if (v222)
                goto LABEL_76;
              v115 = v112 + v214;
              v116 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v97[v112 + v214], v224);
              objc_setProperty_atomic(a1, v117, v116, 232);

              objc_getProperty(a1, v118, 232, 1);
              v119 = (void *)objc_claimAutoreleasedReturnValue();

              if (v119)
              {
                v120 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v97[v115 + v224], v224);
                objc_setProperty_atomic(a1, v121, v120, 248);

                objc_getProperty(a1, v122, 248, 1);
                v123 = (void *)objc_claimAutoreleasedReturnValue();

                v114 = v220;
                if (v123)
                {
LABEL_76:

                  ne_log_obj();
                  v124 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
                  {
                    v190 = "SA Init";
                    if (v221)
                      v190 = "SA Rekey";
                    if (v221 == a1)
                      v190 = "Intermediate";
                    *(_DWORD *)buf = 136315138;
                    v241 = v190;
                    _os_log_debug_impl(&dword_19BD16000, v124, OS_LOG_TYPE_DEBUG, "Calculated sKeySeed derivatives for %s", buf, 0xCu);
                  }

                  if (a1)
                  {
                    v126 = a1[9] & 1;
                    v127 = objc_getProperty(a1, v125, 96, 1);
                  }
                  else
                  {
                    v126 = 0;
                    v127 = 0;
                  }
                  v128 = v127;
                  -[NEIKEv2IKESAProposal encryptionProtocol](v128, v129);
                  v130 = (_QWORD *)objc_claimAutoreleasedReturnValue();

                  v131 = v227;
                  if (v126)
                    v132 = v114;
                  else
                    v132 = v227;
                  if (!v126)
                    v131 = v114;
                  v225 = v131;
                  v223 = v132;
                  v211 = v110;
                  if (!v130 || (v134 = v130[2], v134 > 0x1F) || ((0xD01C0000 >> v134) & 1) == 0)
                  {
                    v135 = v110;
                    if (a1)
                      v136 = objc_getProperty(a1, v133, 96, 1);
                    else
                      v136 = 0;
                    v137 = v136;
                    -[NEIKEv2IKESAProposal integrityProtocol](v137, v138);
                    v139 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v126)
                      v140 = v104;
                    else
                      v140 = v110;
                    v215 = v104;
                    if (!v126)
                      v135 = v104;
                    v141 = v140;
                    v142 = v135;
                    v143 = [NEIKEv2SecurityContextCBCPlusHMAC alloc];
                    v144 = v130;
                    v218 = v225;
                    v217 = v223;
                    v145 = v139;
                    v146 = v141;
                    v147 = v142;
                    v148 = v147;
                    if (!v143)
                      goto LABEL_230;
                    if (v130)
                    {
                      if (v145)
                      {
                        if (v146)
                        {
                          if (v147)
                          {
                            v149 = v144[2];
                            if (v149 <= 0x1F && ((0xD01C0000 >> v149) & 1) != 0)
                              goto LABEL_230;
                            v150 = +[NEIKEv2SecurityContextCBCPlusHMAC overheadForPlaintextLength:encryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, 0, v144, v145);
                            v151 = (NEIKEv2SecurityContextCBCPlusHMAC *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](v143, v150);
                            v143 = v151;
                            if (!v151)
                              goto LABEL_230;
                            objc_storeStrong((id *)&v151->_encryptionProtocol, v130);
                            encryptionProtocol = v143->_encryptionProtocol;
                            v213 = v146;
                            if (!encryptionProtocol)
                              goto LABEL_120;
                            wireType = encryptionProtocol->_wireType;
                            switch(wireType)
                            {
                              case 2uLL:
                                v154 = v144;
                                v155 = 1;
                                goto LABEL_126;
                              case 0xCuLL:
LABEL_120:
                                v154 = v144;
                                break;
                              case 3uLL:
                                v154 = v144;
                                v155 = 2;
LABEL_126:
                                cryptorRef = 0;
                                v163 = CCCryptorCreate(0, v155, 0, (const void *)-[__CFData bytes](v218, "bytes"), -[__CFData length](v218, "length"), 0, &cryptorRef);
                                if (v163 || !cryptorRef)
                                {
                                  ne_log_obj();
                                  v209 = objc_claimAutoreleasedReturnValue();
                                  if (!os_log_type_enabled(v209, OS_LOG_TYPE_FAULT))
                                    goto LABEL_222;
                                  *(_DWORD *)buf = 67109120;
                                  LODWORD(v241) = v163;
                                  v210 = "CCCryptorCreate(kCCEncrypt) failed: %d";
                                }
                                else
                                {
                                  v143->_outgoingEncryptionContext = cryptorRef;
                                  cryptorRef = 0;
                                  v164 = CCCryptorCreate(1u, v155, 0, (const void *)-[__CFData bytes](v217, "bytes"), -[__CFData length](v217, "length"), 0, &cryptorRef);
                                  if (!v164 && cryptorRef)
                                  {
                                    v143->_incomingEncryptionContext = cryptorRef;
                                    objc_storeStrong((id *)&v143->_integrityProtocol, v139);
                                    v165 = objc_msgSend(v145, "type") - 1;
                                    if (v165 < 0xE && ((0x3863u >> v165) & 1) != 0)
                                    {
                                      v144 = v154;
                                    }
                                    else
                                    {
                                      ne_log_obj();
                                      v166 = objc_claimAutoreleasedReturnValue();
                                      v144 = v154;
                                      if (os_log_type_enabled(v166, OS_LOG_TYPE_FAULT))
                                      {
                                        v191 = objc_msgSend(v145, "type");
                                        *(_DWORD *)buf = 67109120;
                                        LODWORD(v241) = v191;
                                        _os_log_fault_impl(&dword_19BD16000, v166, OS_LOG_TYPE_FAULT, "Unknown PRF type %u", buf, 8u);
                                      }

                                    }
                                    v146 = v213;
                                    -[__CFData bytes](v213, "bytes");
                                    -[__CFData length](v213, "length");
                                    v167 = CCHmacCreate();
                                    if (v167)
                                    {
                                      v143->_outgoingHMACBaseContext = ($1DC23E134A5F43A06C89BE309303CDCF *)v167;
                                      -[__CFData bytes](v148, "bytes");
                                      -[__CFData length](v148, "length");
                                      v168 = CCHmacCreate();
                                      if (v168)
                                      {
                                        v143->_incomingHMACBaseContext = ($1DC23E134A5F43A06C89BE309303CDCF *)v168;
                                        v160 = v143;
LABEL_139:
                                        v114 = v220;
LABEL_140:

                                        if (!v160)
                                        {
                                          ne_log_obj();
                                          v206 = objc_claimAutoreleasedReturnValue();
                                          if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
                                          {
                                            *(_DWORD *)buf = 138412546;
                                            v241 = (const char *)v144;
                                            v242 = 2112;
                                            v243 = v145;
                                            _os_log_error_impl(&dword_19BD16000, v206, OS_LOG_TYPE_ERROR, "Failed to create security context for %@, %@", buf, 0x16u);
                                          }

                                          v238 = 0;
                                          v114 = v220;
                                          v4 = v221;
                                          v104 = v215;
                                          goto LABEL_143;
                                        }

                                        v4 = v221;
                                        v104 = v215;
                                        goto LABEL_142;
                                      }
                                      ne_log_obj();
                                      v204 = objc_claimAutoreleasedReturnValue();
                                      if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                                        goto LABEL_229;
                                      *(_WORD *)buf = 0;
                                      v205 = "CCHmacCreate failed";
                                      goto LABEL_227;
                                    }
                                    ne_log_obj();
                                    v204 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                                    {
                                      *(_WORD *)buf = 0;
                                      v205 = "CCHmacCreate failed";
LABEL_227:
                                      v207 = v204;
                                      v208 = 2;
                                      goto LABEL_228;
                                    }
LABEL_229:

LABEL_230:
                                    v160 = 0;
                                    goto LABEL_139;
                                  }
                                  ne_log_obj();
                                  v209 = objc_claimAutoreleasedReturnValue();
                                  if (!os_log_type_enabled(v209, OS_LOG_TYPE_FAULT))
                                  {
LABEL_222:

                                    v160 = 0;
                                    v114 = v220;
                                    v144 = v154;
                                    v146 = v213;
                                    goto LABEL_140;
                                  }
                                  *(_DWORD *)buf = 67109120;
                                  LODWORD(v241) = v164;
                                  v210 = "CCCryptorCreate(kCCDecrypt) failed: %d";
                                }
                                _os_log_fault_impl(&dword_19BD16000, v209, OS_LOG_TYPE_FAULT, v210, buf, 8u);
                                goto LABEL_222;
                              default:
                                ne_log_obj();
                                v162 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v162, OS_LOG_TYPE_FAULT))
                                {
                                  String = NEIKEv2EncryptionWireTypeCreateString(encryptionProtocol->_wireType);
                                  *(_DWORD *)buf = 138412290;
                                  v241 = (const char *)String;
                                  _os_log_fault_impl(&dword_19BD16000, v162, OS_LOG_TYPE_FAULT, "No CCAlgorithm for encryption wire type %@", buf, 0xCu);

                                }
                                v154 = v144;

                                break;
                            }
                            v155 = 0;
                            goto LABEL_126;
                          }
                          ne_log_obj();
                          v204 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                            goto LABEL_229;
                          *(_DWORD *)buf = 136315138;
                          v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:in"
                                 "comingEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                          v205 = "%s called with null incomingIntegrityKey";
                        }
                        else
                        {
                          ne_log_obj();
                          v204 = objc_claimAutoreleasedReturnValue();
                          if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                            goto LABEL_229;
                          *(_DWORD *)buf = 136315138;
                          v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:in"
                                 "comingEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                          v205 = "%s called with null outgoingIntegrityKey";
                        }
                      }
                      else
                      {
                        ne_log_obj();
                        v204 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                          goto LABEL_229;
                        *(_DWORD *)buf = 136315138;
                        v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:inco"
                               "mingEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                        v205 = "%s called with null integrityProtocol";
                      }
                    }
                    else
                    {
                      ne_log_obj();
                      v204 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v204, OS_LOG_TYPE_FAULT))
                        goto LABEL_229;
                      *(_DWORD *)buf = 136315138;
                      v241 = "-[NEIKEv2SecurityContextCBCPlusHMAC initWithEncryptionProtocol:outgoingEncryptionKey:incomi"
                             "ngEncryptionKey:integrityProtocol:outgoingIntegrityKey:incomingIntegrityKey:]";
                      v205 = "%s called with null encryptionProtocol";
                    }
                    v207 = v204;
                    v208 = 12;
LABEL_228:
                    _os_log_fault_impl(&dword_19BD16000, v207, OS_LOG_TYPE_FAULT, v205, buf, v208);
                    goto LABEL_229;
                  }
                  if (v134 <= 0x1E && ((0x401C0000u >> v134) & 1) != 0)
                  {
                    v160 = -[NEIKEv2SecurityContextAESGCM initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]((id *)[NEIKEv2SecurityContextAESGCM alloc], v130, v225, v223);
                    if (!v160)
                    {
                      ne_log_obj();
                      v161 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v241 = (const char *)v130;
                        goto LABEL_170;
                      }
LABEL_171:

                      v238 = 0;
                      v114 = v220;
                      v4 = v221;
                      goto LABEL_143;
                    }
                  }
                  else
                  {
                    v160 = -[NEIKEv2SecurityContextChaCha20Poly1305 initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]((id *)[NEIKEv2SecurityContextChaCha20Poly1305 alloc], v130, v225, v223);
                    if (!v160)
                    {
                      ne_log_obj();
                      v161 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v241 = (const char *)v130;
LABEL_170:
                        _os_log_error_impl(&dword_19BD16000, v161, OS_LOG_TYPE_ERROR, "Failed to create security context for %@", buf, 0xCu);
                        goto LABEL_171;
                      }
                      goto LABEL_171;
                    }
                  }
LABEL_142:
                  objc_setProperty_atomic(a1, v159, v160, 208);
                  v238 = 1;

LABEL_143:
                  v91 = 0;
                  v226 = 0;
                  v39 = 0;
                  v44 = 0;
                  v20 = 0;
LABEL_148:

                  v52 = v226;
LABEL_149:

LABEL_150:
                  v156 = v238;
                  goto LABEL_111;
                }
                ne_log_obj();
                v158 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v158, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v241) = v224;
                  _os_log_fault_impl(&dword_19BD16000, v158, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
                }
              }
              else
              {
                ne_log_obj();
                v158 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v158, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v241) = v224;
                  _os_log_fault_impl(&dword_19BD16000, v158, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
                }
              }

              v238 = 0;
              v226 = 0;
              v39 = 0;
              v44 = 0;
              v20 = 0;
LABEL_147:
              v91 = v212;
              goto LABEL_148;
            }
            v199 = v110;
            ne_log_obj();
            v201 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v201, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v214;
              _os_log_fault_impl(&dword_19BD16000, v201, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
            }

            v238 = 0;
          }
          else
          {
            v199 = v110;
            ne_log_obj();
            v200 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v200, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v241) = v214;
              _os_log_fault_impl(&dword_19BD16000, v200, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
            }

            v238 = 0;
          }

          goto LABEL_205;
        }
        v194 = Hkdf;
        ne_log_obj();
        v195 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v241) = v194;
          _os_log_fault_impl(&dword_19BD16000, v195, OS_LOG_TYPE_FAULT, "CCKDFParametersCreateHkdf failed %d", buf, 8u);
        }

      }
      else
      {
        ne_log_obj();
        v193 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v193, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v241 = (const char *)v49;
          _os_log_fault_impl(&dword_19BD16000, v193, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", buf, 0xCu);
        }

        v52 = 0;
      }
      v238 = 0;
      v20 = v219;
      goto LABEL_149;
    }
    ne_log_obj();
    v198 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v241 = (const char *)v175;
LABEL_234:
      _os_log_fault_impl(&dword_19BD16000, v198, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", buf, 0xCu);
      goto LABEL_191;
    }
    goto LABEL_191;
  }
  ne_log_obj();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v241 = "-[NEIKEv2IKESA(Crypto) generateAllValuesUsingSA:]";
    v30 = "%s called with null ikeSA.skD";
    goto LABEL_109;
  }
LABEL_110:

  v156 = 0;
LABEL_111:

  return v156;
}

- (__CFData)deriveKeyFromPrimeKey:(void *)a1 hmacContext:(void *)a2
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  const char *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  __CFData *v11;
  CCHmacContext *v12;
  __CFData *v13;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
    Property = objc_getProperty(a1, v3, 96, 1);
  else
    Property = 0;
  v6 = Property;
  -[NEIKEv2IKESAProposal prfProtocol](v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NEIKEv2PRFProtocol length]((uint64_t)v8);

  v10 = CCHmacOutputSizeFromRef();
  if (v10 != v9)
  {
    v15 = v10;
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v18) = 67109376;
      HIDWORD(v18) = v9;
      v19 = 2048;
      v20 = v15;
      _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "PRF length %u != HMAC output size %zu", (uint8_t *)&v18, 0x12u);
    }

  }
  v11 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v9);
  if (v11)
  {
    v12 = (CCHmacContext *)CCHmacClone();
    LOBYTE(v18) = 1;
    CCHmacUpdate(v12, (const void *)objc_msgSend(v4, "bytes", v18), objc_msgSend(v4, "length"));
    CCHmacUpdate(v12, &v18, 1uLL);
    CCHmacFinal(v12, (void *)-[__CFData mutableBytes](v11, "mutableBytes"));
    CCHmacDestroy();
    v13 = v11;
  }
  else
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v18) = 67109120;
      HIDWORD(v18) = v9;
      _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", (uint8_t *)&v18, 8u);
    }

    v13 = 0;
  }

  return v13;
}

- (uint64_t)generateDerivativesFromPPK:(uint64_t)a1
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  SEL v18;
  SEL v19;
  void *v20;
  __CFData *v21;
  SEL v22;
  SEL v23;
  id v24;
  const char *v25;
  void *v26;
  SEL v27;
  SEL v28;
  void *v29;
  __CFData *v30;
  SEL v31;
  SEL v32;
  void *v33;
  const char *v34;
  void *v35;
  SEL v36;
  SEL v37;
  void *v38;
  __CFData *v39;
  SEL v40;
  SEL v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  int v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (!a1)
    goto LABEL_24;
  if (!v3)
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    v50 = 136315138;
    v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null ppk";
    goto LABEL_20;
  }
  v6 = objc_getProperty((id)a1, v4, 216, 1);

  if (!v6)
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    v50 = 136315138;
    v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null self.skD";
LABEL_20:
    v47 = v44;
    v48 = 12;
LABEL_21:
    _os_log_fault_impl(&dword_19BD16000, v47, OS_LOG_TYPE_FAULT, v45, (uint8_t *)&v50, v48);
    goto LABEL_22;
  }
  objc_getProperty((id)a1, v7, 232, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    v50 = 136315138;
    v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
    v45 = "%s called with null self.skPi";
    goto LABEL_20;
  }
  objc_getProperty((id)a1, v9, 248, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      v50 = 136315138;
      v51 = "-[NEIKEv2IKESA(Crypto) generateDerivativesFromPPK:]";
      v45 = "%s called with null self.skPr";
      goto LABEL_20;
    }
LABEL_22:

    goto LABEL_23;
  }
  v12 = objc_getProperty((id)a1, v11, 96, 1);
  -[NEIKEv2IKESAProposal prfProtocol](v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2PRFProtocol ccDigest](v14);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  v15 = CCHmacCreate();

  if (!v15)
  {
    ne_log_obj();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      goto LABEL_22;
    LOWORD(v50) = 0;
    v45 = "CCHmacCreate failed";
    v47 = v44;
    v48 = 2;
    goto LABEL_21;
  }
  v17 = objc_getProperty((id)a1, v16, 216, 1);
  objc_setProperty_atomic((id)a1, v18, v17, 224);

  objc_getProperty((id)a1, v19, 224, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NEIKEv2IKESA deriveKeyFromPrimeKey:hmacContext:]((void *)a1, v20);
  objc_setProperty_atomic((id)a1, v22, v21, 216);

  v24 = objc_getProperty((id)a1, v23, 216, 1);
  if (!v24)
    goto LABEL_17;
  objc_getProperty((id)a1, v25, 232, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic((id)a1, v27, v26, 240);

  objc_getProperty((id)a1, v28, 240, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[NEIKEv2IKESA deriveKeyFromPrimeKey:hmacContext:]((void *)a1, v29);
  objc_setProperty_atomic((id)a1, v31, v30, 232);

  objc_getProperty((id)a1, v32, 232, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
    goto LABEL_17;
  objc_getProperty((id)a1, v34, 248, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic((id)a1, v36, v35, 256);

  objc_getProperty((id)a1, v37, 256, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[NEIKEv2IKESA deriveKeyFromPrimeKey:hmacContext:]((void *)a1, v38);
  objc_setProperty_atomic((id)a1, v40, v39, 248);

  objc_getProperty((id)a1, v41, 248, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
LABEL_17:
    CCHmacDestroy();
    -[NEIKEv2IKESA restorePrimeKeys]((void *)a1, v46);
LABEL_23:
    a1 = 0;
    goto LABEL_24;
  }
  ne_log_obj();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v50) = 0;
    _os_log_debug_impl(&dword_19BD16000, v43, OS_LOG_TYPE_DEBUG, "Calculated PPK derivatives", (uint8_t *)&v50, 2u);
  }

  CCHmacDestroy();
  a1 = 1;
LABEL_24:

  return a1;
}

- (void)restorePrimeKeys
{
  void *v3;
  const char *v4;
  void *v5;
  SEL v6;
  SEL v7;
  void *v8;
  const char *v9;
  void *v10;
  SEL v11;
  SEL v12;
  void *v13;
  const char *v14;
  void *v15;
  SEL v16;
  SEL v17;
  NSObject *v18;
  uint8_t v19[16];

  objc_getProperty(a1, a2, 224, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_getProperty(a1, v4, 224, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v6, v5, 216);

    objc_setProperty_atomic(a1, v7, 0, 224);
  }
  objc_getProperty(a1, v4, 240, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_getProperty(a1, v9, 240, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v11, v10, 232);

    objc_setProperty_atomic(a1, v12, 0, 240);
  }
  objc_getProperty(a1, v9, 256, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_getProperty(a1, v14, 256, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v16, v15, 248);

    objc_setProperty_atomic(a1, v17, 0, 256);
  }
  ne_log_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v19 = 0;
    _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "Restored prime keys", v19, 2u);
  }

}

- (id)copyRemoteCertificateAuthorityArray
{
  const char *v2;
  id v3;
  id Property;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  const char *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFDictionary *v32;
  OSStatus v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  const void *v45;
  NSObject *v46;
  id v47;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  const __CFDictionary *v59;
  OSStatus v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  NSObject *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[16];
  _BYTE v84[128];
  uint8_t v85[128];
  __int128 buf;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[8];
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 result;
  uint64_t v98;
  uint64_t v99;
  _BYTE v100[24];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", (uint8_t *)&buf, 2u);
    }
    goto LABEL_55;
  }
  if (a1)
    Property = objc_getProperty(a1, v2, 88, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "remoteCertificateAuthorityReferences");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v76 != v11)
            objc_enumerationMutation(v8);
          v13 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]((uint64_t)NEIKEv2Crypto, *(void **)(*((_QWORD *)&v75 + 1) + 8 * i), 0);
          if (v13)
          {
            v14 = (const void *)v13;
            objc_msgSend(v3, "addObject:", v13);
            CFRelease(v14);
          }
        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v10);
    }

    if (!objc_msgSend(v3, "count") && -[NSObject count](v8, "count"))
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "failed to retrieve remote CA cert data by references", (uint8_t *)&buf, 2u);
      }
      goto LABEL_53;
    }
    goto LABEL_54;
  }
  if (a1)
    v16 = objc_getProperty(a1, v7, 88, 1);
  else
    v16 = 0;
  v17 = v16;
  objc_msgSend(v17, "remoteCertificateAuthorityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a1)
    v20 = objc_getProperty(a1, v19, 88, 1);
  else
    v20 = 0;
  v21 = v20;
  objc_msgSend(v21, "remoteCertificateAuthorityHash");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v18;
  v24 = v22;
  v25 = v23;
  v26 = v24;
  objc_opt_self();
  v74 = v23;
  if (!v23)
  {
    v38 = 0;
    goto LABEL_38;
  }
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v66)
  {
    ne_log_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_19BD16000, v37, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", (uint8_t *)&buf, 2u);
    }
    goto LABEL_36;
  }
  objc_opt_self();
  v27 = *MEMORY[0x1E0CD6CA0];
  v28 = *MEMORY[0x1E0CD7028];
  v72 = *MEMORY[0x1E0CD6C98];
  *(_QWORD *)&v89 = *MEMORY[0x1E0CD6C98];
  *((_QWORD *)&v89 + 1) = v28;
  v29 = *MEMORY[0x1E0C9AE50];
  v71 = v27;
  *(_QWORD *)&buf = v27;
  *((_QWORD *)&buf + 1) = v29;
  v30 = *MEMORY[0x1E0CD6F38];
  v31 = *MEMORY[0x1E0CD70C0];
  *(_QWORD *)&v90 = *MEMORY[0x1E0CD6F30];
  *((_QWORD *)&v90 + 1) = v31;
  v69 = v31;
  v70 = v29;
  v87 = v30;
  v88 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v89, 4);
  v32 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&result = 0;
  v33 = SecItemCopyMatching(v32, (CFTypeRef *)&result);
  v34 = (void *)result;
  v73 = v26;
  if (v33 || !objc_msgSend((id)result, "count"))
  {
    ne_log_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v93 = 67109120;
      *(_DWORD *)&v93[4] = v33;
      _os_log_error_impl(&dword_19BD16000, v35, OS_LOG_TYPE_ERROR, "failed to retrieve all certificate (%d)", v93, 8u);
    }

    v26 = v73;
    goto LABEL_30;
  }
  v49 = v34;

  if (!v49)
  {
LABEL_30:
    ne_log_obj();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, "[NEIKEv2Crypto copyAllCertificates]", (uint8_t *)&buf, 2u);
    }

    v37 = 0;
LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v37 = v49;
  v50 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v89, &buf, 16);
  if (!v50)
    goto LABEL_84;
  v51 = v50;
  v52 = *(_QWORD *)v90;
  v68 = *MEMORY[0x1E0CD7020];
  v67 = *MEMORY[0x1E0CD70E8];
  do
  {
    v53 = 0;
    do
    {
      if (*(_QWORD *)v90 != v52)
        objc_enumerationMutation(v37);
      v54 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v53);
      v55 = (void *)SecCertificateCopyCommonNames();
      v56 = v55;
      if (v55 && objc_msgSend(v55, "containsObject:", v25))
      {
        if (v73
          && (v57 = (void *)SecCertificateCopySHA256Digest(),
              v58 = objc_msgSend(v57, "isEqualToData:", v73),
              v57,
              !v58))
        {
          ne_log_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            goto LABEL_76;
          LODWORD(result) = 138412290;
          v25 = v74;
          *(_QWORD *)((char *)&result + 4) = v74;
          _os_log_impl(&dword_19BD16000, v63, OS_LOG_TYPE_DEFAULT, "certificate hash did not match for CN (%@)", (uint8_t *)&result, 0xCu);
        }
        else
        {
          objc_opt_self();
          if (v54)
          {
            *(_QWORD *)v93 = v68;
            v94 = v67;
            *(_QWORD *)&result = v70;
            *((_QWORD *)&result + 1) = v54;
            v95 = v72;
            v96 = v69;
            v98 = v71;
            v99 = v70;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &result, v93, 4);
            v59 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v100 = 0;
            v60 = SecItemCopyMatching(v59, (CFTypeRef *)v100);
            v61 = *(void **)v100;
            if (v60)
            {
              ne_log_obj();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)v83 = 0;
                _os_log_fault_impl(&dword_19BD16000, v62, OS_LOG_TYPE_FAULT, "SecItemCopyMatching failed", v83, 2u);
              }

              v63 = 0;
            }
            else
            {
              v63 = *(id *)v100;

              if (v63)
                objc_msgSend(v66, "addObject:", v63);
            }
LABEL_76:
            v25 = v74;
          }
          else
          {
            ne_log_obj();
            v64 = objc_claimAutoreleasedReturnValue();
            v25 = v74;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v100 = 136315138;
              *(_QWORD *)&v100[4] = "+[NEIKEv2Crypto copyPersistentDataForCertificate:]";
              _os_log_fault_impl(&dword_19BD16000, v64, OS_LOG_TYPE_FAULT, "%s called with null certificate", v100, 0xCu);
            }

            v63 = 0;
          }
        }

      }
      ++v53;
    }
    while (v51 != v53);
    v65 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v89, &buf, 16);
    v51 = v65;
  }
  while (v65);
LABEL_84:

  v38 = v66;
  v6 = 0;
  v26 = v73;
LABEL_37:

LABEL_38:
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v39 = v38;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v80 != v42)
          objc_enumerationMutation(v39);
        v44 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]((uint64_t)NEIKEv2Crypto, *(void **)(*((_QWORD *)&v79 + 1) + 8 * j), 0);
        if (v44)
        {
          v45 = (const void *)v44;
          objc_msgSend(v3, "addObject:", v44);
          CFRelease(v45);
        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v41);
  }

  if (!objc_msgSend(v3, "count") && v74)
  {
    ne_log_obj();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v74;
      _os_log_fault_impl(&dword_19BD16000, v46, OS_LOG_TYPE_FAULT, "failed to retrieve remote CA cert data by CN (%@)", (uint8_t *)&buf, 0xCu);
    }

  }
  v15 = v74;
LABEL_53:

LABEL_54:
  v47 = v3;
LABEL_55:

  return v3;
}

- (id)copyRemoteCertificateAuthorityHashData
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (!v2)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "[[NSMutableData alloc] init] failed", buf, 2u);
    }
    goto LABEL_26;
  }
  v3 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](a1);
  if (!v3)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "[self copyRemoteCertificateAuthorityArray] failed", buf, 2u);
    }

    v4 = 0;
    goto LABEL_26;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
    goto LABEL_19;
  v6 = v5;
  v7 = *(_QWORD *)v18;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_opt_self();
      if (v9)
      {
        v10 = SecCertificateCopySubjectPublicKeyInfoSHA1Digest();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v2, "appendData:", v10);
          goto LABEL_17;
        }
      }
      else
      {
        ne_log_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v23 = "+[NEIKEv2Crypto createCertificateAuthorityPublicKeyHash:]";
          _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "%s called with null certificate", buf, 0xCu);
        }

      }
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createCertificateAuthorityPublicKeyHash:] failed", buf, 2u);
      }

      v11 = 0;
LABEL_17:

      ++v8;
    }
    while (v6 != v8);
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v6);
LABEL_19:

  if (!objc_msgSend(v2, "length"))
  {
LABEL_26:
    v14 = 0;
    goto LABEL_27;
  }
  v14 = v2;
LABEL_27:

  return v14;
}

- (uint64_t)copyLocalSecIdentity
{
  void *v3;
  SEL v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  objc_getProperty(a1, a2, 264, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getProperty(a1, v4, 272, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = +[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]((uint64_t)NEIKEv2Crypto, v3, v5, a1[22] & 1);
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "No configured local certificate identity", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (NSObject)copyLocalCertificateData
{
  __SecIdentity *v2;
  __SecIdentity *v3;
  OSStatus v4;
  CFDataRef v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  __int16 v11[8];
  uint8_t buf[8];
  SecCertificateRef certificateRef;
  uint8_t v14[16];

  v2 = (__SecIdentity *)-[NEIKEv2IKESA copyLocalSecIdentity](a1, a2);
  if (v2)
  {
    v3 = v2;
    certificateRef = 0;
    v4 = SecIdentityCopyCertificate(v2, &certificateRef);
    CFRelease(v3);
    if (!certificateRef || v4)
    {
      if (certificateRef)
      {
        CFRelease(certificateRef);
        certificateRef = 0;
      }
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "SecIdentityCopyCertificate failed", buf, 2u);
      }
    }
    else
    {
      v5 = SecCertificateCopyData(certificateRef);
      if (certificateRef)
      {
        CFRelease(certificateRef);
        certificateRef = 0;
      }
      if (v5)
      {
        v6 = v5;
        v7 = v6;
LABEL_19:

        return v7;
      }
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v11[0] = 0;
        _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "SecCertificateCopyData failed", (uint8_t *)v11, 2u);
      }

      v6 = 0;
    }
    v7 = 0;
    goto LABEL_19;
  }
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "[self copyLocalSecIdentity]", v14, 2u);
  }

  return 0;
}

- (CFTypeRef)copyCertSigningKey
{
  __SecIdentity *v2;
  __SecIdentity *v3;
  OSStatus v4;
  CFTypeRef result;
  NSObject *v6;
  NSObject *v7;
  CFTypeRef cf[2];
  uint8_t buf[4];
  OSStatus v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (__SecIdentity *)-[NEIKEv2IKESA copyLocalSecIdentity](a1, a2);
  if (!v2)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(cf[0]) = 0;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "[self copyLocalSecIdentity]", (uint8_t *)cf, 2u);
    }

    return 0;
  }
  v3 = v2;
  cf[0] = 0;
  v4 = SecIdentityCopyPrivateKey(v2, (SecKeyRef *)cf);
  CFRelease(v3);
  result = cf[0];
  if (!cf[0] || v4)
  {
    if (cf[0])
    {
      CFRelease(cf[0]);
      cf[0] = 0;
    }
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v4;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "SecIdentityCopyPrivateKey (%d) failed", buf, 8u);
    }

    return 0;
  }
  return result;
}

- (uint64_t)updateIntAuthWithPacket:(uint64_t)a1
{
  const char *v3;
  _BYTE *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  CFIndex v17;
  const char *v18;
  CFMutableDataRef v19;
  void *v20;
  SEL v21;
  void *v22;
  SEL v23;
  id v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  SEL v28;
  SEL v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  CFIndex v38;
  const char *v39;
  void *v40;
  SEL v41;
  void *v42;
  SEL v43;
  id v44;
  const char *v45;
  void *v46;
  NSObject *v47;
  SEL v48;
  SEL v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  NSObject *v54;
  uint32_t v55;
  int v56;
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = objc_getProperty((id)a1, v3, 96, 1);
    -[NEIKEv2IKESAProposal prfProtocol](v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NEIKEv2IntermediatePacket authenticatedData](v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NEIKEv2IntermediatePacket authenticatedData](v4, v10);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v4 && (objc_setProperty_atomic(v4, v11, 0, 96), (v4[11] & 1) != 0))
        {
          objc_getProperty((id)a1, v11, 232, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_getProperty((id)a1, v35, 192, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "length");
            v38 = -[NSObject length](v12, "length") + v37;

            v19 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v38);
            if (v19)
            {
              objc_getProperty((id)a1, v39, 192, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFData appendData:](v19, "appendData:", v40);

              -[__CFData appendData:](v19, "appendData:", v12);
              objc_getProperty((id)a1, v41, 232, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_getProperty((id)a1, v43, 96, 1);
              -[NEIKEv2IKESAProposal prfProtocol](v44, v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v42, v46);
              objc_setProperty_atomic((id)a1, v48, v47, 192);

              objc_getProperty((id)a1, v49, 192, 1);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v50)
              {
                ne_log_obj();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v56) = 0;
                  v32 = "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed";
                  goto LABEL_32;
                }
LABEL_25:

                goto LABEL_26;
              }
LABEL_19:

              a1 = 1;
LABEL_27:

              goto LABEL_28;
            }
            ne_log_obj();
            v31 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              goto LABEL_25;
            v56 = 134217984;
            v57 = (const char *)v38;
            v32 = "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed";
LABEL_38:
            v54 = v31;
            v55 = 12;
            goto LABEL_33;
          }
          ne_log_obj();
          v51 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          v56 = 136315138;
          v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
          v52 = "%s called with null self.skPi";
        }
        else
        {
          objc_getProperty((id)a1, v11, 248, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_getProperty((id)a1, v14, 200, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "length");
            v17 = -[NSObject length](v12, "length") + v16;

            v19 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v17);
            if (v19)
            {
              objc_getProperty((id)a1, v18, 200, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFData appendData:](v19, "appendData:", v20);

              -[__CFData appendData:](v19, "appendData:", v12);
              objc_getProperty((id)a1, v21, 248, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_getProperty((id)a1, v23, 96, 1);
              -[NEIKEv2IKESAProposal prfProtocol](v24, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v22, v26);
              objc_setProperty_atomic((id)a1, v28, v27, 200);

              objc_getProperty((id)a1, v29, 200, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
              {
                ne_log_obj();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v56) = 0;
                  v32 = "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed";
LABEL_32:
                  v54 = v31;
                  v55 = 2;
LABEL_33:
                  _os_log_fault_impl(&dword_19BD16000, v54, OS_LOG_TYPE_FAULT, v32, (uint8_t *)&v56, v55);
                  goto LABEL_25;
                }
                goto LABEL_25;
              }
              goto LABEL_19;
            }
            ne_log_obj();
            v31 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              goto LABEL_25;
            v56 = 134217984;
            v57 = (const char *)v17;
            v32 = "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed";
            goto LABEL_38;
          }
          ne_log_obj();
          v51 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          v56 = 136315138;
          v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
          v52 = "%s called with null self.skPr";
        }
        _os_log_fault_impl(&dword_19BD16000, v51, OS_LOG_TYPE_FAULT, v52, (uint8_t *)&v56, 0xCu);
LABEL_23:

        goto LABEL_26;
      }
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v56 = 136315138;
        v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
        v33 = "%s called with null packet.authenticatedData";
        goto LABEL_15;
      }
    }
    else
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v56 = 136315138;
        v57 = "-[NEIKEv2IKESA(Crypto) updateIntAuthWithPacket:]";
        v33 = "%s called with null self.chosenProposal.prfProtocol";
LABEL_15:
        _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, v33, (uint8_t *)&v56, 0xCu);
      }
    }
LABEL_26:
    a1 = 0;
    goto LABEL_27;
  }
LABEL_28:

  return a1;
}

- (CFMutableDataRef)createIntAuthOctets
{
  id Property;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  SEL v14;
  void *v15;
  CFIndex v16;
  const char *v17;
  CFMutableDataRef v18;
  void *v19;
  SEL v20;
  void *v21;
  __CFData *v22;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  unsigned int v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    Property = objc_getProperty(self, a2, 96, 1);
    v5 = Property;
    if (Property)
      Property = objc_getProperty(Property, v4, 120, 1);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v6 = Property;

  if (!v6)
    return (CFMutableDataRef)objc_alloc_init(MEMORY[0x1E0C99D50]);
  objc_getProperty(self, v7, 192, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      goto LABEL_14;
    *(_DWORD *)buf = 136315138;
    v29 = "-[NEIKEv2IKESA(Crypto) createIntAuthOctets]";
    v25 = "%s called with null self.intAuthI";
LABEL_17:
    _os_log_fault_impl(&dword_19BD16000, v24, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_14;
  }
  objc_getProperty(self, v9, 200, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v27 = bswap32(self[7]);
    objc_getProperty(self, v11, 192, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    objc_getProperty(self, v14, 200, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13 + objc_msgSend(v15, "length") + 4;

    v18 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v16);
    if (v18)
    {
      objc_getProperty(self, v17, 192, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v18, "appendData:", v19);

      objc_getProperty(self, v20, 200, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFData appendData:](v18, "appendData:", v21);

      -[__CFData appendBytes:length:](v18, "appendBytes:length:", &v27, 4);
      v22 = v18;
    }
    else
    {
      ne_log_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = (const char *)v16;
        _os_log_fault_impl(&dword_19BD16000, v26, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", buf, 0xCu);
      }

    }
    return v18;
  }
  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[NEIKEv2IKESA(Crypto) createIntAuthOctets]";
    v25 = "%s called with null self.intAuthR";
    goto LABEL_17;
  }
LABEL_14:

  return 0;
}

- (NSObject)createAuthenticationDataForSharedSecret:(void *)a3 octets:
{
  id v5;
  const char *v6;
  id v7;
  id Property;
  id v9;
  const char *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v5)
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_14;
    v24 = 136315138;
    v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    v22 = "%s called with null sharedSecretData";
    goto LABEL_17;
  }
  if (a1)
    Property = objc_getProperty(a1, v6, 96, 1);
  else
    Property = 0;
  v9 = Property;

  if (!v9)
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
LABEL_14:

      v20 = 0;
      goto LABEL_15;
    }
    v24 = 136315138;
    v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    v22 = "%s called with null self.chosenProposal";
LABEL_17:
    _os_log_fault_impl(&dword_19BD16000, v21, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&v24, 0xCu);
    goto LABEL_14;
  }
  if (a1)
    v11 = objc_getProperty(a1, v10, 96, 1);
  else
    v11 = 0;
  v12 = v11;
  -[NEIKEv2IKESAProposal prfProtocol](v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      goto LABEL_14;
    v24 = 136315138;
    v25 = "-[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:]";
    v22 = "%s called with null self.chosenProposal.prfProtocol";
    goto LABEL_17;
  }
  if (a1)
    v16 = objc_getProperty(a1, v15, 96, 1);
  else
    v16 = 0;
  v17 = v16;
  -[NEIKEv2IKESAProposal prfProtocol](v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:prfProtocol:]((uint64_t)NEIKEv2IKESA, v5, v7, v19);

LABEL_15:
  return v20;
}

+ (NSObject)createAuthenticationDataForSharedSecret:(void *)a3 octets:(void *)a4 prfProtocol:
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (!v6)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_10:
      v11 = 0;
      goto LABEL_6;
    }
    v15 = 136315138;
    v16 = "+[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:prfProtocol:]";
    v13 = "%s called with null sharedSecretData";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v15, 0xCu);
    goto LABEL_10;
  }
  if (!v8)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    v15 = 136315138;
    v16 = "+[NEIKEv2IKESA(Crypto) createAuthenticationDataForSharedSecret:octets:prfProtocol:]";
    v13 = "%s called with null prfProtocol";
    goto LABEL_15;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "Key Pad for IKEv2", 17, 0);
  v10 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v9, v6, v8);
  if (v10)
  {
    v11 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v7, v10, v8);
  }
  else
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed", (uint8_t *)&v15, 2u);
    }

    v11 = 0;
  }

LABEL_6:
  return v11;
}

- (NSObject)createInitiatorSignedOctetsUsingPrimeKey:(uint64_t)a1
{
  int v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  id Property;
  id v14;
  NSObject *v15;
  NEIKEv2IdentifierPayload *v16;
  const char *v17;
  NEIKEv2IdentifierPayload *v18;
  NEIKEv2IdentifierPayload *WeakRetained;
  NSObject *v20;
  const char *v22;
  _BYTE *v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  ptrdiff_t v28;
  void *v29;
  SEL v30;
  id v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  CFIndex v44;
  CFMutableDataRef v45;
  const char *v46;
  CFMutableDataRef v47;
  void *v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  int v54;
  const char *v55;
  uint64_t v56;

  v2 = (int)a2;
  v56 = *MEMORY[0x1E0C80C00];
  -[NEIKEv2IKESA initiatorFirstMessage]((_BYTE *)a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEIKEv2IKESA responderNonce]((_BYTE *)a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v54 = 136315138;
        v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
        v11 = "%s called with null self.responderNonce";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if (v2)
    {
      objc_getProperty((id)a1, v7, 240, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        ne_log_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v54 = 136315138;
          v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          v11 = "%s called with null self.skPiPrime";
LABEL_26:
          _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v54, 0xCu);
          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else
    {
      objc_getProperty((id)a1, v7, 232, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        ne_log_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v54 = 136315138;
          v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          v11 = "%s called with null self.skPi";
          goto LABEL_26;
        }
        goto LABEL_27;
      }
    }
    if (a1)
      Property = objc_getProperty((id)a1, v9, 96, 1);
    else
      Property = 0;
    v14 = Property;

    if (!v14)
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v54 = 136315138;
        v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
        v11 = "%s called with null self.chosenProposal";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if (a1 && (*(_BYTE *)(a1 + 9) & 1) != 0)
    {
      WeakRetained = (NEIKEv2IdentifierPayload *)objc_loadWeakRetained((id *)(a1 + 328));
      if (WeakRetained)
      {
        v18 = WeakRetained;
        goto LABEL_31;
      }
    }
    else
    {
      v15 = *(id *)(a1 + 344);
      if (v15)
      {
        v10 = v15;
        v16 = objc_alloc_init(NEIKEv2IdentifierPayload);
        if (v16)
        {
          v18 = v16;
          objc_setProperty_atomic(v16, v17, v10, 24);
          goto LABEL_32;
        }
LABEL_59:
        ne_log_obj();
        v18 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_FAULT))
        {
          v54 = 136315138;
          v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
          _os_log_fault_impl(&dword_19BD16000, &v18->super.super, OS_LOG_TYPE_FAULT, "%s called with null idPayload", (uint8_t *)&v54, 0xCu);
        }
        v20 = 0;
        goto LABEL_43;
      }
    }
    v18 = objc_alloc_init(NEIKEv2IdentifierPayload);
    v23 = -[NEIKEv2IKESA copyInitiatorIdentifier]((_BYTE *)a1, v22);
    v25 = v23;
    if (!v18)
    {

      v10 = 0;
      goto LABEL_59;
    }
    objc_setProperty_atomic(v18, v24, v23, 24);

LABEL_31:
    v10 = 0;
LABEL_32:
    v27 = -[NEIKEv2Payload copyPayloadData](v18);
    if (!v27)
    {
      ne_log_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v54) = 0;
        _os_log_fault_impl(&dword_19BD16000, v34, OS_LOG_TYPE_FAULT, "[idPayload copyPayloadData] failed", (uint8_t *)&v54, 2u);
      }
      v20 = 0;
      goto LABEL_42;
    }
    if (v2)
      v28 = 240;
    else
      v28 = 232;
    objc_getProperty((id)a1, v26, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_getProperty((id)a1, v30, 96, 1);
    -[NEIKEv2IKESAProposal prfProtocol](v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v27, v29, v33);

    if (!v34)
    {
      ne_log_obj();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v54) = 0;
        _os_log_fault_impl(&dword_19BD16000, v37, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed", (uint8_t *)&v54, 2u);
      }
      v20 = 0;
      goto LABEL_41;
    }
    v37 = -[NEIKEv2IKESA createIntAuthOctets]((unsigned int *)a1, v35);
    if (v37)
    {
      -[NEIKEv2IKESA initiatorFirstMessage]((_BYTE *)a1, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "length");
      -[NEIKEv2IKESA responderNonce]((_BYTE *)a1, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length") + v39;
      v43 = -[NSObject length](v34, "length");
      v44 = v42 + -[NSObject length](v37, "length") + v43;

      v45 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v44);
      if (v45)
      {
        v47 = v45;
        -[NEIKEv2IKESA initiatorFirstMessage]((_BYTE *)a1, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFData appendData:](v47, "appendData:", v48);

        -[NEIKEv2IKESA responderNonce]((_BYTE *)a1, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFData appendData:](v47, "appendData:", v50);

        -[__CFData appendData:](v47, "appendData:", v34);
        -[__CFData appendData:](v47, "appendData:", v37);
        v51 = v47;
        v20 = v51;
LABEL_40:

LABEL_41:
LABEL_42:

LABEL_43:
        goto LABEL_28;
      }
      ne_log_obj();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        v54 = 134217984;
        v55 = (const char *)v44;
        _os_log_fault_impl(&dword_19BD16000, v53, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", (uint8_t *)&v54, 0xCu);
      }

      v51 = 0;
    }
    else
    {
      ne_log_obj();
      v52 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        v20 = 0;
        v51 = v52;
        goto LABEL_40;
      }
      LOWORD(v54) = 0;
      _os_log_fault_impl(&dword_19BD16000, v52, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createIntAuthOctets] failed", (uint8_t *)&v54, 2u);
      v51 = v52;
    }
    v20 = 0;
    goto LABEL_40;
  }
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v54 = 136315138;
    v55 = "-[NEIKEv2IKESA(Crypto) createInitiatorSignedOctetsUsingPrimeKey:]";
    v11 = "%s called with null self.initiatorFirstMessage";
    goto LABEL_26;
  }
LABEL_27:
  v20 = 0;
LABEL_28:

  return v20;
}

- (NSObject)createResponderSignedOctetsUsingPrimeKey:(_BYTE *)a1
{
  int v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  NEIKEv2IdentifierPayload *v10;
  const char *v11;
  void *v12;
  id Property;
  id v14;
  const char *v15;
  const char *v16;
  _BYTE *v17;
  const char *v18;
  id v19;
  ptrdiff_t v20;
  const char *v21;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  CFIndex v37;
  CFMutableDataRef v38;
  const char *v39;
  CFMutableDataRef v40;
  void *v41;
  const char *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v47;
  NSObject *v48;
  int v49;
  const char *v50;
  uint64_t v51;

  v2 = (int)a2;
  v51 = *MEMORY[0x1E0C80C00];
  -[NEIKEv2IKESA responderFirstMessage](a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    ne_log_obj();
    v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
    {
      v49 = 136315138;
      v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      v11 = "%s called with null self.responderFirstMessage";
      goto LABEL_34;
    }
LABEL_35:
    v45 = 0;
    goto LABEL_36;
  }
  -[NEIKEv2IKESA initiatorNonce](a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    ne_log_obj();
    v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
    {
      v49 = 136315138;
      v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      v11 = "%s called with null self.initiatorNonce";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v2)
  {
    objc_getProperty(a1, v7, 256, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      ne_log_obj();
      v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
      {
        v49 = 136315138;
        v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
        v11 = "%s called with null self.skPrPrime";
LABEL_34:
        _os_log_fault_impl(&dword_19BD16000, &v10->super.super, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v49, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
  else
  {
    objc_getProperty(a1, v7, 248, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      ne_log_obj();
      v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
      {
        v49 = 136315138;
        v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
        v11 = "%s called with null self.skPr";
        goto LABEL_34;
      }
      goto LABEL_35;
    }
  }
  if (a1)
    Property = objc_getProperty(a1, v9, 96, 1);
  else
    Property = 0;
  v14 = Property;

  if (!v14)
  {
    ne_log_obj();
    v10 = (NEIKEv2IdentifierPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_FAULT))
    {
      v49 = 136315138;
      v50 = "-[NEIKEv2IKESA(Crypto) createResponderSignedOctetsUsingPrimeKey:]";
      v11 = "%s called with null self.chosenProposal";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  v10 = objc_alloc_init(NEIKEv2IdentifierPayload);
  v17 = -[NEIKEv2IKESA copyResponderIdentifier](a1, v15);
  if (v10)
    objc_setProperty_atomic(v10, v16, v17, 24);

  v19 = -[NEIKEv2Payload copyPayloadData](v10);
  if (!v19)
  {
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v49) = 0;
      _os_log_fault_impl(&dword_19BD16000, v27, OS_LOG_TYPE_FAULT, "[idPayload copyPayloadData] failed", (uint8_t *)&v49, 2u);
    }
    v45 = 0;
    goto LABEL_29;
  }
  if (v2)
    v20 = 256;
  else
    v20 = 248;
  objc_getProperty(a1, v18, v20, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
    v23 = objc_getProperty(a1, v21, 96, 1);
  else
    v23 = 0;
  v24 = v23;
  -[NEIKEv2IKESAProposal prfProtocol](v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v22, v26);

  if (!v27)
  {
    ne_log_obj();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v49) = 0;
      _os_log_fault_impl(&dword_19BD16000, v30, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createHMACFromData:key:prfProtocol:] failed", (uint8_t *)&v49, 2u);
    }
    v45 = 0;
    goto LABEL_28;
  }
  v30 = -[NEIKEv2IKESA createIntAuthOctets]((unsigned int *)a1, v28);
  if (!v30)
  {
    ne_log_obj();
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
    {
      v45 = 0;
      v44 = v47;
      goto LABEL_27;
    }
    LOWORD(v49) = 0;
    _os_log_fault_impl(&dword_19BD16000, v47, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createIntAuthOctets] failed", (uint8_t *)&v49, 2u);
    v44 = v47;
LABEL_48:
    v45 = 0;
    goto LABEL_27;
  }
  -[NEIKEv2IKESA responderFirstMessage](a1, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");
  -[NEIKEv2IKESA initiatorNonce](a1, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length") + v32;
  v36 = -[NSObject length](v27, "length");
  v37 = v35 + -[NSObject length](v30, "length") + v36;

  v38 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v37);
  if (!v38)
  {
    ne_log_obj();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      v49 = 134217984;
      v50 = (const char *)v37;
      _os_log_fault_impl(&dword_19BD16000, v48, OS_LOG_TYPE_FAULT, "[NESensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", (uint8_t *)&v49, 0xCu);
    }

    v44 = 0;
    goto LABEL_48;
  }
  v40 = v38;
  -[NEIKEv2IKESA responderFirstMessage](a1, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFData appendData:](v40, "appendData:", v41);

  -[NEIKEv2IKESA initiatorNonce](a1, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFData appendData:](v40, "appendData:", v43);

  -[__CFData appendData:](v40, "appendData:", v27);
  -[__CFData appendData:](v40, "appendData:", v30);
  v44 = v40;
  v45 = v44;
LABEL_27:

LABEL_28:
LABEL_29:

LABEL_36:
  return v45;
}

- (uint64_t)createRemoteSignedOctetsUsingPrimeKey:(uint64_t)a1
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 9) & 1) != 0)
      return (uint64_t)-[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:]((_BYTE *)a1, a2);
    else
      return (uint64_t)-[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:](a1, a2);
  }
  return a1;
}

- (SecKeyRef)checkValidityOfCertificates:(void *)a1
{
  id v3;
  const char *v4;
  id Property;
  id v6;
  __CFString *v7;
  const char *v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const __CFDictionary *v17;
  SecPolicyRef v18;
  SecPolicyRef v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFAllocator *v26;
  uint64_t i;
  SecCertificateRef v28;
  SecCertificateRef v29;
  const void *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  id v34;
  id v35;
  const char *v36;
  int v37;
  id v38;
  id v39;
  int v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  CFOptionFlags v46;
  SecPolicyRef Revocation;
  SecPolicyRef v48;
  id v49;
  void *v50;
  OSStatus v51;
  NSObject *v52;
  NSObject *v53;
  SecKeyRef v54;
  NSObject *v55;
  const __CFString *v57;
  NSObject *v58;
  id v59;
  id v60;
  void *v61;
  const char *v62;
  OSStatus v63;
  OSStatus v64;
  NSObject *v65;
  SecPolicyRef v66;
  NSObject *v67;
  int v68;
  int v69;
  id v70;
  id v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  const char *v75;
  NSObject *v76;
  NSObject *v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  const char *v81;
  NSObject *v82;
  uint32_t v83;
  CFArrayRef v84;
  NSObject *v85;
  NSObject *v86;
  CFIndex Count;
  CFIndex v88;
  CFIndex v89;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v91;
  CFTypeID v92;
  const __CFString *Value;
  const __CFString *v94;
  id v95;
  CFTypeID v96;
  BOOL v97;
  const char *CStringPtr;
  const char *v99;
  NSObject *v100;
  const __CFString *v101;
  const __CFString *v102;
  id v103;
  CFTypeID v104;
  const char *v105;
  const char *v106;
  NSObject *v107;
  NSObject *v108;
  id v109;
  const __CFArray *theArray;
  void *v111;
  void *key;
  id v113;
  id v114;
  NSObject *v115;
  void *v116;
  id v117;
  SecPolicyRef cf;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint8_t v123[16];
  uint8_t v124[128];
  _BYTE buf[12];
  SecTrustRef trust[4];

  trust[1] = *(SecTrustRef *)MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    if (a1)
      Property = objc_getProperty(a1, v4, 88, 1);
    else
      Property = 0;
    v6 = Property;
    objc_msgSend(v6, "remoteCertificateHostname");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v7, "length"))
    {
      if (a1)
        v9 = objc_getProperty(a1, v8, 88, 1);
      else
        v9 = 0;
      v10 = v9;
      objc_msgSend(v10, "remoteIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString length](v12, "length"))
      {
        v7 = v12;
      }
      else
      {
        -[NEIKEv2IKESA remoteIdentifier](a1, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    if (!-[__CFString length](v7, "length"))
    {

      v7 = 0;
    }
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v57 = CFSTR("<not set>");
      if (v7)
        v57 = v7;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v57;
      _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "Matching remote hostname %@ with remote certificate", buf, 0xCu);
    }

    v16 = v7;
    objc_opt_self();
    if (v16)
    {
      trust[0] = *(SecTrustRef *)MEMORY[0x1E0CD6F88];
      *(_QWORD *)buf = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, trust, 1);
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v18 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x1E0CD6F68], v17);
    if (v18)
    {
      v19 = v18;

      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v20)
      {
        v21 = v20;
        v117 = v3;
        cf = v19;
        v115 = v16;
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v22 = v3;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v120;
          v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          while (2)
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v120 != v25)
                objc_enumerationMutation(v22);
              v28 = SecCertificateCreateWithData(v26, *(CFDataRef *)(*((_QWORD *)&v119 + 1) + 8 * i));
              if (!v28)
              {
                ne_log_obj();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_19BD16000, v53, OS_LOG_TYPE_FAULT, "SecCertificateCreateWithData failed", buf, 2u);
                }

                CFRelease(cf);
                goto LABEL_53;
              }
              v29 = v28;
              if (nelog_is_debug_logging_enabled())
              {
                CFAbsoluteTimeGetCurrent();
                v30 = (const void *)SecCertificateCopySummaryProperties();
                ne_log_large_obj();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v30;
                  _os_log_debug_impl(&dword_19BD16000, v31, OS_LOG_TYPE_DEBUG, "Certificate Properties:\n%@", buf, 0xCu);
                }

                if (v30)
                  CFRelease(v30);
              }
              NECertificateDateIsValid((uint64_t)v29);
              -[NSObject addObject:](v21, "addObject:", v29);
              CFRelease(v29);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
            if (v24)
              continue;
            break;
          }
        }

        if (!-[NSObject count](v21, "count"))
        {
          ne_log_obj();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19BD16000, v58, OS_LOG_TYPE_ERROR, "No valid remote certificate", buf, 2u);
          }

          CFRelease(cf);
LABEL_53:
          v54 = 0;
          v16 = v115;
          v3 = v117;
          goto LABEL_58;
        }
        v32 = -[NEIKEv2IKESA copyRemoteCertificateAuthorityArray](a1);
        if (objc_msgSend(v32, "count"))
        {
LABEL_33:
          if (a1)
            v34 = objc_getProperty(a1, v33, 88, 1);
          else
            v34 = 0;
          v16 = v115;
          v35 = v34;
          v37 = objc_msgSend(v35, "enableCertificateRevocationCheck");
          if (a1)
            v38 = objc_getProperty(a1, v36, 88, 1);
          else
            v38 = 0;
          v39 = v38;
          v40 = objc_msgSend(v39, "strictCertificateRevocationCheck");
          v41 = v21;
          v42 = v32;
          objc_opt_self();
          trust[0] = 0;
          v116 = v42;
          if (!v37)
          {
            v51 = SecTrustCreateWithCertificates(v41, cf, trust);
LABEL_71:
            if (v51 || !trust[0])
            {
              if (trust[0])
              {
                CFRelease(trust[0]);
                trust[0] = 0;
              }
              ne_log_obj();
              v67 = objc_claimAutoreleasedReturnValue();
              v66 = cf;
              if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_19BD16000, v67, OS_LOG_TYPE_FAULT, "SecTrustCreateWithCertificates failed", buf, 2u);
              }

            }
            else
            {
              if (objc_msgSend(v116, "count") && (v63 = SecTrustSetAnchorCertificates(trust[0], (CFArrayRef)v116)) != 0)
              {
                v64 = v63;
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0;
                }
                ne_log_obj();
                v65 = objc_claimAutoreleasedReturnValue();
                v66 = cf;
                if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v64;
                  _os_log_fault_impl(&dword_19BD16000, v65, OS_LOG_TYPE_FAULT, "Failed to set anchor CA certificates for remote certificate validation (%d)", buf, 8u);
                }
              }
              else
              {
                *(_DWORD *)v123 = 0;
                v68 = MEMORY[0x1A1ACE3D0](trust[0], v123);
                if (!v68)
                {
                  switch(*(_DWORD *)v123)
                  {
                    case 0:
                      ne_log_obj();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        goto LABEL_131;
                      *(_WORD *)buf = 0;
                      v81 = "Certificate evaluation error = kSecTrustResultInvalid";
                      goto LABEL_129;
                    case 1:
                    case 4:
                      v78 = v37 & v40;
                      v66 = cf;
                      if (v78 == 1)
                      {
                        ne_log_obj();
                        v79 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_19BD16000, v79, OS_LOG_TYPE_INFO, "Strict Certificate Revocation Check is not supported", buf, 2u);
                        }

                      }
                      v54 = SecTrustCopyKey(trust[0]);
                      if (!trust[0])
                        goto LABEL_101;
                      CFRelease(trust[0]);
                      goto LABEL_159;
                    case 3:
                      ne_log_obj();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        goto LABEL_131;
                      *(_WORD *)buf = 0;
                      v81 = "Certificate evaluation error = kSecTrustResultDeny";
                      goto LABEL_129;
                    case 5:
                      ne_log_obj();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        goto LABEL_131;
                      *(_WORD *)buf = 0;
                      v81 = "Certificate evaluation error = kSecTrustResultRecoverableTrustFailure";
                      goto LABEL_129;
                    case 6:
                      ne_log_obj();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        goto LABEL_131;
                      *(_WORD *)buf = 0;
                      v81 = "Certificate evaluation error = kSecTrustResultFatalTrustFailure";
                      goto LABEL_129;
                    case 7:
                      ne_log_obj();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        goto LABEL_131;
                      *(_WORD *)buf = 0;
                      v81 = "Certificate evaluation error = kSecTrustResultOtherError";
LABEL_129:
                      v82 = v80;
                      v83 = 2;
                      break;
                    default:
                      ne_log_obj();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                        goto LABEL_131;
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&buf[4] = *(_DWORD *)v123;
                      v81 = "Certificate evaluation error = Unknown (%d)";
                      v82 = v80;
                      v83 = 8;
                      break;
                  }
                  _os_log_error_impl(&dword_19BD16000, v82, OS_LOG_TYPE_ERROR, v81, buf, v83);
LABEL_131:

                  v66 = cf;
                  if (nelog_is_debug_logging_enabled())
                  {
                    v84 = SecTrustCopyProperties(trust[0]);
                    if (v84)
                    {
                      v109 = v39;
                      theArray = v84;
                      v114 = v32;
                      v85 = v41;
                      ne_log_obj();
                      v86 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_debug_impl(&dword_19BD16000, v86, OS_LOG_TYPE_DEBUG, "---------------Returned error strings: ---------------", buf, 2u);
                      }

                      Count = CFArrayGetCount(theArray);
                      if (Count >= 1)
                      {
                        v88 = Count;
                        v89 = 0;
                        key = (void *)*MEMORY[0x1E0CD6FD8];
                        v111 = (void *)*MEMORY[0x1E0CD6FE0];
                        do
                        {
                          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v89);
                          if (ValueAtIndex)
                          {
                            v91 = ValueAtIndex;
                            v92 = CFGetTypeID(ValueAtIndex);
                            if (v92 == CFDictionaryGetTypeID())
                            {
                              Value = (const __CFString *)CFDictionaryGetValue(v91, key);
                              if (Value)
                              {
                                v94 = Value;
                                v95 = v35;
                                v96 = CFGetTypeID(Value);
                                v97 = v96 == CFStringGetTypeID();
                                v35 = v95;
                                if (v97)
                                {
                                  CStringPtr = CFStringGetCStringPtr(v94, 0);
                                  if (CStringPtr)
                                  {
                                    v99 = CStringPtr;
                                    ne_log_obj();
                                    v100 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 136315138;
                                      *(_QWORD *)&buf[4] = v99;
                                      _os_log_debug_impl(&dword_19BD16000, v100, OS_LOG_TYPE_DEBUG, "type = %s", buf, 0xCu);
                                    }

                                    v35 = v95;
                                  }
                                }
                              }
                              v101 = (const __CFString *)CFDictionaryGetValue(v91, v111);
                              if (v101)
                              {
                                v102 = v101;
                                v103 = v35;
                                v104 = CFGetTypeID(v101);
                                v97 = v104 == CFStringGetTypeID();
                                v35 = v103;
                                if (v97)
                                {
                                  v105 = CFStringGetCStringPtr(v102, 0);
                                  if (v105)
                                  {
                                    v106 = v105;
                                    ne_log_obj();
                                    v107 = objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 136315138;
                                      *(_QWORD *)&buf[4] = v106;
                                      _os_log_debug_impl(&dword_19BD16000, v107, OS_LOG_TYPE_DEBUG, "value = %s", buf, 0xCu);
                                    }

                                    v35 = v103;
                                  }
                                }
                              }
                            }
                          }
                          ++v89;
                        }
                        while (v88 != v89);
                      }
                      ne_log_obj();
                      v108 = objc_claimAutoreleasedReturnValue();
                      v66 = cf;
                      v41 = v85;
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_debug_impl(&dword_19BD16000, v108, OS_LOG_TYPE_DEBUG, "-----------------------------------------------------", buf, 2u);
                      }

                      CFRelease(theArray);
                      v39 = v109;
                      v32 = v114;
                    }
                  }
                  if (trust[0])
                  {
                    CFRelease(trust[0]);
                    v54 = 0;
LABEL_159:
                    trust[0] = 0;
                  }
                  else
                  {
                    v54 = 0;
                  }
                  goto LABEL_101;
                }
                v69 = v68;
                v66 = cf;
                if (trust[0])
                {
                  CFRelease(trust[0]);
                  trust[0] = 0;
                }
                ne_log_obj();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v69;
                  _os_log_error_impl(&dword_19BD16000, v65, OS_LOG_TYPE_ERROR, "Remote certificate evaluation error (%d)", buf, 8u);
                }
              }

            }
            v54 = 0;
LABEL_101:

            CFRelease(v66);
            ne_log_obj();
            v76 = objc_claimAutoreleasedReturnValue();
            v77 = v76;
            if (v54)
            {
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v54;
                _os_log_debug_impl(&dword_19BD16000, v77, OS_LOG_TYPE_DEBUG, "Certificate public key: %@", buf, 0xCu);
              }

              goto LABEL_109;
            }
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v77, OS_LOG_TYPE_ERROR, "Certificate is not trusted", buf, 2u);
            }

LABEL_108:
            v54 = 0;
LABEL_109:

            v3 = v117;
            goto LABEL_58;
          }
          v113 = v32;
          v43 = v39;
          v44 = v35;
          ne_log_obj();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19BD16000, v45, OS_LOG_TYPE_DEBUG, "Request certificate revocation check", buf, 2u);
          }

          if (v40)
            v46 = 11;
          else
            v46 = 3;
          Revocation = SecPolicyCreateRevocation(v46);
          if (Revocation)
          {
            v48 = Revocation;
            v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (v49)
            {
              v50 = v49;
              objc_msgSend(v49, "addObject:", cf);
              objc_msgSend(v50, "addObject:", v48);
              CFRelease(v48);
              v51 = SecTrustCreateWithCertificates(v41, v50, trust);

              v35 = v44;
              v39 = v43;
              v32 = v113;
              goto LABEL_71;
            }
            CFRelease(v48);
            ne_log_obj();
            v74 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
            {
LABEL_100:

              v54 = 0;
              v35 = v44;
              v39 = v43;
              v32 = v113;
              v66 = cf;
              goto LABEL_101;
            }
            *(_WORD *)buf = 0;
            v75 = "[[NSMutableArray alloc] init] failed";
          }
          else
          {
            ne_log_obj();
            v74 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
              goto LABEL_100;
            *(_WORD *)buf = 0;
            v75 = "SecPolicyCreateRevocation failed";
          }
          _os_log_fault_impl(&dword_19BD16000, v74, OS_LOG_TYPE_FAULT, v75, buf, 2u);
          goto LABEL_100;
        }
        if (a1)
          v59 = objc_getProperty(a1, v33, 88, 1);
        else
          v59 = 0;
        v60 = v59;
        objc_msgSend(v60, "remoteCertificateAuthorityReferences");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {

        }
        else
        {
          if (a1)
            v70 = objc_getProperty(a1, v62, 88, 1);
          else
            v70 = 0;
          v71 = v70;
          objc_msgSend(v71, "remoteCertificateAuthorityName");
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v72)
            goto LABEL_33;
        }
        ne_log_obj();
        v73 = objc_claimAutoreleasedReturnValue();
        v16 = v115;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v73, OS_LOG_TYPE_ERROR, "remoteCertAuthorityArray missing from config", buf, 2u);
        }

        CFRelease(cf);
        goto LABEL_108;
      }
      CFRelease(v19);
      ne_log_obj();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v55, OS_LOG_TYPE_FAULT, "[[NSMutableArray alloc] init] failed", buf, 2u);
      }

      v21 = 0;
    }
    else
    {
      ne_log_obj();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v123 = 0;
        _os_log_fault_impl(&dword_19BD16000, v52, OS_LOG_TYPE_FAULT, "SecPolicyCreateWithProperties failed", v123, 2u);
      }

      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v16;
        _os_log_fault_impl(&dword_19BD16000, v21, OS_LOG_TYPE_FAULT, "Could not create secure policy with hostname %@", buf, 0xCu);
      }
    }
    v54 = 0;
LABEL_58:

    goto LABEL_59;
  }
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[NEIKEv2IKESA(Crypto) checkValidityOfCertificates:]";
    _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "%s called with null certificateDataArray.count", buf, 0xCu);
  }
  v54 = 0;
LABEL_59:

  return v54;
}

- (NEIKEv2AuthPayload)copyAuthenticationPayloadUsingPrimeKey:(id *)self
{
  id *v3;
  id *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NEIKEv2AuthPayload *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  const char *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  id v22;
  void *v23;
  void *v24;
  const char *v25;
  ptrdiff_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  _UNKNOWN **v30;
  NEIKEv2SignatureHashProtocol *v31;
  id v32;
  int v33;
  NEIKEv2AuthenticationProtocol *v34;
  NSObject *v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFData *v38;
  CFDataRef Signature;
  NSObject *v40;
  NSObject *v41;
  id v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  size_t BlockSize;
  char *v53;
  void *v54;
  char *v55;
  NSObject *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  int v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NEIKEv2AuthenticationProtocol *v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  id v83;
  NSObject *v84;
  NEIKEv2AuthenticationProtocol *v85;
  unint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v90;
  void *v91;
  char *v92;
  id v93;
  NSObject *v94;
  const char *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id obj;
  CFErrorRef error[2];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t v108[4];
  void *v109;
  __int16 v110;
  uint64_t v111;
  uint8_t buf[4];
  const char *v113;
  __int16 v114;
  id v115;
  uint64_t v116;

  v3 = self;
  v116 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (id *)objc_getProperty(self, a2, 96, 1);
  v4 = self;

  if (v4)
  {
    if (v3 && (*((_BYTE *)v3 + 9) & 1) != 0)
      v5 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v3, a2);
    else
      v5 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v3, a2);
    v7 = v5;
    if (!v5)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "[self createLocalSignedOctetsUsingPrimeKey:] failed", buf, 2u);
      }
      goto LABEL_66;
    }
    -[NEIKEv2IKESA authenticationProtocol](v3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject method](v9, "method") == 2)
    {
      -[NEIKEv2IKESA sharedSecret](v3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v3, v11, v7);

      if (!v12)
      {
        ne_log_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v14 = "createAuthenticationDataForSharedSecret: failed";
LABEL_16:
          v15 = v13;
          v16 = 2;
LABEL_31:
          _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, v14, buf, v16);
        }
LABEL_65:

LABEL_66:
        v8 = 0;
LABEL_145:

        goto LABEL_146;
      }
LABEL_144:
      v8 = objc_alloc_init(NEIKEv2AuthPayload);
      -[NEIKEv2AuthPayload setAuthProtocol:]((uint64_t)v8, v9);
      -[NEIKEv2AuthPayload setAuthenticationData:]((uint64_t)v8, v12);

      goto LABEL_145;
    }
    if (-[NSObject method](v9, "method") == 13)
    {
      if (v3 && (*((_BYTE *)v3 + 9) & 1) != 0)
      {
        v18 = (_DWORD)a2 == 0;
        v19 = 232;
        v20 = 240;
      }
      else
      {
        v18 = (_DWORD)a2 == 0;
        v19 = 248;
        v20 = 256;
      }
      if (v18)
        v26 = v19;
      else
        v26 = v20;
      objc_getProperty(v3, v17, v26, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v27 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v3, v13, v7);
      if (!v27)
      {
        ne_log_obj();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, v28, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret: failed", buf, 2u);
        }

        goto LABEL_65;
      }
      v12 = v27;

      goto LABEL_144;
    }
    if (!-[NSObject isSignature](v9, "isSignature"))
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = (const char *)v9;
        v14 = "Unknown auth protocol %@";
        v15 = v13;
        v16 = 12;
        goto LABEL_31;
      }
      goto LABEL_65;
    }
    if (v3)
    {
      v22 = objc_getProperty(v3, v21, 88, 1);
      v23 = v22;
      if (v22 && objc_msgSend(v22, "localPrivateKeyRef"))
      {
        v24 = (void *)objc_msgSend(v23, "localPrivateKeyRef");
        CFRetain(v24);

        if (v24)
          goto LABEL_44;
        goto LABEL_43;
      }
    }
    else
    {
      v23 = 0;
    }

LABEL_43:
    v24 = (void *)-[NEIKEv2IKESA copyCertSigningKey](v3, v25);
    if (!v24)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        goto LABEL_65;
      *(_WORD *)buf = 0;
      v14 = "[self copyCertSigningKey] failed";
      goto LABEL_16;
    }
LABEL_44:
    -[NEIKEv2IKESA authenticationProtocol](v3, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = &off_1E3CBB000;
    if (objc_msgSend(v29, "method") == 1 || (objc_msgSend(v29, "isSignature") & 1) == 0)
    {
      v34 = v29;
      goto LABEL_50;
    }
    if (objc_msgSend(v29, "isDigitalSignature"))
    {
      v31 = +[NEIKEv2Crypto copySignHashProtocolForAuth:]((uint64_t)NEIKEv2Crypto, v29);
      v32 = v3[14];
      v33 = objc_msgSend(v32, "containsObject:", v31);

      if (v33)
      {
        v34 = v29;
      }
      else
      {
        ne_log_obj();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v93 = v3[14];
          *(_DWORD *)buf = 138412546;
          v113 = (const char *)v31;
          v114 = 2112;
          v115 = v93;
          _os_log_error_impl(&dword_19BD16000, v56, OS_LOG_TYPE_ERROR, "Digital signature hash protocol %@ is not supported by peer, supports %@", buf, 0x16u);

        }
        v34 = 0;
      }

LABEL_50:
      if (!v34)
      {
        ne_log_obj();
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, v94, OS_LOG_TYPE_FAULT, "Failed to select auth protocol for signature generation", buf, 2u);
        }

        CFRelease(v24);
        v9 = 0;
        goto LABEL_66;
      }
      v35 = v7;
      v9 = v34;
      objc_opt_self();
      if (-[NSObject length](v35, "length"))
      {
        v36 = +[NEIKEv2Crypto signatureAlgorithmTypeForAuthentication:]((uint64_t)v30[305], v9);
        if (v36)
        {
          v37 = (const __CFString *)v36;
          v38 = v35;
          objc_opt_self();
          error[0] = 0;
          Signature = SecKeyCreateSignature((SecKeyRef)v24, v37, v38, error);

          if (Signature && !error[0])
          {
            v40 = Signature;

            if (-[NSObject isDigitalSignature](v9, "isDigitalSignature"))
            {
              LOBYTE(error[0]) = 0;
              v41 = v9;
              objc_opt_self();
              switch(-[NSObject digitalSignatureAlgorithm](v41, "digitalSignatureAlgorithm"))
              {
                case 1:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdRSAPKCS256;
                  goto LABEL_101;
                case 2:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdECDSA256;
                  goto LABEL_104;
                case 3:
                  v70 = -[NSObject isNonStandard](v41, "isNonStandard");
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  if (v70)
                  {
                    v43 = &NEIKEv2ASN1AlgorithmIdED25519NonStandard;
                    v71 = 4;
                  }
                  else
                  {
                    v43 = &NEIKEv2ASN1AlgorithmIdED25519;
LABEL_138:
                    v71 = 7;
                  }
                  goto LABEL_139;
                case 4:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdED448;
                  goto LABEL_138;
                case 5:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdRSAPKCS384;
                  goto LABEL_101;
                case 6:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdRSAPKCS512;
LABEL_101:
                  v71 = 15;
                  goto LABEL_139;
                case 7:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdECDSA384;
                  goto LABEL_104;
                case 8:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdECDSA512;
LABEL_104:
                  v71 = 12;
                  goto LABEL_139;
                case 9:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdRSAPSS256;
                  goto LABEL_108;
                case 10:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdRSAPSS384;
                  goto LABEL_108;
                case 11:
                  v42 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v43 = &NEIKEv2ASN1AlgorithmIdRSAPSS512;
LABEL_108:
                  v71 = 67;
LABEL_139:
                  v69 = (void *)objc_msgSend(v42, "initWithBytesNoCopy:length:freeWhenDone:", v43, v71, 0);

                  if (!v69)
                    goto LABEL_94;
                  v86 = objc_msgSend(v69, "length");
                  v87 = (const char *)v86;
                  if (v86 >= 0x100)
                  {
                    ne_log_obj();
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      v113 = v87;
                      _os_log_fault_impl(&dword_19BD16000, v96, OS_LOG_TYPE_FAULT, "Encoded signature algorithm data length %zu is too long", buf, 0xCu);
                    }

LABEL_94:
                    v12 = 0;
                  }
                  else
                  {
                    LOBYTE(error[0]) = v86;
                    v88 = v86 + -[NSObject length](v40, "length") + 1;
                    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v88);
                    -[NSObject appendBytes:length:](v12, "appendBytes:length:", error, 1);
                    -[NSObject appendData:](v12, "appendData:", v69);
                    -[NSObject appendData:](v12, "appendData:", v40);
                  }

                  break;
                default:
                  ne_log_obj();
                  v68 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v113 = (const char *)v41;
                    _os_log_fault_impl(&dword_19BD16000, v68, OS_LOG_TYPE_FAULT, "Cannot create algorithm identifier for authentication protocol %@", buf, 0xCu);
                  }

                  v69 = 0;
                  goto LABEL_94;
              }
            }
            else
            {
              v40 = v40;
              v12 = v40;
            }
LABEL_143:

            CFRelease(v24);
            if (!v12)
              goto LABEL_66;
            goto LABEL_144;
          }
          ne_log_obj();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v113 = (const char *)error[0];
            _os_log_fault_impl(&dword_19BD16000, v44, OS_LOG_TYPE_FAULT, "Failed to sign with private key: %@", buf, 0xCu);
          }

          if (error[0])
          {
            CFRelease(error[0]);
            error[0] = 0;
          }

          v40 = 0;
LABEL_63:
          v12 = 0;
          goto LABEL_143;
        }
        ne_log_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          goto LABEL_63;
        *(_DWORD *)buf = 138412290;
        v113 = (const char *)v9;
        v95 = "Invalid signature protcol %@";
      }
      else
      {
        ne_log_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          goto LABEL_63;
        *(_DWORD *)buf = 136315138;
        v113 = "+[NEIKEv2Crypto copySignatureForData:authProtocol:privateKey:]";
        v95 = "%s called with null inputData.length";
      }
      _os_log_fault_impl(&dword_19BD16000, v40, OS_LOG_TYPE_FAULT, v95, buf, 0xCu);
      goto LABEL_63;
    }
    v45 = objc_alloc(MEMORY[0x1E0C99E20]);
    v46 = v3[14];
    v47 = (void *)objc_msgSend(v45, "initWithSet:", v46);

    v48 = v29;
    objc_opt_self();
    v49 = v48;
    v50 = (void *)+[NEIKEv2Crypto copySignHashSetForAuthMethod:]((uint64_t)NEIKEv2Crypto, v48);
    v101 = v29;
    v102 = v49;
    if (v49
      && ((v51 = objc_msgSend(v49, "method"), v51 == 245)
       || v51 == 14 && (unint64_t)(objc_msgSend(v49, "digitalSignatureAlgorithm") - 9) <= 2)
      && (BlockSize = SecKeyGetBlockSize((SecKeyRef)v24), BlockSize <= 0x81))
    {
      v57 = BlockSize;
      v98 = v47;
      v99 = v24;
      v97 = v50;
      v58 = (void *)objc_msgSend(v50, "mutableCopy");
      *(_OWORD *)error = 0u;
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      obj = (id)objc_msgSend(v58, "copy");
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", error, buf, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v105;
        v100 = 8 * v57;
        while (2)
        {
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v105 != v61)
              objc_enumerationMutation(obj);
            v63 = (void *)*((_QWORD *)error[1] + i);
            v64 = objc_msgSend(v63, "hashType") - 2;
            if (v64 >= 3)
            {
              ne_log_obj();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v108 = 138412290;
                v109 = v63;
                _os_log_fault_impl(&dword_19BD16000, v72, OS_LOG_TYPE_FAULT, "Unexpected hash protocol %@ in RSA-PSS set", v108, 0xCu);
              }

              v55 = 0;
              goto LABEL_112;
            }
            if (v57 < 32 * v64 + 66)
            {
              v65 = v57;
              v66 = v58;
              ne_log_obj();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v108 = 138412546;
                v109 = v63;
                v110 = 2048;
                v111 = v100;
                _os_log_impl(&dword_19BD16000, v67, OS_LOG_TYPE_INFO, "Removing too large hash protocol %@ from set for RSA key size %zu", v108, 0x16u);
              }

              v58 = v66;
              objc_msgSend(v66, "removeObject:", v63);
              v57 = v65;
            }
          }
          v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", error, buf, 16);
          if (v60)
            continue;
          break;
        }
      }

      v55 = v58;
LABEL_112:
      v24 = v99;
      v49 = v102;

      v54 = v97;
      v47 = v98;
    }
    else
    {
      v53 = v50;
      v54 = v50;
      v55 = v53;
    }

    ne_log_obj();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      v91 = v47;
      v92 = (char *)v3[14];
      *(_DWORD *)buf = 138412290;
      v113 = v92;
      _os_log_debug_impl(&dword_19BD16000, v73, OS_LOG_TYPE_DEBUG, "Peer hashes: %@", buf, 0xCu);

      v47 = v91;
    }

    ne_log_obj();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v113 = v55;
      _os_log_debug_impl(&dword_19BD16000, v74, OS_LOG_TYPE_DEBUG, "Protocol hashes: %@", buf, 0xCu);
    }

    objc_msgSend(v47, "intersectSet:", v55);
    objc_msgSend(v47, "allObjects");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "sortedArrayUsingSelector:", sel_compare_);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v76, "lastObject");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v102, "method") == 245)
    {
      if (!v77)
      {
        ne_log_obj();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BD16000, v82, OS_LOG_TYPE_ERROR, "Unable to find acceptable hash algorithm for generating RSA-PSS signature", buf, 2u);
        }
        goto LABEL_156;
      }
      v78 = objc_msgSend(v77, "hashType");
      switch(v78)
      {
        case 4:
          v79 = [NEIKEv2AuthenticationProtocol alloc];
          v80 = 11;
          goto LABEL_153;
        case 3:
          v79 = [NEIKEv2AuthenticationProtocol alloc];
          v80 = 10;
          goto LABEL_153;
        case 2:
          v79 = [NEIKEv2AuthenticationProtocol alloc];
          v80 = 9;
LABEL_153:
          v85 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:](v79, "initWithDigitalSignature:", v80);
LABEL_154:
          v34 = v85;
LABEL_157:

          v30 = &off_1E3CBB000;
          v29 = v101;
          goto LABEL_50;
      }
      ne_log_obj();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = (const char *)v77;
        v90 = "Unexpected hash protocol %@ when selecting RSA-PSS protocol";
LABEL_167:
        _os_log_fault_impl(&dword_19BD16000, v82, OS_LOG_TYPE_FAULT, v90, buf, 0xCu);
      }
    }
    else
    {
      if (!-[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v102))
      {
        ne_log_obj();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
        {
          v83 = v3[14];
          *(_DWORD *)buf = 138412546;
          v113 = (const char *)v102;
          v114 = 2112;
          v115 = v83;
          _os_log_fault_impl(&dword_19BD16000, v82, OS_LOG_TYPE_FAULT, "Unable to determine authentication protocol to use, configured %@ hashes %@", buf, 0x16u);

        }
        goto LABEL_156;
      }
      if (!v77)
      {
        ne_log_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BD16000, v84, OS_LOG_TYPE_INFO, "Unable to find acceptable hash algorithm for generating ECDSA signature", buf, 2u);
        }

        v85 = v102;
        goto LABEL_154;
      }
      v81 = objc_msgSend(v77, "hashType");
      switch(v81)
      {
        case 4:
          v79 = [NEIKEv2AuthenticationProtocol alloc];
          v80 = 8;
          goto LABEL_153;
        case 3:
          v79 = [NEIKEv2AuthenticationProtocol alloc];
          v80 = 7;
          goto LABEL_153;
        case 2:
          v79 = [NEIKEv2AuthenticationProtocol alloc];
          v80 = 2;
          goto LABEL_153;
      }
      ne_log_obj();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = (const char *)v77;
        v90 = "Unexpected hash protocol %@ when selecting ECDSA protocol";
        goto LABEL_167;
      }
    }
LABEL_156:

    v34 = 0;
    goto LABEL_157;
  }
  ne_log_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v113 = "-[NEIKEv2IKESA(Crypto) copyAuthenticationPayloadUsingPrimeKey:]";
    _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "%s called with null self.chosenProposal", buf, 0xCu);
  }
  v8 = 0;
LABEL_146:

  return v8;
}

- (uint64_t)checkSharedKeyAuthData:(const char *)a3 usingPrimeKey:
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  ptrdiff_t v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = v5;
  if (a1)
  {
    if (v5)
    {
      v8 = objc_getProperty((id)a1, v6, 96, 1);

      if (v8)
      {
        -[NEIKEv2IKESA remoteAuthentication]((id)a1, v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          if ((-[NSObject isSignature](v10, "isSignature") & 1) == 0
            && !-[NSObject isSecurePassword](v11, "isSecurePassword"))
          {
            v16 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](a1, a3);
            if (!v16)
            {
              ne_log_obj();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                LOWORD(v29) = 0;
                _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "[self createRemoteSignedOctetsUsingPrimeKey:] failed", (uint8_t *)&v29, 2u);
              }

              v12 = 0;
              goto LABEL_39;
            }
            v12 = v16;
            if (-[NSObject method](v11, "method") == 2)
            {
              -[NEIKEv2IKESA sharedSecret]((void *)a1, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (-[NSObject method](v11, "method") != 13)
              {
LABEL_36:
                ne_log_obj();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                {
                  v29 = 136315138;
                  v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
                  _os_log_fault_impl(&dword_19BD16000, v27, OS_LOG_TYPE_FAULT, "%s called with null sharedSecret", (uint8_t *)&v29, 0xCu);
                }

                goto LABEL_39;
              }
              if ((*(_BYTE *)(a1 + 9) & 1) != 0)
              {
                v21 = (void *)a1;
                if ((a3 & 1) != 0)
                  v22 = 256;
                else
                  v22 = 248;
              }
              else
              {
                v21 = (void *)a1;
                if ((a3 & 1) != 0)
                  v22 = 240;
                else
                  v22 = 232;
              }
              objc_getProperty(v21, v20, v22, 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v24 = v18;
            if (v18)
            {
              v25 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:]((void *)a1, v18, v12);
              if (v25)
              {
                a1 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v25, v7);
              }
              else
              {
                ne_log_obj();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v29) = 0;
                  _os_log_fault_impl(&dword_19BD16000, v26, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret: failed", (uint8_t *)&v29, 2u);
                }

                a1 = 0;
              }

              goto LABEL_40;
            }
            goto LABEL_36;
          }
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
LABEL_39:
            a1 = 0;
LABEL_40:

            goto LABEL_41;
          }
          LOWORD(v29) = 0;
          v13 = "Do not call checkSharedKeyAuthData with signature/GSPM auth";
          v14 = v12;
          v15 = 2;
        }
        else
        {
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            goto LABEL_39;
          v29 = 136315138;
          v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
          v13 = "%s called with null authentication";
          v14 = v12;
          v15 = 12;
        }
        _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v29, v15);
        goto LABEL_39;
      }
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        a1 = 0;
LABEL_41:

        goto LABEL_42;
      }
      v29 = 136315138;
      v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
      v23 = "%s called with null self.chosenProposal";
    }
    else
    {
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        goto LABEL_10;
      v29 = 136315138;
      v30 = "-[NEIKEv2IKESA(Crypto) checkSharedKeyAuthData:usingPrimeKey:]";
      v23 = "%s called with null authenticationData";
    }
    _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&v29, 0xCu);
    goto LABEL_10;
  }
LABEL_42:

  return a1;
}

BOOL __45__NEIKEv2IKESA_Crypto__copyValidateAuthBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *WeakRetained;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  char v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  const char *v21;
  __SecKey *v22;
  __SecKey *v23;
  int v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  char v30;
  NSObject *v31;
  char *v32;
  id v33;
  const char *v34;
  void *v35;
  int v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  char *v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "remoteAuthentication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v6 = (uint64_t)WeakRetained;
    if (WeakRetained)
    {
      v7 = WeakRetained[47];
      if (!v7)
      {
        ne_log_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
          _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "%s called with null authenticationData", buf, 0xCu);
        }
        v11 = 0;
        goto LABEL_63;
      }
      v8 = v7;
      v9 = *(id *)(v6 + 368);
      v10 = v9;
      if (v9)
      {
        if ((objc_msgSend(v9, "isSecurePassword") & 1) != 0)
        {
          v11 = 1;
LABEL_62:

LABEL_63:
          goto LABEL_64;
        }
        objc_msgSend(v3, "remoteAuthentication");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[NEIKEv2Crypto isRemoteAuthenticationPacketProtocol:compatibleWithConfiguredProtocol:]((uint64_t)NEIKEv2Crypto, v10, v12);

        if ((v13 & 1) == 0)
        {
          ne_log_obj();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v3, "remoteAuthentication");
            v48 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v58 = v48;
            v59 = 2112;
            v60 = (uint64_t)v10;
            _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Auth protocols are not compatible between config %@ and packet %@", buf, 0x16u);

          }
          goto LABEL_23;
        }
        if ((*(_BYTE *)(v6 + 24) & 1) == 0)
        {
LABEL_12:
          v14 = 0;
LABEL_13:
          v15 = -[NEIKEv2IKESA createRemoteSignedOctetsUsingPrimeKey:](v6, 0);
          if (v15)
          {
            v16 = v15;
            v17 = v10;
            objc_msgSend(v3, "remoteAuthentication");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isNonStandard");

            if (v19)
            {
              objc_msgSend(v3, "remoteAuthentication");
              v20 = objc_claimAutoreleasedReturnValue();

              v17 = (id)v20;
            }
            if (objc_msgSend(v17, "isSignature"))
            {
              v22 = (__SecKey *)-[NEIKEv2SessionConfiguration copyRemoteAuthKey](v3);
              if (v22)
              {
                v23 = v22;
                v24 = +[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]((uint64_t)NEIKEv2Crypto, v8, v16, v17, v22);
                CFRelease(v23);
                if (v24)
                {
                  v11 = 1;
                  *(_BYTE *)(v6 + 18) = 1;
                  if (v14)
                    *(_BYTE *)(v6 + 19) = 1;
                  goto LABEL_60;
                }
                if (!v14)
                {
LABEL_43:
                  v11 = 0;
LABEL_60:

                  goto LABEL_61;
                }
              }
              else
              {
                ne_log_obj();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_19BD16000, v53, OS_LOG_TYPE_FAULT, "Responder configuration is missing remote public key", buf, 2u);
                }

              }
              -[NEIKEv2IKESA restorePrimeKeys]((void *)v6, v25);
              goto LABEL_43;
            }
            v56 = v16;
            v33 = objc_getProperty((id)v6, v21, 96, 1);
            -[NEIKEv2IKESAProposal prfProtocol](v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = v14;
            if (objc_msgSend(v17, "method") == 2)
            {
              v37 = (uint64_t)+[NEIKEv2IKESA copySharedSecretFromConfig:]((uint64_t)NEIKEv2IKESA, v3);
            }
            else
            {
              if (objc_msgSend(v17, "method") != 13)
              {
                v39 = 0;
                goto LABEL_54;
              }
              objc_getProperty((id)v6, v38, 232, 1);
              v37 = objc_claimAutoreleasedReturnValue();
            }
            v39 = (void *)v37;
LABEL_54:
            v45 = +[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:prfProtocol:]((uint64_t)NEIKEv2IKESA, v39, v56, v35);
            v11 = +[NEIKEv2Crypto validateCalculatedSharedKeyAuthData:remoteAuthData:]((uint64_t)NEIKEv2Crypto, v45, v8);
            if (v11)
            {
              *(_BYTE *)(v6 + 18) = 1;
              if (v36)
                *(_BYTE *)(v6 + 19) = 1;
            }
            else if (v36)
            {
              -[NEIKEv2IKESA restorePrimeKeys]((void *)v6, v46);
            }

            v16 = v56;
            goto LABEL_60;
          }
          ne_log_obj();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
            _os_log_fault_impl(&dword_19BD16000, v51, OS_LOG_TYPE_FAULT, "%s called with null remoteSignedOctets", buf, 0xCu);
          }

          -[NEIKEv2IKESA restorePrimeKeys]((void *)v6, v52);
          v16 = 0;
LABEL_23:
          v11 = 0;
LABEL_61:

          goto LABEL_62;
        }
        if (!*(_QWORD *)(v6 + 416))
        {
          if (objc_msgSend(v3, "ppkMandatory"))
          {
            ne_log_obj();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "No PPK ID received with mandatory PPK auth", buf, 2u);
            }
            goto LABEL_23;
          }
          goto LABEL_12;
        }
        if (objc_msgSend(v3, "ppkIDType") != 2
          || (objc_msgSend(v3, "ppkID"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, v26))
        {
          v27 = objc_msgSend(v3, "ppkIDType");
          objc_msgSend(v3, "ppkID");
          v16 = objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(v6 + 416) == v27)
          {
            v28 = *(id *)(v6 + 424);
            if (objc_msgSend(v28, "length") || -[NSObject length](v16, "length"))
            {
              v29 = *(id *)(v6 + 424);
              v30 = objc_msgSend(v29, "isEqualToData:", v16);

              if ((v30 & 1) == 0)
              {
                ne_log_obj();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  v32 = (char *)*(id *)(v6 + 424);
                  *(_DWORD *)buf = 138412546;
                  v58 = v32;
                  v59 = 2112;
                  v60 = (uint64_t)v16;
                  _os_log_error_impl(&dword_19BD16000, v31, OS_LOG_TYPE_ERROR, "PPK ID %@ != Expected %@", buf, 0x16u);

                }
LABEL_46:

                if (objc_msgSend(v3, "ppkMandatory"))
                {
                  ne_log_obj();
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    v41 = "Wrong PPK ID received with mandatory PPK auth";
LABEL_76:
                    _os_log_error_impl(&dword_19BD16000, v40, OS_LOG_TYPE_ERROR, v41, buf, 2u);
                    goto LABEL_69;
                  }
                  goto LABEL_69;
                }
                v42 = *(id *)(v6 + 384);

                ne_log_obj();
                v43 = objc_claimAutoreleasedReturnValue();
                v40 = v43;
                if (!v42)
                {
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    v41 = "Wrong PPK ID received and no non-PPK AUTH data received";
                    goto LABEL_76;
                  }
LABEL_69:

                  goto LABEL_23;
                }
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19BD16000, v40, OS_LOG_TYPE_DEFAULT, "Wrong PPK ID received, falling back to non-PPK AUTH data", buf, 2u);
                }

                v44 = *(id *)(v6 + 384);
                v14 = 0;
                v8 = v44;
LABEL_74:

                goto LABEL_13;
              }
            }
            else
            {

            }
            v40 = +[NEIKEv2IKESA copyPPKFromConfig:]((uint64_t)NEIKEv2IKESA, v3);
            if (v40)
            {
              if ((-[NEIKEv2IKESA generateDerivativesFromPPK:](v6, v40) & 1) != 0)
              {

                v14 = 1;
                goto LABEL_74;
              }
              ne_log_obj();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                v55 = *(const char **)(a1 + 32);
                *(_DWORD *)buf = 138412290;
                v58 = v55;
                _os_log_error_impl(&dword_19BD16000, v54, OS_LOG_TYPE_ERROR, "%@ Failed to generate PPK-derived keys", buf, 0xCu);
              }
            }
            else
            {
              ne_log_obj();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_19BD16000, v54, OS_LOG_TYPE_FAULT, "PPK use negotiated but PPK not present in configuration", buf, 2u);
              }
            }

            goto LABEL_69;
          }
          ne_log_obj();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v50 = *(const char **)(v6 + 416);
            *(_DWORD *)buf = 134218240;
            v58 = v50;
            v59 = 2048;
            v60 = v27;
            _os_log_error_impl(&dword_19BD16000, v31, OS_LOG_TYPE_ERROR, "PPK Type %zu != Expected Type %zu", buf, 0x16u);
          }
          goto LABEL_46;
        }
        ne_log_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 136315138;
        v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
        v49 = "%s called with null authCheckConfig.ppkID";
      }
      else
      {
        ne_log_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 136315138;
        v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
        v49 = "%s called with null packetAuthentication";
      }
      _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, v49, buf, 0xCu);
      goto LABEL_23;
    }
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[NEIKEv2IKESA(Crypto) copyValidateAuthBlock]_block_invoke";
      _os_log_fault_impl(&dword_19BD16000, (os_log_t)v6, OS_LOG_TYPE_FAULT, "%s called with null authCheckConfig.remoteAuthentication", buf, 0xCu);
    }
  }
  v11 = 0;
LABEL_64:

  return v11;
}

- (NSObject)createInitiatorEAPAuthenticationDataUsingPrimeKey:(NSObject *)self
{
  NSObject *v2;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  ptrdiff_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v2 = self;
  v20 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = objc_getProperty(self, a2, 448, 1);

    if (v4)
    {
      v6 = objc_getProperty(v2, v5, 96, 1);

      if (v6)
      {
        v8 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v2, a2);
        if (v8)
        {
          v9 = objc_getProperty(v2, v7, 448, 1);
          -[NEIKEv2EAP sessionKey]((uint64_t)v9);
          v10 = objc_claimAutoreleasedReturnValue();

          if (v10
            || (!(_DWORD)a2 ? (v12 = 232) : (v12 = 240),
                objc_getProperty(v2, v11, v12, 1),
                (v10 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v13 = -[NEIKEv2IKESA createAuthenticationDataForSharedSecret:octets:](v2, v10, v8);
            if (v13)
            {
              v2 = v13;
LABEL_24:

              goto LABEL_25;
            }
            ne_log_obj();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v18) = 0;
              _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "createAuthenticationDataForSharedSecret failed", (uint8_t *)&v18, 2u);
            }

LABEL_23:
            v2 = 0;
            goto LABEL_24;
          }
          ne_log_obj();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          LOWORD(v18) = 0;
          v15 = "skPi failed";
        }
        else
        {
          ne_log_obj();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          LOWORD(v18) = 0;
          v15 = "createInitiatorSignedOctetsUsingPrimeKey: failed";
        }
        _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v18, 2u);
        goto LABEL_23;
      }
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_15:
        v2 = 0;
LABEL_25:

        return v2;
      }
      v18 = 136315138;
      v19 = "-[NEIKEv2IKESA(Crypto) createInitiatorEAPAuthenticationDataUsingPrimeKey:]";
      v14 = "%s called with null self.chosenProposal";
    }
    else
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        goto LABEL_15;
      v18 = 136315138;
      v19 = "-[NEIKEv2IKESA(Crypto) createInitiatorEAPAuthenticationDataUsingPrimeKey:]";
      v14 = "%s called with null self.eapClient";
    }
    _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_15;
  }
  return v2;
}

- (NSObject)createInitiatorGSPMAuthenticationDataUsingPrimeKey:(NSObject *)self
{
  NSObject *v2;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  SEL v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  void *v26;
  NSObject *v28;
  const char *v29;
  int v30;
  const char *v31;
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = objc_getProperty(self, a2, 456, 1);

    if (v4)
    {
      v6 = objc_getProperty(v2, v5, 96, 1);

      if (v6)
      {
        v8 = -[NEIKEv2IKESA createInitiatorSignedOctetsUsingPrimeKey:]((uint64_t)v2, a2);
        if (!v8)
        {
          ne_log_obj();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "createInitiatorSignedOctets failed", (uint8_t *)&v30, 2u);
          }
          v2 = 0;
          goto LABEL_25;
        }
        v9 = BYTE1(v2[1].isa);
        v10 = objc_getProperty(v2, v7, 456, 1);
        v11 = v10;
        if ((v9 & 1) != 0)
          v12 = -[NEIKEv2GSPM createLocalSignedOctets]((uint64_t)v10);
        else
          v12 = -[NEIKEv2GSPM createRemoteSignedOctets]((uint64_t)v10);
        v14 = v12;

        if (!v14)
        {
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v30) = 0;
            _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "creatInitiatorSignedOctets(GSPM) failed", (uint8_t *)&v30, 2u);
          }
          v2 = 0;
          goto LABEL_24;
        }
        v15 = -[NSObject length](v8, "length");
        v16 = -[NSObject length](v14, "length");
        v17 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v16 + v15);
        -[NSObject appendData:](v17, "appendData:", v8);
        -[NSObject appendData:](v17, "appendData:", v14);
        v19 = objc_getProperty(v2, v18, 456, 1);
        v20 = v19;
        if (v19)
          v21 = (void *)*((_QWORD *)v19 + 1);
        else
          v21 = 0;
        v22 = v21;

        if (v22)
        {
          v24 = objc_getProperty(v2, v23, 96, 1);
          -[NEIKEv2IKESAProposal prfProtocol](v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v17, v22, v26);

          if (v2)
          {
LABEL_20:

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }
          ne_log_obj();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
LABEL_33:

            v2 = 0;
            goto LABEL_20;
          }
          LOWORD(v30) = 0;
          v29 = "createAuthenticationDataForSharedSecret failed";
        }
        else
        {
          ne_log_obj();
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            goto LABEL_33;
          LOWORD(v30) = 0;
          v29 = "GSPM.sessionKey failed";
        }
        _os_log_fault_impl(&dword_19BD16000, v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v30, 2u);
        goto LABEL_33;
      }
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        v2 = 0;
LABEL_26:

        return v2;
      }
      v30 = 136315138;
      v31 = "-[NEIKEv2IKESA(Crypto) createInitiatorGSPMAuthenticationDataUsingPrimeKey:]";
      v13 = "%s called with null self.chosenProposal";
    }
    else
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        goto LABEL_10;
      v30 = 136315138;
      v31 = "-[NEIKEv2IKESA(Crypto) createInitiatorGSPMAuthenticationDataUsingPrimeKey:]";
      v13 = "%s called with null self.gspmHandler";
    }
    _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v30, 0xCu);
    goto LABEL_10;
  }
  return v2;
}

- (NSObject)createResponderGSPMAuthenticationDataUsingPrimeKey:(_BYTE *)self
{
  _BYTE *v3;
  _BYTE *v4;
  const char *v5;
  id Property;
  id v7;
  const char *v8;
  NSObject *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  id v26;
  id v27;
  const char *v28;
  void *v29;
  NSObject *v31;
  const char *v32;
  int v33;
  const char *v34;
  uint64_t v35;

  v3 = self;
  v35 = *MEMORY[0x1E0C80C00];
  if (self)
    self = objc_getProperty(self, a2, 456, 1);
  v4 = self;

  if (!v4)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_14;
    v33 = 136315138;
    v34 = "-[NEIKEv2IKESA(Crypto) createResponderGSPMAuthenticationDataUsingPrimeKey:]";
    v14 = "%s called with null self.gspmHandler";
LABEL_35:
    _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v33, 0xCu);
    goto LABEL_14;
  }
  if (v3)
    Property = objc_getProperty(v3, v5, 96, 1);
  else
    Property = 0;
  v7 = Property;

  if (v7)
  {
    v9 = -[NEIKEv2IKESA createResponderSignedOctetsUsingPrimeKey:](v3, a2);
    if (!v9)
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v33) = 0;
        _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "createResponderSignedOctets failed", (uint8_t *)&v33, 2u);
      }
      v15 = 0;
      goto LABEL_32;
    }
    if (v3)
    {
      v10 = v3[9];
      v11 = objc_getProperty(v3, v8, 456, 1);
      v12 = v11;
      if ((v10 & 1) != 0)
      {
        v13 = -[NEIKEv2GSPM createRemoteSignedOctets]((uint64_t)v11);
LABEL_19:
        v16 = v13;

        if (!v16)
        {
          ne_log_obj();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v33) = 0;
            _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "createResponderSignedOctets(GSPM) failed", (uint8_t *)&v33, 2u);
          }
          v15 = 0;
          goto LABEL_31;
        }
        v17 = -[NSObject length](v9, "length");
        v18 = -[NSObject length](v16, "length");
        v19 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v18 + v17);
        -[NSObject appendData:](v19, "appendData:", v9);
        -[NSObject appendData:](v19, "appendData:", v16);
        if (v3)
        {
          v21 = objc_getProperty(v3, v20, 456, 1);
          v22 = v21;
          if (v21)
          {
            v23 = (void *)*((_QWORD *)v21 + 1);
            goto LABEL_23;
          }
        }
        else
        {
          v22 = 0;
        }
        v23 = 0;
LABEL_23:
        v24 = v23;

        if (v24)
        {
          if (v3)
            v26 = objc_getProperty(v3, v25, 96, 1);
          else
            v26 = 0;
          v27 = v26;
          -[NEIKEv2IKESAProposal prfProtocol](v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = +[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]((uint64_t)NEIKEv2Crypto, v19, v24, v29);

          if (v15)
            goto LABEL_27;
          ne_log_obj();
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
LABEL_39:

            v15 = 0;
LABEL_27:

LABEL_31:
LABEL_32:

            goto LABEL_33;
          }
          LOWORD(v33) = 0;
          v32 = "createAuthenticationDataForSharedSecret failed";
        }
        else
        {
          ne_log_obj();
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            goto LABEL_39;
          LOWORD(v33) = 0;
          v32 = "GSPM.sessionKey failed";
        }
        _os_log_fault_impl(&dword_19BD16000, v31, OS_LOG_TYPE_FAULT, v32, (uint8_t *)&v33, 2u);
        goto LABEL_39;
      }
    }
    else
    {
      v12 = 0;
    }
    v13 = -[NEIKEv2GSPM createLocalSignedOctets]((uint64_t)v12);
    goto LABEL_19;
  }
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v33 = 136315138;
    v34 = "-[NEIKEv2IKESA(Crypto) createResponderGSPMAuthenticationDataUsingPrimeKey:]";
    v14 = "%s called with null self.chosenProposal";
    goto LABEL_35;
  }
LABEL_14:
  v15 = 0;
LABEL_33:

  return v15;
}

- (void)createConcatenatedSPIsAndReturnError:(_BYTE *)a1
{
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v18;
  uint64_t ErrorInternal;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  -[NEIKEv2IKESA initiatorSPI](a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "value");

  v22 = v5;
  -[NEIKEv2IKESA responderSPI](a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "value");

  v21 = v8;
  if (!v5)
  {
    v18 = CFSTR("Missing initiator SPI");
LABEL_7:
    ErrorInternal = NEIKEv2CreateErrorInternal(v18, v9, v10, v11, v12, v13, v14, v15, v21);
    v20 = *(void **)a2;
    *(_QWORD *)a2 = ErrorInternal;

    return 0;
  }
  if (!v8)
  {
    v18 = CFSTR("Missing responder SPI");
    goto LABEL_7;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 16, v21, v22);
  objc_msgSend(v16, "appendBytes:length:", &v22, 8);
  objc_msgSend(v16, "appendBytes:length:", &v21, 8);
  return v16;
}

- (void)createConcatedNoncesAndReturnError:(_BYTE *)a1
{
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v16;
  uint64_t ErrorInternal;
  void *v18;
  uint64_t v19;

  -[NEIKEv2IKESA initiatorNonce](a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2IKESA responderNonce](a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    v16 = CFSTR("Missing initiator nonce");
LABEL_7:
    ErrorInternal = NEIKEv2CreateErrorInternal(v16, v7, v8, v9, v10, v11, v12, v13, v19);
    v18 = *(void **)a2;
    *(_QWORD *)a2 = ErrorInternal;

    v14 = 0;
    goto LABEL_4;
  }
  if (!objc_msgSend(v6, "length"))
  {
    v16 = CFSTR("Missing responder nonce");
    goto LABEL_7;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v4, "length"));
  objc_msgSend(v14, "appendData:", v4);
  objc_msgSend(v14, "appendData:", v6);
LABEL_4:

  return v14;
}

- (unint64_t)selectSecurePasswordMethod:(void *)a1
{
  const char *v3;
  id v4;
  id Property;
  id v6;
  void *v7;
  const char *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  unint64_t v15;
  unsigned int v16;
  NSObject *v17;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
    Property = objc_getProperty(a1, v3, 80, 1);
  else
    Property = 0;
  v6 = Property;
  objc_msgSend(v6, "supportedSecurePasswordMethods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    if (v4)
      v9 = objc_getProperty(v4, v8, 32, 1);
    else
      v9 = 0;
    v10 = v9;
    v11 = objc_msgSend(v10, "length");
    v12 = v11;
    if (!v11)
      goto LABEL_17;
    if ((v11 & 1) != 0)
    {
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 134217984;
        v20 = v12;
        _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Secure password methods data length %zu is not divisible by sizeof(uint16_t)", (uint8_t *)&v19, 0xCu);
      }
      v12 = 0;
    }
    else
    {
      v13 = objc_msgSend(v10, "bytes");
      if (v12 < 2)
      {
LABEL_12:
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v14 = (unsigned __int16 *)v13;
      v15 = v12 >> 1;
      while (1)
      {
        v16 = *v14++;
        v12 = -[NEIKEv2AuthenticationProtocol initWithSecurePassword:]([NEIKEv2AuthenticationProtocol alloc], "initWithSecurePassword:", bswap32(v16) >> 16);
        if (objc_msgSend(v7, "containsObject:", v12))
          break;

        if (!--v15)
          goto LABEL_12;
      }
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v12;
        _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_INFO, "Found supported %@ in notify", (uint8_t *)&v19, 0xCu);
      }
    }

    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (id)description
{
  __CFString *v3;
  const char *v4;
  __CFString *v5;
  id v6;
  unint64_t ikeSAUniqueIndex;
  unint64_t ikeSessionUniqueIndex;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  -[NEIKEv2IKESA initiatorSPI](self, a2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2IKESA responderSPI](self, v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    ikeSAUniqueIndex = self->_ikeSAUniqueIndex;
    ikeSessionUniqueIndex = self->_ikeSessionUniqueIndex;
  }
  else
  {
    ikeSAUniqueIndex = 0;
    ikeSessionUniqueIndex = 0;
  }
  v9 = CFSTR("0000000000000000");
  if (v3)
    v10 = v3;
  else
    v10 = CFSTR("0000000000000000");
  if (v5)
    v9 = v5;
  v11 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("IKEv2IKESA[%llu.%llu, %@-%@]"), ikeSAUniqueIndex, ikeSessionUniqueIndex, v10, v9);

  return v11;
}

- (void)dealloc
{
  const char *v3;
  NSObject *v4;
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  SEL v9;
  id v10;
  SEL v11;
  id v12;
  const char *v13;
  id v14;
  SEL v15;
  id v16;
  id Property;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_large_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self)
        Property = objc_getProperty(self, v5, 32, 1);
      else
        Property = 0;
      *(_DWORD *)buf = 138412290;
      v20 = Property;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "Deallocating ikeSA %@", buf, 0xCu);
    }

  }
  if (self)
  {
    v6 = objc_getProperty(self, v3, 464, 1);
    v8 = objc_getProperty(self, v7, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v6, v8, 0);

    v10 = objc_getProperty(self, v9, 472, 1);
    v12 = objc_getProperty(self, v11, 32, 1);
  }
  else
  {
    -[NEIKEv2Transport cancelClient:shouldInvalidate:](0, 0, 0);
    v10 = 0;
    v12 = 0;
  }
  -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v10, v12, 0);

  if (self)
  {
    v14 = objc_getProperty(self, v13, 480, 1);
    v16 = objc_getProperty(self, v15, 32, 1);
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v14, v16, 0);

  v18.receiver = self;
  v18.super_class = (Class)NEIKEv2IKESA;
  -[NEIKEv2IKESA dealloc](&v18, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_storeStrong(&self->_socketGetBlock, 0);
  objc_destroyWeak((id *)&self->_transportDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fetchedPPK, 0);
  objc_storeStrong((id *)&self->_fetchedSharedSecret, 0);
  objc_storeStrong((id *)&self->_fetchedPassword, 0);
  objc_storeStrong((id *)&self->_internalRemoteIdentifier, 0);
  objc_storeStrong((id *)&self->_receivedDestinationHash, 0);
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_tcpTransport, 0);
  objc_storeStrong((id *)&self->_natTransport, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_gspmHandler, 0);
  objc_storeStrong((id *)&self->_eapClient, 0);
  objc_storeStrong((id *)&self->_remoteAuthProtocolUsed, 0);
  objc_storeStrong((id *)&self->_localAuthProtocolUsed, 0);
  objc_storeStrong((id *)&self->_ppkIDFromPacket, 0);
  objc_storeStrong((id *)&self->_responderTrafficSelectorsFromPacket, 0);
  objc_storeStrong((id *)&self->_initiatorTrafficSelectorsFromPacket, 0);
  objc_storeStrong((id *)&self->_configMessageFromPacket, 0);
  objc_storeStrong((id *)&self->_primeAuthenticationDataFromPacket, 0);
  objc_storeStrong((id *)&self->_authenticationDataFromPacket, 0);
  objc_storeStrong((id *)&self->_authProtocolFromPacket, 0);
  objc_storeStrong((id *)&self->_childSAProposalsFromPacket, 0);
  objc_storeStrong((id *)&self->_remoteIdentifierFromPacket, 0);
  objc_storeStrong((id *)&self->_localIdentifierFromPacket, 0);
  objc_destroyWeak((id *)&self->_initiatorIdentifierPayload);
  objc_storeStrong((id *)&self->_remoteFirstMessage, 0);
  objc_storeStrong((id *)&self->_localFirstMessage, 0);
  objc_storeStrong((id *)&self->_outgoingInterfaceName, 0);
  objc_storeStrong((id *)&self->_initiatorCookie2, 0);
  objc_storeStrong((id *)&self->_responderCookie2, 0);
  objc_storeStrong((id *)&self->_cookie, 0);
  objc_storeStrong((id *)&self->_localCertificateKey, 0);
  objc_storeStrong((id *)&self->_localCertificateIdentity, 0);
  objc_storeStrong((id *)&self->_skPrPrime, 0);
  objc_storeStrong((id *)&self->_skPr, 0);
  objc_storeStrong((id *)&self->_skPiPrime, 0);
  objc_storeStrong((id *)&self->_skPi, 0);
  objc_storeStrong((id *)&self->_skDPrime, 0);
  objc_storeStrong((id *)&self->_skD, 0);
  objc_storeStrong((id *)&self->_securityContext, 0);
  objc_storeStrong((id *)&self->_intAuthR, 0);
  objc_storeStrong((id *)&self->_intAuthI, 0);
  objc_storeStrong((id *)&self->_followupSharedSecrets, 0);
  objc_storeStrong((id *)&self->_additionalKENotify, 0);
  objc_storeStrong((id *)&self->_primarySharedSecret, 0);
  objc_storeStrong((id *)&self->_currentKEHandler, 0);
  objc_storeStrong((id *)&self->_remoteKeyExchangeData, 0);
  objc_storeStrong((id *)&self->_remotePreferredKEMProtocol, 0);
  objc_storeStrong((id *)&self->_remoteNonce, 0);
  objc_storeStrong((id *)&self->_localNonce, 0);
  objc_storeStrong((id *)&self->_remoteSignHashSet, 0);
  objc_storeStrong((id *)&self->_remoteSecurePasswordMethod, 0);
  objc_storeStrong((id *)&self->_chosenProposal, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_remoteSPI, 0);
  objc_storeStrong((id *)&self->_localSPI, 0);
}

- (_BYTE)initiatorSPI
{
  ptrdiff_t v2;

  if (a1)
  {
    if ((a1[9] & 1) != 0)
      v2 = 32;
    else
      v2 = 40;
    a1 = objc_getProperty(a1, a2, v2, 1);
  }
  return a1;
}

- (_BYTE)responderSPI
{
  ptrdiff_t v2;

  if (a1)
  {
    if ((a1[9] & 1) != 0)
      v2 = 40;
    else
      v2 = 32;
    a1 = objc_getProperty(a1, a2, v2, 1);
  }
  return a1;
}

- (NSObject)initIKESAWithConfiguration:(void *)a3 sessionConfiguration:(void *)a4 queue:(void *)a5 initialTransport:(void *)a6 transportDelegate:(void *)a7 socketGetBlock:(void *)a8 packetDelegate:(void *)a9 configurationDelegate:(objc_class *)a10 ikeSessionUniqueIndex:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  unint64_t v27;
  SEL v28;
  unsigned int v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  unsigned __int8 *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  unsigned __int8 *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  void *v45;
  SEL v46;
  SEL v47;
  void *v48;
  void *v49;
  void *v50;
  SEL v51;
  SEL v52;
  const char *v53;
  unsigned int v54;
  SEL v55;
  void *v56;
  SEL v57;
  SEL v58;
  NEIKEv2IKESPI *v59;
  SEL v60;
  const char *v61;
  id v62;
  void *v63;
  id v64;
  char v65;
  const char *v66;
  char v67;
  void *Property;
  const char *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  NSObject *v77;
  const char *v78;
  const char *v79;
  void *v80;
  SEL v81;
  void *v82;
  SEL v83;
  NEIKEv2Transport *v84;
  unint64_t transportType;
  NSObject *v86;
  NEIKEv2Transport *v87;
  ptrdiff_t v88;
  unint64_t v89;
  SEL v90;
  id v91;
  SEL v92;
  id v93;
  SEL v94;
  id v95;
  const char *v96;
  NSObject *v97;
  NEIKEv2Transport *v98;
  ptrdiff_t v99;
  NSObject *v100;
  const char *v101;
  id v102;
  SEL v103;
  id v104;
  SEL v105;
  SEL v106;
  id v107;
  SEL v108;
  NSObject *v109;
  const char *v110;
  id v111;
  SEL v112;
  id v113;
  const char *v114;
  const char *v115;
  id v117;
  id v118;
  NSObject *v119;
  id v120;
  unsigned int v121;
  void *v122;
  void *v123;
  id v124;
  id obj;
  NEIKEv2Transport *newValue;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  objc_super v131;
  uint8_t buf[4];
  const char *v133;
  __int16 v134;
  id v135;
  __int16 v136;
  id v137;
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v18 = a3;
  v19 = a4;
  newValue = a5;
  obj = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!a1)
  {
    v25 = 0;
    goto LABEL_90;
  }
  if (!v17)
  {
    v118 = v21;
    ne_log_obj();
    v119 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:soc"
             "ketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
      _os_log_fault_impl(&dword_19BD16000, v119, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }

    v25 = 0;
    v21 = v118;
    goto LABEL_89;
  }
  v131.receiver = a1;
  v131.super_class = (Class)NEIKEv2IKESA;
  v23 = -[NSObject init](&v131, sel_init);
  if (!v23)
  {
    ne_log_obj();
    a1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    v25 = 0;
    goto LABEL_89;
  }
  v25 = v23;
  objc_setProperty_atomic(v23, v24, v19, 536);
  do
    v27 = __ldxr(&sNEIKEv2IKESAIndex);
  while (__stxr(v27 + 1, &sNEIKEv2IKESAIndex));
  v25[73].isa = (Class)v27;
  v25[72].isa = a10;
  objc_setProperty_atomic(v25, v26, v17, 80);
  objc_setProperty_atomic(v25, v28, v18, 88);
  v124 = v22;
  if ((objc_msgSend(v17, "randomizeLocalPort") & 1) != 0)
  {
    v29 = 0;
    if (!v21)
      goto LABEL_14;
  }
  else
  {
    if (objc_msgSend(v17, "forceUDPEncapsulation"))
      v29 = 4500;
    else
      v29 = 500;
    if (!v21)
    {
LABEL_14:
      v31 = v21;
      objc_msgSend(v17, "remoteEndpoint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        ne_log_obj();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          _os_log_fault_impl(&dword_19BD16000, v77, OS_LOG_TYPE_FAULT, "%s called with null configuration.remoteEndpoint", buf, 0xCu);
        }
        goto LABEL_59;
      }
      objc_msgSend(v17, "remoteEndpoint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v17, "remoteEndpoint");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (unsigned __int8 *)objc_msgSend(v35, "address");

        if (!v36)
        {
          ne_log_obj();
          v77 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
            goto LABEL_59;
          *(_DWORD *)buf = 136315138;
          v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          v78 = "%s called with null remoteAddress";
          goto LABEL_58;
        }
        if (*v36 <= 0xFu)
        {
          ne_log_obj();
          v77 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
            goto LABEL_59;
          *(_DWORD *)buf = 136315138;
          v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate"
                 ":socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
          v78 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
          goto LABEL_58;
        }
        objc_msgSend(v17, "localEndpoint");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
LABEL_25:
          v48 = (void *)MEMORY[0x1E0CCEC58];
          objc_msgSend(v17, "remoteEndpoint");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "endpointWithAddress:", objc_msgSend(v49, "address"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(v25, v51, v50, 72);

          if (!*(_WORD *)(objc_msgSend(objc_getProperty(v25, v52, 72, 1), "address") + 2))
          {
            if (objc_msgSend(v17, "forceUDPEncapsulation"))
              v54 = 4500;
            else
              v54 = 500;
            *(_WORD *)(objc_msgSend(objc_getProperty(v25, v53, 72, 1), "address") + 2) = __rev16(v54);
          }
          v21 = v31;
          goto LABEL_31;
        }
        objc_msgSend(v17, "localEndpoint");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v39 = objc_opt_isKindOfClass();

        if ((v39 & 1) != 0)
        {
          objc_msgSend(v17, "localEndpoint");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (unsigned __int8 *)objc_msgSend(v40, "address");

          if (!v41)
          {
            ne_log_obj();
            v77 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
              goto LABEL_59;
            *(_DWORD *)buf = 136315138;
            v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelega"
                   "te:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
            v78 = "%s called with null localAddress";
            goto LABEL_58;
          }
          if (*v41 > 0xFu)
          {
            v42 = __rev16(*((unsigned __int16 *)v41 + 1));
            if (*((_WORD *)v41 + 1))
              v29 = v42;
            v43 = (void *)MEMORY[0x1E0CCEC58];
            objc_msgSend(v17, "localEndpoint");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "endpointWithAddress:", objc_msgSend(v44, "address"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_atomic(v25, v46, v45, 64);

            *(_WORD *)(objc_msgSend(objc_getProperty(v25, v47, 64, 1), "address") + 2) = __rev16(v29);
            goto LABEL_25;
          }
          ne_log_obj();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelega"
                   "te:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
            v78 = "%s called with null (localAddress->sa_len >= sizeof(struct sockaddr_in))";
            goto LABEL_58;
          }
LABEL_59:

          a1 = v25;
          v25 = 0;
          v21 = v31;
          goto LABEL_60;
        }
        ne_log_obj();
        v77 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
          goto LABEL_59;
        *(_DWORD *)buf = 136315138;
        v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:s"
               "ocketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
        v78 = "%s called with null [configuration.localEndpoint isKindOfClass:[NWAddressEndpoint class]]";
      }
      else
      {
        ne_log_obj();
        v77 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
          goto LABEL_59;
        *(_DWORD *)buf = 136315138;
        v133 = "-[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:s"
               "ocketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:]";
        v78 = "%s called with null [configuration.remoteEndpoint isKindOfClass:[NWAddressEndpoint class]]";
      }
LABEL_58:
      _os_log_fault_impl(&dword_19BD16000, v77, OS_LOG_TYPE_FAULT, v78, buf, 0xCu);
      goto LABEL_59;
    }
  }
  objc_msgSend(v17, "remoteEndpoint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    goto LABEL_14;
LABEL_31:
  objc_storeWeak((id *)&v25[68].isa, obj);
  objc_setProperty_atomic_copy(v25, v55, v20, 552);
  objc_storeWeak((id *)&v25[70].isa, v21);
  v123 = v21;
  v22 = v124;
  if (v21)
    BYTE1(v25[3].isa) = 1;
  objc_storeWeak((id *)&v25[71].isa, v124);
  objc_msgSend(v17, "outgoingInterfaceName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v25, v57, v56, 304);

  BYTE1(v25[1].isa) = objc_msgSend(v17, "serverMode") ^ 1;
  v25[6].isa = (Class)3;
  objc_setProperty_atomic(v25, v58, 0, 56);
  v59 = objc_alloc_init(NEIKEv2IKESPI);
  objc_setProperty_atomic(v25, v60, v59, 32);

  v122 = v18;
  if ((BYTE1(v25[3].isa) & 1) != 0 && (BYTE1(v25[1].isa) & 1) != 0)
  {
    v62 = objc_getProperty(v25, v61, 72, 1);
    if (!v62 || (v63 = v62, v64 = objc_getProperty(v25, v61, 64, 1), v63, !v64))
    {
      v121 = v29;
      v65 = 1;
      v67 = 1;
      if ((objc_msgSend(objc_getProperty(v25, v61, 80, 1), "requestChildlessSA") & 1) == 0)
      {
        v129 = 0u;
        v130 = 0u;
        v127 = 0u;
        v128 = 0u;
        objc_msgSend(v122, "configurationRequest");
        Property = (void *)objc_claimAutoreleasedReturnValue();
        v70 = Property;
        if (Property)
          Property = objc_getProperty(Property, v69, 16, 1);
        v120 = v19;
        v71 = Property;

        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v138, 16);
        if (v72)
        {
          v73 = v72;
          v65 = 0;
          v67 = 0;
          v74 = *(_QWORD *)v128;
          do
          {
            for (i = 0; i != v73; ++i)
            {
              if (*(_QWORD *)v128 != v74)
                objc_enumerationMutation(v71);
              v76 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
              if (objc_msgSend(v76, "attributeType") == 25958)
                v65 = 1;
              else
                v67 |= objc_msgSend(v76, "attributeType") == 25959;
            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v138, 16);
          }
          while (v73);
        }
        else
        {
          v65 = 0;
          v67 = 0;
        }

        v19 = v120;
        v22 = v124;
      }
      if (!objc_getProperty(v25, v66, 64, 1) && (v65 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::"), CFSTR("500"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v25, v81, v80, 64);

      }
      v29 = v121;
      if (((objc_getProperty(v25, v79, 72, 1) == 0) & v67) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithHostname:port:", CFSTR("::1"), CFSTR("500"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v25, v83, v82, 72);

      }
    }
  }
  v84 = newValue;
  if (newValue)
  {
    transportType = newValue->_transportType;
    if (transportType - 2 < 2)
    {
      BYTE5(v25[1].isa) = 1;
      v86 = v25;
      v87 = newValue;
      v88 = 480;
    }
    else if (transportType == 1)
    {
      BYTE4(v25[1].isa) = 1;
      v86 = v25;
      v87 = newValue;
      v88 = 472;
    }
    else
    {
      if (transportType)
      {
LABEL_84:
        v102 = objc_getProperty(v25, v61, 32, 1);
        -[NEIKEv2Transport addClient:delegate:](v84, v102, obj);
        v104 = objc_getProperty(v84, v103, 24, 1);
        objc_setProperty_atomic(v25, v105, v104, 72);

        newValue = v84;
        v107 = objc_getProperty(v84, v106, 16, 1);
        objc_setProperty_atomic(v25, v108, v107, 64);

        ne_log_large_obj();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          v111 = objc_getProperty(v25, v110, 72, 1);
          v113 = objc_getProperty(v25, v112, 80, 1);
          *(_DWORD *)buf = 138412802;
          v133 = (const char *)v25;
          v134 = 2112;
          v135 = v111;
          v136 = 2112;
          v137 = v113;
          _os_log_impl(&dword_19BD16000, v109, OS_LOG_TYPE_INFO, "Created %@ to %@ with configuration %@", buf, 0x20u);
        }

        ne_log_large_obj();
        a1 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(a1, OS_LOG_TYPE_INFO))
        {
          v115 = (const char *)objc_getProperty(v25, v114, 88, 1);
          *(_DWORD *)buf = 138412290;
          v133 = v115;
          _os_log_impl(&dword_19BD16000, a1, OS_LOG_TYPE_INFO, "Session configuration %@", buf, 0xCu);
        }
        v18 = v122;
        v21 = v123;
        goto LABEL_89;
      }
      v86 = v25;
      v87 = newValue;
      v88 = 464;
    }
    objc_setProperty_atomic(v86, v61, v87, v88);
    goto LABEL_84;
  }
  v89 = objc_msgSend(v17, "forceUDPEncapsulation");
  v91 = objc_getProperty(v25, v90, 72, 1);
  v93 = objc_getProperty(v25, v92, 64, 1);
  v95 = objc_getProperty(v25, v94, 304, 1);
  v84 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, v89, v91, v93, v29, v95, v19, v20, v123);

  if (v84)
  {
    if (objc_msgSend(v17, "forceUDPEncapsulation"))
    {
      BYTE4(v25[1].isa) = 1;
      v97 = v25;
      v98 = v84;
      v99 = 472;
    }
    else
    {
      v97 = v25;
      v98 = v84;
      v99 = 464;
    }
    objc_setProperty_atomic(v97, v96, v98, v99);
    v22 = v124;
    goto LABEL_84;
  }
  ne_log_obj();
  v100 = objc_claimAutoreleasedReturnValue();
  v18 = v122;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
  {
    v117 = objc_getProperty(v25, v101, 72, 1);
    *(_DWORD *)buf = 138412546;
    v133 = (const char *)v25;
    v134 = 2112;
    v135 = v117;
    _os_log_error_impl(&dword_19BD16000, v100, OS_LOG_TYPE_ERROR, "%@ failed to create transport for %@", buf, 0x16u);
  }

  newValue = 0;
  a1 = v25;
  v25 = 0;
  v21 = v123;
LABEL_60:
  v22 = v124;
LABEL_89:

LABEL_90:
  return v25;
}

- (id)preferredKEMProtocol
{
  const char *v3;
  id v4;
  id v5;
  const char *v6;
  void *v7;
  id Property;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;

  if (objc_getProperty(a1, a2, 144, 1))
  {
    v4 = objc_getProperty(a1, v3, 144, 1);
  }
  else
  {
    v5 = objc_getProperty(a1, v3, 96, 1);
    if (!v5
      || (v7 = v5,
          Property = objc_getProperty(a1, v6, 96, 1),
          -[NEIKEv2IKESAProposal kemProtocol](Property, v9),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v7,
          !v10))
    {
      objc_msgSend(objc_getProperty(a1, v6, 80, 1), "proposals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESAProposal kemProtocol](v15, v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
    v11 = objc_getProperty(a1, v6, 96, 1);
    -[NEIKEv2IKESAProposal kemProtocol](v11, v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v4;
  return v13;
}

- (NSObject)copyForRekey
{
  id WeakRetained;
  id v3;
  NEIKEv2IKESA *v4;
  SEL v5;
  id v6;
  SEL v7;
  id v8;
  SEL v9;
  id v10;
  SEL v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  id Property;
  SEL v17;
  SEL v18;
  id v19;
  SEL v20;
  SEL v21;
  id v22;
  SEL v23;
  SEL v24;
  id v25;
  SEL v26;
  id v27;
  SEL v28;
  id v29;
  SEL v30;
  id v31;
  SEL v32;
  id v33;
  SEL v34;
  id v35;
  SEL v36;
  id v37;
  SEL v38;
  SEL v39;
  id v40;
  SEL v41;
  SEL v42;
  id v43;
  SEL v44;
  SEL v45;
  id v46;
  SEL v47;
  SEL v48;
  id v49;
  SEL v50;
  SEL v51;
  id v52;
  SEL v53;
  SEL v54;
  id v55;
  SEL v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  uint8_t buf[4];
  NSObject *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
  v3 = objc_loadWeakRetained((id *)(a1 + 544));
  v4 = [NEIKEv2IKESA alloc];
  v6 = objc_getProperty((id)a1, v5, 80, 1);
  v8 = objc_getProperty((id)a1, v7, 88, 1);
  v10 = objc_getProperty((id)a1, v9, 536, 1);
  v12 = objc_getProperty((id)a1, v11, 552, 1);
  v13 = objc_loadWeakRetained((id *)(a1 + 568));
  v14 = -[NEIKEv2IKESA initIKESAWithConfiguration:sessionConfiguration:queue:initialTransport:transportDelegate:socketGetBlock:packetDelegate:configurationDelegate:ikeSessionUniqueIndex:](&v4->super, v6, v8, v10, 0, v3, v12, WeakRetained, v13, *(objc_class **)(a1 + 576));

  if (v14)
  {
    Property = objc_getProperty((id)a1, v15, 464, 1);
    objc_setProperty_atomic(v14, v17, Property, 464);
    v19 = objc_getProperty((id)a1, v18, 472, 1);
    objc_setProperty_atomic(v14, v20, v19, 472);
    v22 = objc_getProperty((id)a1, v21, 480, 1);
    objc_setProperty_atomic(v14, v23, v22, 480);
    v25 = objc_getProperty(v14, v24, 464, 1);
    v27 = objc_getProperty(v14, v26, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v25, v27, v3);

    v29 = objc_getProperty(v14, v28, 472, 1);
    v31 = objc_getProperty(v14, v30, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v29, v31, v3);

    v33 = objc_getProperty(v14, v32, 480, 1);
    v35 = objc_getProperty(v14, v34, 32, 1);
    -[NEIKEv2Transport addClient:delegate:](v33, v35, v3);

    v37 = objc_getProperty((id)a1, v36, 304, 1);
    objc_setProperty_atomic(v14, v38, v37, 304);
    v40 = objc_getProperty((id)a1, v39, 64, 1);
    objc_setProperty_atomic(v14, v41, v40, 64);
    v43 = objc_getProperty((id)a1, v42, 72, 1);
    objc_setProperty_atomic(v14, v44, v43, 72);
    objc_storeWeak((id *)&v14[70].isa, WeakRetained);
    BYTE1(v14[3].isa) = *(_BYTE *)(a1 + 25) & 1;
    BYTE4(v14[1].isa) = *(_BYTE *)(a1 + 12) & 1;
    HIBYTE(v14[1].isa) = *(_BYTE *)(a1 + 15) & 1;
    BYTE6(v14[1].isa) = *(_BYTE *)(a1 + 14) & 1;
    v46 = objc_getProperty((id)a1, v45, 488, 1);
    objc_setProperty_atomic(v14, v47, v46, 488);
    v49 = objc_getProperty((id)a1, v48, 96, 1);
    objc_setProperty_atomic(v14, v50, v49, 96);
    BYTE3(v14[1].isa) = *(_BYTE *)(a1 + 11) & 1;
    v52 = objc_getProperty((id)a1, v51, 144, 1);
    objc_setProperty_atomic(v14, v53, v52, 144);
    v55 = objc_getProperty((id)a1, v54, 496, 1);
    objc_setProperty_atomic(v14, v56, v55, 496);
    ne_log_large_obj();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v14;
      v63 = 2112;
      v64 = a1;
      _os_log_impl(&dword_19BD16000, v57, OS_LOG_TYPE_INFO, "Created %@ for rekey from %@", buf, 0x16u);
    }

    v58 = v14;
  }
  else
  {
    ne_log_obj();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v59, OS_LOG_TYPE_ERROR, "[[NEIKEv2IKESA alloc] initIKESAWithConfiguration]", buf, 2u);
    }

  }
  return v14;
}

- (void)detachTransportWithShouldInvalidate:(void *)a1
{
  NSObject *v4;
  SEL v5;
  id v6;
  SEL v7;
  id Property;
  SEL v9;
  id v10;
  SEL v11;
  id v12;
  SEL v13;
  id v14;
  SEL v15;
  id v16;
  SEL v17;
  SEL v18;
  SEL v19;
  SEL v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = a1;
      _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating transports for %@", (uint8_t *)&v21, 0xCu);
    }

    v6 = objc_getProperty(a1, v5, 464, 1);
    Property = objc_getProperty(a1, v7, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v6, Property, a2);

    v10 = objc_getProperty(a1, v9, 472, 1);
    v12 = objc_getProperty(a1, v11, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v10, v12, a2);

    v14 = objc_getProperty(a1, v13, 480, 1);
    v16 = objc_getProperty(a1, v15, 32, 1);
    -[NEIKEv2Transport cancelClient:shouldInvalidate:]((uint64_t)v14, v16, a2);

    objc_setProperty_atomic(a1, v17, 0, 464);
    objc_setProperty_atomic(a1, v18, 0, 472);
    objc_setProperty_atomic(a1, v19, 0, 480);
    objc_setProperty_atomic(a1, v20, 0, 64);
  }
}

- (void)clearAuthenticationSecrets
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;
  SEL v12;
  SEL v13;
  SEL v14;

  if (a1)
  {
    objc_setProperty_atomic(a1, a2, 0, 192);
    objc_setProperty_atomic(a1, v3, 0, 200);
    objc_setProperty_atomic(a1, v4, 0, 232);
    objc_setProperty_atomic(a1, v5, 0, 248);
    objc_setProperty_atomic(a1, v6, 0, 224);
    objc_setProperty_atomic(a1, v7, 0, 240);
    objc_setProperty_atomic(a1, v8, 0, 256);
    objc_setProperty_atomic(a1, v9, 0, 264);
    objc_setProperty_atomic(a1, v10, 0, 512);
    objc_setProperty_atomic(a1, v11, 0, 520);
    objc_setProperty_atomic(a1, v12, 0, 528);
    objc_setProperty_atomic(a1, v13, 0, 448);
    objc_setProperty_atomic(a1, v14, 0, 456);
  }
}

- (void)setState:(void *)a3 error:
{
  const char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t Property;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  SEL v12;
  __CFString *SessionStateString;
  __CFString *v14;
  SEL v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  __CFString *v19;
  SEL v20;
  SEL v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a1)
    goto LABEL_18;
  v7 = *(_QWORD *)(a1 + 48);
  Property = (unint64_t)objc_getProperty((id)a1, v5, 56, 1);
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 != a2)
  {
    if (v6 | Property)
    {
      if (v10)
      {
        SessionStateString = NEIKEv2CreateSessionStateString(*(_QWORD *)(a1 + 48));
        v14 = NEIKEv2CreateSessionStateString(a2);
        v22 = 138413314;
        v23 = a1;
        v24 = 2112;
        v25 = SessionStateString;
        v26 = 2112;
        v27 = (unint64_t)v14;
        v28 = 2112;
        v29 = (unint64_t)objc_getProperty((id)a1, v15, 56, 1);
        v30 = 2112;
        v31 = v6;
        v16 = "%@ state %@ -> %@ error %@ -> %@";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);

      }
    }
    else if (v10)
    {
      SessionStateString = NEIKEv2CreateSessionStateString(*(_QWORD *)(a1 + 48));
      v14 = NEIKEv2CreateSessionStateString(a2);
      v22 = 138412802;
      v23 = a1;
      v24 = 2112;
      v25 = SessionStateString;
      v26 = 2112;
      v27 = (unint64_t)v14;
      v16 = "%@ state %@ -> %@";
      v17 = v9;
      v18 = 32;
      goto LABEL_16;
    }

    *(_QWORD *)(a1 + 48) = a2;
    objc_setProperty_atomic((id)a1, v21, (id)v6, 56);
    *(_BYTE *)(a1 + 8) = 1;
    goto LABEL_18;
  }
  if (!v6 || Property)
  {
    if (v10)
    {
      v19 = NEIKEv2CreateSessionStateString(a2);
      v22 = 138413058;
      v23 = a1;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = (unint64_t)objc_getProperty((id)a1, v20, 56, 1);
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@ not changing state %@ nor error %@ -> %@", (uint8_t *)&v22, 0x2Au);

    }
  }
  else
  {
    if (v10)
    {
      v11 = NEIKEv2CreateSessionStateString(a2);
      v22 = 138412802;
      v23 = a1;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "%@ not changing state %@ but new error %@", (uint8_t *)&v22, 0x20u);

    }
    objc_setProperty_atomic((id)a1, v12, (id)v6, 56);
  }
LABEL_18:

}

- (void)assignRemoteSPI:(void *)a1
{
  SEL v3;
  SEL v4;
  const char *v5;
  id v6;
  SEL v7;
  id Property;
  const char *v9;
  id v10;
  SEL v11;
  id v12;
  const char *v13;
  id v14;
  SEL v15;
  id v16;
  id v17;

  v17 = a2;
  objc_setProperty_atomic(a1, v3, v17, 40);
  if (objc_getProperty(a1, v4, 464, 1))
  {
    v6 = objc_getProperty(a1, v5, 464, 1);
    Property = objc_getProperty(a1, v7, 32, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v6, v17, Property);

  }
  if (objc_getProperty(a1, v5, 472, 1))
  {
    v10 = objc_getProperty(a1, v9, 472, 1);
    v12 = objc_getProperty(a1, v11, 32, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v10, v17, v12);

  }
  if (objc_getProperty(a1, v9, 480, 1))
  {
    v14 = objc_getProperty(a1, v13, 480, 1);
    v16 = objc_getProperty(a1, v15, 32, 1);
    -[NEIKEv2Transport setRemoteSPI:forClient:](v14, v17, v16);

  }
}

- (void)switchToNATTraversalPorts
{
  unsigned __int8 *v3;
  const char *v4;
  unsigned __int8 *v5;
  const char *v6;
  unsigned int v7;
  unsigned __int8 *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  id WeakRetained;
  const char *v16;
  id v17;
  NSObject *v18;
  id v19;
  SEL v20;
  id v21;
  SEL v22;
  id Property;
  NEIKEv2Transport *v24;
  SEL v25;
  SEL v26;
  id v27;
  SEL v28;
  id v29;
  SEL v30;
  id v31;
  const char *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 13) & 1) == 0)
  {
    *(_BYTE *)(a1 + 12) = 1;
    v3 = (unsigned __int8 *)objc_msgSend(objc_getProperty((id)a1, a2, 72, 1), "address");
    if (v3)
    {
      v5 = v3;
      if (*v3 <= 0xFu)
      {
        ne_log_obj();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 136315138;
        v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
        v32 = "%s called with null (remoteAddress->sa_len >= sizeof(struct sockaddr_in))";
      }
      else
      {
        if (objc_msgSend(objc_getProperty((id)a1, v4, 80, 1), "randomizeLocalPort"))
          v7 = 0;
        else
          v7 = 4500;
        v8 = (unsigned __int8 *)objc_msgSend(objc_getProperty((id)a1, v6, 64, 1), "address");
        if (v8)
        {
          if (*v8 > 0xFu)
          {
            objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v5);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (*(__int16 *)(objc_msgSend(v10, "address") + 2) == -3071)
              *(_WORD *)(objc_msgSend(v10, "address") + 2) = -27631;
            v11 = *(__int16 *)(-[NSObject address](v9, "address") + 2);
            v12 = -[NSObject address](v9, "address");
            if (v11 == -3071)
              *(_WORD *)(v12 + 2) = -27631;
            else
              v7 = bswap32(*(unsigned __int16 *)(v12 + 2)) >> 16;
            if (!objc_getProperty((id)a1, v13, 472, 1))
            {
              WeakRetained = objc_loadWeakRetained((id *)(a1 + 560));
              v17 = objc_loadWeakRetained((id *)(a1 + 544));
              if ((*(_BYTE *)(a1 + 25) & 1) != 0 && !WeakRetained)
              {
                ne_log_obj();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Cannot create transport for packet delegate, delegate no longer valid", buf, 2u);
                }

                goto LABEL_22;
              }
              v19 = objc_getProperty((id)a1, v16, 304, 1);
              v21 = objc_getProperty((id)a1, v20, 536, 1);
              Property = objc_getProperty((id)a1, v22, 552, 1);
              v24 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 1uLL, v10, v9, v7, v19, v21, Property, WeakRetained);

              objc_setProperty_atomic((id)a1, v25, v24, 472);
              v27 = objc_getProperty((id)a1, v26, 472, 1);
              v29 = objc_getProperty((id)a1, v28, 32, 1);
              -[NEIKEv2Transport addClient:delegate:](v27, v29, v17);

              v31 = objc_getProperty((id)a1, v30, 472, 1);
              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __41__NEIKEv2IKESA_switchToNATTraversalPorts__block_invoke;
              v33[3] = &unk_1E3CC41F0;
              v33[4] = a1;
              -[NEIKEv2Transport waitForTransport:]((uint64_t)v31, v33);

            }
            objc_getProperty((id)a1, v14, 472, 1);
LABEL_22:

LABEL_23:
            return;
          }
          ne_log_obj();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          *(_DWORD *)buf = 136315138;
          v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
          v32 = "%s called with null (localAddress->sa_len >= sizeof(struct sockaddr_in))";
        }
        else
        {
          ne_log_obj();
          v9 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            goto LABEL_23;
          *(_DWORD *)buf = 136315138;
          v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
          v32 = "%s called with null localAddress";
        }
      }
    }
    else
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 136315138;
      v35 = "-[NEIKEv2IKESA switchToNATTraversalPorts]";
      v32 = "%s called with null remoteAddress";
    }
    _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, v32, buf, 0xCu);
    goto LABEL_23;
  }
}

void __41__NEIKEv2IKESA_switchToNATTraversalPorts__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  const char *v5;
  id v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  char *v11;
  void *v12;
  char *v13;

  Property = *(id *)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 472, 1);
    if (Property)
      Property = objc_getProperty(Property, v4, 24, 1);
  }
  v6 = Property;
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_setProperty_atomic(v7, v5, v6, 72);

  v9 = *(id *)(a1 + 32);
  if (v9)
  {
    v9 = objc_getProperty(v9, v8, 472, 1);
    if (v9)
      v9 = objc_getProperty(v9, v10, 16, 1);
  }
  v11 = (char *)v9;
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    v13 = v11;
    objc_setProperty_atomic(v12, v11, v11, 64);
    v11 = v13;
  }

}

void __40__NEIKEv2IKESA_switchToTCPEncapsulation__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  const char *v5;
  id v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  char *v11;
  void *v12;
  char *v13;

  Property = *(id *)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 480, 1);
    if (Property)
      Property = objc_getProperty(Property, v4, 24, 1);
  }
  v6 = Property;
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_setProperty_atomic(v7, v5, v6, 72);

  v9 = *(id *)(a1 + 32);
  if (v9)
  {
    v9 = objc_getProperty(v9, v8, 480, 1);
    if (v9)
      v9 = objc_getProperty(v9, v10, 16, 1);
  }
  v11 = (char *)v9;
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    v13 = v11;
    objc_setProperty_atomic(v12, v11, v11, 64);
    v11 = v13;
  }

}

- (_BYTE)hasTransport
{
  ptrdiff_t v2;

  if (result)
  {
    if ((result[13] & 1) != 0)
    {
      v2 = 480;
    }
    else if ((result[12] & 1) != 0)
    {
      v2 = 472;
    }
    else
    {
      v2 = 464;
    }
    return (_BYTE *)(objc_getProperty(result, a2, v2, 1) != 0);
  }
  return result;
}

- (void)resyncAddress
{
  id WeakRetained;
  const char *v4;
  void *v5;
  id v6;
  SEL v7;
  SEL v8;
  id Property;
  id v10;
  SEL v11;
  id self;

  if (a1)
  {
    self = -[NEIKEv2IKESA copyTransport](a1, a2);
    WeakRetained = objc_loadWeakRetained(a1 + 70);

    v5 = self;
    if (!WeakRetained)
    {
      if (self)
      {
        v6 = objc_getProperty(self, v4, 16, 1);
        objc_setProperty_atomic(a1, v7, v6, 64);

        Property = objc_getProperty(self, v8, 24, 1);
      }
      else
      {
        objc_setProperty_atomic(a1, v4, 0, 64);
        Property = 0;
      }
      v10 = Property;
      objc_setProperty_atomic(a1, v11, v10, 72);

      v5 = self;
    }

  }
}

- (id)copyTransport
{
  const char *v3;
  id v4;
  const char *v5;
  id v6;
  NSObject *v7;
  uint8_t *v8;
  id Property;
  const char *v10;
  id WeakRetained;
  const char *v12;
  int v14;
  SEL v15;
  id v16;
  SEL v17;
  id v18;
  SEL v19;
  id v20;
  SEL v21;
  id v22;
  SEL v23;
  id v24;
  unsigned int v25;
  NEIKEv2Transport *v26;
  SEL v27;
  SEL v28;
  id v29;
  SEL v30;
  id v31;
  int v32;
  SEL v33;
  id v34;
  SEL v35;
  id v36;
  SEL v37;
  id v38;
  SEL v39;
  id v40;
  SEL v41;
  id v42;
  unsigned int v43;
  NEIKEv2Transport *v44;
  SEL v45;
  SEL v46;
  id v47;
  SEL v48;
  id v49;
  __int16 v50;
  uint8_t buf[2];

  if (!self)
    return 0;
  if ((*((_BYTE *)self + 13) & 1) != 0)
  {
    Property = objc_getProperty(self, a2, 480, 1);
  }
  else if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    if (!objc_getProperty(self, a2, 472, 1))
    {
      WeakRetained = objc_loadWeakRetained(self + 70);
      v6 = objc_loadWeakRetained(self + 68);
      if ((*((_BYTE *)self + 25) & 1) != 0 && !WeakRetained)
      {
        ne_log_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v8 = buf;
          goto LABEL_28;
        }
LABEL_14:

        return 0;
      }
      v32 = objc_msgSend(objc_getProperty(self, v12, 80, 1), "randomizeLocalPort");
      v34 = objc_getProperty(self, v33, 72, 1);
      v36 = objc_getProperty(self, v35, 64, 1);
      v38 = objc_getProperty(self, v37, 304, 1);
      v40 = objc_getProperty(self, v39, 536, 1);
      v42 = objc_getProperty(self, v41, 552, 1);
      if (v32)
        v43 = 0;
      else
        v43 = 4500;
      v44 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 1uLL, v34, v36, v43, v38, v40, v42, WeakRetained);

      objc_setProperty_atomic(self, v45, v44, 472);
      v47 = objc_getProperty(self, v46, 472, 1);
      v49 = objc_getProperty(self, v48, 32, 1);
      -[NEIKEv2Transport addClient:delegate:](v47, v49, v6);

    }
    Property = objc_getProperty(self, v10, 472, 1);
  }
  else
  {
    if (!objc_getProperty(self, a2, 464, 1))
    {
      v4 = objc_loadWeakRetained(self + 70);
      v6 = objc_loadWeakRetained(self + 68);
      if ((*((_BYTE *)self + 25) & 1) != 0 && !v4)
      {
        ne_log_obj();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v50 = 0;
          v8 = (uint8_t *)&v50;
LABEL_28:
          _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "Cannot create transport for packet delegate, delegate no longer valid", v8, 2u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      v14 = objc_msgSend(objc_getProperty(self, v5, 80, 1), "randomizeLocalPort");
      v16 = objc_getProperty(self, v15, 72, 1);
      v18 = objc_getProperty(self, v17, 64, 1);
      v20 = objc_getProperty(self, v19, 304, 1);
      v22 = objc_getProperty(self, v21, 536, 1);
      v24 = objc_getProperty(self, v23, 552, 1);
      if (v14)
        v25 = 0;
      else
        v25 = 500;
      v26 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 0, v16, v18, v25, v20, v22, v24, v4);

      objc_setProperty_atomic(self, v27, v26, 464);
      v29 = objc_getProperty(self, v28, 464, 1);
      v31 = objc_getProperty(self, v30, 32, 1);
      -[NEIKEv2Transport addClient:delegate:](v29, v31, v6);

    }
    Property = objc_getProperty(self, v3, 464, 1);
  }
  return Property;
}

- (id)initiatorFirstMessage
{
  ptrdiff_t v2;

  if ((a1[9] & 1) != 0)
    v2 = 312;
  else
    v2 = 320;
  return objc_getProperty(a1, a2, v2, 1);
}

- (id)responderFirstMessage
{
  ptrdiff_t v2;

  if ((a1[9] & 1) != 0)
    v2 = 320;
  else
    v2 = 312;
  return objc_getProperty(a1, a2, v2, 1);
}

- (id)sharedSecret
{
  const char *v3;
  const char *v4;
  id Property;
  void *v6;
  SEL v7;
  id v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_getProperty(a1, a2, 88, 1))
  {
    if (!objc_getProperty(a1, v3, 520, 1))
    {
      Property = objc_getProperty(a1, v4, 88, 1);
      v6 = +[NEIKEv2IKESA copySharedSecretFromConfig:]((uint64_t)NEIKEv2IKESA, Property);
      objc_setProperty_atomic(a1, v7, v6, 520);

    }
    v8 = objc_getProperty(a1, v4, 520, 1);
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[NEIKEv2IKESA sharedSecret]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }
  return v8;
}

+ (void)copySharedSecretFromConfig:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "+[NEIKEv2IKESA copySharedSecretFromConfig:]";
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "%s called with null sessionConfiguration", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
LABEL_9:

    goto LABEL_11;
  }
  v4 = (const char *)v3;
  objc_msgSend(v2, "sharedSecretReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    objc_msgSend(v2, "sharedSecret");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v7 = 0;
      goto LABEL_11;
    }
    v10 = MEMORY[0x1E0C99D50];
    objc_msgSend(v2, "sharedSecret");
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = +[NSData sensitiveDataWithData:](v10, v11);
    goto LABEL_9;
  }
  objc_msgSend(v2, "sharedSecretReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)NEIKEv2Crypto, v6);

  if (!v7)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve shared secret by reference", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_11:

  return v7;
}

- (id)ppk
{
  void *v2;
  const char *v3;
  const char *v4;
  id Property;
  void *v6;
  SEL v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    if (objc_getProperty(a1, a2, 88, 1))
    {
      if (!objc_getProperty(v2, v3, 528, 1))
      {
        Property = objc_getProperty(v2, v4, 88, 1);
        v6 = +[NEIKEv2IKESA copyPPKFromConfig:]((uint64_t)NEIKEv2IKESA, Property);
        objc_setProperty_atomic(v2, v7, v6, 528);

      }
      a1 = objc_getProperty(v2, v4, 528, 1);
    }
    else
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v10 = 136315138;
        v11 = "-[NEIKEv2IKESA ppk]";
        _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v10, 0xCu);
      }

      a1 = 0;
    }
  }
  return a1;
}

+ (void)copyPPKFromConfig:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "+[NEIKEv2IKESA copyPPKFromConfig:]";
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "%s called with null sessionConfiguration", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
LABEL_9:

    goto LABEL_11;
  }
  v4 = (const char *)v3;
  objc_msgSend(v2, "ppkReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    objc_msgSend(v2, "ppk");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v7 = 0;
      goto LABEL_11;
    }
    v10 = MEMORY[0x1E0C99D50];
    objc_msgSend(v2, "ppk");
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = +[NSData sensitiveDataWithData:](v10, v11);
    goto LABEL_9;
  }
  objc_msgSend(v2, "ppkReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[NEIKEv2Crypto copyDataFromPersistentReference:]((uint64_t)NEIKEv2Crypto, v6);

  if (!v7)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to retrieve PPK by reference", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_11:

  return v7;
}

- (NEIKEv2AddressIdentifier)localIdentifier
{
  const char *v3;
  void *v4;
  const char *v5;
  NEIKEv2AddressIdentifier *v6;
  NSObject *v7;
  NEIKEv2AddressIdentifier *v9;
  SEL v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_getProperty(a1, a2, 88, 1))
  {
    objc_msgSend(objc_getProperty(a1, v3, 88, 1), "localIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(objc_getProperty(a1, v5, 88, 1), "localIdentifier");
      v6 = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = [NEIKEv2AddressIdentifier alloc];
      v6 = -[NEIKEv2AddressIdentifier initWithAddress:](v9, "initWithAddress:", objc_getProperty(a1, v10, 64, 1));
    }
    return v6;
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[NEIKEv2IKESA localIdentifier]";
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v11, 0xCu);
    }

    return (NEIKEv2AddressIdentifier *)0;
  }
}

- (id)remoteIdentifier
{
  const char *v3;
  const char *v4;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!objc_getProperty(a1, a2, 88, 1))
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315138;
      v10 = "-[NEIKEv2IKESA remoteIdentifier]";
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.sessionConfiguration", (uint8_t *)&v9, 0xCu);
    }

    return 0;
  }
  if (objc_getProperty(a1, v3, 504, 1))
    return objc_getProperty(a1, v4, 504, 1);
  objc_msgSend(objc_getProperty(a1, v4, 88, 1), "remoteIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  objc_msgSend(objc_getProperty(a1, v8, 88, 1), "remoteIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_BYTE)copyInitiatorIdentifier
{
  if (result)
  {
    if ((result[9] & 1) != 0)
      -[NEIKEv2IKESA localIdentifier](result, a2);
    else
      -[NEIKEv2IKESA remoteIdentifier](result, a2);
    return (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (_BYTE)copyResponderIdentifier
{
  if (result)
  {
    if ((result[9] & 1) != 0)
      -[NEIKEv2IKESA remoteIdentifier](result, a2);
    else
      -[NEIKEv2IKESA localIdentifier](result, a2);
    return (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (id)initiatorNonce
{
  ptrdiff_t v2;

  if ((a1[9] & 1) != 0)
    v2 = 128;
  else
    v2 = 136;
  return objc_getProperty(a1, a2, v2, 1);
}

- (id)responderNonce
{
  ptrdiff_t v2;

  if ((a1[9] & 1) != 0)
    v2 = 136;
  else
    v2 = 128;
  return objc_getProperty(a1, a2, v2, 1);
}

- (uint64_t)maximumPacketSize
{
  void *v2;
  const char *v3;

  if (result)
  {
    v2 = (void *)result;
    result = objc_msgSend(objc_getProperty((id)result, a2, 80, 1), "maximumPacketSize");
    if (!(_DWORD)result)
    {
      if (objc_msgSend(objc_getProperty(v2, v3, 72, 1), "addressFamily") == 30)
        return 1280;
      else
        return 576;
    }
  }
  return result;
}

- (_BYTE)headerOverhead
{
  _BYTE *v2;
  const char *v3;
  int v4;
  int v5;

  if (result)
  {
    v2 = result;
    result = (_BYTE *)objc_msgSend(objc_getProperty(result, a2, 80, 1), "headerOverhead");
    if ((_DWORD)result == -1)
    {
      if ((v2[12] & 1) != 0)
        v4 = 12;
      else
        v4 = 8;
      if (objc_msgSend(objc_getProperty(v2, v3, 72, 1), "addressFamily") == 30)
        v5 = 40;
      else
        v5 = 20;
      return (_BYTE *)(v5 + v4);
    }
  }
  return result;
}

- (id)authenticationProtocol
{
  void *v2;
  void *v3;
  const char *v4;
  _QWORD *Property;
  void *v6;

  if (a1)
  {
    v2 = a1;
    objc_msgSend(objc_getProperty(a1, a2, 88, 1), "authenticationProtocol");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(objc_getProperty(v2, v4, 88, 1), "authenticationProtocol");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      Property = objc_getProperty(v2, v4, 96, 1);
      if (Property)
        v6 = (void *)Property[16];
      else
        v6 = 0;
      a1 = v6;
    }
  }
  return a1;
}

- (id)remoteAuthentication
{
  void *v2;
  void *v3;
  const char *v4;
  _QWORD *Property;
  void *v6;

  if (a1)
  {
    v2 = a1;
    objc_msgSend(objc_getProperty(a1, a2, 88, 1), "remoteAuthentication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(objc_getProperty(v2, v4, 88, 1), "remoteAuthentication");
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      Property = objc_getProperty(v2, v4, 96, 1);
      if (Property)
        v6 = (void *)Property[16];
      else
        v6 = 0;
      a1 = v6;
    }
  }
  return a1;
}

- (uint64_t)usesEAPOnlyAuthentication
{
  void *v3;
  const char *v4;
  uint64_t v5;
  id Property;
  char v7;

  -[NEIKEv2IKESA remoteAuthentication](a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "method"))
  {

    return 0;
  }
  v5 = 1;
  Property = objc_getProperty(a1, v4, 96, 1);
  v7 = -[NEIKEv2IKESAProposal hasEAPMethods](Property);

  if ((v7 & 1) == 0)
    return 0;
  return v5;
}

- (void)setAuthProtocolFromPacket:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 368), a2);
}

- (void)setPrimeAuthenticationDataFromPacket:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 384), a2);
}

- (void)setPpkIDFromPacket:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 424), a2);
}

- (void)setLocalAuthProtocolUsed:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 432), a2);
}

- (void)setRemoteAuthProtocolUsed:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 440), a2);
}

@end

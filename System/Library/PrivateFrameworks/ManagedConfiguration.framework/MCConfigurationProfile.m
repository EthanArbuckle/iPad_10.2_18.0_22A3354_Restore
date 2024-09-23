@implementation MCConfigurationProfile

- (void)_addObjectsOfClass:(Class)a3 fromArray:(id)a4 toArray:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  if (objc_msgSend(v10, "count") && objc_msgSend(v10, "count"))
  {
    v8 = 0;
    do
    {
      if (v8 >= objc_msgSend(v10, "count"))
        break;
      objc_msgSend(v10, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (Class)objc_opt_class() == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        ++v8;
      }
      else
      {
        objc_msgSend(v7, "addObject:", v9);
        objc_msgSend(v10, "removeObjectAtIndex:", v8);
      }

    }
    while (objc_msgSend(v10, "count"));
  }

}

- (id)_sortPayloads:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[10];

  v23[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (!_sortPayloads__classSortOrder)
    {
      v23[0] = objc_opt_class();
      v23[1] = objc_opt_class();
      v23[2] = objc_opt_class();
      v23[3] = objc_opt_class();
      v23[4] = objc_opt_class();
      v23[5] = objc_opt_class();
      v23[6] = objc_opt_class();
      v23[7] = objc_opt_class();
      v23[8] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 9);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)_sortPayloads__classSortOrder;
      _sortPayloads__classSortOrder = v5;

    }
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (id)_sortPayloads__classSortOrder;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          -[MCConfigurationProfile _addObjectsOfClass:fromArray:toArray:](self, "_addObjectsOfClass:fromArray:toArray:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13++), v7, v8, (_QWORD)v18);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    while (objc_msgSend(v7, "count", (_QWORD)v18))
    {
      objc_msgSend(v7, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();

      -[MCConfigurationProfile _addObjectsOfClass:fromArray:toArray:](self, "_addObjectsOfClass:fromArray:toArray:", v15, v7, v8);
    }
    v16 = (id)objc_msgSend(v8, "copy");

  }
  else
  {
    v16 = v4;
  }

  return v16;
}

- (void)_sortPayloads
{
  NSArray *v3;
  NSArray *payloads;

  -[MCConfigurationProfile _sortPayloads:](self, "_sortPayloads:", self->_payloads);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  payloads = self->_payloads;
  self->_payloads = v3;

}

- (id)payloads
{
  return self->_payloads;
}

- (id)managedPayloads
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_payloads);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfile identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dependentsOfParent:inDomain:", v5, CFSTR("ManagingProfileToManagedProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "payloads");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  -[MCConfigurationProfile _sortPayloads:](self, "_sortPayloads:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)payloadWithUUID:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_payloads;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "UUID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_subjectSummaryFromCertificate:(__SecCertificate *)a3
{
  if (a3)
    return (id)(id)SecCertificateCopySubjectSummary(a3);
  else
    return 0;
}

- (__SecCertificate)copyCertificateFromPayloadWithUUID:(id)a3
{
  void *v3;
  __SecCertificate *v4;

  -[MCConfigurationProfile payloadWithUUID:](self, "payloadWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (__SecCertificate *)objc_msgSend(v3, "copyCertificate");
  else
    v4 = 0;

  return v4;
}

- (id)subjectSummaryFromCertificatePayloadWithUUID:(id)a3
{
  __SecCertificate *v4;
  __SecCertificate *v5;
  void *v6;

  v4 = -[MCConfigurationProfile copyCertificateFromPayloadWithUUID:](self, "copyCertificateFromPayloadWithUUID:", a3);
  if (v4)
  {
    v5 = v4;
    -[MCConfigurationProfile _subjectSummaryFromCertificate:](self, "_subjectSummaryFromCertificate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (__SecCertificate)copyCertificateWithPersistentID:(id)a3
{
  id v4;
  NSArray *v5;
  __SecCertificate *v6;
  uint64_t v7;
  __SecCertificate *i;
  void *v9;
  id v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_payloads;
  v6 = (__SecCertificate *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (__SecCertificate *)((char *)i + 1))
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "certificatePersistentID", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToData:", v4);

          if ((v12 & 1) != 0)
          {
            v6 = (__SecCertificate *)objc_msgSend(v10, "copyCertificate");

            goto LABEL_13;
          }

        }
      }
      v6 = (__SecCertificate *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (id)subjectSummaryFromCertificateWithPersistentID:(id)a3
{
  __SecCertificate *v4;
  __SecCertificate *v5;
  void *v6;

  v4 = -[MCConfigurationProfile copyCertificateWithPersistentID:](self, "copyCertificateWithPersistentID:", a3);
  if (v4)
  {
    v5 = v4;
    -[MCConfigurationProfile _subjectSummaryFromCertificate:](self, "_subjectSummaryFromCertificate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MCConfigurationProfile)initWithDictionary:(id)a3 options:(id)a4 signerCerts:(id)a5 allowEmptyPayload:(BOOL)a6 outError:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  MCConfigurationProfile *v14;
  MCConfigurationProfile *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *payloads;
  uint64_t v29;
  id v30;
  NSNumber *isCloudProfileNum;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSNumber *isCloudLockedNum;
  void *v38;
  id v39;
  uint64_t v40;
  MCConfigurationProfile *v41;
  NSArray *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  MCProfileServiceProfile *OTAProfile;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  MCConfigurationProfile *v81;
  void *v83;
  void *v84;
  NSArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  MCConfigurationProfile *v110;
  NSArray *v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  int v115;
  int v116;
  uint64_t v117;
  uint64_t j;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  NSObject *v129;
  MCConfigurationProfile *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t k;
  void *v139;
  void *v140;
  uint64_t v141;
  NSArray *managedPayloads;
  NSArray *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  id *p_isa;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t m;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  id v242;
  id v243;
  id v244;
  id v245;
  id v246;
  uint64_t v247;
  void *v248;
  uint64_t v249;
  id *v250;
  MCConfigurationProfile *v251;
  int v252;
  id v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  id v274;
  id v275;
  id v276;
  id v277;
  id v278;
  objc_super v279;
  _BYTE v280[128];
  _BYTE v281[128];
  uint8_t v282[128];
  uint8_t buf[4];
  MCConfigurationProfile *v284;
  __int16 v285;
  id v286;
  _BYTE v287[128];
  _BYTE v288[128];
  uint64_t v289;

  v8 = a6;
  v289 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v279.receiver = self;
  v279.super_class = (Class)MCConfigurationProfile;
  v14 = -[MCProfile initWithDictionary:signerCerts:allowEmptyPayload:outError:](&v279, sel_initWithDictionary_signerCerts_allowEmptyPayload_outError_, v12, a5, v8, a7);
  v15 = v14;
  if (!v14)
  {
LABEL_39:
    v81 = v15;
    goto LABEL_40;
  }
  if (v13)
  {
    -[MCProfile installOptions](v14, "installOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      -[MCProfile setInstallOptions:](v15, "setInstallOptions:", v13);
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("PayloadContent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("PayloadContent"));
  v18 = -[MCProfile isStub](v15, "isStub");
  v19 = objc_msgSend(v17, "count");
  v250 = a7;
  v251 = v15;
  if (v18)
  {
    if (v19)
    {
      +[MCPayload payloadsFromArray:isStub:profile:outError:](MCPayload, "payloadsFromArray:isStub:profile:outError:", v17, 1, v15, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      payloads = v15->_payloads;
      v15->_payloads = (NSArray *)v27;

    }
    v278 = 0;
    objc_msgSend(v12, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IsCloudProfile"), 0, &v278);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v278;
    isCloudProfileNum = v15->_isCloudProfileNum;
    v15->_isCloudProfileNum = (NSNumber *)v29;

    if (!v30)
    {
      v15->_isCloudProfile = -[NSNumber BOOLValue](v15->_isCloudProfileNum, "BOOLValue");
      if (!v15->_isCloudProfileNum)
      {
        -[MCProfile installOptions](v15, "installOptions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          -[MCProfile installOptions](v15, "installOptions");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("isCloudProfile"));
          v34 = v17;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v15->_isCloudProfile = objc_msgSend(v35, "BOOLValue");

          v17 = v34;
        }
      }
      v277 = 0;
      objc_msgSend(v12, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IsCloudLocked"), 0, &v277);
      v36 = objc_claimAutoreleasedReturnValue();
      v30 = v277;
      isCloudLockedNum = v15->_isCloudLockedNum;
      v15->_isCloudLockedNum = (NSNumber *)v36;

      if (!v30)
      {
        v15->_isCloudLocked = -[NSNumber BOOLValue](v15->_isCloudLockedNum, "BOOLValue");
        if (!v15->_isCloudLockedNum)
        {
          -[MCProfile installOptions](v15, "installOptions");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            -[MCProfile installOptions](v15, "installOptions");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("isCloudLocked"));
            v57 = v17;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v251->_isCloudLocked = objc_msgSend(v58, "BOOLValue");

            v17 = v57;
          }
        }
        v276 = 0;
        +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v12, CFSTR("OTAProfileStub"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v276);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v276;
        v30 = v60;
        if (v59)
        {
          v61 = v17;
          v62 = (void *)objc_msgSend(v59, "MCMutableDeepCopy");
          v275 = v30;
          +[MCProfile profileWithDictionary:options:signerCerts:fileName:allowEmptyPayload:outError:](MCProfile, "profileWithDictionary:options:signerCerts:fileName:allowEmptyPayload:outError:", v62, v13, 0, 0, 1, &v275);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v275;

          OTAProfile = v251->_OTAProfile;
          v251->_OTAProfile = (MCProfileServiceProfile *)v63;
          v17 = v61;

          v30 = v64;
          if (!v64)
            goto LABEL_58;
        }
        else if (!v60)
        {
          goto LABEL_58;
        }
      }
    }

    v15 = v251;
    goto LABEL_34;
  }
  if (!v19 && !v8)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("EMPTY_PAYLOAD_ERROR_DESCRIPTION"), v20, v21, v22, v23, v24, v25, v26, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1005, v39, CFSTR("MCFatalError"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v274 = 0;
  +[MCPayload payloadsFromArray:isStub:profile:outError:](MCPayload, "payloadsFromArray:isStub:profile:outError:", v17, 0, v15, &v274);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v15;
  v39 = v274;
  v42 = v15->_payloads;
  v15->_payloads = (NSArray *)v40;

  v248 = v17;
  if (v39)
  {
    v43 = v13;
    v30 = v39;
    v44 = (void *)MEMORY[0x1E0CB35C8];
    -[MCProfile profileDescription](v41, "profileDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v12;
    if (v45)
      -[MCProfile profileDescription](v41, "profileDescription");
    else
      -[MCProfile identifier](v41, "identifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    MCErrorArray(CFSTR("ERROR_PROFILE_MALFORMED_P_ID"), v67, v68, v69, v70, v71, v72, v73, v66);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (id)objc_msgSend(v44, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v74, v30, CFSTR("MCFatalError"));

    v12 = v46;
    v13 = v43;
    goto LABEL_31;
  }
  if (!-[NSArray count](v15->_payloads, "count") && !v8)
  {
    v54 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("EMPTY_PAYLOAD_ERROR_DESCRIPTION"), v47, v48, v49, v50, v51, v52, v53, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1005, v45, CFSTR("MCFatalError"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

    goto LABEL_32;
  }
  v242 = v12;
  v245 = v13;
  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v270 = 0u;
  v271 = 0u;
  v272 = 0u;
  v273 = 0u;
  v85 = v15->_payloads;
  v86 = -[NSArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v270, v288, 16);
  if (!v86)
  {
    v30 = 0;
    goto LABEL_57;
  }
  v87 = v86;
  v88 = *(_QWORD *)v271;
  while (2)
  {
    for (i = 0; i != v87; ++i)
    {
      if (*(_QWORD *)v271 != v88)
        objc_enumerationMutation(v85);
      v90 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * i);
      objc_msgSend(v90, "UUID");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v83, "containsObject:", v91))
      {
        v107 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(CFSTR("ERROR_PROFILE_PAYLOAD_NONUNIQUE_UUIDS"), v92, v93, v94, v95, v96, v97, v98, 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1007, v99, CFSTR("MCFatalError"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

        v17 = v248;
        goto LABEL_57;
      }
      objc_msgSend(v83, "addObject:", v91);
      objc_msgSend(v90, "identifier");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v84, "containsObject:", v99))
      {
        v108 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(CFSTR("ERROR_PROFILE_PAYLOAD_NONUNIQUE_IDENTIFIERS_P_ID"), v100, v101, v102, v103, v104, v105, v106, v99);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1008, v109, CFSTR("MCFatalError"));
        v30 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_56;
      }
      objc_msgSend(v84, "addObject:", v99);

    }
    v87 = -[NSArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v270, v288, 16);
    v30 = 0;
    v17 = v248;
    if (v87)
      continue;
    break;
  }
LABEL_57:

  v12 = v242;
  v13 = v245;
  if (v30)
    goto LABEL_33;
LABEL_58:
  v110 = v251;
  -[MCConfigurationProfile _sortPayloads](v251, "_sortPayloads");
  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  v111 = v251->_payloads;
  v112 = -[NSArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v266, v287, 16);
  v246 = v13;
  v248 = v17;
  if (!v112)
  {

    -[MCProfile isStub](v251, "isStub");
    goto LABEL_88;
  }
  v113 = v112;
  v241 = 0;
  v243 = v12;
  v114 = 0;
  v115 = 0;
  v252 = 0;
  v116 = 0;
  v249 = 0;
  v247 = 0;
  v117 = *(_QWORD *)v267;
  do
  {
    for (j = 0; j != v113; ++j)
    {
      if (*(_QWORD *)v267 != v117)
        objc_enumerationMutation(v111);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        ++v114;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ++v115;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            ++v116;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              ++v252;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                ++HIDWORD(v249);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  LODWORD(v249) = v249 + 1;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    ++HIDWORD(v247);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      LODWORD(v247) = v247 + 1;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        ++HIDWORD(v241);
                      }
                      else
                      {
                        objc_opt_class();
                        LODWORD(v241) = v241 + (objc_opt_isKindOfClass() & 1);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    v113 = -[NSArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v266, v287, 16);
  }
  while (v113);

  if (v114 >= 2)
  {
    v119 = (void *)MEMORY[0x1E0CB35C8];
    -[MCProfile friendlyName](v251, "friendlyName");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_MDM_P_ID"), v120, v121, v122, v123, v124, v125, v126, v39);
    goto LABEL_86;
  }
  v13 = v246;
  if (!-[MCProfile isStub](v251, "isStub") && v114 == 1 && -[MCProfile isLocked](v251, "isLocked"))
  {
    v157 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("ERROR_PROFILE_MDM_AND_LOCKED"), v150, v151, v152, v153, v154, v155, v156, 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v39, CFSTR("MCFatalError"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v158, "MCCopyAsPrimaryError");

    goto LABEL_135;
  }
  if (v115 < 2)
  {
    if (v116 >= 2)
    {
      v159 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_CHAPERONE_P_ID"), v182, v183, v184, v185, v186, v187, v188, v39);
      goto LABEL_134;
    }
    v12 = v243;
    if (v252 >= 2)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_GLOBAL_PROXY_P_ID"), v192, v193, v194, v195, v196, v197, v198, v39);
LABEL_152:
      v134 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v134, CFSTR("MCFatalError"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_139;
    }
    if (SHIDWORD(v249) >= 2)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_SINGLE_APP_P_ID"), v199, v200, v201, v202, v203, v204, v205, v39);
      goto LABEL_152;
    }
    if ((int)v249 >= 2)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_HOME_SCREEN_LAYOUT_P_ID"), v206, v207, v208, v209, v210, v211, v212, v39);
      goto LABEL_152;
    }
    if (SHIDWORD(v247) >= 2)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_NOTIFICATION_SETTINGS_P_ID"), v213, v214, v215, v216, v217, v218, v219, v39);
      goto LABEL_152;
    }
    if ((int)v247 >= 2)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_SHARED_DEVICE_CONFIGURATIONS_P_ID"), v220, v221, v222, v223, v224, v225, v226, v39);
      goto LABEL_152;
    }
    if (SHIDWORD(v241) >= 2)
    {
      v119 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_CONFERENCE_ROOM_DISPLAY_P_ID"), v227, v228, v229, v230, v231, v232, v233, v39);
LABEL_86:
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v127, CFSTR("MCFatalError"));
      v30 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v243;
      v13 = v246;
      goto LABEL_32;
    }
    v12 = v243;
    v13 = v246;
    v110 = v251;
    if ((int)v241 >= 2)
    {
      v191 = (void *)MEMORY[0x1E0CB35C8];
      -[MCProfile friendlyName](v251, "friendlyName");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_AIRPLAY_SECURITY_P_ID"), v234, v235, v236, v237, v238, v239, v240, v39);
      goto LABEL_152;
    }
LABEL_88:
    if (objc_msgSend(v12, "count"))
    {
      v128 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v129 = v128;
        -[MCProfile friendlyName](v110, "friendlyName");
        v130 = (MCConfigurationProfile *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v284 = v130;
        v285 = 2114;
        v286 = v12;
        _os_log_impl(&dword_19ECC4000, v129, OS_LOG_TYPE_INFO, "Profile “%{public}@” has entries that are being ignored. They are:%{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v110->_payloads);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfile identifier](v110, "identifier");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "dependentsOfParent:inDomain:", v132, CFSTR("ManagingProfileToManagedProfile"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    v264 = 0u;
    v265 = 0u;
    v262 = 0u;
    v263 = 0u;
    v134 = v133;
    v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v262, v282, 16);
    if (v135)
    {
      v136 = v135;
      v137 = *(_QWORD *)v263;
      do
      {
        for (k = 0; k != v136; ++k)
        {
          if (*(_QWORD *)v263 != v137)
            objc_enumerationMutation(v134);
          +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v262 + 1) + 8 * k));
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "payloads");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObjectsFromArray:", v140);

        }
        v136 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v262, v282, 16);
      }
      while (v136);
    }

    -[MCConfigurationProfile _sortPayloads:](v251, "_sortPayloads:", v39);
    v141 = objc_claimAutoreleasedReturnValue();
    managedPayloads = v251->_managedPayloads;
    v251->_managedPayloads = (NSArray *)v141;

    v260 = 0u;
    v261 = 0u;
    v258 = 0u;
    v259 = 0u;
    v143 = v251->_payloads;
    v144 = -[NSArray countByEnumeratingWithState:objects:count:](v143, "countByEnumeratingWithState:objects:count:", &v258, v281, 16);
    if (v144)
    {
      v145 = v144;
      v146 = *(_QWORD *)v259;
LABEL_100:
      v147 = 0;
      while (1)
      {
        if (*(_QWORD *)v259 != v146)
          objc_enumerationMutation(v143);
        v148 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * v147);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v145 == ++v147)
        {
          v145 = -[NSArray countByEnumeratingWithState:objects:count:](v143, "countByEnumeratingWithState:objects:count:", &v258, v281, 16);
          if (v145)
            goto LABEL_100;
          goto LABEL_106;
        }
      }
      p_isa = (id *)&v251->super.super.isa;
      v251->_isMDMProfile = 1;
      v167 = objc_msgSend(v148, "isUserEnrollment");

      if ((v167 & 1) != 0)
        goto LABEL_118;
    }
    else
    {
LABEL_106:

      p_isa = (id *)&v251->super.super.isa;
    }
    objc_msgSend(p_isa, "installOptions");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "objectForKeyedSubscript:", CFSTR("isRMUserEnrollment"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v169, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(p_isa, "installOptions");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "objectForKeyedSubscript:", CFSTR("isInstalledByMDM"));
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v171, "BOOLValue"))
      {

        v30 = 0;
LABEL_138:
        v13 = v246;

LABEL_139:
        goto LABEL_32;
      }
      v172 = objc_msgSend(MEMORY[0x1E0D44770], "isUserEnrollmentDisregardingIdentityPresence");

      p_isa = (id *)&v251->super.super.isa;
      if (!v172)
      {
        v30 = 0;
        v13 = v246;
        goto LABEL_139;
      }
    }
LABEL_118:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(p_isa[22], "count"));
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = 0u;
    v255 = 0u;
    v256 = 0u;
    v257 = 0u;
    v173 = p_isa[22];
    v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v254, v280, 16);
    if (v174)
    {
      v175 = v174;
      v244 = v12;
      v176 = *(_QWORD *)v255;
      while (2)
      {
        for (m = 0; m != v175; ++m)
        {
          if (*(_QWORD *)v255 != v176)
            objc_enumerationMutation(v173);
          v178 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * m);
          v253 = 0;
          objc_msgSend(v178, "filterForUserEnrollmentOutError:", &v253);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = v253;
          if (v180)
          {
            v30 = v180;

            goto LABEL_131;
          }
          if (v179)
            v181 = v179;
          else
            v181 = v178;
          objc_msgSend(v168, "addObject:", v181);

        }
        v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v254, v280, 16);
        if (v175)
          continue;
        break;
      }
      v30 = 0;
LABEL_131:
      v12 = v244;
    }
    else
    {
      v30 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v168);
    v190 = objc_claimAutoreleasedReturnValue();
    v169 = v251->_payloads;
    v251->_payloads = (NSArray *)v190;
    goto LABEL_138;
  }
  v159 = (void *)MEMORY[0x1E0CB35C8];
  -[MCProfile friendlyName](v251, "friendlyName");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  MCErrorArray(CFSTR("ERROR_PROFILE_TOO_MANY_APN_P_ID"), v160, v161, v162, v163, v164, v165, v166, v39);
LABEL_134:
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v189, CFSTR("MCFatalError"));
  v30 = (id)objc_claimAutoreleasedReturnValue();

LABEL_135:
  v12 = v243;
LABEL_32:
  v17 = v248;
LABEL_33:

  a7 = v250;
  v15 = v251;
  if (!v30)
    goto LABEL_39;
LABEL_34:
  v76 = (void *)objc_msgSend(v30, "MCCopyAsPrimaryError");
  -[MCProfile malformedProfileErrorWithError:](v15, "malformedProfileErrorWithError:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    *a7 = objc_retainAutorelease(v77);
  v78 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v79 = v78;
    objc_msgSend(v77, "MCVerboseDescription");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v284 = v15;
    v285 = 2114;
    v286 = v80;
    _os_log_impl(&dword_19ECC4000, v79, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse profile: %{public}@", buf, 0x16u);

  }
  v81 = 0;
LABEL_40:

  return v81;
}

- (BOOL)isManagedByMDM
{
  objc_super v3;

  if (self->_isMDMProfile)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)MCConfigurationProfile;
  return -[MCProfile isManagedByMDM](&v3, sel_isManagedByMDM);
}

- (BOOL)isManagedByProfileService
{
  return self->_OTAProfile != 0;
}

- (id)installationWarningsIncludeUnsignedProfileWarning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_payloads;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "installationWarnings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14.receiver = self;
  v14.super_class = (Class)MCConfigurationProfile;
  -[MCProfile installationWarningsIncludeUnsignedProfileWarning:](&v14, sel_installationWarningsIncludeUnsignedProfileWarning_, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MCConfigurationProfile;
  -[MCProfile description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSArray count](self->_payloads, "count"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("\nPayloads:\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_payloads;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "description");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  if (self->_isCloudProfile)
    objc_msgSend(v4, "appendFormat:", CFSTR("Is could profile: Yes"));
  if (self->_isCloudLocked)
    objc_msgSend(v4, "appendFormat:", CFSTR("Is cloud locked : Yes"));
  if (self->_OTAProfile)
    objc_msgSend(v4, "appendFormat:", CFSTR("OTA profile: %@\n"), self->_OTAProfile);
  return v4;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MCConfigurationProfile;
  -[MCProfile verboseDescription](&v16, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSArray count](self->_payloads, "count"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("\nPayloads:\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_payloads;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "verboseDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  if (self->_isCloudProfile)
    objc_msgSend(v4, "appendFormat:", CFSTR("Is could profile: Yes"));
  if (self->_isCloudLocked)
    objc_msgSend(v4, "appendFormat:", CFSTR("Is cloud locked : Yes"));
  if (self->_OTAProfile)
    objc_msgSend(v4, "appendFormat:", CFSTR("OTA profile: %@\n"), self->_OTAProfile);
  return v4;
}

- (id)serializedDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  MCProfileServiceProfile *OTAProfile;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)MCConfigurationProfile;
  -[MCProfile serializedDictionary](&v19, sel_serializedDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSArray count](self->_payloads, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_payloads, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_payloads;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "serializedDictionary", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Payloads"));
  }
  if (self->_isCloudProfile)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E42127D8, CFSTR("Cloud Profile"));
  if (self->_isCloudLocked)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E42127D8, CFSTR("Cloud Locked"));
  OTAProfile = self->_OTAProfile;
  if (OTAProfile)
  {
    -[MCProfileServiceProfile serializedDictionary](OTAProfile, "serializedDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("OTA Profile"));

  }
  return v4;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  MCProfileServiceProfile *OTAProfile;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)MCConfigurationProfile;
  -[MCProfile stubDictionary](&v20, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Configuration"), CFSTR("PayloadType"));
  -[MCConfigurationProfile isCloudProfileNum](self, "isCloudProfileNum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("IsCloudProfile"));

  -[MCConfigurationProfile isCloudLockedNum](self, "isCloudLockedNum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("IsCloudLocked"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_payloads, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_payloads;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "stubDictionary", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("PayloadContent"));
  OTAProfile = self->_OTAProfile;
  if (OTAProfile)
  {
    -[MCProfileServiceProfile stubDictionary](OTAProfile, "stubDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("OTAProfileStub"));

  }
  return v3;
}

- (id)_localizedPayloadSummaryByType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v7 = v5;
  if (!v6)
    goto LABEL_18;
  v8 = v6;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v5);
      v13 = objc_opt_class();
      if (v13 != objc_opt_class())
      {
        if (v10 == (void *)v13)
        {
          ++v9;
        }
        else
        {
          if (v10 && v9)
          {
            objc_msgSend(v10, "localizedDescriptionForPayloadCount:", v9, v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

          }
          v9 = 1;
          v10 = (void *)v13;
        }
      }
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v8);

  if (v10 && v9)
  {
    objc_msgSend(v10, "localizedDescriptionForPayloadCount:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);
LABEL_18:

  }
  return v4;
}

- (id)localizedPayloadSummaryByType
{
  void *v3;
  void *v4;

  -[MCConfigurationProfile payloads](self, "payloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCConfigurationProfile _localizedPayloadSummaryByType:](self, "_localizedPayloadSummaryByType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedManagedPayloadSummaryByType
{
  void *v3;
  void *v4;

  -[MCConfigurationProfile managedPayloads](self, "managedPayloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCConfigurationProfile _localizedPayloadSummaryByType:](self, "_localizedPayloadSummaryByType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedManagedProfileConsentTexts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)MCConfigurationProfile;
  -[MCProfile localizedManagedProfileConsentTexts](&v24, sel_localizedManagedProfileConsentTexts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  +[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfile identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dependentsOfParent:inDomain:", v6, CFSTR("ManagingProfileToManagedProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        -[MCProfile identifier](self, "identifier", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedManagedProfileConsentTexts");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addEntriesFromDictionary:", v17);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v4, "copy");
  return v18;
}

- (id)earliestCertificateExpiryDate
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = (id *)&v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_payloads;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "expiry");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "SMIMEEmailAddress");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v11 || (objc_msgSend(v9, "timeIntervalSinceDate:", v11), v12 > 0.0))
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

          }
          else
          {
            objc_msgSend(v9, "timeIntervalSinceDate:", v22[5]);
            if (v13 < 0.0)
            {
              objc_storeStrong(v22 + 5, v9);
              *((_BYTE *)v28 + 24) = 1;
            }
          }

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v5);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__MCConfigurationProfile_earliestCertificateExpiryDate__block_invoke;
  v16[3] = &unk_1E41E2D48;
  v16[4] = &v21;
  v16[5] = &v27;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (*((_BYTE *)v28 + 24))
    v14 = v22[5];
  else
    v14 = 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v14;
}

void __55__MCConfigurationProfile_earliestCertificateExpiryDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (v5 < 0.0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)replacePayloadWithUUID:(id)a3 withPayload:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  NSArray *v14;
  NSArray *payloads;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)-[NSArray mutableCopy](self->_payloads, "mutableCopy");
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = 1;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v16);

      if (v12)
        break;
      v8 = v9;
      if (objc_msgSend(v7, "count") <= (unint64_t)v9++)
        goto LABEL_7;
    }
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v6, v8);
  }
LABEL_7:
  v14 = (NSArray *)objc_msgSend(v7, "copy");
  payloads = self->_payloads;
  self->_payloads = v14;

}

- (MCProfileServiceProfile)OTAProfile
{
  return self->_OTAProfile;
}

- (void)setOTAProfile:(id)a3
{
  objc_storeStrong((id *)&self->_OTAProfile, a3);
}

- (BOOL)isCloudProfile
{
  return self->_isCloudProfile;
}

- (void)setIsCloudProfile:(BOOL)a3
{
  self->_isCloudProfile = a3;
}

- (BOOL)isCloudLocked
{
  return self->_isCloudLocked;
}

- (void)setIsCloudLocked:(BOOL)a3
{
  self->_isCloudLocked = a3;
}

- (BOOL)isMDMProfile
{
  return self->_isMDMProfile;
}

- (void)setIsMDMProfile:(BOOL)a3
{
  self->_isMDMProfile = a3;
}

- (NSNumber)isCloudProfileNum
{
  return self->_isCloudProfileNum;
}

- (void)setIsCloudProfileNum:(id)a3
{
  objc_storeStrong((id *)&self->_isCloudProfileNum, a3);
}

- (NSNumber)isCloudLockedNum
{
  return self->_isCloudLockedNum;
}

- (void)setIsCloudLockedNum:(id)a3
{
  objc_storeStrong((id *)&self->_isCloudLockedNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isCloudLockedNum, 0);
  objc_storeStrong((id *)&self->_isCloudProfileNum, 0);
  objc_storeStrong((id *)&self->_OTAProfile, 0);
  objc_storeStrong((id *)&self->_managedPayloads, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
}

@end

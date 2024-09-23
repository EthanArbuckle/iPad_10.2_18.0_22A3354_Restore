@implementation IDSRegistrationAccountStatusMetric

- (IDSRegistrationAccountStatusMetric)initWithAccountType:(int)a3 serviceIdentifier:(id)a4 doesExist:(BOOL)a5 isEnabled:(BOOL)a6 isUserDisabled:(BOOL)a7 isiCloudSignedIn:(BOOL)a8 doesMatchiCloudAccount:(BOOL)a9 isiTunesSignedIn:(BOOL)a10 registrationError:(int64_t)a11 registrationErrorReason:(int)a12 registrationStatus:(int64_t)a13 accountRegistrationStatus:(int)a14 hasEverRegistered:(BOOL)a15 lastRegistrationFailureError:(int64_t)a16 timeIntervalSinceLastRegistrationFailure:(double)a17 timeIntervalSinceLastRegistrationSuccess:(double)a18 accountSecurityLevel:(int64_t)a19 areAllAliasesSelected:(BOOL)a20 areAllSelectedAliasesRegistered:(BOOL)a21 numberOfSelected:(int64_t)a22 numberOfVetted:(int64_t)a23 numberOfUnselectReasonUnknown:(int64_t)a24 numberOfUnselectReasonAlertDenial:(int64_t)a25 numberOfUnselectReasonClientCall:(int64_t)a26 numberOfUnselectReasonBadAlias:(int64_t)a27 numberOfUnselectReasonUpdateInfo:(int64_t)a28 isProdEnvironment:(BOOL)a29
{
  id v37;
  IDSRegistrationAccountStatusMetric *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  IDSRegistrationAccountStatusMetric *v42;
  uint64_t v43;
  NSString *serviceIdentifier;
  objc_super v46;

  v37 = a4;
  v46.receiver = self;
  v46.super_class = (Class)IDSRegistrationAccountStatusMetric;
  v38 = -[IDSRegistrationAccountStatusMetric init](&v46, sel_init);
  v42 = v38;
  if (v38)
  {
    v38->_accountType = a3;
    v43 = objc_msgSend_copy(v37, v39, v40, v41);
    serviceIdentifier = v42->_serviceIdentifier;
    v42->_serviceIdentifier = (NSString *)v43;

    v42->_doesExist = a5;
    v42->_isEnabled = a6;
    v42->_isUserDisabled = a7;
    v42->_isiCloudSignedIn = a8;
    v42->_doesMatchiCloudAccount = a9;
    v42->_isiTunesSignedIn = a10;
    v42->_registrationError = a11;
    v42->_registrationStatus = a13;
    v42->_registrationErrorReason = a12;
    v42->_accountRegistrationStatus = a14;
    v42->_hasEverRegistered = a15;
    v42->_lastRegistrationFailureError = a16;
    v42->_timeIntervalSinceLastRegistrationFailure = a17;
    v42->_timeIntervalSinceLastRegistrationSuccess = a18;
    v42->_areAllAliasesSelected = a20;
    v42->_areAllSelectedAliasesRegistered = a21;
    v42->_accountSecurityLevel = a19;
    v42->_numberOfSelected = a22;
    v42->_numberOfVetted = a23;
    v42->_numberOfUnselectReasonUnknown = a24;
    v42->_numberOfUnselectReasonAlertDenial = a25;
    v42->_numberOfUnselectReasonClientCall = a26;
    v42->_numberOfUnselectReasonBadAlias = a27;
    v42->_numberOfUnselectReasonUpdateInfo = a28;
    v42->_isProdEnvironment = a29;
  }

  return v42;
}

- (NSString)description
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  double v89;
  uint64_t updated;
  const char *v91;
  uint64_t v92;
  double v93;
  unsigned int isProdEnvironment;
  const char *v95;
  double v96;
  void *v97;
  uint64_t RegistrationFailureError;
  uint64_t hasEverRegistered;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t doesMatchiCloudAccount;
  uint64_t v107;
  uint64_t isUserDisabled;
  uint64_t isEnabled;
  uint64_t doesExist;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;

  v114 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend_accountType(self, v5, v6, v7);
  objc_msgSend_serviceIdentifier(self, v8, v9, v10);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  doesExist = objc_msgSend_doesExist(self, v11, v12, v13);
  isEnabled = objc_msgSend_isEnabled(self, v14, v15, v16);
  isUserDisabled = objc_msgSend_isUserDisabled(self, v17, v18, v19);
  v107 = objc_msgSend_isiCloudSignedIn(self, v20, v21, v22);
  doesMatchiCloudAccount = objc_msgSend_doesMatchiCloudAccount(self, v23, v24, v25);
  v105 = objc_msgSend_isiTunesSignedIn(self, v26, v27, v28);
  v104 = objc_msgSend_registrationError(self, v29, v30, v31);
  v103 = objc_msgSend_registrationErrorReason(self, v32, v33, v34);
  v102 = objc_msgSend_registrationStatus(self, v35, v36, v37);
  v101 = objc_msgSend_accountRegistrationStatus(self, v38, v39, v40);
  hasEverRegistered = objc_msgSend_hasEverRegistered(self, v41, v42, v43);
  RegistrationFailureError = objc_msgSend_lastRegistrationFailureError(self, v44, v45, v46);
  objc_msgSend_timeIntervalSinceLastRegistrationFailure(self, v47, v48, v49);
  v51 = v50;
  objc_msgSend_timeIntervalSinceLastRegistrationSuccess(self, v52, v53, v50);
  v55 = v54;
  v58 = objc_msgSend_accountSecurityLevel(self, v56, v57, v54);
  v62 = objc_msgSend_areAllAliasesSelected(self, v59, v60, v61);
  v66 = objc_msgSend_areAllSelectedAliasesRegistered(self, v63, v64, v65);
  v70 = objc_msgSend_numberOfVetted(self, v67, v68, v69);
  v74 = objc_msgSend_numberOfUnselectReasonUnknown(self, v71, v72, v73);
  v78 = objc_msgSend_numberOfUnselectReasonAlertDenial(self, v75, v76, v77);
  v82 = objc_msgSend_numberOfUnselectReasonClientCall(self, v79, v80, v81);
  v86 = objc_msgSend_numberOfUnselectReasonBadAlias(self, v83, v84, v85);
  updated = objc_msgSend_numberOfUnselectReasonUpdateInfo(self, v87, v88, v89);
  isProdEnvironment = objc_msgSend_isProdEnvironment(self, v91, v92, v93);
  objc_msgSend_stringWithFormat_(v114, v95, (uint64_t)CFSTR("%@: <type: %d, service: %@, exist: %ld, enabled: %ld, userDisabled: %ld, iCloudSignedIn: %ld, doesMatchiCloud: %ld, iTunesSignedIn: %ld, error: %ld, errorReason: %d, status: %ld, accountStatus: %d, hasEverRegistered: %ld, lastFailError: %ld, timeSinceFail: %f, timeSinceSuccess: %f, securityLevel: %ld, allAliasesSelected: %ld, allSelectedAliasesRegistered: %ld, numVetted: %ld, numUnselectUnknown: %ld, numUnselectAlertDenial: %ld, numUnselectClientCall: %ld, numUnselectBadAlias: %ld, numUnselecUpdateInfo: %ld, isProd: %ld>"), v96, v113, v112, v111, doesExist, isEnabled, isUserDisabled, v107, doesMatchiCloudAccount, v105, v104, v103, v102, v101, hasEverRegistered, RegistrationFailureError,
    *(_QWORD *)&v51,
    *(_QWORD *)&v55,
    v58,
    v62,
    v66,
    v70,
    v74,
    v78,
    v82,
    v86,
    updated,
    isProdEnvironment);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v97;
}

- (NSString)name
{
  return (NSString *)CFSTR("RegistrationAccountStatus");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t doesExist;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t isEnabled;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t isUserDisabled;
  const char *v37;
  double v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  uint64_t doesMatchiCloudAccount;
  const char *v53;
  double v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  const char *v61;
  double v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  const char *v69;
  double v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  const char *v77;
  double v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  const char *v85;
  double v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  double v91;
  uint64_t v92;
  const char *v93;
  double v94;
  void *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  double v99;
  uint64_t hasEverRegistered;
  const char *v101;
  double v102;
  void *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  double v107;
  uint64_t RegistrationFailureError;
  const char *v109;
  double v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  double v115;
  const char *v116;
  uint64_t v117;
  double v118;
  void *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  double v123;
  const char *v124;
  uint64_t v125;
  double v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  double v131;
  uint64_t v132;
  const char *v133;
  double v134;
  void *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  double v139;
  uint64_t v140;
  const char *v141;
  double v142;
  void *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  double v147;
  uint64_t v148;
  const char *v149;
  double v150;
  void *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  double v155;
  uint64_t v156;
  const char *v157;
  double v158;
  void *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  double v163;
  uint64_t v164;
  const char *v165;
  double v166;
  void *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  double v171;
  uint64_t v172;
  const char *v173;
  double v174;
  void *v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  double v179;
  uint64_t v180;
  const char *v181;
  double v182;
  void *v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  double v187;
  uint64_t v188;
  const char *v189;
  double v190;
  void *v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  double v195;
  uint64_t v196;
  const char *v197;
  double v198;
  void *v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  double v203;
  uint64_t updated;
  const char *v205;
  double v206;
  void *v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  double v211;
  uint64_t isProdEnvironment;
  const char *v213;
  double v214;
  void *v215;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_accountType(self, v5, v6, v7);
  objc_msgSend_numberWithInt_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("AccountType"), v11);

  objc_msgSend_serviceIdentifier(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("ServiceIdentifier"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  doesExist = objc_msgSend_doesExist(self, v17, v18, v19);
  objc_msgSend_numberWithBool_(v16, v21, doesExist, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("DoesExist"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  isEnabled = objc_msgSend_isEnabled(self, v25, v26, v27);
  objc_msgSend_numberWithBool_(v24, v29, isEnabled, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("IsEnabled"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  isUserDisabled = objc_msgSend_isUserDisabled(self, v33, v34, v35);
  objc_msgSend_numberWithBool_(v32, v37, isUserDisabled, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("IsUserDisabled"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  v44 = objc_msgSend_isiCloudSignedIn(self, v41, v42, v43);
  objc_msgSend_numberWithBool_(v40, v45, v44, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    CFDictionarySetValue(v3, CFSTR("IsiCloudSignedIn"), v47);

  v48 = (void *)MEMORY[0x1E0CB37E8];
  doesMatchiCloudAccount = objc_msgSend_doesMatchiCloudAccount(self, v49, v50, v51);
  objc_msgSend_numberWithBool_(v48, v53, doesMatchiCloudAccount, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("DoesMatchiCloudAccount"), v55);

  v56 = (void *)MEMORY[0x1E0CB37E8];
  v60 = objc_msgSend_isiTunesSignedIn(self, v57, v58, v59);
  objc_msgSend_numberWithBool_(v56, v61, v60, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    CFDictionarySetValue(v3, CFSTR("IsiTunesSignedIn"), v63);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  v68 = objc_msgSend_registrationError(self, v65, v66, v67);
  objc_msgSend_numberWithInteger_(v64, v69, v68, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
    CFDictionarySetValue(v3, CFSTR("RegistrationError"), v71);

  v72 = (void *)MEMORY[0x1E0CB37E8];
  v76 = objc_msgSend_registrationErrorReason(self, v73, v74, v75);
  objc_msgSend_numberWithInt_(v72, v77, v76, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    CFDictionarySetValue(v3, CFSTR("RegistrationErrorReason"), v79);

  v80 = (void *)MEMORY[0x1E0CB37E8];
  v84 = objc_msgSend_registrationStatus(self, v81, v82, v83);
  objc_msgSend_numberWithInteger_(v80, v85, v84, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
    CFDictionarySetValue(v3, CFSTR("RegistrationStatus"), v87);

  v88 = (void *)MEMORY[0x1E0CB37E8];
  v92 = objc_msgSend_accountRegistrationStatus(self, v89, v90, v91);
  objc_msgSend_numberWithInt_(v88, v93, v92, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
    CFDictionarySetValue(v3, CFSTR("AccountRegistrationStatus"), v95);

  v96 = (void *)MEMORY[0x1E0CB37E8];
  hasEverRegistered = objc_msgSend_hasEverRegistered(self, v97, v98, v99);
  objc_msgSend_numberWithBool_(v96, v101, hasEverRegistered, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (v103)
    CFDictionarySetValue(v3, CFSTR("HasEverRegistered"), v103);

  v104 = (void *)MEMORY[0x1E0CB37E8];
  RegistrationFailureError = objc_msgSend_lastRegistrationFailureError(self, v105, v106, v107);
  objc_msgSend_numberWithInteger_(v104, v109, RegistrationFailureError, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
    CFDictionarySetValue(v3, CFSTR("LastFailureError"), v111);

  v112 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceLastRegistrationFailure(self, v113, v114, v115);
  objc_msgSend_numberWithDouble_(v112, v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (v119)
    CFDictionarySetValue(v3, CFSTR("TimeIntervalSinceLastFailure"), v119);

  v120 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceLastRegistrationSuccess(self, v121, v122, v123);
  objc_msgSend_numberWithDouble_(v120, v124, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127)
    CFDictionarySetValue(v3, CFSTR("TimeIntervalSinceLastSuccess"), v127);

  v128 = (void *)MEMORY[0x1E0CB37E8];
  v132 = objc_msgSend_accountSecurityLevel(self, v129, v130, v131);
  objc_msgSend_numberWithInteger_(v128, v133, v132, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
    CFDictionarySetValue(v3, CFSTR("AccountSecurityLevel"), v135);

  v136 = (void *)MEMORY[0x1E0CB37E8];
  v140 = objc_msgSend_areAllAliasesSelected(self, v137, v138, v139);
  objc_msgSend_numberWithBool_(v136, v141, v140, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if (v143)
    CFDictionarySetValue(v3, CFSTR("AreAllAliasesSelected"), v143);

  v144 = (void *)MEMORY[0x1E0CB37E8];
  v148 = objc_msgSend_areAllSelectedAliasesRegistered(self, v145, v146, v147);
  objc_msgSend_numberWithBool_(v144, v149, v148, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
    CFDictionarySetValue(v3, CFSTR("AreAllSelectedAliasesRegistered"), v151);

  v152 = (void *)MEMORY[0x1E0CB37E8];
  v156 = objc_msgSend_numberOfSelected(self, v153, v154, v155);
  objc_msgSend_numberWithInteger_(v152, v157, v156, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (v159)
    CFDictionarySetValue(v3, CFSTR("NumberOfSelected"), v159);

  v160 = (void *)MEMORY[0x1E0CB37E8];
  v164 = objc_msgSend_numberOfVetted(self, v161, v162, v163);
  objc_msgSend_numberWithInteger_(v160, v165, v164, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v167)
    CFDictionarySetValue(v3, CFSTR("NumberOfVetted"), v167);

  v168 = (void *)MEMORY[0x1E0CB37E8];
  v172 = objc_msgSend_numberOfUnselectReasonUnknown(self, v169, v170, v171);
  objc_msgSend_numberWithInteger_(v168, v173, v172, v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v175)
    CFDictionarySetValue(v3, CFSTR("NumberOfUnselectReasonUnknown"), v175);

  v176 = (void *)MEMORY[0x1E0CB37E8];
  v180 = objc_msgSend_numberOfUnselectReasonAlertDenial(self, v177, v178, v179);
  objc_msgSend_numberWithInteger_(v176, v181, v180, v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183)
    CFDictionarySetValue(v3, CFSTR("NumberOfUnselectReasonAlertDenial"), v183);

  v184 = (void *)MEMORY[0x1E0CB37E8];
  v188 = objc_msgSend_numberOfUnselectReasonClientCall(self, v185, v186, v187);
  objc_msgSend_numberWithInteger_(v184, v189, v188, v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (v191)
    CFDictionarySetValue(v3, CFSTR("NumberOfUnselectReasonClientCall"), v191);

  v192 = (void *)MEMORY[0x1E0CB37E8];
  v196 = objc_msgSend_numberOfUnselectReasonBadAlias(self, v193, v194, v195);
  objc_msgSend_numberWithInteger_(v192, v197, v196, v198);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  if (v199)
    CFDictionarySetValue(v3, CFSTR("NumberOfUnselectReasonBadAlias"), v199);

  v200 = (void *)MEMORY[0x1E0CB37E8];
  updated = objc_msgSend_numberOfUnselectReasonUpdateInfo(self, v201, v202, v203);
  objc_msgSend_numberWithInteger_(v200, v205, updated, v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  if (v207)
    CFDictionarySetValue(v3, CFSTR("NumberOfUnselectReasonUpdateInfo"), v207);

  v208 = (void *)MEMORY[0x1E0CB37E8];
  isProdEnvironment = objc_msgSend_isProdEnvironment(self, v209, v210, v211);
  objc_msgSend_numberWithBool_(v208, v213, isProdEnvironment, v214);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  if (v215)
    CFDictionarySetValue(v3, CFSTR("IsProdEnvironment"), v215);

  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeRegistrationAccountStatus;
}

- (unsigned)awdIdentifier
{
  return 0;
}

- (NSCopying)awdRepresentation
{
  return 0;
}

- (int)accountType
{
  return self->_accountType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)doesExist
{
  return self->_doesExist;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isUserDisabled
{
  return self->_isUserDisabled;
}

- (BOOL)doesMatchiCloudAccount
{
  return self->_doesMatchiCloudAccount;
}

- (BOOL)isiCloudSignedIn
{
  return self->_isiCloudSignedIn;
}

- (BOOL)isiTunesSignedIn
{
  return self->_isiTunesSignedIn;
}

- (int64_t)registrationError
{
  return self->_registrationError;
}

- (int)registrationErrorReason
{
  return self->_registrationErrorReason;
}

- (int64_t)registrationStatus
{
  return self->_registrationStatus;
}

- (int)accountRegistrationStatus
{
  return self->_accountRegistrationStatus;
}

- (int64_t)lastRegistrationFailureError
{
  return self->_lastRegistrationFailureError;
}

- (BOOL)hasEverRegistered
{
  return self->_hasEverRegistered;
}

- (double)timeIntervalSinceLastRegistrationFailure
{
  return self->_timeIntervalSinceLastRegistrationFailure;
}

- (double)timeIntervalSinceLastRegistrationSuccess
{
  return self->_timeIntervalSinceLastRegistrationSuccess;
}

- (int64_t)accountSecurityLevel
{
  return self->_accountSecurityLevel;
}

- (BOOL)areAllAliasesSelected
{
  return self->_areAllAliasesSelected;
}

- (BOOL)areAllSelectedAliasesRegistered
{
  return self->_areAllSelectedAliasesRegistered;
}

- (BOOL)isProdEnvironment
{
  return self->_isProdEnvironment;
}

- (int64_t)numberOfSelected
{
  return self->_numberOfSelected;
}

- (int64_t)numberOfVetted
{
  return self->_numberOfVetted;
}

- (int64_t)numberOfUnselectReasonUnknown
{
  return self->_numberOfUnselectReasonUnknown;
}

- (int64_t)numberOfUnselectReasonAlertDenial
{
  return self->_numberOfUnselectReasonAlertDenial;
}

- (int64_t)numberOfUnselectReasonClientCall
{
  return self->_numberOfUnselectReasonClientCall;
}

- (int64_t)numberOfUnselectReasonBadAlias
{
  return self->_numberOfUnselectReasonBadAlias;
}

- (int64_t)numberOfUnselectReasonUpdateInfo
{
  return self->_numberOfUnselectReasonUpdateInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end

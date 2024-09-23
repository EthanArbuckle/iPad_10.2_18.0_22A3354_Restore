@implementation GDEntityResolutionCollectionCandidate

- (GDEntityResolutionCollectionCandidate)initWithPrimaryName:(id)a3 personToPerson:(id)a4 aliasConcat:(id)a5 entityAliasConcat:(id)a6 personFromOrganization:(id)a7 personFromLocation:(id)a8 personFromEventLocation:(id)a9 personFromEvent:(id)a10 firstPartyMsgTwoWeeks:(int64_t)a11 firstPartyMsgSixWeeks:(int64_t)a12 firstPartyMsgThreeMonths:(int64_t)a13 firstPartyMsgSixMonths:(int64_t)a14 thirdPartyMsgTwoWeeks:(int64_t)a15 thirdPartyMsgSixWeeks:(int64_t)a16 thirdPartyMsgThreeMonths:(int64_t)a17 thirdPartyMsgSixMonths:(int64_t)a18 callTwoWeeks:(int64_t)a19 callSixWeeks:(int64_t)a20 callTwelveWeeks:(int64_t)a21 callSixMonths:(int64_t)a22 identifier:(id)a23
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  const char *v36;
  uint64_t v37;
  GDEntityResolutionCollectionCandidate *v38;
  uint64_t v39;
  NSString *primaryName;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSString *personToPerson;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSString *aliasConcat;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSString *entityAliasConcat;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *personFromOrganization;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSString *personFromLocation;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSString *personFromEventLocation;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSString *personFromEvent;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSString *identifier;
  id v74;
  objc_super v75;

  v74 = a3;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v33 = a8;
  v34 = a10;
  v35 = a23;
  v75.receiver = self;
  v75.super_class = (Class)GDEntityResolutionCollectionCandidate;
  v38 = -[GDEntityResolutionCollectionCandidate init](&v75, sel_init);
  if (v38)
  {
    v39 = objc_msgSend_copy(v74, v36, v37);
    primaryName = v38->_primaryName;
    v38->_primaryName = (NSString *)v39;

    v43 = objc_msgSend_copy(v29, v41, v42);
    personToPerson = v38->_personToPerson;
    v38->_personToPerson = (NSString *)v43;

    v47 = objc_msgSend_copy(v30, v45, v46);
    aliasConcat = v38->_aliasConcat;
    v38->_aliasConcat = (NSString *)v47;

    v51 = objc_msgSend_copy(v31, v49, v50);
    entityAliasConcat = v38->_entityAliasConcat;
    v38->_entityAliasConcat = (NSString *)v51;

    v55 = objc_msgSend_copy(v32, v53, v54);
    personFromOrganization = v38->_personFromOrganization;
    v38->_personFromOrganization = (NSString *)v55;

    v59 = objc_msgSend_copy(v33, v57, v58);
    personFromLocation = v38->_personFromLocation;
    v38->_personFromLocation = (NSString *)v59;

    v63 = objc_msgSend_copy(v34, v61, v62);
    personFromEventLocation = v38->_personFromEventLocation;
    v38->_personFromEventLocation = (NSString *)v63;

    v67 = objc_msgSend_copy(v34, v65, v66);
    personFromEvent = v38->_personFromEvent;
    v38->_personFromEvent = (NSString *)v67;

    v38->_firstPartyMsgTwoWeeks = a11;
    v38->_firstPartyMsgSixWeeks = a12;
    v38->_firstPartyMsgThreeMonths = a13;
    v38->_firstPartyMsgSixMonths = a14;
    v38->_thirdPartyMsgTwoWeeks = a15;
    v38->_thirdPartyMsgSixWeeks = a16;
    v38->_thirdPartyMsgThreeMonths = a17;
    v38->_thirdPartyMsgSixMonths = a18;
    v38->_callTwoWeeks = a19;
    v38->_callSixWeeks = a20;
    v38->_callTwelveWeeks = a21;
    v38->_callSixMonths = a22;
    v71 = objc_msgSend_copy(v35, v69, v70);
    identifier = v38->_identifier;
    v38->_identifier = (NSString *)v71;

  }
  return v38;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *primaryName;
  id v5;
  void *v6;
  const char *v7;
  NSString *aliasConcat;
  void *v9;
  const char *v10;
  NSString *entityAliasConcat;
  void *v12;
  const char *v13;
  NSString *personToPerson;
  void *v15;
  const char *v16;
  NSString *personFromOrganization;
  void *v18;
  const char *v19;
  NSString *personFromLocation;
  void *v21;
  const char *v22;
  NSString *personFromEventLocation;
  void *v24;
  const char *v25;
  NSString *personFromEvent;
  void *v27;
  const char *v28;
  int64_t firstPartyMsgTwoWeeks;
  void *v30;
  const char *v31;
  int64_t firstPartyMsgSixWeeks;
  void *v33;
  const char *v34;
  int64_t firstPartyMsgThreeMonths;
  void *v36;
  const char *v37;
  int64_t firstPartyMsgSixMonths;
  void *v39;
  const char *v40;
  int64_t thirdPartyMsgTwoWeeks;
  void *v42;
  const char *v43;
  int64_t thirdPartyMsgSixWeeks;
  void *v45;
  const char *v46;
  int64_t thirdPartyMsgThreeMonths;
  void *v48;
  const char *v49;
  int64_t thirdPartyMsgSixMonths;
  void *v51;
  const char *v52;
  int64_t callTwoWeeks;
  void *v54;
  const char *v55;
  int64_t callSixWeeks;
  void *v57;
  const char *v58;
  int64_t callTwelveWeeks;
  void *v60;
  const char *v61;
  int64_t callSixMonths;
  void *v63;
  const char *v64;
  NSString *identifier;
  const char *v66;
  id v67;

  primaryName = self->_primaryName;
  v5 = a3;
  NSStringFromSelector(sel_primaryName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)primaryName, v6);

  aliasConcat = self->_aliasConcat;
  NSStringFromSelector(sel_aliasConcat);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)aliasConcat, v9);

  entityAliasConcat = self->_entityAliasConcat;
  NSStringFromSelector(sel_entityAliasConcat);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)entityAliasConcat, v12);

  personToPerson = self->_personToPerson;
  NSStringFromSelector(sel_personToPerson);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)personToPerson, v15);

  personFromOrganization = self->_personFromOrganization;
  NSStringFromSelector(sel_personFromOrganization);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)personFromOrganization, v18);

  personFromLocation = self->_personFromLocation;
  NSStringFromSelector(sel_personFromLocation);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)personFromLocation, v21);

  personFromEventLocation = self->_personFromEventLocation;
  NSStringFromSelector(sel_personFromEvent);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)personFromEventLocation, v24);

  personFromEvent = self->_personFromEvent;
  NSStringFromSelector(sel_personFromEvent);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)personFromEvent, v27);

  firstPartyMsgTwoWeeks = self->_firstPartyMsgTwoWeeks;
  NSStringFromSelector(sel_firstPartyMsgTwoWeeks);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v31, firstPartyMsgTwoWeeks, v30);

  firstPartyMsgSixWeeks = self->_firstPartyMsgSixWeeks;
  NSStringFromSelector(sel_firstPartyMsgSixWeeks);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v34, firstPartyMsgSixWeeks, v33);

  firstPartyMsgThreeMonths = self->_firstPartyMsgThreeMonths;
  NSStringFromSelector(sel_firstPartyMsgThreeMonths);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v37, firstPartyMsgThreeMonths, v36);

  firstPartyMsgSixMonths = self->_firstPartyMsgSixMonths;
  NSStringFromSelector(sel_firstPartyMsgSixMonths);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v40, firstPartyMsgSixMonths, v39);

  thirdPartyMsgTwoWeeks = self->_thirdPartyMsgTwoWeeks;
  NSStringFromSelector(sel_thirdPartyMsgTwoWeeks);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v43, thirdPartyMsgTwoWeeks, v42);

  thirdPartyMsgSixWeeks = self->_thirdPartyMsgSixWeeks;
  NSStringFromSelector(sel_thirdPartyMsgSixWeeks);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v46, thirdPartyMsgSixWeeks, v45);

  thirdPartyMsgThreeMonths = self->_thirdPartyMsgThreeMonths;
  NSStringFromSelector(sel_thirdPartyMsgThreeMonths);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v49, thirdPartyMsgThreeMonths, v48);

  thirdPartyMsgSixMonths = self->_thirdPartyMsgSixMonths;
  NSStringFromSelector(sel_thirdPartyMsgSixMonths);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v52, thirdPartyMsgSixMonths, v51);

  callTwoWeeks = self->_callTwoWeeks;
  NSStringFromSelector(sel_callTwoWeeks);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v55, callTwoWeeks, v54);

  callSixWeeks = self->_callSixWeeks;
  NSStringFromSelector(sel_callSixWeeks);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v58, callSixWeeks, v57);

  callTwelveWeeks = self->_callTwelveWeeks;
  NSStringFromSelector(sel_callTwelveWeeks);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v61, callTwelveWeeks, v60);

  callSixMonths = self->_callSixMonths;
  NSStringFromSelector(sel_callSixMonths);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v64, callSixMonths, v63);

  identifier = self->_identifier;
  NSStringFromSelector(sel_identifier);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v66, (uint64_t)identifier, v67);

}

- (GDEntityResolutionCollectionCandidate)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  GDEntityResolutionCollectionCandidate *v87;
  void *v88;
  void *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  void *v104;
  const char *v105;
  void *v106;
  const char *v107;
  const char *v108;
  void *v109;
  const char *v110;
  void *v111;
  const char *v112;
  const char *v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  const char *v123;
  void *v124;
  const char *v125;
  void *v126;
  const char *v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  void *v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  void *v172;
  void *v173;
  const char *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
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
  void *v192;
  GDEntityResolutionCollectionCandidate *v193;
  uint64_t v194;
  const __CFString *v195;
  uint64_t v196;
  const __CFString *v197;
  uint64_t v198;
  const __CFString *v199;
  uint64_t v200;
  const __CFString *v201;
  uint64_t v202;
  const __CFString *v203;
  uint64_t v204;
  const __CFString *v205;
  uint64_t v206;
  const __CFString *v207;
  uint64_t v208;
  const __CFString *v209;
  uint64_t v210;
  _QWORD v211[3];

  v211[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_primaryName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_aliasConcat);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_error(v4, v15, v16);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
      {
        v14 = 0;
        v87 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v101 = (void *)MEMORY[0x1E0CB35C8];
      v208 = *MEMORY[0x1E0CB2D50];
      v209 = CFSTR("GDEntityResolutionCollectionResult aliasConcat is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v93, (uint64_t)&v209, &v208, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v101, v102, (uint64_t)CFSTR("GDErrorDomain"), 9, v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v103, (uint64_t)v26);
      goto LABEL_28;
    }
    v17 = objc_opt_class();
    NSStringFromSelector(sel_entityAliasConcat);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v23 = objc_opt_class();
      NSStringFromSelector(sel_personToPerson);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v29 = objc_opt_class();
        NSStringFromSelector(sel_personFromOrganization);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v193 = self;
          v35 = objc_opt_class();
          NSStringFromSelector(sel_personFromLocation);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v35, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            v41 = objc_opt_class();
            NSStringFromSelector(sel_personFromLocation);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v41, v42);
            v44 = objc_claimAutoreleasedReturnValue();

            v191 = (void *)v44;
            if (v44)
            {
              v47 = objc_opt_class();
              NSStringFromSelector(sel_personFromEvent);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v47, v48);
              v50 = objc_claimAutoreleasedReturnValue();

              v192 = v38;
              if (v50)
              {
                v189 = v32;
                v190 = v50;
                NSStringFromSelector(sel_firstPartyMsgTwoWeeks);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend_decodeIntegerForKey_(v4, v54, (uint64_t)v53);

                objc_msgSend_error(v4, v56, v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                self = v193;
                if (v58)
                  goto LABEL_15;
                v188 = v55;
                NSStringFromSelector(sel_firstPartyMsgSixWeeks);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = objc_msgSend_decodeIntegerForKey_(v4, v60, (uint64_t)v59);

                objc_msgSend_error(v4, v62, v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                if (v64)
                  goto LABEL_15;
                v187 = v61;
                NSStringFromSelector(sel_firstPartyMsgThreeMonths);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = objc_msgSend_decodeIntegerForKey_(v4, v66, (uint64_t)v65);

                objc_msgSend_error(v4, v68, v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();

                if (v70)
                  goto LABEL_15;
                v186 = v67;
                NSStringFromSelector(sel_firstPartyMsgSixMonths);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = objc_msgSend_decodeIntegerForKey_(v4, v72, (uint64_t)v71);

                objc_msgSend_error(v4, v74, v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();

                if (v76)
                  goto LABEL_15;
                NSStringFromSelector(sel_thirdPartyMsgTwoWeeks);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v185 = objc_msgSend_decodeIntegerForKey_(v4, v78, (uint64_t)v77);

                objc_msgSend_error(v4, v79, v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                if (v81
                  || (NSStringFromSelector(sel_thirdPartyMsgSixWeeks),
                      v82 = (void *)objc_claimAutoreleasedReturnValue(),
                      v184 = objc_msgSend_decodeIntegerForKey_(v4, v83, (uint64_t)v82),
                      v82,
                      objc_msgSend_error(v4, v84, v85),
                      v86 = (void *)objc_claimAutoreleasedReturnValue(),
                      v86,
                      v86))
                {
LABEL_15:
                  v87 = 0;
LABEL_16:
                  v88 = (void *)v190;
                  v89 = v191;
                  v32 = v189;
LABEL_45:

                  v38 = v192;
                  goto LABEL_46;
                }
                NSStringFromSelector(sel_thirdPartyMsgThreeMonths);
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                v183 = objc_msgSend_decodeIntegerForKey_(v4, v134, (uint64_t)v133);

                objc_msgSend_error(v4, v135, v136);
                v137 = (void *)objc_claimAutoreleasedReturnValue();

                if (v137)
                  goto LABEL_59;
                NSStringFromSelector(sel_thirdPartyMsgSixMonths);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v140 = objc_msgSend_decodeIntegerForKey_(v4, v139, (uint64_t)v138);

                objc_msgSend_error(v4, v141, v142);
                v143 = (void *)objc_claimAutoreleasedReturnValue();

                if (v143)
                  goto LABEL_59;
                NSStringFromSelector(sel_callTwoWeeks);
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                v182 = objc_msgSend_decodeIntegerForKey_(v4, v145, (uint64_t)v144);

                objc_msgSend_error(v4, v146, v147);
                v148 = (void *)objc_claimAutoreleasedReturnValue();

                if (v148)
                  goto LABEL_59;
                NSStringFromSelector(sel_callSixWeeks);
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                v181 = objc_msgSend_decodeIntegerForKey_(v4, v150, (uint64_t)v149);

                objc_msgSend_error(v4, v151, v152);
                v153 = (void *)objc_claimAutoreleasedReturnValue();

                if (v153)
                  goto LABEL_59;
                NSStringFromSelector(sel_callTwelveWeeks);
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                v180 = objc_msgSend_decodeIntegerForKey_(v4, v155, (uint64_t)v154);

                objc_msgSend_error(v4, v156, v157);
                v158 = (void *)objc_claimAutoreleasedReturnValue();

                if (v158
                  || (NSStringFromSelector(sel_callSixMonths),
                      v159 = (void *)objc_claimAutoreleasedReturnValue(),
                      v179 = objc_msgSend_decodeIntegerForKey_(v4, v160, (uint64_t)v159),
                      v159,
                      objc_msgSend_error(v4, v161, v162),
                      v163 = (void *)objc_claimAutoreleasedReturnValue(),
                      v163,
                      v163))
                {
LABEL_59:
                  v87 = 0;
                  self = v193;
                  goto LABEL_16;
                }
                v164 = objc_opt_class();
                NSStringFromSelector(sel_identifier);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_decodeObjectOfClass_forKey_(v4, v166, v164, v165);
                v167 = objc_claimAutoreleasedReturnValue();

                if (v167)
                {
                  v126 = (void *)v167;
                  v178 = v167;
                  v177 = v73;
                  v32 = v189;
                  v89 = v191;
                  self = (GDEntityResolutionCollectionCandidate *)objc_retain((id)objc_msgSend_initWithPrimaryName_personToPerson_aliasConcat_entityAliasConcat_personFromOrganization_personFromLocation_personFromEventLocation_personFromEvent_firstPartyMsgTwoWeeks_firstPartyMsgSixWeeks_firstPartyMsgThreeMonths_firstPartyMsgSixMonths_thirdPartyMsgTwoWeeks_thirdPartyMsgSixWeeks_thirdPartyMsgThreeMonths_thirdPartyMsgSixMonths_callTwoWeeks_callSixWeeks_callTwelveWeeks_callSixMonths_identifier_(v193, v168, (uint64_t)v8, v26, v14, v20, v189, v192, v191, v190, v188, v187, v186, v177, v185, v184, v183, v140, v182,
                                                                                    v181,
                                                                                    v180,
                                                                                    v179,
                                                                                    v178));
                  v87 = self;
                }
                else
                {
                  objc_msgSend_error(v4, v168, v169);
                  v170 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v170)
                  {
                    v172 = (void *)MEMORY[0x1E0CB35C8];
                    v194 = *MEMORY[0x1E0CB2D50];
                    v195 = CFSTR("GDEntityResolutionCollectionResult identifier is nil");
                    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v171, (uint64_t)&v195, &v194, 1);
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_errorWithDomain_code_userInfo_(v172, v174, (uint64_t)CFSTR("GDErrorDomain"), 9, v173);
                    v175 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_failWithError_(v4, v176, (uint64_t)v175);

                  }
                  v126 = 0;
                  v87 = 0;
                  self = v193;
                  v89 = v191;
                  v32 = v189;
                }
              }
              else
              {
                objc_msgSend_error(v4, v51, v52);
                v119 = (void *)objc_claimAutoreleasedReturnValue();

                self = v193;
                v89 = v191;
                if (v119)
                {
                  v88 = 0;
                  v87 = 0;
                  goto LABEL_45;
                }
                v128 = (void *)MEMORY[0x1E0CB35C8];
                v196 = *MEMORY[0x1E0CB2D50];
                v197 = CFSTR("GDEntityResolutionCollectionResult personFromEvent is nil");
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v120, (uint64_t)&v197, &v196, 1);
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_userInfo_(v128, v129, (uint64_t)CFSTR("GDErrorDomain"), 9);
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_failWithError_(v4, v131, (uint64_t)v130);

                v190 = 0;
                v87 = 0;
              }
LABEL_44:

              v88 = (void *)v190;
              goto LABEL_45;
            }
            objc_msgSend_error(v4, v45, v46);
            v114 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v114)
            {
              v192 = v38;
              v124 = (void *)MEMORY[0x1E0CB35C8];
              v198 = *MEMORY[0x1E0CB2D50];
              v199 = CFSTR("GDEntityResolutionCollectionResult personFromEventLocation is nil");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v115, (uint64_t)&v199, &v198, 1);
              v190 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v124, v125, (uint64_t)CFSTR("GDErrorDomain"), 9);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_failWithError_(v4, v127, (uint64_t)v126);
              v87 = 0;
              self = v193;
              v89 = 0;
              goto LABEL_44;
            }
            v89 = 0;
            v87 = 0;
            self = v193;
LABEL_46:

            goto LABEL_47;
          }
          objc_msgSend_error(v4, v39, v40);
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v109)
          {
            v192 = 0;
            v121 = (void *)MEMORY[0x1E0CB35C8];
            v200 = *MEMORY[0x1E0CB2D50];
            v201 = CFSTR("GDEntityResolutionCollectionResult personFromLocation is nil");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v110, (uint64_t)&v201, &v200, 1);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v121, v122, (uint64_t)CFSTR("GDErrorDomain"), 9, v89);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_failWithError_(v4, v123, (uint64_t)v88);
            v87 = 0;
            self = v193;
            goto LABEL_45;
          }
          v38 = 0;
          v87 = 0;
          self = v193;
LABEL_47:

          goto LABEL_48;
        }
        objc_msgSend_error(v4, v33, v34);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v104)
        {
          v116 = (void *)MEMORY[0x1E0CB35C8];
          v202 = *MEMORY[0x1E0CB2D50];
          v203 = CFSTR("GDEntityResolutionCollectionResult personFromOrganization is nil");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v105, (uint64_t)&v203, &v202, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v116, v117, (uint64_t)CFSTR("GDErrorDomain"), 9, v38);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_failWithError_(v4, v118, (uint64_t)v89);
          v87 = 0;
          goto LABEL_46;
        }
        v32 = 0;
LABEL_32:
        v87 = 0;
LABEL_48:

        goto LABEL_49;
      }
      objc_msgSend_error(v4, v27, v28);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v99)
      {
        v111 = (void *)MEMORY[0x1E0CB35C8];
        v204 = *MEMORY[0x1E0CB2D50];
        v205 = CFSTR("GDEntityResolutionCollectionResult personToPerson is nil");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v100, (uint64_t)&v205, &v204, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v111, v112, (uint64_t)CFSTR("GDErrorDomain"), 9, v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failWithError_(v4, v113, (uint64_t)v38);
        v87 = 0;
        goto LABEL_47;
      }
      v26 = 0;
LABEL_28:
      v87 = 0;
LABEL_49:

      goto LABEL_50;
    }
    objc_msgSend_error(v4, v21, v22);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v94)
    {
      v106 = (void *)MEMORY[0x1E0CB35C8];
      v206 = *MEMORY[0x1E0CB2D50];
      v207 = CFSTR("GDEntityResolutionCollectionResult entityAliasConcat is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v95, (uint64_t)&v207, &v206, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v106, v107, (uint64_t)CFSTR("GDErrorDomain"), 9, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v108, (uint64_t)v32);
      goto LABEL_32;
    }
    v20 = 0;
LABEL_24:
    v87 = 0;
LABEL_50:

    goto LABEL_51;
  }
  objc_msgSend_error(v4, v9, v10);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v90)
  {
    v96 = (void *)MEMORY[0x1E0CB35C8];
    v210 = *MEMORY[0x1E0CB2D50];
    v211[0] = CFSTR("GDEntityResolutionCollectionResult primaryName is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v91, (uint64_t)v211, &v210, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v96, v97, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v98, (uint64_t)v20);
    goto LABEL_24;
  }
  v87 = 0;
LABEL_52:

  return v87;
}

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_primaryName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<GDEntityResolutionCollectionResult: %@>"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)primaryName
{
  return self->_primaryName;
}

- (NSString)personToPerson
{
  return self->_personToPerson;
}

- (NSString)aliasConcat
{
  return self->_aliasConcat;
}

- (NSString)entityAliasConcat
{
  return self->_entityAliasConcat;
}

- (NSString)personFromOrganization
{
  return self->_personFromOrganization;
}

- (NSString)personFromLocation
{
  return self->_personFromLocation;
}

- (NSString)personFromEventLocation
{
  return self->_personFromEventLocation;
}

- (NSString)personFromEvent
{
  return self->_personFromEvent;
}

- (int64_t)firstPartyMsgTwoWeeks
{
  return self->_firstPartyMsgTwoWeeks;
}

- (int64_t)firstPartyMsgSixWeeks
{
  return self->_firstPartyMsgSixWeeks;
}

- (int64_t)firstPartyMsgThreeMonths
{
  return self->_firstPartyMsgThreeMonths;
}

- (int64_t)firstPartyMsgSixMonths
{
  return self->_firstPartyMsgSixMonths;
}

- (int64_t)thirdPartyMsgTwoWeeks
{
  return self->_thirdPartyMsgTwoWeeks;
}

- (int64_t)thirdPartyMsgSixWeeks
{
  return self->_thirdPartyMsgSixWeeks;
}

- (int64_t)thirdPartyMsgThreeMonths
{
  return self->_thirdPartyMsgThreeMonths;
}

- (int64_t)thirdPartyMsgSixMonths
{
  return self->_thirdPartyMsgSixMonths;
}

- (int64_t)callTwoWeeks
{
  return self->_callTwoWeeks;
}

- (int64_t)callSixWeeks
{
  return self->_callSixWeeks;
}

- (int64_t)callTwelveWeeks
{
  return self->_callTwelveWeeks;
}

- (int64_t)callSixMonths
{
  return self->_callSixMonths;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_personFromEvent, 0);
  objc_storeStrong((id *)&self->_personFromEventLocation, 0);
  objc_storeStrong((id *)&self->_personFromLocation, 0);
  objc_storeStrong((id *)&self->_personFromOrganization, 0);
  objc_storeStrong((id *)&self->_entityAliasConcat, 0);
  objc_storeStrong((id *)&self->_aliasConcat, 0);
  objc_storeStrong((id *)&self->_personToPerson, 0);
  objc_storeStrong((id *)&self->_primaryName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

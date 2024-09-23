@implementation CCContactContent

- (CCContactContent)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 previousFamilyName:(id)a6 nickname:(id)a7 namePrefix:(id)a8 nameSuffix:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 socialProfiles:(id)a14 instantMessageAddresses:(id)a15 relations:(id)a16 organizationName:(id)a17 departmentName:(id)a18 jobTitle:(id)a19 phoneticGivenName:(id)a20 phoneticMiddleName:(id)a21 phoneticFamilyName:(id)a22 phoneticOrganizationName:(id)a23 note:(id)a24 birthday:(id)a25 nonGregorianBirthday:(id)a26 dates:(id)a27 error:(id *)a28
{
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  int IsInstanceOfExpectedClass;
  id v41;
  void *v42;
  int v43;
  id v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  CCContactContent *v49;
  int v50;
  int v51;
  int v52;
  CCContactContent *v53;
  int v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  int v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  int v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  int v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  int v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t n;
  void *v90;
  int v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t ii;
  void *v97;
  int v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t jj;
  void *v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v113;
  int v114;
  void *v115;
  int v116;
  void *v117;
  int v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t kk;
  void *v124;
  void *v125;
  id v126;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  uint64_t v205;
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  uint64_t v214;

  v214 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v145 = a8;
  v148 = a9;
  v147 = a10;
  v146 = a11;
  v144 = a12;
  v143 = a13;
  v142 = a14;
  v141 = a15;
  v140 = a16;
  v139 = a17;
  v38 = a18;
  v137 = a19;
  v136 = a20;
  v135 = a21;
  v134 = a22;
  v133 = a23;
  v132 = a24;
  v131 = a25;
  v129 = a26;
  v130 = a27;
  v39 = (void *)objc_opt_new();
  v128 = v35;
  v138 = v38;
  if (v33)
  {
    objc_opt_class();
    v205 = 0;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v41 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_137;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v41 = 0;
  }
  v42 = v145;
  if (v34)
  {
    objc_opt_class();
    v204 = v41;
    v43 = CCValidateIsInstanceOfExpectedClass();
    v44 = v41;

    if (!v43)
      goto LABEL_14;
    CCPBDataWriterWriteStringField();
    if (!v35)
    {
LABEL_8:
      v41 = v44;
      if (v36)
        goto LABEL_9;
LABEL_18:
      v44 = v41;
      if (!v37)
      {
LABEL_11:
        v41 = v44;
        if (v145)
          goto LABEL_12;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v44 = v41;
    if (!v35)
      goto LABEL_8;
  }
  objc_opt_class();
  v203 = v44;
  v50 = CCValidateIsInstanceOfExpectedClass();
  v41 = v44;

  if (!v50)
    goto LABEL_25;
  CCPBDataWriterWriteStringField();
  if (!v36)
    goto LABEL_18;
LABEL_9:
  objc_opt_class();
  v202 = v41;
  v45 = CCValidateIsInstanceOfExpectedClass();
  v44 = v41;

  if (v45)
  {
    CCPBDataWriterWriteStringField();
    if (!v37)
      goto LABEL_11;
LABEL_19:
    objc_opt_class();
    v201 = v44;
    v51 = CCValidateIsInstanceOfExpectedClass();
    v41 = v44;

    if (v51)
    {
      CCPBDataWriterWriteStringField();
      if (v145)
      {
LABEL_12:
        objc_opt_class();
        v200 = v41;
        v46 = CCValidateIsInstanceOfExpectedClass();
        v44 = v41;

        if (v46)
        {
          CCPBDataWriterWriteStringField();
          goto LABEL_22;
        }
        goto LABEL_14;
      }
LABEL_21:
      v44 = v41;
LABEL_22:
      if (v148)
      {
        objc_opt_class();
        v199 = v44;
        v52 = CCValidateIsInstanceOfExpectedClass();
        v41 = v44;

        if (!v52)
        {
          v47 = v36;
          v48 = v37;
          CCSetError();
          v49 = 0;
LABEL_51:
          v53 = self;
          goto LABEL_141;
        }
        CCPBDataWriterWriteStringField();
      }
      else
      {
        v41 = v44;
      }
      v126 = v33;
      if (!v147)
      {
        v55 = v41;
        goto LABEL_40;
      }
      v47 = v36;
      v48 = v37;
      objc_opt_class();
      v198 = v41;
      v54 = CCValidateArrayValues();
      v55 = v41;

      if (v54)
      {
        v196 = 0u;
        v197 = 0u;
        v194 = 0u;
        v195 = 0u;
        v56 = v147;
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v194, v213, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v195;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v195 != v59)
                objc_enumerationMutation(v56);
              objc_msgSend(*(id *)(*((_QWORD *)&v194 + 1) + 8 * i), "data");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              CCPBDataWriterWriteDataField();

            }
            v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v194, v213, 16);
          }
          while (v58);
        }

        v33 = v126;
        v37 = v48;
        v36 = v47;
LABEL_40:
        if (v146)
        {
          v47 = v36;
          v48 = v37;
          objc_opt_class();
          v193 = v55;
          v62 = CCValidateArrayValues();
          v41 = v55;

          if (!v62)
            goto LABEL_138;
          v191 = 0u;
          v192 = 0u;
          v189 = 0u;
          v190 = 0u;
          v63 = v146;
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
          if (v64)
          {
            v65 = v64;
            v66 = *(_QWORD *)v190;
            do
            {
              for (j = 0; j != v65; ++j)
              {
                if (*(_QWORD *)v190 != v66)
                  objc_enumerationMutation(v63);
                objc_msgSend(*(id *)(*((_QWORD *)&v189 + 1) + 8 * j), "data");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
            }
            while (v65);
          }

          v33 = v126;
          v37 = v48;
          v36 = v47;
        }
        else
        {
          v41 = v55;
        }
        if (v144)
        {
          v47 = v36;
          v48 = v37;
          objc_opt_class();
          v188 = v41;
          v69 = CCValidateArrayValues();
          v70 = v41;

          if (!v69)
            goto LABEL_132;
          v186 = 0u;
          v187 = 0u;
          v184 = 0u;
          v185 = 0u;
          v71 = v144;
          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
          if (v72)
          {
            v73 = v72;
            v74 = *(_QWORD *)v185;
            do
            {
              for (k = 0; k != v73; ++k)
              {
                if (*(_QWORD *)v185 != v74)
                  objc_enumerationMutation(v71);
                objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * k), "data");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v184, v211, 16);
            }
            while (v73);
          }

          v33 = v126;
          v37 = v48;
          v36 = v47;
        }
        else
        {
          v70 = v41;
        }
        if (v143)
        {
          v47 = v36;
          v48 = v37;
          objc_opt_class();
          v183 = v70;
          v77 = CCValidateArrayValues();
          v41 = v70;

          if (!v77)
            goto LABEL_138;
          v181 = 0u;
          v182 = 0u;
          v179 = 0u;
          v180 = 0u;
          v78 = v143;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v179, v210, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v180;
            do
            {
              for (m = 0; m != v80; ++m)
              {
                if (*(_QWORD *)v180 != v81)
                  objc_enumerationMutation(v78);
                objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * m), "data");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v179, v210, 16);
            }
            while (v80);
          }

          v33 = v126;
          v37 = v48;
          v36 = v47;
        }
        else
        {
          v41 = v70;
        }
        if (v142)
        {
          v47 = v36;
          v48 = v37;
          objc_opt_class();
          v178 = v41;
          v84 = CCValidateArrayValues();
          v70 = v41;

          if (!v84)
            goto LABEL_132;
          v176 = 0u;
          v177 = 0u;
          v174 = 0u;
          v175 = 0u;
          v85 = v142;
          v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v174, v209, 16);
          if (v86)
          {
            v87 = v86;
            v88 = *(_QWORD *)v175;
            do
            {
              for (n = 0; n != v87; ++n)
              {
                if (*(_QWORD *)v175 != v88)
                  objc_enumerationMutation(v85);
                objc_msgSend(*(id *)(*((_QWORD *)&v174 + 1) + 8 * n), "data");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v174, v209, 16);
            }
            while (v87);
          }

          v33 = v126;
          v37 = v48;
          v36 = v47;
        }
        else
        {
          v70 = v41;
        }
        if (v141)
        {
          v47 = v36;
          v48 = v37;
          objc_opt_class();
          v173 = v70;
          v91 = CCValidateArrayValues();
          v41 = v70;

          if (!v91)
            goto LABEL_138;
          v171 = 0u;
          v172 = 0u;
          v169 = 0u;
          v170 = 0u;
          v92 = v141;
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v169, v208, 16);
          if (v93)
          {
            v94 = v93;
            v95 = *(_QWORD *)v170;
            do
            {
              for (ii = 0; ii != v94; ++ii)
              {
                if (*(_QWORD *)v170 != v95)
                  objc_enumerationMutation(v92);
                objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * ii), "data");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v169, v208, 16);
            }
            while (v94);
          }

          v33 = v126;
          v37 = v48;
          v36 = v47;
        }
        else
        {
          v41 = v70;
        }
        if (v140)
        {
          v47 = v36;
          v48 = v37;
          objc_opt_class();
          v168 = v41;
          v98 = CCValidateArrayValues();
          v70 = v41;

          if (!v98)
            goto LABEL_132;
          v166 = 0u;
          v167 = 0u;
          v164 = 0u;
          v165 = 0u;
          v99 = v140;
          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v164, v207, 16);
          if (v100)
          {
            v101 = v100;
            v102 = *(_QWORD *)v165;
            do
            {
              for (jj = 0; jj != v101; ++jj)
              {
                if (*(_QWORD *)v165 != v102)
                  objc_enumerationMutation(v99);
                objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * jj), "data");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v164, v207, 16);
            }
            while (v101);
          }

          v33 = v126;
          v37 = v48;
          v36 = v47;
        }
        else
        {
          v70 = v41;
        }
        if (v139)
        {
          objc_opt_class();
          v163 = v70;
          v105 = CCValidateIsInstanceOfExpectedClass();
          v41 = v70;

          if (!v105)
            goto LABEL_137;
          CCPBDataWriterWriteStringField();
        }
        else
        {
          v41 = v70;
        }
        if (v138)
        {
          objc_opt_class();
          v162 = v41;
          v106 = CCValidateIsInstanceOfExpectedClass();
          v70 = v41;

          if (!v106)
            goto LABEL_131;
          CCPBDataWriterWriteStringField();
        }
        else
        {
          v70 = v41;
        }
        if (v137)
        {
          objc_opt_class();
          v161 = v70;
          v107 = CCValidateIsInstanceOfExpectedClass();
          v41 = v70;

          if (!v107)
            goto LABEL_137;
          CCPBDataWriterWriteStringField();
        }
        else
        {
          v41 = v70;
        }
        if (v136)
        {
          objc_opt_class();
          v160 = v41;
          v108 = CCValidateIsInstanceOfExpectedClass();
          v70 = v41;

          if (!v108)
            goto LABEL_131;
          CCPBDataWriterWriteStringField();
        }
        else
        {
          v70 = v41;
        }
        if (v135)
        {
          objc_opt_class();
          v159 = v70;
          v109 = CCValidateIsInstanceOfExpectedClass();
          v41 = v70;

          if (!v109)
            goto LABEL_137;
          CCPBDataWriterWriteStringField();
        }
        else
        {
          v41 = v70;
        }
        if (!v134)
        {
          v70 = v41;
          goto LABEL_134;
        }
        objc_opt_class();
        v158 = v41;
        v110 = CCValidateIsInstanceOfExpectedClass();
        v70 = v41;

        if (v110)
        {
          CCPBDataWriterWriteStringField();
LABEL_134:
          if (!v133)
          {
            v41 = v70;
            goto LABEL_143;
          }
          objc_opt_class();
          v157 = v70;
          v111 = CCValidateIsInstanceOfExpectedClass();
          v41 = v70;

          if (v111)
          {
            CCPBDataWriterWriteStringField();
LABEL_143:
            v47 = v36;
            if (!v132)
            {
              v48 = v37;
              v70 = v41;
              goto LABEL_147;
            }
            v48 = v37;
            objc_opt_class();
            v156 = v41;
            v113 = CCValidateIsInstanceOfExpectedClass();
            v70 = v41;

            if (v113)
            {
              CCPBDataWriterWriteStringField();
LABEL_147:
              if (!v131)
              {
                v41 = v70;
                goto LABEL_151;
              }
              objc_opt_class();
              v155 = v70;
              v114 = CCValidateIsInstanceOfExpectedClass();
              v41 = v70;

              if (v114)
              {
                objc_msgSend(v131, "data");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

LABEL_151:
                if (!v129)
                {
                  v70 = v41;
                  goto LABEL_155;
                }
                objc_opt_class();
                v154 = v41;
                v116 = CCValidateIsInstanceOfExpectedClass();
                v70 = v41;

                if (v116)
                {
                  objc_msgSend(v129, "data");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  CCPBDataWriterWriteDataField();

LABEL_155:
                  if (v130)
                  {
                    objc_opt_class();
                    v153 = v70;
                    v118 = CCValidateArrayValues();
                    v41 = v70;

                    if (!v118)
                    {
                      CCSetError();
                      v49 = 0;
                      v53 = self;
                      v33 = v126;
                      goto LABEL_140;
                    }
                    v151 = 0u;
                    v152 = 0u;
                    v149 = 0u;
                    v150 = 0u;
                    v119 = v130;
                    v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v149, v206, 16);
                    if (v120)
                    {
                      v121 = v120;
                      v122 = *(_QWORD *)v150;
                      do
                      {
                        for (kk = 0; kk != v121; ++kk)
                        {
                          if (*(_QWORD *)v150 != v122)
                            objc_enumerationMutation(v119);
                          objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * kk), "data");
                          v124 = (void *)objc_claimAutoreleasedReturnValue();
                          CCPBDataWriterWriteDataField();

                        }
                        v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v149, v206, 16);
                      }
                      while (v121);
                    }

                    v33 = v126;
                  }
                  else
                  {
                    v41 = v70;
                  }
                  objc_msgSend(v39, "immutableData");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v125, a28);

                  v49 = v53;
LABEL_140:
                  v42 = v145;
                  goto LABEL_141;
                }
                goto LABEL_132;
              }
LABEL_138:
              CCSetError();
              v49 = 0;
              goto LABEL_139;
            }
LABEL_132:
            CCSetError();
            v49 = 0;
            v41 = v70;
LABEL_139:
            v53 = self;
            goto LABEL_140;
          }
LABEL_137:
          v47 = v36;
          v48 = v37;
          goto LABEL_138;
        }
LABEL_131:
        v47 = v36;
        v48 = v37;
        goto LABEL_132;
      }
      CCSetError();
      v49 = 0;
      v41 = v55;
      goto LABEL_51;
    }
LABEL_25:
    v47 = v36;
    v48 = v37;
    CCSetError();
    v49 = 0;
    goto LABEL_26;
  }
LABEL_14:
  v47 = v36;
  v48 = v37;
  CCSetError();
  v49 = 0;
  v41 = v44;
LABEL_26:
  v53 = self;
LABEL_141:

  return v49;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  int *v8;
  int *v9;
  void *v10;
  id v11;
  int *v12;
  int *v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  objc_class *v22;
  uint64_t v23;
  void *v24;
  CCContactPhoneNumber *v25;
  CCContactPhoneNumber *v26;
  void *v27;
  CCContactEmailAddress *v28;
  CCContactPostalAddress *v29;
  CCContactURLAddress *v30;
  CCContactSocialProfile *v31;
  CCContactInstantMessageAddress *v32;
  CCContactRelation *v33;
  CCContactDate *v34;
  objc_class *v35;
  uint64_t v36;
  CCContactDate *v37;
  void *v38;
  CCContactDate *v39;
  objc_class *v40;
  NSArray *v41;
  NSArray *phoneNumbers;
  NSArray *v43;
  NSArray *emailAddresses;
  NSArray *v45;
  NSArray *postalAddresses;
  NSArray *v47;
  NSArray *urlAddresses;
  NSArray *v49;
  NSArray *socialProfiles;
  NSArray *v51;
  NSArray *instantMessageAddresses;
  NSArray *v53;
  NSArray *relations;
  NSArray *v55;
  NSArray *dates;
  objc_class *v57;
  void *v58;
  void *v59;
  BOOL v60;
  id *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80[2];

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  v62 = a4;
  v63 = v6;
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
  {
    v67 = 0;
    v68 = 0;
    v65 = 0;
    v66 = 0;
    v64 = 0;
    v69 = 0;
    v70 = 0;
    v10 = 0;
    goto LABEL_87;
  }
  v10 = 0;
  v69 = 0;
  v70 = 0;
  v64 = 0;
  v65 = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v11 = 0;
  v12 = (int *)MEMORY[0x24BE15718];
  v13 = (int *)MEMORY[0x24BE15710];
LABEL_3:
  if (*(_QWORD *)&v7[*v12])
    v14 = 0;
  else
    v14 = v11 == 0;
  if (v14)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    while (1)
    {
      v18 = *v8;
      v19 = *(_QWORD *)&v7[v18];
      if (v19 == -1 || v19 >= *(_QWORD *)&v7[*v9])
        break;
      v20 = *(_BYTE *)(*(_QWORD *)&v7[*v13] + v19);
      *(_QWORD *)&v7[v18] = v19 + 1;
      v17 |= (unint64_t)(v20 & 0x7F) << v15;
      if ((v20 & 0x80) == 0)
        goto LABEL_17;
      v15 += 7;
      if (v16++ >= 9)
      {
        v17 = 0;
        if (*(_QWORD *)&v7[*v12])
          goto LABEL_87;
LABEL_18:
        switch((v17 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 16;
            goto LABEL_71;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 24;
            goto LABEL_71;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 32;
            goto LABEL_71;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 40;
            goto LABEL_71;
          case 5u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 48;
            goto LABEL_71;
          case 6u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 56;
            goto LABEL_71;
          case 7u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 64;
            goto LABEL_71;
          case 8u:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v68)
              v68 = (void *)objc_opt_new();
            v25 = [CCContactPhoneNumber alloc];
            v80[0] = 0;
            v26 = -[CCItemMessage initWithData:error:](v25, "initWithData:error:", v24, v80);
            v11 = v80[0];
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v68;
            goto LABEL_80;
          case 9u:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v67)
              v67 = (void *)objc_opt_new();
            v28 = [CCContactEmailAddress alloc];
            v79 = 0;
            v26 = -[CCItemMessage initWithData:error:](v28, "initWithData:error:", v24, &v79);
            v11 = v79;
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v67;
            goto LABEL_80;
          case 0xAu:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v66)
              v66 = (void *)objc_opt_new();
            v29 = [CCContactPostalAddress alloc];
            v78 = 0;
            v26 = -[CCItemMessage initWithData:error:](v29, "initWithData:error:", v24, &v78);
            v11 = v78;
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v66;
            goto LABEL_80;
          case 0xBu:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v65)
              v65 = (void *)objc_opt_new();
            v30 = [CCContactURLAddress alloc];
            v77 = 0;
            v26 = -[CCItemMessage initWithData:error:](v30, "initWithData:error:", v24, &v77);
            v11 = v77;
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v65;
            goto LABEL_80;
          case 0xCu:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v64)
              v64 = (void *)objc_opt_new();
            v31 = [CCContactSocialProfile alloc];
            v76 = 0;
            v26 = -[CCItemMessage initWithData:error:](v31, "initWithData:error:", v24, &v76);
            v11 = v76;
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v64;
            goto LABEL_80;
          case 0xDu:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v70)
              v70 = (void *)objc_opt_new();
            v32 = [CCContactInstantMessageAddress alloc];
            v75 = 0;
            v26 = -[CCItemMessage initWithData:error:](v32, "initWithData:error:", v24, &v75);
            v11 = v75;
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v70;
            goto LABEL_80;
          case 0xEu:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v69)
              v69 = (void *)objc_opt_new();
            v33 = [CCContactRelation alloc];
            v74 = 0;
            v26 = -[CCItemMessage initWithData:error:](v33, "initWithData:error:", v24, &v74);
            v11 = v74;
            if (v11 || !v26)
              goto LABEL_81;
            v27 = v69;
            goto LABEL_80;
          case 0xFu:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 128;
            goto LABEL_71;
          case 0x10u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 136;
            goto LABEL_71;
          case 0x11u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 144;
            goto LABEL_71;
          case 0x12u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 152;
            goto LABEL_71;
          case 0x13u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 160;
            goto LABEL_71;
          case 0x14u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 168;
            goto LABEL_71;
          case 0x15u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 176;
            goto LABEL_71;
          case 0x16u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            v23 = 184;
LABEL_71:
            v24 = *(Class *)((char *)&self->super.super.isa + v23);
            *(Class *)((char *)&self->super.super.isa + v23) = v22;
            goto LABEL_82;
          case 0x17u:
            v34 = [CCContactDate alloc];
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0;
            v35 = -[CCItemMessage initWithData:error:](v34, "initWithData:error:", v24, &v73);
            v11 = v73;
            v36 = 192;
            goto LABEL_74;
          case 0x18u:
            v37 = [CCContactDate alloc];
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = 0;
            v35 = -[CCItemMessage initWithData:error:](v37, "initWithData:error:", v24, &v72);
            v11 = v72;
            v36 = 200;
LABEL_74:
            v38 = *(Class *)((char *)&self->super.super.isa + v36);
            *(Class *)((char *)&self->super.super.isa + v36) = v35;

            goto LABEL_82;
          case 0x19u:
            CCPBReaderReadDataNoCopy();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
              v10 = (void *)objc_opt_new();
            v39 = [CCContactDate alloc];
            v71 = 0;
            v26 = -[CCItemMessage initWithData:error:](v39, "initWithData:error:", v24, &v71);
            v11 = v71;
            if (!v11 && v26)
            {
              v27 = v10;
LABEL_80:
              objc_msgSend(v27, "addObject:", v26, v62, v63);
            }
LABEL_81:

            goto LABEL_82;
          default:
            if ((CCPBReaderSkipValueWithTag() & 1) != 0)
            {
              v11 = 0;
            }
            else
            {
              v40 = (objc_class *)objc_opt_class();
              NSStringFromClass(v40);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              CCSkipFieldErrorForMessage();
              v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

            }
            if (*(_QWORD *)&v7[*v8] >= *(_QWORD *)&v7[*v9])
              goto LABEL_88;
            goto LABEL_3;
        }
      }
    }
    *(_QWORD *)&v7[*v12] = 1;
LABEL_17:
    if (!*(_QWORD *)&v7[*v12])
      goto LABEL_18;
LABEL_87:
    v11 = 0;
  }
LABEL_88:
  v41 = (NSArray *)objc_msgSend(v68, "copy", v62);
  phoneNumbers = self->_phoneNumbers;
  self->_phoneNumbers = v41;

  v43 = (NSArray *)objc_msgSend(v67, "copy");
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v43;

  v45 = (NSArray *)objc_msgSend(v66, "copy");
  postalAddresses = self->_postalAddresses;
  self->_postalAddresses = v45;

  v47 = (NSArray *)objc_msgSend(v65, "copy");
  urlAddresses = self->_urlAddresses;
  self->_urlAddresses = v47;

  v49 = (NSArray *)objc_msgSend(v64, "copy");
  socialProfiles = self->_socialProfiles;
  self->_socialProfiles = v49;

  v51 = (NSArray *)objc_msgSend(v70, "copy");
  instantMessageAddresses = self->_instantMessageAddresses;
  self->_instantMessageAddresses = v51;

  v53 = (NSArray *)objc_msgSend(v69, "copy");
  relations = self->_relations;
  self->_relations = v53;

  v55 = (NSArray *)objc_msgSend(v10, "copy");
  dates = self->_dates;
  self->_dates = v55;

  if (v11)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v7[*MEMORY[0x24BE15718]])
    {
      v60 = 1;
      goto LABEL_93;
    }
    v57 = (objc_class *)objc_opt_class();
    NSStringFromClass(v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v60 = 0;
LABEL_93:

  return v60;
}

- (NSString)givenName
{
  return (NSString *)(id)-[NSString copy](self->_givenName, "copy");
}

- (NSString)middleName
{
  return (NSString *)(id)-[NSString copy](self->_middleName, "copy");
}

- (NSString)familyName
{
  return (NSString *)(id)-[NSString copy](self->_familyName, "copy");
}

- (NSString)previousFamilyName
{
  return (NSString *)(id)-[NSString copy](self->_previousFamilyName, "copy");
}

- (NSString)nickname
{
  return (NSString *)(id)-[NSString copy](self->_nickname, "copy");
}

- (NSString)namePrefix
{
  return (NSString *)(id)-[NSString copy](self->_namePrefix, "copy");
}

- (NSString)nameSuffix
{
  return (NSString *)(id)-[NSString copy](self->_nameSuffix, "copy");
}

- (NSArray)phoneNumbers
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_phoneNumbers, 1);
}

- (NSArray)emailAddresses
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_emailAddresses, 1);
}

- (NSArray)postalAddresses
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_postalAddresses, 1);
}

- (NSArray)urlAddresses
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_urlAddresses, 1);
}

- (NSArray)socialProfiles
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_socialProfiles, 1);
}

- (NSArray)instantMessageAddresses
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_instantMessageAddresses, 1);
}

- (NSArray)relations
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_relations, 1);
}

- (NSString)organizationName
{
  return (NSString *)(id)-[NSString copy](self->_organizationName, "copy");
}

- (NSString)departmentName
{
  return (NSString *)(id)-[NSString copy](self->_departmentName, "copy");
}

- (NSString)jobTitle
{
  return (NSString *)(id)-[NSString copy](self->_jobTitle, "copy");
}

- (NSString)phoneticGivenName
{
  return (NSString *)(id)-[NSString copy](self->_phoneticGivenName, "copy");
}

- (NSString)phoneticMiddleName
{
  return (NSString *)(id)-[NSString copy](self->_phoneticMiddleName, "copy");
}

- (NSString)phoneticFamilyName
{
  return (NSString *)(id)-[NSString copy](self->_phoneticFamilyName, "copy");
}

- (NSString)phoneticOrganizationName
{
  return (NSString *)(id)-[NSString copy](self->_phoneticOrganizationName, "copy");
}

- (NSString)note
{
  return (NSString *)(id)-[NSString copy](self->_note, "copy");
}

- (CCContactDate)birthday
{
  return (CCContactDate *)(id)-[CCContactDate copy](self->_birthday, "copy");
}

- (CCContactDate)nonGregorianBirthday
{
  return (CCContactDate *)(id)-[CCContactDate copy](self->_nonGregorianBirthday, "copy");
}

- (NSArray)dates
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_dates, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
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
  void (**v30)(id, void *);

  v30 = (void (**)(id, void *))a3;
  if (self->_givenName)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19679, self->_givenName);
    v30[2](v30, v5);

  }
  if (self->_middleName)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19680, self->_middleName);
    v30[2](v30, v6);

  }
  if (self->_familyName)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19681, self->_familyName);
    v30[2](v30, v7);

  }
  if (self->_previousFamilyName)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19682, self->_previousFamilyName);
    v30[2](v30, v8);

  }
  if (self->_nickname)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19683, self->_nickname);
    v30[2](v30, v9);

  }
  if (self->_namePrefix)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19684, self->_namePrefix);
    v30[2](v30, v10);

  }
  if (self->_nameSuffix)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19685, self->_nameSuffix);
    v30[2](v30, v11);

  }
  if (self->_phoneNumbers)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19686, self->_phoneNumbers);
    v30[2](v30, v12);

  }
  if (self->_emailAddresses)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19687, self->_emailAddresses);
    v30[2](v30, v13);

  }
  if (self->_postalAddresses)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19688, self->_postalAddresses);
    v30[2](v30, v14);

  }
  if (self->_urlAddresses)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19689, self->_urlAddresses);
    v30[2](v30, v15);

  }
  if (self->_socialProfiles)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19690, self->_socialProfiles);
    v30[2](v30, v16);

  }
  if (self->_instantMessageAddresses)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19691, self->_instantMessageAddresses);
    v30[2](v30, v17);

  }
  if (self->_relations)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19692, self->_relations);
    v30[2](v30, v18);

  }
  if (self->_organizationName)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19693, self->_organizationName);
    v30[2](v30, v19);

  }
  if (self->_departmentName)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19694, self->_departmentName);
    v30[2](v30, v20);

  }
  if (self->_jobTitle)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19695, self->_jobTitle);
    v30[2](v30, v21);

  }
  if (self->_phoneticGivenName)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19696, self->_phoneticGivenName);
    v30[2](v30, v22);

  }
  if (self->_phoneticMiddleName)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19697, self->_phoneticMiddleName);
    v30[2](v30, v23);

  }
  if (self->_phoneticFamilyName)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19698, self->_phoneticFamilyName);
    v30[2](v30, v24);

  }
  if (self->_phoneticOrganizationName)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19699, self->_phoneticOrganizationName);
    v30[2](v30, v25);

  }
  if (self->_note)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19700, self->_note);
    v30[2](v30, v26);

  }
  if (self->_birthday)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 19701, self->_birthday);
    v30[2](v30, v27);

  }
  if (self->_nonGregorianBirthday)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 19702, self->_nonGregorianBirthday);
    v30[2](v30, v28);

  }
  if (self->_dates)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", 19705, self->_dates);
    v30[2](v30, v29);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
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
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_givenName)
  {
    -[CCContactContent givenName](self, "givenName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("givenName"));

  }
  if (self->_middleName)
  {
    -[CCContactContent middleName](self, "middleName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("middleName"));

  }
  if (self->_familyName)
  {
    -[CCContactContent familyName](self, "familyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("familyName"));

  }
  if (self->_previousFamilyName)
  {
    -[CCContactContent previousFamilyName](self, "previousFamilyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("previousFamilyName"));

  }
  if (self->_nickname)
  {
    -[CCContactContent nickname](self, "nickname");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nickname"));

  }
  if (self->_namePrefix)
  {
    -[CCContactContent namePrefix](self, "namePrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("namePrefix"));

  }
  if (self->_nameSuffix)
  {
    -[CCContactContent nameSuffix](self, "nameSuffix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("nameSuffix"));

  }
  v11 = (void *)objc_opt_new();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  -[CCContactContent phoneNumbers](self, "phoneNumbers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v110;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v110 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * v16), "jsonDictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("phoneNumbers"));
  v18 = (void *)objc_opt_new();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  -[CCContactContent emailAddresses](self, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v106;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v106 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * v23), "jsonDictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
    }
    while (v21);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("emailAddresses"));
  v25 = (void *)objc_opt_new();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  -[CCContactContent postalAddresses](self, "postalAddresses");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v102;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v102 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * v30), "jsonDictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
    }
    while (v28);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("postalAddresses"));
  v32 = (void *)objc_opt_new();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  -[CCContactContent urlAddresses](self, "urlAddresses");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v98;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v98 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * v37), "jsonDictionary");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v38);

        ++v37;
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v97, v117, 16);
    }
    while (v35);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("urlAddresses"));
  v39 = (void *)objc_opt_new();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[CCContactContent socialProfiles](self, "socialProfiles");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v94;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v94 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * v44), "jsonDictionary");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v93, v116, 16);
    }
    while (v42);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("socialProfiles"));
  v46 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  -[CCContactContent instantMessageAddresses](self, "instantMessageAddresses");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v90;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v90 != v50)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v51), "jsonDictionary");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v52);

        ++v51;
      }
      while (v49 != v51);
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
    }
    while (v49);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("instantMessageAddresses"));
  v53 = (void *)objc_opt_new();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  -[CCContactContent relations](self, "relations");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v86;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v86 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v58), "jsonDictionary");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v59);

        ++v58;
      }
      while (v56 != v58);
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v85, v114, 16);
    }
    while (v56);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("relations"));
  if (self->_organizationName)
  {
    -[CCContactContent organizationName](self, "organizationName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("organizationName"));

  }
  if (self->_departmentName)
  {
    -[CCContactContent departmentName](self, "departmentName");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("departmentName"));

  }
  if (self->_jobTitle)
  {
    -[CCContactContent jobTitle](self, "jobTitle");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("jobTitle"));

  }
  if (self->_phoneticGivenName)
  {
    -[CCContactContent phoneticGivenName](self, "phoneticGivenName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("phoneticGivenName"));

  }
  if (self->_phoneticMiddleName)
  {
    -[CCContactContent phoneticMiddleName](self, "phoneticMiddleName");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("phoneticMiddleName"));

  }
  if (self->_phoneticFamilyName)
  {
    -[CCContactContent phoneticFamilyName](self, "phoneticFamilyName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("phoneticFamilyName"));

  }
  if (self->_phoneticOrganizationName)
  {
    -[CCContactContent phoneticOrganizationName](self, "phoneticOrganizationName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("phoneticOrganizationName"));

  }
  if (self->_note)
  {
    -[CCContactContent note](self, "note");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("note"));

  }
  if (self->_birthday)
  {
    -[CCContactContent birthday](self, "birthday");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "jsonDictionary");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("birthday"));

  }
  if (self->_nonGregorianBirthday)
  {
    -[CCContactContent nonGregorianBirthday](self, "nonGregorianBirthday");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "jsonDictionary");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("nonGregorianBirthday"));

  }
  v72 = (void *)objc_opt_new();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  -[CCContactContent dates](self, "dates", 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v81, v113, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v82;
    do
    {
      v77 = 0;
      do
      {
        if (*(_QWORD *)v82 != v76)
          objc_enumerationMutation(v73);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * v77), "jsonDictionary");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addObject:", v78);

        ++v77;
      }
      while (v75 != v77);
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v81, v113, 16);
    }
    while (v75);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("dates"));
  v79 = (void *)objc_msgSend(v3, "copy");

  return v79;
}

- (CCContactContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  CCContactPhoneNumber *v22;
  CCContactPhoneNumber *v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  CCContactEmailAddress *v37;
  CCContactEmailAddress *v38;
  id v39;
  BOOL v40;
  void *v41;
  CCContactContent *v42;
  uint64_t v43;
  void *v44;
  char v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  CCContactPostalAddress *v53;
  CCContactPostalAddress *v54;
  id v55;
  BOOL v56;
  void *v57;
  uint64_t v58;
  void *v59;
  char v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  uint64_t v67;
  CCContactURLAddress *v68;
  CCContactURLAddress *v69;
  id v70;
  BOOL v71;
  void *v72;
  uint64_t v73;
  void *v74;
  char v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  void *v83;
  uint64_t v84;
  CCContactSocialProfile *v85;
  CCContactSocialProfile *v86;
  id v87;
  BOOL v88;
  void *v89;
  uint64_t v90;
  void *v91;
  char v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t ii;
  uint64_t v99;
  CCContactInstantMessageAddress *v100;
  CCContactInstantMessageAddress *v101;
  id v102;
  BOOL v103;
  void *v104;
  uint64_t v105;
  void *v106;
  char v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t jj;
  uint64_t v116;
  CCContactRelation *v117;
  CCContactRelation *v118;
  id v119;
  BOOL v120;
  void *v121;
  uint64_t v122;
  StructDescriptor **v123;
  CCContactDate *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  CCContactDate *v130;
  id v131;
  CCContactDate *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t kk;
  uint64_t v137;
  CCContactDate *v138;
  CCContactDate *v139;
  id v140;
  BOOL v141;
  void *v142;
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
  id v157;
  void *v158;
  void *v159;
  void *v160;
  CCContactContent *v161;
  CCContactContent *v162;
  CCContactContent *v163;
  CCContactContent *v164;
  CCContactContent *v165;
  CCContactContent *v166;
  CCContactContent *v167;
  id *v168;
  id *v169;
  id *v170;
  id *v171;
  id *v172;
  id *v173;
  id *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  char v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  void *v198;
  id v199;
  id v200;
  id v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  id v206;
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  id v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  id v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  id v224;
  id v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  id v230;
  id v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  id v236;
  id v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  id v242;
  uint64_t v243;
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  uint64_t v252;

  v252 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v243 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("givenName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("middleName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familyName"));
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("previousFamilyName"));
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nickname"));
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("namePrefix"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nameSuffix"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneNumbers"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      v242 = v8;
      v13 = CCValidateIsInstanceOfExpectedClass();
      v14 = v8;

      if ((v13 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v15 = v12;
LABEL_161:

        v8 = v14;
        goto LABEL_162;
      }
      v168 = a4;
      v183 = v10;
      v161 = self;
      v15 = (void *)objc_opt_new();
      v238 = 0u;
      v239 = 0u;
      v240 = 0u;
      v241 = 0u;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v238, v251, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v239;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v239 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * i);
            v22 = [CCContactPhoneNumber alloc];
            v237 = 0;
            v23 = -[CCContactPhoneNumber initWithJSONDictionary:error:](v22, "initWithJSONDictionary:error:", v21, &v237);
            v24 = v237;
            if (v23)
              v25 = v24 == 0;
            else
              v25 = 0;
            if (!v25)
            {
              v41 = v24;
              CCSetError();

              v42 = 0;
              v15 = v16;
              self = v161;
              v10 = v183;
              goto LABEL_161;
            }
            objc_msgSend(v15, "addObject:", v23);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v238, v251, 16);
        }
        while (v18);
      }

      self = v161;
      a4 = v168;
    }
    else
    {
      v15 = 0;
      v14 = v8;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emailAddresses"));
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      objc_opt_class();
      v236 = v14;
      v28 = CCValidateIsInstanceOfExpectedClass();
      v29 = v14;

      if ((v28 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v30 = v27;
LABEL_160:

        v14 = v29;
        goto LABEL_161;
      }
      v169 = a4;
      v176 = v9;
      v184 = v10;
      v162 = self;
      v30 = (void *)objc_opt_new();
      v232 = 0u;
      v233 = 0u;
      v234 = 0u;
      v235 = 0u;
      v31 = v27;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v232, v250, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v233;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v233 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v232 + 1) + 8 * j);
            v37 = [CCContactEmailAddress alloc];
            v231 = 0;
            v38 = -[CCContactEmailAddress initWithJSONDictionary:error:](v37, "initWithJSONDictionary:error:", v36, &v231);
            v39 = v231;
            if (v38)
              v40 = v39 == 0;
            else
              v40 = 0;
            if (!v40)
            {
              v57 = v39;
              CCSetError();

              v42 = 0;
              v30 = v31;
              self = v162;
              v9 = v176;
              v10 = v184;
              goto LABEL_160;
            }
            objc_msgSend(v30, "addObject:", v38);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v232, v250, 16);
        }
        while (v33);
      }

      a4 = v169;
      v9 = v176;
    }
    else
    {
      v184 = v10;
      v30 = 0;
      v29 = v14;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalAddresses"));
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = (void *)v43;
      objc_opt_class();
      v230 = v29;
      v45 = CCValidateIsInstanceOfExpectedClass();
      v46 = v29;

      if ((v45 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v47 = v44;
        v10 = v184;
LABEL_159:

        v29 = v46;
        goto LABEL_160;
      }
      v170 = a4;
      v177 = v9;
      v163 = self;
      v187 = (void *)objc_opt_new();
      v226 = 0u;
      v227 = 0u;
      v228 = 0u;
      v229 = 0u;
      v47 = v44;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v226, v249, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v227;
        do
        {
          for (k = 0; k != v49; ++k)
          {
            if (*(_QWORD *)v227 != v50)
              objc_enumerationMutation(v47);
            v52 = *(_QWORD *)(*((_QWORD *)&v226 + 1) + 8 * k);
            v53 = [CCContactPostalAddress alloc];
            v225 = 0;
            v54 = -[CCContactPostalAddress initWithJSONDictionary:error:](v53, "initWithJSONDictionary:error:", v52, &v225);
            v55 = v225;
            if (v54)
              v56 = v55 == 0;
            else
              v56 = 0;
            if (!v56)
            {
              v72 = v55;
              CCSetError();

              v42 = 0;
              self = v163;
              v9 = v177;
              v10 = v184;
              goto LABEL_159;
            }
            objc_msgSend(v187, "addObject:", v54);

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v226, v249, 16);
        }
        while (v49);
      }

      self = v163;
      a4 = v170;
      v9 = v177;
    }
    else
    {
      v187 = 0;
      v46 = v29;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("urlAddresses"));
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      objc_opt_class();
      v224 = v46;
      v60 = CCValidateIsInstanceOfExpectedClass();
      v61 = v46;

      if ((v60 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v62 = v59;
        v10 = v184;
LABEL_158:

        v46 = v61;
        v47 = v187;
        goto LABEL_159;
      }
      v171 = a4;
      v178 = v9;
      v164 = self;
      v160 = (void *)objc_opt_new();
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      v223 = 0u;
      v62 = v59;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v220, v248, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v221;
        do
        {
          for (m = 0; m != v64; ++m)
          {
            if (*(_QWORD *)v221 != v65)
              objc_enumerationMutation(v62);
            v67 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * m);
            v68 = [CCContactURLAddress alloc];
            v219 = 0;
            v69 = -[CCContactURLAddress initWithJSONDictionary:error:](v68, "initWithJSONDictionary:error:", v67, &v219);
            v70 = v219;
            if (v69)
              v71 = v70 == 0;
            else
              v71 = 0;
            if (!v71)
            {
              v89 = v70;
              CCSetError();

              v42 = 0;
              self = v164;
              v9 = v178;
              v10 = v184;
              goto LABEL_158;
            }
            objc_msgSend(v160, "addObject:", v69);

          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v220, v248, 16);
        }
        while (v64);
      }

      self = v164;
      a4 = v171;
      v9 = v178;
    }
    else
    {
      v160 = 0;
      v61 = v46;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socialProfiles"));
    v73 = objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      v74 = (void *)v73;
      objc_opt_class();
      v218 = v61;
      v75 = CCValidateIsInstanceOfExpectedClass();
      v76 = v61;

      if ((v75 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v77 = v74;
        v10 = v184;
LABEL_157:

        v61 = v76;
        v62 = v160;
        goto LABEL_158;
      }
      v157 = v76;
      v172 = a4;
      v179 = v9;
      v165 = self;
      v77 = (void *)objc_opt_new();
      v214 = 0u;
      v215 = 0u;
      v216 = 0u;
      v217 = 0u;
      v78 = v74;
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v214, v247, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v215;
        do
        {
          for (n = 0; n != v80; ++n)
          {
            v83 = v77;
            if (*(_QWORD *)v215 != v81)
              objc_enumerationMutation(v78);
            v84 = *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * n);
            v85 = [CCContactSocialProfile alloc];
            v213 = 0;
            v86 = -[CCContactSocialProfile initWithJSONDictionary:error:](v85, "initWithJSONDictionary:error:", v84, &v213);
            v87 = v213;
            if (v86)
              v88 = v87 == 0;
            else
              v88 = 0;
            if (!v88)
            {
              v104 = v87;
              CCSetError();

              v42 = 0;
              v77 = v78;
              self = v165;
              v9 = v179;
              v10 = v184;
              v76 = v157;
              goto LABEL_157;
            }
            v77 = v83;
            objc_msgSend(v83, "addObject:", v86);

          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v214, v247, 16);
        }
        while (v80);
      }

      self = v165;
      a4 = v172;
      v9 = v179;
      v61 = v157;
    }
    else
    {
      v77 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("instantMessageAddresses"));
    v90 = objc_claimAutoreleasedReturnValue();
    v155 = v77;
    if (v90)
    {
      v91 = (void *)v90;
      objc_opt_class();
      v212 = v61;
      v92 = CCValidateIsInstanceOfExpectedClass();
      v93 = v61;

      if ((v92 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v61 = v93;
        v94 = v91;
        v10 = v184;
LABEL_120:
        v77 = v155;
        goto LABEL_156;
      }
      v173 = a4;
      v180 = v9;
      v166 = self;
      v158 = (void *)objc_opt_new();
      v208 = 0u;
      v209 = 0u;
      v210 = 0u;
      v211 = 0u;
      v61 = v93;
      v94 = v91;
      v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v208, v246, 16);
      if (v95)
      {
        v96 = v95;
        v97 = *(_QWORD *)v209;
        do
        {
          for (ii = 0; ii != v96; ++ii)
          {
            if (*(_QWORD *)v209 != v97)
              objc_enumerationMutation(v94);
            v99 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * ii);
            v100 = [CCContactInstantMessageAddress alloc];
            v207 = 0;
            v101 = -[CCContactInstantMessageAddress initWithJSONDictionary:error:](v100, "initWithJSONDictionary:error:", v99, &v207);
            v102 = v207;
            if (v101)
              v103 = v102 == 0;
            else
              v103 = 0;
            if (!v103)
            {
              v121 = v102;
              CCSetError();

              v42 = 0;
              self = v166;
              v9 = v180;
              v10 = v184;
              goto LABEL_120;
            }
            objc_msgSend(v158, "addObject:", v101);

          }
          v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v208, v246, 16);
        }
        while (v96);
      }

      self = v166;
      a4 = v173;
      v9 = v180;
      v77 = v155;
    }
    else
    {
      v158 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relations"));
    v105 = objc_claimAutoreleasedReturnValue();
    v10 = v184;
    if (v105)
    {
      v106 = (void *)v105;
      objc_opt_class();
      v206 = v61;
      v107 = CCValidateIsInstanceOfExpectedClass();
      v108 = v61;
      v109 = v61;
      v110 = v108;

      v154 = v110;
      if ((v107 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v111 = v106;
LABEL_127:
        v77 = v155;
        v94 = v158;
        goto LABEL_155;
      }
      v174 = a4;
      v181 = v9;
      v156 = (void *)objc_opt_new();
      v202 = 0u;
      v203 = 0u;
      v204 = 0u;
      v205 = 0u;
      v111 = v106;
      v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v202, v245, 16);
      if (v112)
      {
        v113 = v112;
        v114 = *(_QWORD *)v203;
        do
        {
          for (jj = 0; jj != v113; ++jj)
          {
            if (*(_QWORD *)v203 != v114)
              objc_enumerationMutation(v111);
            v116 = *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * jj);
            v117 = [CCContactRelation alloc];
            v201 = 0;
            v118 = -[CCContactRelation initWithJSONDictionary:error:](v117, "initWithJSONDictionary:error:", v116, &v201);
            v119 = v201;
            if (v118)
              v120 = v119 == 0;
            else
              v120 = 0;
            if (!v120)
            {
              v127 = v119;
              CCSetError();

              v42 = 0;
              v9 = v181;
              v10 = v184;
              goto LABEL_127;
            }
            objc_msgSend(v156, "addObject:", v118);

          }
          v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v202, v245, 16);
        }
        while (v113);
      }

      v9 = v181;
      v10 = v184;
      a4 = v174;
      v77 = v155;
    }
    else
    {
      v156 = 0;
      v154 = v61;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("organizationName"));
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("departmentName"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("jobTitle"));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticGivenName"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticMiddleName"));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticFamilyName"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticOrganizationName"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("note"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("birthday"));
    v122 = objc_claimAutoreleasedReturnValue();
    v123 = off_25101F000;
    if (v122)
    {
      v200 = 0;
      v175 = (void *)v122;
      v124 = -[CCContactDate initWithJSONDictionary:error:]([CCContactDate alloc], "initWithJSONDictionary:error:", v122, &v200);
      v125 = v200;
      v126 = v125;
      if (!v124 || v125)
      {
        CCSetError();
        v42 = 0;
        v153 = v126;
        v94 = v158;
LABEL_154:

        v111 = v156;
LABEL_155:

        v61 = v154;
LABEL_156:

        v76 = v61;
        goto LABEL_157;
      }

      v175 = v124;
      v123 = off_25101F000;
    }
    else
    {
      v175 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nonGregorianBirthday"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (v128)
    {
      v129 = objc_alloc((Class)v123[467]);
      v199 = 0;
      v153 = v128;
      v128 = (void *)objc_msgSend(v129, "initWithJSONDictionary:error:", v128, &v199);
      v130 = (CCContactDate *)v199;
      v124 = v130;
      if (!v128 || v130)
      {
        CCSetError();

        v42 = 0;
        goto LABEL_153;
      }

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dates"));
    v124 = (CCContactDate *)objc_claimAutoreleasedReturnValue();
    v153 = v128;
    if (!v124)
    {
LABEL_150:
      v144 = v128;
      v94 = v158;
      v77 = v155;
      v42 = -[CCContactContent initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:]([CCContactContent alloc], "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", v9, v10, v192, v191, v190, v189, v188, v15, v30, v187, v160, v155, v158, v156,
              v152,
              v151,
              v150,
              v149,
              v148,
              v147,
              v146,
              v145,
              v175,
              v144,
              v124,
              a4);
      goto LABEL_154;
    }
    objc_opt_class();
    v198 = v154;
    v185 = CCValidateIsInstanceOfExpectedClass();
    v131 = v154;

    if ((v185 & 1) != 0)
    {
      v154 = v131;
      v159 = v30;
      v182 = v9;
      v186 = v10;
      v167 = self;
      v132 = (CCContactDate *)objc_opt_new();
      v194 = 0u;
      v195 = 0u;
      v196 = 0u;
      v197 = 0u;
      v124 = v124;
      v133 = -[CCContactDate countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v194, v244, 16);
      if (v133)
      {
        v134 = v133;
        v135 = *(_QWORD *)v195;
        do
        {
          for (kk = 0; kk != v134; ++kk)
          {
            if (*(_QWORD *)v195 != v135)
              objc_enumerationMutation(v124);
            v137 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * kk);
            v138 = [CCContactDate alloc];
            v193 = 0;
            v139 = -[CCContactDate initWithJSONDictionary:error:](v138, "initWithJSONDictionary:error:", v137, &v193);
            v140 = v193;
            if (v139)
              v141 = v140 == 0;
            else
              v141 = 0;
            if (!v141)
            {
              v142 = v140;
              CCSetError();

              v42 = 0;
              self = v167;
              v9 = v182;
              v10 = v186;
              v30 = v159;
              goto LABEL_152;
            }
            -[CCContactDate addObject:](v132, "addObject:", v139);

          }
          v134 = -[CCContactDate countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v194, v244, 16);
        }
        while (v134);
      }

      self = v167;
      v9 = v182;
      v10 = v186;
      v30 = v159;
      v124 = v132;
      v128 = v153;
      goto LABEL_150;
    }
    CCSetError();
    v42 = 0;
    v154 = v131;
LABEL_152:
    v77 = v155;
LABEL_153:
    v94 = v158;
    goto LABEL_154;
  }
  CCSetError();
  v42 = 0;
LABEL_162:

  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

+ (unsigned)itemType
{
  return 19668;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 19668) > 0x6D)
    return 0;
  else
    return *(&off_25102FC18 + (unsigned __int16)(a3 - 19668));
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end

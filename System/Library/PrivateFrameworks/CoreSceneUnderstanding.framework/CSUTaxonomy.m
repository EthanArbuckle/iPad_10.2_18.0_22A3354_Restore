@implementation CSUTaxonomy

- (CSUTaxonomy)initWithManifestPath:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CSUTaxonomy *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *manifest;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD);
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *name;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString *version;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  CSUTaxonomy *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  BOOL v86;
  BOOL v87;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  CSUVocabulary *v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  id started;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSDictionary *vocabularies;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  CSUTaxonomy *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSArray *vocabularyNames;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  CSUTaxonomy *v141;
  id v142;
  CSUTaxonomy *v143;
  void *v144;
  const char *v145;
  id v146;
  id v147;
  const char *v148;
  uint64_t v149;
  id v150;
  id v151;
  const char *v153;
  uint64_t v154;
  id v155;
  const char *v156;
  uint64_t v157;
  id v158;
  id v159;
  CSUTaxonomy *v160;
  NSDictionary *labelAttributes;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  id v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t i;
  uint64_t v185;
  void *v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  NSDictionary *v194;
  uint64_t v195;
  _Unwind_Exception *exception_object;
  void *v197;
  CSUTaxonomy *obj;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  CSUTaxonomy *v204;
  void *v205;
  void *v206;
  id v207;
  void *v208;
  id v209;
  id v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  void *v215;
  _QWORD v216[4];
  CSUTaxonomy *v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _QWORD v222[4];
  id v223;
  id v224;
  objc_super v225;
  id **v226;
  id *v227;
  _BYTE v228[128];
  _BYTE v229[128];
  uint64_t v230;

  v230 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v226 = &v227;
  v227 = a4;
  v225.receiver = self;
  v225.super_class = (Class)CSUTaxonomy;
  v11 = -[CSUTaxonomy init](&v225, sel_init);
  if (!v11)
  {
    if (v227)
    {
      objc_msgSend_errorForMemoryAllocationFailure(CSUError, v7, v8, v9, v10);
      v142 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
      v143 = 0;
      *v227 = v142;
      goto LABEL_55;
    }
LABEL_38:
    v143 = 0;
    goto LABEL_55;
  }
  if (!v6)
  {
    if (v227)
    {
      objc_msgSend_errorForInvalidArgument_named_(CSUError, v7, 0, (uint64_t)CFSTR("taxonomy manifest path"), v10);
      v142 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  v12 = (void *)MEMORY[0x24BDBCE70];
  v210 = v6;
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v7, (uint64_t)v6, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = 0;
  objc_msgSend_dictionaryWithContentsOfURL_error_(v12, v14, (uint64_t)v13, (uint64_t)&v224, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v209 = v224;
  manifest = v11->_manifest;
  v11->_manifest = (NSDictionary *)v16;

  if (v11->_manifest)
  {
    objc_msgSend_stringByDeletingLastPathComponent(v6, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v222[0] = MEMORY[0x24BDAC760];
    v222[1] = 3221225472;
    v222[2] = sub_23A012950;
    v222[3] = &unk_250B0E400;
    v207 = v22;
    v223 = v207;
    v23 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B8403EC](v222);
    objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v24, (uint64_t)CFSTR("formatVersion"), v25, v26);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v27, (uint64_t)CFSTR("name"), v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v30;

    objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v32, (uint64_t)CFSTR("version"), v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    version = v11->_version;
    v11->_version = (NSString *)v35;

    objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v37, (uint64_t)CFSTR("size"), v38, v39);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v40, (uint64_t)CFSTR("vocabularies"), v41, v42);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    if (v208)
    {
      if ((objc_msgSend_isEqualToString_(v208, v43, (uint64_t)CFSTR("1.0.0"), v44, v45) & 1) == 0)
      {
        objc_msgSend_stringByAppendingString_(CFSTR("Unhandled taxonomy manifest format version "), v46, (uint64_t)v208, v48, v49);
        v150 = (id)objc_claimAutoreleasedReturnValue();
        if (v227)
        {
          objc_msgSend_errorWithCode_message_(CSUError, v148, 6, (uint64_t)v150, v149);
          v151 = (id)objc_claimAutoreleasedReturnValue();
          *v227 = v151;
        }

        goto LABEL_51;
      }
      if (v11->_name && v11->_version && v206 && v205)
      {
        v50 = objc_msgSend_unsignedLongValue(v206, v46, v47, v48, v49);
        v11->_internalCount = v50;
        if (v50)
        {
          v51 = objc_alloc(MEMORY[0x24BDBCED8]);
          v56 = objc_msgSend_count(v205, v52, v53, v54, v55);
          v197 = (void *)objc_msgSend_initWithCapacity_(v51, v57, v56, v58, v59);
          v220 = 0u;
          v221 = 0u;
          v218 = 0u;
          v219 = 0u;
          v60 = v205;
          v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v218, (uint64_t)v229, 16);
          if (!v62)
            goto LABEL_30;
          exception_object = *(_Unwind_Exception **)v219;
          obj = v60;
LABEL_13:
          v195 = v62;
          v66 = 0;
          while (1)
          {
            if (*(_Unwind_Exception **)v219 != exception_object)
              objc_enumerationMutation(obj);
            v67 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * v66);
            objc_msgSend_objectForKey_(obj, v63, v67, v64, v65);
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v199, v68, (uint64_t)CFSTR("file"), v69, v70);
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v199, v71, (uint64_t)CFSTR("size"), v72, v73);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v199, v74, (uint64_t)CFSTR("visibleSize"), v75, v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v199, v78, (uint64_t)CFSTR("startIndex"), v79, v80);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = !v203 || v201 == 0;
            v87 = v86 || v85 == 0;
            if (v87 || v77 == 0)
              break;
            v92 = objc_msgSend_unsignedLongValue(v201, v81, v82, v83, v84);
            if (!v92)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v89, (uint64_t)CFSTR("Empty vocabulary %@ in taxonomy %@"), v90, v91, v67, v11->_name);
              started = (id)objc_claimAutoreleasedReturnValue();
              if (v227)
              {
                objc_msgSend_errorWithCode_message_(CSUError, v156, 6, (uint64_t)started, v157);
                v158 = (id)objc_claimAutoreleasedReturnValue();
                *v227 = v158;
              }
LABEL_58:

LABEL_64:
              v143 = 0;
              v160 = obj;
              goto LABEL_79;
            }
            v93 = [CSUVocabulary alloc];
            ((void (**)(_QWORD, void *))v23)[2](v23, v203);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v77;
            v100 = objc_msgSend_unsignedLongValue(v77, v96, v97, v98, v99);
            v105 = objc_msgSend_unsignedLongValue(v85, v101, v102, v103, v104);
            started = (id)objc_msgSend_initWithName_labelFilePath_internalCount_visibleCount_startIndex_(v93, v106, v67, (uint64_t)v94, v92, v100, v105);

            v77 = v95;
            if (!started)
            {
              if (v227)
              {
                objc_msgSend_errorForMemoryAllocationFailure(CSUError, v108, v109, v110, v111);
                v159 = (id)objc_claimAutoreleasedReturnValue();
                *v227 = v159;
              }
              goto LABEL_64;
            }
            objc_msgSend_setObject_forKeyedSubscript_(v197, v108, (uint64_t)started, v67, v111);

            if (v195 == ++v66)
            {
              v60 = obj;
              v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v218, (uint64_t)v229, 16);
              if (v62)
                goto LABEL_13;
LABEL_30:

              v116 = objc_msgSend_copy(v197, v112, v113, v114, v115);
              vocabularies = v11->_vocabularies;
              v11->_vocabularies = (NSDictionary *)v116;

              objc_msgSend_allKeys(v11->_vocabularies, v118, v119, v120, v121);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v216[0] = MEMORY[0x24BDAC760];
              v216[1] = 3221225472;
              v216[2] = sub_23A012A48;
              v216[3] = &unk_250B0E428;
              v123 = v11;
              v217 = v123;
              objc_msgSend_sortedArrayUsingComparator_(v122, v124, (uint64_t)v216, v125, v126);
              v127 = objc_claimAutoreleasedReturnValue();
              vocabularyNames = v123->_vocabularyNames;
              v204 = v123;
              v123->_vocabularyNames = (NSArray *)v127;

              objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v129, (uint64_t)CFSTR("relations"), v130, v131);
              v132 = objc_claimAutoreleasedReturnValue();
              v202 = (void *)v132;
              if (v132)
              {
                v23[2](v23, v132);
                v133 = objc_claimAutoreleasedReturnValue();
                v134 = (void *)MEMORY[0x24BDD1770];
                v135 = (void *)v133;
                objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v136, v133, v137, v138);
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_propertyListWithData_options_format_error_(v134, v140, (uint64_t)v139, 0, 0, v227);
                v215 = (void *)objc_claimAutoreleasedReturnValue();

                if (v215)
                {
                  sub_23A012B1C((uint64_t)&v204->_relations, &v215);

                  v141 = v204;
                  goto LABEL_67;
                }
                v143 = 0;
                v166 = v135;
              }
              else
              {
                v141 = v204;
                if (v204->_relations.__engaged_)
                {

                  v141 = v204;
                  v204->_relations.__engaged_ = 0;
                }
LABEL_67:
                labelAttributes = v141->_labelAttributes;
                v141->_labelAttributes = 0;

                objc_msgSend_objectForKeyedSubscript_(v11->_manifest, v162, (uint64_t)CFSTR("attributes"), v163, v164);
                v165 = objc_claimAutoreleasedReturnValue();
                v166 = (void *)v165;
                if (v165)
                {
                  v200 = (void *)v165;
                  v167 = objc_alloc(MEMORY[0x24BDBCED8]);
                  v172 = objc_msgSend_count(v166, v168, v169, v170, v171);
                  v176 = (void *)objc_msgSend_initWithCapacity_(v167, v173, v172, v174, v175);
                  v213 = 0u;
                  v214 = 0u;
                  v211 = 0u;
                  v212 = 0u;
                  v177 = v166;
                  v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v177, v178, (uint64_t)&v211, (uint64_t)v228, 16);
                  if (v182)
                  {
                    v183 = *(_QWORD *)v212;
                    do
                    {
                      for (i = 0; i != v182; ++i)
                      {
                        if (*(_QWORD *)v212 != v183)
                          objc_enumerationMutation(v177);
                        v185 = *(_QWORD *)(*((_QWORD *)&v211 + 1) + 8 * i);
                        objc_msgSend_objectForKey_(v177, v179, v185, v180, v181);
                        v186 = (void *)objc_claimAutoreleasedReturnValue();
                        ((void (**)(_QWORD, void *))v23)[2](v23, v186);
                        v187 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKeyedSubscript_(v176, v188, (uint64_t)v187, v185, v189);

                      }
                      v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v177, v179, (uint64_t)&v211, (uint64_t)v228, 16);
                    }
                    while (v182);
                  }

                  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v190, (uint64_t)v176, v191, v192);
                  v193 = objc_claimAutoreleasedReturnValue();
                  v194 = v204->_labelAttributes;
                  v204->_labelAttributes = (NSDictionary *)v193;

                  v166 = v200;
                }
                v143 = v204;
              }

              v160 = v217;
LABEL_79:

LABEL_52:
LABEL_53:

              v144 = v209;
              goto LABEL_54;
            }
          }
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v81, (uint64_t)CFSTR("Malformed properties for vocabulary named %@ in taxonomy %@"), v83, v84, v67, v11->_name);
          started = (id)objc_claimAutoreleasedReturnValue();
          if (v227)
          {
            objc_msgSend_errorWithCode_message_(CSUError, v153, 6, (uint64_t)started, v154);
            v155 = (id)objc_claimAutoreleasedReturnValue();
            *v227 = v155;
          }
          goto LABEL_58;
        }
        sub_23A0129CC(&v226, CFSTR("Invalid manifest file, declared size of taxonomy is 0"));
LABEL_51:
        v143 = 0;
        goto LABEL_52;
      }
      if (!v227)
        goto LABEL_51;
      objc_msgSend_errorWithCode_message_(CSUError, v46, 6, (uint64_t)CFSTR("Invalid manifest file, missing required information"), v49);
      v147 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v227)
        goto LABEL_51;
      objc_msgSend_errorWithCode_message_(CSUError, v43, 6, (uint64_t)CFSTR("Invalid manifest file, does not have the format version"), v45);
      v147 = (id)objc_claimAutoreleasedReturnValue();
    }
    v143 = 0;
    *v227 = v147;
    goto LABEL_52;
  }
  v144 = v209;
  if (v227)
  {
    objc_msgSend_stringByAppendingString_(CFSTR("Could not load taxonomy manifest file "), v18, (uint64_t)v6, v20, v21);
    v207 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_underlyingError_(CSUError, v145, 1, (uint64_t)v207, (uint64_t)v209);
    v146 = (id)objc_claimAutoreleasedReturnValue();
    v143 = 0;
    *v227 = v146;
    goto LABEL_53;
  }
  v143 = 0;
LABEL_54:

  v6 = v210;
LABEL_55:

  return v143;
}

+ (id)taxonomyWithManifestPath:(id)a3 error:(id *)a4
{
  id v5;
  CSUTaxonomy *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = [CSUTaxonomy alloc];
  v9 = (void *)objc_msgSend_initWithManifestPath_error_(v6, v7, (uint64_t)v5, (uint64_t)a4, v8);

  return v9;
}

- (id)_vocabularyNamed:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_objectForKey_(self->_vocabularies, a2, (uint64_t)a3, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasLabelAttributes
{
  return self->_labelAttributes != 0;
}

- (BOOL)_hasVocabularyNamed:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend__vocabularyNamed_(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (unint64_t)countLabelsInVocabularyNamed:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  objc_msgSend__vocabularyNamed_(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
  {
    v11 = objc_msgSend_count(v5, v6, v7, v8, v9);

    return v11;
  }
  else
  {

    return 0;
  }
}

- (void)enumerateLabelsInVocabularyNamed:(id)a3 usingBlock:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend__vocabularyNamed_(self, v6, (uint64_t)a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v9)
    objc_msgSend__enumerateVisibleLabelsInVocabularyUsingBlock_(v9, v10, (uint64_t)v14, v11, v12);

}

- (void)enumerateLabelsInTaxonomyUsingBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  NSArray *obj;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_vocabularyNames;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v18, (uint64_t)v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    v8 = MEMORY[0x24BDAC760];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = sub_23A012EE0;
      v15[3] = &unk_250B0E450;
      v16 = v4;
      v17 = &v22;
      objc_msgSend_enumerateLabelsInVocabularyNamed_usingBlock_(self, v11, v10, (uint64_t)v15, v12);
      LOBYTE(v10) = *((_BYTE *)v23 + 24) == 0;

      if ((v10 & 1) == 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v18, (uint64_t)v26, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v22, 8);
}

- (NSArray)vocabularyNames
{
  return self->_vocabularyNames;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)internalCount
{
  return self->_internalCount;
}

- (optional<csu::TaxonomyRelations>)relations
{
  optional<csu::TaxonomyRelations> *v4;
  unint64_t data;

  retstr->var0.__null_state_ = 0;
  retstr->__engaged_ = 0;
  if (LOBYTE(self[3].var0.__val_._count))
  {
    v4 = self;
    self = (optional<csu::TaxonomyRelations> *)*(id *)&self[2].__engaged_;
    data = (unint64_t)v4[3].var0.__val_._data;
    retstr->var0.__val_._data = (NSData *)self;
    retstr->var0.__val_._count = data;
    retstr->__engaged_ = 1;
  }
  return self;
}

- (void).cxx_destruct
{
  if (self->_relations.__engaged_)

  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vocabularyNames, 0);
  objc_storeStrong((id *)&self->_vocabularies, 0);
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 64) = 0;
  *((_BYTE *)self + 80) = 0;
  return self;
}

@end

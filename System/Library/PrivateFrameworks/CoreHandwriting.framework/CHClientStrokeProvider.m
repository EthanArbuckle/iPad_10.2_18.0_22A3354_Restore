@implementation CHClientStrokeProvider

+ (BOOL)isNonTextSection:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("type"), v5, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_objectForKey_(v3, v8, (uint64_t)CFSTR("type"), v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v13, v14, (uint64_t)CFSTR("text"), v15, v16, v17) & 1) != 0)
    {
      LOBYTE(v22) = 0;
    }
    else
    {
      objc_msgSend_objectForKey_(v3, v18, (uint64_t)CFSTR("type"), v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("math"), v25, v26, v27) ^ 1;

    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

- (CHClientStrokeProvider)initWithStrokes:(id)a3 version:(int64_t)a4
{
  id v5;
  CHClientStrokeProvider *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHClientStrokeProvider *v12;
  uint64_t v13;
  NSArray *orderedStrokes;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *strokesByID;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *strokeIdsByEncoding;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *transcriptionCache;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v40;

  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CHClientStrokeProvider;
  v6 = -[CHClientStrokeProvider init](&v40, sel_init);
  v12 = v6;
  if (v6)
  {
    v6->_version = 0;
    objc_msgSend_array(MEMORY[0x1E0C99D20], v7, v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    orderedStrokes = v12->_orderedStrokes;
    v12->_orderedStrokes = (NSArray *)v13;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16, v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    strokesByID = v12->_strokesByID;
    v12->_strokesByID = (NSMutableDictionary *)v20;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    strokeIdsByEncoding = v12->__strokeIdsByEncoding;
    v12->__strokeIdsByEncoding = (NSMutableDictionary *)v27;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v29, v30, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    transcriptionCache = v12->_transcriptionCache;
    v12->_transcriptionCache = (NSMutableDictionary *)v34;

    objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v12, v36, (uint64_t)v5, 0, v37, v38);
  }

  return v12;
}

- (CHClientStrokeProvider)initWithURL:(id)a3 version:(int64_t)a4 keepTextOnly:(BOOL)a5
{
  id v6;
  CHClientStrokeProvider *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHClientStrokeProvider *v13;
  uint64_t v14;
  NSArray *orderedStrokes;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *strokesByID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *strokeIdsByEncoding;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *transcriptionCache;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int isEqualToString;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  _BOOL8 v81;
  _BOOL8 v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSArray *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSArray *v102;
  NSArray *sectionedStrokes;
  NSArray *v104;
  id v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSArray *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  double v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  double v176;
  id v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  _BOOL4 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  id v191;
  objc_super v192;
  _BYTE v193[128];
  _QWORD v194[3];

  v186 = a5;
  v194[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v192.receiver = self;
  v192.super_class = (Class)CHClientStrokeProvider;
  v7 = -[CHClientStrokeProvider init](&v192, sel_init);
  v13 = v7;
  if (v7)
  {
    v7->_version = 0;
    objc_msgSend_array(MEMORY[0x1E0C99D20], v8, v9, v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    orderedStrokes = v13->_orderedStrokes;
    v13->_orderedStrokes = (NSArray *)v14;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v16, v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    strokesByID = v13->_strokesByID;
    v13->_strokesByID = (NSMutableDictionary *)v21;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v23, v24, v25, v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    strokeIdsByEncoding = v13->__strokeIdsByEncoding;
    v13->__strokeIdsByEncoding = (NSMutableDictionary *)v28;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v30, v31, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    transcriptionCache = v13->_transcriptionCache;
    v13->_transcriptionCache = (NSMutableDictionary *)v35;

    objc_msgSend_pathExtension(v6, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v42, v43, (uint64_t)CFSTR("json"), v44, v45, v46);

    if (isEqualToString)
    {
      v53 = (void *)MEMORY[0x1E0C99D50];
      v184 = (uint64_t)v6;
      objc_msgSend_path(v6, v48, v49, v50, v51, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithContentsOfFile_(v53, v55, (uint64_t)v54, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v191 = 0;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v60, (uint64_t)v59, 1, (uint64_t)&v191, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v191;
      objc_msgSend_objectForKey_(v62, v64, (uint64_t)CFSTR("channels"), v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v62, v69, (uint64_t)CFSTR("sectionsData"), v70, v71, v72);
      v73 = objc_claimAutoreleasedReturnValue();
      v79 = (void *)v73;
      if (v68)
      {
        objc_msgSend_objectForKeyedSubscript_(v68, v74, (uint64_t)CFSTR("t"), v76, v77, v78);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v80 != 0;

        if (v79)
          goto LABEL_5;
      }
      else
      {
        v81 = 0;
        if (v73)
        {
LABEL_5:
          v185 = (uint64_t)v68;
          v178 = v63;
          v180 = v62;
          v182 = v59;
          if (v81)
          {
LABEL_6:
            v82 = 1;
LABEL_12:
            v129 = v184;
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v74, v75, v76, v77, v78, v178, v180, v182);
            v130 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v187 = 0u;
            v188 = 0u;
            v189 = 0u;
            v190 = 0u;
            v105 = v79;
            v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v131, (uint64_t)&v187, (uint64_t)v193, 16, v132);
            if (v133)
            {
              v139 = v133;
              v140 = *(_QWORD *)v188;
              v141 = 2.22507386e-308;
              do
              {
                v142 = 0;
                do
                {
                  if (*(_QWORD *)v188 != v140)
                    objc_enumerationMutation(v105);
                  v150 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * v142);
                  if (!v186
                    || (objc_msgSend_isNonTextSection_(CHClientStrokeProvider, v134, *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * v142), v136, v137, v138) & 1) == 0)
                  {
                    objc_msgSend_array(MEMORY[0x1E0C99DE8], v134, v135, v136, v137, v138);
                    v151 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_loadStrokesFrom_section_withTime_atTimestamp_channels_orderedStrokes_(v13, v152, v129, v150, v82, v185, v151, v141);
                    objc_msgSend_lastObject(v151, v153, v154, v155, v156, v157);
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_endTimestamp(v158, v159, v160, v161, v162, v163);
                    if (v141 <= v169)
                    {
                      objc_msgSend_lastObject(v151, v164, v165, v166, v167, v168);
                      v170 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_endTimestamp(v170, v171, v172, v173, v174, v175);
                      v141 = v176;

                      v129 = v184;
                    }

                    objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v13, v143, (uint64_t)v151, 0, v144, v145);
                    objc_msgSend_addObject_(v130, v146, (uint64_t)v151, v147, v148, v149);

                  }
                  ++v142;
                }
                while (v139 != v142);
                v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v134, (uint64_t)&v187, (uint64_t)v193, 16, v138);
              }
              while (v139);
            }

            sectionedStrokes = v13->_sectionedStrokes;
            v13->_sectionedStrokes = v130;
            v62 = v181;
            v59 = v183;
            v63 = v179;
            v68 = (void *)v185;
            goto LABEL_25;
          }
LABEL_11:
          objc_msgSend_firstObject(v79, v74, v75, v76, v77, v78, v178, v180, v182);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v106, v107, (uint64_t)CFSTR("data"), v108, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_firstObject(v111, v112, v113, v114, v115, v116);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v117, v118, v119, v120, v121, v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = (unint64_t)objc_msgSend_count(v123, v124, v125, v126, v127, v128) > 2;

          goto LABEL_12;
        }
      }
      objc_msgSend_objectForKey_(v62, v74, (uint64_t)CFSTR("strokeClassification"), v76, v77, v78);
      v83 = objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        v89 = (void *)v83;
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v84, v85, v86, v87, v88);
        v90 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_loadStrokesBasedOnStrokeClassicationType_section_withTime_atTimestamp_channels_orderedStrokes_(v13, v91, v184, (uint64_t)v62, v81, (uint64_t)v68, v90, 2.22507386e-308);
        v13->_strokeClassificationGTSource = 1;
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v92, v93, v94, v95, v96);
        v97 = (NSArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v97, v98, v90, v99, v100, v101);
        v102 = v13->_sectionedStrokes;
        v13->_sectionedStrokes = v97;
        sectionedStrokes = v97;

        v104 = v13->_orderedStrokes;
        v13->_orderedStrokes = (NSArray *)v90;

        v105 = v89;
LABEL_25:

        v6 = (id)v184;
        goto LABEL_26;
      }
      v194[0] = v62;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v84, (uint64_t)v194, 1, v87, v88);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = (uint64_t)v68;
      v178 = v63;
      v180 = v62;
      v182 = v59;
      if (v81)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
LABEL_26:

  return v13;
}

- (id)cachedTranscriptionForStrokeGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_transcriptionCache, a2, (uint64_t)a3, v3, v4, v5);
}

- (id)getStrokeClassificationArray:(int64_t)a3 ofType:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v15 = (void *)objc_msgSend_initWithCapacity_(v6, v7, a3, v8, v9, v10);
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v11, a4, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18, v19, v20);

      --a3;
    }
    while (a3);
  }
  return v15;
}

- (CHClientStrokeProvider)initWithURL:(id)a3 version:(int64_t)a4 keepTextOnly:(BOOL)a5 strokesFromSections:(id)a6 channels:(id)a7 sectionTypes:(id)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  CHClientStrokeProvider *v16;
  CHClientStrokeProvider *v17;
  NSArray *v18;
  NSArray *orderedStrokes;
  NSMutableDictionary *v20;
  NSMutableDictionary *strokesByID;
  NSMutableDictionary *v22;
  NSMutableDictionary *strokeIdsByEncoding;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  id v102;
  id v103;
  _BOOL8 v104;
  id v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  NSArray *sectionedStrokes;
  CHClientStrokeProvider *v115;
  _BOOL4 v116;
  NSArray *v117;
  id v118;
  objc_super v119;

  v11 = a5;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v118 = a8;
  v119.receiver = self;
  v119.super_class = (Class)CHClientStrokeProvider;
  v16 = -[CHClientStrokeProvider init](&v119, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_version = 0;
    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    orderedStrokes = v17->_orderedStrokes;
    v17->_orderedStrokes = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    strokesByID = v17->_strokesByID;
    v17->_strokesByID = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    strokeIdsByEncoding = v17->__strokeIdsByEncoding;
    v17->__strokeIdsByEncoding = v22;

    if (v15)
    {
      objc_msgSend_objectForKeyedSubscript_(v15, v24, (uint64_t)CFSTR("t"), v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = v29 != 0;

    }
    else
    {
      v116 = 0;
    }
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v24, v25, v26, v27, v28);
    v117 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v14, v30, v31, v32, v33, v34))
    {
      v39 = 0;
      v40 = 2.22507386e-308;
      objc_msgSend_objectAtIndex_(v14, v35, 0, v36, v37, v38, v17);
      while (1)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndex_(v118, v58, v39, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11
          || (v68 = (void *)objc_opt_class(),
              objc_msgSend_isStrokeClassificationTextOrMath_(v68, v69, (uint64_t)v62, v70, v71, v72)))
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v63, v64, v65, v66, v67);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend_count(v57, v74, v75, v76, v77, v78);
          objc_msgSend_getStrokeClassificationArray_ofType_(v17, v80, v79, (uint64_t)v62, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(v17, v84, (uint64_t)v13, (uint64_t)v57, (uint64_t)v83, v116, v15, v73, v40);
          objc_msgSend_lastObject(v73, v85, v86, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_endTimestamp(v90, v91, v92, v93, v94, v95);
          if (v40 <= v101)
          {
            objc_msgSend_lastObject(v73, v96, v97, v98, v99, v100);
            v102 = v14;
            v103 = v15;
            v104 = v11;
            v105 = v13;
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_endTimestamp(v106, v107, v108, v109, v110, v111);
            v40 = v112;

            v13 = v105;
            v11 = v104;
            v15 = v103;
            v14 = v102;
            v17 = v115;
          }

          objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v17, v41, (uint64_t)v73, 0, v42, v43);
          objc_msgSend_addObject_(v117, v44, (uint64_t)v73, v45, v46, v47);

        }
        if (++v39 >= (unint64_t)objc_msgSend_count(v14, v48, v49, v50, v51, v52))
          break;
        objc_msgSend_objectAtIndex_(v14, v53, v39, v54, v55, v56, v115);
      }
    }
    sectionedStrokes = v17->_sectionedStrokes;
    v17->_sectionedStrokes = v117;

  }
  return v17;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CHClientStrokeProvider;
  -[CHClientStrokeProvider description](&v28, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProviderVersion(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedStrokes(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);
  objc_msgSend_stringByAppendingFormat_(v3, v22, (uint64_t)CFSTR(" Version: %@, Strokes: %ld"), v23, v24, v25, v9, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (void)updateWithAddedStrokes:(id)a3 removedStrokeIds:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t j;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  NSMutableDictionary *strokesByID;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  void *v62;
  NSMutableDictionary *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSArray *v93;
  NSArray *orderedStrokes;
  id v95;
  _QWORD v96[5];
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
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v13 = self->_orderedStrokes;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v105, (uint64_t)v111, 16, v15);
  if (v16)
  {
    v22 = v16;
    v23 = *(_QWORD *)v106;
    if (v6)
    {
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v106 != v23)
            objc_enumerationMutation(v13);
          v25 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          objc_msgSend_strokeIdentifier(v25, v17, v18, v19, v20, v21, v95);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend_containsObject_(v6, v27, (uint64_t)v26, v28, v29, v30);

          if ((v31 & 1) == 0)
            objc_msgSend_addObject_(v12, v17, (uint64_t)v25, v19, v20, v21);
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v105, (uint64_t)v111, 16, v21);
      }
      while (v22);
    }
    else
    {
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v106 != v23)
            objc_enumerationMutation(v13);
          objc_msgSend_addObject_(v12, v17, *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * j), v19, v20, v21, v95);
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v105, (uint64_t)v111, 16, v21);
      }
      while (v22);
    }
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v33 = v95;
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v101, (uint64_t)v110, 16, v35);
  if (v36)
  {
    v42 = v36;
    v43 = *(_QWORD *)v102;
    if (v6)
    {
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v102 != v43)
            objc_enumerationMutation(v33);
          v45 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
          objc_msgSend_strokeIdentifier(v45, v37, v38, v39, v40, v41, v95);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend_containsObject_(v6, v47, (uint64_t)v46, v48, v49, v50);

          if ((v51 & 1) == 0)
          {
            strokesByID = self->_strokesByID;
            objc_msgSend_strokeIdentifier(v45, v37, v38, v39, v40, v41);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(strokesByID, v54, (uint64_t)v45, (uint64_t)v53, v55, v56);

            objc_msgSend_addObject_(v12, v57, (uint64_t)v45, v58, v59, v60);
          }
        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v37, (uint64_t)&v101, (uint64_t)v110, 16, v41);
      }
      while (v42);
    }
    else
    {
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v102 != v43)
            objc_enumerationMutation(v33);
          v62 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * m);
          v63 = self->_strokesByID;
          objc_msgSend_strokeIdentifier(v62, v37, v38, v39, v40, v41, v95);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v63, v65, (uint64_t)v62, (uint64_t)v64, v66, v67);

          objc_msgSend_addObject_(v12, v68, (uint64_t)v62, v69, v70, v71);
        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v37, (uint64_t)&v101, (uint64_t)v110, 16, v41);
      }
      while (v42);
    }
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v72 = v6;
  v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v97, (uint64_t)v109, 16, v74);
  if (v75)
  {
    v80 = v75;
    v81 = *(_QWORD *)v98;
    do
    {
      for (n = 0; n != v80; ++n)
      {
        if (*(_QWORD *)v98 != v81)
          objc_enumerationMutation(v72);
        objc_msgSend_removeObjectForKey_(self->_strokesByID, v76, *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * n), v77, v78, v79, v95);
      }
      v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v76, (uint64_t)&v97, (uint64_t)v109, 16, v79);
    }
    while (v80);
  }

  v83 = objc_alloc(MEMORY[0x1E0C99D20]);
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = sub_1BE675264;
  v96[3] = &unk_1E77F29C8;
  v96[4] = self;
  objc_msgSend_sortedArrayUsingComparator_(v12, v84, (uint64_t)v96, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (NSArray *)objc_msgSend_initWithArray_(v83, v89, (uint64_t)v88, v90, v91, v92);
  orderedStrokes = self->_orderedStrokes;
  self->_orderedStrokes = v93;

  ++self->_version;
}

- (void)setStrokeAttributes:(unint64_t)a3 atIndexes:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE67532C;
  v6[3] = &unk_1E77F29F0;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend_enumerateIndexesUsingBlock_(a4, a2, (uint64_t)v6, (uint64_t)a4, v4, v5);
}

- (BOOL)hasValidMathAnnotation
{
  return (self->_strokeClassificationGTSource & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)loadStrokesFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  id v50;

  v11 = a5;
  v50 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend_objectForKey_(v14, v17, (uint64_t)CFSTR("unicodeCodePoints"), v18, v19, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend_objectForKey_(v14, v21, (uint64_t)CFSTR("segmentationStrokes"), v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 != 0;

  }
  else
  {
    v27 = 0;
  }

  objc_msgSend_objectForKey_(v14, v28, (uint64_t)CFSTR("strokeClassification"), v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v14, v33, (uint64_t)CFSTR("data"), v34, v35, v36);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32
    && (v43 = objc_msgSend_length(v32, v37, v38, v39, v40, v41), v43 == objc_msgSend_count(v42, v44, v45, v46, v47, v48)))
  {
    objc_msgSend_loadStrokesBasedOnStrokeClassicationType_section_withTime_atTimestamp_channels_orderedStrokes_(self, v37, (uint64_t)v50, (uint64_t)v14, v11, (uint64_t)v15, v16, a6);
    v49 = 2;
  }
  else if (v27)
  {
    objc_msgSend_loadStrokesBasedOnUnicodeFrom_section_withTime_atTimestamp_channels_orderedStrokes_(self, v37, (uint64_t)v50, (uint64_t)v14, v11, (uint64_t)v15, v16, a6);
    v49 = 2;
  }
  else
  {
    objc_msgSend_loadStrokesBasedOnSectionTypeFrom_section_withTime_atTimestamp_channels_orderedStrokes_(self, v37, (uint64_t)v50, (uint64_t)v14, v11, (uint64_t)v15, v16, a6);
    v49 = 3;
  }
  self->_strokeClassificationGTSource = v49;

}

- (void)loadStrokesBasedOnStrokeClassicationType:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int i;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  id v75;

  v74 = a5;
  v75 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a8;
  objc_msgSend_objectForKey_(v13, v16, (uint64_t)CFSTR("strokeClassification"), v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v13, v21, (uint64_t)CFSTR("data"), v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v32 = objc_msgSend_length(v20, v27, v28, v29, v30, v31);
  v37 = (void *)objc_msgSend_initWithCapacity_(v26, v33, v32, v34, v35, v36);
  if (objc_msgSend_length(v20, v38, v39, v40, v41, v42))
  {
    v47 = 0;
    for (i = objc_msgSend_characterAtIndex_(v20, v43, 0, v44, v45, v46);
          ;
          i = objc_msgSend_characterAtIndex_(v20, v43, v47, v63, v64, v65))
    {
      if (i == 78)
      {
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v49, 0, v50, v51, v52);
      }
      else if (objc_msgSend_characterAtIndex_(v20, v49, v47, v50, v51, v52) == 77
             || objc_msgSend_characterAtIndex_(v20, v66, v47, v67, v68, v69) == 79)
      {
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v66, 3, v67, v68, v69);
      }
      else if (objc_msgSend_characterAtIndex_(v20, v66, v47, v67, v68, v69) == 85
             || objc_msgSend_characterAtIndex_(v20, v70, v47, v71, v72, v73) == 81)
      {
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v70, 4, v71, v72, v73);
      }
      else
      {
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v70, 1, v71, v72, v73);
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v37, v54, (uint64_t)v53, v55, v56, v57);

      if (++v47 >= (unint64_t)objc_msgSend_length(v20, v58, v59, v60, v61, v62))
        break;
    }
  }
  objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(self, v43, (uint64_t)v75, (uint64_t)v25, (uint64_t)v37, v74, v14, v15, a6);

}

- (void)loadStrokesBasedOnUnicodeFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *i;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  _BOOL4 v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;

  v89 = a5;
  v90 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a8;
  objc_msgSend_objectForKey_(v12, v15, (uint64_t)CFSTR("segmentationStrokes"), v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v20, (uint64_t)CFSTR("data"), v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v31, v30, v32, v33, v34);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v30; --v30)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(i, v42, (uint64_t)v41, v43, v44, v45);

  }
  objc_msgSend_objectForKey_(v12, v35, (uint64_t)CFSTR("annotatedCutPoints"), v37, v38, v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v12, v47, (uint64_t)CFSTR("segmentationCodePoints"), v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = MEMORY[0x1E0C809B0];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = sub_1BE67597C;
  v93[3] = &unk_1E77F2A18;
  v94 = v51;
  v95 = v46;
  v96 = i;
  v53 = i;
  v54 = v46;
  v55 = v51;
  objc_msgSend_enumerateObjectsUsingBlock_(v19, v56, (uint64_t)v93, v57, v58, v59);
  v60 = (void *)MEMORY[0x1E0C99DE8];
  v66 = objc_msgSend_count(v53, v61, v62, v63, v64, v65);
  objc_msgSend_arrayWithCapacity_(v60, v67, v66, v68, v69, v70);
  v91[0] = v52;
  v91[1] = 3221225472;
  v91[2] = sub_1BE675C00;
  v91[3] = &unk_1E77F2A40;
  v92 = (id)objc_claimAutoreleasedReturnValue();
  v71 = v92;
  objc_msgSend_enumerateObjectsUsingBlock_(v53, v72, (uint64_t)v91, v73, v74, v75);
  objc_msgSend_objectForKey_(v12, v76, (uint64_t)CFSTR("data"), v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend_copy(v71, v81, v82, v83, v84, v85);
  objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(self, v87, (uint64_t)v90, (uint64_t)v80, (uint64_t)v86, v89, v13, v14, a6);

}

- (void)loadStrokesBasedOnSectionTypeFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  id v79;

  v11 = a5;
  v79 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend_objectForKey_(v14, v17, (uint64_t)CFSTR("type"), v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_objectForKey_(v14, v22, (uint64_t)CFSTR("type"), v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v14, v27, (uint64_t)CFSTR("collectionType"), v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v26, v32, (uint64_t)CFSTR("text"), v33, v34, v35)
      && (objc_msgSend_isEqualToString_(v31, v36, (uint64_t)CFSTR("math"), v37, v38, v39) & 1) != 0
      || objc_msgSend_isEqualToString_(v26, v36, (uint64_t)CFSTR("math"), v37, v38, v39))
    {
      objc_msgSend_objectForKeyedSubscript_(v14, v36, (uint64_t)CFSTR("string"), v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsString_(v40, v41, (uint64_t)CFSTR("hline"), v42, v43, v44) & 1) != 0
        || objc_msgSend_containsString_(v40, v45, (uint64_t)CFSTR("begin{array}{lr}"), v46, v47, v48)
        && (objc_msgSend_containsString_(v40, v54, (uint64_t)CFSTR("end{array}"), v55, v56, v57) & 1) != 0)
      {
        v49 = 4;

      }
      else
      {
        v49 = 3;

      }
      goto LABEL_19;
    }
    if ((objc_msgSend_isEqualToString_(v26, v36, (uint64_t)CFSTR("text"), v37, v38, v39) & 1) != 0)
    {
      v49 = 1;
    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v26, v50, (uint64_t)CFSTR("underline"), v51, v52, v53) & 1) == 0)
      {
        objc_msgSend_objectForKey_(v14, v58, (uint64_t)CFSTR("box"), v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {

        }
        else
        {
          objc_msgSend_objectForKey_(v14, v63, (uint64_t)CFSTR("encircle"), v64, v65, v66);
          v49 = objc_claimAutoreleasedReturnValue();

          if (!v49)
            goto LABEL_19;
        }
        v49 = 7;
        goto LABEL_19;
      }
      v49 = 6;
    }
LABEL_19:

    goto LABEL_20;
  }
  v49 = 1;
LABEL_20:
  objc_msgSend_objectForKey_(v14, v22, (uint64_t)CFSTR("data"), v23, v24, v25);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_count(v67, v68, v69, v70, v71, v72);
  objc_msgSend_getStrokeClassificationArray_ofType_(self, v74, v73, v49, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(self, v78, (uint64_t)v79, (uint64_t)v67, (uint64_t)v77, v11, v15, v16, a6);

}

- (void)loadStrokesFrom:(id)a3 withStrokes:(id)a4 types:(id)a5 withTime:(BOOL)a6 atTimestamp:(double)a7 channels:(id)a8 orderedStrokes:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  char v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  CHClientStroke *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  NSObject *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint8_t buf[4];
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v24 = a9;
  if (v16 && objc_msgSend_count(v16, v19, v20, v21, v22, v23))
  {
    v30 = 0;
    v31 = a7 + 1.0;
    v32 = 0.0;
    v33 = 1;
    objc_msgSend_objectAtIndex_(v16, v25, 0, v26, v27, v28, 138412290, v29);
    while (1)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48);

      if (v49)
      {
        if ((v33 & 1) != 0)
          v54 = v31;
        else
          v54 = v32;
        if ((v33 & 1 & a6) == 1)
        {
          objc_msgSend_objectAtIndex_(v16, v50, v30, v51, v52, v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v55, v56, 0, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_valueForKey_(v18, v61, (uint64_t)CFSTR("t"), v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (int)objc_msgSend_intValue(v65, v66, v67, v68, v69, v70);

          if (objc_msgSend_count(v60, v72, v73, v74, v75, v76) > v71)
          {
            objc_msgSend_objectAtIndex_(v60, v77, v71, v78, v79, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v81, v82, v83, v84, v85, v86);
            v88 = v87;

            if (v88 == 0.0)
              v32 = v31;
          }

          v54 = v32;
        }
        objc_msgSend_objectAtIndex_(v17, v50, v30, v51, v52, v53);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = (int)objc_msgSend_intValue(v89, v90, v91, v92, v93, v94);

        v96 = [CHClientStroke alloc];
        objc_msgSend_objectAtIndex_(v16, v97, v30, v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend_initWithArray_channels_withTimeOffset_type_(v96, v102, (uint64_t)v101, (uint64_t)v18, v95, v103, v54);

        objc_msgSend_addObject_(v24, v105, (uint64_t)v104, v106, v107, v108);
        if (!objc_msgSend_pointsCount(v104, v109, v110, v111, v112, v113))
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v126 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_path(v15, v127, v128, v129, v130, v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v133;
            v136 = v132;
            _os_log_impl(&dword_1BE607000, v126, OS_LOG_TYPE_ERROR, "Unexpected empty stroke in document %@", buf, 0xCu);

          }
LABEL_5:
          v33 = 0;
          goto LABEL_6;
        }
        if (a6)
          goto LABEL_5;
        objc_msgSend_endTimestamp(v104, v114, v115, v116, v117, v118);
        v33 = 0;
        v54 = v119 + 0.1;
      }
      else
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v104 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_path(v15, v120, v121, v122, v123, v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v133;
          v136 = v125;
          _os_log_impl(&dword_1BE607000, v104, OS_LOG_TYPE_ERROR, "Unexpected empty stroke in document %@", buf, 0xCu);

        }
        v54 = v32;
      }
LABEL_6:

      ++v30;
      v32 = v54;
      if (v30 >= objc_msgSend_count(v16, v34, v35, v36, v37, v38))
        break;
      objc_msgSend_objectAtIndex_(v16, v39, v30, v40, v41, v42, v133, v134);
    }
  }

}

- (CGRect)boundingBox
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v31 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_orderedStrokes;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16, v8);
  if (v9)
  {
    v15 = v9;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v6);
        objc_msgSend_boundingBox(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v17), v10, v11, v12, v13, v14, (_QWORD)v26);
        v35.origin.x = v18;
        v35.origin.y = v19;
        v35.size.width = v20;
        v35.size.height = v21;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v33 = CGRectUnion(v32, v35);
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v26, (uint64_t)v30, 16, v14);
    }
    while (v15);
  }

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CHStrokeProviderVersion)strokeProviderVersion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHStrokeProviderVersion *)objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, self->_version, v2, v3, v4);
}

- (id)drawing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_allKeys(self->_strokesByID, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawingWithStrokes_(self, v8, (uint64_t)v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)drawingWithStrokes:(id)a3
{
  id v4;
  CHDrawing *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CHDrawing *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  _QWORD v29[4];
  CHDrawing *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CHDrawing);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v31, (uint64_t)v35, 16, v7);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v32;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend_objectForKeyedSubscript_(self->_strokesByID, v9, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v15), v10, v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = sub_1BE6765BC;
        v29[3] = &unk_1E77F2A68;
        v17 = v5;
        v30 = v17;
        objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v16, v18, (uint64_t)v29, v19, v20, v21, 0.00833333333);
        objc_msgSend_endStroke(v17, v22, v23, v24, v25, v26);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, (uint64_t)v35, 16, v12);
    }
    while (v13);
  }

  return v5;
}

- (id)drawingWithGroups:(id)a3 transforms:(id)a4
{
  id v6;
  id v7;
  CHDrawing *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CHDrawing);
  objc_msgSend_allKeys(self->_strokesByID, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17, v18, v19);

  if (objc_msgSend_count(v6, v21, v22, v23, v24, v25))
  {
    v30 = 0;
    objc_msgSend_objectAtIndexedSubscript_(v6, v26, 0, v27, v28, v29);
    while (1)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v67, (uint64_t)v71, 16, v57);
      if (v58)
      {
        v63 = v58;
        v64 = *(_QWORD *)v68;
        do
        {
          v65 = 0;
          do
          {
            if (*(_QWORD *)v68 != v64)
              objc_enumerationMutation(v55);
            objc_msgSend_removeObject_(v20, v59, *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v65++), v60, v61, v62);
          }
          while (v63 != v65);
          v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v59, (uint64_t)&v67, (uint64_t)v71, 16, v62);
        }
        while (v63);
      }
      objc_msgSend_drawingWithStrokes_(self, v59, (uint64_t)v55, v60, v61, v62);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v7, v32, v30, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend_newDrawingWithTransform_(v31, v37, (uint64_t)v36, v38, v39, v40);

      objc_msgSend_appendDrawing_(v8, v42, (uint64_t)v41, v43, v44, v45);
      if (++v30 >= (unint64_t)objc_msgSend_count(v6, v46, v47, v48, v49, v50))
        break;
      objc_msgSend_objectAtIndexedSubscript_(v6, v51, v30, v52, v53, v54);
    }
  }

  return v8;
}

- (void)updateWithGroups:(id)a3 transforms:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  CHClientStrokeProvider *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v94 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v93 = self;
  objc_msgSend_orderedStrokes(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v95, (uint64_t)v99, 16, v20);
  if (v21)
  {
    v27 = v21;
    v28 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)v96 != v28)
            objc_enumerationMutation(v18);
          v35 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend_strokeIdentifier(v35, v22, v23, v24, v25, v26);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v6, v37, v38, v39, v40, v41))
            break;
LABEL_5:
          v30 = (void *)objc_msgSend_newStrokeWithoutTransformation(v35, v42, v43, v44, v45, v46);
          objc_msgSend_addObject_(v12, v31, (uint64_t)v30, v32, v33, v34);

          if (++i == v27)
            goto LABEL_3;
        }
        v47 = 0;
        while (1)
        {
          objc_msgSend_objectAtIndexedSubscript_(v6, v42, v47, v44, v45, v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_containsObject_(v48, v49, (uint64_t)v36, v50, v51, v52))
            break;

          if (++v47 >= (unint64_t)objc_msgSend_count(v6, v57, v58, v59, v60, v61))
            goto LABEL_5;
        }
        objc_msgSend_objectAtIndexedSubscript_(v94, v53, v47, v54, v55, v56);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)objc_msgSend_newStrokeWithTransformation_(v35, v63, (uint64_t)v62, v64, v65, v66);
        objc_msgSend_addObject_(v12, v68, (uint64_t)v67, v69, v70, v71);

      }
LABEL_3:
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v95, (uint64_t)v99, 16, v26);
    }
    while (v27);
  }

  v72 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_strokesByID(v93, v73, v74, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v78, v79, v80, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v72, v85, (uint64_t)v84, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v93, v90, (uint64_t)v12, (uint64_t)v89, v91, v92);

}

- (NSArray)orderedStrokes
{
  return self->_orderedStrokes;
}

- (id)strokeForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend_strokesByID(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)compareOrderOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;

  v5 = a4;
  v11 = objc_msgSend_integerValue(a3, v6, v7, v8, v9, v10);
  v17 = objc_msgSend_integerValue(v5, v12, v13, v14, v15, v16);

  if (v11 >= v17)
    v18 = 0;
  else
    v18 = -1;
  if (v11 > v17)
    return 1;
  else
    return v18;
}

- (unint64_t)compareStyleOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  return 0;
}

- (id)strokeIdentifierFromData:(id)a3
{
  id v4;
  CHClientStrokeProvider *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v31;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_objectForKey_(v5->__strokeIdsByEncoding, v6, (uint64_t)v4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_objectForKey_(v5->__strokeIdsByEncoding, v11, (uint64_t)v4, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB3710];
    v17 = objc_opt_class();
    objc_msgSend_encodedStrokeIdentifier(v4, v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend_unarchivedObjectOfClass_fromData_error_(v16, v24, v17, (uint64_t)v23, (uint64_t)&v31, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v31;

    objc_msgSend_setObject_forKey_(v5->__strokeIdsByEncoding, v27, (uint64_t)v15, (uint64_t)v4, v28, v29);
  }
  objc_sync_exit(v5);

  return v15;
}

- (id)encodedStrokeIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CHEncodedStrokeIdentifier *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CHClientStrokeProvider *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;

  v4 = a3;
  objc_msgSend_objectForKey_(self->_strokesByID, v5, (uint64_t)v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_objectForKey_(self->_strokesByID, v10, (uint64_t)v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodedStrokeIdentifier(v14, v15, v16, v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = [CHEncodedStrokeIdentifier alloc];
    v39 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v22, (uint64_t)v4, 1, (uint64_t)&v39, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_initWithData_(v21, v24, (uint64_t)v14, v25, v26, v27);
  }
  v28 = (void *)v20;

  v29 = self;
  objc_sync_enter(v29);
  objc_msgSend_objectForKey_(v29->__strokeIdsByEncoding, v30, (uint64_t)v28, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
    objc_msgSend_setObject_forKey_(v29->__strokeIdsByEncoding, v35, (uint64_t)v4, (uint64_t)v28, v36, v37);
  objc_sync_exit(v29);

  return v28;
}

- (NSOrderedSet)visibleStrokeEncodedIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend_allKeys(self->__strokeIdsByEncoding, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSetWithArray_(v6, v8, (uint64_t)v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v12;
}

- (int64_t)groupingPriority
{
  return self->groupingPriority;
}

- (NSMutableDictionary)strokesByID
{
  return self->_strokesByID;
}

- (NSArray)sectionedStrokes
{
  return self->_sectionedStrokes;
}

- (void)setHasValidMathAnnotation:(BOOL)a3
{
  self->_hasValidMathAnnotation = a3;
}

- (NSMutableDictionary)transcriptionCache
{
  return self->_transcriptionCache;
}

- (NSMutableDictionary)_strokeIdsByEncoding
{
  return self->__strokeIdsByEncoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__strokeIdsByEncoding, 0);
  objc_storeStrong((id *)&self->_transcriptionCache, 0);
  objc_storeStrong((id *)&self->_sectionedStrokes, 0);
  objc_storeStrong((id *)&self->_strokesByID, 0);
  objc_storeStrong((id *)&self->_orderedStrokes, 0);
}

@end

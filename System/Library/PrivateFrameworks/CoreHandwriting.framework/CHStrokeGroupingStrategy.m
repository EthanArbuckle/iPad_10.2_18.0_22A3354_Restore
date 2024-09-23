@implementation CHStrokeGroupingStrategy

- (CHStrokeGroupingStrategy)initWithStrokeProvider:(id)a3
{
  id v5;
  CHStrokeGroupingStrategy *v6;
  CHStrokeGroupingStrategy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHStrokeGroupingStrategy;
  v6 = -[CHStrokeGroupingStrategy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_strokeProvider, a3);

  return v7;
}

- (NSString)strategyIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)strokesForIdentifiers:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  void *v59;
  __int128 v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v11 = v4;
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v65, (uint64_t)v73, 16, v13);
  if (v64)
  {
    v20 = *(_QWORD *)v66;
    v21 = &qword_1EF568000;
    *(_QWORD *)&v19 = 138412546;
    v61 = v19;
    v62 = v11;
    v63 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)v66 != v20)
            objc_enumerationMutation(v11);
          v23 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend_strokeProvider(self, v14, v15, v16, v17, v18, v61);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIdentifierFromData_(v24, v25, v23, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_strokeProvider(self, v30, v31, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeForIdentifier_(v35, v36, (uint64_t)v29, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
            break;
          objc_msgSend_addObject_(v10, v41, (uint64_t)v40, v42, v43, v44);

          if (v64 == ++i)
            goto LABEL_3;
        }
        if (v21[465] != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v45 = (id)qword_1EF568E30;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_strokeProvider(self, v46, v47, v48, v49, v50);
          v51 = v10;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeProviderVersion(v52, v53, v54, v55, v56, v57);
          v58 = v21;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v61;
          v70 = v23;
          v71 = 2112;
          v72 = v59;
          _os_log_impl(&dword_1BE607000, v45, OS_LOG_TYPE_DEFAULT, "Failed to get stroke with id: %@ from stroke provider version %@", buf, 0x16u);

          v21 = v58;
          v10 = v51;
          v11 = v62;
          v20 = v63;
        }

      }
LABEL_3:
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v65, (uint64_t)v73, 16, v18);
    }
    while (v64);
  }

  return v10;
}

- (void)firstStrokeIdentifier:(id *)a3 lastStrokeIdentifier:(id *)a4 inGroup:(id)a5 addingStrokeIdentifiers:(id)a6 removingStrokeIdentifiers:(id)a7
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
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
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
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
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t j;
  id v97;
  void *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t n;
  id v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t k;
  id v156;
  void *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t m;
  id v175;
  void *v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  id *v204;
  void *v206;
  void *v207;
  id obj;
  id v209;
  id v210;
  void *v211;
  void *v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _BYTE v221[128];
  _BYTE v222[128];
  uint64_t v223;

  v204 = a3;
  v223 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend_firstStrokeIdentifier(v10, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProvider(self, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifierFromData_(v24, v25, (uint64_t)v18, v26, v27, v28);
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastStrokeIdentifier(v10, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProvider(self, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifierFromData_(v40, v41, (uint64_t)v34, v42, v43, v44);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  v206 = v12;
  v207 = v10;
  if (!v12 || !objc_msgSend_count(v12, v45, v46, v47, v48, v49))
    goto LABEL_28;
  objc_msgSend_strokeIdentifiers(v10, v50, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend_mutableCopy(v55, v56, v57, v58, v59, v60);

  obj = v61;
  objc_msgSend_minusSet_(v61, v62, (uint64_t)v12, v63, v64, v65);
  if (objc_msgSend_containsObject_(v12, v66, (uint64_t)v18, v67, v68, v69))
  {

    v18 = 0;
    if (!objc_msgSend_containsObject_(v12, v74, (uint64_t)v34, v75, v76, v77))
      goto LABEL_5;
LABEL_27:

    v34 = 0;
    if (v61)
      goto LABEL_6;
LABEL_28:
    obj = 0;
    goto LABEL_29;
  }
  if (objc_msgSend_containsObject_(v12, v70, (uint64_t)v34, v71, v72, v73))
    goto LABEL_27;
LABEL_5:
  if (!v61)
    goto LABEL_28;
LABEL_6:
  if (!v18 || !v34)
  {
    v209 = v11;
    v219 = 0u;
    v220 = 0u;
    v217 = 0u;
    v218 = 0u;
    obj = v61;
    v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v217, (uint64_t)v222, 16, v79);
    if (v80)
    {
      v86 = v80;
      v87 = *(_QWORD *)v218;
      if (v18)
      {
        if (v34)
        {
          do
          {
            for (i = 0; i != v86; ++i)
            {
              if (*(_QWORD *)v218 != v87)
                objc_enumerationMutation(obj);
              v89 = *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * i);
              objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifierFromData_(v90, v91, v89, v92, v93, v94);
              v95 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
        else
        {
          do
          {
            for (j = 0; j != v86; ++j)
            {
              if (*(_QWORD *)v218 != v87)
                objc_enumerationMutation(obj);
              v98 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * j);
              objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifierFromData_(v99, v100, (uint64_t)v98, v101, v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v34
                || (objc_msgSend_strokeProvider(self, v105, v106, v107, v108, v109),
                    v110 = (void *)objc_claimAutoreleasedReturnValue(),
                    v114 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v110, v111, (uint64_t)v104, (uint64_t)v211, v112, v113), v110, v114 == 1))
              {
                v97 = v98;

                v34 = v97;
              }

            }
            v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
      }
      else
      {
        v18 = 0;
        if (v34)
        {
          do
          {
            for (k = 0; k != v86; ++k)
            {
              if (*(_QWORD *)v218 != v87)
                objc_enumerationMutation(obj);
              v157 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * k);
              objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifierFromData_(v158, v159, (uint64_t)v157, v160, v161, v162);
              v163 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18
                || (objc_msgSend_strokeProvider(self, v164, v165, v166, v167, v168),
                    v169 = (void *)objc_claimAutoreleasedReturnValue(),
                    v173 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v169, v170, (uint64_t)v163, (uint64_t)v212, v171, v172), v169, v173 == -1))
              {
                v156 = v157;

                v18 = v156;
              }

            }
            v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
        else
        {
          do
          {
            for (m = 0; m != v86; ++m)
            {
              if (*(_QWORD *)v218 != v87)
                objc_enumerationMutation(obj);
              v176 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * m);
              objc_msgSend_strokeProvider(self, v81, v82, v83, v84, v85, v204);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifierFromData_(v177, v178, (uint64_t)v176, v179, v180, v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18
                || (objc_msgSend_strokeProvider(self, v183, v184, v185, v186, v187),
                    v188 = (void *)objc_claimAutoreleasedReturnValue(),
                    v192 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v188, v189, (uint64_t)v182, (uint64_t)v212, v190, v191), v188, v192 == -1))
              {
                v198 = v176;

                v18 = v198;
              }
              if (!v34
                || (objc_msgSend_strokeProvider(self, v193, v194, v195, v196, v197),
                    v199 = (void *)objc_claimAutoreleasedReturnValue(),
                    v203 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v199, v200, (uint64_t)v182, (uint64_t)v211, v201, v202), v199, v203 == 1))
              {
                v175 = v176;

                v34 = v175;
              }

            }
            v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v217, (uint64_t)v222, 16, v85);
          }
          while (v86);
        }
      }
    }

    v11 = v209;
  }
LABEL_29:
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v210 = v11;
  v117 = objc_msgSend_countByEnumeratingWithState_objects_count_(v210, v115, (uint64_t)&v213, (uint64_t)v221, 16, v116);
  if (v117)
  {
    v123 = v117;
    v124 = *(_QWORD *)v214;
    do
    {
      for (n = 0; n != v123; ++n)
      {
        if (*(_QWORD *)v214 != v124)
          objc_enumerationMutation(v210);
        v127 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * n);
        objc_msgSend_strokeProvider(self, v118, v119, v120, v121, v122, v204);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifierFromData_(v128, v129, (uint64_t)v127, v130, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18
          || (objc_msgSend_strokeProvider(self, v134, v135, v136, v137, v138),
              v139 = (void *)objc_claimAutoreleasedReturnValue(),
              v143 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v139, v140, (uint64_t)v133, (uint64_t)v212, v141, v142), v139, v143 == -1))
        {
          v149 = v127;

          v18 = v149;
        }
        if (!v34
          || (objc_msgSend_strokeProvider(self, v144, v145, v146, v147, v148),
              v150 = (void *)objc_claimAutoreleasedReturnValue(),
              v154 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v150, v151, (uint64_t)v133, (uint64_t)v211, v152, v153), v150, v154 == 1))
        {
          v126 = v127;

          v34 = v126;
        }

      }
      v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v210, v118, (uint64_t)&v213, (uint64_t)v221, 16, v122);
    }
    while (v123);
  }

  if (v204)
    *v204 = objc_retainAutorelease(v18);
  if (a4)
    *a4 = objc_retainAutorelease(v34);

}

- (id)strokeGroupFromStrokes:(id)a3 ancestorIdentifier:(int64_t)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double x;
  double y;
  double width;
  double height;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
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
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
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
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  double v93;
  double v94;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v102 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E20];
  v13 = objc_msgSend_count(v6, v8, v9, v10, v11, v12);
  objc_msgSend_setWithCapacity_(v7, v14, v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v23 = v6;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v97, (uint64_t)v101, 16, v25);
  if (v26)
  {
    v32 = v26;
    v33 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v98 != v33)
          objc_enumerationMutation(v23);
        v35 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        objc_msgSend_encodedStrokeIdentifier(v35, v27, v28, v29, v30, v31, (_QWORD)v97);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v18, v37, (uint64_t)v36, v38, v39, v40);

        objc_msgSend_bounds(v35, v41, v42, v43, v44, v45);
        v105.origin.x = v46;
        v105.origin.y = v47;
        v105.size.width = v48;
        v105.size.height = v49;
        v103.origin.x = x;
        v103.origin.y = y;
        v103.size.width = width;
        v103.size.height = height;
        v104 = CGRectUnion(v103, v105);
        x = v104.origin.x;
        y = v104.origin.y;
        width = v104.size.width;
        height = v104.size.height;
      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v27, (uint64_t)&v97, (uint64_t)v101, 16, v31);
    }
    while (v32);
  }

  v50 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_firstObject(v23, v51, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifier(v56, v57, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v23, v63, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifier(v68, v69, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strategyIdentifier(self, v75, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v23, v81, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v86, v87, v88, v89, v90, v91);
  StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v50, v92, a4, (uint64_t)v18, (uint64_t)v62, (uint64_t)v74, 1, v80, x, y, width, height, 1.0, v93, v94);

  return StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

- (id)strokeGroupFromGroup:(id)a3 addingStrokes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double width;
  double v31;
  double height;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  uint64_t i;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  double v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  double v124;
  const char *v125;
  id v126;
  id v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  double v140;
  void *v141;
  double v143;
  double v144;
  id v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  uint64_t v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  v152 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E20];
  v14 = objc_msgSend_count(v7, v9, v10, v11, v12, v13);
  objc_msgSend_setWithCapacity_(v8, v15, v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v6, v20, v21, v22, v23, v24);
  x = v25;
  y = v27;
  width = v29;
  height = v31;
  objc_msgSend_firstStrokeOrigin(v6, v33, v34, v35, v36, v37);
  v143 = v39;
  v144 = v38;
  objc_msgSend_firstStrokeOrigin(v6, v40, v41, v42, v43, v44);
  v46 = v45;
  objc_msgSend_firstStrokeOrigin(v6, v47, v48, v49, v50, v51);
  v53 = v52;
  objc_msgSend_firstStrokeOrigin(v6, v54, v55, v56, v57, v58);
  v60 = v59;
  objc_msgSend_firstStrokeOrigin(v6, v61, v62, v63, v64, v65);
  v67 = v66;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v68 = v7;
  v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v147, (uint64_t)v151, 16, v70);
  if (v71)
  {
    v77 = v71;
    v78 = v60 * v67 + v46 * v53;
    v79 = *(_QWORD *)v148;
    do
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v148 != v79)
          objc_enumerationMutation(v68);
        v81 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
        objc_msgSend_encodedStrokeIdentifier(v81, v72, v73, v74, v75, v76, *(_QWORD *)&v143, *(_QWORD *)&v144);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v19, v83, (uint64_t)v82, v84, v85, v86);

        objc_msgSend_bounds(v81, v87, v88, v89, v90, v91);
        v155.origin.x = v92;
        v155.origin.y = v93;
        v155.size.width = v94;
        v155.size.height = v95;
        v153.origin.x = x;
        v153.origin.y = y;
        v153.size.width = width;
        v153.size.height = height;
        v154 = CGRectUnion(v153, v155);
        x = v154.origin.x;
        y = v154.origin.y;
        width = v154.size.width;
        height = v154.size.height;
        objc_msgSend_bounds(v81, v96, v97, v98, v99, v100);
        v102 = v101;
        objc_msgSend_bounds(v81, v103, v104, v105, v106, v107);
        v109 = v108;
        objc_msgSend_bounds(v81, v110, v111, v112, v113, v114);
        v116 = v115;
        objc_msgSend_bounds(v81, v117, v118, v119, v120, v121);
        if (v116 * v122 + v102 * v109 < v78)
        {
          objc_msgSend_bounds(v81, v72, v73, v74, v75, v76);
          v143 = v124;
          v144 = v123;
        }
      }
      v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v72, (uint64_t)&v147, (uint64_t)v151, 16, v76);
    }
    while (v77);
  }

  v145 = 0;
  v146 = 0;
  objc_msgSend_firstStrokeIdentifier_lastStrokeIdentifier_inGroup_addingStrokeIdentifiers_removingStrokeIdentifiers_(self, v125, (uint64_t)&v146, (uint64_t)&v145, (uint64_t)v6, (uint64_t)v19, 0);
  v126 = v146;
  v127 = v145;
  v133 = objc_msgSend_classification(v6, v128, v129, v130, v131, v132);
  objc_msgSend_groupingConfidence(v6, v134, v135, v136, v137, v138);
  objc_msgSend_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_(v6, v139, (uint64_t)v19, 0, (uint64_t)v126, (uint64_t)v127, v133, x, y, width, height, v140, v144, v143);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  return v141;
}

- (id)strokeGroupMergingGroup:(id)a3 withGroup:(id)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
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
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend_strokeIdentifiers(a4, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokesForIdentifiers_(self, v20, (uint64_t)v19, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v6, v25, (uint64_t)v24, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_strokeGroupFromGroup_addingStrokes_(self, v30, (uint64_t)v7, (uint64_t)v29, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeProvider, 0);
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  CHStrokeGroupingResult *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v8 = [CHStrokeGroupingResult alloc];
  objc_msgSend_set(MEMORY[0x1E0C99E60], v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v8, v15, (uint64_t)v14, 0, 0, v16);

  return v17;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  CHDrawing *v11;

  v11 = objc_alloc_init(CHDrawing);
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 1.0;
  if (a8)
    *a8 = 0;
  return v11;
}

@end

@implementation SCNMorpher(AVTExtension)

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension
{
  void (**v4)(id, void *, _QWORD, uint64_t);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  id v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t i;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  unint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  unint64_t v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  uint64_t v145;
  void *v146;
  id v147;
  void *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  void *v155;
  id obj;
  void *v157;
  void *v158;
  _QWORD v159[5];
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint8_t v168[128];
  uint8_t buf[4];
  void *v170;
  __int16 v171;
  void *v172;
  _BYTE v173[128];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "correctiveDriverCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(a1, "targets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "targetsAndInBetween");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "inBetweenCounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = a1;
    objc_msgSend(a1, "inBetweenWeights");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v143 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v147 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend(v6, "count");
    v148 = v6;
    v137 = (void *)v9;
    v138 = (void *)v7;
    v146 = v8;
    v157 = v10;
    if (v11)
    {
      v12 = v11;
      v149 = 0;
      v150 = 0;
      v140 = 0;
      v141 = 0;
      v154 = 0;
      v139 = 0;
      v144 = 0;
      v13 = 0;
      v136 = 0;
      v14 = 0;
      v15 = 0;
      v145 = v11;
      while (1)
      {
        v153 = v14;
        objc_msgSend(v148, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsString:", CFSTR("__"));

        if (!v18)
        {
          v151 = v15;
          objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedIntegerValue");

          if (v24 < 2)
          {
            v14 = v153;
            v36 = v157;
            if (v149)
              objc_msgSend(v149, "addObject:", &unk_1EA655978);
            else
              v149 = 0;
            v34 = v151;
            v35 = v158;
          }
          else
          {
            v14 = v153;
            if (!v149)
            {
              v149 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

              if (objc_msgSend(v157, "count"))
              {
                v26 = 0;
                do
                {
                  objc_msgSend(v149, "addObject:", &unk_1EA655978);
                  ++v26;
                }
                while (v26 < objc_msgSend(v157, "count"));
              }
              v141 = v25;
              v14 = v153;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "addObject:", v27);

            v28 = v24 - 1;
            v29 = v150;
            do
            {
              v30 = v14;
              v31 = v29++;
              objc_msgSend(v138, "objectAtIndexedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v147, "addObject:", v32);

              v14 = v30 + 1;
              objc_msgSend(v137, "objectAtIndexedSubscript:", v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v141, "addObject:", v33);

              --v28;
            }
            while (v28);
            v150 = v29;
            v12 = v145;
            v8 = v146;
            v34 = v151;
            v36 = v157;
            v35 = v158;
          }
          objc_msgSend(v147, "addObject:", v16);
          ++v150;
          objc_msgSend(v35, "weightForTargetAtIndex:", v34);
          *(float *)&v65 = v65;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "addObject:", v66);

          v15 = v151;
          objc_msgSend(v36, "addObject:", v16);
          goto LABEL_61;
        }
        objc_msgSend(v16, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("__"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "count");
        if (v21 == 1)
        {
          avt_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v170 = v20;
            _os_log_error_impl(&dword_1DD1FA000, v22, OS_LOG_TYPE_ERROR, "Error: Failed to create corrective with only one target: %@", buf, 0xCu);
          }

        }
        else
        {
          v37 = v21;
          v152 = v15;
          v155 = v13;
          v166 = 0u;
          v167 = 0u;
          v164 = 0u;
          v165 = 0u;
          v38 = v20;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v164, v173, 16);
          v40 = v158;
          v142 = v20;
          if (!v39)
          {

LABEL_37:
            v51 = v140;
            if (!v154)
              v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v146, "objectAtIndexedSubscript:", v152);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "unsignedIntegerValue");

            v54 = v153;
            if (v53 < 2)
            {
              if (v144)
                objc_msgSend(v144, "addObject:", &unk_1EA655978);
              else
                v144 = 0;
              v64 = v146;
              v59 = v150;
            }
            else
            {
              if (!v144)
              {
                v144 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

                if (objc_msgSend(v139, "count"))
                {
                  v56 = 0;
                  do
                  {
                    objc_msgSend(v144, "addObject:", &unk_1EA655978);
                    ++v56;
                  }
                  while (v56 < objc_msgSend(v139, "count"));
                }
                v155 = v55;
                v54 = v153;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "addObject:", v57);

              v58 = v53 - 1;
              v59 = v150;
              do
              {
                v60 = v54;
                v61 = v59++;
                objc_msgSend(v138, "objectAtIndexedSubscript:", v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v154, "addObject:", v62);

                v54 = v60 + 1;
                objc_msgSend(v137, "objectAtIndexedSubscript:", v60);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v155, "addObject:", v63);

                --v58;
              }
              while (v58);
              v153 = v54;
              v64 = v146;
              v51 = v140;
            }
            objc_msgSend(v154, "addObject:", v16);
            v67 = v139;
            if (!v139)
            {
              v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

              v51 = v68;
            }
            v150 = v59 + 1;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = v67;
            objc_msgSend(v67, "addObject:", v69);

            v140 = v51;
            objc_msgSend(v51, "addObjectsFromArray:", v38);
            v13 = v155;
            v15 = v152;
            v8 = v64;
            v20 = v142;
            goto LABEL_60;
          }
          v41 = v39;
          v42 = *(_QWORD *)v165;
          v43 = 1;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v165 != v42)
                objc_enumerationMutation(v38);
              v45 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
              if (objc_msgSend(v40, "_weightIndexForTargetNamed:", v45) == 0x7FFFFFFFFFFFFFFFLL)
              {
                avt_default_log();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v16, "name");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v170 = v45;
                  v171 = 2112;
                  v172 = v48;
                  _os_log_error_impl(&dword_1DD1FA000, v46, OS_LOG_TYPE_ERROR, "Error: Failed to find index of driving target %@ for corrective %@", buf, 0x16u);

                }
                if (v4)
                {
                  objc_msgSend(v16, "name");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(id, void *, void *, uint64_t))v4)[2](v4, v47, v45, v37);

                }
                v43 = 0;
                v40 = v158;
              }
            }
            v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v164, v173, 16);
          }
          while (v41);

          v20 = v142;
          if ((v43 & 1) != 0)
            goto LABEL_37;
          v8 = v146;
          if (v146)
          {
            objc_msgSend(v146, "objectAtIndexedSubscript:", v152);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "unsignedIntegerValue");

          }
          else
          {
            v50 = 1;
          }
          v15 = v152;
          v136 += v50;
          v13 = v155;
        }
LABEL_60:

        v14 = v153;
        v12 = v145;
LABEL_61:

        if (++v15 == v12)
          goto LABEL_64;
      }
    }
    v136 = 0;
    v13 = 0;
    v144 = 0;
    v139 = 0;
    v140 = 0;
    v154 = 0;
    v141 = 0;
    v149 = 0;
LABEL_64:
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v140, "count"));
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    obj = v140;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v168, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v161;
      do
      {
        for (j = 0; j != v72; ++j)
        {
          v75 = v70;
          if (*(_QWORD *)v161 != v73)
            objc_enumerationMutation(obj);
          v76 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
          v159[0] = MEMORY[0x1E0C809B0];
          v159[1] = 3221225472;
          v159[2] = __76__SCNMorpher_AVTExtension__avt_buildInternalSupportForCorrectivesWithBlock___block_invoke;
          v159[3] = &unk_1EA61D820;
          v159[4] = v76;
          v77 = objc_msgSend(v157, "indexOfObjectPassingTest:", v159);
          if (v77 == 0x7FFFFFFFFFFFFFFFLL)
          {
            avt_default_log();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v170 = v76;
              _os_log_error_impl(&dword_1DD1FA000, v78, OS_LOG_TYPE_ERROR, "Error: Failed to find index for driving target %@", buf, 0xCu);
            }
            v70 = v75;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v77);
            v78 = objc_claimAutoreleasedReturnValue();
            v70 = v75;
            objc_msgSend(v75, "addObject:", v78);
          }

        }
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v168, 16);
      }
      while (v72);
    }

    v79 = objc_msgSend(v147, "count");
    if (v79 < objc_msgSend(v149, "count"))
    {
      avt_default_log();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.6(v80, v81, v82, v83, v84, v85, v86, v87);

    }
    v88 = objc_msgSend(v154, "count");
    if (v88 < objc_msgSend(v144, "count"))
    {
      avt_default_log();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.5(v89, v90, v91, v92, v93, v94, v95, v96);

    }
    v97 = objc_msgSend(v147, "count");
    v98 = objc_msgSend(v154, "count") + v97;
    if (v98 != objc_msgSend(v138, "count") - v136)
    {
      avt_default_log();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.4(v99, v100, v101, v102, v103, v104, v105, v106);

    }
    if (objc_msgSend(v144, "count"))
    {
      v107 = objc_msgSend(v149, "count");
      v108 = objc_msgSend(v144, "count") + v107;
      if (v108 != objc_msgSend(v146, "count"))
      {
        avt_default_log();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
          -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.3(v109, v110, v111, v112, v113, v114, v115, v116);

      }
      v117 = objc_msgSend(v141, "count");
      v118 = objc_msgSend(v13, "count") + v117;
      if (v118 != objc_msgSend(v137, "count"))
      {
        avt_default_log();
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.2(v119, v120, v121, v122, v123, v124, v125, v126);

      }
      v127 = objc_msgSend(v144, "count");
      if (v127 != objc_msgSend(v139, "count"))
      {
        avt_default_log();
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          -[SCNMorpher(AVTExtension) avt_buildInternalSupportForCorrectivesWithBlock:].cold.1(v128, v129, v130, v131, v132, v133, v134, v135);

      }
    }
    if (v139)
      objc_msgSend(v158, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", v147, v149, v141, v154, v139, v70, v144, v13);

  }
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to correctly separate correctives", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to correctly separate correctives", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to correctly separate correctives", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to correctly separate correctives", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to correctly separate correctives", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)avt_buildInternalSupportForCorrectivesWithBlock:()AVTExtension .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to correctly separate correctives", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

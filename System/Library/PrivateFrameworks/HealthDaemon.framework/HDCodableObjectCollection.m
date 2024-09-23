@implementation HDCodableObjectCollection

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, a3);
}

- (void)addCategorySamples:(id)a3
{
  id v4;
  NSMutableArray *categorySamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  categorySamples = self->_categorySamples;
  v8 = v4;
  if (!categorySamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_categorySamples;
    self->_categorySamples = v6;

    v4 = v8;
    categorySamples = self->_categorySamples;
  }
  -[NSMutableArray addObject:](categorySamples, "addObject:", v4);

}

- (unint64_t)count
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = -[NSMutableArray count](self->_categorySamples, "count");
  v4 = -[NSMutableArray count](self->_quantitySamples, "count") + v3;
  v5 = -[NSMutableArray count](self->_workouts, "count");
  v6 = v4 + v5 + -[NSMutableArray count](self->_correlations, "count");
  v7 = -[NSMutableArray count](self->_activityCaches, "count");
  v8 = v7 + -[NSMutableArray count](self->_activityGoalSchedules, "count");
  v9 = v6 + v8 + -[NSMutableArray count](self->_pauseRingsSchedules, "count");
  v10 = -[NSMutableArray count](self->_binarySamples, "count");
  v11 = v10 + -[NSMutableArray count](self->_deletedSamples, "count");
  v12 = v11 + -[NSMutableArray count](self->_locationSeries, "count");
  v13 = v9 + v12 + -[NSMutableArray count](self->_cdaDocumentSamples, "count");
  v14 = -[NSMutableArray count](self->_fitnessFriendAchievements, "count");
  v15 = v14 + -[NSMutableArray count](self->_fitnessFriendActivitySnapshots, "count");
  v16 = v15 + -[NSMutableArray count](self->_fitnessFriendWorkouts, "count");
  v17 = v16 + -[NSMutableArray count](self->_ecgSamples, "count");
  v18 = v13 + v17 + -[HDCodableGeneratedObjectCollection count](self->_generatedObjectCollection, "count");
  v19 = -[NSMutableArray count](self->_sleepSchedules, "count");
  v20 = v19 + -[NSMutableArray count](self->_visionSamples, "count");
  v21 = v20 + -[NSMutableArray count](self->_stateOfMindLogs, "count");
  v22 = v21 + -[NSMutableArray count](self->_scoredAssessmentSamples, "count");
  return v18 + v22 + -[NSMutableArray count](self->_workoutZones, "count");
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSMutableArray *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSMutableArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSMutableArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_sourceBundleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_source)
    PBDataWriterWriteSubmessage();
  v184 = 0u;
  v183 = 0u;
  v182 = 0u;
  v181 = 0u;
  v5 = self->_categorySamples;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v181, v204, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v182;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v182 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v181, v204, 16);
    }
    while (v7);
  }

  v180 = 0u;
  v179 = 0u;
  v178 = 0u;
  v177 = 0u;
  v10 = self->_quantitySamples;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v177, v203, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v178;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v178 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v177, v203, 16);
    }
    while (v12);
  }

  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  v15 = self->_workouts;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v173, v202, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v174;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v174 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v173, v202, 16);
    }
    while (v17);
  }

  v172 = 0u;
  v171 = 0u;
  v170 = 0u;
  v169 = 0u;
  v20 = self->_correlations;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v169, v201, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v170;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v170 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v169, v201, 16);
    }
    while (v22);
  }

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v25 = self->_activityCaches;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v165, v200, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v166;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v166 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v165, v200, 16);
    }
    while (v27);
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v30 = self->_binarySamples;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v161, v199, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v162;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v162 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v161, v199, 16);
    }
    while (v32);
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v35 = self->_deletedSamples;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v157, v198, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v158;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v158 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v157, v198, 16);
    }
    while (v37);
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v40 = self->_locationSeries;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v153, v197, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v154;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v154 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v153, v197, 16);
    }
    while (v42);
  }

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v45 = self->_cdaDocumentSamples;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v149, v196, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v150;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v150 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v149, v196, 16);
    }
    while (v47);
  }

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v50 = self->_fitnessFriendActivitySnapshots;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v145, v195, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v146;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v146 != v53)
          objc_enumerationMutation(v50);
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v145, v195, 16);
    }
    while (v52);
  }

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v55 = self->_fitnessFriendAchievements;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v141, v194, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v142;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v142 != v58)
          objc_enumerationMutation(v55);
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v141, v194, 16);
    }
    while (v57);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v60 = self->_fitnessFriendWorkouts;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v137, v193, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v138;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v138 != v63)
          objc_enumerationMutation(v60);
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v137, v193, 16);
    }
    while (v62);
  }

  if (self->_generatedObjectCollection)
    PBDataWriterWriteSubmessage();
  if (self->_provenance)
    PBDataWriterWriteSubmessage();
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v65 = self->_sleepSchedules;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v133, v192, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v134;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v134 != v68)
          objc_enumerationMutation(v65);
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v133, v192, 16);
    }
    while (v67);
  }

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v70 = self->_ecgSamples;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v129, v191, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v130;
    do
    {
      v74 = 0;
      do
      {
        if (*(_QWORD *)v130 != v73)
          objc_enumerationMutation(v70);
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v129, v191, 16);
    }
    while (v72);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v75 = self->_visionSamples;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v125, v190, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v126;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v126 != v78)
          objc_enumerationMutation(v75);
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v125, v190, 16);
    }
    while (v77);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v80 = self->_stateOfMindLogs;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v121, v189, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v122;
    do
    {
      v84 = 0;
      do
      {
        if (*(_QWORD *)v122 != v83)
          objc_enumerationMutation(v80);
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v121, v189, 16);
    }
    while (v82);
  }

  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v85 = self->_scoredAssessmentSamples;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v117, v188, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v118;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v118 != v88)
          objc_enumerationMutation(v85);
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v117, v188, 16);
    }
    while (v87);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v90 = self->_workoutZones;
  v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v113, v187, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v114;
    do
    {
      v94 = 0;
      do
      {
        if (*(_QWORD *)v114 != v93)
          objc_enumerationMutation(v90);
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v90, "countByEnumeratingWithState:objects:count:", &v113, v187, 16);
    }
    while (v92);
  }

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v95 = self->_activityGoalSchedules;
  v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v109, v186, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v110;
    do
    {
      v99 = 0;
      do
      {
        if (*(_QWORD *)v110 != v98)
          objc_enumerationMutation(v95);
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v109, v186, 16);
    }
    while (v97);
  }

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v100 = self->_pauseRingsSchedules;
  v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v105, v185, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v106;
    do
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v106 != v103)
          objc_enumerationMutation(v100);
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v105, v185, 16);
    }
    while (v102);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workouts, 0);
  objc_storeStrong((id *)&self->_workoutZones, 0);
  objc_storeStrong((id *)&self->_visionSamples, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_stateOfMindLogs, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sleepSchedules, 0);
  objc_storeStrong((id *)&self->_scoredAssessmentSamples, 0);
  objc_storeStrong((id *)&self->_quantitySamples, 0);
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_pauseRingsSchedules, 0);
  objc_storeStrong((id *)&self->_locationSeries, 0);
  objc_storeStrong((id *)&self->_generatedObjectCollection, 0);
  objc_storeStrong((id *)&self->_fitnessFriendWorkouts, 0);
  objc_storeStrong((id *)&self->_fitnessFriendActivitySnapshots, 0);
  objc_storeStrong((id *)&self->_fitnessFriendAchievements, 0);
  objc_storeStrong((id *)&self->_ecgSamples, 0);
  objc_storeStrong((id *)&self->_deletedSamples, 0);
  objc_storeStrong((id *)&self->_correlations, 0);
  objc_storeStrong((id *)&self->_cdaDocumentSamples, 0);
  objc_storeStrong((id *)&self->_categorySamples, 0);
  objc_storeStrong((id *)&self->_binarySamples, 0);
  objc_storeStrong((id *)&self->_activityGoalSchedules, 0);
  objc_storeStrong((id *)&self->_activityCaches, 0);
}

- (void)addQuantitySamples:(id)a3
{
  id v4;
  NSMutableArray *quantitySamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  quantitySamples = self->_quantitySamples;
  v8 = v4;
  if (!quantitySamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_quantitySamples;
    self->_quantitySamples = v6;

    v4 = v8;
    quantitySamples = self->_quantitySamples;
  }
  -[NSMutableArray addObject:](quantitySamples, "addObject:", v4);

}

- (void)addBinarySamples:(id)a3
{
  id v4;
  NSMutableArray *binarySamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  binarySamples = self->_binarySamples;
  v8 = v4;
  if (!binarySamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_binarySamples;
    self->_binarySamples = v6;

    v4 = v8;
    binarySamples = self->_binarySamples;
  }
  -[NSMutableArray addObject:](binarySamples, "addObject:", v4);

}

- (void)addFitnessFriendActivitySnapshots:(id)a3
{
  id v4;
  NSMutableArray *fitnessFriendActivitySnapshots;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fitnessFriendActivitySnapshots = self->_fitnessFriendActivitySnapshots;
  v8 = v4;
  if (!fitnessFriendActivitySnapshots)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fitnessFriendActivitySnapshots;
    self->_fitnessFriendActivitySnapshots = v6;

    v4 = v8;
    fitnessFriendActivitySnapshots = self->_fitnessFriendActivitySnapshots;
  }
  -[NSMutableArray addObject:](fitnessFriendActivitySnapshots, "addObject:", v4);

}

- (void)addFitnessFriendAchievements:(id)a3
{
  id v4;
  NSMutableArray *fitnessFriendAchievements;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fitnessFriendAchievements = self->_fitnessFriendAchievements;
  v8 = v4;
  if (!fitnessFriendAchievements)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fitnessFriendAchievements;
    self->_fitnessFriendAchievements = v6;

    v4 = v8;
    fitnessFriendAchievements = self->_fitnessFriendAchievements;
  }
  -[NSMutableArray addObject:](fitnessFriendAchievements, "addObject:", v4);

}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (id)decodedObjects
{
  id v3;
  void (**v4)(void *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  _QWORD aBlock[4];
  id v238;
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  uint64_t v258;

  v258 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HDCodableObjectCollection_HDCodingSupport__decodedObjects__block_invoke;
  aBlock[3] = &unk_1E6CF75E0;
  v160 = v3;
  v238 = v160;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  v233 = 0u;
  v234 = 0u;
  v235 = 0u;
  v236 = 0u;
  -[HDCodableObjectCollection categorySamples](self, "categorySamples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v233, v257, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v234;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v234 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v233 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6378], "createWithCodable:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v12);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v233, v257, 16);
    }
    while (v7);
  }

  v232 = 0u;
  v231 = 0u;
  v230 = 0u;
  v229 = 0u;
  -[HDCodableObjectCollection quantitySamples](self, "quantitySamples");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v229, v256, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v230;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v230 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6A40], "createWithCodable:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB6A40], "migrateCodableObject:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v4[2](v4, v20);

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v229, v256, 16);
    }
    while (v15);
  }

  v228 = 0u;
  v227 = 0u;
  v226 = 0u;
  v225 = 0u;
  -[HDCodableObjectCollection workouts](self, "workouts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v225, v255, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v226;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v226 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * v25);
        v27 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6DD0], "createWithCodable:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v28);

        objc_autoreleasePoolPop(v27);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v225, v255, 16);
    }
    while (v23);
  }

  v223 = 0u;
  v224 = 0u;
  v221 = 0u;
  v222 = 0u;
  -[HDCodableObjectCollection correlations](self, "correlations");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v221, v254, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v222;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v222 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * v33);
        v35 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6518], "createWithCodable:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v36);

        objc_autoreleasePoolPop(v35);
        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v221, v254, 16);
    }
    while (v31);
  }

  v219 = 0u;
  v220 = 0u;
  v217 = 0u;
  v218 = 0u;
  -[HDCodableObjectCollection activityCaches](self, "activityCaches");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v217, v253, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v218;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v218 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * v41);
        v43 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6268], "createWithCodable:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v44);

        objc_autoreleasePoolPop(v43);
        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v217, v253, 16);
    }
    while (v39);
  }

  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  -[HDCodableObjectCollection activityGoalSchedules](self, "activityGoalSchedules");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v213, v252, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v214;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v214 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v213 + 1) + 8 * v49);
        v51 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6270], "createWithCodable:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v52);

        objc_autoreleasePoolPop(v51);
        ++v49;
      }
      while (v47 != v49);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v213, v252, 16);
    }
    while (v47);
  }

  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  -[HDCodableObjectCollection pauseRingsSchedules](self, "pauseRingsSchedules");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v209, v251, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v210;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v210 != v56)
          objc_enumerationMutation(v53);
        v58 = *(_QWORD *)(*((_QWORD *)&v209 + 1) + 8 * v57);
        v59 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB69D8], "createWithCodable:", v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v60);

        objc_autoreleasePoolPop(v59);
        ++v57;
      }
      while (v55 != v57);
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v209, v251, 16);
    }
    while (v55);
  }

  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  -[HDCodableObjectCollection binarySamples](self, "binarySamples");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v205, v250, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v206;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v206 != v64)
          objc_enumerationMutation(v61);
        v66 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 8 * v65);
        v67 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6AD8], "createWithCodable:", v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v68);

        objc_autoreleasePoolPop(v67);
        ++v65;
      }
      while (v63 != v65);
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v205, v250, 16);
    }
    while (v63);
  }

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  -[HDCodableObjectCollection ecgSamples](self, "ecgSamples");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v201, v249, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v202;
    do
    {
      v73 = 0;
      do
      {
        if (*(_QWORD *)v202 != v72)
          objc_enumerationMutation(v69);
        v74 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * v73);
        v75 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6650], "createWithCodable:", v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v76);

        objc_autoreleasePoolPop(v75);
        ++v73;
      }
      while (v71 != v73);
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v201, v249, 16);
    }
    while (v71);
  }

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  -[HDCodableObjectCollection locationSeries](self, "locationSeries");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v197, v248, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v198;
    do
    {
      v81 = 0;
      do
      {
        if (*(_QWORD *)v198 != v80)
          objc_enumerationMutation(v77);
        v82 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * v81);
        v83 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6E58], "createWithCodable:", v82);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v84);

        objc_autoreleasePoolPop(v83);
        ++v81;
      }
      while (v79 != v81);
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v197, v248, 16);
    }
    while (v79);
  }

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  -[HDCodableObjectCollection cdaDocumentSamples](self, "cdaDocumentSamples");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v193, v247, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v194;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v194 != v88)
          objc_enumerationMutation(v85);
        v90 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * v89);
        v91 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6358], "createWithCodable:", v90);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v92);

        objc_autoreleasePoolPop(v91);
        ++v89;
      }
      while (v87 != v89);
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v193, v247, 16);
    }
    while (v87);
  }

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  -[HDCodableObjectCollection fitnessFriendAchievements](self, "fitnessFriendAchievements");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v189, v246, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v190;
    do
    {
      v97 = 0;
      do
      {
        if (*(_QWORD *)v190 != v96)
          objc_enumerationMutation(v93);
        v98 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * v97);
        v99 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6FA8], "createWithCodable:", v98);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v100);

        objc_autoreleasePoolPop(v99);
        ++v97;
      }
      while (v95 != v97);
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v189, v246, 16);
    }
    while (v95);
  }

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  -[HDCodableObjectCollection fitnessFriendActivitySnapshots](self, "fitnessFriendActivitySnapshots");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v185, v245, 16);
  if (v102)
  {
    v103 = v102;
    v104 = *(_QWORD *)v186;
    do
    {
      v105 = 0;
      do
      {
        if (*(_QWORD *)v186 != v104)
          objc_enumerationMutation(v101);
        v106 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * v105);
        v107 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6FB0], "createWithCodable:", v106);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v108);

        objc_autoreleasePoolPop(v107);
        ++v105;
      }
      while (v103 != v105);
      v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v185, v245, 16);
    }
    while (v103);
  }

  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  -[HDCodableObjectCollection fitnessFriendWorkouts](self, "fitnessFriendWorkouts");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v181, v244, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v182;
    do
    {
      v113 = 0;
      do
      {
        if (*(_QWORD *)v182 != v112)
          objc_enumerationMutation(v109);
        v114 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * v113);
        v115 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6FB8], "createWithCodable:", v114);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v116);

        objc_autoreleasePoolPop(v115);
        ++v113;
      }
      while (v111 != v113);
      v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v181, v244, 16);
    }
    while (v111);
  }

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  -[HDCodableObjectCollection sleepSchedules](self, "sleepSchedules");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v177, v243, 16);
  if (v118)
  {
    v119 = v118;
    v120 = *(_QWORD *)v178;
    do
    {
      v121 = 0;
      do
      {
        if (*(_QWORD *)v178 != v120)
          objc_enumerationMutation(v117);
        v122 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * v121);
        v123 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6C08], "createWithCodable:", v122);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v124);

        objc_autoreleasePoolPop(v123);
        ++v121;
      }
      while (v119 != v121);
      v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v177, v243, 16);
    }
    while (v119);
  }

  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  -[HDCodableObjectCollection visionSamples](self, "visionSamples");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v173, v242, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v174;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v174 != v128)
          objc_enumerationMutation(v125);
        v130 = *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * v129);
        v131 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6DB8], "createWithCodable:", v130);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v132);

        objc_autoreleasePoolPop(v131);
        ++v129;
      }
      while (v127 != v129);
      v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v173, v242, 16);
    }
    while (v127);
  }

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  -[HDCodableObjectCollection stateOfMindLogs](self, "stateOfMindLogs");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v169, v241, 16);
  if (v134)
  {
    v135 = v134;
    v136 = *(_QWORD *)v170;
    do
    {
      v137 = 0;
      do
      {
        if (*(_QWORD *)v170 != v136)
          objc_enumerationMutation(v133);
        v138 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * v137);
        v139 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6C48], "createWithCodable:", v138);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v140);

        objc_autoreleasePoolPop(v139);
        ++v137;
      }
      while (v135 != v137);
      v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v169, v241, 16);
    }
    while (v135);
  }

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  -[HDCodableObjectCollection scoredAssessmentSamples](self, "scoredAssessmentSamples");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v165, v240, 16);
  if (v142)
  {
    v143 = v142;
    v144 = *(_QWORD *)v166;
    do
    {
      v145 = 0;
      do
      {
        if (*(_QWORD *)v166 != v144)
          objc_enumerationMutation(v141);
        v146 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * v145);
        v147 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6B10], "createWithCodable:", v146);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v148);

        objc_autoreleasePoolPop(v147);
        ++v145;
      }
      while (v143 != v145);
      v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v165, v240, 16);
    }
    while (v143);
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  -[HDCodableObjectCollection workoutZones](self, "workoutZones");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v161, v239, 16);
  if (v150)
  {
    v151 = v150;
    v152 = *(_QWORD *)v162;
    do
    {
      v153 = 0;
      do
      {
        if (*(_QWORD *)v162 != v152)
          objc_enumerationMutation(v149);
        v154 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * v153);
        v155 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6EC8], "createWithCodable:", v154);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v156);

        objc_autoreleasePoolPop(v155);
        ++v153;
      }
      while (v151 != v153);
      v151 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v161, v239, 16);
    }
    while (v151);
  }

  -[HDCodableGeneratedObjectCollection decodedObjects](self->_generatedObjectCollection, "decodedObjects");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "addObjectsFromArray:", v157);

  v158 = v160;
  return v158;
}

- (NSMutableArray)categorySamples
{
  return self->_categorySamples;
}

- (NSMutableArray)quantitySamples
{
  return self->_quantitySamples;
}

uint64_t __60__HDCodableObjectCollection_HDCodingSupport__decodedObjects__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

- (NSMutableArray)workouts
{
  return self->_workouts;
}

- (NSMutableArray)correlations
{
  return self->_correlations;
}

- (NSMutableArray)activityCaches
{
  return self->_activityCaches;
}

- (NSMutableArray)binarySamples
{
  return self->_binarySamples;
}

- (NSMutableArray)locationSeries
{
  return self->_locationSeries;
}

- (NSMutableArray)cdaDocumentSamples
{
  return self->_cdaDocumentSamples;
}

- (NSMutableArray)fitnessFriendAchievements
{
  return self->_fitnessFriendAchievements;
}

- (NSMutableArray)fitnessFriendActivitySnapshots
{
  return self->_fitnessFriendActivitySnapshots;
}

- (NSMutableArray)fitnessFriendWorkouts
{
  return self->_fitnessFriendWorkouts;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void)setProvenance:(id)a3
{
  objc_storeStrong((id *)&self->_provenance, a3);
}

- (void)addActivityCaches:(id)a3
{
  id v4;
  NSMutableArray *activityCaches;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  activityCaches = self->_activityCaches;
  v8 = v4;
  if (!activityCaches)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_activityCaches;
    self->_activityCaches = v6;

    v4 = v8;
    activityCaches = self->_activityCaches;
  }
  -[NSMutableArray addObject:](activityCaches, "addObject:", v4);

}

- (HDCodableSource)source
{
  return self->_source;
}

- (HDCodableProvenance)provenance
{
  return self->_provenance;
}

- (void)addWorkouts:(id)a3
{
  id v4;
  NSMutableArray *workouts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  workouts = self->_workouts;
  v8 = v4;
  if (!workouts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_workouts;
    self->_workouts = v6;

    v4 = v8;
    workouts = self->_workouts;
  }
  -[NSMutableArray addObject:](workouts, "addObject:", v4);

}

- (void)addDeletedSamples:(id)a3
{
  id v4;
  NSMutableArray *deletedSamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  deletedSamples = self->_deletedSamples;
  v8 = v4;
  if (!deletedSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_deletedSamples;
    self->_deletedSamples = v6;

    v4 = v8;
    deletedSamples = self->_deletedSamples;
  }
  -[NSMutableArray addObject:](deletedSamples, "addObject:", v4);

}

- (BOOL)hasSourceBundleIdentifier
{
  return self->_sourceBundleIdentifier != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)clearCategorySamples
{
  -[NSMutableArray removeAllObjects](self->_categorySamples, "removeAllObjects");
}

- (unint64_t)categorySamplesCount
{
  return -[NSMutableArray count](self->_categorySamples, "count");
}

- (id)categorySamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categorySamples, "objectAtIndex:", a3);
}

+ (Class)categorySamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearQuantitySamples
{
  -[NSMutableArray removeAllObjects](self->_quantitySamples, "removeAllObjects");
}

- (unint64_t)quantitySamplesCount
{
  return -[NSMutableArray count](self->_quantitySamples, "count");
}

- (id)quantitySamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_quantitySamples, "objectAtIndex:", a3);
}

+ (Class)quantitySamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearWorkouts
{
  -[NSMutableArray removeAllObjects](self->_workouts, "removeAllObjects");
}

- (unint64_t)workoutsCount
{
  return -[NSMutableArray count](self->_workouts, "count");
}

- (id)workoutsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_workouts, "objectAtIndex:", a3);
}

+ (Class)workoutsType
{
  return (Class)objc_opt_class();
}

- (void)clearCorrelations
{
  -[NSMutableArray removeAllObjects](self->_correlations, "removeAllObjects");
}

- (void)addCorrelations:(id)a3
{
  id v4;
  NSMutableArray *correlations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  correlations = self->_correlations;
  v8 = v4;
  if (!correlations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_correlations;
    self->_correlations = v6;

    v4 = v8;
    correlations = self->_correlations;
  }
  -[NSMutableArray addObject:](correlations, "addObject:", v4);

}

- (unint64_t)correlationsCount
{
  return -[NSMutableArray count](self->_correlations, "count");
}

- (id)correlationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_correlations, "objectAtIndex:", a3);
}

+ (Class)correlationsType
{
  return (Class)objc_opt_class();
}

- (void)clearActivityCaches
{
  -[NSMutableArray removeAllObjects](self->_activityCaches, "removeAllObjects");
}

- (unint64_t)activityCachesCount
{
  return -[NSMutableArray count](self->_activityCaches, "count");
}

- (id)activityCachesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activityCaches, "objectAtIndex:", a3);
}

+ (Class)activityCachesType
{
  return (Class)objc_opt_class();
}

- (void)clearBinarySamples
{
  -[NSMutableArray removeAllObjects](self->_binarySamples, "removeAllObjects");
}

- (unint64_t)binarySamplesCount
{
  return -[NSMutableArray count](self->_binarySamples, "count");
}

- (id)binarySamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_binarySamples, "objectAtIndex:", a3);
}

+ (Class)binarySamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearDeletedSamples
{
  -[NSMutableArray removeAllObjects](self->_deletedSamples, "removeAllObjects");
}

- (unint64_t)deletedSamplesCount
{
  return -[NSMutableArray count](self->_deletedSamples, "count");
}

- (id)deletedSamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_deletedSamples, "objectAtIndex:", a3);
}

+ (Class)deletedSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearLocationSeries
{
  -[NSMutableArray removeAllObjects](self->_locationSeries, "removeAllObjects");
}

- (void)addLocationSeries:(id)a3
{
  id v4;
  NSMutableArray *locationSeries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  locationSeries = self->_locationSeries;
  v8 = v4;
  if (!locationSeries)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_locationSeries;
    self->_locationSeries = v6;

    v4 = v8;
    locationSeries = self->_locationSeries;
  }
  -[NSMutableArray addObject:](locationSeries, "addObject:", v4);

}

- (unint64_t)locationSeriesCount
{
  return -[NSMutableArray count](self->_locationSeries, "count");
}

- (id)locationSeriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_locationSeries, "objectAtIndex:", a3);
}

+ (Class)locationSeriesType
{
  return (Class)objc_opt_class();
}

- (void)clearCdaDocumentSamples
{
  -[NSMutableArray removeAllObjects](self->_cdaDocumentSamples, "removeAllObjects");
}

- (void)addCdaDocumentSamples:(id)a3
{
  id v4;
  NSMutableArray *cdaDocumentSamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cdaDocumentSamples = self->_cdaDocumentSamples;
  v8 = v4;
  if (!cdaDocumentSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_cdaDocumentSamples;
    self->_cdaDocumentSamples = v6;

    v4 = v8;
    cdaDocumentSamples = self->_cdaDocumentSamples;
  }
  -[NSMutableArray addObject:](cdaDocumentSamples, "addObject:", v4);

}

- (unint64_t)cdaDocumentSamplesCount
{
  return -[NSMutableArray count](self->_cdaDocumentSamples, "count");
}

- (id)cdaDocumentSamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cdaDocumentSamples, "objectAtIndex:", a3);
}

+ (Class)cdaDocumentSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearFitnessFriendActivitySnapshots
{
  -[NSMutableArray removeAllObjects](self->_fitnessFriendActivitySnapshots, "removeAllObjects");
}

- (unint64_t)fitnessFriendActivitySnapshotsCount
{
  return -[NSMutableArray count](self->_fitnessFriendActivitySnapshots, "count");
}

- (id)fitnessFriendActivitySnapshotsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fitnessFriendActivitySnapshots, "objectAtIndex:", a3);
}

+ (Class)fitnessFriendActivitySnapshotsType
{
  return (Class)objc_opt_class();
}

- (void)clearFitnessFriendAchievements
{
  -[NSMutableArray removeAllObjects](self->_fitnessFriendAchievements, "removeAllObjects");
}

- (unint64_t)fitnessFriendAchievementsCount
{
  return -[NSMutableArray count](self->_fitnessFriendAchievements, "count");
}

- (id)fitnessFriendAchievementsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fitnessFriendAchievements, "objectAtIndex:", a3);
}

+ (Class)fitnessFriendAchievementsType
{
  return (Class)objc_opt_class();
}

- (void)clearFitnessFriendWorkouts
{
  -[NSMutableArray removeAllObjects](self->_fitnessFriendWorkouts, "removeAllObjects");
}

- (void)addFitnessFriendWorkouts:(id)a3
{
  id v4;
  NSMutableArray *fitnessFriendWorkouts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fitnessFriendWorkouts = self->_fitnessFriendWorkouts;
  v8 = v4;
  if (!fitnessFriendWorkouts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fitnessFriendWorkouts;
    self->_fitnessFriendWorkouts = v6;

    v4 = v8;
    fitnessFriendWorkouts = self->_fitnessFriendWorkouts;
  }
  -[NSMutableArray addObject:](fitnessFriendWorkouts, "addObject:", v4);

}

- (unint64_t)fitnessFriendWorkoutsCount
{
  return -[NSMutableArray count](self->_fitnessFriendWorkouts, "count");
}

- (id)fitnessFriendWorkoutsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fitnessFriendWorkouts, "objectAtIndex:", a3);
}

+ (Class)fitnessFriendWorkoutsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGeneratedObjectCollection
{
  return self->_generatedObjectCollection != 0;
}

- (BOOL)hasProvenance
{
  return self->_provenance != 0;
}

- (void)clearSleepSchedules
{
  -[NSMutableArray removeAllObjects](self->_sleepSchedules, "removeAllObjects");
}

- (void)addSleepSchedules:(id)a3
{
  id v4;
  NSMutableArray *sleepSchedules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sleepSchedules = self->_sleepSchedules;
  v8 = v4;
  if (!sleepSchedules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sleepSchedules;
    self->_sleepSchedules = v6;

    v4 = v8;
    sleepSchedules = self->_sleepSchedules;
  }
  -[NSMutableArray addObject:](sleepSchedules, "addObject:", v4);

}

- (unint64_t)sleepSchedulesCount
{
  return -[NSMutableArray count](self->_sleepSchedules, "count");
}

- (id)sleepSchedulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sleepSchedules, "objectAtIndex:", a3);
}

+ (Class)sleepSchedulesType
{
  return (Class)objc_opt_class();
}

- (void)clearEcgSamples
{
  -[NSMutableArray removeAllObjects](self->_ecgSamples, "removeAllObjects");
}

- (void)addEcgSamples:(id)a3
{
  id v4;
  NSMutableArray *ecgSamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ecgSamples = self->_ecgSamples;
  v8 = v4;
  if (!ecgSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_ecgSamples;
    self->_ecgSamples = v6;

    v4 = v8;
    ecgSamples = self->_ecgSamples;
  }
  -[NSMutableArray addObject:](ecgSamples, "addObject:", v4);

}

- (unint64_t)ecgSamplesCount
{
  return -[NSMutableArray count](self->_ecgSamples, "count");
}

- (id)ecgSamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_ecgSamples, "objectAtIndex:", a3);
}

+ (Class)ecgSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearVisionSamples
{
  -[NSMutableArray removeAllObjects](self->_visionSamples, "removeAllObjects");
}

- (void)addVisionSamples:(id)a3
{
  id v4;
  NSMutableArray *visionSamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visionSamples = self->_visionSamples;
  v8 = v4;
  if (!visionSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_visionSamples;
    self->_visionSamples = v6;

    v4 = v8;
    visionSamples = self->_visionSamples;
  }
  -[NSMutableArray addObject:](visionSamples, "addObject:", v4);

}

- (unint64_t)visionSamplesCount
{
  return -[NSMutableArray count](self->_visionSamples, "count");
}

- (id)visionSamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visionSamples, "objectAtIndex:", a3);
}

+ (Class)visionSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearStateOfMindLogs
{
  -[NSMutableArray removeAllObjects](self->_stateOfMindLogs, "removeAllObjects");
}

- (void)addStateOfMindLogs:(id)a3
{
  id v4;
  NSMutableArray *stateOfMindLogs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stateOfMindLogs = self->_stateOfMindLogs;
  v8 = v4;
  if (!stateOfMindLogs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stateOfMindLogs;
    self->_stateOfMindLogs = v6;

    v4 = v8;
    stateOfMindLogs = self->_stateOfMindLogs;
  }
  -[NSMutableArray addObject:](stateOfMindLogs, "addObject:", v4);

}

- (unint64_t)stateOfMindLogsCount
{
  return -[NSMutableArray count](self->_stateOfMindLogs, "count");
}

- (id)stateOfMindLogsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stateOfMindLogs, "objectAtIndex:", a3);
}

+ (Class)stateOfMindLogsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (void)clearScoredAssessmentSamples
{
  -[NSMutableArray removeAllObjects](self->_scoredAssessmentSamples, "removeAllObjects");
}

- (void)addScoredAssessmentSamples:(id)a3
{
  id v4;
  NSMutableArray *scoredAssessmentSamples;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  scoredAssessmentSamples = self->_scoredAssessmentSamples;
  v8 = v4;
  if (!scoredAssessmentSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_scoredAssessmentSamples;
    self->_scoredAssessmentSamples = v6;

    v4 = v8;
    scoredAssessmentSamples = self->_scoredAssessmentSamples;
  }
  -[NSMutableArray addObject:](scoredAssessmentSamples, "addObject:", v4);

}

- (unint64_t)scoredAssessmentSamplesCount
{
  return -[NSMutableArray count](self->_scoredAssessmentSamples, "count");
}

- (id)scoredAssessmentSamplesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_scoredAssessmentSamples, "objectAtIndex:", a3);
}

+ (Class)scoredAssessmentSamplesType
{
  return (Class)objc_opt_class();
}

- (void)clearWorkoutZones
{
  -[NSMutableArray removeAllObjects](self->_workoutZones, "removeAllObjects");
}

- (void)addWorkoutZones:(id)a3
{
  id v4;
  NSMutableArray *workoutZones;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  workoutZones = self->_workoutZones;
  v8 = v4;
  if (!workoutZones)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_workoutZones;
    self->_workoutZones = v6;

    v4 = v8;
    workoutZones = self->_workoutZones;
  }
  -[NSMutableArray addObject:](workoutZones, "addObject:", v4);

}

- (unint64_t)workoutZonesCount
{
  return -[NSMutableArray count](self->_workoutZones, "count");
}

- (id)workoutZonesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_workoutZones, "objectAtIndex:", a3);
}

+ (Class)workoutZonesType
{
  return (Class)objc_opt_class();
}

- (void)clearActivityGoalSchedules
{
  -[NSMutableArray removeAllObjects](self->_activityGoalSchedules, "removeAllObjects");
}

- (void)addActivityGoalSchedules:(id)a3
{
  id v4;
  NSMutableArray *activityGoalSchedules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  activityGoalSchedules = self->_activityGoalSchedules;
  v8 = v4;
  if (!activityGoalSchedules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_activityGoalSchedules;
    self->_activityGoalSchedules = v6;

    v4 = v8;
    activityGoalSchedules = self->_activityGoalSchedules;
  }
  -[NSMutableArray addObject:](activityGoalSchedules, "addObject:", v4);

}

- (unint64_t)activityGoalSchedulesCount
{
  return -[NSMutableArray count](self->_activityGoalSchedules, "count");
}

- (id)activityGoalSchedulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_activityGoalSchedules, "objectAtIndex:", a3);
}

+ (Class)activityGoalSchedulesType
{
  return (Class)objc_opt_class();
}

- (void)clearPauseRingsSchedules
{
  -[NSMutableArray removeAllObjects](self->_pauseRingsSchedules, "removeAllObjects");
}

- (void)addPauseRingsSchedules:(id)a3
{
  id v4;
  NSMutableArray *pauseRingsSchedules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pauseRingsSchedules = self->_pauseRingsSchedules;
  v8 = v4;
  if (!pauseRingsSchedules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pauseRingsSchedules;
    self->_pauseRingsSchedules = v6;

    v4 = v8;
    pauseRingsSchedules = self->_pauseRingsSchedules;
  }
  -[NSMutableArray addObject:](pauseRingsSchedules, "addObject:", v4);

}

- (unint64_t)pauseRingsSchedulesCount
{
  return -[NSMutableArray count](self->_pauseRingsSchedules, "count");
}

- (id)pauseRingsSchedulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pauseRingsSchedules, "objectAtIndex:", a3);
}

+ (Class)pauseRingsSchedulesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectCollection;
  -[HDCodableObjectCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableObjectCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourceBundleIdentifier;
  HDCodableSource *source;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ii;
  void *v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  void *v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t kk;
  void *v63;
  void *v64;
  NSMutableArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t mm;
  void *v70;
  void *v71;
  NSMutableArray *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t nn;
  void *v77;
  void *v78;
  NSMutableArray *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i1;
  void *v84;
  void *v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i2;
  void *v91;
  HDCodableGeneratedObjectCollection *generatedObjectCollection;
  void *v93;
  HDCodableProvenance *provenance;
  void *v95;
  void *v96;
  NSMutableArray *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i3;
  void *v102;
  void *v103;
  NSMutableArray *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i4;
  void *v109;
  void *v110;
  NSMutableArray *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i5;
  void *v116;
  void *v117;
  NSMutableArray *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t i6;
  void *v123;
  HDCodableSyncIdentity *syncIdentity;
  void *v125;
  void *v126;
  NSMutableArray *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t i7;
  void *v132;
  void *v133;
  NSMutableArray *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t i8;
  void *v139;
  void *v140;
  NSMutableArray *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t i9;
  void *v146;
  void *v147;
  NSMutableArray *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t i10;
  void *v153;
  id v154;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  uint64_t v256;

  v256 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sourceBundleIdentifier, CFSTR("sourceBundleIdentifier"));
  source = self->_source;
  if (source)
  {
    -[HDCodableSource dictionaryRepresentation](source, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("source"));

  }
  if (-[NSMutableArray count](self->_categorySamples, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_categorySamples, "count"));
    v232 = 0u;
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v9 = self->_categorySamples;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v232, v255, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v233;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v233 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v232 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v232, v255, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("categorySamples"));
  }
  if (-[NSMutableArray count](self->_quantitySamples, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_quantitySamples, "count"));
    v228 = 0u;
    v229 = 0u;
    v230 = 0u;
    v231 = 0u;
    v16 = self->_quantitySamples;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v228, v254, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v229;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v229 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v228 + 1) + 8 * j), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v228, v254, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("quantitySamples"));
  }
  if (-[NSMutableArray count](self->_workouts, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_workouts, "count"));
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    v23 = self->_workouts;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v224, v253, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v225;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v225 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v224 + 1) + 8 * k), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v224, v253, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("workouts"));
  }
  if (-[NSMutableArray count](self->_correlations, "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_correlations, "count"));
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v30 = self->_correlations;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v220, v252, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v221;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v221 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 8 * m), "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v220, v252, 16);
      }
      while (v32);
    }

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("correlations"));
  }
  if (-[NSMutableArray count](self->_activityCaches, "count"))
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_activityCaches, "count"));
    v216 = 0u;
    v217 = 0u;
    v218 = 0u;
    v219 = 0u;
    v37 = self->_activityCaches;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v216, v251, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v217;
      do
      {
        for (n = 0; n != v39; ++n)
        {
          if (*(_QWORD *)v217 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v216 + 1) + 8 * n), "dictionaryRepresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v216, v251, 16);
      }
      while (v39);
    }

    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("activityCaches"));
  }
  if (-[NSMutableArray count](self->_binarySamples, "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_binarySamples, "count"));
    v212 = 0u;
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v44 = self->_binarySamples;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v212, v250, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v213;
      do
      {
        for (ii = 0; ii != v46; ++ii)
        {
          if (*(_QWORD *)v213 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * ii), "dictionaryRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v212, v250, 16);
      }
      while (v46);
    }

    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("binarySamples"));
  }
  if (-[NSMutableArray count](self->_deletedSamples, "count"))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_deletedSamples, "count"));
    v208 = 0u;
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    v51 = self->_deletedSamples;
    v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v208, v249, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v209;
      do
      {
        for (jj = 0; jj != v53; ++jj)
        {
          if (*(_QWORD *)v209 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v208 + 1) + 8 * jj), "dictionaryRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v56);

        }
        v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v208, v249, 16);
      }
      while (v53);
    }

    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("deletedSamples"));
  }
  if (-[NSMutableArray count](self->_locationSeries, "count"))
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_locationSeries, "count"));
    v204 = 0u;
    v205 = 0u;
    v206 = 0u;
    v207 = 0u;
    v58 = self->_locationSeries;
    v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v204, v248, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v205;
      do
      {
        for (kk = 0; kk != v60; ++kk)
        {
          if (*(_QWORD *)v205 != v61)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v204 + 1) + 8 * kk), "dictionaryRepresentation");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v63);

        }
        v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v204, v248, 16);
      }
      while (v60);
    }

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("locationSeries"));
  }
  if (-[NSMutableArray count](self->_cdaDocumentSamples, "count"))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_cdaDocumentSamples, "count"));
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    v203 = 0u;
    v65 = self->_cdaDocumentSamples;
    v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v200, v247, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v201;
      do
      {
        for (mm = 0; mm != v67; ++mm)
        {
          if (*(_QWORD *)v201 != v68)
            objc_enumerationMutation(v65);
          objc_msgSend(*(id *)(*((_QWORD *)&v200 + 1) + 8 * mm), "dictionaryRepresentation");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v70);

        }
        v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v200, v247, 16);
      }
      while (v67);
    }

    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("cdaDocumentSamples"));
  }
  if (-[NSMutableArray count](self->_fitnessFriendActivitySnapshots, "count"))
  {
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fitnessFriendActivitySnapshots, "count"));
    v196 = 0u;
    v197 = 0u;
    v198 = 0u;
    v199 = 0u;
    v72 = self->_fitnessFriendActivitySnapshots;
    v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v196, v246, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v197;
      do
      {
        for (nn = 0; nn != v74; ++nn)
        {
          if (*(_QWORD *)v197 != v75)
            objc_enumerationMutation(v72);
          objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * nn), "dictionaryRepresentation");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v77);

        }
        v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v196, v246, 16);
      }
      while (v74);
    }

    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("fitnessFriendActivitySnapshots"));
  }
  if (-[NSMutableArray count](self->_fitnessFriendAchievements, "count"))
  {
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fitnessFriendAchievements, "count"));
    v192 = 0u;
    v193 = 0u;
    v194 = 0u;
    v195 = 0u;
    v79 = self->_fitnessFriendAchievements;
    v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v192, v245, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v193;
      do
      {
        for (i1 = 0; i1 != v81; ++i1)
        {
          if (*(_QWORD *)v193 != v82)
            objc_enumerationMutation(v79);
          objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * i1), "dictionaryRepresentation");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "addObject:", v84);

        }
        v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v79, "countByEnumeratingWithState:objects:count:", &v192, v245, 16);
      }
      while (v81);
    }

    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("fitnessFriendAchievements"));
  }
  if (-[NSMutableArray count](self->_fitnessFriendWorkouts, "count"))
  {
    v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_fitnessFriendWorkouts, "count"));
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v86 = self->_fitnessFriendWorkouts;
    v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v188, v244, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v189;
      do
      {
        for (i2 = 0; i2 != v88; ++i2)
        {
          if (*(_QWORD *)v189 != v89)
            objc_enumerationMutation(v86);
          objc_msgSend(*(id *)(*((_QWORD *)&v188 + 1) + 8 * i2), "dictionaryRepresentation");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "addObject:", v91);

        }
        v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v188, v244, 16);
      }
      while (v88);
    }

    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("fitnessFriendWorkouts"));
  }
  generatedObjectCollection = self->_generatedObjectCollection;
  if (generatedObjectCollection)
  {
    -[HDCodableGeneratedObjectCollection dictionaryRepresentation](generatedObjectCollection, "dictionaryRepresentation");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v93, CFSTR("generatedObjectCollection"));

  }
  provenance = self->_provenance;
  if (provenance)
  {
    -[HDCodableProvenance dictionaryRepresentation](provenance, "dictionaryRepresentation");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("provenance"));

  }
  if (-[NSMutableArray count](self->_sleepSchedules, "count"))
  {
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sleepSchedules, "count"));
    v184 = 0u;
    v185 = 0u;
    v186 = 0u;
    v187 = 0u;
    v97 = self->_sleepSchedules;
    v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v184, v243, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v185;
      do
      {
        for (i3 = 0; i3 != v99; ++i3)
        {
          if (*(_QWORD *)v185 != v100)
            objc_enumerationMutation(v97);
          objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * i3), "dictionaryRepresentation");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "addObject:", v102);

        }
        v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v184, v243, 16);
      }
      while (v99);
    }

    objc_msgSend(v4, "setObject:forKey:", v96, CFSTR("sleepSchedules"));
  }
  if (-[NSMutableArray count](self->_ecgSamples, "count"))
  {
    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_ecgSamples, "count"));
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v104 = self->_ecgSamples;
    v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v180, v242, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v181;
      do
      {
        for (i4 = 0; i4 != v106; ++i4)
        {
          if (*(_QWORD *)v181 != v107)
            objc_enumerationMutation(v104);
          objc_msgSend(*(id *)(*((_QWORD *)&v180 + 1) + 8 * i4), "dictionaryRepresentation");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObject:", v109);

        }
        v106 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v180, v242, 16);
      }
      while (v106);
    }

    objc_msgSend(v4, "setObject:forKey:", v103, CFSTR("ecgSamples"));
  }
  if (-[NSMutableArray count](self->_visionSamples, "count"))
  {
    v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_visionSamples, "count"));
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v179 = 0u;
    v111 = self->_visionSamples;
    v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v176, v241, 16);
    if (v112)
    {
      v113 = v112;
      v114 = *(_QWORD *)v177;
      do
      {
        for (i5 = 0; i5 != v113; ++i5)
        {
          if (*(_QWORD *)v177 != v114)
            objc_enumerationMutation(v111);
          objc_msgSend(*(id *)(*((_QWORD *)&v176 + 1) + 8 * i5), "dictionaryRepresentation");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "addObject:", v116);

        }
        v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v176, v241, 16);
      }
      while (v113);
    }

    objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("visionSamples"));
  }
  if (-[NSMutableArray count](self->_stateOfMindLogs, "count"))
  {
    v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_stateOfMindLogs, "count"));
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v118 = self->_stateOfMindLogs;
    v119 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v172, v240, 16);
    if (v119)
    {
      v120 = v119;
      v121 = *(_QWORD *)v173;
      do
      {
        for (i6 = 0; i6 != v120; ++i6)
        {
          if (*(_QWORD *)v173 != v121)
            objc_enumerationMutation(v118);
          objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * i6), "dictionaryRepresentation");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "addObject:", v123);

        }
        v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v172, v240, 16);
      }
      while (v120);
    }

    objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("stateOfMindLogs"));
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v125, CFSTR("syncIdentity"));

  }
  if (-[NSMutableArray count](self->_scoredAssessmentSamples, "count"))
  {
    v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_scoredAssessmentSamples, "count"));
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v127 = self->_scoredAssessmentSamples;
    v128 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v168, v239, 16);
    if (v128)
    {
      v129 = v128;
      v130 = *(_QWORD *)v169;
      do
      {
        for (i7 = 0; i7 != v129; ++i7)
        {
          if (*(_QWORD *)v169 != v130)
            objc_enumerationMutation(v127);
          objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * i7), "dictionaryRepresentation");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "addObject:", v132);

        }
        v129 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v168, v239, 16);
      }
      while (v129);
    }

    objc_msgSend(v4, "setObject:forKey:", v126, CFSTR("scoredAssessmentSamples"));
  }
  if (-[NSMutableArray count](self->_workoutZones, "count"))
  {
    v133 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_workoutZones, "count"));
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v134 = self->_workoutZones;
    v135 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v134, "countByEnumeratingWithState:objects:count:", &v164, v238, 16);
    if (v135)
    {
      v136 = v135;
      v137 = *(_QWORD *)v165;
      do
      {
        for (i8 = 0; i8 != v136; ++i8)
        {
          if (*(_QWORD *)v165 != v137)
            objc_enumerationMutation(v134);
          objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * i8), "dictionaryRepresentation");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "addObject:", v139);

        }
        v136 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v134, "countByEnumeratingWithState:objects:count:", &v164, v238, 16);
      }
      while (v136);
    }

    objc_msgSend(v4, "setObject:forKey:", v133, CFSTR("workoutZones"));
  }
  if (-[NSMutableArray count](self->_activityGoalSchedules, "count"))
  {
    v140 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_activityGoalSchedules, "count"));
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v141 = self->_activityGoalSchedules;
    v142 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v141, "countByEnumeratingWithState:objects:count:", &v160, v237, 16);
    if (v142)
    {
      v143 = v142;
      v144 = *(_QWORD *)v161;
      do
      {
        for (i9 = 0; i9 != v143; ++i9)
        {
          if (*(_QWORD *)v161 != v144)
            objc_enumerationMutation(v141);
          objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * i9), "dictionaryRepresentation");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "addObject:", v146);

        }
        v143 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v141, "countByEnumeratingWithState:objects:count:", &v160, v237, 16);
      }
      while (v143);
    }

    objc_msgSend(v4, "setObject:forKey:", v140, CFSTR("activityGoalSchedules"));
  }
  if (-[NSMutableArray count](self->_pauseRingsSchedules, "count"))
  {
    v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pauseRingsSchedules, "count"));
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v148 = self->_pauseRingsSchedules;
    v149 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v148, "countByEnumeratingWithState:objects:count:", &v156, v236, 16);
    if (v149)
    {
      v150 = v149;
      v151 = *(_QWORD *)v157;
      do
      {
        for (i10 = 0; i10 != v150; ++i10)
        {
          if (*(_QWORD *)v157 != v151)
            objc_enumerationMutation(v148);
          objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * i10), "dictionaryRepresentation", (_QWORD)v156);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "addObject:", v153);

        }
        v150 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v148, "countByEnumeratingWithState:objects:count:", &v156, v236, 16);
      }
      while (v150);
    }

    objc_msgSend(v4, "setObject:forKey:", v147, CFSTR("pauseRingsSchedules"));
  }
  v154 = v4;

  return v154;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t jj;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t kk;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t mm;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t nn;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t i1;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t i2;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t i3;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t i4;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t i5;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t i6;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t i7;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t i8;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t i9;
  void *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t i10;
  void *v83;
  id v84;

  v84 = a3;
  if (self->_sourceBundleIdentifier)
    objc_msgSend(v84, "setSourceBundleIdentifier:");
  if (self->_source)
    objc_msgSend(v84, "setSource:");
  if (-[HDCodableObjectCollection categorySamplesCount](self, "categorySamplesCount"))
  {
    objc_msgSend(v84, "clearCategorySamples");
    v4 = -[HDCodableObjectCollection categorySamplesCount](self, "categorySamplesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableObjectCollection categorySamplesAtIndex:](self, "categorySamplesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addCategorySamples:", v7);

      }
    }
  }
  if (-[HDCodableObjectCollection quantitySamplesCount](self, "quantitySamplesCount"))
  {
    objc_msgSend(v84, "clearQuantitySamples");
    v8 = -[HDCodableObjectCollection quantitySamplesCount](self, "quantitySamplesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HDCodableObjectCollection quantitySamplesAtIndex:](self, "quantitySamplesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addQuantitySamples:", v11);

      }
    }
  }
  if (-[HDCodableObjectCollection workoutsCount](self, "workoutsCount"))
  {
    objc_msgSend(v84, "clearWorkouts");
    v12 = -[HDCodableObjectCollection workoutsCount](self, "workoutsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[HDCodableObjectCollection workoutsAtIndex:](self, "workoutsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addWorkouts:", v15);

      }
    }
  }
  if (-[HDCodableObjectCollection correlationsCount](self, "correlationsCount"))
  {
    objc_msgSend(v84, "clearCorrelations");
    v16 = -[HDCodableObjectCollection correlationsCount](self, "correlationsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[HDCodableObjectCollection correlationsAtIndex:](self, "correlationsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addCorrelations:", v19);

      }
    }
  }
  if (-[HDCodableObjectCollection activityCachesCount](self, "activityCachesCount"))
  {
    objc_msgSend(v84, "clearActivityCaches");
    v20 = -[HDCodableObjectCollection activityCachesCount](self, "activityCachesCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[HDCodableObjectCollection activityCachesAtIndex:](self, "activityCachesAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addActivityCaches:", v23);

      }
    }
  }
  if (-[HDCodableObjectCollection binarySamplesCount](self, "binarySamplesCount"))
  {
    objc_msgSend(v84, "clearBinarySamples");
    v24 = -[HDCodableObjectCollection binarySamplesCount](self, "binarySamplesCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[HDCodableObjectCollection binarySamplesAtIndex:](self, "binarySamplesAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addBinarySamples:", v27);

      }
    }
  }
  if (-[HDCodableObjectCollection deletedSamplesCount](self, "deletedSamplesCount"))
  {
    objc_msgSend(v84, "clearDeletedSamples");
    v28 = -[HDCodableObjectCollection deletedSamplesCount](self, "deletedSamplesCount");
    if (v28)
    {
      v29 = v28;
      for (jj = 0; jj != v29; ++jj)
      {
        -[HDCodableObjectCollection deletedSamplesAtIndex:](self, "deletedSamplesAtIndex:", jj);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addDeletedSamples:", v31);

      }
    }
  }
  if (-[HDCodableObjectCollection locationSeriesCount](self, "locationSeriesCount"))
  {
    objc_msgSend(v84, "clearLocationSeries");
    v32 = -[HDCodableObjectCollection locationSeriesCount](self, "locationSeriesCount");
    if (v32)
    {
      v33 = v32;
      for (kk = 0; kk != v33; ++kk)
      {
        -[HDCodableObjectCollection locationSeriesAtIndex:](self, "locationSeriesAtIndex:", kk);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addLocationSeries:", v35);

      }
    }
  }
  if (-[HDCodableObjectCollection cdaDocumentSamplesCount](self, "cdaDocumentSamplesCount"))
  {
    objc_msgSend(v84, "clearCdaDocumentSamples");
    v36 = -[HDCodableObjectCollection cdaDocumentSamplesCount](self, "cdaDocumentSamplesCount");
    if (v36)
    {
      v37 = v36;
      for (mm = 0; mm != v37; ++mm)
      {
        -[HDCodableObjectCollection cdaDocumentSamplesAtIndex:](self, "cdaDocumentSamplesAtIndex:", mm);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addCdaDocumentSamples:", v39);

      }
    }
  }
  if (-[HDCodableObjectCollection fitnessFriendActivitySnapshotsCount](self, "fitnessFriendActivitySnapshotsCount"))
  {
    objc_msgSend(v84, "clearFitnessFriendActivitySnapshots");
    v40 = -[HDCodableObjectCollection fitnessFriendActivitySnapshotsCount](self, "fitnessFriendActivitySnapshotsCount");
    if (v40)
    {
      v41 = v40;
      for (nn = 0; nn != v41; ++nn)
      {
        -[HDCodableObjectCollection fitnessFriendActivitySnapshotsAtIndex:](self, "fitnessFriendActivitySnapshotsAtIndex:", nn);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addFitnessFriendActivitySnapshots:", v43);

      }
    }
  }
  if (-[HDCodableObjectCollection fitnessFriendAchievementsCount](self, "fitnessFriendAchievementsCount"))
  {
    objc_msgSend(v84, "clearFitnessFriendAchievements");
    v44 = -[HDCodableObjectCollection fitnessFriendAchievementsCount](self, "fitnessFriendAchievementsCount");
    if (v44)
    {
      v45 = v44;
      for (i1 = 0; i1 != v45; ++i1)
      {
        -[HDCodableObjectCollection fitnessFriendAchievementsAtIndex:](self, "fitnessFriendAchievementsAtIndex:", i1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addFitnessFriendAchievements:", v47);

      }
    }
  }
  if (-[HDCodableObjectCollection fitnessFriendWorkoutsCount](self, "fitnessFriendWorkoutsCount"))
  {
    objc_msgSend(v84, "clearFitnessFriendWorkouts");
    v48 = -[HDCodableObjectCollection fitnessFriendWorkoutsCount](self, "fitnessFriendWorkoutsCount");
    if (v48)
    {
      v49 = v48;
      for (i2 = 0; i2 != v49; ++i2)
      {
        -[HDCodableObjectCollection fitnessFriendWorkoutsAtIndex:](self, "fitnessFriendWorkoutsAtIndex:", i2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addFitnessFriendWorkouts:", v51);

      }
    }
  }
  if (self->_generatedObjectCollection)
    objc_msgSend(v84, "setGeneratedObjectCollection:");
  if (self->_provenance)
    objc_msgSend(v84, "setProvenance:");
  if (-[HDCodableObjectCollection sleepSchedulesCount](self, "sleepSchedulesCount"))
  {
    objc_msgSend(v84, "clearSleepSchedules");
    v52 = -[HDCodableObjectCollection sleepSchedulesCount](self, "sleepSchedulesCount");
    if (v52)
    {
      v53 = v52;
      for (i3 = 0; i3 != v53; ++i3)
      {
        -[HDCodableObjectCollection sleepSchedulesAtIndex:](self, "sleepSchedulesAtIndex:", i3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addSleepSchedules:", v55);

      }
    }
  }
  if (-[HDCodableObjectCollection ecgSamplesCount](self, "ecgSamplesCount"))
  {
    objc_msgSend(v84, "clearEcgSamples");
    v56 = -[HDCodableObjectCollection ecgSamplesCount](self, "ecgSamplesCount");
    if (v56)
    {
      v57 = v56;
      for (i4 = 0; i4 != v57; ++i4)
      {
        -[HDCodableObjectCollection ecgSamplesAtIndex:](self, "ecgSamplesAtIndex:", i4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addEcgSamples:", v59);

      }
    }
  }
  if (-[HDCodableObjectCollection visionSamplesCount](self, "visionSamplesCount"))
  {
    objc_msgSend(v84, "clearVisionSamples");
    v60 = -[HDCodableObjectCollection visionSamplesCount](self, "visionSamplesCount");
    if (v60)
    {
      v61 = v60;
      for (i5 = 0; i5 != v61; ++i5)
      {
        -[HDCodableObjectCollection visionSamplesAtIndex:](self, "visionSamplesAtIndex:", i5);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addVisionSamples:", v63);

      }
    }
  }
  if (-[HDCodableObjectCollection stateOfMindLogsCount](self, "stateOfMindLogsCount"))
  {
    objc_msgSend(v84, "clearStateOfMindLogs");
    v64 = -[HDCodableObjectCollection stateOfMindLogsCount](self, "stateOfMindLogsCount");
    if (v64)
    {
      v65 = v64;
      for (i6 = 0; i6 != v65; ++i6)
      {
        -[HDCodableObjectCollection stateOfMindLogsAtIndex:](self, "stateOfMindLogsAtIndex:", i6);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addStateOfMindLogs:", v67);

      }
    }
  }
  if (self->_syncIdentity)
    objc_msgSend(v84, "setSyncIdentity:");
  if (-[HDCodableObjectCollection scoredAssessmentSamplesCount](self, "scoredAssessmentSamplesCount"))
  {
    objc_msgSend(v84, "clearScoredAssessmentSamples");
    v68 = -[HDCodableObjectCollection scoredAssessmentSamplesCount](self, "scoredAssessmentSamplesCount");
    if (v68)
    {
      v69 = v68;
      for (i7 = 0; i7 != v69; ++i7)
      {
        -[HDCodableObjectCollection scoredAssessmentSamplesAtIndex:](self, "scoredAssessmentSamplesAtIndex:", i7);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addScoredAssessmentSamples:", v71);

      }
    }
  }
  if (-[HDCodableObjectCollection workoutZonesCount](self, "workoutZonesCount"))
  {
    objc_msgSend(v84, "clearWorkoutZones");
    v72 = -[HDCodableObjectCollection workoutZonesCount](self, "workoutZonesCount");
    if (v72)
    {
      v73 = v72;
      for (i8 = 0; i8 != v73; ++i8)
      {
        -[HDCodableObjectCollection workoutZonesAtIndex:](self, "workoutZonesAtIndex:", i8);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addWorkoutZones:", v75);

      }
    }
  }
  if (-[HDCodableObjectCollection activityGoalSchedulesCount](self, "activityGoalSchedulesCount"))
  {
    objc_msgSend(v84, "clearActivityGoalSchedules");
    v76 = -[HDCodableObjectCollection activityGoalSchedulesCount](self, "activityGoalSchedulesCount");
    if (v76)
    {
      v77 = v76;
      for (i9 = 0; i9 != v77; ++i9)
      {
        -[HDCodableObjectCollection activityGoalSchedulesAtIndex:](self, "activityGoalSchedulesAtIndex:", i9);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addActivityGoalSchedules:", v79);

      }
    }
  }
  if (-[HDCodableObjectCollection pauseRingsSchedulesCount](self, "pauseRingsSchedulesCount"))
  {
    objc_msgSend(v84, "clearPauseRingsSchedules");
    v80 = -[HDCodableObjectCollection pauseRingsSchedulesCount](self, "pauseRingsSchedulesCount");
    if (v80)
    {
      v81 = v80;
      for (i10 = 0; i10 != v81; ++i10)
      {
        -[HDCodableObjectCollection pauseRingsSchedulesAtIndex:](self, "pauseRingsSchedulesAtIndex:", i10);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addPauseRingsSchedules:", v83);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  NSMutableArray *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  NSMutableArray *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSMutableArray *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  NSMutableArray *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  NSMutableArray *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  NSMutableArray *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  NSMutableArray *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourceBundleIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[20];
  v5[20] = v6;

  v8 = -[HDCodableSource copyWithZone:](self->_source, "copyWithZone:", a3);
  v9 = (void *)v5[19];
  v5[19] = v8;

  v216 = 0u;
  v215 = 0u;
  v214 = 0u;
  v213 = 0u;
  v10 = self->_categorySamples;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v213, v236, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v214;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v214 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addCategorySamples:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v213, v236, 16);
    }
    while (v12);
  }

  v212 = 0u;
  v211 = 0u;
  v210 = 0u;
  v209 = 0u;
  v16 = self->_quantitySamples;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v209, v235, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v210;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v210 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v209 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addQuantitySamples:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v209, v235, 16);
    }
    while (v18);
  }

  v208 = 0u;
  v207 = 0u;
  v206 = 0u;
  v205 = 0u;
  v22 = self->_workouts;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v205, v234, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v206;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v206 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v205 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addWorkouts:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v205, v234, 16);
    }
    while (v24);
  }

  v204 = 0u;
  v203 = 0u;
  v202 = 0u;
  v201 = 0u;
  v28 = self->_correlations;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v201, v233, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v202;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v202 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v201 + 1) + 8 * v32), "copyWithZone:", a3);
        objc_msgSend(v5, "addCorrelations:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v201, v233, 16);
    }
    while (v30);
  }

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v34 = self->_activityCaches;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v197, v232, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v198;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v198 != v37)
          objc_enumerationMutation(v34);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v197 + 1) + 8 * v38), "copyWithZone:", a3);
        objc_msgSend(v5, "addActivityCaches:", v39);

        ++v38;
      }
      while (v36 != v38);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v197, v232, 16);
    }
    while (v36);
  }

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v40 = self->_binarySamples;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v193, v231, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v194;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v194 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v193 + 1) + 8 * v44), "copyWithZone:", a3);
        objc_msgSend(v5, "addBinarySamples:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v193, v231, 16);
    }
    while (v42);
  }

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v46 = self->_deletedSamples;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v189, v230, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v190;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v190 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v189 + 1) + 8 * v50), "copyWithZone:", a3);
        objc_msgSend(v5, "addDeletedSamples:", v51);

        ++v50;
      }
      while (v48 != v50);
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v189, v230, 16);
    }
    while (v48);
  }

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v52 = self->_locationSeries;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v185, v229, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v186;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v186 != v55)
          objc_enumerationMutation(v52);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v185 + 1) + 8 * v56), "copyWithZone:", a3);
        objc_msgSend(v5, "addLocationSeries:", v57);

        ++v56;
      }
      while (v54 != v56);
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v185, v229, 16);
    }
    while (v54);
  }

  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v58 = self->_cdaDocumentSamples;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v181, v228, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v182;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v182 != v61)
          objc_enumerationMutation(v58);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v181 + 1) + 8 * v62), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdaDocumentSamples:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v181, v228, 16);
    }
    while (v60);
  }

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v64 = self->_fitnessFriendActivitySnapshots;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v177, v227, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v178;
    do
    {
      v68 = 0;
      do
      {
        if (*(_QWORD *)v178 != v67)
          objc_enumerationMutation(v64);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * v68), "copyWithZone:", a3);
        objc_msgSend(v5, "addFitnessFriendActivitySnapshots:", v69);

        ++v68;
      }
      while (v66 != v68);
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v177, v227, 16);
    }
    while (v66);
  }

  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v70 = self->_fitnessFriendAchievements;
  v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v173, v226, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v174;
    do
    {
      v74 = 0;
      do
      {
        if (*(_QWORD *)v174 != v73)
          objc_enumerationMutation(v70);
        v75 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * v74), "copyWithZone:", a3);
        objc_msgSend(v5, "addFitnessFriendAchievements:", v75);

        ++v74;
      }
      while (v72 != v74);
      v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v173, v226, 16);
    }
    while (v72);
  }

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v76 = self->_fitnessFriendWorkouts;
  v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v169, v225, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v170;
    do
    {
      v80 = 0;
      do
      {
        if (*(_QWORD *)v170 != v79)
          objc_enumerationMutation(v76);
        v81 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * v80), "copyWithZone:", a3);
        objc_msgSend(v5, "addFitnessFriendWorkouts:", v81);

        ++v80;
      }
      while (v78 != v80);
      v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v169, v225, 16);
    }
    while (v78);
  }

  v82 = -[HDCodableGeneratedObjectCollection copyWithZone:](self->_generatedObjectCollection, "copyWithZone:", a3);
  v83 = (void *)v5[12];
  v5[12] = v82;

  v84 = -[HDCodableProvenance copyWithZone:](self->_provenance, "copyWithZone:", a3);
  v85 = (void *)v5[15];
  v5[15] = v84;

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v86 = self->_sleepSchedules;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v165, v224, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v166;
    do
    {
      v90 = 0;
      do
      {
        if (*(_QWORD *)v166 != v89)
          objc_enumerationMutation(v86);
        v91 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * v90), "copyWithZone:", a3);
        objc_msgSend(v5, "addSleepSchedules:", v91);

        ++v90;
      }
      while (v88 != v90);
      v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v165, v224, 16);
    }
    while (v88);
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v92 = self->_ecgSamples;
  v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v161, v223, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v162;
    do
    {
      v96 = 0;
      do
      {
        if (*(_QWORD *)v162 != v95)
          objc_enumerationMutation(v92);
        v97 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * v96), "copyWithZone:", a3);
        objc_msgSend(v5, "addEcgSamples:", v97);

        ++v96;
      }
      while (v94 != v96);
      v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v92, "countByEnumeratingWithState:objects:count:", &v161, v223, 16);
    }
    while (v94);
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v98 = self->_visionSamples;
  v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v157, v222, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v158;
    do
    {
      v102 = 0;
      do
      {
        if (*(_QWORD *)v158 != v101)
          objc_enumerationMutation(v98);
        v103 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * v102), "copyWithZone:", a3);
        objc_msgSend(v5, "addVisionSamples:", v103);

        ++v102;
      }
      while (v100 != v102);
      v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v157, v222, 16);
    }
    while (v100);
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v104 = self->_stateOfMindLogs;
  v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v153, v221, 16);
  if (v105)
  {
    v106 = v105;
    v107 = *(_QWORD *)v154;
    do
    {
      v108 = 0;
      do
      {
        if (*(_QWORD *)v154 != v107)
          objc_enumerationMutation(v104);
        v109 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * v108), "copyWithZone:", a3);
        objc_msgSend(v5, "addStateOfMindLogs:", v109);

        ++v108;
      }
      while (v106 != v108);
      v106 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v153, v221, 16);
    }
    while (v106);
  }

  v110 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v111 = (void *)v5[22];
  v5[22] = v110;

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v112 = self->_scoredAssessmentSamples;
  v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", &v149, v220, 16);
  if (v113)
  {
    v114 = v113;
    v115 = *(_QWORD *)v150;
    do
    {
      v116 = 0;
      do
      {
        if (*(_QWORD *)v150 != v115)
          objc_enumerationMutation(v112);
        v117 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * v116), "copyWithZone:", a3);
        objc_msgSend(v5, "addScoredAssessmentSamples:", v117);

        ++v116;
      }
      while (v114 != v116);
      v114 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", &v149, v220, 16);
    }
    while (v114);
  }

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v118 = self->_workoutZones;
  v119 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v145, v219, 16);
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v146;
    do
    {
      v122 = 0;
      do
      {
        if (*(_QWORD *)v146 != v121)
          objc_enumerationMutation(v118);
        v123 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * v122), "copyWithZone:", a3);
        objc_msgSend(v5, "addWorkoutZones:", v123);

        ++v122;
      }
      while (v120 != v122);
      v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v145, v219, 16);
    }
    while (v120);
  }

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v124 = self->_activityGoalSchedules;
  v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v141, v218, 16);
  if (v125)
  {
    v126 = v125;
    v127 = *(_QWORD *)v142;
    do
    {
      v128 = 0;
      do
      {
        if (*(_QWORD *)v142 != v127)
          objc_enumerationMutation(v124);
        v129 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * v128), "copyWithZone:", a3);
        objc_msgSend(v5, "addActivityGoalSchedules:", v129);

        ++v128;
      }
      while (v126 != v128);
      v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v141, v218, 16);
    }
    while (v126);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v130 = self->_pauseRingsSchedules;
  v131 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v137, v217, 16);
  if (v131)
  {
    v132 = v131;
    v133 = *(_QWORD *)v138;
    do
    {
      v134 = 0;
      do
      {
        if (*(_QWORD *)v138 != v133)
          objc_enumerationMutation(v130);
        v135 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * v134), "copyWithZone:", a3, (_QWORD)v137);
        objc_msgSend(v5, "addPauseRingsSchedules:", v135);

        ++v134;
      }
      while (v132 != v134);
      v132 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v130, "countByEnumeratingWithState:objects:count:", &v137, v217, 16);
    }
    while (v132);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sourceBundleIdentifier;
  HDCodableSource *source;
  NSMutableArray *categorySamples;
  NSMutableArray *quantitySamples;
  NSMutableArray *workouts;
  NSMutableArray *correlations;
  NSMutableArray *activityCaches;
  NSMutableArray *binarySamples;
  NSMutableArray *deletedSamples;
  NSMutableArray *locationSeries;
  NSMutableArray *cdaDocumentSamples;
  NSMutableArray *fitnessFriendActivitySnapshots;
  NSMutableArray *fitnessFriendAchievements;
  NSMutableArray *fitnessFriendWorkouts;
  HDCodableGeneratedObjectCollection *generatedObjectCollection;
  HDCodableProvenance *provenance;
  NSMutableArray *sleepSchedules;
  NSMutableArray *ecgSamples;
  NSMutableArray *visionSamples;
  NSMutableArray *stateOfMindLogs;
  HDCodableSyncIdentity *syncIdentity;
  NSMutableArray *scoredAssessmentSamples;
  NSMutableArray *workoutZones;
  NSMutableArray *activityGoalSchedules;
  NSMutableArray *pauseRingsSchedules;
  char v30;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if ((unint64_t)sourceBundleIdentifier | v4[20])
  {
    if (!-[NSString isEqual:](sourceBundleIdentifier, "isEqual:"))
      goto LABEL_52;
  }
  source = self->_source;
  if ((unint64_t)source | v4[19] && !-[HDCodableSource isEqual:](source, "isEqual:"))
    goto LABEL_52;
  categorySamples = self->_categorySamples;
  if ((unint64_t)categorySamples | v4[4]
    && !-[NSMutableArray isEqual:](categorySamples, "isEqual:"))
  {
    goto LABEL_52;
  }
  quantitySamples = self->_quantitySamples;
  if ((unint64_t)quantitySamples | v4[16]
    && !-[NSMutableArray isEqual:](quantitySamples, "isEqual:"))
  {
    goto LABEL_52;
  }
  workouts = self->_workouts;
  if ((unint64_t)workouts | v4[25] && !-[NSMutableArray isEqual:](workouts, "isEqual:"))
    goto LABEL_52;
  correlations = self->_correlations;
  if ((unint64_t)correlations | v4[6] && !-[NSMutableArray isEqual:](correlations, "isEqual:"))
    goto LABEL_52;
  activityCaches = self->_activityCaches;
  if ((unint64_t)activityCaches | v4[1] && !-[NSMutableArray isEqual:](activityCaches, "isEqual:"))
    goto LABEL_52;
  binarySamples = self->_binarySamples;
  if ((unint64_t)binarySamples | v4[3] && !-[NSMutableArray isEqual:](binarySamples, "isEqual:"))
    goto LABEL_52;
  deletedSamples = self->_deletedSamples;
  if ((unint64_t)deletedSamples | v4[7] && !-[NSMutableArray isEqual:](deletedSamples, "isEqual:"))
    goto LABEL_52;
  locationSeries = self->_locationSeries;
  if ((unint64_t)locationSeries | v4[13]
    && !-[NSMutableArray isEqual:](locationSeries, "isEqual:"))
  {
    goto LABEL_52;
  }
  cdaDocumentSamples = self->_cdaDocumentSamples;
  if ((unint64_t)cdaDocumentSamples | v4[5]
    && !-[NSMutableArray isEqual:](cdaDocumentSamples, "isEqual:"))
  {
    goto LABEL_52;
  }
  fitnessFriendActivitySnapshots = self->_fitnessFriendActivitySnapshots;
  if ((unint64_t)fitnessFriendActivitySnapshots | v4[10]
    && !-[NSMutableArray isEqual:](fitnessFriendActivitySnapshots, "isEqual:"))
  {
    goto LABEL_52;
  }
  fitnessFriendAchievements = self->_fitnessFriendAchievements;
  if ((unint64_t)fitnessFriendAchievements | v4[9]
    && !-[NSMutableArray isEqual:](fitnessFriendAchievements, "isEqual:"))
  {
    goto LABEL_52;
  }
  fitnessFriendWorkouts = self->_fitnessFriendWorkouts;
  if ((unint64_t)fitnessFriendWorkouts | v4[11]
    && !-[NSMutableArray isEqual:](fitnessFriendWorkouts, "isEqual:"))
  {
    goto LABEL_52;
  }
  generatedObjectCollection = self->_generatedObjectCollection;
  if ((unint64_t)generatedObjectCollection | v4[12]
    && !-[HDCodableGeneratedObjectCollection isEqual:](generatedObjectCollection, "isEqual:"))
  {
    goto LABEL_52;
  }
  provenance = self->_provenance;
  if ((unint64_t)provenance | v4[15] && !-[HDCodableProvenance isEqual:](provenance, "isEqual:"))
    goto LABEL_52;
  sleepSchedules = self->_sleepSchedules;
  if ((unint64_t)sleepSchedules | v4[18]
    && !-[NSMutableArray isEqual:](sleepSchedules, "isEqual:"))
  {
    goto LABEL_52;
  }
  if (((ecgSamples = self->_ecgSamples, !((unint64_t)ecgSamples | v4[8]))
     || -[NSMutableArray isEqual:](ecgSamples, "isEqual:"))
    && ((visionSamples = self->_visionSamples, !((unint64_t)visionSamples | v4[23]))
     || -[NSMutableArray isEqual:](visionSamples, "isEqual:"))
    && ((stateOfMindLogs = self->_stateOfMindLogs, !((unint64_t)stateOfMindLogs | v4[21]))
     || -[NSMutableArray isEqual:](stateOfMindLogs, "isEqual:"))
    && ((syncIdentity = self->_syncIdentity, !((unint64_t)syncIdentity | v4[22]))
     || -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
    && ((scoredAssessmentSamples = self->_scoredAssessmentSamples, !((unint64_t)scoredAssessmentSamples | v4[17]))
     || -[NSMutableArray isEqual:](scoredAssessmentSamples, "isEqual:"))
    && ((workoutZones = self->_workoutZones, !((unint64_t)workoutZones | v4[24]))
     || -[NSMutableArray isEqual:](workoutZones, "isEqual:"))
    && ((activityGoalSchedules = self->_activityGoalSchedules, !((unint64_t)activityGoalSchedules | v4[2]))
     || -[NSMutableArray isEqual:](activityGoalSchedules, "isEqual:")))
  {
    pauseRingsSchedules = self->_pauseRingsSchedules;
    if ((unint64_t)pauseRingsSchedules | v4[14])
      v30 = -[NSMutableArray isEqual:](pauseRingsSchedules, "isEqual:");
    else
      v30 = 1;
  }
  else
  {
LABEL_52:
    v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = -[NSString hash](self->_sourceBundleIdentifier, "hash");
  v4 = -[HDCodableSource hash](self->_source, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_categorySamples, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_quantitySamples, "hash");
  v7 = -[NSMutableArray hash](self->_workouts, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_correlations, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_activityCaches, "hash");
  v10 = -[NSMutableArray hash](self->_binarySamples, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_deletedSamples, "hash");
  v12 = v11 ^ -[NSMutableArray hash](self->_locationSeries, "hash");
  v13 = v9 ^ v12 ^ -[NSMutableArray hash](self->_cdaDocumentSamples, "hash");
  v14 = -[NSMutableArray hash](self->_fitnessFriendActivitySnapshots, "hash");
  v15 = v14 ^ -[NSMutableArray hash](self->_fitnessFriendAchievements, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_fitnessFriendWorkouts, "hash");
  v17 = v16 ^ -[HDCodableGeneratedObjectCollection hash](self->_generatedObjectCollection, "hash");
  v18 = v13 ^ v17 ^ -[HDCodableProvenance hash](self->_provenance, "hash");
  v19 = -[NSMutableArray hash](self->_sleepSchedules, "hash");
  v20 = v19 ^ -[NSMutableArray hash](self->_ecgSamples, "hash");
  v21 = v20 ^ -[NSMutableArray hash](self->_visionSamples, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_stateOfMindLogs, "hash");
  v23 = v22 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  v24 = v18 ^ v23 ^ -[NSMutableArray hash](self->_scoredAssessmentSamples, "hash");
  v25 = -[NSMutableArray hash](self->_workoutZones, "hash");
  v26 = v25 ^ -[NSMutableArray hash](self->_activityGoalSchedules, "hash");
  return v24 ^ v26 ^ -[NSMutableArray hash](self->_pauseRingsSchedules, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSource *source;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t kk;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t mm;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t nn;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i1;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i2;
  HDCodableGeneratedObjectCollection *generatedObjectCollection;
  uint64_t v68;
  HDCodableProvenance *provenance;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i3;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i4;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i5;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i6;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i7;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i8;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i9;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i10;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 20))
    -[HDCodableObjectCollection setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:");
  source = self->_source;
  v6 = *((_QWORD *)v4 + 19);
  if (source)
  {
    if (v6)
      -[HDCodableSource mergeFrom:](source, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableObjectCollection setSource:](self, "setSource:");
  }
  v192 = 0u;
  v191 = 0u;
  v190 = 0u;
  v189 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v190;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v190 != v10)
          objc_enumerationMutation(v7);
        -[HDCodableObjectCollection addCategorySamples:](self, "addCategorySamples:", *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v189, v212, 16);
    }
    while (v9);
  }

  v188 = 0u;
  v187 = 0u;
  v186 = 0u;
  v185 = 0u;
  v12 = *((id *)v4 + 16);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v185, v211, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v186;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v186 != v15)
          objc_enumerationMutation(v12);
        -[HDCodableObjectCollection addQuantitySamples:](self, "addQuantitySamples:", *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v185, v211, 16);
    }
    while (v14);
  }

  v184 = 0u;
  v183 = 0u;
  v182 = 0u;
  v181 = 0u;
  v17 = *((id *)v4 + 25);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v181, v210, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v182;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v182 != v20)
          objc_enumerationMutation(v17);
        -[HDCodableObjectCollection addWorkouts:](self, "addWorkouts:", *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v181, v210, 16);
    }
    while (v19);
  }

  v180 = 0u;
  v179 = 0u;
  v178 = 0u;
  v177 = 0u;
  v22 = *((id *)v4 + 6);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v177, v209, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v178;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v178 != v25)
          objc_enumerationMutation(v22);
        -[HDCodableObjectCollection addCorrelations:](self, "addCorrelations:", *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v177, v209, 16);
    }
    while (v24);
  }

  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v27 = *((id *)v4 + 1);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v173, v208, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v174;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v174 != v30)
          objc_enumerationMutation(v27);
        -[HDCodableObjectCollection addActivityCaches:](self, "addActivityCaches:", *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * n));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v173, v208, 16);
    }
    while (v29);
  }

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v32 = *((id *)v4 + 3);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v169, v207, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v170;
    do
    {
      for (ii = 0; ii != v34; ++ii)
      {
        if (*(_QWORD *)v170 != v35)
          objc_enumerationMutation(v32);
        -[HDCodableObjectCollection addBinarySamples:](self, "addBinarySamples:", *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * ii));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v169, v207, 16);
    }
    while (v34);
  }

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v37 = *((id *)v4 + 7);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v165, v206, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v166;
    do
    {
      for (jj = 0; jj != v39; ++jj)
      {
        if (*(_QWORD *)v166 != v40)
          objc_enumerationMutation(v37);
        -[HDCodableObjectCollection addDeletedSamples:](self, "addDeletedSamples:", *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * jj));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v165, v206, 16);
    }
    while (v39);
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v42 = *((id *)v4 + 13);
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v161, v205, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v162;
    do
    {
      for (kk = 0; kk != v44; ++kk)
      {
        if (*(_QWORD *)v162 != v45)
          objc_enumerationMutation(v42);
        -[HDCodableObjectCollection addLocationSeries:](self, "addLocationSeries:", *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * kk));
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v161, v205, 16);
    }
    while (v44);
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v47 = *((id *)v4 + 5);
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v157, v204, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v158;
    do
    {
      for (mm = 0; mm != v49; ++mm)
      {
        if (*(_QWORD *)v158 != v50)
          objc_enumerationMutation(v47);
        -[HDCodableObjectCollection addCdaDocumentSamples:](self, "addCdaDocumentSamples:", *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * mm));
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v157, v204, 16);
    }
    while (v49);
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v52 = *((id *)v4 + 10);
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v153, v203, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v154;
    do
    {
      for (nn = 0; nn != v54; ++nn)
      {
        if (*(_QWORD *)v154 != v55)
          objc_enumerationMutation(v52);
        -[HDCodableObjectCollection addFitnessFriendActivitySnapshots:](self, "addFitnessFriendActivitySnapshots:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * nn));
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v153, v203, 16);
    }
    while (v54);
  }

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v57 = *((id *)v4 + 9);
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v149, v202, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v150;
    do
    {
      for (i1 = 0; i1 != v59; ++i1)
      {
        if (*(_QWORD *)v150 != v60)
          objc_enumerationMutation(v57);
        -[HDCodableObjectCollection addFitnessFriendAchievements:](self, "addFitnessFriendAchievements:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i1));
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v149, v202, 16);
    }
    while (v59);
  }

  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v62 = *((id *)v4 + 11);
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v145, v201, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v146;
    do
    {
      for (i2 = 0; i2 != v64; ++i2)
      {
        if (*(_QWORD *)v146 != v65)
          objc_enumerationMutation(v62);
        -[HDCodableObjectCollection addFitnessFriendWorkouts:](self, "addFitnessFriendWorkouts:", *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * i2));
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v145, v201, 16);
    }
    while (v64);
  }

  generatedObjectCollection = self->_generatedObjectCollection;
  v68 = *((_QWORD *)v4 + 12);
  if (generatedObjectCollection)
  {
    if (v68)
      -[HDCodableGeneratedObjectCollection mergeFrom:](generatedObjectCollection, "mergeFrom:");
  }
  else if (v68)
  {
    -[HDCodableObjectCollection setGeneratedObjectCollection:](self, "setGeneratedObjectCollection:");
  }
  provenance = self->_provenance;
  v70 = *((_QWORD *)v4 + 15);
  if (provenance)
  {
    if (v70)
      -[HDCodableProvenance mergeFrom:](provenance, "mergeFrom:");
  }
  else if (v70)
  {
    -[HDCodableObjectCollection setProvenance:](self, "setProvenance:");
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v71 = *((id *)v4 + 18);
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v141, v200, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v142;
    do
    {
      for (i3 = 0; i3 != v73; ++i3)
      {
        if (*(_QWORD *)v142 != v74)
          objc_enumerationMutation(v71);
        -[HDCodableObjectCollection addSleepSchedules:](self, "addSleepSchedules:", *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * i3));
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v141, v200, 16);
    }
    while (v73);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v76 = *((id *)v4 + 8);
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v137, v199, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v138;
    do
    {
      for (i4 = 0; i4 != v78; ++i4)
      {
        if (*(_QWORD *)v138 != v79)
          objc_enumerationMutation(v76);
        -[HDCodableObjectCollection addEcgSamples:](self, "addEcgSamples:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * i4));
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v137, v199, 16);
    }
    while (v78);
  }

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v81 = *((id *)v4 + 23);
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v133, v198, 16);
  if (v82)
  {
    v83 = v82;
    v84 = *(_QWORD *)v134;
    do
    {
      for (i5 = 0; i5 != v83; ++i5)
      {
        if (*(_QWORD *)v134 != v84)
          objc_enumerationMutation(v81);
        -[HDCodableObjectCollection addVisionSamples:](self, "addVisionSamples:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i5));
      }
      v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v133, v198, 16);
    }
    while (v83);
  }

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v86 = *((id *)v4 + 21);
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v129, v197, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v130;
    do
    {
      for (i6 = 0; i6 != v88; ++i6)
      {
        if (*(_QWORD *)v130 != v89)
          objc_enumerationMutation(v86);
        -[HDCodableObjectCollection addStateOfMindLogs:](self, "addStateOfMindLogs:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i6));
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v129, v197, 16);
    }
    while (v88);
  }

  syncIdentity = self->_syncIdentity;
  v92 = *((_QWORD *)v4 + 22);
  if (syncIdentity)
  {
    if (v92)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v92)
  {
    -[HDCodableObjectCollection setSyncIdentity:](self, "setSyncIdentity:");
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v93 = *((id *)v4 + 17);
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v125, v196, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v126;
    do
    {
      for (i7 = 0; i7 != v95; ++i7)
      {
        if (*(_QWORD *)v126 != v96)
          objc_enumerationMutation(v93);
        -[HDCodableObjectCollection addScoredAssessmentSamples:](self, "addScoredAssessmentSamples:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * i7));
      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v125, v196, 16);
    }
    while (v95);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v98 = *((id *)v4 + 24);
  v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v195, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v122;
    do
    {
      for (i8 = 0; i8 != v100; ++i8)
      {
        if (*(_QWORD *)v122 != v101)
          objc_enumerationMutation(v98);
        -[HDCodableObjectCollection addWorkoutZones:](self, "addWorkoutZones:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i8));
      }
      v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v195, 16);
    }
    while (v100);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v103 = *((id *)v4 + 2);
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v117, v194, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v118;
    do
    {
      for (i9 = 0; i9 != v105; ++i9)
      {
        if (*(_QWORD *)v118 != v106)
          objc_enumerationMutation(v103);
        -[HDCodableObjectCollection addActivityGoalSchedules:](self, "addActivityGoalSchedules:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i9));
      }
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v117, v194, 16);
    }
    while (v105);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v108 = *((id *)v4 + 14);
  v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v113, v193, 16);
  if (v109)
  {
    v110 = v109;
    v111 = *(_QWORD *)v114;
    do
    {
      for (i10 = 0; i10 != v110; ++i10)
      {
        if (*(_QWORD *)v114 != v111)
          objc_enumerationMutation(v108);
        -[HDCodableObjectCollection addPauseRingsSchedules:](self, "addPauseRingsSchedules:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i10), (_QWORD)v113);
      }
      v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v113, v193, 16);
    }
    while (v110);
  }

}

- (void)setCategorySamples:(id)a3
{
  objc_storeStrong((id *)&self->_categorySamples, a3);
}

- (void)setQuantitySamples:(id)a3
{
  objc_storeStrong((id *)&self->_quantitySamples, a3);
}

- (void)setWorkouts:(id)a3
{
  objc_storeStrong((id *)&self->_workouts, a3);
}

- (void)setCorrelations:(id)a3
{
  objc_storeStrong((id *)&self->_correlations, a3);
}

- (void)setActivityCaches:(id)a3
{
  objc_storeStrong((id *)&self->_activityCaches, a3);
}

- (void)setBinarySamples:(id)a3
{
  objc_storeStrong((id *)&self->_binarySamples, a3);
}

- (NSMutableArray)deletedSamples
{
  return self->_deletedSamples;
}

- (void)setDeletedSamples:(id)a3
{
  objc_storeStrong((id *)&self->_deletedSamples, a3);
}

- (void)setLocationSeries:(id)a3
{
  objc_storeStrong((id *)&self->_locationSeries, a3);
}

- (void)setCdaDocumentSamples:(id)a3
{
  objc_storeStrong((id *)&self->_cdaDocumentSamples, a3);
}

- (void)setFitnessFriendActivitySnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessFriendActivitySnapshots, a3);
}

- (void)setFitnessFriendAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessFriendAchievements, a3);
}

- (void)setFitnessFriendWorkouts:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessFriendWorkouts, a3);
}

- (HDCodableGeneratedObjectCollection)generatedObjectCollection
{
  return self->_generatedObjectCollection;
}

- (void)setGeneratedObjectCollection:(id)a3
{
  objc_storeStrong((id *)&self->_generatedObjectCollection, a3);
}

- (NSMutableArray)sleepSchedules
{
  return self->_sleepSchedules;
}

- (void)setSleepSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_sleepSchedules, a3);
}

- (NSMutableArray)ecgSamples
{
  return self->_ecgSamples;
}

- (void)setEcgSamples:(id)a3
{
  objc_storeStrong((id *)&self->_ecgSamples, a3);
}

- (NSMutableArray)visionSamples
{
  return self->_visionSamples;
}

- (void)setVisionSamples:(id)a3
{
  objc_storeStrong((id *)&self->_visionSamples, a3);
}

- (NSMutableArray)stateOfMindLogs
{
  return self->_stateOfMindLogs;
}

- (void)setStateOfMindLogs:(id)a3
{
  objc_storeStrong((id *)&self->_stateOfMindLogs, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (NSMutableArray)scoredAssessmentSamples
{
  return self->_scoredAssessmentSamples;
}

- (void)setScoredAssessmentSamples:(id)a3
{
  objc_storeStrong((id *)&self->_scoredAssessmentSamples, a3);
}

- (NSMutableArray)workoutZones
{
  return self->_workoutZones;
}

- (void)setWorkoutZones:(id)a3
{
  objc_storeStrong((id *)&self->_workoutZones, a3);
}

- (NSMutableArray)activityGoalSchedules
{
  return self->_activityGoalSchedules;
}

- (void)setActivityGoalSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_activityGoalSchedules, a3);
}

- (NSMutableArray)pauseRingsSchedules
{
  return self->_pauseRingsSchedules;
}

- (void)setPauseRingsSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_pauseRingsSchedules, a3);
}

- (void)addMedicationDoseEvent:(id)a3
{
  id v4;
  void *v5;
  HDCodableGeneratedObjectCollection *v6;
  id v7;

  v4 = a3;
  -[HDCodableObjectCollection generatedObjectCollection](self, "generatedObjectCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(HDCodableGeneratedObjectCollection);
    -[HDCodableObjectCollection setGeneratedObjectCollection:](self, "setGeneratedObjectCollection:", v6);

  }
  -[HDCodableObjectCollection generatedObjectCollection](self, "generatedObjectCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addMedicationDoseEvent:", v4);

}

- (BOOL)unitTest_isEquivalentToObjectCollection:(id)a3
{
  void *v3;
  id v5;
  HDCodableSource *source;
  HDCodableSource *v7;
  NSString *sourceBundleIdentifier;
  NSString *v9;
  HDCodableProvenance *provenance;
  HDCodableProvenance *v11;
  HDCodableGeneratedObjectCollection *generatedObjectCollection;
  HDCodableGeneratedObjectCollection *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  BOOL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  uint64_t i;
  uint64_t j;
  _QWORD v32[19];
  _QWORD v33[21];

  v33[19] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_28;
  source = self->_source;
  v7 = (HDCodableSource *)*((_QWORD *)v5 + 19);
  if (source != v7 && (!v7 || !-[HDCodableSource isEqual:](source, "isEqual:")))
    goto LABEL_28;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  v9 = (NSString *)*((_QWORD *)v5 + 20);
  if (sourceBundleIdentifier != v9 && (!v9 || !-[NSString isEqual:](sourceBundleIdentifier, "isEqual:")))
    goto LABEL_28;
  provenance = self->_provenance;
  v11 = (HDCodableProvenance *)*((_QWORD *)v5 + 15);
  if (provenance != v11 && (!v11 || !-[HDCodableProvenance isEqual:](provenance, "isEqual:")))
    goto LABEL_28;
  generatedObjectCollection = self->_generatedObjectCollection;
  v13 = generatedObjectCollection;
  if (!generatedObjectCollection)
  {
    objc_msgSend(v5, "generatedObjectCollection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_16;
    v3 = (void *)v14;
    v13 = self->_generatedObjectCollection;
  }
  objc_msgSend(v5, "generatedObjectCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCodableGeneratedObjectCollection unitTest_isEquivalentToGeneratedObjectCollection:](v13, "unitTest_isEquivalentToGeneratedObjectCollection:", v15);

  if (generatedObjectCollection)
  {
    if (v16)
      goto LABEL_16;
LABEL_28:
    v18 = 0;
    goto LABEL_29;
  }

  if (!v16)
    goto LABEL_28;
LABEL_16:
  v33[0] = self->_categorySamples;
  v33[1] = self->_quantitySamples;
  v33[2] = self->_workouts;
  v33[3] = self->_correlations;
  v33[4] = self->_activityCaches;
  v33[5] = self->_activityGoalSchedules;
  v33[6] = self->_pauseRingsSchedules;
  v33[7] = self->_binarySamples;
  v33[8] = self->_deletedSamples;
  v33[9] = self->_locationSeries;
  v33[10] = self->_cdaDocumentSamples;
  v33[11] = self->_fitnessFriendAchievements;
  v33[12] = self->_fitnessFriendActivitySnapshots;
  v33[13] = self->_fitnessFriendWorkouts;
  v33[14] = self->_ecgSamples;
  v33[15] = self->_sleepSchedules;
  v33[16] = self->_visionSamples;
  v33[17] = self->_stateOfMindLogs;
  v33[18] = self->_scoredAssessmentSamples;
  v32[0] = *((id *)v5 + 4);
  v32[1] = *((id *)v5 + 16);
  v32[2] = *((id *)v5 + 25);
  v32[3] = *((id *)v5 + 6);
  v32[4] = *((id *)v5 + 1);
  v32[5] = *((id *)v5 + 2);
  v32[6] = *((id *)v5 + 14);
  v32[7] = *((id *)v5 + 3);
  v32[8] = *((id *)v5 + 7);
  v32[9] = *((id *)v5 + 13);
  v32[10] = *((id *)v5 + 5);
  v32[11] = *((id *)v5 + 9);
  v32[12] = *((id *)v5 + 10);
  v32[13] = *((id *)v5 + 11);
  v32[14] = *((id *)v5 + 8);
  v32[15] = *((id *)v5 + 18);
  v32[16] = *((id *)v5 + 23);
  v32[17] = *((id *)v5 + 21);
  v17 = 0;
  v18 = 0;
  v32[18] = *((id *)v5 + 17);
  v19 = (id)MEMORY[0x1E0C9AA60];
  while (1)
  {
    v20 = (id)v33[v17];
    v21 = (id)v32[v17];
    if (v20 != v21)
    {
      v22 = objc_alloc(MEMORY[0x1E0C99E60]);
      v23 = v20 ? v20 : v19;
      v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);
      v25 = objc_alloc(MEMORY[0x1E0C99E60]);
      v26 = v21 ? v21 : v19;
      v27 = (void *)objc_msgSend(v25, "initWithArray:", v26);
      v28 = objc_msgSend(v24, "isEqualToSet:", v27);

      if (!v28)
        break;
    }

    v18 = v17++ > 0x11;
    if (v17 == 19)
    {
      v18 = 1;
      goto LABEL_31;
    }
  }

LABEL_31:
  for (i = 18; i != -1; --i)

  for (j = 18; j != -1; --j)
LABEL_29:

  return v18;
}

@end

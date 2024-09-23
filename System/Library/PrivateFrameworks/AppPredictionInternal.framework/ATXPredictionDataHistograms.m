@implementation ATXPredictionDataHistograms

- (ATXPredictionDataHistograms)initWithAppInfoManager:(id)a3 bundleIdTable:(id)a4 launchSequenceManager:(id)a5 histogramManager:(id)a6
{
  return (ATXPredictionDataHistograms *)-[ATXPredictionDataHistograms initWithAppInfoManager:bundleIdTable:launchSequenceManager:histogramManager:dataStore:persistHistograms:]((id *)&self->super.isa, a3, a4, a5, a6, 0, 0);
}

- (id)initWithAppInfoManager:(void *)a3 bundleIdTable:(void *)a4 launchSequenceManager:(void *)a5 histogramManager:(void *)a6 dataStore:(int)a7 persistHistograms:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void (**v28)(void *, _QWORD);
  id v29;
  id v30;
  id v31;
  void (**v32)(void *, uint64_t);
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  id v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  id v166;
  uint64_t v167;
  id v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  id v172;
  uint64_t v173;
  id v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  id v180;
  uint64_t v181;
  id v182;
  uint64_t v183;
  id v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  id v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  id v204;
  uint64_t v205;
  id v206;
  id v208;
  void *v209;
  id v210;
  _QWORD v211[4];
  id v212;
  id v213;
  id v214;
  char v215;
  _QWORD aBlock[4];
  id v217;
  id v218;
  id v219;
  char v220;
  objc_super v221;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v18;
  if (a1)
  {
    if (a7)
      v20 = v18;
    else
      v20 = v17;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms_, a1, CFSTR("ATXPredictionDataHistograms.m"), 62, CFSTR("Data store or histogram manager is missing"));

    }
    v221.receiver = a1;
    v221.super_class = (Class)ATXPredictionDataHistograms;
    v21 = (id *)objc_msgSendSuper2(&v221, sel_init);
    a1 = v21;
    if (v21)
    {
      objc_storeStrong(v21 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      v210 = v14;
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke;
      aBlock[3] = &unk_1E82EA028;
      v220 = a7;
      v24 = v19;
      v217 = v24;
      v25 = v19;
      v26 = v15;
      v27 = v17;
      v218 = v27;
      v219 = v22;
      v208 = v22;
      v28 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
      v211[0] = MEMORY[0x1E0C809B0];
      v211[1] = 3221225472;
      v211[2] = __135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke_2;
      v211[3] = &unk_1E82EA050;
      v215 = a7;
      v29 = v24;
      v14 = v210;
      v212 = v29;
      v30 = v27;
      v15 = v26;
      v19 = v25;
      v213 = v30;
      v214 = v23;
      v31 = v23;
      v32 = (void (**)(void *, uint64_t))_Block_copy(v211);
      v28[2](v28, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = a1[4];
      a1[4] = (id)v33;

      v28[2](v28, 1);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = a1[5];
      a1[5] = (id)v35;

      v28[2](v28, 92);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = a1[6];
      a1[6] = (id)v37;

      v28[2](v28, 93);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = a1[7];
      a1[7] = (id)v39;

      v28[2](v28, 11);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = a1[8];
      a1[8] = (id)v41;

      v28[2](v28, 2);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = a1[9];
      a1[9] = (id)v43;

      v28[2](v28, 3);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = a1[10];
      a1[10] = (id)v45;

      v28[2](v28, 5);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = a1[11];
      a1[11] = (id)v47;

      v28[2](v28, 14);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = a1[12];
      a1[12] = (id)v49;

      v28[2](v28, 23);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = a1[13];
      a1[13] = (id)v51;

      v28[2](v28, 17);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = a1[14];
      a1[14] = (id)v53;

      v28[2](v28, 26);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = a1[15];
      a1[15] = (id)v55;

      v28[2](v28, 20);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = a1[16];
      a1[16] = (id)v57;

      v28[2](v28, 16);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = a1[17];
      a1[17] = (id)v59;

      v28[2](v28, 25);
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = a1[18];
      a1[18] = (id)v61;

      v28[2](v28, 19);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = a1[19];
      a1[19] = (id)v63;

      v28[2](v28, 28);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = a1[20];
      a1[20] = (id)v65;

      v28[2](v28, 22);
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = a1[21];
      a1[21] = (id)v67;

      v28[2](v28, 35);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = a1[22];
      a1[22] = (id)v69;

      v28[2](v28, 36);
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = a1[23];
      a1[23] = (id)v71;

      v32[2](v32, 4);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = a1[24];
      a1[24] = (id)v73;

      v32[2](v32, 37);
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = a1[25];
      a1[25] = (id)v75;

      v32[2](v32, 42);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = a1[26];
      a1[26] = (id)v77;

      v32[2](v32, 43);
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = a1[27];
      a1[27] = (id)v79;

      v32[2](v32, 44);
      v81 = objc_claimAutoreleasedReturnValue();
      v82 = a1[28];
      a1[28] = (id)v81;

      v32[2](v32, 45);
      v83 = objc_claimAutoreleasedReturnValue();
      v84 = a1[29];
      a1[29] = (id)v83;

      v32[2](v32, 46);
      v85 = objc_claimAutoreleasedReturnValue();
      v86 = a1[30];
      a1[30] = (id)v85;

      v32[2](v32, 47);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = a1[31];
      a1[31] = (id)v87;

      v32[2](v32, 48);
      v89 = objc_claimAutoreleasedReturnValue();
      v90 = a1[32];
      a1[32] = (id)v89;

      v32[2](v32, 50);
      v91 = objc_claimAutoreleasedReturnValue();
      v92 = a1[33];
      a1[33] = (id)v91;

      v32[2](v32, 51);
      v93 = objc_claimAutoreleasedReturnValue();
      v94 = a1[34];
      a1[34] = (id)v93;

      v32[2](v32, 61);
      v95 = objc_claimAutoreleasedReturnValue();
      v96 = a1[35];
      a1[35] = (id)v95;

      v32[2](v32, 52);
      v97 = objc_claimAutoreleasedReturnValue();
      v98 = a1[36];
      a1[36] = (id)v97;

      v32[2](v32, 53);
      v99 = objc_claimAutoreleasedReturnValue();
      v100 = a1[37];
      a1[37] = (id)v99;

      v32[2](v32, 54);
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = a1[38];
      a1[38] = (id)v101;

      v32[2](v32, 55);
      v103 = objc_claimAutoreleasedReturnValue();
      v104 = a1[39];
      a1[39] = (id)v103;

      v32[2](v32, 56);
      v105 = objc_claimAutoreleasedReturnValue();
      v106 = a1[40];
      a1[40] = (id)v105;

      v32[2](v32, 57);
      v107 = objc_claimAutoreleasedReturnValue();
      v108 = a1[41];
      a1[41] = (id)v107;

      v32[2](v32, 58);
      v109 = objc_claimAutoreleasedReturnValue();
      v110 = a1[42];
      a1[42] = (id)v109;

      v32[2](v32, 59);
      v111 = objc_claimAutoreleasedReturnValue();
      v112 = a1[43];
      a1[43] = (id)v111;

      v32[2](v32, 60);
      v113 = objc_claimAutoreleasedReturnValue();
      v114 = a1[44];
      a1[44] = (id)v113;

      v32[2](v32, 87);
      v115 = objc_claimAutoreleasedReturnValue();
      v116 = a1[45];
      a1[45] = (id)v115;

      v32[2](v32, 29);
      v117 = objc_claimAutoreleasedReturnValue();
      v118 = a1[46];
      a1[46] = (id)v117;

      v32[2](v32, 38);
      v119 = objc_claimAutoreleasedReturnValue();
      v120 = a1[47];
      a1[47] = (id)v119;

      v32[2](v32, 31);
      v121 = objc_claimAutoreleasedReturnValue();
      v122 = a1[48];
      a1[48] = (id)v121;

      v32[2](v32, 39);
      v123 = objc_claimAutoreleasedReturnValue();
      v124 = a1[49];
      a1[49] = (id)v123;

      v32[2](v32, 33);
      v125 = objc_claimAutoreleasedReturnValue();
      v126 = a1[50];
      a1[50] = (id)v125;

      v32[2](v32, 34);
      v127 = objc_claimAutoreleasedReturnValue();
      v128 = a1[51];
      a1[51] = (id)v127;

      v32[2](v32, 40);
      v129 = objc_claimAutoreleasedReturnValue();
      v130 = a1[52];
      a1[52] = (id)v129;

      v32[2](v32, 49);
      v131 = objc_claimAutoreleasedReturnValue();
      v132 = a1[53];
      a1[53] = (id)v131;

      v32[2](v32, 94);
      v133 = objc_claimAutoreleasedReturnValue();
      v134 = a1[54];
      a1[54] = (id)v133;

      v32[2](v32, 32);
      v135 = objc_claimAutoreleasedReturnValue();
      v136 = a1[55];
      a1[55] = (id)v135;

      v32[2](v32, 62);
      v137 = objc_claimAutoreleasedReturnValue();
      v138 = a1[56];
      a1[56] = (id)v137;

      v32[2](v32, 63);
      v139 = objc_claimAutoreleasedReturnValue();
      v140 = a1[57];
      a1[57] = (id)v139;

      v32[2](v32, 64);
      v141 = objc_claimAutoreleasedReturnValue();
      v142 = a1[58];
      a1[58] = (id)v141;

      v32[2](v32, 65);
      v143 = objc_claimAutoreleasedReturnValue();
      v144 = a1[59];
      a1[59] = (id)v143;

      v32[2](v32, 66);
      v145 = objc_claimAutoreleasedReturnValue();
      v146 = a1[60];
      a1[60] = (id)v145;

      v32[2](v32, 67);
      v147 = objc_claimAutoreleasedReturnValue();
      v148 = a1[61];
      a1[61] = (id)v147;

      v32[2](v32, 68);
      v149 = objc_claimAutoreleasedReturnValue();
      v150 = a1[62];
      a1[62] = (id)v149;

      v32[2](v32, 69);
      v151 = objc_claimAutoreleasedReturnValue();
      v152 = a1[63];
      a1[63] = (id)v151;

      v32[2](v32, 70);
      v153 = objc_claimAutoreleasedReturnValue();
      v154 = a1[64];
      a1[64] = (id)v153;

      v32[2](v32, 71);
      v155 = objc_claimAutoreleasedReturnValue();
      v156 = a1[65];
      a1[65] = (id)v155;

      v32[2](v32, 72);
      v157 = objc_claimAutoreleasedReturnValue();
      v158 = a1[66];
      a1[66] = (id)v157;

      v32[2](v32, 73);
      v159 = objc_claimAutoreleasedReturnValue();
      v160 = a1[67];
      a1[67] = (id)v159;

      v32[2](v32, 74);
      v161 = objc_claimAutoreleasedReturnValue();
      v162 = a1[68];
      a1[68] = (id)v161;

      v32[2](v32, 88);
      v163 = objc_claimAutoreleasedReturnValue();
      v164 = a1[69];
      a1[69] = (id)v163;

      v32[2](v32, 75);
      v165 = objc_claimAutoreleasedReturnValue();
      v166 = a1[70];
      a1[70] = (id)v165;

      v32[2](v32, 76);
      v167 = objc_claimAutoreleasedReturnValue();
      v168 = a1[71];
      a1[71] = (id)v167;

      v32[2](v32, 77);
      v169 = objc_claimAutoreleasedReturnValue();
      v170 = a1[72];
      a1[72] = (id)v169;

      v32[2](v32, 78);
      v171 = objc_claimAutoreleasedReturnValue();
      v172 = a1[73];
      a1[73] = (id)v171;

      v32[2](v32, 79);
      v173 = objc_claimAutoreleasedReturnValue();
      v174 = a1[74];
      a1[74] = (id)v173;

      v32[2](v32, 80);
      v175 = objc_claimAutoreleasedReturnValue();
      v176 = a1[75];
      a1[75] = (id)v175;

      v32[2](v32, 81);
      v177 = objc_claimAutoreleasedReturnValue();
      v178 = a1[76];
      a1[76] = (id)v177;

      v32[2](v32, 82);
      v179 = objc_claimAutoreleasedReturnValue();
      v180 = a1[77];
      a1[77] = (id)v179;

      v32[2](v32, 83);
      v181 = objc_claimAutoreleasedReturnValue();
      v182 = a1[78];
      a1[78] = (id)v181;

      v32[2](v32, 84);
      v183 = objc_claimAutoreleasedReturnValue();
      v184 = a1[79];
      a1[79] = (id)v183;

      v32[2](v32, 85);
      v185 = objc_claimAutoreleasedReturnValue();
      v186 = a1[80];
      a1[80] = (id)v185;

      v32[2](v32, 86);
      v187 = objc_claimAutoreleasedReturnValue();
      v188 = a1[81];
      a1[81] = (id)v187;

      v32[2](v32, 89);
      v189 = objc_claimAutoreleasedReturnValue();
      v190 = a1[82];
      a1[82] = (id)v189;

      v32[2](v32, 95);
      v191 = objc_claimAutoreleasedReturnValue();
      v192 = a1[83];
      a1[83] = (id)v191;

      v32[2](v32, 96);
      v193 = objc_claimAutoreleasedReturnValue();
      v194 = a1[84];
      a1[84] = (id)v193;

      v32[2](v32, 97);
      v195 = objc_claimAutoreleasedReturnValue();
      v196 = a1[85];
      a1[85] = (id)v195;

      v32[2](v32, 98);
      v197 = objc_claimAutoreleasedReturnValue();
      v198 = a1[86];
      a1[86] = (id)v197;

      v199 = objc_msgSend(v208, "copy");
      v200 = a1[88];
      a1[88] = (id)v199;

      objc_msgSend(v208, "allValues");
      v201 = objc_claimAutoreleasedReturnValue();
      v202 = a1[87];
      a1[87] = (id)v201;

      v203 = objc_msgSend(v31, "copy");
      v204 = a1[90];
      a1[90] = (id)v203;

      objc_msgSend(v31, "allValues");
      v205 = objc_claimAutoreleasedReturnValue();
      v206 = a1[89];
      a1[89] = (id)v205;

    }
  }

  return a1;
}

- (id)initPersistentHistogramsWithAppInfoManager:(id)a3 bundleIdTable:(id)a4 launchSequenceManager:(id)a5 dataStore:(id)a6
{
  return -[ATXPredictionDataHistograms initWithAppInfoManager:bundleIdTable:launchSequenceManager:histogramManager:dataStore:persistHistograms:]((id *)&self->super.isa, a3, a4, a5, 0, a6, 1);
}

_ATXAppLaunchHistogramWithPersistentBackup *__135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke(uint64_t a1, uint64_t a2)
{
  _ATXAppLaunchHistogramWithPersistentBackup *v4;
  _ATXAppLaunchHistogramWithPersistentBackup *v5;
  void *v6;
  void *v7;

  if (*(_BYTE *)(a1 + 56))
  {
    v4 = -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:]([_ATXAppLaunchHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:", *(_QWORD *)(a1 + 32), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "histogramForLaunchType:", a2);
    v4 = (_ATXAppLaunchHistogramWithPersistentBackup *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return v5;
}

_ATXAppLaunchCategoricalHistogramWithPersistentBackup *__135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _ATXAppLaunchCategoricalHistogramWithPersistentBackup *v4;
  _ATXAppLaunchCategoricalHistogramWithPersistentBackup *v5;
  void *v6;
  void *v7;

  if (*(_BYTE *)(a1 + 56))
  {
    v4 = -[_ATXAppLaunchCategoricalHistogramWithPersistentBackup initWithDataStore:histogramType:]([_ATXAppLaunchCategoricalHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:", *(_QWORD *)(a1 + 32), a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "categoricalHistogramForLaunchType:", a2);
    v4 = (_ATXAppLaunchCategoricalHistogramWithPersistentBackup *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return v5;
}

- (_QWORD)allHistograms
{
  _QWORD *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a1[87]);
    objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v1[89]);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (NSArray)actionKeyBasedHistograms
{
  _ATXAppLaunchCategoricalHistogram *appIntentCoreMotionLaunchHistogram;
  __int128 v4;
  _ATXAppLaunchHistogram *appIntentDayOfWeekHistogram;
  __int128 v6;
  _ATXAppLaunchCategoricalHistogram *appIntentWifiHistogram;
  _ATXAppLaunchCategoricalHistogram *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&self->_appIntentLaunchHistogram;
  appIntentDayOfWeekHistogram = self->_appIntentDayOfWeekHistogram;
  v6 = *(_OWORD *)&self->_appIntentAirplaneModeLaunchHistogram;
  appIntentCoreMotionLaunchHistogram = self->_appIntentCoreMotionLaunchHistogram;
  appIntentWifiHistogram = self->_appIntentWifiHistogram;
  v8 = appIntentCoreMotionLaunchHistogram;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)removeExpiredData
{
  _ATXAppLaunchCategoricalHistogram *appCoarseTimePOWLocationLaunchesHistogram;
  _ATXAppLaunchCategoricalHistogram *appCoarseTimePOWLocationConfirmsHistogram;
  _ATXAppLaunchCategoricalHistogram *appCoarseTimePOWLocationRejectsHistogram;
  _ATXAppLaunchCategoricalHistogram *appCoarseGeoHashHistogram;
  _ATXAppLaunchCategoricalHistogram *appConfirmsDayOfWeek;
  _ATXAppLaunchCategoricalHistogram *appRejectsDayOfWeek;
  _ATXAppLaunchCategoricalHistogram *appRejectsCoarseGeoHash;
  _ATXAppLaunchCategoricalHistogram *appRejectsSpecificGeoHash;
  _ATXAppLaunchHistogram *appForAllIntentsLaunchHistogram;
  _ATXAppLaunchHistogram *appForAllIntentsUnlockTimeHistogram;
  _ATXAppLaunchHistogram *appForAllIntentsAirplaneModeLaunchHistogram;
  _ATXAppLaunchCategoricalHistogram *appForAllIntentsWifiHistogram;
  _ATXAppLaunchCategoricalHistogram *appForAllIntentsCoreMotionLaunchHistogram;
  _ATXAppLaunchHistogram *heuristicConfirmsHistogram;
  _ATXAppInfoManager *infoManager;
  ATXHistogramBundleIdTable *bundleIdTable;
  _ATXAppLaunchCategoricalHistogram *actionConfirmsHistogram;
  _ATXAppLaunchCategoricalHistogram *actionRejectsHistogram;
  _ATXAppLaunchSequenceManager *seqManager;
  _ATXAppLaunchCategoricalHistogram *appClipsFeedbackHistogramNoDecay;
  _ATXAppLaunchCategoricalHistogram *notificationsHistoryHistogram;
  _ATXAppLaunchCategoricalHistogram *appIntentPartOfWeekHistogram;
  __int128 v25;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppConfirmsDayOfWeekHistogram;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppConfirmsSpecificGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppRejectsDayOfWeekHistogram;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppRejectsSpecificGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryConfirmsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryConfirmsTwoHourTimeIntervalHistogram;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  ATXExpiredDataProvider *v42;
  NSObject *v43;
  NSObject *v44;
  uint8_t v45[16];
  _ATXAppLaunchSequenceManager *v46;
  __int128 v47;
  _ATXAppLaunchHistogram *homescreenLaunchHistogram;
  __int128 v49;
  _ATXAppLaunchHistogram *dayOfWeekLaunchHistogram;
  __int128 v51;
  __int128 v52;
  _ATXAppLaunchCategoricalHistogram *timeAndDayHistogram;
  _ATXAppLaunchCategoricalHistogram *v54;
  _ATXAppLaunchCategoricalHistogram *appSpecificTimeDOWLocationLaunchesHistogram;
  _ATXAppLaunchCategoricalHistogram *v56;
  _ATXAppLaunchCategoricalHistogram *appSpecificTimeDOWLocationConfirmsHistogram;
  _ATXAppLaunchCategoricalHistogram *v58;
  __int128 v59;
  _ATXAppLaunchCategoricalHistogram *v60;
  __int128 v61;
  __int128 v62;
  _ATXAppLaunchCategoricalHistogram *v63;
  _ATXAppLaunchCategoricalHistogram *v64;
  _ATXAppLaunchCategoricalHistogram *appConfirmsCoarseGeoHash;
  _ATXAppLaunchCategoricalHistogram *v66;
  _ATXAppLaunchCategoricalHistogram *appConfirmsSpecificGeoHash;
  _ATXAppLaunchCategoricalHistogram *v68;
  _ATXAppLaunchCategoricalHistogram *appExplicitRejectsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchHistogram *v70;
  _ATXAppLaunchHistogram *v71;
  _ATXAppLaunchHistogram *appForAllIntentsDayOfWeekHistogram;
  _ATXAppLaunchHistogram *v73;
  _ATXAppLaunchHistogram *appForAllIntentsTrendingLaunchHistogram;
  _ATXAppLaunchCategoricalHistogram *v75;
  _ATXAppLaunchCategoricalHistogram *v76;
  _ATXAppInfoManager *v77;
  ATXHistogramBundleIdTable *v78;
  _ATXAppLaunchCategoricalHistogram *v79;
  _ATXAppLaunchCategoricalHistogram *v80;
  _ATXAppLaunchHistogram *v81;
  _ATXAppLaunchHistogram *heuristicRejectsHistogram;
  _ATXAppLaunchSequenceManager *v83;
  _ATXAppLaunchCategoricalHistogram *appClipsFeedbackHistogram;
  _ATXAppLaunchCategoricalHistogram *v85;
  _ATXAppLaunchCategoricalHistogram *v86;
  _ATXAppLaunchCategoricalHistogram *v87;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppConfirmsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *v89;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppConfirmsTwoHourTimeIntervalHistogram;
  _ATXAppLaunchCategoricalHistogram *v91;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppConfirmsCoarseGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *v93;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppRejectsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *v95;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppRejectsTwoHourTimeIntervalHistogram;
  _ATXAppLaunchCategoricalHistogram *v97;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppRejectsCoarseGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *v99;
  _ATXAppLaunchCategoricalHistogram *homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *v101;
  _ATXAppLaunchCategoricalHistogram *appDirectoryConfirmsSpecificTimeDOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *v103;
  _ATXAppLaunchCategoricalHistogram *appDirectoryConfirmsDayOfWeekHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryConfirmsCoarseGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryConfirmsSpecificGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryRejectsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryRejectsSpecificTimeDOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryRejectsTwoHourTimeIntervalHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryRejectsDayOfWeekHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryRejectsCoarseGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryRejectsSpecificGeohashHistogram;
  _ATXAppLaunchCategoricalHistogram *appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram;
  _ATXAppLaunchCategoricalHistogram *poiCategoryHistogram;
  _ATXAppLaunchCategoricalHistogram *activitySuggestionsFeedbackHistogram;
  _ATXAppLaunchCategoricalHistogram *notificationDigestAppEngagementHistogram;
  _ATXAppLaunchCategoricalHistogram *notificationDigestAlltimeMarqueeAppearancesHistogram;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  homescreenLaunchHistogram = self->_homescreenLaunchHistogram;
  dayOfWeekLaunchHistogram = self->_dayOfWeekLaunchHistogram;
  appCoarseTimePOWLocationLaunchesHistogram = self->_appCoarseTimePOWLocationLaunchesHistogram;
  timeAndDayHistogram = self->_timeAndDayHistogram;
  v54 = appCoarseTimePOWLocationLaunchesHistogram;
  appCoarseTimePOWLocationConfirmsHistogram = self->_appCoarseTimePOWLocationConfirmsHistogram;
  appSpecificTimeDOWLocationLaunchesHistogram = self->_appSpecificTimeDOWLocationLaunchesHistogram;
  v56 = appCoarseTimePOWLocationConfirmsHistogram;
  appCoarseTimePOWLocationRejectsHistogram = self->_appCoarseTimePOWLocationRejectsHistogram;
  appSpecificTimeDOWLocationConfirmsHistogram = self->_appSpecificTimeDOWLocationConfirmsHistogram;
  v58 = appCoarseTimePOWLocationRejectsHistogram;
  v59 = *(_OWORD *)&self->_appSpecificTimeDOWLocationRejectsHistogram;
  appCoarseGeoHashHistogram = self->_appCoarseGeoHashHistogram;
  v61 = *(_OWORD *)&self->_appZoom7GeoHashHistogram;
  v62 = *(_OWORD *)&self->_appConfirmsTwoHourTimeInterval;
  appConfirmsDayOfWeek = self->_appConfirmsDayOfWeek;
  appRejectsDayOfWeek = self->_appRejectsDayOfWeek;
  v60 = appCoarseGeoHashHistogram;
  v63 = appConfirmsDayOfWeek;
  v64 = appRejectsDayOfWeek;
  appRejectsCoarseGeoHash = self->_appRejectsCoarseGeoHash;
  appConfirmsCoarseGeoHash = self->_appConfirmsCoarseGeoHash;
  v66 = appRejectsCoarseGeoHash;
  appRejectsSpecificGeoHash = self->_appRejectsSpecificGeoHash;
  appConfirmsSpecificGeoHash = self->_appConfirmsSpecificGeoHash;
  v68 = appRejectsSpecificGeoHash;
  appForAllIntentsLaunchHistogram = self->_appForAllIntentsLaunchHistogram;
  appForAllIntentsUnlockTimeHistogram = self->_appForAllIntentsUnlockTimeHistogram;
  appExplicitRejectsCoarseTimePOWLocationHistogram = self->_appExplicitRejectsCoarseTimePOWLocationHistogram;
  v70 = appForAllIntentsLaunchHistogram;
  v71 = appForAllIntentsUnlockTimeHistogram;
  appForAllIntentsAirplaneModeLaunchHistogram = self->_appForAllIntentsAirplaneModeLaunchHistogram;
  appForAllIntentsDayOfWeekHistogram = self->_appForAllIntentsDayOfWeekHistogram;
  v73 = appForAllIntentsAirplaneModeLaunchHistogram;
  appForAllIntentsWifiHistogram = self->_appForAllIntentsWifiHistogram;
  appForAllIntentsCoreMotionLaunchHistogram = self->_appForAllIntentsCoreMotionLaunchHistogram;
  heuristicConfirmsHistogram = self->_heuristicConfirmsHistogram;
  appForAllIntentsTrendingLaunchHistogram = self->_appForAllIntentsTrendingLaunchHistogram;
  v75 = appForAllIntentsWifiHistogram;
  infoManager = self->_infoManager;
  bundleIdTable = self->_bundleIdTable;
  v76 = appForAllIntentsCoreMotionLaunchHistogram;
  v77 = infoManager;
  actionConfirmsHistogram = self->_actionConfirmsHistogram;
  actionRejectsHistogram = self->_actionRejectsHistogram;
  v78 = bundleIdTable;
  v79 = actionConfirmsHistogram;
  v80 = actionRejectsHistogram;
  v81 = heuristicConfirmsHistogram;
  seqManager = self->_seqManager;
  heuristicRejectsHistogram = self->_heuristicRejectsHistogram;
  v83 = seqManager;
  appClipsFeedbackHistogramNoDecay = self->_appClipsFeedbackHistogramNoDecay;
  notificationsHistoryHistogram = self->_notificationsHistoryHistogram;
  appIntentPartOfWeekHistogram = self->_appIntentPartOfWeekHistogram;
  appClipsFeedbackHistogram = self->_appClipsFeedbackHistogram;
  v85 = appClipsFeedbackHistogramNoDecay;
  v47 = *(_OWORD *)&self->_appLaunchHistogram;
  v49 = *(_OWORD *)&self->_appDirectoryLaunchHistogram;
  v25 = *(_OWORD *)&self->_wifiLaunchHistogram;
  v51 = *(_OWORD *)&self->_airplaneModeLaunchHistogram;
  v52 = v25;
  v86 = notificationsHistoryHistogram;
  v87 = appIntentPartOfWeekHistogram;
  homeScreenAppConfirmsSpecificTimeDOWLocationHistogram = self->_homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
  homeScreenAppConfirmsCoarseTimePOWLocationHistogram = self->_homeScreenAppConfirmsCoarseTimePOWLocationHistogram;
  v89 = homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
  homeScreenAppConfirmsDayOfWeekHistogram = self->_homeScreenAppConfirmsDayOfWeekHistogram;
  homeScreenAppConfirmsTwoHourTimeIntervalHistogram = self->_homeScreenAppConfirmsTwoHourTimeIntervalHistogram;
  v91 = homeScreenAppConfirmsDayOfWeekHistogram;
  homeScreenAppConfirmsSpecificGeohashHistogram = self->_homeScreenAppConfirmsSpecificGeohashHistogram;
  homeScreenAppConfirmsCoarseGeohashHistogram = self->_homeScreenAppConfirmsCoarseGeohashHistogram;
  v93 = homeScreenAppConfirmsSpecificGeohashHistogram;
  homeScreenAppRejectsSpecificTimeDOWLocationHistogram = self->_homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
  homeScreenAppRejectsCoarseTimePOWLocationHistogram = self->_homeScreenAppRejectsCoarseTimePOWLocationHistogram;
  v95 = homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
  homeScreenAppRejectsDayOfWeekHistogram = self->_homeScreenAppRejectsDayOfWeekHistogram;
  homeScreenAppRejectsTwoHourTimeIntervalHistogram = self->_homeScreenAppRejectsTwoHourTimeIntervalHistogram;
  v97 = homeScreenAppRejectsDayOfWeekHistogram;
  homeScreenAppRejectsSpecificGeohashHistogram = self->_homeScreenAppRejectsSpecificGeohashHistogram;
  homeScreenAppRejectsCoarseGeohashHistogram = self->_homeScreenAppRejectsCoarseGeohashHistogram;
  v99 = homeScreenAppRejectsSpecificGeohashHistogram;
  appDirectoryConfirmsCoarseTimePOWLocationHistogram = self->_appDirectoryConfirmsCoarseTimePOWLocationHistogram;
  homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram = self->_homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram;
  v101 = appDirectoryConfirmsCoarseTimePOWLocationHistogram;
  appDirectoryConfirmsTwoHourTimeIntervalHistogram = self->_appDirectoryConfirmsTwoHourTimeIntervalHistogram;
  appDirectoryConfirmsSpecificTimeDOWLocationHistogram = self->_appDirectoryConfirmsSpecificTimeDOWLocationHistogram;
  v103 = appDirectoryConfirmsTwoHourTimeIntervalHistogram;
  appDirectoryConfirmsDayOfWeekHistogram = self->_appDirectoryConfirmsDayOfWeekHistogram;
  appDirectoryConfirmsCoarseGeohashHistogram = self->_appDirectoryConfirmsCoarseGeohashHistogram;
  appDirectoryConfirmsSpecificGeohashHistogram = self->_appDirectoryConfirmsSpecificGeohashHistogram;
  appDirectoryRejectsCoarseTimePOWLocationHistogram = self->_appDirectoryRejectsCoarseTimePOWLocationHistogram;
  appDirectoryRejectsSpecificTimeDOWLocationHistogram = self->_appDirectoryRejectsSpecificTimeDOWLocationHistogram;
  appDirectoryRejectsTwoHourTimeIntervalHistogram = self->_appDirectoryRejectsTwoHourTimeIntervalHistogram;
  appDirectoryRejectsDayOfWeekHistogram = self->_appDirectoryRejectsDayOfWeekHistogram;
  appDirectoryRejectsCoarseGeohashHistogram = self->_appDirectoryRejectsCoarseGeohashHistogram;
  appDirectoryRejectsSpecificGeohashHistogram = self->_appDirectoryRejectsSpecificGeohashHistogram;
  appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram = self->_appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram;
  poiCategoryHistogram = self->_poiCategoryHistogram;
  activitySuggestionsFeedbackHistogram = self->_activitySuggestionsFeedbackHistogram;
  notificationDigestAppEngagementHistogram = self->_notificationDigestAppEngagementHistogram;
  notificationDigestAlltimeMarqueeAppearancesHistogram = self->_notificationDigestAlltimeMarqueeAppearancesHistogram;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 78);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = self->_seqManager;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionDataHistograms actionKeyBasedHistograms](self, "actionKeyBasedHistograms");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_default();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = os_signpost_id_generate(v38);

  __atxlog_handle_default();
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "RemoveOldLaunchInfo", " enableTelemetry=YES ", v45, 2u);
  }

  v42 = -[ATXExpiredDataProvider initWithAppInfoManager:histogramBundleIdTable:]([ATXExpiredDataProvider alloc], "initWithAppInfoManager:histogramBundleIdTable:", self->_infoManager, self->_bundleIdTable);
  +[ATXExpiredDataRemover removeExpiredBundleIdsFrom:removeExpiredActionKeysFrom:expiredDataProvider:](ATXExpiredDataRemover, "removeExpiredBundleIdsFrom:removeExpiredActionKeysFrom:expiredDataProvider:", v34, v37, v42);
  __atxlog_handle_default();
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v44, OS_SIGNPOST_INTERVAL_END, v39, "RemoveOldLaunchInfo", " enableTelemetry=YES ", v45, 2u);
  }

}

- (void)verifyHistograms
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ATXPredictionDataHistograms allHistograms](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "verifyDataIntegrity", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (_ATXAppInfoManager)infoManager
{
  return self->_infoManager;
}

- (ATXHistogramBundleIdTable)bundleIdTable
{
  return self->_bundleIdTable;
}

- (_ATXAppLaunchSequenceManager)seqManager
{
  return self->_seqManager;
}

- (_ATXAppLaunchHistogram)appLaunchHistogram
{
  return self->_appLaunchHistogram;
}

- (_ATXAppLaunchHistogram)spotlightLaunchHistogram
{
  return self->_spotlightLaunchHistogram;
}

- (_ATXAppLaunchHistogram)homescreenLaunchHistogram
{
  return self->_homescreenLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appDirectoryLaunchHistogram
{
  return self->_appDirectoryLaunchHistogram;
}

- (_ATXAppLaunchHistogram)unlockTimeHistogram
{
  return self->_unlockTimeHistogram;
}

- (_ATXAppLaunchHistogram)dayOfWeekLaunchHistogram
{
  return self->_dayOfWeekLaunchHistogram;
}

- (_ATXAppLaunchHistogram)airplaneModeLaunchHistogram
{
  return self->_airplaneModeLaunchHistogram;
}

- (_ATXAppLaunchHistogram)trendingLaunchHistogram
{
  return self->_trendingLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appIntentLaunchHistogram
{
  return self->_appIntentLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appIntentUnlockTimeHistogram
{
  return self->_appIntentUnlockTimeHistogram;
}

- (_ATXAppLaunchHistogram)appIntentDayOfWeekHistogram
{
  return self->_appIntentDayOfWeekHistogram;
}

- (_ATXAppLaunchHistogram)appIntentAirplaneModeLaunchHistogram
{
  return self->_appIntentAirplaneModeLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appIntentTrendingLaunchHistogram
{
  return self->_appIntentTrendingLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsLaunchHistogram
{
  return self->_appForAllIntentsLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsUnlockTimeHistogram
{
  return self->_appForAllIntentsUnlockTimeHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsDayOfWeekHistogram
{
  return self->_appForAllIntentsDayOfWeekHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsAirplaneModeLaunchHistogram
{
  return self->_appForAllIntentsAirplaneModeLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsTrendingLaunchHistogram
{
  return self->_appForAllIntentsTrendingLaunchHistogram;
}

- (_ATXAppLaunchHistogram)heuristicConfirmsHistogram
{
  return self->_heuristicConfirmsHistogram;
}

- (_ATXAppLaunchHistogram)heuristicRejectsHistogram
{
  return self->_heuristicRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)wifiLaunchHistogram
{
  return self->_wifiLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)coreMotionLaunchHistogram
{
  return self->_coreMotionLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)timeAndDayHistogram
{
  return self->_timeAndDayHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationLaunchesHistogram
{
  return self->_appCoarseTimePOWLocationLaunchesHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationLaunchesHistogram
{
  return self->_appSpecificTimeDOWLocationLaunchesHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationConfirmsHistogram
{
  return self->_appCoarseTimePOWLocationConfirmsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationConfirmsHistogram
{
  return self->_appSpecificTimeDOWLocationConfirmsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationRejectsHistogram
{
  return self->_appCoarseTimePOWLocationRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationRejectsHistogram
{
  return self->_appSpecificTimeDOWLocationRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificGeoHashHistogram
{
  return self->_appSpecificGeoHashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseGeoHashHistogram
{
  return self->_appCoarseGeoHashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appZoom7GeoHashHistogram
{
  return self->_appZoom7GeoHashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appLaunchesTwoHourTimeInterval
{
  return self->_appLaunchesTwoHourTimeInterval;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsTwoHourTimeInterval
{
  return self->_appConfirmsTwoHourTimeInterval;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsTwoHourTimeInterval
{
  return self->_appRejectsTwoHourTimeInterval;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsDayOfWeek
{
  return self->_appConfirmsDayOfWeek;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsDayOfWeek
{
  return self->_appRejectsDayOfWeek;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsCoarseGeoHash
{
  return self->_appConfirmsCoarseGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsCoarseGeoHash
{
  return self->_appRejectsCoarseGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsSpecificGeoHash
{
  return self->_appConfirmsSpecificGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsSpecificGeoHash
{
  return self->_appRejectsSpecificGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appExplicitRejectsCoarseTimePOWLocationHistogram
{
  return self->_appExplicitRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appIntentWifiHistogram
{
  return self->_appIntentWifiHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appIntentCoreMotionLaunchHistogram
{
  return self->_appIntentCoreMotionLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appForAllIntentsWifiHistogram
{
  return self->_appForAllIntentsWifiHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appForAllIntentsCoreMotionLaunchHistogram
{
  return self->_appForAllIntentsCoreMotionLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)actionConfirmsHistogram
{
  return self->_actionConfirmsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)actionRejectsHistogram
{
  return self->_actionRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appIntentPartOfWeekHistogram
{
  return self->_appIntentPartOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appClipsFeedbackHistogram
{
  return self->_appClipsFeedbackHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appClipsFeedbackHistogramNoDecay
{
  return self->_appClipsFeedbackHistogramNoDecay;
}

- (_ATXAppLaunchCategoricalHistogram)notificationsHistoryHistogram
{
  return self->_notificationsHistoryHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenWidgetInteractionHistogram
{
  return self->_homeScreenWidgetInteractionHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsCoarseTimePOWLocationHistogram
{
  return self->_homeScreenAppConfirmsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsSpecificTimeDOWLocationHistogram
{
  return self->_homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsTwoHourTimeIntervalHistogram
{
  return self->_homeScreenAppConfirmsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsDayOfWeekHistogram
{
  return self->_homeScreenAppConfirmsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsCoarseGeohashHistogram
{
  return self->_homeScreenAppConfirmsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsSpecificGeohashHistogram
{
  return self->_homeScreenAppConfirmsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsCoarseTimePOWLocationHistogram
{
  return self->_homeScreenAppRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsSpecificTimeDOWLocationHistogram
{
  return self->_homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsTwoHourTimeIntervalHistogram
{
  return self->_homeScreenAppRejectsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsDayOfWeekHistogram
{
  return self->_homeScreenAppRejectsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsCoarseGeohashHistogram
{
  return self->_homeScreenAppRejectsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsSpecificGeohashHistogram
{
  return self->_homeScreenAppRejectsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram
{
  return self->_homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsCoarseTimePOWLocationHistogram
{
  return self->_appDirectoryConfirmsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsSpecificTimeDOWLocationHistogram
{
  return self->_appDirectoryConfirmsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsTwoHourTimeIntervalHistogram
{
  return self->_appDirectoryConfirmsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsDayOfWeekHistogram
{
  return self->_appDirectoryConfirmsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsCoarseGeohashHistogram
{
  return self->_appDirectoryConfirmsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsSpecificGeohashHistogram
{
  return self->_appDirectoryConfirmsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsCoarseTimePOWLocationHistogram
{
  return self->_appDirectoryRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsSpecificTimeDOWLocationHistogram
{
  return self->_appDirectoryRejectsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsTwoHourTimeIntervalHistogram
{
  return self->_appDirectoryRejectsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsDayOfWeekHistogram
{
  return self->_appDirectoryRejectsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsCoarseGeohashHistogram
{
  return self->_appDirectoryRejectsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsSpecificGeohashHistogram
{
  return self->_appDirectoryRejectsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram
{
  return self->_appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)poiCategoryHistogram
{
  return self->_poiCategoryHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)activitySuggestionsFeedbackHistogram
{
  return self->_activitySuggestionsFeedbackHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)notificationDigestAppEngagementHistogram
{
  return self->_notificationDigestAppEngagementHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)notificationDigestAlltimeMarqueeAppearancesHistogram
{
  return self->_notificationDigestAlltimeMarqueeAppearancesHistogram;
}

- (NSArray)histograms
{
  return self->_histograms;
}

- (NSDictionary)histogramTypes
{
  return self->_histogramTypes;
}

- (NSArray)categoricalHistograms
{
  return self->_categoricalHistograms;
}

- (NSDictionary)categoricalHistogramTypes
{
  return self->_categoricalHistogramTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoricalHistogramTypes, 0);
  objc_storeStrong((id *)&self->_categoricalHistograms, 0);
  objc_storeStrong((id *)&self->_histogramTypes, 0);
  objc_storeStrong((id *)&self->_histograms, 0);
  objc_storeStrong((id *)&self->_notificationDigestAlltimeMarqueeAppearancesHistogram, 0);
  objc_storeStrong((id *)&self->_notificationDigestAppEngagementHistogram, 0);
  objc_storeStrong((id *)&self->_activitySuggestionsFeedbackHistogram, 0);
  objc_storeStrong((id *)&self->_poiCategoryHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenWidgetInteractionHistogram, 0);
  objc_storeStrong((id *)&self->_notificationsHistoryHistogram, 0);
  objc_storeStrong((id *)&self->_appClipsFeedbackHistogramNoDecay, 0);
  objc_storeStrong((id *)&self->_appClipsFeedbackHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentPartOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_actionRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_actionConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsCoreMotionLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsWifiHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentCoreMotionLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentWifiHistogram, 0);
  objc_storeStrong((id *)&self->_appExplicitRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appRejectsSpecificGeoHash, 0);
  objc_storeStrong((id *)&self->_appConfirmsSpecificGeoHash, 0);
  objc_storeStrong((id *)&self->_appRejectsCoarseGeoHash, 0);
  objc_storeStrong((id *)&self->_appConfirmsCoarseGeoHash, 0);
  objc_storeStrong((id *)&self->_appRejectsDayOfWeek, 0);
  objc_storeStrong((id *)&self->_appConfirmsDayOfWeek, 0);
  objc_storeStrong((id *)&self->_appRejectsTwoHourTimeInterval, 0);
  objc_storeStrong((id *)&self->_appConfirmsTwoHourTimeInterval, 0);
  objc_storeStrong((id *)&self->_appLaunchesTwoHourTimeInterval, 0);
  objc_storeStrong((id *)&self->_appZoom7GeoHashHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseGeoHashHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificGeoHashHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificTimeDOWLocationRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseTimePOWLocationRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificTimeDOWLocationConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseTimePOWLocationConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificTimeDOWLocationLaunchesHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseTimePOWLocationLaunchesHistogram, 0);
  objc_storeStrong((id *)&self->_timeAndDayHistogram, 0);
  objc_storeStrong((id *)&self->_coreMotionLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_wifiLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_heuristicRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_heuristicConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsTrendingLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsAirplaneModeLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsUnlockTimeHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentTrendingLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentAirplaneModeLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentUnlockTimeHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_trendingLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_airplaneModeLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_dayOfWeekLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_unlockTimeHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_homescreenLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_spotlightLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_seqManager, 0);
  objc_storeStrong((id *)&self->_bundleIdTable, 0);
  objc_storeStrong((id *)&self->_infoManager, 0);
}

@end

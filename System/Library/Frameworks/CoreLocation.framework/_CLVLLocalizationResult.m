@implementation _CLVLLocalizationResult

- (_CLVLLocalizationResult)initWithTimestamp:(double)a3 localizationResult:(id)a4
{
  _CLVLLocalizationResult *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _CLVLLocalizationResult *v10;
  __int128 v11;
  __int128 v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _CLVLLocalizationDebugInfo *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)_CLVLLocalizationResult;
  v6 = -[_CLVLLocalizationResult init](&v42, sel_init);
  v10 = v6;
  if (v6)
  {
    if (a4)
    {
      v6->_timestamp = a3;
      objc_msgSend_location(a4, v7, v8, v9);
      v12 = v44;
      v11 = v45;
      *(_OWORD *)v10->_anon_20 = v43;
      *(_OWORD *)&v10->_anon_20[16] = v12;
      *(_OWORD *)&v10->_anon_20[32] = v11;
      objc_msgSend_transform(a4, v13, v14, v15);
      v16 = v48;
      *(_OWORD *)&v10->_anon_50[64] = v47;
      *(_OWORD *)&v10->_anon_50[80] = v16;
      v17 = v50;
      *(_OWORD *)&v10->_anon_50[96] = v49;
      *(_OWORD *)&v10->_anon_50[112] = v17;
      v18 = v44;
      *(_OWORD *)v10->_anon_50 = v43;
      *(_OWORD *)&v10->_anon_50[16] = v18;
      v19 = v46;
      *(_OWORD *)&v10->_anon_50[32] = v45;
      *(_OWORD *)&v10->_anon_50[48] = v19;
      objc_msgSend_confidence(a4, v20, v21, v22);
      v10->_confidence = v23;
      objc_msgSend_covariance(a4, v24, v25, v26);
      v27 = v50;
      *(_OWORD *)&v10->_covariance.v[4][0] = v49;
      *(_OWORD *)&v10->_covariance.v[4][4] = v27;
      *(_OWORD *)&v10->_covariance.v[5][2] = v51;
      v28 = v46;
      *(_OWORD *)&v10->_covariance.v[1][2] = v45;
      *(_OWORD *)&v10->_covariance.v[2][0] = v28;
      v29 = v48;
      *(_OWORD *)&v10->_covariance.v[2][4] = v47;
      *(_OWORD *)&v10->_covariance.v[3][2] = v29;
      v30 = v44;
      *(_OWORD *)&v10->_covariance.v[0][0] = v43;
      *(_OWORD *)&v10->_covariance.v[0][4] = v30;
      v10->_debugInfo = 0;
      if (objc_msgSend_debugInfo(a4, v31, v32, v33))
      {
        v34 = [_CLVLLocalizationDebugInfo alloc];
        v38 = objc_msgSend_debugInfo(a4, v35, v36, v37);
        v10->_debugInfo = (_CLVLLocalizationDebugInfo *)objc_msgSend_initWithVLLocalizationDebugInfo_(v34, v39, v38, v40);
      }
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLVLLocalizationResult;
  -[_CLVLLocalizationResult dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const char *v27;
  uint64_t v28;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(double *)(v12 + 16) = self->_timestamp;
  v13 = *(_OWORD *)self->_anon_20;
  v14 = *(_OWORD *)&self->_anon_20[32];
  *(_OWORD *)(v12 + 48) = *(_OWORD *)&self->_anon_20[16];
  *(_OWORD *)(v12 + 64) = v14;
  *(_OWORD *)(v12 + 32) = v13;
  v16 = *(_OWORD *)&self->_anon_50[64];
  v15 = *(_OWORD *)&self->_anon_50[80];
  v17 = *(_OWORD *)&self->_anon_50[112];
  *(_OWORD *)(v12 + 176) = *(_OWORD *)&self->_anon_50[96];
  *(_OWORD *)(v12 + 192) = v17;
  *(_OWORD *)(v12 + 144) = v16;
  *(_OWORD *)(v12 + 160) = v15;
  v18 = *(_OWORD *)&self->_anon_50[16];
  v19 = *(_OWORD *)&self->_anon_50[32];
  v20 = *(_OWORD *)&self->_anon_50[48];
  *(_OWORD *)(v12 + 80) = *(_OWORD *)self->_anon_50;
  *(_OWORD *)(v12 + 96) = v18;
  *(_OWORD *)(v12 + 112) = v19;
  *(_OWORD *)(v12 + 128) = v20;
  *(_OWORD *)(v12 + 208) = *(_OWORD *)&self->_covariance.v[0][0];
  v21 = *(_OWORD *)&self->_covariance.v[2][4];
  v23 = *(_OWORD *)&self->_covariance.v[0][4];
  v22 = *(_OWORD *)&self->_covariance.v[1][2];
  *(_OWORD *)(v12 + 256) = *(_OWORD *)&self->_covariance.v[2][0];
  *(_OWORD *)(v12 + 272) = v21;
  *(_OWORD *)(v12 + 224) = v23;
  *(_OWORD *)(v12 + 240) = v22;
  v24 = *(_OWORD *)&self->_covariance.v[5][2];
  v26 = *(_OWORD *)&self->_covariance.v[3][2];
  v25 = *(_OWORD *)&self->_covariance.v[4][0];
  *(_OWORD *)(v12 + 320) = *(_OWORD *)&self->_covariance.v[4][4];
  *(_OWORD *)(v12 + 336) = v24;
  *(_OWORD *)(v12 + 288) = v26;
  *(_OWORD *)(v12 + 304) = v25;
  *(float *)(v12 + 8) = self->_confidence;
  *(_QWORD *)(v12 + 24) = objc_msgSend_copyWithZone_(self->_debugInfo, v27, (uint64_t)a3, v28);
  return (id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVLLocalizationResult)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  _CLVLLocalizationResult *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  float v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)_CLVLLocalizationResult;
  v6 = -[_CLVLLocalizationResult init](&v40, sel_init);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("timestamp"), v5);
    v6->_timestamp = v7;
    v8 = objc_opt_class();
    v10 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("location"));
    if (!v10)
      goto LABEL_10;
    v14 = v10;
    if (objc_msgSend_length(v10, v11, v12, v13) != 48)
      goto LABEL_10;
    objc_msgSend_getBytes_length_(v14, v15, (uint64_t)v6->_anon_20, 48);
    v16 = objc_opt_class();
    v18 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("transform"));
    if (!v18)
      goto LABEL_10;
    v22 = v18;
    if (objc_msgSend_length(v18, v19, v20, v21) == 128
      && (objc_msgSend_getBytes_length_(v22, v23, (uint64_t)v6->_anon_50, 128),
          v24 = objc_opt_class(),
          (v26 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v25, v24, (uint64_t)CFSTR("covariance"))) != 0)
      && (v30 = v26, objc_msgSend_length(v26, v27, v28, v29) == 144))
    {
      objc_msgSend_getBytes_length_(v30, v31, (uint64_t)&v6->_covariance, 144);
      objc_msgSend_decodeFloatForKey_(a3, v32, (uint64_t)CFSTR("confidence"), v33);
      v6->_confidence = v34;
      if ((objc_msgSend_containsValueForKey_(a3, v35, (uint64_t)CFSTR("debugInfo"), v36) & 1) != 0)
      {
        v37 = objc_opt_class();
        v6->_debugInfo = (_CLVLLocalizationDebugInfo *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, (uint64_t)CFSTR("debugInfo"));
      }
      else
      {
        v6->_debugInfo = 0;
      }
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  const char *v18;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("timestamp"), v3, self->_timestamp);
  v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)self->_anon_20, 48);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, (uint64_t)CFSTR("location"));
  v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)self->_anon_50, 128);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, (uint64_t)CFSTR("transform"));
  v13 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v12, (uint64_t)&self->_covariance, 144);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, (uint64_t)CFSTR("covariance"));
  *(float *)&v15 = self->_confidence;
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("confidence"), v17, v15);
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->_debugInfo, (uint64_t)CFSTR("debugInfo"));
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithMemberIndent_endIndent_(self, a2, (uint64_t)CFSTR("\t"), (uint64_t)&stru_1E2993188);
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
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
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  int64x2_t v216;
  int64x2_t v217;
  int64x2_t v218;
  int64x2_t v219;
  int64x2_t v220;
  int64x2_t v221;
  int64x2_t v222;
  int64x2_t v223;
  __int128 v224;
  int64x2_t v225;
  int64x2_t v226;
  int64x2_t v227;
  int64x2_t v228;
  int64x2_t v229;
  int64x2_t v230;
  int64x2_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  int64x2_t v235;
  uint64_t v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  float v242;
  float v243;
  float v244;
  float v245;
  float v246;
  float v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  float v258;
  float v259;
  float v260;
  int64x2_t v261;
  int64x2_t v262;
  int64x2_t v263;
  int64x2_t v264;
  int64x2_t v265;
  int64x2_t v266;
  int64x2_t v267;
  int64x2_t v268;
  int64x2_t v269;
  int64x2_t v270;
  int64x2_t v271;
  int64x2_t v272;
  int64x2_t v273;
  int64x2_t v274;
  int64x2_t v275;
  int64x2_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;

  v7 = objc_msgSend_stringByAppendingString_(a3, a2, (uint64_t)CFSTR("\t"), (uint64_t)a4);
  v10 = objc_msgSend_stringByAppendingString_(a4, v8, (uint64_t)CFSTR("\t"), v9);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_timestamp(self, v12, v13, v14);
  v236 = v18;
  if (self)
  {
    objc_msgSend_location(self, v15, v16, v17);
    v234 = v280;
    objc_msgSend_location(self, v19, v20, v21);
    *((_QWORD *)&v224 + 1) = v279;
    objc_msgSend_location(self, v22, v23, v24);
    v233 = v278;
    objc_msgSend_location(self, v25, v26, v27);
    v232 = v277;
    objc_msgSend_transform(self, v28, v29, v30);
    v231 = v276;
    objc_msgSend_transform(self, v31, v32, v33);
    v230 = v275;
    objc_msgSend_transform(self, v34, v35, v36);
    v229 = v274;
    objc_msgSend_transform(self, v37, v38, v39);
    v228 = v273;
    objc_msgSend_transform(self, v40, v41, v42);
    v227 = v272;
    objc_msgSend_transform(self, v43, v44, v45);
    v226 = v271;
    objc_msgSend_transform(self, v46, v47, v48);
    v223 = v270;
    objc_msgSend_transform(self, v49, v50, v51);
    v225 = v269;
    objc_msgSend_transform(self, v52, v53, v54);
    v220 = v268;
    objc_msgSend_transform(self, v55, v56, v57);
    v221 = v267;
    objc_msgSend_transform(self, v58, v59, v60);
    v218 = v266;
    objc_msgSend_transform(self, v61, v62, v63);
    v222 = v265;
    objc_msgSend_transform(self, v64, v65, v66);
    v216 = v264;
    objc_msgSend_transform(self, v67, v68, v69);
    v219 = v263;
    objc_msgSend_transform(self, v70, v71, v72);
    v235 = v262;
    objc_msgSend_transform(self, v73, v74, v75);
    v217 = v261;
    objc_msgSend_covariance(self, v76, v77, v78);
    objc_msgSend_covariance(self, v79, v80, v81);
    objc_msgSend_covariance(self, v82, v83, v84);
    objc_msgSend_covariance(self, v85, v86, v87);
    objc_msgSend_covariance(self, v88, v89, v90);
    objc_msgSend_covariance(self, v91, v92, v93);
    objc_msgSend_covariance(self, v94, v95, v96);
    objc_msgSend_covariance(self, v97, v98, v99);
    objc_msgSend_covariance(self, v100, v101, v102);
    objc_msgSend_covariance(self, v103, v104, v105);
    objc_msgSend_covariance(self, v106, v107, v108);
    objc_msgSend_covariance(self, v109, v110, v111);
    objc_msgSend_covariance(self, v112, v113, v114);
    objc_msgSend_covariance(self, v115, v116, v117);
    objc_msgSend_covariance(self, v118, v119, v120);
    objc_msgSend_covariance(self, v121, v122, v123);
    objc_msgSend_covariance(self, v124, v125, v126);
    objc_msgSend_covariance(self, v127, v128, v129);
    objc_msgSend_covariance(self, v130, v131, v132);
    objc_msgSend_covariance(self, v133, v134, v135);
    objc_msgSend_covariance(self, v136, v137, v138);
    objc_msgSend_covariance(self, v139, v140, v141);
    objc_msgSend_covariance(self, v142, v143, v144);
    objc_msgSend_covariance(self, v145, v146, v147);
    objc_msgSend_covariance(self, v148, v149, v150);
    objc_msgSend_covariance(self, v151, v152, v153);
    objc_msgSend_covariance(self, v154, v155, v156);
    objc_msgSend_covariance(self, v157, v158, v159);
    objc_msgSend_covariance(self, v160, v161, v162);
    objc_msgSend_covariance(self, v163, v164, v165);
    objc_msgSend_covariance(self, v166, v167, v168);
    objc_msgSend_covariance(self, v169, v170, v171);
    objc_msgSend_covariance(self, v172, v173, v174);
    objc_msgSend_covariance(self, v175, v176, v177);
    objc_msgSend_covariance(self, v178, v179, v180);
    objc_msgSend_covariance(self, v181, v182, v183);
    v215 = v260;
    v205 = v237;
    v197 = v238;
    v208 = v239;
    v184 = v240;
    v207 = v241;
    v185 = v242;
    v200 = v243;
    v186 = v244;
    v199 = v245;
    v187 = v246;
    v198 = v247;
    v188 = v248;
    v212 = v249;
    v204 = v250;
    v213 = v251;
    v203 = v252;
    v214 = v253;
    v201 = v254;
    v209 = v255;
    v202 = v256;
    v210 = v257;
    v206 = v258;
    v211 = v259;
  }
  else
  {
    v227 = 0u;
    v229 = 0u;
    v231 = 0u;
    v233 = 0;
    v234 = 0;
    v232 = 0;
    v230 = 0u;
    v228 = 0u;
    v226 = 0u;
    v225 = 0u;
    v222 = 0u;
    v219 = 0u;
    v217 = 0u;
    v214 = 0.0;
    v213 = 0.0;
    v207 = 0.0;
    v208 = 0.0;
    v205 = 0.0;
    v212 = 0.0;
    v198 = 0.0;
    v199 = 0.0;
    v200 = 0.0;
    v211 = 0.0;
    v210 = 0.0;
    v209 = 0.0;
    v206 = 0.0;
    v215 = 0.0;
    v216 = 0u;
    v218 = 0u;
    v220 = 0u;
    v221 = 0u;
    v223 = 0u;
    v224 = 0u;
    v187 = 0.0;
    v188 = 0.0;
    v204 = 0.0;
    v203 = 0.0;
    v201 = 0.0;
    v202 = 0.0;
    v197 = 0.0;
    v184 = 0.0;
    v185 = 0.0;
    v186 = 0.0;
    v235 = 0u;
  }
  objc_msgSend_confidence(self, v15, v16, v17);
  v192 = (void *)objc_msgSend_debugInfo(self, v189, v190, v191);
  objc_msgSend_descriptionWithMemberIndent_endIndent_(v192, v193, v7, v10);
  return (id)objc_msgSend_stringWithFormat_(v11, v194, (uint64_t)CFSTR("<_CLVLLocalizationResult: %p> {\n%@.timestamp = %f,\n%@.location = {\n%@.coordinate = [%f, %f, %f],\n%@.horizontalAccuracy = %f\n%@},\n%@.transform = [%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f;\n%@%f, %f, %f, %f],\n%@.covariance = [%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f;\n%@%f, %f, %f, %f, %f, %f],\n%@.confidence = %f\n%@.debugInfo = %@\n%@}"),
               v195,
               self,
               a3,
               v236,
               a3,
               v7,
               v234,
               *((_QWORD *)&v224 + 1),
               v233,
               v7,
               v232,
               v10,
               a3,
               vzip1q_s64(v231, v230),
               vzip1q_s64(v229, v228),
               v7,
               vzip2q_s64(v227, v226),
               vzip2q_s64(v223, v225),
               v7,
               vzip1q_s64(v220, v221),
               vzip1q_s64(v218, v222),
               v7,
               vzip2q_s64(v216, v219),
               vzip2q_s64(v235, v217),
               a3,
               *(_QWORD *)&v215,
               *(_QWORD *)&v211,
               *(_QWORD *)&v206,
               *(_QWORD *)&v210,
               *(_QWORD *)&v202,
               *(_QWORD *)&v209,
               v7,
               *(_QWORD *)&v201,
               *(_QWORD *)&v214,
               *(_QWORD *)&v203,
               *(_QWORD *)&v213,
               *(_QWORD *)&v204,
               *(_QWORD *)&v212,
               v7,
               *(_QWORD *)&v188,
               *(_QWORD *)&v198,
               *(_QWORD *)&v187,
               *(_QWORD *)&v199,
               *(_QWORD *)&v186,
               *(_QWORD *)&v200,
               v7,
               *(_QWORD *)&v185,
               *(_QWORD *)&v207,
               *(_QWORD *)&v184,
               *(_QWORD *)&v208,
               *(_QWORD *)&v197,
               *(_QWORD *)&v205);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)location
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->_anon_20[16];
  *v2 = *(_OWORD *)self->_anon_20;
  v2[1] = v3;
  v4 = *(_OWORD *)&self->_anon_20[32];
  v2[2] = v4;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v4;
}

- (void)setLocation:(id)a3
{
  __int128 *v3;
  __int128 v4;
  __int128 v5;

  v4 = *v3;
  v5 = v3[2];
  *(_OWORD *)&self->_anon_20[16] = v3[1];
  *(_OWORD *)&self->_anon_20[32] = v5;
  *(_OWORD *)self->_anon_20 = v4;
}

- (__n128)transform
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 80) = v2;
  v3 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 16) = v4;
  result = *(__n128 *)(a1 + 112);
  v6 = *(_OWORD *)(a1 + 128);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setTransform:(__int128 *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v3 = *a3;
  v4 = a3[1];
  v5 = a3[3];
  *(_OWORD *)(a1 + 112) = a3[2];
  *(_OWORD *)(a1 + 128) = v5;
  *(_OWORD *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 96) = v4;
  result = (__n128)a3[4];
  v7 = a3[5];
  v8 = a3[7];
  *(_OWORD *)(a1 + 176) = a3[6];
  *(_OWORD *)(a1 + 192) = v8;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v7;
  return result;
}

- ($4ED12C4C7630B45462BF021B0F75306B)covariance
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[2].var0[1][2];
  *(_OWORD *)&retstr->var0[4][0] = *(_OWORD *)&self[2].var0[0][4];
  *(_OWORD *)&retstr->var0[4][4] = v3;
  *(_OWORD *)&retstr->var0[5][2] = *(_OWORD *)&self[2].var0[2][0];
  v4 = *(_OWORD *)&self[1].var0[4][4];
  *(_OWORD *)&retstr->var0[1][2] = *(_OWORD *)&self[1].var0[4][0];
  *(_OWORD *)&retstr->var0[2][0] = v4;
  v5 = *(_OWORD *)&self[2].var0[0][0];
  *(_OWORD *)&retstr->var0[2][4] = *(_OWORD *)&self[1].var0[5][2];
  *(_OWORD *)&retstr->var0[3][2] = v5;
  v6 = *(_OWORD *)&self[1].var0[3][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[1].var0[2][4];
  *(_OWORD *)&retstr->var0[0][4] = v6;
  return self;
}

- (void)setCovariance:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)&self->_covariance.v[0][0] = *(_OWORD *)&a3->var0[0][0];
  v3 = *(_OWORD *)&a3->var0[0][4];
  v4 = *(_OWORD *)&a3->var0[1][2];
  v5 = *(_OWORD *)&a3->var0[2][4];
  *(_OWORD *)&self->_covariance.v[2][0] = *(_OWORD *)&a3->var0[2][0];
  *(_OWORD *)&self->_covariance.v[2][4] = v5;
  *(_OWORD *)&self->_covariance.v[0][4] = v3;
  *(_OWORD *)&self->_covariance.v[1][2] = v4;
  v6 = *(_OWORD *)&a3->var0[3][2];
  v7 = *(_OWORD *)&a3->var0[4][0];
  v8 = *(_OWORD *)&a3->var0[5][2];
  *(_OWORD *)&self->_covariance.v[4][4] = *(_OWORD *)&a3->var0[4][4];
  *(_OWORD *)&self->_covariance.v[5][2] = v8;
  *(_OWORD *)&self->_covariance.v[3][2] = v6;
  *(_OWORD *)&self->_covariance.v[4][0] = v7;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (_CLVLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end

@implementation CHMutableNonTextCandidateStroke

- (void)setFallbackClassification:(int64_t)a3
{
  self->super._fallbackClassification = a3;
}

- (void)setSupportByStrokeIdentifier:(id)a3
{
  NSMutableDictionary *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *supportByStrokeIdentifier;
  NSMutableDictionary *v12;

  v4 = (NSMutableDictionary *)a3;
  if (self->super._supportByStrokeIdentifier != v4)
  {
    v12 = v4;
    v10 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v4, v5, v6, v7, v8, v9);
    supportByStrokeIdentifier = self->super._supportByStrokeIdentifier;
    self->super._supportByStrokeIdentifier = v10;

    v4 = v12;
  }

}

- (BOOL)adjustSupportByRemovingStrokeIdentifier:(id)a3
{
  return sub_1BE6A8A20((uint64_t)self, a3);
}

- (BOOL)adjustSupportByAddingStroke:(id)a3 consistingOfSubstrokes:(id)a4 strokeClassification:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSMutableDictionary *supportByStrokeIdentifier;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  float v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  float v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  double *v105;
  double v106;
  double v107;
  uint64_t i;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  int64_t substrokesCount;
  BOOL v118;
  uint64_t v119;
  void *v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  CGFloat v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  CGFloat v140;
  CGFloat v141;
  double v142;
  double v143;
  double MinX;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  double v149;
  double MaxX;
  BOOL v151;
  CGFloat v152;
  CGFloat v153;
  CGFloat v154;
  CGFloat v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double MaxY;
  double v161;
  double MinY;
  double v163;
  CGFloat v164;
  id v165;
  id v166;
  id v167;
  CGFloat v168;
  CGFloat v169;
  CGFloat v170;
  CGFloat v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  CGFloat v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  uint64_t v196;
  double v197;
  double v198;
  uint64_t j;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  int64_t v205;
  uint64_t v206;
  void *v207;
  CGFloat v208;
  CGFloat v209;
  CGFloat v210;
  CGFloat v211;
  CGFloat v212;
  CGFloat v213;
  CGFloat v214;
  CGFloat v215;
  CGFloat v216;
  CGFloat v217;
  CGFloat v218;
  CGFloat v219;
  CGFloat v220;
  CGFloat v221;
  CGFloat v222;
  CGFloat v223;
  double v224;
  double v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  double v231;
  double v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  double v243;
  double v244;
  double v245;
  double v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  double v252;
  double v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  double v259;
  double v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  double v271;
  double v272;
  double v273;
  double v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  double v280;
  double v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  double v287;
  double v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  id v313;
  int64_t v314;
  id v315;
  _BOOL4 v316;
  id v317;
  double v318;
  double v319;
  id v320;
  double v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  const __CFString *v326;
  const __CFString *v327;
  void *v328;
  void *v329;
  uint8_t buf[128];
  uint64_t v331;
  CGRect v332;
  CGRect v333;
  CGRect v334;
  CGRect v335;
  CGRect v336;
  CGRect v337;
  CGRect v338;
  CGRect v339;
  CGRect v340;
  CGRect v341;
  CGRect v342;
  CGRect v343;
  CGRect v344;
  CGRect v345;
  CGRect v346;
  CGRect v347;
  CGRect v348;
  CGRect v349;
  CGRect v350;

  v331 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v317 = v9;
  supportByStrokeIdentifier = self->super._supportByStrokeIdentifier;
  objc_msgSend_encodedStrokeIdentifier(v8, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(supportByStrokeIdentifier, v18, (uint64_t)v17, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v28 = self->super._supportByStrokeIdentifier;
    objc_msgSend_encodedStrokeIdentifier(v8, v23, v24, v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v28, v30, (uint64_t)v29, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v34, v35, v36, v37, v38, v39);
    v318 = v40;

    v316 = a5 == 5;
    if (a5 == 5 && (v41 = v318, v318 > 0.0))
    {
      v316 = 1;
    }
    else if ((v318 >= 0.0
            || (objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v23, a5, v25, v26, v27, v318) & 1) == 0)
           && (v318 <= 0.0
            || self->super._classificationAsNonText != 6
            || (objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v23, a5, v25, v26, v27, v318) & 1) == 0))
    {
      v41 = v318;
      if (v318 == 0.0
        || self->super._classificationAsNonText != 7
        || (objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v23, a5, v25, v26, v27, v318) & 1) == 0)
      {
LABEL_12:
        v43 = 0;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v316 = a5 == 5;
    v41 = 0.0;
    v318 = 0.0;
  }
  switch(self->super._classificationAsNonText)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v42 = (id)qword_1EF568E30;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v42, OS_LOG_TYPE_ERROR, "Trying to get support for unsupported non-text candidate class.", buf, 2u);
      }

      goto LABEL_12;
    case 6:
      v75 = v8;
      v315 = v317;
      x = self->super._enlargedBounds.origin.x;
      y = self->super._enlargedBounds.origin.y;
      width = self->super._enlargedBounds.size.width;
      height = self->super._enlargedBounds.size.height;
      objc_msgSend_bounds(v75, v80, v81, v82, v83, v84);
      v346.origin.x = v85;
      v346.origin.y = v86;
      v346.size.width = v87;
      v346.size.height = v88;
      v332.origin.x = x;
      v332.origin.y = y;
      v332.size.width = width;
      v332.size.height = height;
      if (!CGRectIntersectsRect(v332, v346))
      {
        v103 = 0;
        v106 = 0.0;
        v107 = 0.0;
        goto LABEL_84;
      }
      v324 = 0u;
      v325 = 0u;
      v322 = 0u;
      v323 = 0u;
      v94 = v315;
      v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v322, (uint64_t)buf, 16, v96);
      v313 = v75;
      v314 = a5;
      v103 = 0;
      if (v102)
      {
        v104 = *(_QWORD *)v323;
        v105 = (double *)MEMORY[0x1E0C9D538];
        v106 = 0.0;
        v107 = 0.0;
        while (1)
        {
          for (i = 0; i != v102; ++i)
          {
            if (*(_QWORD *)v323 != v104)
              objc_enumerationMutation(v94);
            v120 = *(void **)(*((_QWORD *)&v322 + 1) + 8 * i);
            v121 = self->super._enlargedBounds.origin.x;
            v122 = self->super._enlargedBounds.origin.y;
            v123 = self->super._enlargedBounds.size.width;
            v124 = self->super._enlargedBounds.size.height;
            objc_msgSend_bounds(v120, v97, v98, v99, v100, v101);
            v347.origin.x = v125;
            v347.origin.y = v126;
            v347.size.width = v127;
            v347.size.height = v128;
            v333.origin.x = v121;
            v333.origin.y = v122;
            v333.size.width = v123;
            v333.size.height = v124;
            if (CGRectIntersectsRect(v333, v347))
            {
              v129 = (void *)objc_opt_class();
              v135 = objc_msgSend_convexHull(v120, v130, v131, v132, v133, v134);
              objc_msgSend_boundingBoxOfPoints_rotatedAroundPoint_byAngle_(v129, v136, v135, v137, v138, v139, *v105, v105[1], -self->super._lineOrientationAngle);
              v140 = v334.origin.x;
              v141 = v334.origin.y;
              v142 = v334.size.width;
              v143 = v334.size.height;
              MinX = CGRectGetMinX(v334);
              v118 = MinX <= CGRectGetMinX(self->super._rotatedBounds);
              v145 = v140;
              v146 = v141;
              v147 = v142;
              v148 = v143;
              if (v118)
              {
                v145 = self->super._rotatedBounds.origin.x;
                v146 = self->super._rotatedBounds.origin.y;
                v147 = self->super._rotatedBounds.size.width;
                v148 = self->super._rotatedBounds.size.height;
              }
              v149 = CGRectGetMinX(*(CGRect *)&v145);
              v335.origin.x = v140;
              v335.origin.y = v141;
              v335.size.width = v142;
              v335.size.height = v143;
              MaxX = CGRectGetMaxX(v335);
              v151 = MaxX < CGRectGetMaxX(self->super._rotatedBounds);
              v152 = v140;
              v153 = v141;
              v154 = v142;
              v155 = v143;
              if (!v151)
              {
                v152 = self->super._rotatedBounds.origin.x;
                v153 = self->super._rotatedBounds.origin.y;
                v154 = self->super._rotatedBounds.size.width;
                v155 = self->super._rotatedBounds.size.height;
              }
              v319 = v107;
              v321 = v106;
              v156 = CGRectGetMaxX(*(CGRect *)&v152) - v149 + 1.0;
              if (v156 >= 0.0)
                v157 = v156;
              else
                v157 = 0.0;
              v336.origin.x = v140;
              v336.origin.y = v141;
              v336.size.width = v142;
              v336.size.height = v143;
              v158 = CGRectGetMaxX(v336);
              v337.origin.x = v140;
              v337.origin.y = v141;
              v337.size.width = v142;
              v337.size.height = v143;
              v159 = CGRectGetMinX(v337);
              v338.origin.x = v140;
              v338.origin.y = v141;
              v338.size.width = v142;
              v338.size.height = v143;
              MaxY = CGRectGetMaxY(v338);
              if (MaxY < CGRectGetMinY(self->super._rotatedBounds))
              {
                v339.origin.x = v140;
                v339.origin.y = v141;
                v339.size.width = v142;
                v339.size.height = v143;
                v161 = CGRectGetMaxY(v339);
                MinY = CGRectGetMinY(self->super._rotatedBounds);
                goto LABEL_34;
              }
              v340.origin.x = v140;
              v340.origin.y = v141;
              v340.size.width = v142;
              v340.size.height = v143;
              v163 = CGRectGetMinY(v340);
              v164 = CGRectGetMaxY(self->super._rotatedBounds);
              v109 = 0.0;
              if (v163 > v164)
              {
                v341.origin.x = v140;
                v341.origin.y = v141;
                v341.size.width = v142;
                v341.size.height = v143;
                v161 = CGRectGetMinY(v341);
                MinY = CGRectGetMaxY(self->super._rotatedBounds);
LABEL_34:
                v109 = vabdd_f64(v161, MinY);
              }
              ++v103;
              v110 = v157 / (v158 - v159 + 1.0);
              v111 = v109 / 63.0 / sqrt(v109 / 63.0 * (v109 / 63.0) + 1.0);
              v112 = sqrt(v143 * v143 + v142 * v142);
              if (v112 < 21.0)
                v112 = 21.0;
              v113 = self->super._boundsDiagonal / v112 * 0.1;
              v114 = sqrt(v113 * v113 + 1.0);
              v115 = (1.0 - v111) * (1.0 - v111);
              v116 = v113 / v114 * (v113 / v114);
              v106 = v321 + v116;
              substrokesCount = self->super._substrokesCount;
              v118 = substrokesCount < 2;
              v119 = substrokesCount - 2;
              if (v118)
                v119 = 0;
              v107 = v319 + pow(1.0 - self->super._lineError, (double)v119 * 0.4 + 1.0) * (v110 * v115 * v116);
              continue;
            }
          }
          v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v322, (uint64_t)buf, 16, v101);
          if (!v102)
            goto LABEL_83;
        }
      }
      v106 = 0.0;
      v107 = 0.0;
LABEL_83:

      v10 = v8;
      a5 = v314;
      v75 = v313;
LABEL_84:
      v326 = CFSTR("support");
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v89, v90, v91, v92, v93, v107);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      v327 = CFSTR("sizeRatio");
      v328 = v300;
      if (v103)
        v106 = v106 / (double)v103;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v295, v296, v297, v298, v299, v106);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v329 = v301;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v302, (uint64_t)&v328, (uint64_t)&v326, 2, v303);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 7:
      v165 = v8;
      v166 = v8;
      v167 = v317;
      v168 = self->super._bounds.origin.x;
      v169 = self->super._bounds.origin.y;
      v170 = self->super._bounds.size.width;
      v171 = self->super._bounds.size.height;
      objc_msgSend_bounds(v166, v172, v173, v174, v175, v176);
      v348.origin.x = v177;
      v348.origin.y = v178;
      v348.size.width = v179;
      v348.size.height = v180;
      v342.origin.x = v168;
      v342.origin.y = v169;
      v342.size.width = v170;
      v342.size.height = v171;
      if (CGRectIntersectsRect(v342, v348))
      {
        v324 = 0u;
        v325 = 0u;
        v322 = 0u;
        v323 = 0u;
        v186 = v167;
        v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v187, (uint64_t)&v322, (uint64_t)buf, 16, v188);
        v320 = v167;
        v195 = 0;
        if (v194)
        {
          v196 = *(_QWORD *)v323;
          v197 = 0.0;
          v198 = 0.0;
          do
          {
            for (j = 0; j != v194; ++j)
            {
              if (*(_QWORD *)v323 != v196)
                objc_enumerationMutation(v186);
              v207 = *(void **)(*((_QWORD *)&v322 + 1) + 8 * j);
              v208 = self->super._bounds.origin.x;
              v209 = self->super._bounds.origin.y;
              v210 = self->super._bounds.size.width;
              v211 = self->super._bounds.size.height;
              objc_msgSend_bounds(v207, v189, v190, v191, v192, v193);
              v349.origin.x = v212;
              v349.origin.y = v213;
              v349.size.width = v214;
              v349.size.height = v215;
              v343.origin.x = v208;
              v343.origin.y = v209;
              v343.size.width = v210;
              v343.size.height = v211;
              if (CGRectIntersectsRect(v343, v349))
              {
                v216 = self->super._bounds.origin.x;
                v217 = self->super._bounds.origin.y;
                v218 = self->super._bounds.size.width;
                v219 = self->super._bounds.size.height;
                objc_msgSend_bounds(v207, v189, v190, v191, v192, v193);
                v350.origin.x = v220;
                v350.origin.y = v221;
                v350.size.width = v222;
                v350.size.height = v223;
                v344.origin.x = v216;
                v344.origin.y = v217;
                v344.size.width = v218;
                v344.size.height = v219;
                v345 = CGRectIntersection(v344, v350);
                v224 = v345.size.width;
                v225 = v345.size.height;
                objc_msgSend_bounds(v207, v226, v227, v228, v229, v230, v345.origin.x, v345.origin.y);
                v232 = v231;
                objc_msgSend_bounds(v207, v233, v234, v235, v236, v237);
                if (v232 * v243 <= 0.0)
                  v244 = 1.0;
                else
                  v244 = v224 * v225 / (v232 * v243);
                objc_msgSend_bounds(v207, v238, v239, v240, v241, v242);
                v246 = v245;
                objc_msgSend_bounds(v207, v247, v248, v249, v250, v251);
                v253 = v252;
                objc_msgSend_bounds(v207, v254, v255, v256, v257, v258);
                v260 = v259;
                objc_msgSend_bounds(v207, v261, v262, v263, v264, v265);
                v272 = 21.0;
                if (sqrt(v260 * v271 + v246 * v253) >= 21.0)
                {
                  objc_msgSend_bounds(v207, v266, v267, v268, v269, v270);
                  v274 = v273;
                  objc_msgSend_bounds(v207, v275, v276, v277, v278, v279);
                  v281 = v280;
                  objc_msgSend_bounds(v207, v282, v283, v284, v285, v286);
                  v288 = v287;
                  objc_msgSend_bounds(v207, v289, v290, v291, v292, v293);
                  v272 = sqrt(v288 * v200 + v274 * v281);
                }
                ++v195;
                v201 = self->super._boundsDiagonal / v272 * 0.1;
                v202 = sqrt(v201 * v201 + 1.0);
                v203 = v201 / v202 * (v201 / v202);
                v197 = v197 + v203;
                v204 = fmax(self->super._containerScore * 0.015625, 0.1);
                v205 = self->super._substrokesCount;
                v118 = v205 < 2;
                v206 = v205 - 2;
                if (v118)
                  v206 = 0;
                v198 = v198 + v203 * (v244 * pow(v204, (double)v206 * 0.4 + 1.0));
              }
            }
            v194 = objc_msgSend_countByEnumeratingWithState_objects_count_(v186, v189, (uint64_t)&v322, (uint64_t)buf, 16, v193);
          }
          while (v194);
        }
        else
        {
          v197 = 0.0;
          v198 = 0.0;
        }

        v167 = v320;
      }
      else
      {
        v195 = 0;
        v197 = 0.0;
        v198 = 0.0;
      }
      v326 = CFSTR("support");
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v181, v182, v183, v184, v185, v198);
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      v327 = CFSTR("sizeRatio");
      v328 = v309;
      if (v195)
        v197 = v197 / (double)v195;
      v10 = v165;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v304, v305, v306, v307, v308, v197);
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      v329 = v310;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v311, (uint64_t)&v328, (uint64_t)&v326, 2, v312);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      goto LABEL_12;
  }
LABEL_13:
  objc_msgSend_objectForKey_(v43, v23, (uint64_t)CFSTR("support"), v25, v26, v27, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v44, v45, v46, v47, v48, v49);
  v51 = v50;

  objc_msgSend_objectForKey_(v43, v52, (uint64_t)CFSTR("sizeRatio"), v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v56, v57, v58, v59, v60, v61);
  v63 = v62;

  v68 = v51;
  if (v51 != 0.0)
  {
    if (objc_msgSend_isStrokeClassificationText_(CHStrokeUtilities, v64, a5, v65, v66, v67))
    {
      objc_msgSend_encodedStrokeIdentifier(v10, v69, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE6A8930((uint64_t)self, v74, v68, v63);
    }
    else if (v316
           || objc_msgSend_isStrokeClassificationMath_(CHStrokeUtilities, v69, a5, v71, v72, v73)&& self->super._classificationAsNonText == 6)
    {
      objc_msgSend_encodedStrokeIdentifier(v10, v69, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -v68;
      sub_1BE6A8930((uint64_t)self, v74, v68, v63);
    }
    else
    {
      objc_msgSend_encodedStrokeIdentifier(v10, v69, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0.0;
      sub_1BE6A8A20((uint64_t)self, v74);
    }

  }
  return v68 != v318;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t classificationAsNonText;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifier(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_support(self, v12, v13, v14, v15, v16);
  v23 = v22;
  if (self)
    classificationAsNonText = self->super._classificationAsNonText;
  else
    classificationAsNonText = 0;
  v25 = objc_msgSend_fallbackClassification(self, v17, v18, v19, v20, v21);
  objc_msgSend_stringWithFormat_(v3, v26, (uint64_t)CFSTR("<%@: %p strokeIdentifier=(%@) support=%.3f class=%ld fallbackClass=%ld>"), v27, v28, v29, v5, self, v11, v23, classificationAsNonText, v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end

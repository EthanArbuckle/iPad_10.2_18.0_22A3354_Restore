@implementation HDDemoDataVitalsSampleGenerator

- (HDDemoDataVitalsSampleGenerator)init
{
  HDDemoDataVitalsSampleGenerator *v2;
  HDDemoDataVitalsSampleGenerator *v3;
  NSArray *diurnalBPVariationTable;
  NSArray *diurnalTempVariationTable;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    diurnalBPVariationTable = v2->_diurnalBPVariationTable;
    v2->_diurnalBPVariationTable = 0;

    diurnalTempVariationTable = v3->_diurnalTempVariationTable;
    v3->_diurnalTempVariationTable = 0;

    v3->_nextHeartRateSampleTime = 0.0;
    v3->_nextRespirationRateSampleTime = 0.0;
    v3->_lastRespirationRateGenerationTime = 0.0;
    v3->_nextBloodPressureSampleTime = 0.0;
    v3->_nextBodyTempSampleTime = 0.0;
    v3->_nextOxygenSaturationSampleTime = 0.0;
    v3->_nextPeripheralPerfusionIndexSampleTime = 0.0;
    v3->_lastPeripheralPerfusionIndexValue = 0.0;
  }
  return v3;
}

- (HDDemoDataVitalsSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataVitalsSampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperNextHeartRateSampleTimeKey"));
    v5->_nextHeartRateSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperNextRespirationRateSampleTimeKey"));
    v5->_nextRespirationRateSampleTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperLastRespirationRateGenerationTimeKey"));
    v5->_lastRespirationRateGenerationTime = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperNextBloodPressureSampleTimeKey"));
    v5->_nextBloodPressureSampleTime = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperNextBodyTempSampleTimeKey"));
    v5->_nextBodyTempSampleTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperNextOxygenSaturationSampleTimeKey"));
    v5->_nextOxygenSaturationSampleTime = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperNextPeripheralPerfusionIndexSampleTimeKey"));
    v5->_nextPeripheralPerfusionIndexSampleTime = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataVitalsSampleHelperLastPeripheralPerfusionIndexValueKey"));
    v5->_lastPeripheralPerfusionIndexValue = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperNextHeartRateSampleTimeKey"), self->_nextHeartRateSampleTime, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperNextRespirationRateSampleTimeKey"), self->_nextRespirationRateSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperLastRespirationRateGenerationTimeKey"), self->_lastRespirationRateGenerationTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperNextBloodPressureSampleTimeKey"), self->_nextBloodPressureSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperNextBodyTempSampleTimeKey"), self->_nextBodyTempSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperNextOxygenSaturationSampleTimeKey"), self->_nextOxygenSaturationSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperNextPeripheralPerfusionIndexSampleTimeKey"), self->_nextPeripheralPerfusionIndexSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataVitalsSampleHelperLastPeripheralPerfusionIndexValueKey"), self->_lastPeripheralPerfusionIndexValue);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  NSArray *diurnalBPVariationTable;
  NSArray *diurnalTempVariationTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v6, sel_setupWithDemoDataGenerator_, a3);
  diurnalBPVariationTable = self->_diurnalBPVariationTable;
  self->_diurnalBPVariationTable = (NSArray *)&unk_1E6DFA700;

  diurnalTempVariationTable = self->_diurnalTempVariationTable;
  self->_diurnalTempVariationTable = (NSArray *)&unk_1E6DFA718;

}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  HDDemoDataVitalsSampleGenerator *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  double v34;
  char v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  int v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  int v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  char v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  int v126;
  double lastRespirationRateGenerationTime;
  uint64_t v128;
  uint64_t v129;
  double v130;
  id v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  double v144;
  uint64_t v145;
  double v146;
  double v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  double v152;
  int v153;
  void *v154;
  void *v155;
  void *v156;
  double v157;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  HDDemoDataRespirationRate *v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  void *v179;
  void *v180;
  double v181;
  double v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t i;
  void *v187;
  void *v188;
  uint64_t v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  void *v198;
  double v199;
  double v200;
  void *v201;
  void *v202;
  double v203;
  double v204;
  void *v205;
  void *v206;
  id v207;
  void *v208;
  void *v209;
  int v210;
  void *v211;
  void *v212;
  double v213;
  double v214;
  double v215;
  void *v216;
  uint64_t v217;
  void *v218;
  double v219;
  void *v220;
  void *v221;
  double v222;
  double v223;
  void *v224;
  void *v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  void *v231;
  void *v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  double v237;
  double v238;
  void *v239;
  void *v240;
  double v241;
  double v242;
  void *v243;
  void *v244;
  int v245;
  double v246;
  double v247;
  void *v248;
  void *v249;
  int v250;
  double v251;
  double v252;
  double v253;
  BOOL v254;
  double v255;
  void *v256;
  uint64_t v257;
  double v258;
  double v259;
  double v260;
  void *v261;
  void *v262;
  void *v263;
  uint64_t v264;
  void *v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  double v271;
  double v272;
  double v273;
  double v274;
  void *v275;
  void *v276;
  double v277;
  double v278;
  void *v279;
  void *v280;
  uint64_t v281;
  void *v282;
  void *v283;
  id v284;
  void *v285;
  void *v286;
  id v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  char v294;
  double v295;
  double v296;
  double v297;
  void *v298;
  void *v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  void *v305;
  uint64_t v306;
  void *v307;
  void *v308;
  void *v309;
  char v310;
  double v311;
  void *v312;
  void *v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  uint64_t v335;
  void *v336;
  id v337;
  id v338;
  void *v339;
  void *v340;
  char *v341;
  char v342;
  id v343;
  HDDemoDataVitalsSampleGenerator *v344;
  id obj;
  char objc;
  id obja;
  id objb;
  id v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  objc_super v354;
  objc_super v355;
  uint64_t v356;
  void *v357;
  _BYTE v358[128];
  uint64_t v359;
  _QWORD v360[3];

  v360[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v354.receiver = self;
  v354.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  v349 = a7;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v354, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, a5, a5);
  if (qword_1EF199E68 != -1)
    dispatch_once(&qword_1EF199E68, &__block_literal_global_247);
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "generatorState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v344 = self;
  if ((objc_msgSend(v14, "isDoingHIIT") & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "generatorState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isDoingYoga") & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "generatorState");
      v19 = self;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isDoingElliptical") & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "generatorState");
        obj = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(obj, "isWalking") & 1) != 0)
        {
          v15 = 1;
        }
        else
        {
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
          v341 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v341, "generatorState");
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v339, "isHiking") & 1) != 0)
          {
            v15 = 1;
          }
          else
          {
            -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v336, "generatorState");
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v334, "isRunning") & 1) != 0)
            {
              v15 = 1;
            }
            else
            {
              -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
              v332 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v332, "generatorState");
              v330 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v330, "isSwimming") & 1) != 0)
              {
                v15 = 1;
              }
              else
              {
                -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
                v329 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v329, "generatorState");
                v328 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v328, "isCoreTraining") & 1) != 0)
                {
                  v15 = 1;
                }
                else
                {
                  -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
                  v327 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v327, "generatorState");
                  v326 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v326, "isDancing") & 1) != 0)
                  {
                    v15 = 1;
                  }
                  else
                  {
                    -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
                    v325 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v325, "generatorState");
                    v324 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v324, "isFunctionalStrengthTraining") & 1) != 0)
                    {
                      v15 = 1;
                    }
                    else
                    {
                      -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
                      v323 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v323, "generatorState");
                      v322 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v322, "isCoolingDown") & 1) != 0)
                      {
                        v15 = 1;
                      }
                      else
                      {
                        -[HDDemoDataBaseSampleGenerator demoDataGenerator](v19, "demoDataGenerator");
                        v321 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v321, "generatorState");
                        v320 = (void *)objc_claimAutoreleasedReturnValue();
                        v15 = objc_msgSend(v320, "isUnderwaterDiving");

                      }
                    }

                  }
                }

              }
            }

          }
        }

      }
      self = v344;
    }

  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activitySampleGenerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "_isDemoPersonInWorkoutRecovery:atTime:", v11, a5);

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mindfulnessSampleGenerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "didGenerateMindfulnessMinute");

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sleepSampleGenerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isDemoPersonSleeping:atTime:", v11, a5);

  v343 = v12;
  if ((v30 & 1) == 0 && (v27 & 1) == 0 && (v24 & 1) == 0 && (v15 & 1) == 0)
  {
    v31 = v11;
    v32 = v31;
    if (self && self->_nextHeartRateSampleTime <= a5)
    {
      objc_msgSend(v31, "heartRateSampleFrequency");
      v38 = v37;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "statisticsSampleGenerator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "heartRateSampleFrequencyStdDev");
      objc_msgSend(v40, "computeNoiseFromTime:stdDev:", a5, v41);
      self->_nextHeartRateSampleTime = v38 + v42 + self->_nextHeartRateSampleTime;

      v43 = v32;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "statisticsSampleGenerator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "heartRateSampleNoiseStdDev");
      objc_msgSend(v45, "computeNoiseFromTime:stdDev:", a5, v46);
      v48 = v47;

      v49 = (double)-[HDDemoDataVitalsSampleGenerator _computeMaxHRForDemoPerson:atTime:](self, v43, a5);
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "generatorState");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isExercising");

      if (v52)
      {
        v53 = (double)-[HDDemoDataVitalsSampleGenerator _computeMaxHRForDemoPerson:atTime:](self, v43, a5);
        objc_msgSend(v43, "exerciseIntensityPercentage");
        v55 = v54;
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "statisticsSampleGenerator");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "computeNoiseFromTime:stdDev:", a5, 0.05);
        v59 = v48 + v58 + v53 * v55;

        v60 = 6;
      }
      else
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "activitySampleGenerator");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "heartRateSampleFrequency");
        v64 = objc_msgSend(v62, "_isDemoPersonWalking:atTime:samplePeriod:", v43, a5, v63);

        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "activitySampleGenerator");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        if (v64)
        {
          objc_msgSend(v66, "_computeFlightsClimbedForDemoPerson:atTime:", v43, a5);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v69 = (double)objc_msgSend(v43, "restingHeartRate");
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "statisticsSampleGenerator");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "randomDoubleFromGenerator");
          v73 = v72;

          v60 = 0;
          if (v68)
            v74 = 1.4;
          else
            v74 = 1.3;
          v59 = v48 + v69 * (v74 + v73 * 0.2);
        }
        else
        {
          v75 = objc_msgSend(v66, "_isDemoPersonCoolingDown:atTime:", v43, a5);

          if (v75)
          {
            -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "activitySampleGenerator");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "_computePercentCooledForDemoPerson:atTime:", v43, a5);
            v79 = v78;

            v80 = (double)objc_msgSend(v43, "restingHeartRate");
            v81 = v49 - (double)objc_msgSend(v43, "restingHeartRate");
            objc_msgSend(v43, "exerciseIntensityPercentage");
            v59 = v80 + v82 * v81 * (1.0 - v79);
            v60 = 2;
          }
          else
          {
            v59 = v48 + (double)objc_msgSend(v43, "restingHeartRate");
            -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "statisticsSampleGenerator");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "pseudoRandomDoubleFromTime:", a5);
            v86 = v85;

            if (v86 >= 20.0)
              v60 = 0;
            else
              v60 = 3;
          }
        }
      }
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "foodSampleGenerator");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "_isDemoPersonConsumingCaffeine:atTime:", v43, a5);

      if (v89)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "statisticsSampleGenerator");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "computeNoiseFromTime:stdDev:", a5, 3.0);
        v59 = v59 + fabs(v92) + 4.0;

      }
      if (v59 <= v49)
        v93 = v59;
      else
        v93 = v49;
      if (v93 <= 55.0)
        v93 = (double)(arc4random_uniform(0xFu) + 45);
      v94 = floor(v93);

      if (v94 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", _MergedGlobals_15_0, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)MEMORY[0x1E0CB6A40];
        v97 = qword_1EF199E28;
        v359 = *MEMORY[0x1E0CB7298];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v60);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v360[0] = v98;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v360, &v359, 1);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v97, v95, v12, v12, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v349, "addObjectFromWatch:", v100);
      }
      v101 = v43;
      goto LABEL_67;
    }

  }
  v33 = v11;
  if (!self)
  {
    v34 = 0.0;
    v35 = 1;
    v36 = 0.0;
    goto LABEL_70;
  }
LABEL_67:
  if (self->_nextBloodPressureSampleTime > a5)
  {

    v102 = v11;
    goto LABEL_75;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "statisticsSampleGenerator");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bloodPressureSampleFrequency");
  v106 = v105;
  objc_msgSend(v11, "genericSampleTimeNoiseStdDev");
  objc_msgSend(v104, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", a5, v106, v107);
  self->_nextBloodPressureSampleTime = v108 + self->_nextBloodPressureSampleTime;

  v109 = (double)objc_msgSend(v11, "restingSystolicBloodPressure");
  objc_msgSend(v11, "restingSystolicBloodPressureSampleNoiseStdDev");
  v36 = (double)-[HDDemoDataVitalsSampleGenerator _computeBloodPressureForDemoPerson:atTime:baseBloodPressure:stdDev:]((id *)&self->super.super.isa, v11, a5, v109, v110);
  v111 = (double)objc_msgSend(v11, "restingDiastolicBloodPressure");
  objc_msgSend(v11, "restingDiastolicBloodPressureSampleNoiseStdDev");
  v35 = 0;
  v34 = (double)-[HDDemoDataVitalsSampleGenerator _computeBloodPressureForDemoPerson:atTime:baseBloodPressure:stdDev:]((id *)&self->super.super.isa, v11, a5, v111, v112);
LABEL_70:

  if (v36 == -2147483650.0 || v34 == -2147483650.0)
  {
    v122 = v11;
    if ((v35 & 1) != 0)
      goto LABEL_73;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1EF199E10, v36);
    objc = v35;
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199E38, v113, v12, v12);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "addObjectFromPhone:", v114);
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1EF199E10, v34);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199E40, v115, v12, v12);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "addObjectFromPhone:", v116);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v114, v116, 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6518], "correlationWithType:startDate:endDate:objects:", qword_1EF199E48, v12, v12, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    self = v344;
    objc_msgSend(v349, "addObjectFromPhone:", v118);

    v119 = v11;
    if ((objc & 1) != 0)
    {
LABEL_73:
      v120 = 0;
      v121 = 1;
      goto LABEL_105;
    }
  }
LABEL_75:
  v123 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_nextRespirationRateSampleTime <= a5)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "sleepSampleGenerator");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v125, "isDemoPersonSleeping:atTime:", v11, a5);

    if (!v126
      || (lastRespirationRateGenerationTime = self->_lastRespirationRateGenerationTime,
          lastRespirationRateGenerationTime == 0.0)
      || (v128 = (uint64_t)(lastRespirationRateGenerationTime * 86400.0 / 60.0),
          v129 = (uint64_t)(a5 * 86400.0 / 60.0),
          v128 >= v129))
    {
LABEL_100:
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "sleepSampleGenerator");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v180, "isDemoPersonSleeping:atTime:", v11, a5))
        objc_msgSend(v11, "restingRespirationRateSampleFrequencyDuringSleep");
      else
        objc_msgSend(v11, "restingRespirationRateSampleFrequency");
      v182 = v181;

      self->_nextRespirationRateSampleTime = v182 + self->_nextRespirationRateSampleTime;
      self->_lastRespirationRateGenerationTime = a5;
      v120 = (void *)objc_msgSend(v123, "copy");
      goto LABEL_104;
    }
    v130 = 0.5;
    while (1)
    {
      v131 = v11;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "statisticsSampleGenerator");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "restingRespirationRateSampleNoiseStdDev");
      objc_msgSend(v133, "computeNoiseFromTime:stdDev:", (double)v128 * 60.0 * 0.0000115740741, v134);
      v136 = v135;

      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "sleepSampleGenerator");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend(v138, "isDemoPersonSleeping:atTime:", v131, (double)v128 * 60.0 * 0.0000115740741);

      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v140;
      if (v139)
      {
        objc_msgSend(v140, "statisticsSampleGenerator");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "restingRespirationRateSampleNoiseStdDev");
        objc_msgSend(v142, "computeNoiseFromTime:stdDev:", (double)v128 * 60.0 * 0.0000115740741, vabdd_f64(v143, (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * (v143 + v143) + 0.0));
        v136 = v144;

        v145 = objc_msgSend(v131, "restingRespirationRate");
        v146 = (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * 2.0 + -1.0 + (double)v145;
        v147 = 1.15;
      }
      else
      {
        objc_msgSend(v140, "generatorState");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = objc_msgSend(v148, "isExercising");

        if (v149)
        {
          v146 = (double)objc_msgSend(v131, "restingRespirationRate");
          v147 = 1.5;
        }
        else
        {
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "activitySampleGenerator");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "restingRespirationRateSampleFrequency");
          v153 = objc_msgSend(v151, "_isDemoPersonWalking:atTime:samplePeriod:", v131, (double)v128 * 60.0 * 0.0000115740741, v152);

          -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "activitySampleGenerator");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = v155;
          v157 = (double)v128 * 60.0 * 0.0000115740741;
          if (!v153)
          {
            v159 = objc_msgSend(v155, "_isDemoPersonCoolingDown:atTime:", v131, v157);

            if (v159)
            {
              -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "activitySampleGenerator");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "_computePercentCooledForDemoPerson:atTime:", v131, (double)v128 * 60.0 * 0.0000115740741);
              v163 = v162;

              v130 = 0.5;
              v164 = (1.0 - v163) * ((double)objc_msgSend(v131, "restingRespirationRate") * 0.5) * 0.5;
              v165 = v164 + (double)objc_msgSend(v131, "restingRespirationRate");
            }
            else
            {
              v165 = (double)objc_msgSend(v131, "restingRespirationRate");
            }
            v166 = v136 + v165;
            goto LABEL_94;
          }
          objc_msgSend(v155, "_computeFlightsClimbedForDemoPerson:atTime:", v131, v157);
          v158 = (void *)objc_claimAutoreleasedReturnValue();

          v146 = (double)objc_msgSend(v131, "restingRespirationRate");
          if (v158)
            v147 = 1.3;
          else
            v147 = 1.2;
        }
      }
      v166 = v136 + v146 * v147;
LABEL_94:

      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "sleepSampleGenerator");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = objc_msgSend(v168, "isDemoPersonSleeping:atTime:", v131, (double)v128 * 60.0 * 0.0000115740741);

      if (v169)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "generatorState");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "firstSampleDate");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "dateByAddingTimeInterval:", (double)v128 * 60.0 * 0.0000115740741 * 86400.0);
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        v174 = [HDDemoDataRespirationRate alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(v166 + v166) * v130);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = v173;
        v177 = v175;
        if (v174)
        {
          v355.receiver = v174;
          v355.super_class = (Class)HDDemoDataRespirationRate;
          v178 = -[HDDemoDataBaseSampleGenerator init](&v355, sel_init);
          v174 = (HDDemoDataRespirationRate *)v178;
          if (v178)
          {
            objc_storeStrong((id *)v178 + 1, v173);
            objc_storeStrong((id *)&v174->_rate, v175);
          }
        }

        objc_msgSend(v123, "addObject:", v174);
        self = v344;
      }
      v128 += 10;
      if (v128 >= v129)
        goto LABEL_100;
    }
  }
  v120 = 0;
LABEL_104:

  v121 = 0;
LABEL_105:

  v340 = v120;
  v342 = v121;
  if (objc_msgSend(v120, "count"))
  {
    v337 = v11;
    v352 = 0u;
    v353 = 0u;
    v350 = 0u;
    v351 = 0u;
    obja = v120;
    v183 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v350, v358, 16);
    if (v183)
    {
      v184 = v183;
      v185 = *(_QWORD *)v351;
      do
      {
        for (i = 0; i != v184; ++i)
        {
          if (*(_QWORD *)v351 != v185)
            objc_enumerationMutation(obja);
          v187 = *(void **)(*((_QWORD *)&v350 + 1) + 8 * i);
          v188 = (void *)MEMORY[0x1E0CB6A28];
          v189 = _MergedGlobals_15_0;
          objc_msgSend(v187, "rate");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "doubleValue");
          objc_msgSend(v188, "quantityWithUnit:doubleValue:", v189);
          v191 = (void *)objc_claimAutoreleasedReturnValue();

          v192 = (void *)MEMORY[0x1E0CB6A40];
          v193 = qword_1EF199E30;
          objc_msgSend(v187, "date");
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "date");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "quantitySampleWithType:quantity:startDate:endDate:", v193, v191, v194, v195);
          v196 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v349, "addObjectFromWatch:", v196);
        }
        v184 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v350, v358, 16);
      }
      while (v184);
    }

    v12 = v343;
    self = v344;
    v11 = v337;
    v120 = v340;
    v121 = v342;
  }
  v197 = v11;
  v198 = v197;
  if ((v121 & 1) != 0)
    goto LABEL_117;
  if (self->_nextBodyTempSampleTime > a5)
    goto LABEL_117;
  objc_msgSend(v197, "bodyTempSampleFrequency");
  v200 = v199;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "statisticsSampleGenerator");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v202, "computeNoiseFromTime:stdDev:", a5, 0.0416666667);
  self->_nextBodyTempSampleTime = v200 + v203 + self->_nextBodyTempSampleTime;

  -[HDDemoDataVitalsSampleGenerator _computeBodyTempInCelsiusForDemoPerson:atTime:addNoise:](self, "_computeBodyTempInCelsiusForDemoPerson:atTime:addNoise:", v198, 1, a5);
  if (v204 == -2147483650.0)
  {
LABEL_117:
    v205 = 0;
    v206 = v198;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v205 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v205)
      goto LABEL_119;
    v216 = (void *)MEMORY[0x1E0CB6A28];
    v217 = qword_1EF199E18;
    objc_msgSend(v205, "doubleValue");
    objc_msgSend(v216, "quantityWithUnit:doubleValue:", v217);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199E50, v206, v12, v12);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "addObjectFromPhone:", v218);

  }
LABEL_119:
  objb = v205;
  if (objc_msgSend(v198, "resultsTrackingType") == 2 || HKFeatureFlagBloodOxygenSaturationEnabled())
  {
    v207 = v198;
    v338 = v12;
    if ((v121 & 1) != 0 || self->_nextOxygenSaturationSampleTime > a5)
      goto LABEL_129;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "sleepSampleGenerator");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    v210 = objc_msgSend(v209, "isDemoPersonSleeping:atTime:", v207, a5);

    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "statisticsSampleGenerator");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "pseudoRandomDoubleFromTime:", a5);
    v214 = v213;
    if (v210)
      objc_msgSend(v207, "oxygenSaturationMeasuringSuccessRateDuringSleep");
    else
      objc_msgSend(v207, "oxygenSaturationMeasuringSuccessRate");
    v219 = v215;

    if (v214 > v219)
    {
LABEL_129:
      v220 = 0;
      v221 = v338;
    }
    else
    {
      objc_msgSend(v207, "oxygenSaturationSampleFrequency");
      v223 = v222 + a5;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "statisticsSampleGenerator");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "computeNoiseFromTime:stdDev:", a5, 0.00208333333);
      self->_nextOxygenSaturationSampleTime = v223 + v226;

      objc_msgSend(v207, "oxygenSaturationMean");
      v228 = v227;
      objc_msgSend(v207, "oxygenSaturationStdDev");
      v230 = v229;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "generatorState");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = objc_msgSend(v232, "calendarDay");

      if (v233 == 7)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v234, "dateByAddingUnit:value:toDate:options:", 16, -14, v235, 0);
        v236 = (void *)objc_claimAutoreleasedReturnValue();

        v221 = v338;
        if (objc_msgSend(v338, "hk_isAfterDate:", v236))
        {
          objc_msgSend(v207, "oxygenSaturationMeanAtElevation");
          v228 = v237;
          objc_msgSend(v207, "oxygenSaturationStdDevAtElevation");
          v230 = v238;
        }

      }
      else
      {
        v221 = v338;
      }
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "statisticsSampleGenerator");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "computeNoiseFromTime:stdDev:", a5, v230);
      v242 = v241;

      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "generatorState");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = objc_msgSend(v244, "isExercising");

      v246 = v228 + -1.0;
      if (!v245)
        v246 = v228;
      v247 = v242 + v246;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "sleepSampleGenerator");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      v250 = objc_msgSend(v249, "isDemoPersonSleeping:atTime:", v207, a5);

      v251 = 2.0;
      if (v250)
        v251 = -3.0;
      v252 = ceil(v247 + v251);
      if (v252 > 100.0)
        v252 = 100.0;
      v253 = v252 / 100.0;
      v254 = v252 <= 90.0;
      v255 = 0.9;
      if (!v254)
        v255 = v253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v255);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v220)
    {
      v256 = (void *)MEMORY[0x1E0CB6A28];
      v257 = qword_1EF199E20;
      objc_msgSend(v220, "doubleValue");
      objc_msgSend(v256, "quantityWithUnit:doubleValue:", v257);
      v335 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v220, "doubleValue");
      v259 = v258 * 100.0;
      objc_msgSend(v207, "oxygenSaturationMeanAtElevation");
      if (v259 >= v260)
      {
        v262 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "pascalUnitWithMetricPrefix:", 9);
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v262, "quantityWithUnit:doubleValue:", v263, 101.0);
        v261 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        HKOxygenSaturationLowBarometricPressureThresholdQuantity();
        v261 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v356 = *MEMORY[0x1E0CB54C0];
      v357 = v261;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v357, &v356, 1);
      v264 = objc_claimAutoreleasedReturnValue();
      v265 = (void *)MEMORY[0x1E0CB6A40];
      v266 = qword_1EF199E58;
      objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
      v267 = (void *)objc_claimAutoreleasedReturnValue();
      v268 = v265;
      v269 = (void *)v335;
      v333 = (void *)v264;
      objc_msgSend(v268, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v266, v335, v221, v221, v267, v264);
      v270 = (void *)objc_claimAutoreleasedReturnValue();

      if (HKFeatureFlagBloodOxygenSaturationEnabled())
      {
        objc_msgSend(v349, "addObjectFromWatch:", v270);
        v331 = v261;
        if ((v342 & 1) != 0)
        {
          v279 = 0;
        }
        else
        {
          objc_msgSend(v220, "doubleValue");
          v272 = v271 * 100.0;
          v273 = 90.0;
          if (v272 <= 90.0)
          {
            v274 = 10.0;
            if (v272 <= 85.0)
            {
              if (v272 <= 80.0)
                v273 = 120.0;
              else
                v273 = 110.0;
              if (v272 <= 80.0)
                v274 = 15.0;
              else
                v274 = 10.0;
            }
          }
          else
          {
            v274 = 5.0;
            v273 = 70.0;
          }
          -[HDDemoDataBaseSampleGenerator demoDataGenerator](v344, "demoDataGenerator");
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v275, "statisticsSampleGenerator");
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v276, "pseudoRandomDoubleFromTime:", a5);
          v278 = v273 + v277 * v274;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v278);
          v279 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v280 = (void *)MEMORY[0x1E0CB6A28];
        v281 = _MergedGlobals_15_0;
        objc_msgSend(v279, "doubleValue");
        objc_msgSend(v280, "quantityWithUnit:doubleValue:", v281);
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199E28, v282, v338, v338);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v349, "addObjectFromWatch:", v283);
        v284 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend(v283, "UUID");
        v285 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v284, "hk_appendBytesWithUUID:", v285);

        objc_msgSend(v270, "UUID");
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v349, "setAssociatedObjectUUIDs:forObjectUUID:", v284, v286);

        v269 = (void *)v335;
        v261 = v331;
      }
      else
      {
        objc_msgSend(v349, "addObjectFromPhone:", v270);
      }

      v205 = objb;
    }

    v120 = v340;
    v12 = v343;
    v121 = v342;
  }
  if (objc_msgSend(v198, "resultsTrackingType") == 2)
  {
    v287 = v198;
    if ((v121 & 1) != 0 || v344->_nextPeripheralPerfusionIndexSampleTime > a5)
    {
      v288 = 0;
LABEL_180:

LABEL_181:
      v12 = v343;
      v205 = objb;
      goto LABEL_182;
    }
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](v344, "demoDataGenerator");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "generatorState");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v290, "isExercising"))
    {

    }
    else
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](v344, "demoDataGenerator");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v291, "activitySampleGenerator");
      v292 = v120;
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      v294 = objc_msgSend(v293, "_isDemoPersonCoolingDown:atTime:", v287, a5);

      v120 = v292;
      if ((v294 & 1) == 0)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](v344, "demoDataGenerator");
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        v310 = objc_msgSend(v308, "isDemoDataTimeInWeekend:calendar:", v309, a5);

        if ((v310 & 1) != 0)
          objc_msgSend(v287, "weekendSleepParameters");
        else
          objc_msgSend(v287, "weekdaySleepParameters");
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        v311 = (double)((uint64_t)a5 + 1);
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](v344, "demoDataGenerator");
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v312, "activitySampleGenerator");
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v307, "wakeUpTime");
        v315 = v314 + v311;
        objc_msgSend(v287, "exerciseStartTime");
        v317 = v316;
        objc_msgSend(v287, "exerciseStartTimeStdDev");
        objc_msgSend(v313, "_computeExerciseTimeFromCurrentTime:mean:stdDev:", v315, v317, v318);
        v344->_nextPeripheralPerfusionIndexSampleTime = v319 + v311;

        v288 = 0;
LABEL_179:

        goto LABEL_180;
      }
    }
    objc_msgSend(v287, "peripheralPerfusionIndexSampleFrequency");
    v344->_nextPeripheralPerfusionIndexSampleTime = v295 + v344->_nextPeripheralPerfusionIndexSampleTime;
    objc_msgSend(v287, "peripheralPerfusionIndexMean");
    v297 = v296;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](v344, "demoDataGenerator");
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v298, "statisticsSampleGenerator");
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v287, "peripheralPerfusionIndexStdDev");
    objc_msgSend(v299, "computeNoiseFromTime:stdDev:", a5, v300);
    v302 = v297 + v301;

    objc_msgSend(v287, "peripheralPerfusionIndexSampleFrequency");
    if (v303 < 0.000694444444)
    {
      v302 = v344->_lastPeripheralPerfusionIndexValue * 0.6 + v302 * 0.4;
      v344->_lastPeripheralPerfusionIndexValue = v302;
    }
    v304 = __exp10(2.0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)(v302 * v304) / v304 / 100.0);
    v288 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v288)
      goto LABEL_181;
    v305 = (void *)MEMORY[0x1E0CB6A28];
    v306 = qword_1EF199E20;
    objc_msgSend(v288, "doubleValue");
    objc_msgSend(v305, "quantityWithUnit:doubleValue:", v306);
    v287 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1EF199E60, v287, v343, v343);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v349, "addObjectFromPhone:", v307);
    goto LABEL_179;
  }
LABEL_182:

}

void __109__HDDemoDataVitalsSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_15_0;
  _MergedGlobals_15_0 = v0;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "millimeterOfMercuryUnit");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EF199E10;
  qword_1EF199E10 = v2;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeCelsiusUnit");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EF199E18;
  qword_1EF199E18 = v4;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1EF199E20;
  qword_1EF199E20 = v6;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1EF199E28;
  qword_1EF199E28 = v8;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D20]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1EF199E30;
  qword_1EF199E30 = v10;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1EF199E38;
  qword_1EF199E38 = v12;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_1EF199E40;
  qword_1EF199E40 = v14;

  objc_msgSend(MEMORY[0x1E0CB6528], "correlationTypeForIdentifier:", *MEMORY[0x1E0CB4AB8]);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_1EF199E48;
  qword_1EF199E48 = v16;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AC8]);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1EF199E50;
  qword_1EF199E50 = v18;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CF0]);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)qword_1EF199E58;
  qword_1EF199E58 = v20;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D08]);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)qword_1EF199E60;
  qword_1EF199E60 = v22;

}

- (uint64_t)_computeBloodPressureForDemoPerson:(double)a3 atTime:(double)a4 baseBloodPressure:(double)a5 stdDev:
{
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;

  v9 = a2;
  objc_msgSend(a1, "demoDataGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sleepSampleGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDemoPersonSleeping:atTime:", v9, a3);

  if ((v12 & 1) != 0)
  {
    v13 = 0xFFFFFFFF80000000;
  }
  else
  {
    objc_msgSend(a1[4], "objectAtIndexedSubscript:", (uint64_t)((a3 - (double)(uint64_t)a3) * 24.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15 * a4;

    if (objc_msgSend(v9, "biologicalSex") != 2)
      v16 = v16 * 0.9;
    objc_msgSend(a1, "demoDataGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generatorState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isExercising");

    v20 = 0.0;
    if (v19)
      v21 = a4 * 0.07 + 4.0;
    else
      v21 = 0.0;
    objc_msgSend(a1, "demoDataGenerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "foodSampleGenerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "_isDemoPersonConsumingCaffeine:atTime:", v9, a3);

    if (v24)
    {
      objc_msgSend(a1, "demoDataGenerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "statisticsSampleGenerator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "computeNoiseFromTime:stdDev:", a3, 2.25);
      v20 = fabs(v27) + 2.5;

    }
    objc_msgSend(a1, "demoDataGenerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "statisticsSampleGenerator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "computeNoiseFromTime:stdDev:", a3, a5);
    v31 = v30;

    v13 = (uint64_t)(v16 + v21 + v20 + v31);
  }

  return v13;
}

- (uint64_t)_computeMaxHRForDemoPerson:(double)a3 atTime:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  objc_msgSend(a1, "demoDataGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDateFromCurrentTime:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "birthDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = HDDemoData_ageBetweenNSDateComponentsAndDate(v8, v7);
  return 220 - v9;
}

- (double)_computeBodyTempInCelsiusForDemoPerson:(id)a3 atTime:(double)a4 addNoise:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  NSArray *diurnalTempVariationTable;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;

  v5 = a5;
  v8 = a3;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reproductiveHealthSampleGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_computeNextLuteinizingHormoneSurgeForDemoPerson:atTime:", v8, a4) + 1;

  objc_msgSend(v8, "menstrualPeriodFrequency");
  v13 = (uint64_t)v12;
  v14 = v11 / (uint64_t)v12;
  objc_msgSend(v8, "menstrualPeriodFrequency");
  v16 = (uint64_t)a4 % (uint64_t)v15 + v14 * v13 - v11 + 15;
  if (self)
    diurnalTempVariationTable = self->_diurnalTempVariationTable;
  else
    diurnalTempVariationTable = 0;
  -[NSArray objectAtIndexedSubscript:](diurnalTempVariationTable, "objectAtIndexedSubscript:", (uint64_t)((a4 - (double)(uint64_t)a4) * 24.0) % 24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "reproductiveHealthSampleGenerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_basalBodyTempMultiplier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", v16 % 28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;

  v27 = v20 * v26;
  objc_msgSend(v8, "bodyTempFeverMultiplier");
  v29 = v27 * v28;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "generatorState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v31, "isExercising");

  v32 = 0.0;
  v33 = v27 + v29;
  v34 = 0.0;
  if ((_DWORD)v23)
  {
    objc_msgSend(v8, "bodyTempExerciseMultiplier");
    v34 = v33 * v35;
  }
  if (v5)
  {
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "statisticsSampleGenerator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bodyTempSampleNoiseStdDev");
    objc_msgSend(v37, "computeNoiseFromTime:stdDev:", a4, v38);
    v32 = v39;

  }
  return v33 + v34 + v32 + -1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diurnalTempVariationTable, 0);
  objc_storeStrong((id *)&self->_diurnalBPVariationTable, 0);
}

@end

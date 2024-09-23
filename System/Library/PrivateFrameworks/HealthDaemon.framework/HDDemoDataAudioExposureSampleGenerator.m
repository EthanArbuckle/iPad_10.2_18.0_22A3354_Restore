@implementation HDDemoDataAudioExposureSampleGenerator

- (HDDemoDataAudioExposureSampleGenerator)init
{
  HDDemoDataAudioExposureSampleGenerator *v2;
  HDDemoDataAudioExposureSampleGenerator *v3;
  NSDate *lastHeadphoneSampleEndDate;
  NSDate *lastEnvironmentalSampleEndDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nextEnvironmentalAudioExposureSampleTime = 0.0;
    v2->_didGenerateEnvironmentalAudioExposureSamples = 0;
    v2->_nextHeadphoneAudioExposureSampleTime = 0.0;
    v2->_didGenerateHeadphoneAudioExposureSamples = 0;
    lastHeadphoneSampleEndDate = v2->_lastHeadphoneSampleEndDate;
    v2->_lastHeadphoneSampleEndDate = 0;

    lastEnvironmentalSampleEndDate = v3->_lastEnvironmentalSampleEndDate;
    v3->_lastEnvironmentalSampleEndDate = 0;

  }
  return v3;
}

- (HDDemoDataAudioExposureSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataAudioExposureSampleGenerator *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSDate *lastEnvironmentalSampleEndDate;
  uint64_t v10;
  NSDate *lastHeadphoneSampleEndDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextEnvironmentalAudioExposureSampleTimeKey"));
    v5->_nextEnvironmentalAudioExposureSampleTime = v6;
    v5->_didGenerateEnvironmentalAudioExposureSamples = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidGenerateEnvironmentalAudioExposureSamplesKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextHeadphoneAudioExposureSampleTimeKey"));
    v5->_nextHeadphoneAudioExposureSampleTime = v7;
    v5->_didGenerateHeadphoneAudioExposureSamples = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DidGenerateHeadphoneAudioExposureSamplesKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastEnvironmentalSampleEndDateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastEnvironmentalSampleEndDate = v5->_lastEnvironmentalSampleEndDate;
    v5->_lastEnvironmentalSampleEndDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastHeadphoneSampleEndDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastHeadphoneSampleEndDate = v5->_lastHeadphoneSampleEndDate;
    v5->_lastHeadphoneSampleEndDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *lastEnvironmentalSampleEndDate;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextEnvironmentalAudioExposureSampleTimeKey"), self->_nextEnvironmentalAudioExposureSampleTime);
    objc_msgSend(v4, "encodeBool:forKey:", self->_didGenerateEnvironmentalAudioExposureSamples, CFSTR("DidGenerateEnvironmentalAudioExposureSamplesKey"));
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextHeadphoneAudioExposureSampleTimeKey"), self->_nextHeadphoneAudioExposureSampleTime);
    objc_msgSend(v4, "encodeBool:forKey:", self->_didGenerateHeadphoneAudioExposureSamples, CFSTR("DidGenerateHeadphoneAudioExposureSamplesKey"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_lastHeadphoneSampleEndDate, CFSTR("LastHeadphoneSampleEndDateKey"));
    lastEnvironmentalSampleEndDate = self->_lastEnvironmentalSampleEndDate;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextEnvironmentalAudioExposureSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("DidGenerateEnvironmentalAudioExposureSamplesKey"));
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextHeadphoneAudioExposureSampleTimeKey"), 0.0);
    objc_msgSend(v4, "encodeBool:forKey:", 0, CFSTR("DidGenerateHeadphoneAudioExposureSamplesKey"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("LastHeadphoneSampleEndDateKey"));
    lastEnvironmentalSampleEndDate = 0;
  }
  objc_msgSend(v4, "encodeObject:forKey:", lastEnvironmentalSampleEndDate, CFSTR("LastEnvironmentalSampleEndDateKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  HDDemoDataAudioExposureSampleGenerator *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSDate *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  unint64_t v24;
  NSDate *v25;
  NSDate *v26;
  void *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  void *v32;
  void *v33;
  double v34;
  NSDate *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  char *v42;
  uint64_t v43;
  BOOL v44;
  NSDate *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSDate *v52;
  NSDate *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSDate *lastEnvironmentalSampleEndDate;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSDate *v68;
  void *v69;
  uint64_t v70;
  NSDate *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  unint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  NSDate *lastHeadphoneSampleEndDate;
  int v87;
  void *v88;
  void *v89;
  char v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  NSDate *v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  BOOL v110;
  id v111;
  NSObject *v112;
  void *v113;
  int *v114;
  void *v115;
  void *v116;
  NSDate *v117;
  id v118;
  NSDate *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSDate *v124;
  unint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  BOOL v134;
  id v135;
  NSDate *v136;
  NSObject *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  signed int v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  id v151;
  id v152;
  id v153;
  NSDate *v154;
  id v155;
  NSDate *v156;
  void *v157;
  id v158;
  id v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSDate *v165;
  HDDemoDataAudioExposureSampleGenerator *v166;
  id v167;
  NSDate *v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  char *v175;
  unint64_t v176;
  NSDate *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  id v185;
  id v186;
  void *v187;
  id v188;
  void *v189;
  void *v190;
  id v191;
  void *context;
  void *contexta;
  void *contextb;
  objc_super v195;
  id v196;
  __int128 buf;
  uint8_t v198[8];
  uint64_t v199;
  void *v200;
  void *v201;
  NSDate *v202;
  id v203;
  id v204;
  id v205;
  id v206;
  __int128 v207;
  uint64_t v208;

  v10 = self;
  v208 = *MEMORY[0x1E0C80C00];
  v195.receiver = self;
  v195.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v195, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v13, v12, v11, a5, a5);
  v14 = v13;
  v161 = v12;
  v167 = v11;
  if (!v10)
  {

    v15 = v161;
    v151 = v14;
    v152 = v161;
    v153 = v167;
    goto LABEL_70;
  }
  v166 = v10;
  if (v10->_nextEnvironmentalAudioExposureSampleTime > a5)
  {
    v10->_didGenerateEnvironmentalAudioExposureSamples = 0;
    v15 = v161;
    goto LABEL_30;
  }
  v15 = v161;
  if (v10->_lastEnvironmentalSampleEndDate)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelAWeightedSoundPressureLevelUnit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10->_lastEnvironmentalSampleEndDate;
    v18 = v161;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "component:fromDate:", 32, v18);

    if (v20 >= 22)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateBySettingHour:minute:second:ofDate:options:", 22, 0, 0, v18, 2);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v22;
    }
    objc_msgSend(v18, "timeIntervalSinceDate:", v17);
    if ((uint64_t)v23 >= 120)
    {
      v155 = v18;
      v157 = v16;
      v158 = v14;
      v24 = (uint64_t)v23 / 0x78uLL;
      v186 = v16;
      v156 = v17;
      v25 = v17;
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C78]);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](v24, 1, 0);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C80]);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](v24, 2, 0);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      -[NSDate dateByAddingTimeInterval:](v26, "dateByAddingTimeInterval:", 120.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = v24;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v24);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v29 = 0;
      v168 = 0;
      v164 = *MEMORY[0x1E0CB54A8];
      v163 = *MEMORY[0x1E0CB7248];
      v162 = *MEMORY[0x1E0CB48B8];
      v154 = v26;
      v30 = 0x1E0C99000uLL;
      while (1)
      {
        v31 = (char *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(v184, "objectAtIndex:", v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "objectAtIndex:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        if (v34 >= 80.0)
        {
          if (!v29)
          {
            v35 = v26;

            v168 = v35;
          }
          ++v29;
        }
        else
        {
          v29 = 0;
        }
        -[HDDemoDataAudioExposureSampleGenerator _makeQuantitySampleWithType:value:unit:startDate:endDate:metadata:](v178, v32, v186, v26, v27, 0);
        context = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "addObject:");
        objc_msgSend(*(id *)(v30 + 3400), "currentCalendar");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "component:fromDate:", 32, v26) >= 11)
        {
          objc_msgSend(*(id *)(v30 + 3400), "currentCalendar", v154);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v175 = v28;
          v38 = v29;
          v39 = v33;
          v40 = v30;
          v41 = v32;
          v42 = v31;
          v43 = objc_msgSend(v37, "component:fromDate:", 32, v27);

          v44 = v43 <= 11;
          v31 = v42;
          v32 = v41;
          v30 = v40;
          v33 = v39;
          v29 = v38;
          v28 = v175;
          if (!v44)
            goto LABEL_19;
          -[HDDemoDataAudioExposureSampleGenerator _makeQuantitySampleWithType:value:unit:startDate:endDate:metadata:](v160, v33, v186, v26, v27, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "addObject:", v36);
        }

LABEL_19:
        objc_msgSend(v27, "dateByAddingTimeInterval:", 0.0, v154);
        v45 = (NSDate *)objc_claimAutoreleasedReturnValue();

        -[NSDate dateByAddingTimeInterval:](v45, "dateByAddingTimeInterval:", 120.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29 >= 6)
        {
          v47 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(v32, "doubleValue");
          objc_msgSend(v47, "quantityWithUnit:doubleValue:", v186);
          v175 = v31;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v186, 80.0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = v164;
          *((_QWORD *)&buf + 1) = v163;
          *(_QWORD *)v198 = v48;
          v199 = (uint64_t)v49;
          v50 = (void *)MEMORY[0x1E0C99D80];
          v51 = v49;
          v170 = v48;
          v52 = v45;
          v53 = v168;
          objc_msgSend(v50, "dictionaryWithObjects:forKeys:count:", v198, &buf, 2);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = v46;
          v55 = (void *)MEMORY[0x1E0CB6378];
          objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", v162);
          v56 = v32;
          v57 = v33;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "categorySampleWithType:value:startDate:endDate:metadata:", v58, 1, v53, v52, v54);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v175;
          v33 = v57;
          v32 = v56;

          v30 = 0x1E0C99000uLL;
          objc_msgSend(v189, "addObject:", v59);

          v46 = v173;
          v29 = 0;
        }

        objc_autoreleasePoolPop(v31);
        ++v28;
        v26 = v45;
        v27 = v46;
        if ((char *)v176 == v28)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v189);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v60, "count"))
            objc_msgSend(v167, "addObjectsFromWatch:", v60);
          objc_msgSend(v60, "lastObject");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "endDate");
          v62 = objc_claimAutoreleasedReturnValue();
          v10 = v166;
          lastEnvironmentalSampleEndDate = v166->_lastEnvironmentalSampleEndDate;
          v166->_lastEnvironmentalSampleEndDate = (NSDate *)v62;

          objc_msgSend(*(id *)(v30 + 3400), "currentCalendar");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "dateByAddingUnit:value:toDate:options:", 32, 1, v166->_lastEnvironmentalSampleEndDate, 2);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v30 + 3400), "currentCalendar");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "dateBySettingHour:minute:second:ofDate:options:", 22, 0, 0, v166->_lastEnvironmentalSampleEndDate, 2);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v65, "hk_isAfterDate:", v67))
          {
            v166->_nextEnvironmentalAudioExposureSampleTime = ceil(a5) + 0.25;
            v68 = v166->_lastEnvironmentalSampleEndDate;
            v166->_lastEnvironmentalSampleEndDate = 0;

          }
          else
          {
            v166->_nextEnvironmentalAudioExposureSampleTime = a5 + 0.0416666667;
          }
          v15 = v161;
          v17 = v156;
          v16 = v157;
          v18 = v155;
          v166->_didGenerateEnvironmentalAudioExposureSamples = 1;

          v14 = v158;
          break;
        }
      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "dateBySettingHour:minute:second:ofDate:options:", 6, 0, 0, v161, 2);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = v10->_lastEnvironmentalSampleEndDate;
    v10->_lastEnvironmentalSampleEndDate = (NSDate *)v70;

    v10->_nextEnvironmentalAudioExposureSampleTime = 0.291666667;
    v10->_didGenerateEnvironmentalAudioExposureSamples = 0;
  }
LABEL_30:

  v72 = v14;
  v73 = v15;
  v74 = v167;
  if (v10->_nextHeadphoneAudioExposureSampleTime > a5)
  {
LABEL_35:
    v10->_didGenerateHeadphoneAudioExposureSamples = 0;
    goto LABEL_70;
  }
  if (!v10->_lastHeadphoneSampleEndDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "dateBySettingHour:minute:second:ofDate:options:", 6, 30, 0, v73, 2);
    v85 = objc_claimAutoreleasedReturnValue();
    lastHeadphoneSampleEndDate = v10->_lastHeadphoneSampleEndDate;
    v10->_lastHeadphoneSampleEndDate = (NSDate *)v85;

    v10->_nextHeadphoneAudioExposureSampleTime = 0.3125;
    goto LABEL_35;
  }
  v159 = v14;
  v75 = *MEMORY[0x1E0CB5CA8];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CA8]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelAWeightedSoundPressureLevelUnit");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v10->_lastHeadphoneSampleEndDate;
  v78 = v73;
  v79 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "component:fromDate:", 32, v78);

  if (v81 < 23)
  {
    v83 = v78;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "dateBySettingHour:minute:second:ofDate:options:", 22, 0, 0, v78, 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v87 = objc_msgSend(v72, "createHighFidelityData");
  v171 = v83;
  objc_msgSend(v83, "timeIntervalSinceDate:", v177);
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](v10, "demoDataGenerator");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "configuration");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "shouldGenerateLoudHeadphoneData");
  v172 = v77;
  v174 = v76;
  if (v87)
  {
    -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](0x384uLL, 0, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = v76;
    v93 = v91;
    v94 = v77;
    v95 = v177;
    v96 = v72;
    contexta = v94;
    if (objc_msgSend(v93, "count"))
    {
      v97 = (void *)MEMORY[0x1E0CB6A28];
      v190 = v93;
      objc_msgSend(v93, "objectAtIndexedSubscript:", 0);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "doubleValue");
      objc_msgSend(v97, "quantityWithUnit:doubleValue:", v94);
      v99 = objc_claimAutoreleasedReturnValue();

      v179 = (void *)v99;
      objc_msgSend(MEMORY[0x1E0CB6A40], "_unfrozenQuantitySampleWithQuantityType:quantity:startDate:device:", v92, v99, v95, 0);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "identifier");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v98) = objc_msgSend(v100, "isEqualToString:", v75);

      if ((_DWORD)v98)
      {
        -[HDDemoDataAudioExposureSampleGenerator _headphoneAudioExposureMetadata]();
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "_setMetadata:", v101);

      }
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](v10, "demoDataGenerator");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "profile");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "dataManager");
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      v182 = v96;
      -[HDDemoDataAudioExposureSampleGenerator _headphoneProvenanceWithPerson:](v10, v96);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      if (v105)
      {
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](v10, "demoDataGenerator");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "profile");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "database");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v196 = 0;
        *(_QWORD *)v198 = MEMORY[0x1E0C809B0];
        v199 = 3221225472;
        v200 = __171__HDDemoDataAudioExposureSampleGenerator__makeQuantitySeriesSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke;
        v201 = &unk_1E6CE9168;
        v202 = v95;
        v203 = v104;
        v109 = v187;
        v204 = v109;
        v205 = v105;
        v206 = v190;
        v207 = xmmword_1B7F41130;
        v110 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:", v108, &v196, v198);
        v111 = v196;

        if (!v110)
        {
          _HKInitializeLogging();
          v112 = *MEMORY[0x1E0CB52C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v111;
            _os_log_error_impl(&dword_1B7802000, v112, OS_LOG_TYPE_ERROR, "Failed to generate audio series: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        *(_QWORD *)&buf = v109;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 1);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v166;
        v114 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
        v79 = 0x1E0C99000;
        v93 = v190;
        v115 = v179;
      }
      else
      {
        _HKInitializeLogging();
        v138 = *MEMORY[0x1E0CB52C8];
        v114 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
        v115 = v179;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v198 = 0;
          _os_log_error_impl(&dword_1B7802000, v138, OS_LOG_TYPE_ERROR, "Failed to get demo data provenance; skipping sample insert.",
            v198,
            2u);
        }
        v113 = (void *)MEMORY[0x1E0C9AA60];
        v93 = v190;
      }

      v96 = v182;
    }
    else
    {
      v113 = (void *)MEMORY[0x1E0C9AA60];
      v114 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
    }

  }
  else
  {
    -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](0x16uLL, 0, v90);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    v188 = v76;
    v93 = v116;
    v185 = v77;
    v117 = v177;
    v118 = v72;
    v119 = v117;
    -[NSDate dateByAddingTimeInterval:](v119, "dateByAddingTimeInterval:", 120.0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](v10, "demoDataGenerator");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "profile");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "dataManager");
    v183 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDDemoDataAudioExposureSampleGenerator _headphoneProvenanceWithPerson:](v10, v118);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    if (v180)
    {
      v169 = v118;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v93, "count"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = v119;
      v124 = v119;
      v191 = v93;
      while (1)
      {
        v125 = objc_msgSend(v123, "count");
        if (v125 >= objc_msgSend(v93, "count"))
          break;
        contextb = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(v93, "objectAtIndex:", objc_msgSend(v123, "count"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDemoDataAudioExposureSampleGenerator _headphoneAudioExposureMetadata]();
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDemoDataAudioExposureSampleGenerator _makeQuantitySampleWithType:value:unit:startDate:endDate:metadata:](v188, v126, v185, v124, v120, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v123, "addObject:", v128);
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](v10, "demoDataGenerator");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "profile");
        v130 = v120;
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "database");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v196 = 0;
        *(_QWORD *)v198 = MEMORY[0x1E0C809B0];
        v199 = 3221225472;
        v200 = __166__HDDemoDataAudioExposureSampleGenerator__makeHeadphoneSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke;
        v201 = &unk_1E6CEB3F8;
        v202 = v183;
        v133 = v128;
        v203 = v133;
        v204 = v180;
        v134 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:", v132, &v196, v198);
        v135 = v196;

        if (v134)
        {
          objc_msgSend(v130, "dateByAddingTimeInterval:", 0.0);
          v136 = (NSDate *)objc_claimAutoreleasedReturnValue();

          -[NSDate dateByAddingTimeInterval:](v136, "dateByAddingTimeInterval:", 120.0);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          v124 = v136;
          v93 = v191;
        }
        else
        {
          _HKInitializeLogging();
          v137 = *MEMORY[0x1E0CB52C8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v135;
            _os_log_error_impl(&dword_1B7802000, v137, OS_LOG_TYPE_ERROR, "Failed to generate audio series: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          v175 = v123;
          v93 = v191;
          v120 = v130;
        }

        objc_autoreleasePoolPop(contextb);
        v10 = v166;
        v79 = 0x1E0C99000;
        if (!v134)
          goto LABEL_59;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v123);
      v175 = (char *)objc_claimAutoreleasedReturnValue();
LABEL_59:

      v113 = v175;
      v118 = v169;
      v119 = v165;
    }
    else
    {
      v113 = (void *)MEMORY[0x1E0C9AA60];
      v124 = v119;
    }

    v114 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
  }

  v139 = v113;
  objc_msgSend(v113, "lastObject");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "endDate");
  v141 = objc_claimAutoreleasedReturnValue();
  v142 = v114[356];
  v143 = *(Class *)((char *)&v10->super.super.isa + v142);
  *(Class *)((char *)&v10->super.super.isa + v142) = (Class)v141;

  v144 = arc4random_uniform(5u) + 1;
  objc_msgSend(*(id *)(v79 + 3400), "currentCalendar");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "dateByAddingUnit:value:toDate:options:", 32, v144, *(Class *)((char *)&v10->super.super.isa + v114[356]), 2);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v79 + 3400), "currentCalendar");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "dateBySettingHour:minute:second:ofDate:options:", 22, 0, 0, *(Class *)((char *)&v10->super.super.isa + v114[356]), 2);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v146, "hk_isAfterDate:", v148))
  {
    v149 = 0;
    v150 = ceil(a5);
    a5 = 0.25;
  }
  else
  {
    v150 = ((double)v144 * 3600.0 + 0.0 + 0.0) * 0.0000115740741;
    v149 = v146;
  }
  v15 = v161;
  v10->_nextHeadphoneAudioExposureSampleTime = a5 + v150;
  objc_storeStrong((id *)&v10->_lastHeadphoneSampleEndDate, v149);
  v10->_didGenerateHeadphoneAudioExposureSamples = 1;

  v14 = v159;
LABEL_70:

}

- (id)_makeNormallyDistributedAudioExposureLevelsWithCount:(unint64_t)a1 audioLevelType:(uint64_t)a2 loudData:(char)a3
{
  double v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint32_t v13;
  void *v14;
  long double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  char v23;

  if (a2 == 2)
  {
    v5 = 25.0;
    v6 = &__block_literal_global_310;
    goto LABEL_7;
  }
  v5 = 105.0;
  if (a2 == 1)
  {
    v6 = &__block_literal_global_113;
    goto LABEL_7;
  }
  if (!a2)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke;
    v22[3] = &__block_descriptor_33_e18_B16__0__NSNumber_8l;
    v23 = a3;
    v6 = v22;
LABEL_7:
    objc_msgSend(&unk_1E6DF9458, "hk_filter:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = &unk_1E6DF9458;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(v9, "objectAtIndex:", arc4random_uniform(objc_msgSend(v9, "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (!a2)
  {
    v13 = arc4random_uniform(0x28u);
    if (!v13)
      v12 = 96.0;
    a1 >>= v13 == 0;
  }
  while (objc_msgSend(v8, "count") < a1)
  {
    v14 = (void *)MEMORY[0x1BCCACAC4]();
    v15 = (double)arc4random() / 4294967300.0;
    v16 = (double)arc4random() / 4294967300.0;
    v17 = sqrt(log(v15) * -2.0);
    v18 = v12 + v17 * cos(v16 * 6.28318531) * 4.0;
    if (v18 < 1.0)
      v18 = 1.0;
    if (v18 >= v5)
      v18 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);

    objc_autoreleasePoolPop(v14);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

BOOL __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  double v5;
  double v6;
  _BOOL8 v7;
  double v8;
  double v9;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = dbl_1B7F41140[v4 == 0];
  objc_msgSend(v3, "doubleValue");
  if (v6 >= v5)
  {
    if (v4)
      v8 = 92.0;
    else
      v8 = 80.0;
    objc_msgSend(v3, "doubleValue");
    v7 = v9 <= v8;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  _BOOL8 v4;
  double v5;

  v2 = a2;
  objc_msgSend(v2, "doubleValue");
  if (v3 >= 45.0)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v5 <= 83.0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  _BOOL8 v4;
  double v5;

  v2 = a2;
  objc_msgSend(v2, "doubleValue");
  if (v3 >= 1.0)
  {
    objc_msgSend(v2, "doubleValue");
    v4 = v5 <= 25.0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_headphoneProvenanceWithPerson:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  _QWORD v65[3];
  id v66;
  id v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  void *v71;
  _QWORD v72[6];

  v72[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB65C0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("AirPods"), CFSTR("Apple, Inc."), CFSTR("AirPods 1,1"), 0, 0, 0, v6, 0);

  v72[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0CB65C0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("EarPods"), CFSTR("Apple, Inc."), CFSTR("EarPods 1,1"), 0, 0, 0, v10, 0);

  v72[1] = v11;
  v12 = objc_alloc(MEMORY[0x1E0CB65C0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", CFSTR("Powerbeats Pro"), CFSTR("Beats By Dre"), CFSTR("Powerbeats Pro 1,1"), 0, 0, 0, v14, 0);

  v72[2] = v15;
  v16 = objc_alloc(MEMORY[0x1E0CB65C0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", 0, CFSTR("Foo, Inc."), CFSTR("FooPods 1,1"), 0, 0, 0, v18, 0);

  v72[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "firstName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@'s Watch"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "demoDataGenerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "profile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sourceManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"));
    v67 = 0;
    objc_msgSend(v26, "sourceForAppleDeviceWithUUID:identifier:name:productType:createIfNecessary:error:", v27, CFSTR("com.apple.health.demo_watch"), v23, CFSTR("Watch1,2"), 1, &v67);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v67;

    if (v28)
    {
      v63 = v28;
      objc_msgSend(a1, "demoDataGenerator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "profile");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "deviceManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v20, "count")));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v29;
      objc_msgSend(v32, "deviceEntityForDevice:error:", v33, &v66);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v66;

      if (v34)
      {
        v61 = v23;
        objc_msgSend(a1, "demoDataGenerator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "profile");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "daemon");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "behavior");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "demoDataGenerator");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "profile");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v58, "currentSyncIdentityPersistentID");
        objc_msgSend(v38, "currentOSBuild");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v39;
        v41 = CFSTR("UnknownBuild");
        if (v39)
          v41 = (const __CFString *)v39;
        v56 = v41;
        v62 = v20;
        v60 = v26;
        if (v38)
          objc_msgSend(v38, "currentOSVersionStruct");
        else
          memset(v65, 0, sizeof(v65));
        objc_msgSend(v38, "currentOSVersion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localTimeZone");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v63;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v63, "persistentID"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v34, "persistentID"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v57, CFSTR("Watch1,2"), v56, v65, v46, v48, v49, v50, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v61;
        v20 = v62;
        v29 = v64;
        v26 = v60;
      }
      else
      {
        _HKInitializeLogging();
        v45 = *MEMORY[0x1E0CB52C8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v64;
          v69 = v64;
          _os_log_error_impl(&dword_1B7802000, v45, OS_LOG_TYPE_ERROR, "Error creating headphone device entity %{public}@", buf, 0xCu);
          v43 = 0;
        }
        else
        {
          v43 = 0;
          v29 = v64;
        }
        v28 = v63;
        v34 = 0;
      }

    }
    else
    {
      _HKInitializeLogging();
      v44 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v69 = v29;
        _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "Error creating watch source entity %{public}@", buf, 0xCu);
      }
      v43 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v42 = (void *)*MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      v52 = v42;
      objc_msgSend(a1, "demoDataGenerator");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "demoDataGenerator");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "profile");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v53;
      v70 = 2114;
      v71 = v55;
      _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "No source manager found on generator %{public}@ for profile %{public}@", buf, 0x16u);

    }
    v43 = 0;
  }

  return v43;
}

- (id)_headphoneAudioExposureMetadata
{
  uint64_t v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CB7230];
  v2[0] = CFSTR("com.apple.Music,com.apple.mobilesafari");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_makeQuantitySampleWithType:(void *)a1 value:(void *)a2 unit:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 metadata:(void *)a6
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v11 = (void *)MEMORY[0x1E0CB6A28];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = a1;
  objc_msgSend(a2, "doubleValue");
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v16, v17, v14, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "_setMetadata:", v12);
  return v18;
}

uint64_t __166__HDDemoDataAudioExposureSampleGenerator__makeHeadphoneSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v13[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "sourceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDSourceEntity, "entityWithPersistentID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDDeviceEntity, "entityWithPersistentID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v6, v8, v10, 0, a3, CFAbsoluteTimeGetCurrent());

  return v11;
}

BOOL __171__HDDemoDataAudioExposureSampleGenerator__makeQuantitySeriesSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", *(double *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v34[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "sourceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDSourceEntity, "entityWithPersistentID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity entityWithPersistentID:](HDDeviceEntity, "entityWithPersistentID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v8, v10, v12, 0, a3, CFAbsoluteTimeGetCurrent());

  if ((_DWORD)v7)
  {
    v31 = a3;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      v14 = 0;
      v15 = v5;
      v16 = v6;
      do
      {
        v17 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB6478];
        objc_msgSend(v16, "timeIntervalSinceReferenceDate");
        v21 = v20;
        objc_msgSend(v18, "doubleValue");
        *(float *)&v22 = *(double *)(a1 + 72);
        objc_msgSend(v19, "datumWithTimestamp:value:duration:", v21, v23, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v24);
        objc_msgSend(v16, "dateByAddingTimeInterval:", *(double *)(a1 + 80));
        v5 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "dateByAddingTimeInterval:", *(double *)(a1 + 72));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v17);
        ++v14;
        v15 = v5;
        v16 = v6;
      }
      while (objc_msgSend(*(id *)(a1 + 64), "count") > v14);
    }
    objc_msgSend(*(id *)(a1 + 40), "quantitySeriesManager", v31, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "insertValues:series:error:", v13, *(_QWORD *)(a1 + 48), v32);

    if ((v26 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "quantitySeriesManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "freezeSeries:metadata:endDate:error:", *(_QWORD *)(a1 + 48), 0, v6, v32);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "status") == 1;

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHeadphoneSampleEndDate, 0);
  objc_storeStrong((id *)&self->_lastEnvironmentalSampleEndDate, 0);
}

@end

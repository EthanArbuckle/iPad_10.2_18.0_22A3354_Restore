@implementation HDDemoDataBodySampleGenerator

- (HDDemoDataBodySampleGenerator)init
{
  HDDemoDataBodySampleGenerator *v2;
  HDDemoDataBodySampleGenerator *v3;
  NSArray *boysHeightBirthTo36MonthsGrowthCurve;
  NSArray *boysHeight2To20YearsGrowthCurve;
  NSArray *boysWeightBirthTo36MonthsGrowthCurve;
  NSArray *boysWeight2To20YearsGrowthCurve;
  NSArray *girlsHeightBirthTo36MonthsGrowthCurve;
  NSArray *girlsHeight2To20YearsGrowthCurve;
  NSArray *girlsWeightBirthTo36MonthsGrowthCurve;
  NSArray *girlsWeight2To20YearsGrowthCurve;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataBodySampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    boysHeightBirthTo36MonthsGrowthCurve = v2->_boysHeightBirthTo36MonthsGrowthCurve;
    v2->_boysHeightBirthTo36MonthsGrowthCurve = 0;

    boysHeight2To20YearsGrowthCurve = v3->_boysHeight2To20YearsGrowthCurve;
    v3->_boysHeight2To20YearsGrowthCurve = 0;

    boysWeightBirthTo36MonthsGrowthCurve = v3->_boysWeightBirthTo36MonthsGrowthCurve;
    v3->_boysWeightBirthTo36MonthsGrowthCurve = 0;

    boysWeight2To20YearsGrowthCurve = v3->_boysWeight2To20YearsGrowthCurve;
    v3->_boysWeight2To20YearsGrowthCurve = 0;

    girlsHeightBirthTo36MonthsGrowthCurve = v3->_girlsHeightBirthTo36MonthsGrowthCurve;
    v3->_girlsHeightBirthTo36MonthsGrowthCurve = 0;

    girlsHeight2To20YearsGrowthCurve = v3->_girlsHeight2To20YearsGrowthCurve;
    v3->_girlsHeight2To20YearsGrowthCurve = 0;

    girlsWeightBirthTo36MonthsGrowthCurve = v3->_girlsWeightBirthTo36MonthsGrowthCurve;
    v3->_girlsWeightBirthTo36MonthsGrowthCurve = 0;

    girlsWeight2To20YearsGrowthCurve = v3->_girlsWeight2To20YearsGrowthCurve;
    v3->_girlsWeight2To20YearsGrowthCurve = 0;

    v3->_nextHeightSampleTime = 0.0;
    v3->_nextWeightSampleTime = 0.0;
    v3->_lastHeightInCm = 0.0;
    v3->_lastWeightInKg = 0.0;
    v3->_weightAdultStartInKg = 0.0;
  }
  return v3;
}

- (HDDemoDataBodySampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataBodySampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDemoDataBodySampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataBodySampleGeneratorNextHeightSampleTimeKey"));
    v5->_nextHeightSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataBodySampleGeneratorNextWeightSampleTimeKey"));
    v5->_nextWeightSampleTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataBodySampleGeneratorLastHeightInCmKey"));
    v5->_lastHeightInCm = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataBodySampleGeneratorLastWeightInKgKey"));
    v5->_lastWeightInKg = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataBodySampleGeneratorWeightAdultStartInKgKey"));
    v5->_weightAdultStartInKg = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataBodySampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataBodySampleGeneratorNextHeightSampleTimeKey"), self->_nextHeightSampleTime, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataBodySampleGeneratorNextWeightSampleTimeKey"), self->_nextWeightSampleTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataBodySampleGeneratorLastHeightInCmKey"), self->_lastHeightInCm);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataBodySampleGeneratorLastWeightInKgKey"), self->_lastWeightInKg);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HDDemoDataBodySampleGeneratorWeightAdultStartInKgKey"), self->_weightAdultStartInKg);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *boysHeightBirthTo36MonthsGrowthCurve;
  NSArray *v10;
  NSArray *boysHeight2To20YearsGrowthCurve;
  NSArray *v12;
  NSArray *boysWeightBirthTo36MonthsGrowthCurve;
  NSArray *v14;
  NSArray *boysWeight2To20YearsGrowthCurve;
  NSArray *v16;
  NSArray *girlsHeightBirthTo36MonthsGrowthCurve;
  NSArray *v18;
  NSArray *girlsHeight2To20YearsGrowthCurve;
  NSArray *v20;
  NSArray *girlsWeightBirthTo36MonthsGrowthCurve;
  NSArray *v22;
  NSArray *girlsWeight2To20YearsGrowthCurve;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HDDemoDataBodySampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v31, sel_setupWithDemoDataGenerator_, v4);
  HDHealthDaemonFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("CDCGrowthCurves50thPercentile"), CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boysHeightBirthTo36MonthsGrowthCurve"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  boysHeightBirthTo36MonthsGrowthCurve = self->_boysHeightBirthTo36MonthsGrowthCurve;
  self->_boysHeightBirthTo36MonthsGrowthCurve = v8;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boysHeight2To20YearsGrowthCurve"));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  boysHeight2To20YearsGrowthCurve = self->_boysHeight2To20YearsGrowthCurve;
  self->_boysHeight2To20YearsGrowthCurve = v10;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boysWeightBirthTo36MonthsGrowthCurve"));
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  boysWeightBirthTo36MonthsGrowthCurve = self->_boysWeightBirthTo36MonthsGrowthCurve;
  self->_boysWeightBirthTo36MonthsGrowthCurve = v12;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("boysWeight2To20YearsGrowthCurve"));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  boysWeight2To20YearsGrowthCurve = self->_boysWeight2To20YearsGrowthCurve;
  self->_boysWeight2To20YearsGrowthCurve = v14;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("girlsHeightBirthTo36MonthsGrowthCurve"));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  girlsHeightBirthTo36MonthsGrowthCurve = self->_girlsHeightBirthTo36MonthsGrowthCurve;
  self->_girlsHeightBirthTo36MonthsGrowthCurve = v16;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("girlsHeight2To20YearsGrowthCurve"));
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  girlsHeight2To20YearsGrowthCurve = self->_girlsHeight2To20YearsGrowthCurve;
  self->_girlsHeight2To20YearsGrowthCurve = v18;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("girlsWeightBirthTo36MonthsGrowthCurve"));
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  girlsWeightBirthTo36MonthsGrowthCurve = self->_girlsWeightBirthTo36MonthsGrowthCurve;
  self->_girlsWeightBirthTo36MonthsGrowthCurve = v20;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("girlsWeight2To20YearsGrowthCurve"));
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  girlsWeight2To20YearsGrowthCurve = self->_girlsWeight2To20YearsGrowthCurve;
  self->_girlsWeight2To20YearsGrowthCurve = v22;

  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    objc_msgSend(v4, "demoPerson");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "currentDateFromCurrentTime:", 0.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "birthDateComponents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = HDDemoData_ageBetweenNSDateComponentsAndDate(v27, v26);

    if (v28 >= 21)
    {
      objc_msgSend(v24, "weightTargetInKg");
      self->_weightAdultStartInKg = v29;
      self->_lastWeightInKg = v29;
      objc_msgSend(v24, "heightTargetInCm");
      self->_lastHeightInCm = v30;
    }

  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  int *v29;
  double v30;
  double v31;
  id v32;
  id v33;
  double v34;
  double v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double i;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  uint64_t v71;
  double v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  double v86;
  double v87;
  uint64_t v88;
  int *v89;
  id v90;
  double v91;
  id v92;
  id v93;
  double v94;
  double k;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double j;
  double v103;
  uint64_t v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double lastHeightInCm;
  id v131;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  void *v149;
  void *v150;
  double v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  objc_super v160;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  v160.receiver = self;
  v160.super_class = (Class)HDDemoDataBodySampleGenerator;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v160, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, v13, a5, a5);
  if (qword_1ED552440 != -1)
    dispatch_once(&qword_1ED552440, &__block_literal_global_146);
  v14 = v11;
  v15 = v14;
  if (!self)
  {

    v154 = v15;
    v75 = 0;
    v159 = 0;
    goto LABEL_33;
  }
  if (self->_nextHeightSampleTime > a5)
  {
    v16 = 0;
    v17 = v14;
    goto LABEL_30;
  }
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentDateFromCurrentTime:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "birthDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = HDDemoData_ageBetweenNSDateComponentsAndDate(v20, v19);

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "firstSampleDayOfYear");

  objc_msgSend(v15, "birthDateComponents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = HDDemoData_currentDayOfYearFromNSDateComponents(v24);

  v26 = (double)(((uint64_t)a5 + v23 - v25 + 365) % 365) / 365.0;
  v27 = v26 + (double)v21;
  if (v27 >= 0.0 && v27 < 20.0)
  {
    v28 = objc_msgSend(v15, "biologicalSex");
    v157 = v13;
    if (v27 >= 3.0)
    {
      if (v27 >= 21.0)
      {
        v36 = v12;
        v32 = 0;
        goto LABEL_18;
      }
      v29 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeight2To20YearsGrowthCurve;
      if (v28 != 2)
        v29 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__girlsHeight2To20YearsGrowthCurve;
    }
    else
    {
      v29 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__girlsHeightBirthTo36MonthsGrowthCurve;
      if (v28 == 2)
        v29 = OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeightBirthTo36MonthsGrowthCurve;
    }
    v36 = v12;
    v32 = *(id *)((char *)&self->super.super.isa + *v29);
LABEL_18:
    v37 = objc_msgSend(v15, "biologicalSex");
    v38 = 5;
    if (v37 == 2)
      v38 = 1;
    v33 = objc_retain(*(id *)((char *)&self->super.super.isa
                            + OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeightBirthTo36MonthsGrowthCurve[v38]));
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "statisticsSampleGenerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v27 >= 3.0)
    {
      objc_msgSend(v40, "computeNoiseFromTime:stdDev:", a5, 15.0);
      v35 = v47 + 30.0;

      v45 = v26 + (double)(v21 - 2) + v26 + (double)(v21 - 2);
      i = v26 + -0.5 + v26 + -0.5;
      if (v26 <= 0.5)
        v46 = 0.0;
      else
        v46 = v26 + -0.5 + v26 + -0.5;
    }
    else
    {
      objc_msgSend(v40, "computeNoiseFromTime:stdDev:", a5, 3.0);
      v43 = v42;

      for (i = 4.0; v26 > 0.25; v26 = v26 + -0.25)
        ;
      v35 = v43 + 3.0;
      v45 = v27 * 4.0;
      v46 = v26 * 4.0;
    }
    v48 = (uint64_t)v45;
    objc_msgSend(v32, "objectAtIndexedSubscript:", (uint64_t)v45, i);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "doubleValue");
    v51 = v50;

    objc_msgSend(v32, "objectAtIndexedSubscript:", v48 + 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "doubleValue");
    v54 = v53;

    v55 = v46 * v54 + v51 * (1.0 - v46);
    objc_msgSend(v15, "heightTargetInCm");
    v57 = v56;
    objc_msgSend(v33, "lastObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValue");
    v60 = v57 / v59;

    v61 = fmin(v27 * v27 / 289.0, 1.0);
    v62 = v55 * (1.0 - v61 + v60 * v61);
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "statisticsSampleGenerator");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "heightSampleNoiseStdDev");
    v66 = v65;
    objc_msgSend(v33, "lastObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "doubleValue");
    objc_msgSend(v64, "computeNoiseFromTime:stdDev:", a5, v66 / v68);
    v31 = v62 + v69;

    v12 = v36;
    v13 = v157;
    goto LABEL_28;
  }
  objc_msgSend(v15, "heightTargetInCm");
  v31 = v30;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "statisticsSampleGenerator");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "computeNoiseFromTime:stdDev:", a5, 6.0);
  v35 = fabs(v34) + 90.0;
LABEL_28:

  self->_nextHeightSampleTime = v35 + self->_nextHeightSampleTime;
  self->_lastHeightInCm = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_31;
  v70 = (void *)MEMORY[0x1E0CB6A28];
  v71 = _MergedGlobals_6;
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v70, "quantityWithUnit:doubleValue:", v71, v72 * 0.01);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552418, v17, v12, v12);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectFromPhone:", v73);

LABEL_30:
LABEL_31:
  v159 = v16;
  v74 = v15;
  if (self->_nextWeightSampleTime > a5)
  {
    v75 = 0;
LABEL_33:
    v76 = v15;
    goto LABEL_58;
  }
  v77 = v74;
  v158 = v13;
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "currentDateFromCurrentTime:", a5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "birthDateComponents");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = HDDemoData_ageBetweenNSDateComponentsAndDate(v80, v79);

  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "firstSampleDayOfYear");

  objc_msgSend(v77, "birthDateComponents");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = HDDemoData_currentDayOfYearFromNSDateComponents(v84);

  v86 = (double)(((uint64_t)a5 + v83 - v85 + 365) % 365) / 365.0;
  v87 = v86 + (double)v81;
  if (v87 >= 0.0 && v87 < 20.0)
  {
    v88 = objc_msgSend(v77, "biologicalSex");
    if (v87 >= 3.0)
    {
      if (v87 >= 21.0)
      {
        v90 = v12;
        v92 = 0;
LABEL_45:
        v96 = objc_msgSend(v77, "biologicalSex");
        v97 = 7;
        if (v96 == 2)
          v97 = 3;
        v93 = objc_retain(*(id *)((char *)&self->super.super.isa
                                + OBJC_IVAR___HDDemoDataBodySampleGenerator__boysHeightBirthTo36MonthsGrowthCurve[v97]));
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "statisticsSampleGenerator");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "computeNoiseFromTime:stdDev:", a5, 3.0);
        v101 = fabs(v100);

        if (v87 >= 3.0)
        {
          k = v101 + 30.0;
          for (j = v86 + (double)(v81 - 2); v86 > 0.08333333; v86 = v86 + -0.08333333)
            ;
        }
        else
        {
          for (k = v101 + 3.0; v86 > 0.08333333; v86 = v86 + -0.08333333)
            ;
          j = v87;
        }
        v103 = v86 * 12.0;
        v104 = (uint64_t)(j * 12.0);
        objc_msgSend(v92, "objectAtIndexedSubscript:", v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "doubleValue");
        v107 = v106;

        objc_msgSend(v92, "objectAtIndexedSubscript:", v104 + 1);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "doubleValue");
        v110 = v109;

        v111 = v103 * v110 + v107 * (1.0 - v103);
        objc_msgSend(v77, "weightTargetInKg");
        v113 = v112;
        objc_msgSend(v93, "lastObject");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "doubleValue");
        v116 = v113 / v115;

        v117 = fmin(v87 * v87 / 289.0, 1.0);
        v118 = v111 * (1.0 - v117 + v116 * v117);
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "statisticsSampleGenerator");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "weightSampleNoiseStdDev");
        v122 = v121;
        objc_msgSend(v93, "lastObject");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "doubleValue");
        objc_msgSend(v120, "computeNoiseFromTime:stdDev:", a5, v122 / v124);
        v91 = v118 + v125;

        self->_weightAdultStartInKg = v91;
        goto LABEL_54;
      }
      v89 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__boysWeight2To20YearsGrowthCurve;
    }
    else
    {
      v89 = &OBJC_IVAR___HDDemoDataBodySampleGenerator__boysWeightBirthTo36MonthsGrowthCurve;
    }
    if (v88 != 2)
      v89 += 4;
    v90 = v12;
    v92 = *(id *)((char *)&self->super.super.isa + *v89);
    goto LABEL_45;
  }
  v90 = v12;
  v91 = -[HDDemoDataBodySampleGenerator weightChangeForDemoPerson:atTime:]((double *)self, v77, a5);
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "statisticsSampleGenerator");
  v93 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "computeNoiseFromTime:stdDev:", a5, 1.0);
  k = fabs(v94);
LABEL_54:

  self->_nextWeightSampleTime = k + a5;
  self->_lastWeightInKg = v91;
  v126 = (void *)MEMORY[0x1E0CB37E8];
  v127 = __exp10(1.0);
  objc_msgSend(v126, "numberWithDouble:", (double)(uint64_t)(v91 * v127) / v127);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v158;
  if (!v75)
  {
    v12 = v90;
    goto LABEL_59;
  }
  v156 = v15;
  objc_msgSend(v75, "doubleValue");
  v129 = v128;
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED5523F8);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552420, v76, v90, v90);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "addObjectFromPhone:");
  lastHeightInCm = self->_lastHeightInCm;
  v131 = v77;
  v132 = objc_msgSend(v131, "biologicalSex");
  objc_msgSend(v131, "waistCircumferenceInInches");
  v134 = v133;
  objc_msgSend(v131, "forearmCircumferenceInInches");
  v136 = v135;
  objc_msgSend(v131, "wristCircumferenceInInches");
  v138 = v137;
  objc_msgSend(v131, "hipCircumferenceInInches");
  v140 = v139;

  +[HDDemoDataFormula computeLeanBodyMassFromWeight:height:sex:waistCircumference:forearmCircumference:wristCircumference:hipCircumference:](HDDemoDataFormula, "computeLeanBodyMassFromWeight:height:sex:waistCircumference:forearmCircumference:wristCircumference:hipCircumference:", v132, v129, lastHeightInCm, v134, v136, v138, v140);
  v142 = v141;
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED5523F8);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552428, v143, v90, v90);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "addObjectFromPhone:", v144);
  -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "statisticsSampleGenerator");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "computeNoiseFromTime:stdDev:", a5, 0.33);
  v148 = v142 + v147;

  +[HDDemoDataFormula computeBodyFatPercentageFromWeight:leanBodyMass:](HDDemoDataFormula, "computeBodyFatPercentageFromWeight:leanBodyMass:", v129, v148);
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED552408);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552430, v149, v90, v90);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "addObjectFromPhone:", v150);
  v151 = 0.0;
  if (v129 != 0.0)
    +[HDDemoDataFormula computeBodyMassIndexFromWeight:height:](HDDemoDataFormula, "computeBodyMassIndexFromWeight:height:", v129, self->_lastHeightInCm);
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", qword_1ED552410, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", qword_1ED552438, v152, v90, v90);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v158;
  objc_msgSend(v158, "addObjectFromPhone:", v153);

  v12 = v90;
  v15 = v156;
LABEL_58:

LABEL_59:
}

void __107__HDDemoDataBodySampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
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

  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v0;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED5523F8;
  qword_1ED5523F8 = v2;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnit");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED552400;
  qword_1ED552400 = v4;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED552408;
  qword_1ED552408 = v6;

  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED552410;
  qword_1ED552410 = v8;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CC0]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ED552418;
  qword_1ED552418 = v10;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AB8]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED552420;
  qword_1ED552420 = v12;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CD8]);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_1ED552428;
  qword_1ED552428 = v14;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AB0]);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_1ED552430;
  qword_1ED552430 = v16;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AC0]);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_1ED552438;
  qword_1ED552438 = v18;

}

- (double)weightChangeForDemoPerson:(double)a3 atTime:
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  v5 = a2;
  objc_msgSend(v5, "genericSampleTimeNoiseStdDev");
  v7 = v6;
  objc_msgSend(v5, "weightSampleTimeFrequency");
  v9 = v8;
  objc_msgSend(a1, "demoDataGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statisticsSampleGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "computeNoiseFromTime:stdDev:", a3, v7);
  a1[13] = v9 + v12 + a1[13];

  v13 = a1[15];
  objc_msgSend(a1, "demoDataGenerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "statisticsSampleGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weightSampleNoiseStdDev");
  objc_msgSend(v15, "computeNoiseFromTime:stdDev:", a3, v16);
  v18 = v17;

  objc_msgSend(a1, "demoDataGenerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "statisticsSampleGenerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weightDailyChangeStdDev");
  objc_msgSend(v20, "computeNoiseFromTime:stdDev:", a3, v21);
  v23 = v22;

  if (v23 + (double)(arc4random_uniform(0xAu) & 1) == 0.0)
    v24 = v18;
  else
    v24 = -v18;
  a1[15] = a1[15] + v24;
  objc_msgSend(a1, "demoDataGenerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (objc_msgSend(v25, "firstSampleDayOfYear") + (uint64_t)a3) % 365;

  objc_msgSend(v5, "weightGainHolidayDaysInYear");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "containsObject:", v28);

  if ((v29 & 1) != 0)
  {
    objc_msgSend(a1, "demoDataGenerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "statisticsSampleGenerator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "weightDailyChangeStdDev");
    objc_msgSend(v31, "computeNoiseFromTime:stdDev:", a3, v32);
    v34 = v33;

    v35 = fabs(v34) + a1[15];
    a1[15] = v35;
  }
  else
  {
    v35 = a1[15];
  }
  v36 = a1[16];
  objc_msgSend(v5, "weightChangePercentageMax");
  v38 = v36 * (1.0 - v37);
  v39 = a1[15];
  if (v35 >= v38)
  {
    v41 = a1[16];
    objc_msgSend(v5, "weightChangePercentageMax");
    if (v39 <= v41 * (v42 + 1.0))
      goto LABEL_12;
    v40 = a1[15] + vabdd_f64(a1[15], v13) * -2.0;
  }
  else
  {
    v40 = v39 + vabdd_f64(v13, v39) * 2.0;
  }
  a1[15] = v40;
LABEL_12:
  objc_msgSend(v5, "weightDailyMaxLoss");
  v44 = a1[15];
  if (vabdd_f64(v44, v13) > v43)
  {
    if (v44 <= v13)
      v43 = -v43;
    v44 = v13 + v43;
    a1[15] = v13 + v43;
  }
  v45 = __exp10(1.0);
  v46 = (double)(uint64_t)(v44 * v45) / v45;

  return v46;
}

- (double)lastHeightInCm
{
  return self->_lastHeightInCm;
}

- (double)lastWeightInKg
{
  return self->_lastWeightInKg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_girlsWeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_girlsWeightBirthTo36MonthsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_girlsHeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_girlsHeightBirthTo36MonthsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysWeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysWeightBirthTo36MonthsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysHeight2To20YearsGrowthCurve, 0);
  objc_storeStrong((id *)&self->_boysHeightBirthTo36MonthsGrowthCurve, 0);
}

@end

@implementation HDDemoDataOtherAndAdditionalSampleGenerator

- (HDDemoDataOtherAndAdditionalSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataOtherAndAdditionalSampleGenerator *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataOtherAndAdditionalSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextToothbrushingSampleTimeKey"));
    v5->_nextToothbrushingSampleTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NextHandwashingSampleTimeKey"));
    v5->_nextHandwashingSampleTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("nexttimeInDaylightSampleTimeKey"));
    v5->_nexttimeInDaylightSampleTime = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double nexttimeInDaylightSampleTime;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataOtherAndAdditionalSampleGenerator;
  v4 = a3;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextToothbrushingSampleTimeKey"), self->_nextToothbrushingSampleTime, v6.receiver, v6.super_class);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextHandwashingSampleTimeKey"), self->_nextHandwashingSampleTime);
    nexttimeInDaylightSampleTime = self->_nexttimeInDaylightSampleTime;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextToothbrushingSampleTimeKey"), 0.0, v6.receiver, v6.super_class);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NextHandwashingSampleTimeKey"), 0.0);
    nexttimeInDaylightSampleTime = 0.0;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("nexttimeInDaylightSampleTimeKey"), nexttimeInDaylightSampleTime);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  int v65;
  id v66;
  id v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  uint32_t v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  objc_super v113;

  v113.receiver = self;
  v113.super_class = (Class)HDDemoDataOtherAndAdditionalSampleGenerator;
  v11 = a7;
  v12 = a6;
  v13 = a3;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v113, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v13, v12, v11, a5, a5);
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v16;
  if (!self)
  {

    v102 = v14;
    v103 = v15;
    v104 = v17;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nextToothbrushingSampleTime <= a5)
  {
    v110 = v18;
    v19 = v18;
    objc_msgSend(v19, "components:fromDate:", 30, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHour:", 8);
    objc_msgSend(v20, "setMinute:", arc4random_uniform(0x3Bu));
    objc_msgSend(v19, "dateFromComponents:", v20);
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v19;
    objc_msgSend(v21, "components:fromDate:", 30, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHour:", 21);
    objc_msgSend(v22, "setMinute:", arc4random_uniform(0x3Bu));
    objc_msgSend(v21, "dateFromComponents:", v22);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDDemoDataOtherAndAdditionalSampleGenerator _generateToothbrushingSampleForDate:demoPerson:atTime:](self, v107, v14, a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDemoDataOtherAndAdditionalSampleGenerator _generateToothbrushingSampleForDate:demoPerson:atTime:](self, v105, v14, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectFromPhone:", v23);
    objc_msgSend(v17, "addObjectFromPhone:", v24);
    v25 = (void *)MEMORY[0x1E0C99D48];
    v26 = v15;
    objc_msgSend(v25, "currentCalendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "components:fromDate:", 254, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setHour:", objc_msgSend(v28, "hour") + 24);
    self->_nextToothbrushingSampleTime = floor(a5) + HDDemoData_timeFromNSDateComponents(v28);

    v18 = v110;
  }

  v29 = v14;
  v30 = v15;
  v31 = v17;
  if (self->_nextHandwashingSampleTime <= a5)
  {
    v111 = v31;
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sleepSampleGenerator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "isDemoPersonAwake:atTime:", v29, a5) & 1) == 0)
    {

      goto LABEL_9;
    }
    -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
    v108 = v17;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activitySampleGenerator");
    v35 = v30;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "_isDemoPersonSedentary:atTime:", v29, a5);

    v38 = v35;
    v17 = v108;

    if ((v37 & 1) == 0)
    {
      v39 = v29;
      v40 = v38;
      objc_msgSend(v39, "handwashingDurationMean");
      v42 = v41;
      objc_msgSend(v39, "handwashingDurationMeanStdDev");
      v44 = v43;

      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "statisticsSampleGenerator");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "computeNoiseFromTime:stdDev:", a5, v44);
      v48 = v42 + v47;

      objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48C8]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0CB6378];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v40, v48);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "categorySampleWithType:value:startDate:endDate:", v49, 0, v40, v51);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v111, "addObjectFromWatch:", v32);
      objc_msgSend(v39, "handwashingSampleFrequency");
      v53 = v52;
      objc_msgSend(v39, "handwashingSampleFrequencyStdDev");
      v55 = v54;
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "statisticsSampleGenerator");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", a5, v53, v55);
      v59 = v58;

      self->_nextHandwashingSampleTime = v59 + a5;
LABEL_9:

    }
  }
LABEL_10:

  v60 = v14;
  v61 = v15;
  v62 = v17;
  if (self)
  {
    if (self->_nexttimeInDaylightSampleTime <= a5)
    {
      -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "sleepSampleGenerator");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "isDemoPersonAwake:atTime:", v60, a5);

      if (v65)
      {
        v66 = v60;
        v67 = v61;
        objc_msgSend(v66, "timeInDaylightDurationMean");
        v69 = v68;
        objc_msgSend(v66, "timeInDaylightDurationMeanStdDev");
        v71 = v70;

        v72 = (double)arc4random_uniform(0x32u) / 100.0 + 5.0;
        v73 = v72 + (double)arc4random_uniform(5u);
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v74, "isDemoDataTimeInWeekend:calendar:", v75, a5);

        v112 = v66;
        v106 = v61;
        v77 = v67;
        if (v76)
          v73 = v73 + (double)arc4random_uniform(3u);
        v109 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v78 = arc4random_uniform(0x32u);
        v79 = (double)(v78 + arc4random_uniform(0x514u) + 150);
        v80 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "luxUnit");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "quantityWithUnit:doubleValue:", v81, v79);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setObject:forKeyedSubscript:", v82, *MEMORY[0x1E0CB5578]);

        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "statisticsSampleGenerator");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "computeNoiseFromTime:stdDev:", a5, v71);
        v86 = v69 + v85;

        objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D88]);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (void *)MEMORY[0x1E0CB6A40];
        v89 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "quantityWithUnit:doubleValue:", v90, v73);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v77, v86);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v87, v91, v77, v92, v109);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "addObjectFromWatch:", v93);
        objc_msgSend(v112, "timeInDaylightSampleFrequency");
        v95 = v94;
        objc_msgSend(v112, "timeInDaylightSampleFrequencyStdDev");
        v97 = v96;
        -[HDDemoDataBaseSampleGenerator demoDataGenerator](self, "demoDataGenerator");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "statisticsSampleGenerator");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "computeStatisticalTimeFromCurrentTime:mean:stdDev:", a5, v95, v97);
        v101 = v100;

        self->_nexttimeInDaylightSampleTime = v101 + a5;
        v61 = v106;
      }
    }
  }

}

- (id)_generateToothbrushingSampleForDate:(void *)a3 demoPerson:(double)a4 atTime:
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a2;
  objc_msgSend(v7, "toothbrushingDurationMean");
  v10 = v9;
  objc_msgSend(v7, "toothbrushingDurationMeanStdDev");
  v12 = v11;

  objc_msgSend(a1, "demoDataGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statisticsSampleGenerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "computeNoiseFromTime:stdDev:", a4, v12);
  v16 = v10 + v15;

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4998]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB6378];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "categorySampleWithType:value:startDate:endDate:", v17, 0, v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end

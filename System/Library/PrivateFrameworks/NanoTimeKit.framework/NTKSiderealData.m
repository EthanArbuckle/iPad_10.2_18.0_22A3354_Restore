@implementation NTKSiderealData

- (NTKSiderealData)initWithReferenceDate:(id)a3 referenceLocation:(id)a4 sunriseSunsetInfo:(id)a5 solarEvents:(id)a6 daytimeEvents:(id)a7 sectors:(id)a8 waypoints:(id)a9 altitudes:(float *)a10 useXR:(BOOL)a11
{
  id v18;
  id v19;
  NTKSiderealData *v20;
  NTKSiderealData *v21;
  uint64_t v22;
  uint64_t v23;
  NSData *gradientData;
  uint64_t v25;
  NSDate *sunsetTime;
  uint64_t v27;
  NSDate *sunriseTime;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v18 = a3;
  v19 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v30 = a9;
  v35.receiver = self;
  v35.super_class = (Class)NTKSiderealData;
  v20 = -[NTKSiderealData init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_referenceDate, a3);
    objc_storeStrong((id *)&v21->_daytimeEvents, a7);
    objc_storeStrong((id *)&v21->_sunriseSunsetInfo, a5);
    objc_storeStrong((id *)&v21->_sectors, a8);
    objc_storeStrong((id *)&v21->_waypoints, a9);
    objc_storeStrong((id *)&v21->_referenceLocation, a4);
    objc_storeStrong((id *)&v21->_solarEvents, a6);
    v22 = 0;
    v21->_useXR = a11;
    do
    {
      v21->_altitudes[v22] = a10[v22];
      ++v22;
    }
    while (v22 != 361);
    -[NTKSiderealData _generateGradientDataForXR:](v21, "_generateGradientDataForXR:", a11);
    v23 = objc_claimAutoreleasedReturnValue();
    gradientData = v21->_gradientData;
    v21->_gradientData = (NSData *)v23;

    -[NTKSiderealData _findSunsetTime](v21, "_findSunsetTime");
    v25 = objc_claimAutoreleasedReturnValue();
    sunsetTime = v21->_sunsetTime;
    v21->_sunsetTime = (NSDate *)v25;

    -[NTKSiderealData _findSunriseTime](v21, "_findSunriseTime");
    v27 = objc_claimAutoreleasedReturnValue();
    sunriseTime = v21->_sunriseTime;
    v21->_sunriseTime = (NSDate *)v27;

    v21->_sunsetFollowsSunrise = -[NTKSiderealData _computeSunsetFollowsSunrise](v21, "_computeSunsetFollowsSunrise");
    v21->_isConstantSunUpOrDown = -[NTKSiderealData _computeIsConstantSunUpOrDown](v21, "_computeIsConstantSunUpOrDown");
    v21->_currentSolarDayProgress = -1.0;
  }

  return v21;
}

- (NTKSiderealData)initWithCoder:(id)a3
{
  id v4;
  NTKSiderealData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *referenceDate;
  uint64_t v17;
  NSOrderedSet *daytimeEvents;
  uint64_t v19;
  CLKUIAlmanacTransitInfo *sunriseSunsetInfo;
  uint64_t v21;
  NSOrderedSet *sectors;
  uint64_t v23;
  NSArray *waypoints;
  uint64_t v25;
  CLLocation *referenceLocation;
  uint64_t v27;
  NSOrderedSet *solarEvents;
  id v29;
  const void *v30;
  unint64_t v31;
  size_t v32;
  uint64_t v33;
  NSData *gradientData;
  uint64_t v35;
  NSDate *sunsetTime;
  uint64_t v37;
  NSDate *sunriseTime;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NTKSiderealData;
  v5 = -[NTKSiderealData init](&v40, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E60];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    referenceDate = v5->_referenceDate;
    v5->_referenceDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("daytimeEvents"));
    v17 = objc_claimAutoreleasedReturnValue();
    daytimeEvents = v5->_daytimeEvents;
    v5->_daytimeEvents = (NSOrderedSet *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sunriseSunsetInfo"));
    v19 = objc_claimAutoreleasedReturnValue();
    sunriseSunsetInfo = v5->_sunriseSunsetInfo;
    v5->_sunriseSunsetInfo = (CLKUIAlmanacTransitInfo *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("sectors"));
    v21 = objc_claimAutoreleasedReturnValue();
    sectors = v5->_sectors;
    v5->_sectors = (NSOrderedSet *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("waypoints"));
    v23 = objc_claimAutoreleasedReturnValue();
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceLocation"));
    v25 = objc_claimAutoreleasedReturnValue();
    referenceLocation = v5->_referenceLocation;
    v5->_referenceLocation = (CLLocation *)v25;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("solarEvents"));
    v27 = objc_claimAutoreleasedReturnValue();
    solarEvents = v5->_solarEvents;
    v5->_solarEvents = (NSOrderedSet *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altitudes"));
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const void *)objc_msgSend(v29, "bytes");
    v31 = objc_msgSend(v29, "length");
    if (v31 >= 0x5A4)
      v32 = 1444;
    else
      v32 = v31;
    memcpy(v5->_altitudes, v30, v32);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gradientData"));
    v33 = objc_claimAutoreleasedReturnValue();
    gradientData = v5->_gradientData;
    v5->_gradientData = (NSData *)v33;

    v5->_useXR = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useXR"));
    -[NTKSiderealData _findSunsetTime](v5, "_findSunsetTime");
    v35 = objc_claimAutoreleasedReturnValue();
    sunsetTime = v5->_sunsetTime;
    v5->_sunsetTime = (NSDate *)v35;

    -[NTKSiderealData _findSunriseTime](v5, "_findSunriseTime");
    v37 = objc_claimAutoreleasedReturnValue();
    sunriseTime = v5->_sunriseTime;
    v5->_sunriseTime = (NSDate *)v37;

    v5->_sunsetFollowsSunrise = -[NTKSiderealData _computeSunsetFollowsSunrise](v5, "_computeSunsetFollowsSunrise");
    v5->_isConstantSunUpOrDown = -[NTKSiderealData _computeIsConstantSunUpOrDown](v5, "_computeIsConstantSunUpOrDown");
    v5->_currentSolarDayProgress = -1.0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *referenceDate;
  void *v5;
  id v6;

  referenceDate = self->_referenceDate;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", referenceDate, CFSTR("referenceDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_daytimeEvents, CFSTR("daytimeEvents"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sunriseSunsetInfo, CFSTR("sunriseSunsetInfo"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sectors, CFSTR("sectors"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_waypoints, CFSTR("waypoints"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_referenceLocation, CFSTR("referenceLocation"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_solarEvents, CFSTR("solarEvents"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_altitudes, 1444);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("altitudes"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_gradientData, CFSTR("gradientData"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_useXR, CFSTR("useXR"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)save
{
  void *v2;
  void *v3;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _NTKSiderealDataCacheArchivePath();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:", v3, 0);

  }
}

+ (id)loadCached
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  _NTKSiderealDataCacheArchivePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfFile:options:error:", v3, 1, 0);

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, 0);
    objc_msgSend(v5, "setDecodingFailurePolicy:", 0);
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)altitudeForProgress:(double)a3
{
  double v3;
  double v4;
  uint64_t v5;
  float v6;
  double v7;
  float *v8;
  float v9;
  float v10;
  float v11;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = fmax(a3, 0.0);
  if (v3 >= 1.0)
    v4 = 360.0;
  else
    v4 = v3 * 360.0;
  v5 = (uint64_t)v4;
  if ((uint64_t)v4 > 359)
  {
    v10 = self->_altitudes[v5];
    v11 = 1.0;
    v9 = v10;
  }
  else
  {
    v6 = v4;
    v7 = v4 - truncf(v6);
    v8 = (float *)((char *)self + 4 * v5);
    v9 = v8[2];
    v10 = v8[3];
    v11 = v7;
  }
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (BOOL)isDateInReferenceDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "isDate:inSameDayAsDate:", v5, self->_referenceDate);

  return (char)self;
}

- (id)interpolateBetweenCalendricalMidnights:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  NTKStartOfDayForDate(self->_referenceDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKEndOfDayForDate(self->_referenceDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenDates(v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_findSunsetTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSOrderedSet reverseObjectEnumerator](self->_solarEvents, "reverseObjectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type") == 6)
        {
          objc_msgSend(v6, "time");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            objc_msgSend(v6, "time");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)_findSunriseTime
{
  NSOrderedSet *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_solarEvents;
  v3 = (void *)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type", (_QWORD)v9) == 4)
        {
          objc_msgSend(v6, "time");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
            objc_msgSend(v6, "time");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
      }
      v3 = (void *)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)_computeSunsetFollowsSunrise
{
  NSOrderedSet *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_solarEvents;
  v3 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    while (1)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v14) == 4)
        {
          v9 = v4;
          v4 = v8;
          v10 = v5;
        }
        else
        {
          v9 = v5;
          v10 = v8;
          if (objc_msgSend(v8, "type") != 6)
            continue;
        }
        v11 = v8;

        v5 = v10;
      }
      v3 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v3)
      {

        if (v4 && v5)
        {
          objc_msgSend(v4, "time");
          v2 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "time");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v3) = -[NSOrderedSet compare:](v2, "compare:", v12) == -1;

          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
  }
  v5 = 0;
  v4 = 0;
LABEL_16:

LABEL_17:
  return v3;
}

- (BOOL)_computeIsConstantSunUpOrDown
{
  return -[CLKUIAlmanacTransitInfo constantSun](self->_sunriseSunsetInfo, "constantSun") != 0;
}

- (id)_generateGradientDataForXR:(BOOL)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  _OWORD *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  int v47;
  uint64_t v53;
  float v54;
  BOOL v55;
  _BOOL4 v56;
  float32x4_t *v57;
  float32x4_t v58;
  double v59;
  float v60;
  void *v61;
  double v62;
  float v63;
  float32x4_t v64;
  float32x4_t v65;
  double v66;
  float v67;
  double v68;
  void *v69;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  int16x4_t v77;
  _BYTE v78[6144];
  _QWORD v79[2];
  _QWORD v80[4];

  v3 = MEMORY[0x1E0C80A78](self, a2, a3);
  v5 = v4;
  v6 = (void *)v3;
  v80[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  +[NTKSiderealColorManager sharedInstance](NTKSiderealColorManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "dayGradientCurveP3");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x1E0CD3058];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v12;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v13;
    v14 = v80;
  }
  else
  {
    objc_msgSend(v8, "dayGradientColorCurves");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = 1041865114;
    LODWORD(v16) = 0.25;
    LODWORD(v17) = 0.5;
    LODWORD(v18) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v16, v15, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v12;
    LODWORD(v19) = 0.5;
    LODWORD(v20) = 0;
    LODWORD(v21) = 1.0;
    LODWORD(v22) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v13;
    v14 = v79;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = v78;
  do
  {
    objc_msgSend(v6, "altitudeForProgress:", (float)((float)(int)v24 / 127.0));
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = v27;
    LODWORD(v34) = v29;
    LODWORD(v35) = v31;
    objc_msgSend(v32, "rgbfColorForAltitude:", v33, v34, v35);
    *v25 = v36;

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = v27;
    LODWORD(v39) = v29;
    LODWORD(v40) = v31;
    objc_msgSend(v37, "rgbfColorForAltitude:", v38, v39, v40);
    v25[128] = v41;

    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = v27;
    LODWORD(v44) = v29;
    LODWORD(v45) = v31;
    objc_msgSend(v42, "rgbfColorForAltitude:", v43, v44, v45);
    v25[256] = v46;

    ++v24;
    ++v25;
  }
  while (v24 != 128);
  v47 = 0;
  __asm { FMOV            V0.4S, #1.0 }
  v72 = _Q0;
  v73 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
  do
  {
    v53 = 0;
    v54 = (float)((float)v47 / -63.0) + 1.0;
    v55 = v54 > 0.5 || v54 <= 0.05;
    v56 = v54 < 0.9 && v54 > 0.5;
    do
    {
      v57 = (float32x4_t *)&v78[v53];
      v58 = *(float32x4_t *)&v78[v53];
      if (v54 <= 0.05)
        goto LABEL_19;
      if (v55)
      {
        v58 = v57[256];
        if (!v56)
          goto LABEL_19;
        v71 = v57[128];
        v74 = v57[256];
        CLKMapFractionIntoRange();
        v60 = v59;
        objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v62 = v60;
        objc_msgSend(v61, "_solveForInput:", v62);
        v64 = v71;
        v65 = v74;
      }
      else
      {
        v75 = *(float32x4_t *)&v78[v53];
        v71 = v57[128];
        CLKMapFractionIntoRange();
        v67 = v66;
        objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v68 = v67;
        objc_msgSend(v61, "_solveForInput:", v68);
        v64 = v75;
        v65 = v71;
      }
      v76 = vmlaq_n_f32(v64, vsubq_f32(v65, v64), v63);

      v58 = v76;
LABEL_19:
      v58.i32[3] = 1.0;
      v77 = vmovn_s32((int32x4_t)vcvtq_u32_f32(vmulq_f32(vminnmq_f32(vmaxnmq_f32(v58, (float32x4_t)0), v72), v73)));
      objc_msgSend(v7, "appendBytes:length:", &v77, 8, *(_OWORD *)&v71);
      v53 += 16;
    }
    while (v53 != 2048);
    ++v47;
  }
  while (v47 != 64);
  v69 = (void *)objc_msgSend(v7, "copy");

  return v69;
}

- (BOOL)useXR
{
  return self->_useXR;
}

- (void)updateSunsetFilter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  id v22;

  -[NTKSiderealData sunriseSunsetInfo](self, "sunriseSunsetInfo");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealData sunriseTime](self, "sunriseTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealData sunsetTime](self, "sunsetTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealData referenceDate](self, "referenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKEndOfDayForDate(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceDate:", v4);
  v10 = v9;
  if (-[NTKSiderealData sunsetFollowsSunrise](self, "sunsetFollowsSunrise"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKSiderealData referenceDate](self, "referenceDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 160, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSecond:", 0);
    objc_msgSend(v13, "setHour:", 22);
    -[NTKSiderealData referenceDate](self, "referenceDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nextDateAfterDate:matchingComponents:options:", v14, v13, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 < 14400.0)
    {
LABEL_3:
      self->_sunsetFilterEnabled = 0;
LABEL_13:

      goto LABEL_14;
    }
    if (v8 >= 28800.0)
    {
      if (v8 >= 72000.0)
        goto LABEL_3;
      self->_sunsetFilterEnabled = 1;
      objc_msgSend(v4, "dateByAddingTimeInterval:", -14400.0);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      self->_sunsetFilterEnabled = 1;
      objc_msgSend(v22, "solarNoon");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;
    if (v10 >= 7200.0)
      v18 = v4;
    else
      v18 = v15;
    v19 = v18;
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v17);
    *(float *)&v20 = v20;
    self->_sunsetFilterRampUpStartProgress = *(float *)&v20;
    +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v19);
    *(float *)&v21 = v21;
    self->_sunsetFilterRampDownStartProgress = *(float *)&v21;

    goto LABEL_13;
  }
  self->_sunsetFilterEnabled = 0;
LABEL_14:

}

- (void)setSolarDayProgress:(double)a3
{
  float v5;
  float v6;
  float sunsetFilterRampUpStartProgress;
  float v8;
  float v9;

  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_currentSolarDayProgress = a3;
    v5 = 0.0;
    if (self->_sunsetFilterEnabled && self->_useXR)
    {
      v6 = a3;
      sunsetFilterRampUpStartProgress = self->_sunsetFilterRampUpStartProgress;
      v8 = (float)((float)(self->_sunsetFilterRampDownStartProgress - sunsetFilterRampUpStartProgress) + -0.083333)
         * 0.5;
      v9 = (float)((float)(v8 + 0.083333) / 0.083333)
         - fabsf((float)((float)((float)(v6 + -0.083333) - sunsetFilterRampUpStartProgress) - v8) / 0.083333);
      if (v9 < 0.0)
        v9 = 0.0;
      v5 = fminf(v9, 1.0);
    }
    self->_sunsetFilter = v5;
  }
}

- (id)applySunsetFilterToColor:(id)a3
{
  double v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  v3 = self->_sunsetFilter * -0.08 * 0.745;
  v7 = 0.0;
  v8 = 0.0;
  v5 = 0;
  v6 = 0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);
  v7 = v7 + v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)gradientWithSunsetFilterForDayProgress:(float)a3
{
  double v5;
  _BOOL4 useXR;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x1E0C80C00];
  -[NTKSiderealData updateSunsetFilter](self, "updateSunsetFilter");
  v5 = a3;
  -[NTKSiderealData setSolarDayProgress:](self, "setSolarDayProgress:", v5);
  useXR = self->_useXR;
  +[NTKSiderealColorManager sharedInstance](NTKSiderealColorManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (useXR)
    objc_msgSend(v7, "dayGradientCurveP3");
  else
    objc_msgSend(v7, "dayGradientColorCurves");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKSiderealData altitudeForProgress:](self, "altitudeForProgress:", v5);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = v11;
  LODWORD(v18) = v13;
  LODWORD(v19) = v15;
  objc_msgSend(v16, "rgbfColorForAltitude:", v17, v18, v19);
  CLKUIConvertToXRSRGBfFromRGBf();
  v39 = v20;

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = v11;
  LODWORD(v23) = v13;
  LODWORD(v24) = v15;
  objc_msgSend(v21, "rgbfColorForAltitude:", v22, v23, v24);
  CLKUIConvertToXRSRGBfFromRGBf();
  v40 = v25;

  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = v11;
  LODWORD(v28) = v13;
  LODWORD(v29) = v15;
  objc_msgSend(v26, "rgbfColorForAltitude:", v27, v28, v29);
  CLKUIConvertToXRSRGBfFromRGBf();
  v41 = v30;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)&v39, *((float *)&v39 + 1), *((float *)&v39 + 2), *((float *)&v39 + 3));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealData applySunsetFilterToColor:](self, "applySunsetFilterToColor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)&v40, *((float *)&v40 + 1), *((float *)&v40 + 2), *((float *)&v40 + 3));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealData applySunsetFilterToColor:](self, "applySunsetFilterToColor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(float *)&v41, *((float *)&v41 + 1), *((float *)&v41 + 2), *((float *)&v41 + 3));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSiderealData applySunsetFilterToColor:](self, "applySunsetFilterToColor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = v32;
  v42[1] = v34;
  v42[2] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (CLKUIAlmanacTransitInfo)sunriseSunsetInfo
{
  return self->_sunriseSunsetInfo;
}

- (NSOrderedSet)sectors
{
  return self->_sectors;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (BOOL)sunsetFollowsSunrise
{
  return self->_sunsetFollowsSunrise;
}

- (BOOL)isConstantSunUpOrDown
{
  return self->_isConstantSunUpOrDown;
}

- (NSDate)sunsetTime
{
  return self->_sunsetTime;
}

- (NSDate)sunriseTime
{
  return self->_sunriseTime;
}

- (NSOrderedSet)daytimeEvents
{
  return self->_daytimeEvents;
}

- (NSData)gradientData
{
  return self->_gradientData;
}

- (NSOrderedSet)solarEvents
{
  return self->_solarEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarEvents, 0);
  objc_storeStrong((id *)&self->_gradientData, 0);
  objc_storeStrong((id *)&self->_daytimeEvents, 0);
  objc_storeStrong((id *)&self->_sunriseTime, 0);
  objc_storeStrong((id *)&self->_sunsetTime, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_sectors, 0);
  objc_storeStrong((id *)&self->_sunriseSunsetInfo, 0);
}

@end

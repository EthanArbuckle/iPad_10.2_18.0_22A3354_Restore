@implementation ATXPredictionLocationMotionContext

- (ATXPredictionLocationMotionContext)initWithProto:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  ATXPredictionLocationMotionContext *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  ATXPredictionLocationMotionContext *v37;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;

  v4 = a3;
  if (!v4)
  {
LABEL_9:
    v23 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[ATXPredictionLocationMotionContext initWithProto:].cold.1((uint64_t)self, v24);

    goto LABEL_9;
  }
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0D80DE8]);
  objc_msgSend(v5, "currentLOI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithProto:", v7);

  v9 = objc_alloc(MEMORY[0x1E0D80DE8]);
  objc_msgSend(v5, "previousLOI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithProto:", v10);

  v12 = -[ATXPredictionLocationMotionContext _atxMotionTypeFromPBMotionType:](self, "_atxMotionTypeFromPBMotionType:", objc_msgSend(v5, "motionType"));
  if (objc_msgSend(v5, "hasCurrentLocation"))
  {
    objc_msgSend(v5, "currentLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPredictionLocationMotionContext _unarchiveCLLocation:](self, "_unarchiveCLLocation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v5, "locationEnabled");
      objc_msgSend(v5, "distanceFromHome");
      v17 = v16;
      objc_msgSend(v5, "distanceFromWork");
      v19 = v18;
      objc_msgSend(v5, "distanceFromSchool");
      v21 = v20;
      objc_msgSend(v5, "distanceFromGym");
      self = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v8, v11, v12, v14, v15, objc_msgSend(v5, "canPredictClipsGivenRecentMotion"), v17, v19, v21, v22);
      v23 = self;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    if ((objc_msgSend(v5, "hasGeohash") & 1) != 0
      || (objc_msgSend(v5, "hasCoarseGeohash") & 1) != 0
      || objc_msgSend(v5, "hasLargeGeohash"))
    {
      v25 = objc_msgSend(v5, "geohash");
      v26 = objc_msgSend(v5, "coarseGeohash");
      v27 = objc_msgSend(v5, "largeGeohash");
      v28 = objc_msgSend(v5, "locationEnabled");
      objc_msgSend(v5, "distanceFromHome");
      v30 = v29;
      objc_msgSend(v5, "distanceFromWork");
      v32 = v31;
      objc_msgSend(v5, "distanceFromSchool");
      v34 = v33;
      objc_msgSend(v5, "distanceFromGym");
      v36 = v35;
      BYTE1(v47) = objc_msgSend(v5, "canPredictClipsGivenRecentMotion");
      LOBYTE(v47) = v28;
      v37 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v8, v11, v12, v25, v26, v27, v30, v32, v34, v36, v47);
    }
    else
    {
      v39 = objc_msgSend(v5, "locationEnabled");
      objc_msgSend(v5, "distanceFromHome");
      v41 = v40;
      objc_msgSend(v5, "distanceFromWork");
      v43 = v42;
      objc_msgSend(v5, "distanceFromSchool");
      v45 = v44;
      objc_msgSend(v5, "distanceFromGym");
      v37 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v8, v11, v12, 0, v39, objc_msgSend(v5, "canPredictClipsGivenRecentMotion"), v41, v43, v45, v46);
    }
    self = v37;
    v23 = self;
  }

LABEL_18:
  return v23;
}

- (ATXPredictionLocationMotionContext)initWithCurrentLOI:(id)a3 previousLOI:(id)a4 motionType:(int64_t)a5 geohash:(int64_t)a6 coarseGeohash:(int64_t)a7 largeGeohash:(int64_t)a8 locationEnabled:(BOOL)a9 distanceFromHome:(double)a10 distanceFromWork:(double)a11 distanceFromSchool:(double)a12 distanceFromGym:(double)a13 canPredictClipsGivenRecentMotion:(BOOL)a14
{
  id v25;
  id v26;
  ATXPredictionLocationMotionContext *v27;
  ATXPredictionLocationMotionContext *v28;
  objc_super v30;

  v25 = a3;
  v26 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ATXPredictionLocationMotionContext;
  v27 = -[ATXPredictionLocationMotionContext init](&v30, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_previousLOI, a4);
    objc_storeStrong((id *)&v28->_currentLOI, a3);
    v28->_motionType = a5;
    v28->_geohash = a6;
    v28->_coarseGeohash = a7;
    v28->_largeGeohash = a8;
    v28->_locationEnabled = a9;
    v28->_distanceFromHomeOfCurrentLocationInMeters = a10;
    v28->_distanceFromWorkOfCurrentLocationInMeters = a11;
    v28->_distanceFromSchoolOfCurrentLocationInMeters = a12;
    v28->_distanceFromGymOfCurrentLocationInMeters = a13;
    v28->_canPredictClipsGivenRecentMotion = a14;
  }

  return v28;
}

- (int64_t)_atxMotionTypeFromPBMotionType:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 4)
    return v3 + 1;
  else
    return 0;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[ATXLocationOfInterest proto](self->_currentLOI, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentLOI:", v4);

  -[ATXLocationOfInterest proto](self->_previousLOI, "proto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviousLOI:", v5);

  objc_msgSend(v3, "setMotionType:", -[ATXPredictionLocationMotionContext _pbMotionTypeFromATXMotionType:](self, "_pbMotionTypeFromATXMotionType:", self->_motionType));
  objc_msgSend(v3, "setGeohash:", self->_geohash);
  objc_msgSend(v3, "setCoarseGeohash:", self->_coarseGeohash);
  objc_msgSend(v3, "setLargeGeohash:", self->_largeGeohash);
  objc_msgSend(v3, "setLocationEnabled:", self->_locationEnabled);
  objc_msgSend(v3, "setDistanceFromHome:", self->_distanceFromHomeOfCurrentLocationInMeters);
  objc_msgSend(v3, "setDistanceFromWork:", self->_distanceFromWorkOfCurrentLocationInMeters);
  objc_msgSend(v3, "setDistanceFromSchool:", self->_distanceFromSchoolOfCurrentLocationInMeters);
  objc_msgSend(v3, "setDistanceFromGym:", self->_distanceFromGymOfCurrentLocationInMeters);
  objc_msgSend(v3, "setCanPredictClipsGivenRecentMotion:", self->_canPredictClipsGivenRecentMotion);
  return v3;
}

- (int)_pbMotionTypeFromATXMotionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4)
    return a3;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLOI, 0);
  objc_storeStrong((id *)&self->_previousLOI, 0);
}

- (ATXPredictionLocationMotionContext)initWithCurrentLOI:(id)a3 previousLOI:(id)a4 motionType:(int64_t)a5 currentLocation:(id)a6 locationEnabled:(BOOL)a7 distanceFromHome:(double)a8 distanceFromWork:(double)a9 distanceFromSchool:(double)a10 distanceFromGym:(double)a11 canPredictClipsGivenRecentMotion:(BOOL)a12
{
  _BOOL8 v17;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  ATXPredictionLocationMotionContext *v28;
  uint64_t v30;

  v17 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  v25 = +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingGeohashForLocation:locationEnabled:", v22, v17);
  v26 = +[ATXPrivacyPreservingLocationHash privacyPreservingCoarseGeohashForLocation:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingCoarseGeohashForLocation:locationEnabled:", v22, v17);
  v27 = +[ATXPrivacyPreservingLocationHash privacyPreservingZoom7GeohashForLocation:locationEnabled:](ATXPrivacyPreservingLocationHash, "privacyPreservingZoom7GeohashForLocation:locationEnabled:", v22, v17);

  BYTE1(v30) = a12;
  LOBYTE(v30) = v17;
  v28 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v24, v23, a5, v25, v26, v27, a8, a9, a10, a11, v30);

  return v28;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ATXPredictionLocationMotionContext jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)jsonDict
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[11];
  _QWORD v26[13];

  v26[11] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("currentLOI");
  -[ATXLocationOfInterest description](self->_currentLOI, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("nil");
  v26[0] = v4;
  v25[1] = CFSTR("previousLOI");
  -[ATXLocationOfInterest description](self->_previousLOI, "description");
  v5 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("nil");
  v26[1] = v6;
  v25[2] = CFSTR("motionType");
  objc_msgSend(MEMORY[0x1E0D80E10], "stringForMotionType:", self->_motionType);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v22;
  v25[3] = CFSTR("geohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_geohash);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v21;
  v25[4] = CFSTR("coarseGeohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_coarseGeohash);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v20;
  v25[5] = CFSTR("largeGeohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_largeGeohash);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("NO");
  if (self->_locationEnabled)
    v9 = CFSTR("YES");
  v26[5] = v7;
  v26[6] = v9;
  v25[6] = CFSTR("locationEnabled");
  v25[7] = CFSTR("distanceFromHome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromHomeOfCurrentLocationInMeters);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v11;
  v25[8] = CFSTR("distanceFromWork");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromWorkOfCurrentLocationInMeters);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v13;
  v25[9] = CFSTR("distanceFromSchool");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromSchoolOfCurrentLocationInMeters);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v15;
  v25[10] = CFSTR("distanceFromGym");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromGymOfCurrentLocationInMeters);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (ATXPredictionLocationMotionContext)initWithProtoData:(id)a3
{
  id v4;
  ATXPBPredictionLocationMotionContext *v5;
  ATXPredictionLocationMotionContext *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBPredictionLocationMotionContext initWithData:]([ATXPBPredictionLocationMotionContext alloc], "initWithData:", v4);

    self = -[ATXPredictionLocationMotionContext initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXPredictionLocationMotionContext proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_unarchiveCLLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  BOOL v8;
  id v10;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1CAA48B6C]();
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    objc_autoreleasePoolPop(v4);
    v7 = 0;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
      v7 = v5;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXPredictionLocationMotionContext *v4;
  ATXPredictionLocationMotionContext *v5;
  BOOL v6;

  v4 = (ATXPredictionLocationMotionContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPredictionLocationMotionContext isEqualToATXPredictionLocationMotionContext:](self, "isEqualToATXPredictionLocationMotionContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXPredictionLocationMotionContext:(id)a3
{
  id *v4;
  ATXLocationOfInterest *currentLOI;
  ATXLocationOfInterest *v6;
  ATXLocationOfInterest *v7;
  ATXLocationOfInterest *v8;
  char v9;
  ATXLocationOfInterest *previousLOI;
  ATXLocationOfInterest *v11;
  ATXLocationOfInterest *v12;
  ATXLocationOfInterest *v13;
  char v14;
  int64_t motionType;
  BOOL v16;

  v4 = (id *)a3;
  currentLOI = self->_currentLOI;
  v6 = (ATXLocationOfInterest *)v4[3];
  if (currentLOI == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = currentLOI;
    v9 = -[ATXLocationOfInterest isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_18;
  }
  previousLOI = self->_previousLOI;
  v11 = (ATXLocationOfInterest *)v4[2];
  if (previousLOI == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = previousLOI;
    v14 = -[ATXLocationOfInterest isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_18;
  }
  motionType = self->_motionType;
  if (motionType == objc_msgSend(v4, "motionType")
    && (id)self->_geohash == v4[5]
    && (id)self->_coarseGeohash == v4[6]
    && (id)self->_largeGeohash == v4[7]
    && self->_locationEnabled == *((unsigned __int8 *)v4 + 8)
    && self->_distanceFromHomeOfCurrentLocationInMeters == *((double *)v4 + 8)
    && self->_distanceFromWorkOfCurrentLocationInMeters == *((double *)v4 + 9)
    && self->_distanceFromSchoolOfCurrentLocationInMeters == *((double *)v4 + 10)
    && self->_distanceFromGymOfCurrentLocationInMeters == *((double *)v4 + 11))
  {
    v16 = self->_canPredictClipsGivenRecentMotion == *((unsigned __int8 *)v4 + 9);
    goto LABEL_19;
  }
LABEL_18:
  v16 = 0;
LABEL_19:

  return v16;
}

- (ATXLocationOfInterest)previousLOI
{
  return self->_previousLOI;
}

- (ATXLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (int64_t)motionType
{
  return self->_motionType;
}

- (int64_t)geohash
{
  return self->_geohash;
}

- (int64_t)coarseGeohash
{
  return self->_coarseGeohash;
}

- (int64_t)largeGeohash
{
  return self->_largeGeohash;
}

- (BOOL)locationEnabled
{
  return self->_locationEnabled;
}

- (double)distanceFromHomeOfCurrentLocationInMeters
{
  return self->_distanceFromHomeOfCurrentLocationInMeters;
}

- (double)distanceFromWorkOfCurrentLocationInMeters
{
  return self->_distanceFromWorkOfCurrentLocationInMeters;
}

- (double)distanceFromSchoolOfCurrentLocationInMeters
{
  return self->_distanceFromSchoolOfCurrentLocationInMeters;
}

- (double)distanceFromGymOfCurrentLocationInMeters
{
  return self->_distanceFromGymOfCurrentLocationInMeters;
}

- (BOOL)canPredictClipsGivenRecentMotion
{
  return self->_canPredictClipsGivenRecentMotion;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionLocationMotionContext proto", (uint8_t *)&v5, 0xCu);

}

@end

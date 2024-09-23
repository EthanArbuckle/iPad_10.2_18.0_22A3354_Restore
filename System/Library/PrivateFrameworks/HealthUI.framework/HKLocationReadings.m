@implementation HKLocationReadings

- (HKLocationReadings)initWithLocations:(id)a3 workout:(id)a4 isSmoothed:(BOOL)a5
{
  id v8;
  id v9;
  HKLocationReadings *v10;
  HKLocationReadings *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKLocationReadings;
  v10 = -[HKLocationReadings init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workout, a4);
    v11->_isSmoothed = a5;
    -[HKLocationReadings _filterLocationsByActiveTimePeriod:](v11, "_filterLocationsByActiveTimePeriod:", v8);
    -[HKLocationReadings _calculateSpeeds](v11, "_calculateSpeeds");
  }

  return v11;
}

- (HKLocationReadings)initWithLocation:(id)a3 workout:(id)a4
{
  id v6;
  id v7;
  HKLocationReadings *v8;
  uint64_t v9;
  NSArray *allValidLocations;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKLocationReadings;
  v8 = -[HKLocationReadings init](&v12, sel_init);
  if (v8)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    allValidLocations = v8->_allValidLocations;
    v8->_allValidLocations = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_workout, a4);
  }

  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Locations count: %zd."), -[HKLocationReadings count](self, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKLocationReadings inOrderLocationArrays](self, "inOrderLocationArrays");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v21)
  {
    v4 = 0;
    v20 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v5);
        objc_msgSend(v3, "appendFormat:", CFSTR("---- paused."));
        if (objc_msgSend(v6, "count"))
        {
          v22 = v5;
          v7 = 0;
          do
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKLocationReadings allValidLocations](self, "allValidLocations");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v4 + v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "coordinate");
            v12 = v11;
            objc_msgSend(v8, "coordinate");
            v14 = v13;
            objc_msgSend(v10, "coordinate");
            v16 = v15;
            objc_msgSend(v10, "coordinate");
            objc_msgSend(v3, "appendFormat:", CFSTR("%zd. %zd. from (%f,%f) vs (%f,%f)."), v7, v4 + v7, v12, v14, v16, v17);

            ++v7;
          }
          while (v7 < objc_msgSend(v6, "count"));
          v4 += v7;
          v5 = v22;
        }
        ++v5;
      }
      while (v5 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v21);
  }

  return v3;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSArray count](self->_allValidLocations, "count");
  if (-[HKLocationReadings isSmoothed](self, "isSmoothed"))
    v5 = CFSTR("smoothed ");
  else
    v5 = &stru_1E9C4C428;
  v9.receiver = self;
  v9.super_class = (Class)HKLocationReadings;
  -[HKLocationReadings description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%zd %@locations) %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_calculateSpeeds
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&self->_topSpeed = xmmword_1D7B80FE0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_allValidLocations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v4)
  {

LABEL_17:
    v17 = 0.0;
    goto LABEL_18;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v19;
  v8 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v10, "speed", (_QWORD)v18);
      if (v11 >= 0.0)
      {
        objc_msgSend(v10, "speed");
        if (v12 > self->_topSpeed)
        {
          objc_msgSend(v10, "speed");
          self->_topSpeed = v13;
        }
        objc_msgSend(v10, "speed");
        if (v14 < self->_bottomSpeed)
        {
          objc_msgSend(v10, "speed");
          self->_bottomSpeed = v15;
        }
        objc_msgSend(v10, "speed");
        v8 = v8 + v16;
        ++v6;
      }
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v5);

  if (v6 < 1)
    goto LABEL_17;
  v17 = v8 / (double)v6;
LABEL_18:
  self->_averageSpeed = v17;
}

- (void)_filterLocationsByActiveTimePeriod:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKWorkout *workout;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  HKLocationReadings *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  int64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  workout = self->_workout;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke;
  v15[3] = &unk_1E9C40300;
  v20 = &v21;
  v8 = v4;
  v16 = v8;
  v9 = v6;
  v17 = v9;
  v10 = v5;
  v18 = v10;
  v19 = self;
  -[HKWorkout _enumerateActiveTimePeriods:](workout, "_enumerateActiveTimePeriods:", v15);
  objc_storeStrong((id *)&self->_inOrderLocationArrays, v6);
  objc_storeStrong((id *)&self->_allValidLocations, v5);
  _HKInitializeLogging();
  v11 = (id)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[HKLocationReadings count](self, "count");
    v13 = v22[3];
    -[HKWorkout UUID](self->_workout, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v26 = v12;
    v27 = 2048;
    v28 = v13;
    v29 = 2112;
    v30 = v14;
    _os_log_impl(&dword_1D7813000, v11, OS_LOG_TYPE_DEFAULT, "[routes] HKLocationReadings: %ld locations are within the %ld active periods for workout ID %@", buf, 0x20u);

  }
  _Block_object_dispose(&v21, 8);

}

void __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v7 = (void *)MEMORY[0x1E0CB3880];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke_2;
  v22 = &unk_1E9C402D8;
  v8 = v5;
  v23 = v8;
  v9 = v6;
  v24 = v9;
  objc_msgSend(v7, "predicateWithBlock:", &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:", v10, v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v11);
  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "count");
  v13 = v12 - objc_msgSend(v11, "count");
  if (v13 >= 1)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v16 = *(void **)(*(_QWORD *)(a1 + 56) + 16);
      v17 = v14;
      objc_msgSend(v16, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v26 = v13;
      v27 = 2048;
      v28 = v15;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v18;
      _os_log_impl(&dword_1D7813000, v17, OS_LOG_TYPE_DEFAULT, "[routes] HKLocationReadings: %ld locations are out of range for active workout period %ld (%@ - %@) and have been filtered out for workout ID %@", buf, 0x34u);

    }
  }

}

BOOL __57__HKLocationReadings__filterLocationsByActiveTimePeriod___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v8;

  objc_msgSend(a2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  if (v5 < v6)
    return 0;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  return v5 <= v8;
}

- (int64_t)count
{
  return -[NSArray count](self->_allValidLocations, "count");
}

- (id)firstObject
{
  return -[NSArray firstObject](self->_allValidLocations, "firstObject");
}

- (id)lastObject
{
  return -[NSArray lastObject](self->_allValidLocations, "lastObject");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isSmoothed;
  id v5;

  isSmoothed = self->_isSmoothed;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isSmoothed, CFSTR("isSmoothed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workout, CFSTR("workout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allValidLocations, CFSTR("allValidLocations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inOrderLocationArrays, CFSTR("inOrderLocationArrays"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("averageSpeed"), self->_averageSpeed);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("topSpeed"), self->_topSpeed);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("bottomSpeed"), self->_bottomSpeed);

}

- (HKLocationReadings)initWithCoder:(id)a3
{
  id v4;
  HKLocationReadings *v5;
  uint64_t v6;
  HKWorkout *workout;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *allValidLocations;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *inOrderLocationArrays;
  double v19;
  double v20;
  double v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKLocationReadings;
  v5 = -[HKLocationReadings init](&v23, sel_init);
  if (v5)
  {
    v5->_isSmoothed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSmoothed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workout"));
    v6 = objc_claimAutoreleasedReturnValue();
    workout = v5->_workout;
    v5->_workout = (HKWorkout *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("allValidLocations"));
    v11 = objc_claimAutoreleasedReturnValue();
    allValidLocations = v5->_allValidLocations;
    v5->_allValidLocations = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("inOrderLocationArrays"));
    v17 = objc_claimAutoreleasedReturnValue();
    inOrderLocationArrays = v5->_inOrderLocationArrays;
    v5->_inOrderLocationArrays = (NSArray *)v17;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("averageSpeed"));
    v5->_averageSpeed = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("topSpeed"));
    v5->_topSpeed = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bottomSpeed"));
    v5->_bottomSpeed = v21;
  }

  return v5;
}

- (BOOL)isSmoothed
{
  return self->_isSmoothed;
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (NSArray)allValidLocations
{
  return self->_allValidLocations;
}

- (NSArray)inOrderLocationArrays
{
  return self->_inOrderLocationArrays;
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (double)topSpeed
{
  return self->_topSpeed;
}

- (double)bottomSpeed
{
  return self->_bottomSpeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inOrderLocationArrays, 0);
  objc_storeStrong((id *)&self->_allValidLocations, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end

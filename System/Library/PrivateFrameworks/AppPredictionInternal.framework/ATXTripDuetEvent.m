@implementation ATXTripDuetEvent

- (ATXTripDuetEvent)initWithOrigin:(int)a3 destination:(int)a4 durationAtOrigin:(double)a5 startDate:(id)a6 endDate:(id)a7
{
  ATXTripDuetEvent *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATXTripDuetEvent;
  result = -[ATXDuetEvent initWithStartDate:endDate:](&v11, sel_initWithStartDate_endDate_, a6, a7);
  if (result)
  {
    result->_origin = a3;
    result->_destination = a4;
    result->_durationAtOrigin = a5;
  }
  return result;
}

- (ATXTripDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  void *v4;
  void *v5;
  ATXTripDuetEvent *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfInterestAtCurrentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:](self, "initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:", v5, v3);
  return v6;
}

- (ATXTripDuetEvent)initWithCurrentContextStoreValuesWithOriginLOI:(id)a3 ignoreBeforeDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  ATXTripDuetEvent *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v38;
  void *v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForPredictedLocationOfInterestTransitions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v38 = v11;
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D15C58], "locationOfInterestTypeKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

          v40 = -[ATXTripDuetEvent rtLocationToBMSemanticLocation:](self, "rtLocationToBMSemanticLocation:", v17);
          objc_msgSend(MEMORY[0x1E0D15C58], "transitionWithinTimeIntervalKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v14;
          objc_msgSend(v14, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;

          objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForPredictedLocationOfInterestTransitions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastModifiedDateForContextualKeyPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "dateByAddingTimeInterval:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7
            && (objc_msgSend(v7, "laterDate:", v24),
                v25 = (id)objc_claimAutoreleasedReturnValue(),
                v25,
                v25 == v7))
          {
            __atxlog_handle_default();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v24;
              _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "Ignoring current predicted transition because expected commute date is in the past: %@", buf, 0xCu);
            }

            v29 = 0;
            v11 = v38;
          }
          else
          {
            if (v6)
              v26 = -[ATXTripDuetEvent rtLocationToBMSemanticLocation:](self, "rtLocationToBMSemanticLocation:", objc_msgSend(v6, "type"));
            else
              v26 = 0;
            v11 = v38;
            __atxlog_handle_default();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v42 = (void *)(int)v40;
              v43 = 2112;
              v44 = v24;
              _os_log_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_DEFAULT, "Current expected commute to %lu at %@", buf, 0x16u);
            }

            self = -[ATXTripDuetEvent initWithOrigin:destination:durationAtOrigin:startDate:endDate:](self, "initWithOrigin:destination:durationAtOrigin:startDate:endDate:", v26, v40, v24, v24, 0.0);
            v29 = self;
          }

          goto LABEL_31;
        }
        __atxlog_handle_default();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:].cold.3();

        v31 = (void *)MEMORY[0x1E0C99DA0];
        v32 = *MEMORY[0x1E0C99768];
        v33 = CFSTR("ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' contained no elements.");
      }
      else
      {
        __atxlog_handle_default();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:].cold.2();

        v31 = (void *)MEMORY[0x1E0C99DA0];
        v32 = *MEMORY[0x1E0C99768];
        v33 = CFSTR("ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is an empty NSArray.");
      }
      objc_msgSend(v31, "raise:format:", v32, v33);
      v29 = 0;
LABEL_31:

      goto LABEL_32;
    }
    __atxlog_handle_default();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:].cold.4();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is not an NSArray."));
  }
  else
  {
    __atxlog_handle_default();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ATXTripDuetEvent initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:].cold.1();

  }
  v29 = 0;
LABEL_32:

  return v29;
}

- (int)rtLocationToBMSemanticLocation:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (id)convertToUpcomingCommuteEventWithWindowDuration:(double)a3
{
  double durationAtOrigin;
  double v5;
  double v6;
  void *v7;
  void *v8;
  ATXTripDuetEvent *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  ATXTripDuetEvent *v15;

  durationAtOrigin = self->_durationAtOrigin;
  if (durationAtOrigin <= a3)
    v5 = self->_durationAtOrigin;
  else
    v5 = a3;
  if (durationAtOrigin <= 0.0)
    v6 = a3;
  else
    v6 = v5;
  -[ATXDuetEvent startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [ATXTripDuetEvent alloc];
  v10 = -[ATXTripDuetEvent origin](self, "origin");
  v11 = -[ATXTripDuetEvent destination](self, "destination");
  -[ATXTripDuetEvent durationAtOrigin](self, "durationAtOrigin");
  v13 = v12;
  -[ATXDuetEvent startDate](self, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXTripDuetEvent initWithOrigin:destination:durationAtOrigin:startDate:endDate:](v9, "initWithOrigin:destination:durationAtOrigin:startDate:endDate:", v10, v11, v8, v14, v13);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  ATXTripDuetEvent *v4;
  ATXTripDuetEvent *v5;
  BOOL v6;

  v4 = (ATXTripDuetEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXTripDuetEvent isEqualToATXTripDuetEvent:](self, "isEqualToATXTripDuetEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXTripDuetEvent:(id)a3
{
  id v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = a3;
  v5 = -[ATXTripDuetEvent origin](self, "origin");
  if (v5 == objc_msgSend(v4, "origin")
    && (v6 = -[ATXTripDuetEvent destination](self, "destination"), v6 == objc_msgSend(v4, "destination")))
  {
    -[ATXDuetEvent startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDate:", v8))
    {
      -[ATXDuetEvent endDate](self, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToDate:", v10))
      {
        -[ATXTripDuetEvent durationAtOrigin](self, "durationAtOrigin");
        v12 = v11;
        objc_msgSend(v4, "durationAtOrigin");
        v14 = v12 == v13;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[ATXTripDuetEvent origin](self, "origin");
  v5 = -[ATXTripDuetEvent destination](self, "destination");
  -[ATXDuetEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTripDuetEvent durationAtOrigin](self, "durationAtOrigin");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXTripDuetEvent origin: %lu, dest: %lu, startDate: %@, endDate: %@, durationAtOrigin: %f"), v4, v5, v6, v7, v8);

  return v9;
}

- (id)identifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu to %lu"), -[ATXTripDuetEvent origin](self, "origin"), -[ATXTripDuetEvent destination](self, "destination"));
}

- (int)origin
{
  return self->_origin;
}

- (int)destination
{
  return self->_destination;
}

- (double)durationAtOrigin
{
  return self->_durationAtOrigin;
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is an empty NSArray.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' contained no elements.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ContextStore's 'keyPathForPredictedLocationOfInterestTransitions' is not an NSArray.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

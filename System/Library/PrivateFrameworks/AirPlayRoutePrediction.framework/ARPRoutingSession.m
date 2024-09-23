@implementation ARPRoutingSession

+ (double)routingSessionTimeout
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AirPlayRoutePrediction"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("RoutingSessionTimeout"));
  if (v3 <= 0.0)
    v4 = 10800.0;
  else
    v4 = v3;

  return v4;
}

+ (double)minimumRoutingEventDuration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AirPlayRoutePrediction"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("MinimumRoutingEventDuration"));
  if (v3 <= 0.0)
    v4 = 30.0;
  else
    v4 = v3;

  return v4;
}

+ (double)microLocationCorrelationGracePeriod
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AirPlayRoutePrediction"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("MicroLocationCorrelationGracePeriod"));
  if (v3 <= 0.0)
    v4 = 20.0;
  else
    v4 = v3;

  return v4;
}

+ (id)routingSessionsFromNowPlayingEvents:(id)a3 microLocationEvents:(id)a4 routingSessionTimeout:(double)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  ARPLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v28 = objc_msgSend(v7, "count");
    v29 = 2048;
    v30 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1DD793000, v9, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: nowPlayingEvents: %lu microLocationEvents: %lu", buf, 0x16u);
  }

  +[ARPRoutePredictor defaultMicroLocationSimilarityThreshold](ARPRoutePredictor, "defaultMicroLocationSimilarityThreshold");
  v11 = v10;
  +[ARPRoutingSession microLocationCorrelationGracePeriod](ARPRoutingSession, "microLocationCorrelationGracePeriod");
  v13 = v12;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v28 = v11;
    v29 = 2048;
    v30 = v13;
    _os_log_impl(&dword_1DD793000, v9, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: defaultMicroLocationSimilarityThreshold: %f microLocationCorrelationGracePeriod: %f", buf, 0x16u);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "reverseObjectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke;
  v21[3] = &unk_1EA7D4370;
  v22 = v8;
  v23 = v14;
  v24 = v13;
  v25 = a5;
  v26 = v11;
  v17 = v14;
  v18 = v8;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v21);

  v19 = (void *)objc_msgSend(v17, "copy");
  return v19;
}

void __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  ARPRoutingSession *v31;
  void *v32;
  void *v33;
  void *v34;
  ARPRoutingSession *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = a2;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AA0], "outputDeviceIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ARPExtractLongFormVideoOutputDeviceIDs(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_61);
    v9 = 0;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v8 ? v8 - 1 : 0;
      v11 = objc_msgSend(*(id *)(a1 + 32), "count");
      v9 = 0;
      v12 = v10 + 2 >= v11 ? v11 : v10 + 2;
      if (v10 < v12)
      {
        v9 = 0;
        v13 = *(double *)(a1 + 48);
        do
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceDate:", v16);
          v18 = fabs(v17);

          if (v18 < v13)
          {
            v19 = v14;

            v9 = v19;
            v13 = v18;
          }

          ++v10;
        }
        while (v10 < v12);
      }
    }
    objc_msgSend(v9, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15A88], "probabilityVector");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v22)
    {
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0x7FFFFFFFFFFFFFFFLL;
      v23 = *(void **)(a1 + 40);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke_3;
      v42[3] = &unk_1EA7D4348;
      v24 = v3;
      v43 = v24;
      v47 = *(_QWORD *)(a1 + 56);
      v25 = v41;
      v44 = v25;
      v40 = v22;
      v26 = v22;
      v48 = *(_QWORD *)(a1 + 64);
      v45 = v26;
      v46 = &v49;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v42);
      if (v50[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v24, "startDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v27, "initWithStartDate:endDate:", v28, v29);

        v31 = -[ARPRoutingSession initWithOutputDeviceID:interval:microLocationProbabilityVector:]([ARPRoutingSession alloc], "initWithOutputDeviceID:interval:microLocationProbabilityVector:", v25, v30, v26);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v30, "interval");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "startDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v38, "initWithStartDate:endDate:", v33, v34);

        v35 = [ARPRoutingSession alloc];
        objc_msgSend(v30, "outputDeviceID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "microLocationProbabilityVector");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[ARPRoutingSession initWithOutputDeviceID:interval:microLocationProbabilityVector:](v35, "initWithOutputDeviceID:interval:microLocationProbabilityVector:", v36, v39, v37);

        objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", v50[3]);
      }

      objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v31, 0);
      _Block_object_dispose(&v49, 8);
      v22 = v40;
    }

  }
}

uint64_t __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __99__ARPRoutingSession_routingSessionsFromNowPlayingEvents_microLocationEvents_routingSessionTimeout___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v10);
  v12 = v11;
  v13 = *(double *)(a1 + 64);

  if (v12 > v13)
  {
    ARPLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "interval");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 64);
      v24 = 138412802;
      v25 = v15;
      v26 = 2112;
      v27 = v17;
      v28 = 2048;
      v29 = v18;
      _os_log_impl(&dword_1DD793000, v14, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: stopping enumeration of sessions since: [nowPlayingEvent.startDate (%@) timeIntervalSinceDate:session.interval.endDate (%@)] > routingSessionTimeout (%f)", (uint8_t *)&v24, 0x20u);

    }
LABEL_11:
    *a4 = 1;
    goto LABEL_12;
  }
  v19 = *(void **)(a1 + 40);
  objc_msgSend(v7, "outputDeviceID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v19, "isEqualToString:", v20);

  if ((_DWORD)v19)
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Speaker"))
      || (objc_msgSend(v7, "microLocationProbabilityVector"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = ARPMicroLocationSimilarity(v21, *(void **)(a1 + 48)),
          v21,
          v22 >= *(double *)(a1 + 72)))
    {
      ARPLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = 134217984;
        v25 = a3;
        _os_log_impl(&dword_1DD793000, v23, OS_LOG_TYPE_INFO, "routingSessionsFromNowPlayingEvents: found sessionIndex: %lu", (uint8_t *)&v24, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (ARPRoutingSession)initWithOutputDeviceID:(id)a3 interval:(id)a4 microLocationProbabilityVector:(id)a5
{
  id v8;
  id v9;
  id v10;
  ARPRoutingSession *v11;
  uint64_t v12;
  NSString *outputDeviceID;
  uint64_t v14;
  NSDateInterval *interval;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ARPRoutingSession;
  v11 = -[ARPRoutingSession init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    outputDeviceID = v11->_outputDeviceID;
    v11->_outputDeviceID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    interval = v11->_interval;
    v11->_interval = (NSDateInterval *)v14;

    objc_storeStrong((id *)&v11->_microLocationProbabilityVector, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ARPRoutingSession *v4;
  void *v5;
  void *v6;
  void *v7;
  ARPRoutingSession *v8;

  v4 = +[ARPRoutingSession allocWithZone:](ARPRoutingSession, "allocWithZone:", a3);
  -[ARPRoutingSession outputDeviceID](self, "outputDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutingSession interval](self, "interval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPRoutingSession microLocationProbabilityVector](self, "microLocationProbabilityVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ARPRoutingSession initWithOutputDeviceID:interval:microLocationProbabilityVector:](v4, "initWithOutputDeviceID:interval:microLocationProbabilityVector:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ARPRoutingSession outputDeviceID](self, "outputDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_outputDeviceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ARPRoutingSession interval](self, "interval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_interval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ARPRoutingSession microLocationProbabilityVector](self, "microLocationProbabilityVector");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_microLocationProbabilityVector);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (ARPRoutingSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  ARPRoutingSession *v17;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_outputDeviceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_interval);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_microLocationProbabilityVector);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ARPRoutingSession initWithOutputDeviceID:interval:microLocationProbabilityVector:](self, "initWithOutputDeviceID:interval:microLocationProbabilityVector:", v7, v10, v16);
  return v17;
}

+ (void)writeSessions:(id)a3 routingSessionTimeout:(double)a4 file:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  ARPRoutingSessionArchive *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a5;
  v10 = a3;
  v11 = -[ARPRoutingSessionArchive initWithSessions:routingSessionTimeout:]([ARPRoutingSessionArchive alloc], "initWithSessions:routingSessionTimeout:", v10, a4);

  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (!v13)
  {
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v18);
    v13 = v18;

    if (!v13)
    {
      v17 = 0;
      objc_msgSend(v12, "writeToFile:options:error:", v9, 1, &v17);
      v13 = v17;
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.AirPlayRoutePrediction:%s"), objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"));
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        notify_post((const char *)objc_msgSend(v16, "UTF8String"));

        v13 = 0;
      }
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v13);

}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (NSDictionary)microLocationProbabilityVector
{
  return self->_microLocationProbabilityVector;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_microLocationProbabilityVector, 0);
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
}

@end

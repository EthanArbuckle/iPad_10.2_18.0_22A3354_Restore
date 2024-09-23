@implementation MSPSharedTripNotificationRules

+ (id)unarchivingObjectsSet
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t maxPostedNotifications;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double minimumETADifference;
  void *v12;
  double minimumNotificationInterval;
  void *v14;
  NSDate *lastPostedETADate;
  void *v16;
  NSDate *lastPostedNotificationDate;
  void *v18;
  NSDate *lastUpdatedDate;
  void *v20;
  _BOOL8 hasMadeFinalPush;
  void *v22;
  NSMapTable *intermediateArrivalWaypointPostedNotifications;
  id v24;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  maxPostedNotifications = self->_maxPostedNotifications;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", maxPostedNotifications);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_maxPostedNotifications);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_postedNotifications);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_postedNotifications);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, v10);

  minimumETADifference = self->_minimumETADifference;
  NSStringFromSelector(sel_minimumETADifference);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeDouble:forKey:", v12, minimumETADifference);

  minimumNotificationInterval = self->_minimumNotificationInterval;
  NSStringFromSelector(sel_minimumNotificationInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeDouble:forKey:", v14, minimumNotificationInterval);

  lastPostedETADate = self->_lastPostedETADate;
  NSStringFromSelector(sel_lastPostedETADate);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", lastPostedETADate, v16);

  lastPostedNotificationDate = self->_lastPostedNotificationDate;
  NSStringFromSelector(sel_lastPostedNotificationDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", lastPostedNotificationDate, v18);

  lastUpdatedDate = self->_lastUpdatedDate;
  NSStringFromSelector(sel_lastUpdatedDate);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", lastUpdatedDate, v20);

  hasMadeFinalPush = self->_hasMadeFinalPush;
  NSStringFromSelector(sel_hasMadeFinalPush);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", hasMadeFinalPush, v22);

  intermediateArrivalWaypointPostedNotifications = self->_intermediateArrivalWaypointPostedNotifications;
  NSStringFromSelector(sel_intermediateArrivalWaypointPostedNotifications);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", intermediateArrivalWaypointPostedNotifications, v24);

}

- (MSPSharedTripNotificationRules)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  MSPSharedTripNotificationRules *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDate *lastPostedETADate;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDate *lastPostedNotificationDate;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSDate *lastUpdatedDate;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMapTable *intermediateArrivalWaypointPostedNotifications;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSStringFromSelector(sel_maxPostedNotifications);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  NSStringFromSelector(sel_minimumNotificationInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v8);
  v10 = v9;

  v11 = -[MSPSharedTripNotificationRules initWithMaximumNumberOfNotifications:minimumNotificationInterval:](self, "initWithMaximumNumberOfNotifications:minimumNotificationInterval:", v7, v10);
  if (v11)
  {
    v12 = objc_opt_class();
    NSStringFromSelector(sel_postedNotifications);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_postedNotifications = objc_msgSend(v14, "unsignedIntegerValue");

    NSStringFromSelector(sel_minimumETADifference);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v15);
    v11->_minimumETADifference = v16;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_lastPostedETADate);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    lastPostedETADate = v11->_lastPostedETADate;
    v11->_lastPostedETADate = (NSDate *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_lastPostedNotificationDate);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    lastPostedNotificationDate = v11->_lastPostedNotificationDate;
    v11->_lastPostedNotificationDate = (NSDate *)v23;

    v25 = objc_opt_class();
    NSStringFromSelector(sel_lastUpdatedDate);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v11->_lastUpdatedDate;
    v11->_lastUpdatedDate = (NSDate *)v27;

    NSStringFromSelector(sel_hasMadeFinalPush);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hasMadeFinalPush = objc_msgSend(v4, "decodeBoolForKey:", v29);

    v30 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    v37[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_intermediateArrivalWaypointPostedNotifications);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    intermediateArrivalWaypointPostedNotifications = v11->_intermediateArrivalWaypointPostedNotifications;
    v11->_intermediateArrivalWaypointPostedNotifications = (NSMapTable *)v34;

  }
  return v11;
}

- (MSPSharedTripNotificationRules)init
{
  uint64_t UInteger;

  UInteger = GEOConfigGetUInteger();
  GEOConfigGetDouble();
  return -[MSPSharedTripNotificationRules initWithMaximumNumberOfNotifications:minimumNotificationInterval:](self, "initWithMaximumNumberOfNotifications:minimumNotificationInterval:", UInteger);
}

- (MSPSharedTripNotificationRules)initWithMaximumNumberOfNotifications:(unint64_t)a3
{
  GEOConfigGetDouble();
  return -[MSPSharedTripNotificationRules initWithMaximumNumberOfNotifications:minimumNotificationInterval:](self, "initWithMaximumNumberOfNotifications:minimumNotificationInterval:", a3);
}

- (MSPSharedTripNotificationRules)initWithMaximumNumberOfNotifications:(unint64_t)a3 minimumNotificationInterval:(double)a4
{
  MSPSharedTripNotificationRules *v6;
  MSPSharedTripNotificationRules *v7;
  double v8;
  uint64_t v9;
  NSDate *lastPostedETADate;
  uint64_t v11;
  NSDate *lastPostedNotificationDate;
  uint64_t v13;
  NSMapTable *intermediateArrivalWaypointPostedNotifications;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripNotificationRules;
  v6 = -[MSPSharedTripNotificationRules init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_minimumNotificationInterval = a4;
    v6->_maxPostedNotifications = a3;
    GEOConfigGetDouble();
    v7->_minimumETADifference = v8;
    v7->_postedNotifications = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v9 = objc_claimAutoreleasedReturnValue();
    lastPostedETADate = v7->_lastPostedETADate;
    v7->_lastPostedETADate = (NSDate *)v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v11 = objc_claimAutoreleasedReturnValue();
    lastPostedNotificationDate = v7->_lastPostedNotificationDate;
    v7->_lastPostedNotificationDate = (NSDate *)v11;

    v7->_hasMadeFinalPush = 0;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    intermediateArrivalWaypointPostedNotifications = v7->_intermediateArrivalWaypointPostedNotifications;
    v7->_intermediateArrivalWaypointPostedNotifications = (NSMapTable *)v13;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules lastPostedNotificationDate](self, "lastPostedNotificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules lastPostedETADate](self, "lastPostedETADate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules lastUpdatedDate](self, "lastUpdatedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MSPSharedTripNotificationRules hasMadeFinalPush](self, "hasMadeFinalPush");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("postedNotifications %@ \nlastPostedNotificationDate %@ \nlastPostedETADate %@ \nlastUpdatedDate %@ \nhasMadeFinalPush %@"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didPostNotificationType:(unint64_t)a3 forState:(id)a4
{
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  if (objc_msgSend(v20, "waypointInfosCount"))
  {
    if (objc_msgSend(v20, "hasCurrentWaypointIndex"))
    {
      v6 = objc_msgSend(v20, "currentWaypointIndex");
      if (objc_msgSend(v20, "waypointInfosCount") > (unint64_t)v6)
      {
        objc_msgSend(v20, "waypointInfos");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v20, "currentWaypointIndex"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "hasUniqueIdentifier"))
        {
          -[MSPSharedTripNotificationRules intermediateArrivalWaypointPostedNotifications](self, "intermediateArrivalWaypointPostedNotifications");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
            v13 = v11;
          else
            v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 1);
          v14 = v13;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

          -[MSPSharedTripNotificationRules intermediateArrivalWaypointPostedNotifications](self, "intermediateArrivalWaypointPostedNotifications");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v14, v17);

        }
      }
    }
  }
  -[MSPSharedTripNotificationRules currentETADate](self, "currentETADate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules setLastPostedETADate:](self, "setLastPostedETADate:", v18);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules setLastPostedNotificationDate:](self, "setLastPostedNotificationDate:", v19);

  -[MSPSharedTripNotificationRules setPostedNotifications:](self, "setPostedNotifications:", -[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications") + 1);
  -[MSPSharedTripNotificationRules incrementMinimumETADifference](self, "incrementMinimumETADifference");

}

- (unint64_t)currentlyNecessaryNotificationTypeForState:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  MSPSharedTripNotificationRules *v38;
  uint64_t v39;
  NSObject *v40;
  int v42;
  unint64_t v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MSPSharedTripNotificationRules hasMadeFinalPush](self, "hasMadeFinalPush"))
  {
    v5 = 0;
  }
  else
  {
    if (objc_msgSend(v4, "waypointInfosCount")
      && objc_msgSend(v4, "hasCurrentWaypointIndex")
      && (v6 = objc_msgSend(v4, "currentWaypointIndex"), objc_msgSend(v4, "waypointInfosCount") > (unint64_t)v6))
    {
      objc_msgSend(v4, "waypointInfos");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "currentWaypointIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    -[MSPSharedTripNotificationRules currentETADate](self, "currentETADate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = v10;
    GEOConfigGetDouble();
    v13 = v12;

    v14 = -[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications");
    if (v11 >= v13 || v14 == 0)
    {
      if (!objc_msgSend(v4, "hasResumed")
        || !objc_msgSend(v4, "resumed")
        || (v5 = 5,
            -[MSPSharedTripNotificationRules hasSentNotificationType:forState:waypoint:](self, "hasSentNotificationType:forState:waypoint:", 5, v4, v8)))
      {
        if (-[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications"))
        {
          -[MSPSharedTripNotificationRules lastPostedNotificationDate](self, "lastPostedNotificationDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceNow");
          v18 = v17;
          -[MSPSharedTripNotificationRules minimumNotificationInterval](self, "minimumNotificationInterval");
          v20 = -v19;

          -[MSPSharedTripNotificationRules currentETADate](self, "currentETADate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPSharedTripNotificationRules lastPostedETADate](self, "lastPostedETADate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceDate:", v22);
          v24 = v23;
          -[MSPSharedTripNotificationRules minimumETADifference](self, "minimumETADifference");
          v26 = v24 <= -v25;

          -[MSPSharedTripNotificationRules currentETADate](self, "currentETADate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPSharedTripNotificationRules lastPostedETADate](self, "lastPostedETADate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalSinceDate:", v28);
          v30 = v29;
          -[MSPSharedTripNotificationRules minimumETADifference](self, "minimumETADifference");
          v32 = v31;

          v33 = v30 >= v32 || v26;
          v34 = -[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications");
          v35 = -[MSPSharedTripNotificationRules maxPostedNotifications](self, "maxPostedNotifications");
          v36 = v35;
          if (v18 <= v20 && v33 && v34 < v35)
          {
            v5 = 2;
          }
          else
          {
            MSPGetSharedTripLog();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v42 = 134218752;
              v43 = -[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications");
              v44 = 1024;
              v45 = v18 <= v20;
              v46 = 1024;
              v47 = v33;
              v48 = 1024;
              v49 = v34 < v36;
              _os_log_impl(&dword_1B39C0000, v40, OS_LOG_TYPE_INFO, "[SR] currentlyNecessaryNotificationType postedNotifications: %lu, minimumTimeElapsedSinceLastPush: %d minimumETADifferenceMet: %d isUnderMaximumPushLimit: %d", (uint8_t *)&v42, 0x1Eu);
            }

            v5 = 0;
          }
        }
        else
        {
          v5 = 1;
        }
      }
    }
    else if (objc_msgSend(v4, "isNavigatingToIntermediateStop"))
    {
      objc_msgSend(v8, "chargingStationInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v5 = 3;
        v38 = self;
        v39 = 3;
      }
      else
      {
        v5 = 4;
        v38 = self;
        v39 = 4;
      }
      if (-[MSPSharedTripNotificationRules hasSentNotificationType:forState:waypoint:](v38, "hasSentNotificationType:forState:waypoint:", v39, v4, v8))
      {
        v5 = 0;
      }
    }
    else
    {
      -[MSPSharedTripNotificationRules setHasMadeFinalPush:](self, "setHasMadeFinalPush:", 1);
      v5 = 6;
    }

  }
  return v5;
}

- (void)didReceiveUpdateWithETA:(double)a3 lastUpdated:(double)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules setLastUpdatedDate:](self, "setLastUpdatedDate:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MSPSharedTripNotificationRules setCurrentETADate:](self, "setCurrentETADate:", v7);

}

- (void)incrementMinimumETADifference
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (-[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications"))
    v3 = (double)(-[MSPSharedTripNotificationRules postedNotifications](self, "postedNotifications") - 1);
  else
    v3 = 0.0;
  -[MSPSharedTripNotificationRules minimumETADifferenceIncrement](self, "minimumETADifferenceIncrement");
  v5 = v4;
  -[MSPSharedTripNotificationRules minimumETADifference](self, "minimumETADifference");
  -[MSPSharedTripNotificationRules setMinimumETADifference:](self, "setMinimumETADifference:", v6 + v5 * v3);
}

- (double)minimumETADifferenceIncrement
{
  double result;

  GEOConfigGetDouble();
  return result;
}

- (BOOL)hasSentNotificationType:(unint64_t)a3 forState:(id)a4 waypoint:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a5;
  if (objc_msgSend(v7, "hasUniqueIdentifier"))
  {
    -[MSPSharedTripNotificationRules intermediateArrivalWaypointPostedNotifications](self, "intermediateArrivalWaypointPostedNotifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)maxPostedNotifications
{
  return self->_maxPostedNotifications;
}

- (void)setMaxPostedNotifications:(unint64_t)a3
{
  self->_maxPostedNotifications = a3;
}

- (unint64_t)postedNotifications
{
  return self->_postedNotifications;
}

- (void)setPostedNotifications:(unint64_t)a3
{
  self->_postedNotifications = a3;
}

- (double)minimumETADifference
{
  return self->_minimumETADifference;
}

- (void)setMinimumETADifference:(double)a3
{
  self->_minimumETADifference = a3;
}

- (double)minimumNotificationInterval
{
  return self->_minimumNotificationInterval;
}

- (void)setMinimumNotificationInterval:(double)a3
{
  self->_minimumNotificationInterval = a3;
}

- (NSDate)lastPostedETADate
{
  return self->_lastPostedETADate;
}

- (void)setLastPostedETADate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPostedETADate, a3);
}

- (NSDate)lastPostedNotificationDate
{
  return self->_lastPostedNotificationDate;
}

- (void)setLastPostedNotificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPostedNotificationDate, a3);
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, a3);
}

- (NSDate)currentETADate
{
  return self->_currentETADate;
}

- (void)setCurrentETADate:(id)a3
{
  objc_storeStrong((id *)&self->_currentETADate, a3);
}

- (BOOL)hasMadeFinalPush
{
  return self->_hasMadeFinalPush;
}

- (void)setHasMadeFinalPush:(BOOL)a3
{
  self->_hasMadeFinalPush = a3;
}

- (NSMapTable)intermediateArrivalWaypointPostedNotifications
{
  return self->_intermediateArrivalWaypointPostedNotifications;
}

- (void)setIntermediateArrivalWaypointPostedNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateArrivalWaypointPostedNotifications, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermediateArrivalWaypointPostedNotifications, 0);
  objc_storeStrong((id *)&self->_currentETADate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_lastPostedNotificationDate, 0);
  objc_storeStrong((id *)&self->_lastPostedETADate, 0);
}

@end

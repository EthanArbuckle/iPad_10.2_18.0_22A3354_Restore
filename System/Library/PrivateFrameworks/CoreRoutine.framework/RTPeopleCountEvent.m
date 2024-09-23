@implementation RTPeopleCountEvent

- (RTPeopleCountEvent)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventID_startDate_endDate_totalCount_familyCount_friendsCount_);
}

- (RTPeopleCountEvent)initWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 totalCount:(unint64_t)a6 familyCount:(unint64_t)a7 friendsCount:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  RTPeopleCountEvent *v18;
  RTPeopleCountEvent *v19;
  RTPeopleCountEvent *v20;
  NSObject *v21;
  const char *v22;
  objc_super v24;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v20 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: eventID";
LABEL_12:
    _os_log_error_impl(&dword_1A5E26000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_9;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: startDate";
    goto LABEL_12;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTPeopleCountEvent;
  v18 = -[RTPeopleCountEvent init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventID, a3);
    objc_storeStrong((id *)&v19->_startDate, a4);
    objc_storeStrong((id *)&v19->_endDate, a5);
    v19->_totalCount = a6;
    v19->_familyCount = a7;
    v19->_friendsCount = a8;
  }
  self = v19;
  v20 = self;
LABEL_10:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  RTPeopleCountEvent *v4;
  RTPeopleCountEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;

  v4 = (RTPeopleCountEvent *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTPeopleCountEvent eventID](self, "eventID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPeopleCountEvent eventID](v5, "eventID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[RTPeopleCountEvent startDate](self, "startDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPeopleCountEvent startDate](v5, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToDate:", v9))
        {
          -[RTPeopleCountEvent endDate](self, "endDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPeopleCountEvent endDate](v5, "endDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToDate:", v11)
            && (v12 = -[RTPeopleCountEvent totalCount](self, "totalCount"),
                v12 == -[RTPeopleCountEvent totalCount](v5, "totalCount"))
            && (v13 = -[RTPeopleCountEvent familyCount](self, "familyCount"),
                v13 == -[RTPeopleCountEvent familyCount](v5, "familyCount")))
          {
            v14 = -[RTPeopleCountEvent friendsCount](self, "friendsCount");
            v15 = v14 == -[RTPeopleCountEvent friendsCount](v5, "friendsCount");
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (id)descriptionDictionary
{
  void *v3;
  NSDate *startDate;
  __CFString *v5;
  NSDate *endDate;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("EventID");
  -[NSUUID UUIDString](self->_eventID, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("StartDate");
  startDate = self->_startDate;
  if (startDate)
  {
    -[NSDate getFormattedDateString](self->_startDate, "getFormattedDateString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("-");
  }
  v14[1] = v5;
  v13[2] = CFSTR("EndDate");
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate getFormattedDateString](self->_endDate, "getFormattedDateString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("-");
  }
  v14[2] = v7;
  v13[3] = CFSTR("TotalCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_totalCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("FamilyCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_familyCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  v13[5] = CFSTR("FriendsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_friendsCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (endDate)
  if (startDate)

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleCountEvent descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[RTPeopleCountEvent eventID](self, "eventID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPeopleCountEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPeopleCountEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithEventID:startDate:endDate:totalCount:familyCount:friendsCount:", v5, v6, v7, self->_totalCount, self->_familyCount, self->_friendsCount);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleCountEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  RTPeopleCountEvent *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EventID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EndDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("TotalCount"));
  v9 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("FamilyCount"));
  v10 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("FriendsCount"));

  v11 = -[RTPeopleCountEvent initWithEventID:startDate:endDate:totalCount:familyCount:friendsCount:](self, "initWithEventID:startDate:endDate:totalCount:familyCount:friendsCount:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *eventID;
  id v5;

  eventID = self->_eventID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventID, CFSTR("EventID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("StartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("EndDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_totalCount, CFSTR("TotalCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_familyCount, CFSTR("FamilyCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_friendsCount, CFSTR("FriendsCount"));

}

- (NSUUID)eventID
{
  return self->_eventID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (unint64_t)familyCount
{
  return self->_familyCount;
}

- (unint64_t)friendsCount
{
  return self->_friendsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end

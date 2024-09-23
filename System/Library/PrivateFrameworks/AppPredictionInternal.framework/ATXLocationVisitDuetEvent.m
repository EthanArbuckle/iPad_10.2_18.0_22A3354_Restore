@implementation ATXLocationVisitDuetEvent

- (ATXLocationVisitDuetEvent)initWithLocationOfInterestIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXLocationVisitDuetEvent *v12;
  ATXLocationVisitDuetEvent *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationVisitDuetEvent.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationOfInterestId"));

  }
  v16.receiver = self;
  v16.super_class = (Class)ATXLocationVisitDuetEvent;
  v12 = -[ATXDuetEvent initWithStartDate:endDate:](&v16, sel_initWithStartDate_endDate_, v10, v11);
  v13 = v12;
  if (v12)
    -[ATXDuetEvent setLocationIdentifier:](v12, "setLocationIdentifier:", v9);

  return v13;
}

- (ATXLocationVisitDuetEvent)initWithCurrentContextStoreValues
{
  void *v3;
  ATXLocationVisitDuetEvent *v4;

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXLocationVisitDuetEvent initWithCurrentContextStoreValues:](self, "initWithCurrentContextStoreValues:", v3);

  return v4;
}

- (ATXLocationVisitDuetEvent)initWithCurrentContextStoreValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXLocationVisitDuetEvent *v9;

  objc_msgSend(a3, "previousLOIAndCurrentLOI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    self = -[ATXLocationVisitDuetEvent initWithLocationOfInterestIdentifier:startDate:endDate:](self, "initWithLocationOfInterestIdentifier:startDate:endDate:", v6, v7, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[ATXDuetEvent locationIdentifier](self, "locationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ATXDuetEvent locationIdentifier](self, "locationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("LOI: %@, start date: %@, end date: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  id v7;

  v4 = a3;
  -[ATXDuetEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForStartDate"));

  -[ATXDuetEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForEndDate"));

  -[ATXDuetEvent locationIdentifier](self, "locationIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForLocationIdentifier"));

}

- (ATXLocationVisitDuetEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXLocationVisitDuetEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_anchor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.LocationVisit"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_anchor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndDate"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.LocationVisit"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v4, "error"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_anchor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForLocationIdentifier"), v4, 1, CFSTR("com.apple.proactive.ATXDuetEvent.LocationVisit"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19
        && (objc_msgSend(v4, "error"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        self = -[ATXLocationVisitDuetEvent initWithLocationOfInterestIdentifier:startDate:endDate:](self, "initWithLocationOfInterestIdentifier:startDate:endDate:", v19, v8, v14);
        v10 = self;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

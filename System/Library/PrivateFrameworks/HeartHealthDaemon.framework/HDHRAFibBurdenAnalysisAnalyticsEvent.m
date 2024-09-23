@implementation HDHRAFibBurdenAnalysisAnalyticsEvent

- (HDHRAFibBurdenAnalysisAnalyticsEvent)initWithResult:(id)a3 calculationType:(int64_t)a4 calculationTypeDetails:(id)a5 numberOfTachograms:(int64_t)a6 additionalPayloadFromAlgorithm:(id)a7
{
  id v13;
  id v14;
  id v15;
  HDHRAFibBurdenAnalysisAnalyticsEvent *v16;
  HDHRAFibBurdenAnalysisAnalyticsEvent *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HDHRAFibBurdenAnalysisAnalyticsEvent;
  v16 = -[HDHRAFibBurdenAnalysisAnalyticsEvent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_result, a3);
    v17->_calculationType = a4;
    objc_storeStrong((id *)&v17->_calculationTypeDetails, a5);
    v17->_numberOfTachograms = a6;
    objc_storeStrong((id *)&v17->_additionalPayloadFromAlgorithm, a7);
  }

  return v17;
}

- (NSString)eventName
{
  return (NSString *)(id)*MEMORY[0x1E0D2FA28];
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSNumber *calculationTypeDetails;
  void *v25;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = v7;
  if (self->_result)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("success"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HKHRAFibBurdenAnalysisResult unavailabilityReason](self->_result, "unavailabilityReason") == 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("sufficientData"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HKHRAFibBurdenAnalysisResult burdenPercentageWasClampedToLowerBound](self->_result, "burdenPercentageWasClampedToLowerBound"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("wasClamped"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("success"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDHRAFibBurdenAnalysisAnalyticsEvent _bucketNumberOfTachogramsFrom:](self, "_bucketNumberOfTachogramsFrom:", self->_numberOfTachograms));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("numberOfAvailableTachograms"));

  objc_msgSend(v6, "environmentDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendarCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "environmentDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v14, "component:fromDate:", 32, v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("hourOfDay"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "environmentDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "currentDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v14, "component:fromDate:", 512, v21));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("dayOfWeek"));

  -[HDHRAFibBurdenAnalysisAnalyticsEvent _calculationTypeStringFromCalculationType:](self, "_calculationTypeStringFromCalculationType:", self->_calculationType);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("calculationType"));

  calculationTypeDetails = self->_calculationTypeDetails;
  if (calculationTypeDetails)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", calculationTypeDetails, CFSTR("calculationTypeDetails"));
  if (self->_additionalPayloadFromAlgorithm)
    objc_msgSend(v8, "addEntriesFromDictionary:");
  v25 = (void *)objc_msgSend(v8, "copy");

  return v25;
}

- (int64_t)_bucketNumberOfTachogramsFrom:(int64_t)a3
{
  if (!a3)
    return 0;
  if (a3 < 11)
    return 1;
  if ((unint64_t)a3 < 0x15)
    return 11;
  if ((unint64_t)a3 < 0x1F)
    return 21;
  if ((unint64_t)a3 < 0x29)
    return 31;
  if ((unint64_t)a3 < 0x33)
    return 41;
  if ((unint64_t)a3 < 0x4C)
    return 51;
  if ((unint64_t)a3 < 0x65)
    return 76;
  if ((unint64_t)a3 < 0x97)
    return 101;
  if ((unint64_t)a3 < 0xC9)
    return 151;
  if ((unint64_t)a3 < 0xFB)
    return 201;
  if ((unint64_t)a3 < 0x12D)
    return 251;
  if ((unint64_t)a3 < 0x191)
    return 301;
  if ((unint64_t)a3 < 0x1F5)
    return 401;
  if ((unint64_t)a3 < 0x259)
    return 501;
  if ((unint64_t)a3 >= 0x2BD)
    return 701;
  return 601;
}

- (id)_calculationTypeStringFromCalculationType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("unknown");
  else
    return off_1E87EF478[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPayloadFromAlgorithm, 0);
  objc_storeStrong((id *)&self->_calculationTypeDetails, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end

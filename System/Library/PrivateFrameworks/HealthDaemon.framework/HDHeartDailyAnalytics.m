@implementation HDHeartDailyAnalytics

- (HDHeartDailyAnalytics)init
{
  HDHeartDailyAnalytics *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *payload;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDHeartDailyAnalytics;
  v2 = -[HDHeartDailyAnalytics init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    payload = v2->_payload;
    v2->_payload = v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSMutableDictionary copy](self->_payload, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSDictionary)payload
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_payload, "copy");
}

- (void)updateIsEcgOnboarded:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isECGOnboarded"));

}

- (void)updateIsIrnOnboarded:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isIRNOnboarded"));

}

- (void)updateIsImproveHealthAndActivityAllowed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isImproveHealthAndActivityAllowed"));

}

- (void)updateElectrocardiogramClassificationCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("ecgCount"));

}

- (void)updateIrregularRhythmNotificationClassificationCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("irregularRhythmNotificationCount"));

}

- (void)updateActiveWatchProductType:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("activeWatchProductType"));
}

- (void)updateActiveWatchSystemBuildVersion:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("activeWatchSystemBuildVersion"));
}

- (void)updateWeeksSinceElectrocardiogramOnboarded:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("weeksSinceElectrocardiogramOnboarded"));
}

- (void)updateWithElectrocardiogramClassifications:(id)a3 isWithin24HoursPostIRN:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __CFString **v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "unsignedIntegerValue");
        if (!v4)
        {
          if (self)
          {
            v12 = off_1E6D0ECE0;
            v13 = CFSTR("ecgClassificationCountWithin24HoursUnknown");
            if (v11 > 0xA)
              goto LABEL_13;
LABEL_12:
            v13 = v12[v11];
            goto LABEL_13;
          }
LABEL_18:
          v13 = 0;
          goto LABEL_13;
        }
        if (!self)
          goto LABEL_18;
        v12 = off_1E6D0EC88;
        v13 = CFSTR("ecgClassificationCountWithin24HoursPostIRNUnknown");
        if (v11 < 0xB)
          goto LABEL_12;
LABEL_13:
        v14 = v13;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v17, v14);

        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", &unk_1E6DFE7F8, v14);
        }

        ++v10;
      }
      while (v8 != v10);
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = v18;
    }
    while (v18);
  }

}

- (void)updateECGActiveAlgorithmVersion:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("ecgActiveAlgorithmVersion"));
}

- (void)updateECGUpdateVersionPhone:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("ecgUpdateVersionPhone"));
}

- (void)updateECGUpdateVersionWatch:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("ecgUpdateVersionWatch"));
}

- (void)updateECGOnboardingCountryCode:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("ecgOnboardingCountryCode"));
}

- (void)updateIRNOnboardingCountryCode:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("irnOnboardingCountryCode"));
}

- (void)updateIsAtrialFibrillationEnabled:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("isAtrialFibrillationDetectionEnabled"));
}

- (void)updateWasWatchWornPast24Hours:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("wasWatchWornPast24Hours"));

}

- (void)updateCountRecordedTachogramsPast24Hours:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("countRecordedTachogramsPast24Hours"));

}

- (void)updateCountAnalyzedTachogramsPast24Hours:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("countAnalyzedTachogramsPast24Hours"));

}

- (void)updateCountMobileAssetsDownloadedPast24Hours:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("countMobileAssetsDownloadedPast24Hours"));

}

- (void)updateOTAFactorPackID:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("OTAFactorPackID"));
}

- (void)updateAgeInYears:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = v4;
  v9 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "integerValue") >= 22)
    {
      if (objc_msgSend(v9, "integerValue") >= 30)
      {
        if (objc_msgSend(v9, "integerValue") > 99)
          v7 = 100;
        else
          v7 = 10 * (objc_msgSend(v9, "integerValue") / 10);
      }
      else
      {
        v7 = 22;
      }
    }
    else
    {
      v7 = 21;
    }
  }
  else
  {
    v7 = -1;
  }

  objc_msgSend(v5, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v8, CFSTR("age"));

}

- (void)updateSex:(int64_t)a3
{
  const __CFString *v3;

  if ((unint64_t)a3 > 3)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E6D0ED38[a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v3, CFSTR("sex"));
}

- (void)updateAreHealthNotificationsAuthorized:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("areHealthNotificationsAuthorized"));

}

- (void)updateNumberOfStandAndIdleHoursInPreviousCalendarDay:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("numberOfStandHoursInPreviousCalendarDay"));
}

- (void)updateDaysSinceLastCountryMonitorCheck:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("daysSinceLastCountryMonitorCheck"));
}

- (void)updateDaysSinceLastCountryMonitorFetch:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("daysSinceLastCountryMonitorFetch"));
}

- (void)updateLastCountryMonitorFetchBuildNumber:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("lastCountryMonitorFetchBuildNumber"));
}

- (void)updateIsGlucoseEnhancedChartingDelivered:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isGlucoseEnhancedChartingDelivered"));

}

- (void)updateGlucoseEnhancedChartingCountryCode:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("glucoseEnhancedChartingOnboardingCountryCode"));
}

- (void)updateHighHeartRateNotificationThreshold:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("notificationThresholdHHR"));
}

- (void)updateLowHeartRateNotificationThreshold:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("notificationThresholdLHR"));
}

- (void)updateIsTachycardiaDetectionEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isTachycardiaDetectionEnabled"));

}

- (void)updateIsBradycardiaDetectionEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isBradycardiaDetectionEnabled"));

}

- (void)updateAlgorithmVersionIRN:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("algorithmVersionIRN"));
}

- (void)updateAtrialFibrillationDetectionV2CountryCode:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("atrialFibrilliationDetectionV2CountryCode"));
}

- (void)updateIsAtrialFibrillationEnabledV2:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("isAtrialFibrillationDetectionEnabledV2"));
}

- (void)updateIsMenstrualCyclesHeartRateInputDelivered:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isMenstrualCyclesHeartRateInputDelivered"));

}

- (void)updateMenstrualCyclesHeartRateInputCountryCode:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("menstrualCyclesHeartRateInputOnboardingCountryCode"));
}

- (void)updateIsRespiratoryRateDelivered:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", v4, CFSTR("isRespiratoryRateDelivered"));

}

- (void)updateIsRespiratoryRateEnabledInPrivacy:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("isRespiratoryRateEnabledInPrivacy"));
}

- (void)updateRespiratoryRateCountryCode:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payload, "setObject:forKeyedSubscript:", a3, CFSTR("respiratoryRateOnboardingCountryCode"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end

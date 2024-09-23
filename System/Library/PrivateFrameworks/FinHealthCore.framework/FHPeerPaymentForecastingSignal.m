@implementation FHPeerPaymentForecastingSignal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t forecastingType;
  id v5;

  forecastingType = self->_forecastingType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", forecastingType, CFSTR("forecastingType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_frequency, CFSTR("frequency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signalDate, CFSTR("signalDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerPaymentHeuristicIds, CFSTR("peerPaymentHeuristicIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dayOfWeek, CFSTR("dayOfWeek"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_periodicCategory, CFSTR("periodicCategory"));

}

- (FHPeerPaymentForecastingSignal)initWithCoder:(id)a3
{
  id v4;
  FHPeerPaymentForecastingSignal *v5;
  uint64_t v6;
  NSDecimalNumber *frequency;
  uint64_t v8;
  NSDate *signalDate;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *peerPaymentHeuristicIds;
  uint64_t v15;
  NSString *dayOfWeek;
  uint64_t v17;
  NSString *periodicCategory;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FHPeerPaymentForecastingSignal;
  v5 = -[FHPeerPaymentForecastingSignal init](&v20, sel_init);
  if (v5)
  {
    v5->_forecastingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("forecastingType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frequency"));
    v6 = objc_claimAutoreleasedReturnValue();
    frequency = v5->_frequency;
    v5->_frequency = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signalDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    signalDate = v5->_signalDate;
    v5->_signalDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("peerPaymentHeuristicIds"));
    v13 = objc_claimAutoreleasedReturnValue();
    peerPaymentHeuristicIds = v5->_peerPaymentHeuristicIds;
    v5->_peerPaymentHeuristicIds = (NSSet *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dayOfWeek"));
    v15 = objc_claimAutoreleasedReturnValue();
    dayOfWeek = v5->_dayOfWeek;
    v5->_dayOfWeek = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("periodicCategory"));
    v17 = objc_claimAutoreleasedReturnValue();
    periodicCategory = v5->_periodicCategory;
    v5->_periodicCategory = (NSString *)v17;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_250C67C70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("forecastingType"), self->_forecastingType);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("frequency"), self->_frequency);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("signalDate"), self->_signalDate);
  -[NSSet allObjects](self->_peerPaymentHeuristicIds, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '{%@}'; "), CFSTR("peerPaymentHeuristicIds"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("dayOfWeek"), self->_dayOfWeek);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("periodicCategory"), self->_periodicCategory);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[FHPeerPaymentForecastingSignal forecastingType](self, "forecastingType");
  -[FHPeerPaymentForecastingSignal frequency](self, "frequency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 43 * v3 + 1849;

  -[FHPeerPaymentForecastingSignal signalDate](self, "signalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") + 43 * v5;

  -[FHPeerPaymentForecastingSignal peerPaymentHeuristicIds](self, "peerPaymentHeuristicIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") + 43 * v7;

  -[FHPeerPaymentForecastingSignal dayOfWeek](self, "dayOfWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") + 43 * v9;

  -[FHPeerPaymentForecastingSignal periodicCategory](self, "periodicCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") + 43 * v11;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  FHPeerPaymentForecastingSignal *v4;
  FHPeerPaymentForecastingSignal *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;

  v4 = (FHPeerPaymentForecastingSignal *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v6 = -[FHPeerPaymentForecastingSignal forecastingType](self, "forecastingType"),
             v6 == -[FHPeerPaymentForecastingSignal forecastingType](v5, "forecastingType")))
  {
    -[FHPeerPaymentForecastingSignal frequency](self, "frequency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHPeerPaymentForecastingSignal frequency](v5, "frequency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[FHPeerPaymentForecastingSignal signalDate](self, "signalDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHPeerPaymentForecastingSignal signalDate](v5, "signalDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToDate:", v10))
      {
        -[FHPeerPaymentForecastingSignal peerPaymentHeuristicIds](self, "peerPaymentHeuristicIds");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHPeerPaymentForecastingSignal peerPaymentHeuristicIds](v5, "peerPaymentHeuristicIds");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToSet:", v12))
        {
          -[FHPeerPaymentForecastingSignal dayOfWeek](self, "dayOfWeek");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FHPeerPaymentForecastingSignal dayOfWeek](v5, "dayOfWeek");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v14))
          {
            -[FHPeerPaymentForecastingSignal periodicCategory](self, "periodicCategory");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[FHPeerPaymentForecastingSignal periodicCategory](v5, "periodicCategory");
            v19 = v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v18, "isEqualToString:", v15);

            v13 = v19;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setSignalDate:(id)a3
{
  NSString *v5;
  NSString *dayOfWeek;
  id v7;

  objc_storeStrong((id *)&self->_signalDate, a3);
  v7 = a3;
  GetDayOfWeekFromSignalDate(v7);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  dayOfWeek = self->_dayOfWeek;
  self->_dayOfWeek = v5;

}

- (void)setFrequency:(id)a3
{
  NSString *v5;
  NSString *periodicCategory;
  id v7;

  objc_storeStrong((id *)&self->_frequency, a3);
  v7 = a3;
  GetPeriodicCategoryFromFrequency(v7);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  periodicCategory = self->_periodicCategory;
  self->_periodicCategory = v5;

}

- (unint64_t)forecastingType
{
  return self->_forecastingType;
}

- (void)setForecastingType:(unint64_t)a3
{
  self->_forecastingType = a3;
}

- (NSDecimalNumber)frequency
{
  return self->_frequency;
}

- (NSDate)signalDate
{
  return self->_signalDate;
}

- (NSSet)peerPaymentHeuristicIds
{
  return self->_peerPaymentHeuristicIds;
}

- (void)setPeerPaymentHeuristicIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)periodicCategory
{
  return self->_periodicCategory;
}

- (void)setPeriodicCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicCategory, 0);
  objc_storeStrong((id *)&self->_dayOfWeek, 0);
  objc_storeStrong((id *)&self->_peerPaymentHeuristicIds, 0);
  objc_storeStrong((id *)&self->_signalDate, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end

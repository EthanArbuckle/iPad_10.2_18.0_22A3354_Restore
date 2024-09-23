@implementation HKHRAFibBurdenDayOfWeekHistogram

- (HKHRAFibBurdenDayOfWeekHistogram)initWithSundayBurden:(id)a3 mondayBurden:(id)a4 tuesdayBurden:(id)a5 wednesdayBurden:(id)a6 thursdayBurden:(id)a7 fridayBurden:(id)a8 saturdayBurden:(id)a9
{
  id v16;
  id v17;
  HKHRAFibBurdenDayOfWeekHistogram *v18;
  HKHRAFibBurdenDayOfWeekHistogram *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HKHRAFibBurdenDayOfWeekHistogram;
  v18 = -[HKHRAFibBurdenDayOfWeekHistogram init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sundayBurden, a3);
    objc_storeStrong((id *)&v19->_mondayBurden, a4);
    objc_storeStrong((id *)&v19->_tuesdayBurden, a5);
    objc_storeStrong((id *)&v19->_wednesdayBurden, a6);
    objc_storeStrong((id *)&v19->_thursdayBurden, a7);
    objc_storeStrong((id *)&v19->_fridayBurden, a8);
    objc_storeStrong((id *)&v19->_saturdayBurden, a9);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  HKHRAFibBurdenDayOfWeekHistogram *v4;
  HKHRAFibBurdenDayOfWeekHistogram *v5;
  BOOL v6;

  v4 = (HKHRAFibBurdenDayOfWeekHistogram *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HKHRAFibBurdenAnalysisResult isEqual:](self->_sundayBurden, "isEqual:", v5->_sundayBurden)
        && -[HKHRAFibBurdenAnalysisResult isEqual:](self->_mondayBurden, "isEqual:", v5->_mondayBurden)
        && -[HKHRAFibBurdenAnalysisResult isEqual:](self->_tuesdayBurden, "isEqual:", v5->_tuesdayBurden)
        && -[HKHRAFibBurdenAnalysisResult isEqual:](self->_wednesdayBurden, "isEqual:", v5->_wednesdayBurden)
        && -[HKHRAFibBurdenAnalysisResult isEqual:](self->_thursdayBurden, "isEqual:", v5->_thursdayBurden)
        && -[HKHRAFibBurdenAnalysisResult isEqual:](self->_fridayBurden, "isEqual:", v5->_fridayBurden)
        && -[HKHRAFibBurdenAnalysisResult isEqual:](self->_saturdayBurden, "isEqual:", v5->_saturdayBurden);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[HKHRAFibBurdenAnalysisResult hash](self->_sundayBurden, "hash");
  v4 = -[HKHRAFibBurdenAnalysisResult hash](self->_mondayBurden, "hash") ^ v3;
  v5 = -[HKHRAFibBurdenAnalysisResult hash](self->_tuesdayBurden, "hash");
  v6 = v4 ^ v5 ^ -[HKHRAFibBurdenAnalysisResult hash](self->_wednesdayBurden, "hash");
  v7 = -[HKHRAFibBurdenAnalysisResult hash](self->_thursdayBurden, "hash");
  v8 = v7 ^ -[HKHRAFibBurdenAnalysisResult hash](self->_fridayBurden, "hash");
  return v6 ^ v8 ^ -[HKHRAFibBurdenAnalysisResult hash](self->_saturdayBurden, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKHRAFibBurdenAnalysisResult *sundayBurden;
  id v5;

  sundayBurden = self->_sundayBurden;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sundayBurden, CFSTR("SundayBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mondayBurden, CFSTR("MondayBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tuesdayBurden, CFSTR("TuesdayBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wednesdayBurden, CFSTR("WednesdayBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thursdayBurden, CFSTR("ThursdayBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fridayBurden, CFSTR("FridayBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_saturdayBurden, CFSTR("SaturdayBurdenKey"));

}

- (HKHRAFibBurdenDayOfWeekHistogram)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenDayOfWeekHistogram *v5;
  uint64_t v6;
  HKHRAFibBurdenAnalysisResult *sundayBurden;
  uint64_t v8;
  HKHRAFibBurdenAnalysisResult *mondayBurden;
  uint64_t v10;
  HKHRAFibBurdenAnalysisResult *tuesdayBurden;
  uint64_t v12;
  HKHRAFibBurdenAnalysisResult *wednesdayBurden;
  uint64_t v14;
  HKHRAFibBurdenAnalysisResult *thursdayBurden;
  uint64_t v16;
  HKHRAFibBurdenAnalysisResult *fridayBurden;
  uint64_t v18;
  HKHRAFibBurdenAnalysisResult *saturdayBurden;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKHRAFibBurdenDayOfWeekHistogram;
  v5 = -[HKHRAFibBurdenDayOfWeekHistogram init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SundayBurdenKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    sundayBurden = v5->_sundayBurden;
    v5->_sundayBurden = (HKHRAFibBurdenAnalysisResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MondayBurdenKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    mondayBurden = v5->_mondayBurden;
    v5->_mondayBurden = (HKHRAFibBurdenAnalysisResult *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TuesdayBurdenKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    tuesdayBurden = v5->_tuesdayBurden;
    v5->_tuesdayBurden = (HKHRAFibBurdenAnalysisResult *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WednesdayBurdenKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    wednesdayBurden = v5->_wednesdayBurden;
    v5->_wednesdayBurden = (HKHRAFibBurdenAnalysisResult *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ThursdayBurdenKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    thursdayBurden = v5->_thursdayBurden;
    v5->_thursdayBurden = (HKHRAFibBurdenAnalysisResult *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FridayBurdenKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    fridayBurden = v5->_fridayBurden;
    v5->_fridayBurden = (HKHRAFibBurdenAnalysisResult *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SaturdayBurdenKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    saturdayBurden = v5->_saturdayBurden;
    v5->_saturdayBurden = (HKHRAFibBurdenAnalysisResult *)v18;

  }
  return v5;
}

- (HKHRAFibBurdenAnalysisResult)sundayBurden
{
  return self->_sundayBurden;
}

- (HKHRAFibBurdenAnalysisResult)mondayBurden
{
  return self->_mondayBurden;
}

- (HKHRAFibBurdenAnalysisResult)tuesdayBurden
{
  return self->_tuesdayBurden;
}

- (HKHRAFibBurdenAnalysisResult)wednesdayBurden
{
  return self->_wednesdayBurden;
}

- (HKHRAFibBurdenAnalysisResult)thursdayBurden
{
  return self->_thursdayBurden;
}

- (HKHRAFibBurdenAnalysisResult)fridayBurden
{
  return self->_fridayBurden;
}

- (HKHRAFibBurdenAnalysisResult)saturdayBurden
{
  return self->_saturdayBurden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saturdayBurden, 0);
  objc_storeStrong((id *)&self->_fridayBurden, 0);
  objc_storeStrong((id *)&self->_thursdayBurden, 0);
  objc_storeStrong((id *)&self->_wednesdayBurden, 0);
  objc_storeStrong((id *)&self->_tuesdayBurden, 0);
  objc_storeStrong((id *)&self->_mondayBurden, 0);
  objc_storeStrong((id *)&self->_sundayBurden, 0);
}

@end

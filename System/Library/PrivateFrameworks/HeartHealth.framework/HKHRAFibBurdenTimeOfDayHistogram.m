@implementation HKHRAFibBurdenTimeOfDayHistogram

- (HKHRAFibBurdenTimeOfDayHistogram)initWithMidnightToFourAMBurden:(id)a3 fourAMtoEightAMBurden:(id)a4 eightAMToNoonBurden:(id)a5 noonToFourPMBurden:(id)a6 fourPMToEightPMBurden:(id)a7 eightPMToMidnightBurden:(id)a8
{
  id v15;
  id v16;
  id v17;
  HKHRAFibBurdenTimeOfDayHistogram *v18;
  HKHRAFibBurdenTimeOfDayHistogram *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HKHRAFibBurdenTimeOfDayHistogram;
  v18 = -[HKHRAFibBurdenTimeOfDayHistogram init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_midnightToFourAMBurden, a3);
    objc_storeStrong((id *)&v19->_fourAMtoEightAMBurden, a4);
    objc_storeStrong((id *)&v19->_eightAMToNoonBurden, a5);
    objc_storeStrong((id *)&v19->_noonToFourPMBurden, a6);
    objc_storeStrong((id *)&v19->_fourPMToEightPMBurden, a7);
    objc_storeStrong((id *)&v19->_eightPMToMidnightBurden, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  HKHRAFibBurdenTimeOfDayHistogram *v4;
  HKHRAFibBurdenTimeOfDayHistogram *v5;
  BOOL v6;

  v4 = (HKHRAFibBurdenTimeOfDayHistogram *)a3;
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
      v6 = -[HKHRAFibBurdenAnalysisResult isEqual:](self->_midnightToFourAMBurden, "isEqual:", v5->_midnightToFourAMBurden)&& -[HKHRAFibBurdenAnalysisResult isEqual:](self->_fourAMtoEightAMBurden, "isEqual:", v5->_fourAMtoEightAMBurden)&& -[HKHRAFibBurdenAnalysisResult isEqual:](self->_eightAMToNoonBurden, "isEqual:", v5->_eightAMToNoonBurden)&& -[HKHRAFibBurdenAnalysisResult isEqual:](self->_noonToFourPMBurden, "isEqual:", v5->_noonToFourPMBurden)&& -[HKHRAFibBurdenAnalysisResult isEqual:](self->_fourPMToEightPMBurden, "isEqual:", v5->_fourPMToEightPMBurden)&& -[HKHRAFibBurdenAnalysisResult isEqual:](self->_eightPMToMidnightBurden, "isEqual:", v5->_eightPMToMidnightBurden);

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

  v3 = -[HKHRAFibBurdenAnalysisResult hash](self->_midnightToFourAMBurden, "hash");
  v4 = -[HKHRAFibBurdenAnalysisResult hash](self->_fourAMtoEightAMBurden, "hash") ^ v3;
  v5 = -[HKHRAFibBurdenAnalysisResult hash](self->_eightAMToNoonBurden, "hash");
  v6 = v4 ^ v5 ^ -[HKHRAFibBurdenAnalysisResult hash](self->_noonToFourPMBurden, "hash");
  v7 = -[HKHRAFibBurdenAnalysisResult hash](self->_fourPMToEightPMBurden, "hash");
  return v6 ^ v7 ^ -[HKHRAFibBurdenAnalysisResult hash](self->_eightPMToMidnightBurden, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKHRAFibBurdenAnalysisResult *midnightToFourAMBurden;
  id v5;

  midnightToFourAMBurden = self->_midnightToFourAMBurden;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", midnightToFourAMBurden, CFSTR("MidnightToFourAMBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fourAMtoEightAMBurden, CFSTR("FourAMtoEightAMBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eightAMToNoonBurden, CFSTR("EightAMToNoonBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_noonToFourPMBurden, CFSTR("NoonToFourPMBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fourPMToEightPMBurden, CFSTR("FourPMToEightPMBurdenKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eightPMToMidnightBurden, CFSTR("EightPMToMidnightBurdenKey"));

}

- (HKHRAFibBurdenTimeOfDayHistogram)initWithCoder:(id)a3
{
  id v4;
  HKHRAFibBurdenTimeOfDayHistogram *v5;
  uint64_t v6;
  HKHRAFibBurdenAnalysisResult *midnightToFourAMBurden;
  uint64_t v8;
  HKHRAFibBurdenAnalysisResult *fourAMtoEightAMBurden;
  uint64_t v10;
  HKHRAFibBurdenAnalysisResult *eightAMToNoonBurden;
  uint64_t v12;
  HKHRAFibBurdenAnalysisResult *noonToFourPMBurden;
  uint64_t v14;
  HKHRAFibBurdenAnalysisResult *fourPMToEightPMBurden;
  uint64_t v16;
  HKHRAFibBurdenAnalysisResult *eightPMToMidnightBurden;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKHRAFibBurdenTimeOfDayHistogram;
  v5 = -[HKHRAFibBurdenTimeOfDayHistogram init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MidnightToFourAMBurdenKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    midnightToFourAMBurden = v5->_midnightToFourAMBurden;
    v5->_midnightToFourAMBurden = (HKHRAFibBurdenAnalysisResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FourAMtoEightAMBurdenKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    fourAMtoEightAMBurden = v5->_fourAMtoEightAMBurden;
    v5->_fourAMtoEightAMBurden = (HKHRAFibBurdenAnalysisResult *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EightAMToNoonBurdenKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    eightAMToNoonBurden = v5->_eightAMToNoonBurden;
    v5->_eightAMToNoonBurden = (HKHRAFibBurdenAnalysisResult *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NoonToFourPMBurdenKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    noonToFourPMBurden = v5->_noonToFourPMBurden;
    v5->_noonToFourPMBurden = (HKHRAFibBurdenAnalysisResult *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FourPMToEightPMBurdenKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    fourPMToEightPMBurden = v5->_fourPMToEightPMBurden;
    v5->_fourPMToEightPMBurden = (HKHRAFibBurdenAnalysisResult *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EightPMToMidnightBurdenKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    eightPMToMidnightBurden = v5->_eightPMToMidnightBurden;
    v5->_eightPMToMidnightBurden = (HKHRAFibBurdenAnalysisResult *)v16;

  }
  return v5;
}

- (HKHRAFibBurdenAnalysisResult)midnightToFourAMBurden
{
  return self->_midnightToFourAMBurden;
}

- (HKHRAFibBurdenAnalysisResult)fourAMtoEightAMBurden
{
  return self->_fourAMtoEightAMBurden;
}

- (HKHRAFibBurdenAnalysisResult)eightAMToNoonBurden
{
  return self->_eightAMToNoonBurden;
}

- (HKHRAFibBurdenAnalysisResult)noonToFourPMBurden
{
  return self->_noonToFourPMBurden;
}

- (HKHRAFibBurdenAnalysisResult)fourPMToEightPMBurden
{
  return self->_fourPMToEightPMBurden;
}

- (HKHRAFibBurdenAnalysisResult)eightPMToMidnightBurden
{
  return self->_eightPMToMidnightBurden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eightPMToMidnightBurden, 0);
  objc_storeStrong((id *)&self->_fourPMToEightPMBurden, 0);
  objc_storeStrong((id *)&self->_noonToFourPMBurden, 0);
  objc_storeStrong((id *)&self->_eightAMToNoonBurden, 0);
  objc_storeStrong((id *)&self->_fourAMtoEightAMBurden, 0);
  objc_storeStrong((id *)&self->_midnightToFourAMBurden, 0);
}

@end

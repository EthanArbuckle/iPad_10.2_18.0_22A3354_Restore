@implementation HKElectrocardiogramVoltageMeasurement

- (HKElectrocardiogramVoltageMeasurement)initWithLeadIVoltage:(id)a3 timeSinceSampleStart:(double)a4
{
  id v6;
  HKElectrocardiogramVoltageMeasurement *v7;
  uint64_t v8;
  HKQuantity *leadIVoltage;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramVoltageMeasurement;
  v7 = -[HKElectrocardiogramVoltageMeasurement init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    leadIVoltage = v7->_leadIVoltage;
    v7->_leadIVoltage = (HKQuantity *)v8;

    v7->_timeSinceSampleStart = a4;
  }

  return v7;
}

- (HKQuantity)quantityForLead:(HKElectrocardiogramLead)lead
{
  if (lead == HKElectrocardiogramLeadAppleWatchSimilarToLeadI)
    return self->_leadIVoltage;
  else
    return (HKQuantity *)0;
}

- (unint64_t)hash
{
  double timeSinceSampleStart;

  timeSinceSampleStart = self->_timeSinceSampleStart;
  return -[HKQuantity hash](self->_leadIVoltage, "hash") ^ *(_QWORD *)&timeSinceSampleStart;
}

- (BOOL)isEqual:(id)a3
{
  HKElectrocardiogramVoltageMeasurement *v4;
  HKQuantity *leadIVoltage;
  HKQuantity *v6;
  char v7;

  v4 = (HKElectrocardiogramVoltageMeasurement *)a3;
  if (self == v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_timeSinceSampleStart != v4->_timeSinceSampleStart)
    goto LABEL_7;
  leadIVoltage = self->_leadIVoltage;
  v6 = v4->_leadIVoltage;
  if (leadIVoltage == v6)
  {
LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = -[HKQuantity isEqual:](leadIVoltage, "isEqual:");
LABEL_9:

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %lf %@>"), self, self, *(_QWORD *)&self->_timeSinceSampleStart, self->_leadIVoltage);
}

- (NSTimeInterval)timeSinceSampleStart
{
  return self->_timeSinceSampleStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadIVoltage, 0);
}

@end

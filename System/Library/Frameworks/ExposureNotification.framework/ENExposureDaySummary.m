@implementation ENExposureDaySummary

- (ENExposureDaySummary)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureDaySummary *v7;
  void *v8;
  ENExposureSummaryItem *v9;
  ENExposureSummaryItem *confirmedTestSummary;
  ENExposureSummaryItem *v11;
  ENExposureSummaryItem *confirmedClinicalDiagnosisSummary;
  ENExposureSummaryItem *v13;
  ENExposureSummaryItem *recursiveSummary;
  ENExposureSummaryItem *v15;
  ENExposureSummaryItem *selfReportedSummary;
  ENExposureSummaryItem *v17;
  ENExposureSummaryItem *daySummary;
  ENExposureDaySummary *v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ENExposureDaySummary;
  v7 = -[ENExposureDaySummary init](&v21, sel_init);
  if (!v7)
  {
    if (!a4)
      goto LABEL_18;
LABEL_22:
    ENErrorF(2);
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_18;
    goto LABEL_22;
  }
  if (!CUXPCDecodeDouble())
  {
LABEL_18:
    v19 = 0;
    goto LABEL_16;
  }
  xpc_dictionary_get_dictionary(v6, "siCT");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[ENExposureSummaryItem initWithXPCObject:error:]([ENExposureSummaryItem alloc], "initWithXPCObject:error:", v8, a4);
    confirmedTestSummary = v7->_confirmedTestSummary;
    v7->_confirmedTestSummary = v9;

    if (!v7->_confirmedTestSummary)
      goto LABEL_17;
  }

  xpc_dictionary_get_dictionary(v6, "siCC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = -[ENExposureSummaryItem initWithXPCObject:error:]([ENExposureSummaryItem alloc], "initWithXPCObject:error:", v8, a4);
    confirmedClinicalDiagnosisSummary = v7->_confirmedClinicalDiagnosisSummary;
    v7->_confirmedClinicalDiagnosisSummary = v11;

    if (!v7->_confirmedClinicalDiagnosisSummary)
      goto LABEL_17;
  }

  xpc_dictionary_get_dictionary(v6, "siRC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13 = -[ENExposureSummaryItem initWithXPCObject:error:]([ENExposureSummaryItem alloc], "initWithXPCObject:error:", v8, a4);
    recursiveSummary = v7->_recursiveSummary;
    v7->_recursiveSummary = v13;

    if (!v7->_recursiveSummary)
      goto LABEL_17;
  }

  xpc_dictionary_get_dictionary(v6, "siSR");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = -[ENExposureSummaryItem initWithXPCObject:error:]([ENExposureSummaryItem alloc], "initWithXPCObject:error:", v8, a4);
    selfReportedSummary = v7->_selfReportedSummary;
    v7->_selfReportedSummary = v15;

    if (!v7->_selfReportedSummary)
    {
LABEL_17:

      goto LABEL_18;
    }
  }

  xpc_dictionary_get_dictionary(v6, "siDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v17 = -[ENExposureSummaryItem initWithXPCObject:error:]([ENExposureSummaryItem alloc], "initWithXPCObject:error:", v8, a4);
    if (v17)
    {
      daySummary = v7->_daySummary;
      v7->_daySummary = v17;

      goto LABEL_15;
    }
    goto LABEL_17;
  }
LABEL_15:

  v19 = v7;
LABEL_16:

  return v19;
}

- (void)encodeWithXPCObject:(id)a3
{
  NSDate *v4;
  NSDate *v5;
  double v6;
  ENExposureSummaryItem *confirmedTestSummary;
  ENExposureSummaryItem *v8;
  xpc_object_t v9;
  ENExposureSummaryItem *confirmedClinicalDiagnosisSummary;
  ENExposureSummaryItem *v11;
  xpc_object_t v12;
  ENExposureSummaryItem *recursiveSummary;
  ENExposureSummaryItem *v14;
  xpc_object_t v15;
  ENExposureSummaryItem *selfReportedSummary;
  ENExposureSummaryItem *v17;
  xpc_object_t v18;
  ENExposureSummaryItem *daySummary;
  void *v20;
  ENExposureSummaryItem *v21;
  xpc_object_t v22;
  xpc_object_t xdict;

  xdict = a3;
  v4 = self->_date;
  v5 = v4;
  if (v4)
  {
    -[NSDate timeIntervalSinceReferenceDate](v4, "timeIntervalSinceReferenceDate");
    if (v6 != 0.0)
      xpc_dictionary_set_double(xdict, "tims", v6);
  }

  confirmedTestSummary = self->_confirmedTestSummary;
  if (confirmedTestSummary)
  {
    v8 = confirmedTestSummary;
    v9 = xpc_dictionary_create(0, 0, 0);
    -[ENExposureSummaryItem encodeWithXPCObject:](v8, "encodeWithXPCObject:", v9);

    xpc_dictionary_set_value(xdict, "siCT", v9);
  }
  confirmedClinicalDiagnosisSummary = self->_confirmedClinicalDiagnosisSummary;
  if (confirmedClinicalDiagnosisSummary)
  {
    v11 = confirmedClinicalDiagnosisSummary;
    v12 = xpc_dictionary_create(0, 0, 0);
    -[ENExposureSummaryItem encodeWithXPCObject:](v11, "encodeWithXPCObject:", v12);

    xpc_dictionary_set_value(xdict, "siCC", v12);
  }
  recursiveSummary = self->_recursiveSummary;
  if (recursiveSummary)
  {
    v14 = recursiveSummary;
    v15 = xpc_dictionary_create(0, 0, 0);
    -[ENExposureSummaryItem encodeWithXPCObject:](v14, "encodeWithXPCObject:", v15);

    xpc_dictionary_set_value(xdict, "siRC", v15);
  }
  selfReportedSummary = self->_selfReportedSummary;
  if (selfReportedSummary)
  {
    v17 = selfReportedSummary;
    v18 = xpc_dictionary_create(0, 0, 0);
    -[ENExposureSummaryItem encodeWithXPCObject:](v17, "encodeWithXPCObject:", v18);

    xpc_dictionary_set_value(xdict, "siSR", v18);
  }
  daySummary = self->_daySummary;
  v20 = xdict;
  if (daySummary)
  {
    v21 = daySummary;
    v22 = xpc_dictionary_create(0, 0, 0);
    -[ENExposureSummaryItem encodeWithXPCObject:](v21, "encodeWithXPCObject:", v22);

    xpc_dictionary_set_value(xdict, "siDay", v22);
    v20 = xdict;
  }

}

- (id)description
{
  id v3;
  ENExposureSummaryItem *daySummary;
  ENExposureSummaryItem *v5;
  id v6;
  ENExposureSummaryItem *confirmedTestSummary;
  ENExposureSummaryItem *v8;
  id v9;
  ENExposureSummaryItem *confirmedClinicalDiagnosisSummary;
  ENExposureSummaryItem *v11;
  id v12;
  ENExposureSummaryItem *recursiveSummary;
  ENExposureSummaryItem *v14;
  id v15;
  ENExposureSummaryItem *selfReportedSummary;
  ENExposureSummaryItem *v17;
  id v18;
  NSDate *date;
  id v21;

  NSAppendPrintF_safe();
  v21 = 0;
  date = self->_date;
  NSAppendPrintF_safe();
  v3 = v21;

  daySummary = self->_daySummary;
  if (daySummary)
  {
    v5 = daySummary;
    -[ENExposureSummaryItem maximumScore](v5, "maximumScore", date);
    -[ENExposureSummaryItem scoreSum](v5, "scoreSum");
    -[ENExposureSummaryItem weightedDurationSum](v5, "weightedDurationSum");
    NSAppendPrintF_safe();
    v6 = v3;

    v3 = v6;
  }
  confirmedTestSummary = self->_confirmedTestSummary;
  if (confirmedTestSummary)
  {
    v8 = confirmedTestSummary;
    -[ENExposureSummaryItem maximumScore](v8, "maximumScore");
    -[ENExposureSummaryItem scoreSum](v8, "scoreSum");
    -[ENExposureSummaryItem weightedDurationSum](v8, "weightedDurationSum");
    NSAppendPrintF_safe();
    v9 = v3;

    v3 = v9;
  }
  confirmedClinicalDiagnosisSummary = self->_confirmedClinicalDiagnosisSummary;
  if (confirmedClinicalDiagnosisSummary)
  {
    v11 = confirmedClinicalDiagnosisSummary;
    -[ENExposureSummaryItem maximumScore](v11, "maximumScore");
    -[ENExposureSummaryItem scoreSum](v11, "scoreSum");
    -[ENExposureSummaryItem weightedDurationSum](v11, "weightedDurationSum");
    NSAppendPrintF_safe();
    v12 = v3;

    v3 = v12;
  }
  recursiveSummary = self->_recursiveSummary;
  if (recursiveSummary)
  {
    v14 = recursiveSummary;
    -[ENExposureSummaryItem maximumScore](v14, "maximumScore");
    -[ENExposureSummaryItem scoreSum](v14, "scoreSum");
    -[ENExposureSummaryItem weightedDurationSum](v14, "weightedDurationSum");
    NSAppendPrintF_safe();
    v15 = v3;

    v3 = v15;
  }
  selfReportedSummary = self->_selfReportedSummary;
  if (selfReportedSummary)
  {
    v17 = selfReportedSummary;
    -[ENExposureSummaryItem maximumScore](v17, "maximumScore");
    -[ENExposureSummaryItem scoreSum](v17, "scoreSum");
    -[ENExposureSummaryItem weightedDurationSum](v17, "weightedDurationSum");
    NSAppendPrintF_safe();
    v18 = v3;

    v3 = v18;
  }
  return v3;
}

- (void)roundDurations
{
  -[ENExposureSummaryItem roundDurations](self->_confirmedTestSummary, "roundDurations");
  -[ENExposureSummaryItem roundDurations](self->_confirmedClinicalDiagnosisSummary, "roundDurations");
  -[ENExposureSummaryItem roundDurations](self->_recursiveSummary, "roundDurations");
  -[ENExposureSummaryItem roundDurations](self->_selfReportedSummary, "roundDurations");
  -[ENExposureSummaryItem roundDurations](self->_daySummary, "roundDurations");
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ENExposureSummaryItem)confirmedTestSummary
{
  return self->_confirmedTestSummary;
}

- (void)setConfirmedTestSummary:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedTestSummary, a3);
}

- (ENExposureSummaryItem)confirmedClinicalDiagnosisSummary
{
  return self->_confirmedClinicalDiagnosisSummary;
}

- (void)setConfirmedClinicalDiagnosisSummary:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedClinicalDiagnosisSummary, a3);
}

- (ENExposureSummaryItem)recursiveSummary
{
  return self->_recursiveSummary;
}

- (void)setRecursiveSummary:(id)a3
{
  objc_storeStrong((id *)&self->_recursiveSummary, a3);
}

- (ENExposureSummaryItem)selfReportedSummary
{
  return self->_selfReportedSummary;
}

- (void)setSelfReportedSummary:(id)a3
{
  objc_storeStrong((id *)&self->_selfReportedSummary, a3);
}

- (ENExposureSummaryItem)daySummary
{
  return self->_daySummary;
}

- (void)setDaySummary:(id)a3
{
  objc_storeStrong((id *)&self->_daySummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daySummary, 0);
  objc_storeStrong((id *)&self->_selfReportedSummary, 0);
  objc_storeStrong((id *)&self->_recursiveSummary, 0);
  objc_storeStrong((id *)&self->_confirmedClinicalDiagnosisSummary, 0);
  objc_storeStrong((id *)&self->_confirmedTestSummary, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end

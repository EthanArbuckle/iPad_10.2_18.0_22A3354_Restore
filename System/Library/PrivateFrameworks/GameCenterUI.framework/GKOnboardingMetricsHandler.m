@implementation GKOnboardingMetricsHandler

- (GKOnboardingMetricsHandler)initWithReporter:(id)a3 refApp:(id)a4
{
  id v5;
  GKOnboardingMetricsHandler *v6;
  GKOnboardingMetricsHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKOnboardingMetricsHandler;
  v6 = -[GKOnboardingMetricsHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[GKOnboardingMetricsHandler setReporter:](v6, "setReporter:", v5);

  return v7;
}

- (void)onboardingDidBegin
{
  -[GKOnboardingMetricsHandler setAnalyticsStartTime:](self, "setAnalyticsStartTime:", CFAbsoluteTimeGetCurrent());
}

- (void)onboardingDidEnd
{
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  -[GKOnboardingMetricsHandler reporter](self, "reporter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D25120];
  -[GKOnboardingMetricsHandler analyticsStartTime](self, "analyticsStartTime");
  v5 = v4;
  -[GKOnboardingMetricsHandler refApp](self, "refApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportOnboardingEventForType:withStartTimestamp:refApp:", v3, v6, v5);

}

- (void)reportEventForOnboardingFlowAction:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D25460])
    v5 = (id)GKOSLoggers();
  v6 = (void *)*MEMORY[0x1E0D25478];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v6;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v9;
    _os_log_impl(&dword_1AB361000, v8, OS_LOG_TYPE_INFO, "Onboarding flow finished with action %@", (uint8_t *)&v15, 0xCu);

  }
  -[GKOnboardingMetricsHandler reporter](self, "reporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D250A0];
  objc_msgSend(v10, "reportEvent:type:", *MEMORY[0x1E0D250A0], *MEMORY[0x1E0D250F8]);

  v12 = (_QWORD *)MEMORY[0x1E0D25158];
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_18;
    case 1uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25160];
      goto LABEL_18;
    case 3uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25168];
      goto LABEL_18;
    case 4uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D251B0];
      goto LABEL_18;
    case 5uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25150];
      goto LABEL_18;
    case 6uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25190];
      goto LABEL_18;
    case 7uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25178];
      goto LABEL_18;
    case 8uLL:
      -[GKOnboardingMetricsHandler reporter](self, "reporter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reportEvent:type:", v11, *MEMORY[0x1E0D25198]);

      v12 = (_QWORD *)MEMORY[0x1E0D251B8];
      goto LABEL_18;
    case 9uLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25130];
      goto LABEL_18;
    case 0xAuLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25100];
      goto LABEL_18;
    case 0xBuLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25110];
      goto LABEL_18;
    case 0xCuLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25108];
      goto LABEL_18;
    case 0xDuLL:
      v12 = (_QWORD *)MEMORY[0x1E0D25170];
LABEL_18:
      -[GKOnboardingMetricsHandler reporter](self, "reporter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reportEvent:type:", v11, *v12);

      break;
    default:
      return;
  }
}

- (double)analyticsStartTime
{
  return self->_analyticsStartTime;
}

- (void)setAnalyticsStartTime:(double)a3
{
  self->_analyticsStartTime = a3;
}

- (GKReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (NSString)refApp
{
  return self->_refApp;
}

- (void)setRefApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refApp, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end

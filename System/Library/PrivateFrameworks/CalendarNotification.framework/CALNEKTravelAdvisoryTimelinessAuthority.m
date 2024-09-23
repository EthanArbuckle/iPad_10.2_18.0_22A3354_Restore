@implementation CALNEKTravelAdvisoryTimelinessAuthority

- (CALNEKTravelAdvisoryTimelinessAuthority)initWithTravelAdvisoryTimelinessAuthority:(id)a3
{
  id v5;
  CALNEKTravelAdvisoryTimelinessAuthority *v6;
  CALNEKTravelAdvisoryTimelinessAuthority *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNEKTravelAdvisoryTimelinessAuthority;
  v6 = -[CALNEKTravelAdvisoryTimelinessAuthority init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_travelAdvisoryTimelinessAuthority, a3);

  return v7;
}

- (unint64_t)periodForHypothesis:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CALNEKTravelAdvisoryTimelinessAuthority travelAdvisoryTimelinessAuthority](self, "travelAdvisoryTimelinessAuthority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithHypothesis:", v4);

  v6 = objc_msgSend(v5, "period");
  return v6;
}

- (id)startOfLeaveNowPeriodForHypothesis:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[CALNEKTravelAdvisoryTimelinessAuthority travelAdvisoryTimelinessAuthority](self, "travelAdvisoryTimelinessAuthority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithHypothesis:", v4);
  objc_msgSend(v5, "startOfLeaveNowPeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CALNEKTravelAdvisoryTimelinessAuthority startOfLeaveNowPeriodForHypothesis:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

  }
  return v6;
}

- (id)startOfRunningLatePeriodForHypothesis:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[CALNEKTravelAdvisoryTimelinessAuthority travelAdvisoryTimelinessAuthority](self, "travelAdvisoryTimelinessAuthority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithHypothesis:", v4);
  objc_msgSend(v5, "startOfRunningLatePeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CALNEKTravelAdvisoryTimelinessAuthority startOfRunningLatePeriodForHypothesis:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

  }
  return v6;
}

- (EKTravelAdvisoryTimelinessAuthority)travelAdvisoryTimelinessAuthority
{
  return self->_travelAdvisoryTimelinessAuthority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelAdvisoryTimelinessAuthority, 0);
}

- (void)startOfLeaveNowPeriodForHypothesis:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Could not get start of leave now period for hypothesis = %@", a5, a6, a7, a8, 2u);
}

- (void)startOfRunningLatePeriodForHypothesis:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Could not get start of running late period for hypothesis = %@", a5, a6, a7, a8, 2u);
}

@end

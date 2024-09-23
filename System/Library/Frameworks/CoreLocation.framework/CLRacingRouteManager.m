@implementation CLRacingRouteManager

- (unint64_t)configureWithWorkoutActivityType:(unint64_t)a3 bufferSize:(unint64_t)a4 offRouteGraceDurationInSec:(unint64_t)a5
{
  int v5;
  int v7;
  int v8;
  int v9;

  if ((uint64_t)a3 > 51)
  {
    if (a3 - 70 < 2)
    {
      v5 = 90603;
      goto LABEL_12;
    }
    if (a3 != 52)
    {
LABEL_11:
      v5 = 62;
      goto LABEL_12;
    }
LABEL_9:
    v5 = 4;
    goto LABEL_12;
  }
  if (a3 == 13)
  {
    v5 = 6;
    goto LABEL_12;
  }
  if (a3 == 24)
    goto LABEL_9;
  if (a3 != 37)
    goto LABEL_11;
  v5 = 8;
LABEL_12:
  v9 = v5;
  v7 = a5;
  v8 = a4;
  return sub_18F65C2D8((uint64_t)&self->clrr, &v9, &v8, &v7);
}

- (unint64_t)numberOfRoutePointsToAdd
{
  return (int)sub_18F658D6C((uint64_t)&self->clrr);
}

- (unint64_t)addRoutePoints:(id)a3
{
  uint64_t v3;

  if (a3)
    return sub_18F658F2C((uint64_t)&self->clrr, a3, (uint64_t)a3, v3);
  else
    return 4;
}

- (id)advanceToPoint:(id)a3
{
  CLRacingRoutePerformanceResults *v5;
  const char *v6;
  uint64_t v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CLRacingRoutePerformanceResults *v13;
  const char *v14;
  uint64_t v15;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v5 = [CLRacingRoutePerformanceResults alloc];
  result = (id)objc_msgSend_initWithTimeAhead_currentDistance_referenceDistance_currentAveragePace_totalOverlapDistance_state_(v5, v6, 4, v7, 604800.0, -1.0, -1.0, -1.0, -1.0);
  if (a3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    memset(v16, 0, sizeof(v16));
    v10 = sub_18F65C7E8((uint64_t)&self->clrr, a3, (uint64_t)v16, v9);
    v11 = *(double *)&v23 - *((double *)&v17 + 1);
    v12 = *(double *)&v24;
    v13 = [CLRacingRoutePerformanceResults alloc];
    return (id)objc_msgSend_initWithTimeAhead_currentDistance_referenceDistance_currentAveragePace_totalOverlapDistance_state_(v13, v14, v10, v15, v11, *(double *)&v20, *((double *)&v25 + 1), *((double *)&v19 + 1), v12);
  }
  return result;
}

- (void)reset
{
  sub_18F65E9E0((uint64_t)&self->clrr);
}

- (id)getRaceParameters
{
  return sub_18F65FA00((uint64_t)&self->clrr);
}

- (BOOL)setRaceParameters:(id)a3
{
  if (a3)
    return sub_18F65EA94((uint64_t)&self->clrr, a3);
  else
    return 0;
}

- (double)recoverRaceAtTimestamp
{
  return self->clrr.fTimestampOfLastMatchedPointOnReferenceRoute_s;
}

- (void).cxx_destruct
{
  sub_18F650D00((uint64_t)&self->clrr);
}

- (id).cxx_construct
{
  sub_18F650C04((uint64_t)&self->clrr);
  return self;
}

@end

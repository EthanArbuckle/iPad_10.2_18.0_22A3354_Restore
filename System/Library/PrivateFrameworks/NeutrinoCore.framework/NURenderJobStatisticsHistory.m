@implementation NURenderJobStatisticsHistory

- (id)initHistoryForJobsWithName:(id)a3 rollingHistoryMaxSize:(unint64_t)a4
{
  id v7;
  NURenderJobStatisticsHistory *v8;
  NURenderJobStatisticsHistory *v9;
  NURenderJobStatisticsHistogram *v10;
  NURenderJobStatisticsHistogram *histogram;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NURenderJobStatisticsHistory;
  v8 = -[NURenderJobStatisticsHistory init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_jobRequestName, a3);
    v9->_timeBetweenJobCreations = (double *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    v9->_timeBetweenJobDeliveries = (double *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    v9->_rollingHistoryMaxSize = a4;
    v10 = -[NURenderJobStatisticsHistogram initWithBins:millisPerBin:]([NURenderJobStatisticsHistogram alloc], "initWithBins:millisPerBin:", 2048, 0.05);
    histogram = v9->_histogram;
    v9->_histogram = v10;

    *(_OWORD *)&v9->_deliveriesHead = 0u;
    *(_OWORD *)&v9->_creationsSize = 0u;
    *(_OWORD *)&v9->_prevCreatedTime = 0u;
  }

  return v9;
}

- (void)recordJobCreated
{
  double v3;
  double v4;
  unint64_t rollingHistoryMaxSize;
  unint64_t creationsHead;
  unint64_t creationsSize;
  unint64_t v8;

  v3 = NUAbsoluteTime();
  ++self->_jobCount;
  +[NURenderJobStatisticsHistory setTotalSchedulerJobCount:](NURenderJobStatisticsHistory, "setTotalSchedulerJobCount:", +[NURenderJobStatisticsHistory totalSchedulerJobCount](NURenderJobStatisticsHistory, "totalSchedulerJobCount")+ 1);
  v4 = v3 - self->_prevCreatedTime;
  if (v4 < 3.0)
  {
    rollingHistoryMaxSize = self->_rollingHistoryMaxSize;
    creationsHead = self->_creationsHead;
    creationsSize = self->_creationsSize;
    self->_timeBetweenJobCreations[creationsHead] = v4;
    v8 = (creationsHead + 1) % rollingHistoryMaxSize;
    if (rollingHistoryMaxSize >= creationsSize + 1)
      rollingHistoryMaxSize = creationsSize + 1;
    self->_creationsHead = v8;
    self->_creationsSize = rollingHistoryMaxSize;
  }
  self->_prevCreatedTime = v3;
}

- (void)addStatisticsToHistory:(id)a3 wasCanceled:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  unint64_t deliveriesHead;
  unint64_t deliveriesSize;
  unint64_t v11;
  unint64_t rollingHistoryMaxSize;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  v4 = a4;
  v30 = a3;
  v6 = NUAbsoluteTime();
  if (v4)
  {
    if (+[NUGlobalSettings renderJobDebugCaptureCanceledJobs](NUGlobalSettings, "renderJobDebugCaptureCanceledJobs", v6))
    {
      -[NURenderJobStatisticsHistogram addStatisticsToHistogram:](self->_histogram, "addStatisticsToHistogram:", v30);
    }
    ++self->_canceledJobsCount;
    +[NURenderJobStatisticsHistory setTotalSchedulerCanceledJobCount:](NURenderJobStatisticsHistory, "setTotalSchedulerCanceledJobCount:", +[NURenderJobStatisticsHistory totalSchedulerCanceledJobCount](NURenderJobStatisticsHistory, "totalSchedulerCanceledJobCount")+ 1);
  }
  else
  {
    v7 = v6;
    -[NURenderJobStatisticsHistogram addStatisticsToHistogram:](self->_histogram, "addStatisticsToHistogram:", v30);
    v8 = v7 - self->_prevDeliveredTime;
    if (v8 < 3.0)
    {
      deliveriesHead = self->_deliveriesHead;
      deliveriesSize = self->_deliveriesSize;
      self->_timeBetweenJobDeliveries[deliveriesHead] = v8;
      v11 = deliveriesHead + 1;
      rollingHistoryMaxSize = self->_rollingHistoryMaxSize;
      v13 = v11 % rollingHistoryMaxSize;
      if (rollingHistoryMaxSize >= deliveriesSize + 1)
        rollingHistoryMaxSize = deliveriesSize + 1;
      self->_deliveriesHead = v13;
      self->_deliveriesSize = rollingHistoryMaxSize;
    }
    self->_prevDeliveredTime = v7;
    ++self->_deliveredJobsCount;
    +[NURenderJobStatisticsHistory setTotalSchedulerDeliveredJobCount:](NURenderJobStatisticsHistory, "setTotalSchedulerDeliveredJobCount:", +[NURenderJobStatisticsHistory totalSchedulerDeliveredJobCount](NURenderJobStatisticsHistory, "totalSchedulerDeliveredJobCount")+ 1);
  }
  objc_msgSend(v30, "prepareDuration");
  v15 = v14;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingPrepare](NURenderJobStatisticsHistory, "totalSchedulerTimeExecutingPrepare");
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecutingPrepare:](NURenderJobStatisticsHistory, "setTotalSchedulerTimeExecutingPrepare:", v15 + v16);
  objc_msgSend(v30, "renderDuration");
  v18 = v17;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingRender](NURenderJobStatisticsHistory, "totalSchedulerTimeExecutingRender");
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecutingRender:](NURenderJobStatisticsHistory, "setTotalSchedulerTimeExecutingRender:", v18 + v19);
  objc_msgSend(v30, "completeDuration");
  v21 = v20;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingComplete](NURenderJobStatisticsHistory, "totalSchedulerTimeExecutingComplete");
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecutingComplete:](NURenderJobStatisticsHistory, "setTotalSchedulerTimeExecutingComplete:", v21 + v22);
  objc_msgSend(v30, "duration");
  v24 = v23;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecuting](NURenderJobStatisticsHistory, "totalSchedulerTimeExecuting");
  +[NURenderJobStatisticsHistory setTotalSchedulerTimeExecuting:](NURenderJobStatisticsHistory, "setTotalSchedulerTimeExecuting:", v24 + v25);
  objc_msgSend(v30, "prepareDuration");
  self->_totalTimeExecutingPrepare = v26 + self->_totalTimeExecutingPrepare;
  objc_msgSend(v30, "renderDuration");
  self->_totalTimeExecutingRender = v27 + self->_totalTimeExecutingRender;
  objc_msgSend(v30, "completeDuration");
  self->_totalTimeExecutingComplete = v28 + self->_totalTimeExecutingComplete;
  objc_msgSend(v30, "duration");
  self->_totalTimeExecuting = v29 + self->_totalTimeExecuting;

}

- (id)description
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t deliveriesSize;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double *timeBetweenJobDeliveries;
  double v21;
  double v22;
  unint64_t creationsSize;
  double v24;
  double v25;
  double v26;
  double *timeBetweenJobCreations;
  double v28;
  double v29;
  double totalTimeExecutingPrepare;
  double v31;
  double totalTimeExecutingRender;
  double v33;
  double totalTimeExecutingComplete;
  double v35;
  double totalTimeExecuting;
  double v37;
  unint64_t jobCount;
  double v39;
  unint64_t deliveredJobsCount;
  double v41;
  unint64_t canceledJobsCount;
  double v43;
  void *v44;
  double v46;
  double v47;
  double v48;

  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingPrepare](NURenderJobStatisticsHistory, "totalSchedulerTimeExecutingPrepare");
  v4 = v3;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingRender](NURenderJobStatisticsHistory, "totalSchedulerTimeExecutingRender");
  v6 = v5;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecutingComplete](NURenderJobStatisticsHistory, "totalSchedulerTimeExecutingComplete");
  v47 = v7;
  +[NURenderJobStatisticsHistory totalSchedulerTimeExecuting](NURenderJobStatisticsHistory, "totalSchedulerTimeExecuting");
  v48 = v8;
  v9 = +[NURenderJobStatisticsHistory totalSchedulerJobCount](NURenderJobStatisticsHistory, "totalSchedulerJobCount");
  v10 = +[NURenderJobStatisticsHistory totalSchedulerCanceledJobCount](NURenderJobStatisticsHistory, "totalSchedulerCanceledJobCount");
  v11 = +[NURenderJobStatisticsHistory totalSchedulerDeliveredJobCount](NURenderJobStatisticsHistory, "totalSchedulerDeliveredJobCount");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2048);
  v13 = v12;
  deliveriesSize = self->_deliveriesSize;
  v15 = -1.0;
  v16 = -1.0;
  v17 = -1.0;
  v18 = -1.0;
  if (deliveriesSize)
  {
    v19 = (double)deliveriesSize;
    timeBetweenJobDeliveries = self->_timeBetweenJobDeliveries;
    v18 = 0.0;
    v16 = 1.79769313e308;
    v17 = 2.22507386e-308;
    do
    {
      v21 = *timeBetweenJobDeliveries++;
      v22 = v21;
      if (v21 < v16)
        v16 = v22;
      if (v22 > v17)
        v17 = v22;
      v18 = v18 + v22 / v19;
      --deliveriesSize;
    }
    while (deliveriesSize);
  }
  v46 = v6;
  creationsSize = self->_creationsSize;
  v24 = -1.0;
  v25 = -1.0;
  if (creationsSize)
  {
    v26 = (double)creationsSize;
    timeBetweenJobCreations = self->_timeBetweenJobCreations;
    v25 = 0.0;
    v15 = 1.79769313e308;
    v24 = 2.22507386e-308;
    do
    {
      v28 = *timeBetweenJobCreations++;
      v29 = v28;
      if (v28 < v15)
        v15 = v29;
      if (v29 > v24)
        v24 = v29;
      v25 = v25 + v29 / v26;
      --creationsSize;
    }
    while (creationsSize);
  }
  objc_msgSend(v12, "appendFormat:", CFSTR("FPS Stats:              avg   min   max \n"));
  objc_msgSend(v13, "appendFormat:", CFSTR("Job rate (submission): %.2f  %.2f  %.2f (sample count: %llu)\n"), 1.0 / v25, 1.0 / v24, 1.0 / v15, self->_creationsSize);
  objc_msgSend(v13, "appendFormat:", CFSTR("Job rate   (delivery): %.2f  %.2f  %.2f (sample count: %llu)\n"), 1.0 / v18, 1.0 / v17, 1.0 / v16, self->_deliveriesSize);
  objc_msgSend(v13, "appendFormat:", CFSTR("\nScheduler Time: (jobs of this name / all jobs) = %%  unit: seconds\n"));
  totalTimeExecutingPrepare = self->_totalTimeExecutingPrepare;
  if (v4 <= 0.0)
    v31 = 100.0;
  else
    v31 = totalTimeExecutingPrepare / v4 * 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Prepare  (execute): (%7.2f / %7.2f) = %.2f%%\n"), *(_QWORD *)&totalTimeExecutingPrepare, *(_QWORD *)&v4, *(_QWORD *)&v31);
  totalTimeExecutingRender = self->_totalTimeExecutingRender;
  if (v46 <= 0.0)
    v33 = 100.0;
  else
    v33 = totalTimeExecutingRender / v46 * 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Render   (execute): (%7.2f / %7.2f) = %.2f%%\n"), *(_QWORD *)&totalTimeExecutingRender, *(_QWORD *)&v46, *(_QWORD *)&v33);
  totalTimeExecutingComplete = self->_totalTimeExecutingComplete;
  if (v47 <= 0.0)
    v35 = 100.0;
  else
    v35 = totalTimeExecutingComplete / v47 * 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Complete (execute): (%7.2f / %7.2f) = %.2f%%\n"), *(_QWORD *)&totalTimeExecutingComplete, *(_QWORD *)&v47, *(_QWORD *)&v35);
  totalTimeExecuting = self->_totalTimeExecuting;
  if (v48 <= 0.0)
    v37 = 100.0;
  else
    v37 = totalTimeExecuting / v48 * 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Total    (execute): (%7.2f / %7.2f) = %.2f%%"), *(_QWORD *)&totalTimeExecuting, *(_QWORD *)&v48, *(_QWORD *)&v37);
  objc_msgSend(v13, "appendString:", CFSTR("\n\n"));
  objc_msgSend(v13, "appendFormat:", CFSTR("Scheduler Job Counts: (jobs of this name / all jobs) = %%\n"));
  jobCount = self->_jobCount;
  if (v9)
    v39 = (float)((float)((float)jobCount / (float)v9) * 100.0);
  else
    v39 = 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Jobs     (Total): (%5llu / %5llu) = %.2f%%\n"), jobCount, v9, *(_QWORD *)&v39);
  deliveredJobsCount = self->_deliveredJobsCount;
  if (v11)
    v41 = (float)((float)((float)deliveredJobsCount / (float)v11) * 100.0);
  else
    v41 = 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Jobs (Delivered): (%5llu / %5llu) = %.2f%%\n"), deliveredJobsCount, v11, *(_QWORD *)&v41);
  canceledJobsCount = self->_canceledJobsCount;
  if (v10)
    v43 = (float)((float)((float)canceledJobsCount / (float)v10) * 100.0);
  else
    v43 = 100.0;
  objc_msgSend(v13, "appendFormat:", CFSTR("Jobs (Coalesced): (%5llu / %5llu) = %.2f%%\n"), canceledJobsCount, v10, *(_QWORD *)&v43);
  -[NURenderJobStatisticsHistogram description](self->_histogram, "description");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("\n\nHistogram:\n\n%@"), v44);

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_timeBetweenJobCreations);
  free(self->_timeBetweenJobDeliveries);
  v3.receiver = self;
  v3.super_class = (Class)NURenderJobStatisticsHistory;
  -[NURenderJobStatisticsHistory dealloc](&v3, sel_dealloc);
}

- (NSString)jobRequestName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NURenderJobStatisticsHistogram)histogram
{
  return (NURenderJobStatisticsHistogram *)objc_getProperty(self, a2, 64, 1);
}

- (double)totalTimeExecutingPrepare
{
  return self->_totalTimeExecutingPrepare;
}

- (double)totalTimeExecutingRender
{
  return self->_totalTimeExecutingRender;
}

- (double)totalTimeExecutingComplete
{
  return self->_totalTimeExecutingComplete;
}

- (double)totalTimeExecuting
{
  return self->_totalTimeExecuting;
}

- (unint64_t)rollingHistoryMaxSize
{
  return self->_rollingHistoryMaxSize;
}

- (double)timeBetweenJobCreations
{
  return self->_timeBetweenJobCreations;
}

- (double)timeBetweenJobDeliveries
{
  return self->_timeBetweenJobDeliveries;
}

- (unint64_t)canceledJobsCount
{
  return self->_canceledJobsCount;
}

- (unint64_t)deliveredJobsCount
{
  return self->_deliveredJobsCount;
}

- (unint64_t)jobCount
{
  return self->_jobCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogram, 0);
  objc_storeStrong((id *)&self->_jobRequestName, 0);
}

+ (double)totalSchedulerTimeExecutingPrepare
{
  return *(double *)&_totalSchedulerTimeExecutingPrepare;
}

+ (double)totalSchedulerTimeExecutingRender
{
  return *(double *)&_totalSchedulerTimeExecutingRender;
}

+ (double)totalSchedulerTimeExecutingComplete
{
  return *(double *)&_totalSchedulerTimeExecutingComplete;
}

+ (double)totalSchedulerTimeExecuting
{
  return *(double *)&_totalSchedulerTimeExecuting;
}

+ (unint64_t)totalSchedulerCanceledJobCount
{
  return _totalSchedulerCanceledJobCount;
}

+ (unint64_t)totalSchedulerDeliveredJobCount
{
  return _totalSchedulerDeliveredJobCount;
}

+ (unint64_t)totalSchedulerJobCount
{
  return _totalSchedulerJobCount;
}

+ (void)setTotalSchedulerTimeExecutingPrepare:(double)a3
{
  _totalSchedulerTimeExecutingPrepare = *(_QWORD *)&a3;
}

+ (void)setTotalSchedulerTimeExecutingRender:(double)a3
{
  _totalSchedulerTimeExecutingRender = *(_QWORD *)&a3;
}

+ (void)setTotalSchedulerTimeExecutingComplete:(double)a3
{
  _totalSchedulerTimeExecutingComplete = *(_QWORD *)&a3;
}

+ (void)setTotalSchedulerTimeExecuting:(double)a3
{
  _totalSchedulerTimeExecuting = *(_QWORD *)&a3;
}

+ (void)setTotalSchedulerCanceledJobCount:(unint64_t)a3
{
  _totalSchedulerCanceledJobCount = a3;
}

+ (void)setTotalSchedulerDeliveredJobCount:(unint64_t)a3
{
  _totalSchedulerDeliveredJobCount = a3;
}

+ (void)setTotalSchedulerJobCount:(unint64_t)a3
{
  _totalSchedulerJobCount = a3;
}

@end

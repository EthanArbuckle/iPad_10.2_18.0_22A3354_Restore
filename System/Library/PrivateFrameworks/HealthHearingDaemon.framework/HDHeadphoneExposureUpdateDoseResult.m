@implementation HDHeadphoneExposureUpdateDoseResult

+ (id)resultForNoChange
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithStatistics:", 0);
}

+ (id)resultForUpdate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithStatistics:", v4);

  return v5;
}

- (id)_initWithStatistics:(id)a3
{
  id v5;
  HDHeadphoneExposureUpdateDoseResult *v6;
  HDHeadphoneExposureUpdateDoseResult *v7;
  HDHeadphoneExposureUpdateDoseResult *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHeadphoneExposureUpdateDoseResult;
  v6 = -[HDHeadphoneExposureUpdateDoseResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statistics, a3);
    v8 = v7;
  }

  return v7;
}

- (HDHeadphoneExposureStatisticsResult)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end

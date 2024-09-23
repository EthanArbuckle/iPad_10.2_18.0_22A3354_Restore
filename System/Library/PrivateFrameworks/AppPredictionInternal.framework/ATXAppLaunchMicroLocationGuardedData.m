@implementation ATXAppLaunchMicroLocationGuardedData

- (ATXAppLaunchMicroLocationGuardedData)initWithCurrentMicroLocation:(id)a3
{
  id v4;
  ATXAppLaunchMicroLocationGuardedData *v5;
  ATXAppLaunchMicroLocationGuardedData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXAppLaunchMicroLocationGuardedData;
  v5 = -[ATXAppLaunchMicroLocationGuardedData init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ATXAppLaunchMicroLocationGuardedData setCurrentMicroLocation:](v5, "setCurrentMicroLocation:", v4);

  return v6;
}

- (void)setCurrentMicroLocation:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  NSDictionary *v11;
  NSDate *currentMicroLocationDate;
  void *v13;
  NSDictionary *v14;
  NSDictionary *currentMicroLocation;
  NSDate *v16;
  id v17;

  v17 = a3;
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v17, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v17, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:", v9 * 0.5 + v7 * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && !-[ATXAppLaunchMicroLocationGuardedData microLocationExpired:](self, "microLocationExpired:", v10))
  {
    objc_msgSend(v17, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSDictionary *)objc_msgSend(v13, "copy");
    currentMicroLocation = self->_currentMicroLocation;
    self->_currentMicroLocation = v14;

    v16 = (NSDate *)objc_msgSend(v10, "copy");
    currentMicroLocationDate = self->_currentMicroLocationDate;
    self->_currentMicroLocationDate = v16;
  }
  else
  {
    v11 = self->_currentMicroLocation;
    self->_currentMicroLocation = 0;

    currentMicroLocationDate = self->_currentMicroLocationDate;
    self->_currentMicroLocationDate = 0;
  }

}

- (id)getCurrentMicroLocation
{
  NSDate *currentMicroLocationDate;
  NSDictionary *currentMicroLocation;

  if (-[ATXAppLaunchMicroLocationGuardedData microLocationExpired:](self, "microLocationExpired:", self->_currentMicroLocationDate))
  {
    currentMicroLocationDate = self->_currentMicroLocationDate;
    self->_currentMicroLocationDate = 0;

    currentMicroLocation = self->_currentMicroLocation;
    self->_currentMicroLocation = 0;

  }
  return self->_currentMicroLocation;
}

- (BOOL)microLocationExpired:(id)a3
{
  double v4;
  BOOL v6;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v6 = v4 > 0.0 || a3 == 0;
  return v4 <= -300.0 || v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationToActionKeyCorrelation, 0);
  objc_storeStrong((id *)&self->_locationToAppLaunchCorrelation, 0);
  objc_storeStrong((id *)&self->_currentMicroLocationDate, 0);
  objc_storeStrong((id *)&self->_currentMicroLocation, 0);
  objc_storeStrong(&self->_waitForUnlockNotificationToken, 0);
}

@end

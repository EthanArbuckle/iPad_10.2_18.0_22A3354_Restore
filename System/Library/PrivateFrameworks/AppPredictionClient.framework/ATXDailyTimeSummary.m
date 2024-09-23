@implementation ATXDailyTimeSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXDailyTimeSummary)initWithCoder:(id)a3
{
  id v4;
  ATXDailyTimeSummary *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ATXDailyTimeSummary;
  v5 = -[ATXDailyTimeSummary init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("screen"));
    v5->_screen = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("quality"));
    v5->_quality = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("outdoors"));
    v5->_outdoors = v8;
    ATXModeToString(0x10uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v9);
    v5->_noMode = v10;

    ATXModeToString(0xDuLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v11);
    v5->_dnd = v12;

    ATXModeToString(5uLL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v13);
    v5->_sleep = v14;

    ATXModeToString(4uLL);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v15);
    v5->_driving = v16;

    ATXModeToString(3uLL);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v17);
    v5->_exercise = v18;

    ATXModeToString(2uLL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v19);
    v5->_work = v20;

    ATXModeToString(1uLL);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v21);
    v5->_personal = v22;

    ATXModeToString(7uLL);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v23);
    v5->_reading = v24;

    ATXModeToString(6uLL);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v25);
    v5->_gaming = v26;

    ATXModeToString(0xEuLL);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v27);
    v5->_mindfulness = v28;

    v5->_silencedNotificationCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationsSilenced"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double outdoors;
  double noMode;
  void *v6;
  double dnd;
  void *v8;
  double sleep;
  void *v10;
  double driving;
  void *v12;
  double exercise;
  void *v14;
  double work;
  void *v16;
  double personal;
  void *v18;
  double reading;
  void *v20;
  double gaming;
  void *v22;
  double mindfulness;
  void *v24;
  id v25;

  outdoors = self->_outdoors;
  v25 = a3;
  objc_msgSend(v25, "encodeDouble:forKey:", CFSTR("outdoors"), outdoors);
  objc_msgSend(v25, "encodeDouble:forKey:", CFSTR("screen"), self->_screen);
  objc_msgSend(v25, "encodeDouble:forKey:", CFSTR("quality"), self->_quality);
  noMode = self->_noMode;
  ATXModeToString(0x10uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v6, noMode);

  dnd = self->_dnd;
  ATXModeToString(0xDuLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v8, dnd);

  sleep = self->_sleep;
  ATXModeToString(5uLL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v10, sleep);

  driving = self->_driving;
  ATXModeToString(4uLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v12, driving);

  exercise = self->_exercise;
  ATXModeToString(3uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v14, exercise);

  work = self->_work;
  ATXModeToString(2uLL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v16, work);

  personal = self->_personal;
  ATXModeToString(1uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v18, personal);

  reading = self->_reading;
  ATXModeToString(7uLL);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v20, reading);

  gaming = self->_gaming;
  ATXModeToString(6uLL);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v22, gaming);

  mindfulness = self->_mindfulness;
  ATXModeToString(0xEuLL);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "encodeDouble:forKey:", v24, mindfulness);

  objc_msgSend(v25, "encodeInteger:forKey:", self->_silencedNotificationCount, CFSTR("notificationsSilenced"));
}

- (double)outdoors
{
  return self->_outdoors;
}

- (void)setOutdoors:(double)a3
{
  self->_outdoors = a3;
}

- (double)screen
{
  return self->_screen;
}

- (void)setScreen:(double)a3
{
  self->_screen = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (double)noMode
{
  return self->_noMode;
}

- (void)setNoMode:(double)a3
{
  self->_noMode = a3;
}

- (double)dnd
{
  return self->_dnd;
}

- (void)setDnd:(double)a3
{
  self->_dnd = a3;
}

- (double)sleep
{
  return self->_sleep;
}

- (void)setSleep:(double)a3
{
  self->_sleep = a3;
}

- (double)driving
{
  return self->_driving;
}

- (void)setDriving:(double)a3
{
  self->_driving = a3;
}

- (double)exercise
{
  return self->_exercise;
}

- (void)setExercise:(double)a3
{
  self->_exercise = a3;
}

- (double)work
{
  return self->_work;
}

- (void)setWork:(double)a3
{
  self->_work = a3;
}

- (double)personal
{
  return self->_personal;
}

- (void)setPersonal:(double)a3
{
  self->_personal = a3;
}

- (double)reading
{
  return self->_reading;
}

- (void)setReading:(double)a3
{
  self->_reading = a3;
}

- (double)gaming
{
  return self->_gaming;
}

- (void)setGaming:(double)a3
{
  self->_gaming = a3;
}

- (double)mindfulness
{
  return self->_mindfulness;
}

- (void)setMindfulness:(double)a3
{
  self->_mindfulness = a3;
}

- (int64_t)silencedNotificationCount
{
  return self->_silencedNotificationCount;
}

- (void)setSilencedNotificationCount:(int64_t)a3
{
  self->_silencedNotificationCount = a3;
}

@end

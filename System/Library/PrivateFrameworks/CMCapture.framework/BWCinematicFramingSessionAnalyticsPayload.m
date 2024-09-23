@implementation BWCinematicFramingSessionAnalyticsPayload

- (BWCinematicFramingSessionAnalyticsPayload)init
{
  BWCinematicFramingSessionAnalyticsPayload *v2;
  BWCinematicFramingSessionAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWCinematicFramingSessionAnalyticsPayload;
  v2 = -[BWCinematicFramingSessionAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWCinematicFramingSessionAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWCinematicFramingSessionAnalyticsPayload;
  -[BWCinematicFramingSessionAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  self->_cinematicFramingMaxPeopleDetected = 0;

  self->_cinematicFramingROIHeatMap = 0;
  self->_clientApplicationID = 0;
  self->_cinematicFramingControlMode = -1;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.CinematicFramingSession");
}

- (id)eventDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicFramingMaxPeopleDetected), CFSTR("cinematicFramingMaxPeopleDetected"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cinematicFramingROIHeatMap, CFSTR("cinematicFramingROIHeatMap"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicFramingControlMode), CFSTR("cinematicFramingControlMode"));
  return v3;
}

- (unsigned)cinematicFramingMaxPeopleDetected
{
  return self->_cinematicFramingMaxPeopleDetected;
}

- (void)setCinematicFramingMaxPeopleDetected:(unsigned int)a3
{
  self->_cinematicFramingMaxPeopleDetected = a3;
}

- (NSString)cinematicFramingROIHeatMap
{
  return self->_cinematicFramingROIHeatMap;
}

- (void)setCinematicFramingROIHeatMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)cinematicFramingControlMode
{
  return self->_cinematicFramingControlMode;
}

- (void)setCinematicFramingControlMode:(unsigned int)a3
{
  self->_cinematicFramingControlMode = a3;
}

@end

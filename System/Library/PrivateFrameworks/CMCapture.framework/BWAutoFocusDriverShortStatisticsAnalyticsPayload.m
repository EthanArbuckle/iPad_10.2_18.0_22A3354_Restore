@implementation BWAutoFocusDriverShortStatisticsAnalyticsPayload

- (BWAutoFocusDriverShortStatisticsAnalyticsPayload)init
{
  BWAutoFocusDriverShortStatisticsAnalyticsPayload *v2;
  BWAutoFocusDriverShortStatisticsAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWAutoFocusDriverShortStatisticsAnalyticsPayload;
  v2 = -[BWAutoFocusDriverShortStatisticsAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWAutoFocusDriverShortStatisticsAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAutoFocusDriverShortStatisticsAnalyticsPayload;
  -[BWAutoFocusDriverShortStatisticsAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{

  self->_portType = 0;
  self->_afDriverShortStatistics = 0;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.AutoFocusDriverShortStatistics");
}

- (id)eventDictionary
{
  void *v3;
  void *v4;
  NSString *portType;
  NSDictionary *afDriverShortStatistics;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  portType = self->_portType;
  if (portType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", portType, CFSTR("portType"));
  afDriverShortStatistics = self->_afDriverShortStatistics;
  if (afDriverShortStatistics)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E0D06228]), CFSTR("numberOfDetectedShorts"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E0D06220]), CFSTR("maxShortLength"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E0D06218]), CFSTR("maxAcceleration"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_afDriverShortStatistics, "objectForKeyedSubscript:", *MEMORY[0x1E0D06230]), CFSTR("shortRecoveryStatus"));
  }
  return v4;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)afDriverShortStatistics
{
  return self->_afDriverShortStatistics;
}

- (void)setAfDriverShortStatistics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end

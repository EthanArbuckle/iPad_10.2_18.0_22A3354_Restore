@implementation DAChamberSensorEvent

- (DAChamberSensorEvent)initWithSensorType:(int)a3 eventType:(int)a4
{
  DAChamberSensorEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DAChamberSensorEvent;
  result = -[DAChamberSensorEvent init](&v7, "init");
  if (result)
  {
    result->_sensorType = a3;
    result->_eventType = a4;
  }
  return result;
}

- (unint64_t)hash
{
  unsigned int v3;
  __CFString *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[DAChamberSensorEvent sensorType](self, "sensorType");
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = CFSTR("kDAChamberWifiSensor");
    }
    else
    {
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unexpected DAChamberSensorType."));
      v4 = 0;
    }
  }
  else
  {
    v4 = CFSTR("kDAChamberALSSensor");
  }
  v5 = (unint64_t)-[__CFString hash](v4, "hash");
  v6 = sensorEventTypeToString(-[DAChamberSensorEvent eventType](self, "eventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (unint64_t)objc_msgSend(v7, "hash") ^ v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  DAChamberSensorEvent *v4;
  uint64_t v5;
  DAChamberSensorEvent *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;

  v4 = (DAChamberSensorEvent *)a3;
  v6 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_8;
  }
  v7 = objc_opt_class(DAChamberSensorEvent, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0
    && (v8 = -[DAChamberSensorEvent sensorType](self, "sensorType"),
        v8 == -[DAChamberSensorEvent sensorType](v6, "sensorType")))
  {
    v9 = -[DAChamberSensorEvent eventType](self, "eventType");
    v10 = v9 == -[DAChamberSensorEvent eventType](v6, "eventType");
  }
  else
  {
LABEL_6:
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[DAChamberSensorEvent sensorType](self, "sensorType");
  if (v6)
  {
    if (v6 == 1)
    {
      v7 = CFSTR("kDAChamberWifiSensor");
    }
    else
    {
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unexpected DAChamberSensorType."));
      v7 = 0;
    }
  }
  else
  {
    v7 = CFSTR("kDAChamberALSSensor");
  }
  v8 = sensorEventTypeToString(-[DAChamberSensorEvent eventType](self, "eventType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@; %p:\n{ sensorType: %@\neventType: %@ }>"),
                    v5,
                    self,
                    v7,
                    v9));

  return v10;
}

- (int)sensorType
{
  return self->_sensorType;
}

- (void)setSensorType:(int)a3
{
  self->_sensorType = a3;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

@end

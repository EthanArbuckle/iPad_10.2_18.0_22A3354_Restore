@implementation ATXUnifiedModeEvent

- (ATXUnifiedModeEvent)initWithMode:(unint64_t)a3 startTime:(id)a4 endTime:(id)a5
{
  id v9;
  id v10;
  ATXUnifiedModeEvent *v11;
  ATXUnifiedModeEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXUnifiedModeEvent;
  v11 = -[ATXUnifiedModeEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_startTime, a4);
    objc_storeStrong((id *)&v12->_endTime, a5);
  }

  return v12;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end

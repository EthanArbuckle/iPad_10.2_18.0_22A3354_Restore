@implementation DDSTimedAnalytic

- (DDSTimedAnalytic)initWithIdentifier:(id)a3
{
  id v5;
  DDSTimedAnalytic *v6;
  DDSTimedAnalytic *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSTimedAnalytic;
  v6 = -[DDSTimedAnalytic init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_lastAction = 0;
  }

  return v7;
}

- (DDSTimedAnalytic)init
{

  return 0;
}

- (void)updateWithAction:(int)a3
{
  double v5;
  DDSTimedAnalytic *v6;
  uint64_t v7;
  id v8;

  -[DDSTimedAnalytic setLastAction:](self, "setLastAction:");
  switch(a3)
  {
    case 1:
      -[DDSTimedAnalytic startTime](self, "startTime");
      if (v5 == 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSince1970");
        -[DDSTimedAnalytic setStartTime:](self, "setStartTime:");
        goto LABEL_8;
      }
      break;
    case 2:
      -[DDSTimedAnalytic setRetries:](self, "setRetries:", -[DDSTimedAnalytic retries](self, "retries") + 1);
      break;
    case 3:
      v6 = self;
      v7 = 1;
      goto LABEL_7;
    case 4:
      v6 = self;
      v7 = 0;
LABEL_7:
      -[DDSTimedAnalytic setSuccess:](v6, "setSuccess:", v7);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      -[DDSTimedAnalytic setEndTime:](self, "setEndTime:");
LABEL_8:

      break;
    default:
      return;
  }
}

- (unint64_t)durationInSec
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[DDSTimedAnalytic endTime](self, "endTime");
  v4 = v3;
  -[DDSTimedAnalytic startTime](self, "startTime");
  v6 = v4 - v5;
  if (v6 >= 1.0 || v6 <= 0.0)
    return (unint64_t)v6;
  else
    return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (unint64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(unint64_t)a3
{
  self->_retries = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (int)lastAction
{
  return self->_lastAction;
}

- (void)setLastAction:(int)a3
{
  self->_lastAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

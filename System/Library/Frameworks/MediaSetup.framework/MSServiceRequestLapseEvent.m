@implementation MSServiceRequestLapseEvent

- (MSServiceRequestLapseEvent)initWithServiceID:(id)a3
{
  id v4;
  MSServiceRequestLapseEvent *v5;
  MSServiceRequestLapseEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSServiceRequestLapseEvent;
  v5 = -[MSServiceRequestLapseEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MSServiceRequestLapseEvent setServiceID:](v5, "setServiceID:", v4);

  return v6;
}

- (double)durationBetweenRequestAndRecordCreation
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_recordCreationDate, "timeIntervalSinceDate:", self->_dateOfRequest);
  return result;
}

- (double)durationBetweenRequestAndReadyToUse
{
  double result;

  UpTicksToSecondsF();
  return result;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceID, a3);
}

- (NSDate)recordCreationDate
{
  return self->_recordCreationDate;
}

- (void)setRecordCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_recordCreationDate, a3);
}

- (unint64_t)timeOfRequest
{
  return self->_timeOfRequest;
}

- (void)setTimeOfRequest:(unint64_t)a3
{
  self->_timeOfRequest = a3;
}

- (NSDate)dateOfRequest
{
  return self->_dateOfRequest;
}

- (void)setDateOfRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfRequest, a3);
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfRequest, 0);
  objc_storeStrong((id *)&self->_recordCreationDate, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end

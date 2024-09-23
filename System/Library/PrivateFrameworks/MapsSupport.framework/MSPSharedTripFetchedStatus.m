@implementation MSPSharedTripFetchedStatus

- (MSPSharedTripFetchedStatus)initWithStatus:(int64_t)a3
{
  MSPSharedTripFetchedStatus *v4;
  MSPSharedTripFetchedStatus *v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripFetchedStatus;
  v4 = -[MSPSharedTripFetchedStatus init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_status = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5->_fetchedTimestamp = v6;
    if (!-[MSPSharedTripFetchedStatus isFailedRequest](v5, "isFailedRequest"))
      -[MSPSharedTripFetchedStatus isBlocked](v5, "isBlocked");
    GEOConfigGetDouble();
    v5->_ttl = v7;
  }
  return v5;
}

- (BOOL)isExpired
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v3 - self->_fetchedTimestamp > self->_ttl;
}

- (BOOL)isFailedRequest
{
  return self->_status == -1;
}

- (BOOL)isBlocked
{
  return self->_status == -2;
}

- (int64_t)status
{
  if (self->_status <= 0xFFFFFFFFFFFFFFFDLL)
    return self->_status;
  else
    return 2;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  int v5;
  int v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && v4[3] == self->_status)
  {
    v5 = objc_msgSend(v4, "isExpired");
    v6 = v5 ^ -[MSPSharedTripFetchedStatus isExpired](self, "isExpired") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEffectivelyEqualToStatus:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "status"), v6 == -[MSPSharedTripFetchedStatus status](self, "status")))
  {
    v7 = objc_msgSend(v5, "isExpired");
    v8 = v7 ^ -[MSPSharedTripFetchedStatus isExpired](self, "isExpired") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const char *v5;
  const char *v6;
  const char *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MSPSharedTripFetchedStatus status](self, "status");
  if (-[MSPSharedTripFetchedStatus isExpired](self, "isExpired"))
    v5 = "yes";
  else
    v5 = "no";
  if (-[MSPSharedTripFetchedStatus isFailedRequest](self, "isFailedRequest"))
    v6 = "yes";
  else
    v6 = "no";
  if (-[MSPSharedTripFetchedStatus isBlocked](self, "isBlocked"))
    v7 = "yes";
  else
    v7 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("status: %ld, expired: %s, failed: %s, blocked: %s"), v4, v5, v6, v7);
}

@end

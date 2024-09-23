@implementation MNRealtimeUpdate

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeID, CFSTR("routeID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  error = self->_error;
  if (error)
    objc_msgSend(v5, "encodeObject:forKey:", error, CFSTR("error"));

}

- (MNRealtimeUpdate)initWithCoder:(id)a3
{
  id v4;
  MNRealtimeUpdate *v5;
  uint64_t v6;
  NSUUID *routeID;
  uint64_t v8;
  NSDate *lastUpdated;
  uint64_t v10;
  NSError *error;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MNRealtimeUpdate;
  v5 = -[MNRealtimeUpdate init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routeID"));
    v6 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v10 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end

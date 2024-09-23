@implementation SACrashDetectionEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SACrashDetectionEvent)initWithTimeOfDetection:(id)a3 timeOfResolution:(id)a4 response:(int64_t)a5 location:(id)a6
{
  id v11;
  id v12;
  id v13;
  SACrashDetectionEvent *v14;
  SACrashDetectionEvent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SACrashDetectionEvent;
  v14 = -[SACrashDetectionEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_date, a3);
    objc_storeStrong((id *)&v15->_timeOfResolution, a4);
    v15->_response = a5;
    objc_storeStrong((id *)&v15->_location, a6);
    v15->_isNotified = 0;
  }

  return v15;
}

- (SACrashDetectionEvent)initWithTimeOfDetection:(id)a3 timeOfResolution:(id)a4 response:(int64_t)a5 location:(id)a6 isNotified:(BOOL)a7
{
  SACrashDetectionEvent *result;

  result = -[SACrashDetectionEvent initWithTimeOfDetection:timeOfResolution:response:location:](self, "initWithTimeOfDetection:timeOfResolution:response:location:", a3, a4, a5, a6);
  if (result)
    result->_isNotified = a7;
  return result;
}

- (SACrashDetectionEvent)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SACrashDetectionEvent *v13;

  v4 = (objc_class *)MEMORY[0x24BDBCE60];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("kSACrashDetectionEventTimeOfDetection"));
  v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  v8 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("kSACrashDetectionEventTimeOfResolution"));
  v9 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("kSACrashDetectionEventResponse"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSACrashDetectionEventLocation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("kSACrashDetectionEventIsNotified"));

  v13 = -[SACrashDetectionEvent initWithTimeOfDetection:timeOfResolution:response:location:isNotified:](self, "initWithTimeOfDetection:timeOfResolution:response:location:isNotified:", v7, v9, v10, v11, v12);
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimeOfDetection:timeOfResolution:response:location:isNotified:", self->_date, self->_timeOfResolution, self->_response, self->_location, self->_isNotified);
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSACrashDetectionEventTimeOfDetection"));
  -[NSDate timeIntervalSinceReferenceDate](self->_timeOfResolution, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kSACrashDetectionEventTimeOfResolution"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_response, CFSTR("kSACrashDetectionEventResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("kSACrashDetectionEventLocation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNotified, CFSTR("kSACrashDetectionEventIsNotified"));

}

- (double)elapsed
{
  void *v2;
  double v3;
  double v4;

  -[SACrashDetectionEvent date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  SACrashDetectionEventResponse v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SACrashDetectionEvent date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SACrashDetectionEvent response](self, "response");
  -[SACrashDetectionEvent location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SACrashDetectionEvent - date: %@, response: %ld, location: %@, notified: %d"), v4, v5, v6, -[SACrashDetectionEvent isNotified](self, "isNotified"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)crashDetectionEventTimeout
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("SACrashDetectionEventTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 3600.0;
  }

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (SACrashDetectionEventResponse)response
{
  return self->_response;
}

- (CLLocation)location
{
  return self->_location;
}

- (BOOL)isNotified
{
  return self->_isNotified;
}

- (void)setIsNotified:(BOOL)a3
{
  self->_isNotified = a3;
}

- (NSDate)timeOfResolution
{
  return self->_timeOfResolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfResolution, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end

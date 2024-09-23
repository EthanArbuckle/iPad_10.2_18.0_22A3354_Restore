@implementation DECollectionProgress

- (DECollectionProgress)initWithPercentComplete:(double)a3
{
  return -[DECollectionProgress initWithPercentComplete:withEstimatedTimeRemaining:](self, "initWithPercentComplete:withEstimatedTimeRemaining:", 0, a3);
}

- (DECollectionProgress)initWithPercentComplete:(double)a3 withEstimatedTimeRemaining:(id)a4
{
  id v7;
  DECollectionProgress *v8;
  DECollectionProgress *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DECollectionProgress;
  v8 = -[DECollectionProgress init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_percentComplete = a3;
    objc_storeStrong((id *)&v8->_estimatedTimeRemaining, a4);
  }

  return v9;
}

- (DECollectionProgress)initWithCoder:(id)a3
{
  id v4;
  DECollectionProgress *v5;
  double v6;
  uint64_t v7;
  NSNumber *estimatedTimeRemaining;
  uint64_t v9;
  NSString *statusString;

  v4 = a3;
  v5 = -[DECollectionProgress init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PercentComplete"));
    v5->_percentComplete = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeRemaining"));
    v7 = objc_claimAutoreleasedReturnValue();
    estimatedTimeRemaining = v5->_estimatedTimeRemaining;
    v5->_estimatedTimeRemaining = (NSNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusString"));
    v9 = objc_claimAutoreleasedReturnValue();
    statusString = v5->_statusString;
    v5->_statusString = (NSString *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double percentComplete;
  id v5;

  percentComplete = self->_percentComplete;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("PercentComplete"), percentComplete);
  objc_msgSend(v5, "encodeObject:forKey:", self->_estimatedTimeRemaining, CFSTR("TimeRemaining"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statusString, CFSTR("StatusString"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, a3);
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
  objc_storeStrong((id *)&self->_statusString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
}

@end

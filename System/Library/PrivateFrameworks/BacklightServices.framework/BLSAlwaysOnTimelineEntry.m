@implementation BLSAlwaysOnTimelineEntry

- (BLSAlwaysOnTimelineEntry)initWithPresentationTime:(id)a3 requestedFidelity:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timelineIdentifier:(id)a7 userObject:(id)a8
{
  id v15;
  id v16;
  id v17;
  BLSAlwaysOnTimelineEntry *v18;
  BLSAlwaysOnTimelineEntry *v19;
  objc_super v21;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BLSAlwaysOnTimelineEntry;
  v18 = -[BLSAlwaysOnTimelineEntry init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_presentationTime, a3);
    v19->_requestedFidelity = a4;
    v19->_animated = a5;
    v19->_duration = a6;
    objc_storeStrong((id *)&v19->_timelineIdentifier, a7);
    objc_storeStrong((id *)&v19->_userObject, a8);
  }

  return v19;
}

- (int64_t)compare:(id)a3
{
  NSDate *presentationTime;
  void *v4;
  int64_t v5;

  presentationTime = self->_presentationTime;
  objc_msgSend(a3, "presentationTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDate compare:](presentationTime, "compare:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_presentationTime, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("time"));

  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_animated, CFSTR("animated"), 1);
  if (self->_animated)
    v6 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("duration"), 3, self->_duration);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_timelineIdentifier, CFSTR("timeline"), 0);
  NSStringFromBLSUpdateFidelity(self->_requestedFidelity);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("fidelity"));

  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_userObject, CFSTR("userObject"), 1);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_loggingString](self->_presentationTime, "bls_loggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("time"));

  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_animated, CFSTR("animated"));
  if (self->_animated)
    v6 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("duration"), 3, self->_duration);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_timelineIdentifier, CFSTR("timeline"), 0);
  NSStringFromBLSUpdateFidelity(self->_requestedFidelity);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("fidelity"));

  -[NSObject debugDescription](self->_userObject, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("userObject"), 1);

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSDate *presentationTime;
  void *v7;
  NSObject *timelineIdentifier;
  void *v9;
  NSObject *userObject;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "userObject");
    v5 = objc_claimAutoreleasedReturnValue();
    presentationTime = self->_presentationTime;
    objc_msgSend(v4, "presentationTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate isEqual:](presentationTime, "isEqual:", v7))
    {
      timelineIdentifier = self->_timelineIdentifier;
      objc_msgSend(v4, "timelineIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](timelineIdentifier, "isEqual:", v9))
      {
        userObject = self->_userObject;
        if (v5 | (unint64_t)userObject)
          v11 = -[NSObject isEqual:](userObject, "isEqual:", v5);
        else
          v11 = 1;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSDate hash](self->_presentationTime, "hash");
  v4 = -[NSObject hash](self->_timelineIdentifier, "hash") ^ v3;
  return v4 ^ -[NSObject hash](self->_userObject, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BLSAlwaysOnTimelineEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:]([BLSAlwaysOnTimelineEntry alloc], "initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:", self->_presentationTime, self->_requestedFidelity, self->_animated, self->_timelineIdentifier, self->_userObject, self->_duration);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BLSAlwaysOnTimelineUnconfiguredEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:]([BLSAlwaysOnTimelineUnconfiguredEntry alloc], "initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:", self->_presentationTime, self->_requestedFidelity, self->_animated, self->_timelineIdentifier, self->_userObject, self->_duration);
}

+ (id)loggingStringForPresentationTime:(id)a3
{
  return (id)objc_msgSend(a3, "bls_loggingString");
}

+ (id)shortLoggingStringForPresentationTime:(id)a3
{
  return (id)objc_msgSend(a3, "bls_shortLoggingString");
}

- (NSDate)presentationTime
{
  return self->_presentationTime;
}

- (int64_t)requestedFidelity
{
  return self->_requestedFidelity;
}

- (void)setRequestedFidelity:(int64_t)a3
{
  self->_requestedFidelity = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSObject)timelineIdentifier
{
  return self->_timelineIdentifier;
}

- (void)setTimelineIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_timelineIdentifier, a3);
}

- (NSObject)userObject
{
  return self->_userObject;
}

- (void)setUserObject:(id)a3
{
  objc_storeStrong((id *)&self->_userObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userObject, 0);
  objc_storeStrong((id *)&self->_timelineIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationTime, 0);
}

@end

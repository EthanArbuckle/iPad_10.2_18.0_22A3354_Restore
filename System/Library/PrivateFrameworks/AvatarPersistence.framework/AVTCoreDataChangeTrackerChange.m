@implementation AVTCoreDataChangeTrackerChange

+ (int64_t)trackerChangeTypeFromPersistentChangeType:(int64_t)a3
{
  return (unint64_t)a3 > 1;
}

- (AVTCoreDataChangeTrackerChange)initWithRecordIdentifier:(id)a3 changeType:(int64_t)a4
{
  id v7;
  AVTCoreDataChangeTrackerChange *v8;
  AVTCoreDataChangeTrackerChange *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTCoreDataChangeTrackerChange;
  v8 = -[AVTCoreDataChangeTrackerChange init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordIdentifier, a3);
    v9->_changeType = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTCoreDataChangeTrackerChange;
  -[AVTCoreDataChangeTrackerChange description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = -[AVTCoreDataChangeTrackerChange changeType](self, "changeType");
  -[AVTCoreDataChangeTrackerChange recordIdentifier](self, "recordIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" type:%ld identifier:%@"), v5, v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return AVTAvatarRecordChangeEqualToChange(self, a3);
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
}

@end

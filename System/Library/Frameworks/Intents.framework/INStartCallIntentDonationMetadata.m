@implementation INStartCallIntentDonationMetadata

- (INStartCallIntentDonationMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INStartCallIntentDonationMetadata;
  return (INStartCallIntentDonationMetadata *)-[INIntentDonationMetadata _init](&v3, sel__init);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INStartCallIntentDonationMetadata;
  v3 = -[INStartCallIntentDonationMetadata hash](&v11, sel_hash);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeToEstablish);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[NSNumber hash](self->_recentCallStatus, "hash");
  v9 = v8 ^ -[NSNumber hash](self->_disconnectedReason, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INStartCallIntentDonationMetadata *v4;
  INStartCallIntentDonationMetadata *v5;
  INStartCallIntentDonationMetadata *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;

  v4 = (INStartCallIntentDonationMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[INStartCallIntentDonationMetadata callDuration](self, "callDuration");
        v8 = v7;
        -[INStartCallIntentDonationMetadata callDuration](v6, "callDuration");
        if (v8 != v9
          || (-[INStartCallIntentDonationMetadata timeToEstablish](self, "timeToEstablish"),
              v11 = v10,
              -[INStartCallIntentDonationMetadata timeToEstablish](v6, "timeToEstablish"),
              v11 != v12))
        {
          v15 = 0;
LABEL_15:

          goto LABEL_16;
        }
        -[INStartCallIntentDonationMetadata recentCallStatus](self, "recentCallStatus");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[INStartCallIntentDonationMetadata recentCallStatus](v6, "recentCallStatus");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
        {
          -[INStartCallIntentDonationMetadata disconnectedReason](self, "disconnectedReason");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[INStartCallIntentDonationMetadata disconnectedReason](v6, "disconnectedReason");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v16 == v17;

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
        v13 = v6;
        v6 = 0;
      }
    }
    else
    {
      v13 = 0;
      v15 = 0;
    }

    goto LABEL_15;
  }
  v15 = 1;
LABEL_16:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INStartCallIntentDonationMetadata;
  v4 = -[INIntentDonationMetadata copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[INStartCallIntentDonationMetadata callDuration](self, "callDuration");
  objc_msgSend(v4, "setCallDuration:");
  -[INStartCallIntentDonationMetadata timeToEstablish](self, "timeToEstablish");
  objc_msgSend(v4, "setTimeToEstablish:");
  -[INStartCallIntentDonationMetadata recentCallStatus](self, "recentCallStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecentCallStatus:", v5);

  -[INStartCallIntentDonationMetadata disconnectedReason](self, "disconnectedReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisconnectedReason:", v6);

  return v4;
}

- (INStartCallIntentDonationMetadata)initWithCoder:(id)a3
{
  id v4;
  INStartCallIntentDonationMetadata *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSNumber *recentCallStatus;
  uint64_t v10;
  NSNumber *disconnectedReason;
  INStartCallIntentDonationMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INStartCallIntentDonationMetadata;
  v5 = -[INIntentDonationMetadata initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("callDuration"));
    v5->_callDuration = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeToEstablish"));
    v5->_timeToEstablish = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recentCallStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    recentCallStatus = v5->_recentCallStatus;
    v5->_recentCallStatus = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disconnectedReason"));
    v10 = objc_claimAutoreleasedReturnValue();
    disconnectedReason = v5->_disconnectedReason;
    v5->_disconnectedReason = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INStartCallIntentDonationMetadata;
  v4 = a3;
  -[INIntentDonationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("callDuration"), self->_callDuration, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timeToEstablish"), self->_timeToEstablish);
  objc_msgSend(v4, "encodeObject:forKey:", self->_recentCallStatus, CFSTR("recentCallStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_disconnectedReason, CFSTR("disconnectedReason"));

}

- (double)callDuration
{
  return self->_callDuration;
}

- (void)setCallDuration:(double)a3
{
  self->_callDuration = a3;
}

- (double)timeToEstablish
{
  return self->_timeToEstablish;
}

- (void)setTimeToEstablish:(double)a3
{
  self->_timeToEstablish = a3;
}

- (NSNumber)recentCallStatus
{
  return self->_recentCallStatus;
}

- (void)setRecentCallStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)disconnectedReason
{
  return self->_disconnectedReason;
}

- (void)setDisconnectedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectedReason, 0);
  objc_storeStrong((id *)&self->_recentCallStatus, 0);
}

+ (Class)_intentClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

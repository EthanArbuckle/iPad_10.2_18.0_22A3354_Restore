@implementation INCancelRideIntentResponse

- (INCancelRideIntentResponse)initWithCode:(INCancelRideIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCancelRideIntentResponse;
  return (INCancelRideIntentResponse *)-[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, code, userActivity);
}

- (INCancelRideIntentResponse)initWithCoder:(id)a3
{
  id v4;
  INCancelRideIntentResponse *v5;
  uint64_t v6;
  INCurrencyAmount *cancellationFee;
  uint64_t v8;
  NSDateComponents *cancellationFeeThreshold;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCancelRideIntentResponse;
  v5 = -[INIntentResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancellationFee"));
    v6 = objc_claimAutoreleasedReturnValue();
    cancellationFee = v5->_cancellationFee;
    v5->_cancellationFee = (INCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancellationFeeThreshold"));
    v8 = objc_claimAutoreleasedReturnValue();
    cancellationFeeThreshold = v5->_cancellationFeeThreshold;
    v5->_cancellationFeeThreshold = (NSDateComponents *)v8;

  }
  return v5;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCancelRideIntentResponse;
  return -[INIntentResponse _initWithCode:userActivity:](&v5, sel__initWithCode_userActivity_, a3, a4);
}

- (INCancelRideIntentResponse)initWithBackingStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INCancelRideIntentResponse;
  return -[INIntentResponse initWithBackingStore:](&v4, sel_initWithBackingStore_, a3);
}

- (INCancelRideIntentResponseCode)code
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INCancelRideIntentResponse;
  return -[INIntentResponse code](&v3, sel_code);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCancelRideIntentResponse;
  v4 = a3;
  -[INIntentResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cancellationFee, CFSTR("cancellationFee"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cancellationFeeThreshold, CFSTR("cancellationFeeThreshold"));

}

- (id)_dictionaryRepresentation
{
  INCancelRideIntentResponseCode v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("code");
  v3 = -[INCancelRideIntentResponse code](self, "code");
  v4 = v3;
  if ((unint64_t)v3 <= INCancelRideIntentResponseCodeFailure)
  {
    v5 = *(&off_1E2289400 + v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("userActivity");
  v11[0] = v5;
  -[INIntentResponse userActivity](self, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  if (v4 >= 4)
  return v8;
}

- (INCurrencyAmount)cancellationFee
{
  return self->_cancellationFee;
}

- (void)setCancellationFee:(INCurrencyAmount *)cancellationFee
{
  objc_setProperty_nonatomic_copy(self, a2, cancellationFee, 64);
}

- (NSDateComponents)cancellationFeeThreshold
{
  return self->_cancellationFeeThreshold;
}

- (void)setCancellationFeeThreshold:(NSDateComponents *)cancellationFeeThreshold
{
  objc_setProperty_nonatomic_copy(self, a2, cancellationFeeThreshold, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationFeeThreshold, 0);
  objc_storeStrong((id *)&self->_cancellationFee, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

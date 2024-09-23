@implementation INCancelRideIntent

- (INCancelRideIntent)initWithRideIdentifier:(NSString *)rideIdentifier
{
  NSString *v5;
  INCancelRideIntent *v6;
  INCancelRideIntent *v7;
  objc_super v9;

  v5 = rideIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)INCancelRideIntent;
  v6 = -[INIntent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rideIdentifier, rideIdentifier);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRideIdentifier:", self->_rideIdentifier);
}

- (INCancelRideIntent)initWithCoder:(id)a3
{
  id v4;
  __CFString *v5;
  const __CFString *v6;
  INCancelRideIntent *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rideIdentifier"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E2295770;
  v7 = -[INCancelRideIntent initWithRideIdentifier:](self, "initWithRideIdentifier:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_rideIdentifier, CFSTR("rideIdentifier"));
}

- (id)_dictionaryRepresentation
{
  NSString *rideIdentifier;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("rideIdentifier");
  rideIdentifier = self->_rideIdentifier;
  v3 = rideIdentifier;
  if (!rideIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!rideIdentifier)

  return v4;
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intentDescription
{
  if (intentDescription_onceToken_29270 != -1)
    dispatch_once(&intentDescription_onceToken_29270, &__block_literal_global_29271);
  return (id)intentDescription_intentDescription_29272;
}

void __39__INCancelRideIntent_intentDescription__block_invoke()
{
  INIntentDescription *v0;
  void *v1;

  v0 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("CancelRideIntent"), CFSTR("CancelRideIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleCancelRide_completion_, sel_confirmCancelRide_completion_, 0);
  v1 = (void *)intentDescription_intentDescription_29272;
  intentDescription_intentDescription_29272 = (uint64_t)v0;

}

@end

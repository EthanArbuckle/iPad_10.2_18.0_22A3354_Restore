@implementation INSendRideFeedbackIntent

- (INSendRideFeedbackIntent)initWithRideIdentifier:(NSString *)rideIdentifier
{
  NSString *v4;
  INSendRideFeedbackIntent *v5;
  uint64_t v6;
  NSString *v7;
  objc_super v9;

  v4 = rideIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)INSendRideFeedbackIntent;
  v5 = -[INIntent init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_rideIdentifier;
    v5->_rideIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRideIdentifier:", self->_rideIdentifier);
  objc_msgSend(v4, "setRating:", self->_rating);
  objc_msgSend(v4, "setTip:", self->_tip);
  return v4;
}

- (INSendRideFeedbackIntent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  INSendRideFeedbackIntent *v8;
  uint64_t v9;
  NSNumber *rating;
  uint64_t v11;
  INCurrencyAmount *tip;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rideIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E2295770;
  v8 = -[INSendRideFeedbackIntent initWithRideIdentifier:](self, "initWithRideIdentifier:", v7);

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rating"));
    v9 = objc_claimAutoreleasedReturnValue();
    rating = v8->_rating;
    v8->_rating = (NSNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tip"));
    v11 = objc_claimAutoreleasedReturnValue();
    tip = v8->_tip;
    v8->_tip = (INCurrencyAmount *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *rideIdentifier;
  id v5;

  rideIdentifier = self->_rideIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rideIdentifier, CFSTR("rideIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rating, CFSTR("rating"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tip, CFSTR("tip"));

}

- (id)_dictionaryRepresentation
{
  NSString *rideIdentifier;
  void *v4;
  NSNumber *rating;
  void *v6;
  INCurrencyAmount *tip;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("rideIdentifier");
  rideIdentifier = self->_rideIdentifier;
  v4 = rideIdentifier;
  if (!rideIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("rating");
  rating = self->_rating;
  v6 = rating;
  if (!rating)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("tip");
  tip = self->_tip;
  v8 = tip;
  if (!tip)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (tip)
  {
    if (rating)
      goto LABEL_9;
LABEL_12:

    if (rideIdentifier)
      return v9;
LABEL_13:

    return v9;
  }

  if (!rating)
    goto LABEL_12;
LABEL_9:
  if (!rideIdentifier)
    goto LABEL_13;
  return v9;
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (NSNumber)rating
{
  return self->_rating;
}

- (void)setRating:(NSNumber *)rating
{
  objc_setProperty_nonatomic_copy(self, a2, rating, 144);
}

- (INCurrencyAmount)tip
{
  return self->_tip;
}

- (void)setTip:(INCurrencyAmount *)tip
{
  objc_setProperty_nonatomic_copy(self, a2, tip, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tip, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_rideIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intentDescription
{
  if (intentDescription_onceToken_63006 != -1)
    dispatch_once(&intentDescription_onceToken_63006, &__block_literal_global_63007);
  return (id)intentDescription_intentDescription_63008;
}

void __45__INSendRideFeedbackIntent_intentDescription__block_invoke()
{
  INIntentDescription *v0;
  void *v1;

  v0 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:]([INIntentDescription alloc], "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SendRideFeedbackIntent"), CFSTR("SendRideFeedbackIntentResponse"), objc_opt_class(), 0, 0, 0, sel_handleSendRideFeedback_completion_, sel_confirmSendRideFeedback_completion_, 0);
  v1 = (void *)intentDescription_intentDescription_63008;
  intentDescription_intentDescription_63008 = (uint64_t)v0;

}

@end

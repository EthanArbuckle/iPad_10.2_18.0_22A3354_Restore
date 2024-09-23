@implementation FCCFitnessPlusPlanState

- (FCCFitnessPlusPlanState)initWithHasWorkoutScheduledToday:(BOOL)a3
{
  FCCFitnessPlusPlanState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCCFitnessPlusPlanState;
  result = -[FCCFitnessPlusPlanState init](&v5, sel_init);
  if (result)
    result->_hasWorkoutScheduledToday = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCFitnessPlusPlanSate: hasWorkoutScheduledToday: %{BOOL}d"), self->_hasWorkoutScheduledToday);
}

- (FCCFitnessPlusPlanState)initWithTransportData:(id)a3
{
  id v4;
  FCCFitnessPlusPlanStateProtobuf *v5;
  FCCFitnessPlusPlanState *v6;

  v4 = a3;
  v5 = -[FCCFitnessPlusPlanStateProtobuf initWithData:]([FCCFitnessPlusPlanStateProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCFitnessPlusPlanState initWithHasWorkoutScheduledToday:](self, "initWithHasWorkoutScheduledToday:", -[FCCFitnessPlusPlanStateProtobuf hasWorkoutScheduledToday](v5, "hasWorkoutScheduledToday"));
  return v6;
}

- (id)transportData
{
  FCCFitnessPlusPlanStateProtobuf *v3;
  void *v4;

  v3 = objc_alloc_init(FCCFitnessPlusPlanStateProtobuf);
  -[FCCFitnessPlusPlanStateProtobuf setHasWorkoutScheduledToday:](v3, "setHasWorkoutScheduledToday:", self->_hasWorkoutScheduledToday);
  -[FCCFitnessPlusPlanStateProtobuf data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasWorkoutScheduledToday
{
  return self->_hasWorkoutScheduledToday;
}

@end

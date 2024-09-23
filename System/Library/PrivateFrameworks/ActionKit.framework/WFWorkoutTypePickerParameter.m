@implementation WFWorkoutTypePickerParameter

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    +[WFHealthKitHelper readableWorkoutActivityTypes](WFHealthKitHelper, "readableWorkoutActivityTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_39823);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[WFHealthKitHelper workoutActivityTypeFromReadableWorkoutActivityType:](WFHealthKitHelper, "workoutActivityTypeFromReadableWorkoutActivityType:", v3);

  return softLinkHKUILocalizedWorkoutTypeName(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __46__WFWorkoutTypePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

@end

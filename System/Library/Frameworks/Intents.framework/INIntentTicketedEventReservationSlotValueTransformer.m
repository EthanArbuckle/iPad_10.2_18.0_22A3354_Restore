@implementation INIntentTicketedEventReservationSlotValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)reverseTransformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (int64_t)_intents_valueType
{
  return 216;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INIntentSlotValueTransformToTicketedEventReservation(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  INTicketedEventReservation *v3;
  void *v4;

  v3 = (INTicketedEventReservation *)a3;
  objc_msgSend((id)objc_opt_class(), "reverseTransformedValueClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    INIntentSlotValueTransformFromTicketedEventReservation(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end

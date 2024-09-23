@implementation HKMobilityWalkingSteadinessAnalyticsUtilities

+ (id)payloadStringForWalkingSteadinessClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E9C364B0 + a3 - 1);
}

+ (id)payloadStringForWalkingSteadinessNotificationClassificationWithValue:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  objc_msgSend(a1, "payloadStringForWalkingSteadinessClassification:", qword_1D780CDD0[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)payloadStringForWalkingSteadinessNotificationTypeWithValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E9C364C8 + a3 - 1);
}

+ (id)payloadStringForWalkingSteadinessNotificationInteractionWithActionIdentifier:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CEC818]) & 1) != 0)
  {
    v4 = CFSTR("dismiss");
  }
  else if (objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC808]))
  {
    v4 = CFSTR("view data");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end

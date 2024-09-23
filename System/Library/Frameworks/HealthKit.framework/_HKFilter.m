@implementation _HKFilter

+ (BOOL)filter:(id)a3 acceptsDataObject:(id)a4
{
  if (a3)
    return objc_msgSend(a3, "acceptsDataObject:", a4);
  else
    return 1;
}

+ (BOOL)filter:(id)a3 acceptsActivitySummary:(id)a4
{
  return !a3 || objc_msgSend(a3, "acceptsActivitySummary:", a4) != 0;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  return 2;
}

+ (BOOL)filter:(id)a3 acceptsDataObjectWithStartTimestamp:(double)a4 endTimestamp:(double)a5 valueInCanonicalUnit:(double)a6
{
  return !a3
      || objc_msgSend(a3, "acceptsDataObjectWithStartTimestamp:endTimestamp:valueInCanonicalUnit:", a4, a5, a6) != 0;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  return 2;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)acceptsDataObject:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end

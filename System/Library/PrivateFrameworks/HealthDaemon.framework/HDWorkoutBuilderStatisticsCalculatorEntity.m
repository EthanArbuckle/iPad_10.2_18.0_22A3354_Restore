@implementation HDWorkoutBuilderStatisticsCalculatorEntity

+ (id)databaseTable
{
  return CFSTR("workout_builder_statistics");
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)ownerEntityReferenceColumn
{
  return (id)*MEMORY[0x1E0D29618];
}

+ (int64_t)protectionClass
{
  return 1;
}

@end

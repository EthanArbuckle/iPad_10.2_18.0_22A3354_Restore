@implementation HDWorkoutBuilderEventEntity

+ (id)databaseTable
{
  return CFSTR("workout_builder_events");
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (Class)ownerEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)ownerEntityReferenceColumn
{
  return (id)*MEMORY[0x1E0D29618];
}

@end

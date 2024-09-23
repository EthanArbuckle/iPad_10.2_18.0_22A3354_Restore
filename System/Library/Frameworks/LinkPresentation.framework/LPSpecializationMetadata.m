@implementation LPSpecializationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSpecializationMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LPSpecializationMetadata;
  return -[LPSpecializationMetadata init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (BOOL)_dummyPropertyForObservation
{
  return self->__dummyPropertyForObservation;
}

- (BOOL)_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion
{
  return self->__canDeferAsynchronousFieldsMetadataUpdateUntilCompletion;
}

- (BOOL)_disallowsURLOverrideByDelegate
{
  return self->__disallowsURLOverrideByDelegate;
}

@end

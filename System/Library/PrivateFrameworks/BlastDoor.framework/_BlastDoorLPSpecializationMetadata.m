@implementation _BlastDoorLPSpecializationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSpecializationMetadata)initWithCoder:(id)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_BlastDoorLPSpecializationMetadata;
  return -[_BlastDoorLPSpecializationMetadata init](&v4, sel_init, a3);
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

@end

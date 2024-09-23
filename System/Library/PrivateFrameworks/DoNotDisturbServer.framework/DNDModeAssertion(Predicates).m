@implementation DNDModeAssertion(Predicates)

+ (uint64_t)predicateForModeAssertionsWithUUIDs:()Predicates
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("UUID IN %@"), a3);
}

+ (uint64_t)predicateForModeAssertionsWithClientIdentifiers:()Predicates
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.clientIdentifier IN %@"), a3);
}

+ (uint64_t)predicateForModeAssertionsWithDeviceIdentifier:()Predicates
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.deviceIdentifier == %@"), a3);
}

+ (uint64_t)predicateForModeAssertionsWithModeIdentifiersNotContainedIn:()Predicates
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (details.modeIdentifier IN %@)"), a3);
}

+ (id)predicateForModeAssertionsWithLifetimeClass:()Predicates
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__DNDModeAssertion_Predicates__predicateForModeAssertionsWithLifetimeClass___block_invoke;
  v4[3] = &__block_descriptor_40_e43_B24__0__DNDModeAssertion_8__NSDictionary_16lu32l8;
  v4[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)predicateForModeAssertionsTakenBeforeDate:()Predicates
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate < %@"), a3);
}

@end

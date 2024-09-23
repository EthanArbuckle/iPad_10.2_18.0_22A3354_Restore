@implementation NRDevice(HKMedicationsCapabilityProviding)

- (uint64_t)supportsMedicationsCapability
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("832275CC-B0F5-46CA-85B0-92463453065E"));
  v3 = objc_msgSend(a1, "supportsCapability:", v2);

  return v3;
}

- (uint64_t)supportsMeadowCapability
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("F5E0C9C7-CA38-421E-808A-0705258C1EF9"));
  v3 = objc_msgSend(a1, "supportsCapability:", v2);

  return v3;
}

@end

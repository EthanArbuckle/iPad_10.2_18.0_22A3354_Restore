@implementation NSUUID

void __38__NSUUID_MSPAdditions___maps_zeroUUID__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v2);
  v1 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v0;

}

@end

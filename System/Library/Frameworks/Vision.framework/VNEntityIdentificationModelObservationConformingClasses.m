@implementation VNEntityIdentificationModelObservationConformingClasses

void __VNEntityIdentificationModelObservationConformingClasses_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = objc_opt_class();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __VNEntityIdentificationModelObservationConformingClasses_block_invoke_2;
  v5[3] = &unk_1E4544268;
  v4 = v0;
  v6 = v4;
  +[VisionCoreRuntimeUtilities enumerateSubclassesOfClass:excludingRootClass:usingBlock:](VNRuntimeUtilities, "enumerateSubclassesOfClass:excludingRootClass:usingBlock:", v1, 1, v5);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)VNEntityIdentificationModelObservationConformingClasses::ourObservationClasses;
  VNEntityIdentificationModelObservationConformingClasses::ourObservationClasses = v2;

}

void __VNEntityIdentificationModelObservationConformingClasses_block_invoke_2(uint64_t a1, Class aClass)
{
  void *v4;
  char v5;

  NSStringFromClass(aClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("VN"));

  if ((v5 & 1) != 0 && class_conformsToProtocol(aClass, (Protocol *)&unk_1EE64CAE8))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", aClass);
}

@end

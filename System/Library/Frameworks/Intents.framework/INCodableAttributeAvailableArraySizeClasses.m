@implementation INCodableAttributeAvailableArraySizeClasses

void __INCodableAttributeAvailableArraySizeClasses_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("Small");
  v4[1] = CFSTR("Medium");
  v4[2] = CFSTR("Large");
  v4[3] = CFSTR("ExtraLarge");
  v4[4] = CFSTR("AccessoryCorner");
  v4[5] = CFSTR("AccessoryCircular");
  v4[6] = CFSTR("AccessoryRectangular");
  v4[7] = CFSTR("AccessoryInline");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)INCodableAttributeAvailableArraySizeClasses_codableAvailableArraySizeClasses;
  INCodableAttributeAvailableArraySizeClasses_codableAvailableArraySizeClasses = v2;

}

@end

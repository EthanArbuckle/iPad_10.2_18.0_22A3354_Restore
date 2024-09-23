@implementation NSTextAttachment(IC)

- (uint64_t)ic_isSystemTextAttachment
{
  void *v0;
  uint64_t v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "containsObject:", objc_opt_class());

  return v1;
}

@end

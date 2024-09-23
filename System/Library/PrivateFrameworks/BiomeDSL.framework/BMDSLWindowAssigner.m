@implementation BMDSLWindowAssigner

- (id)bpsWindowAssigner
{
  void *v2;
  uint64_t v3;
  void *v4;
  id result;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Must override method %@ in a subclass"), v4);

  __break(1u);
  return result;
}

@end

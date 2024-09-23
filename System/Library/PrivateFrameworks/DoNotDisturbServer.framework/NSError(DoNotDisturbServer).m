@implementation NSError(DoNotDisturbServer)

- (uint64_t)dnds_isOutOfSpaceError
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "code");
  if (objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CB28A8]) && v3 == 640)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CB2FE0]);
    if (v3 == 28)
      v4 = v5;
    else
      v4 = 0;
  }

  return v4;
}

@end

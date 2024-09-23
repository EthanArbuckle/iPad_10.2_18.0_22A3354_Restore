@implementation UTType(ITK)

- (uint64_t)itk_isPNG
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF84F8]);
}

- (uint64_t)itk_isHEIC
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF83E8]);
}

- (uint64_t)itk_isJPEG
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF8438]);
}

- (uint64_t)itk_isHEICS
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("public.heics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "conformsToType:", v2);

  return v3;
}

- (uint64_t)itk_isWebP
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF8660]);
}

- (uint64_t)itk_isGIF
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x24BDF83D8]);
}

@end

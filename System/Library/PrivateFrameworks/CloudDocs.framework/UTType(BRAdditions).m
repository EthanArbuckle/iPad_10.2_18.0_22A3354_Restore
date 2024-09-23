@implementation UTType(BRAdditions)

- (uint64_t)br_isDocumentType
{
  if ((objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC4F0]) & 1) != 0
    || (objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC428]) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC5F8]) ^ 1;
  }
}

- (uint64_t)br_isFileType
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC4A0]);
}

- (uint64_t)br_isPackageType
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC588]);
}

- (uint64_t)br_isSymbolicLinkType
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC5F8]);
}

- (uint64_t)br_isAliasFileType
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC428]);
}

- (uint64_t)br_isDirectoryType
{
  return objc_msgSend(a1, "conformsToType:", *MEMORY[0x1E0CEC4F0]);
}

@end

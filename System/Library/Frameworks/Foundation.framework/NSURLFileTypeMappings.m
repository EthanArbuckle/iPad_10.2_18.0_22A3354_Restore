@implementation NSURLFileTypeMappings

- (id)MIMETypeForExtension:(id)a3
{
  uint64_t v4;
  id result;

  v4 = objc_msgSend(a3, "lowercaseString");
  result = (id)objc_msgSend(&unk_1E0FCF0F8, "objectForKey:", v4);
  if (!result && self)
  {
    if (v4)
      return (id)objc_msgSend((id)-[objc_class typeWithFilenameExtension:](UTTypeClass(), "typeWithFilenameExtension:", v4), "preferredMIMEType");
  }
  return result;
}

+ (id)sharedMappings
{
  if (_MergedGlobals_124 != -1)
    dispatch_once(&_MergedGlobals_124, &__block_literal_global_52);
  return (id)qword_1ECD0A228;
}

NSURLFileTypeMappings *__39__NSURLFileTypeMappings_sharedMappings__block_invoke()
{
  NSURLFileTypeMappings *result;

  result = objc_alloc_init(NSURLFileTypeMappings);
  qword_1ECD0A228 = (uint64_t)result;
  return result;
}

- (id)preferredExtensionForMIMEType:(id)a3
{
  uint64_t v4;
  id result;

  v4 = objc_msgSend(a3, "lowercaseString");
  result = (id)objc_msgSend((id)objc_msgSend(&unk_1E0FCF120, "objectForKey:", v4), "objectAtIndex:", 0);
  if (!result && self)
  {
    if (v4)
      return (id)objc_msgSend((id)-[objc_class typeWithMIMEType:](UTTypeClass(), "typeWithMIMEType:", v4), "preferredFilenameExtension");
  }
  return result;
}

- (id)extensionsForMIMEType:(id)a3
{
  uint64_t v4;
  id result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "lowercaseString");
  result = (id)objc_msgSend(&unk_1E0FCF148, "objectForKey:", v4);
  if (!result && self && v4)
  {
    result = (id)objc_msgSend((id)-[objc_class typeWithMIMEType:](UTTypeClass(), "typeWithMIMEType:", v4), "preferredFilenameExtension");
    if (result)
    {
      v6[0] = result;
      return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    }
  }
  return result;
}

@end

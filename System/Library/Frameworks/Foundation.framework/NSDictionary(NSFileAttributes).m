@implementation NSDictionary(NSFileAttributes)

- (uint64_t)fileType
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileType"));
}

- (uint64_t)fileCreationDate
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileCreationDate"));
}

- (uint64_t)fileSize
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileSize")), "longLongValue");
}

- (uint64_t)fileModificationDate
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileModificationDate"));
}

- (uint64_t)filePosixPermissions
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFilePosixPermissions")), "unsignedIntegerValue") & 0xFFF;
}

- (uint64_t)fileOwnerAccountName
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileOwnerAccountName"));
}

- (uint64_t)fileOwnerAccountNumber
{
  return 0;
}

- (uint64_t)fileGroupOwnerAccountName
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileGroupOwnerAccountName"));
}

- (uint64_t)fileGroupOwnerAccountNumber
{
  return 0;
}

- (uint64_t)fileSystemNumber
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileSystemNumber")), "integerValue");
}

- (uint64_t)fileSystemFileNumber
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileSystemFileNumber")), "unsignedIntegerValue");
}

- (uint64_t)fileExtensionHidden
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileExtensionHidden")), "BOOLValue");
}

- (uint64_t)fileHFSCreatorCode
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileHFSCreatorCode")), "unsignedLongValue");
}

- (uint64_t)fileHFSTypeCode
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileHFSTypeCode")), "unsignedLongValue");
}

- (uint64_t)fileIsImmutable
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileImmutable")), "BOOLValue");
}

- (uint64_t)fileIsAppendOnly
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFileAppendOnly")), "BOOLValue");
}

- (uint64_t)fileOwnerAccountID
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileOwnerAccountID"));
}

- (uint64_t)fileGroupOwnerAccountID
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("NSFileGroupOwnerAccountID"));
}

@end

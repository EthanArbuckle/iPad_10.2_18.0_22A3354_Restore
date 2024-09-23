@implementation HKSampleType(Attachments)

- (uint64_t)attachmentSchemaVersion
{
  if (objc_msgSend(a1, "code") == 257)
    return 1;
  else
    return -1;
}

@end

@implementation MFMessage(MailMessage)

- (uint64_t)attachmentStorageLocation
{
  return objc_msgSend((id)objc_msgSend(a1, "messageStore"), "storagePath");
}

@end

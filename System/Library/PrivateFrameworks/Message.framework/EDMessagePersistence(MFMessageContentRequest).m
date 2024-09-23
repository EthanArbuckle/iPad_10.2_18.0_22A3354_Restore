@implementation EDMessagePersistence(MFMessageContentRequest)

- (uint64_t)mailDropAttachmentPresentForMessage:()MFMessageContentRequest
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "cachedMetadataJSONForKey:messageID:", CFSTR("maild.isMailDropAttachmentPresent"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("1")) & 1) != 0)
  {
    v4 = MEMORY[0x1E0C9AAB0];
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("0")))
  {
    v4 = MEMORY[0x1E0C9AAA0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)setIsMailDropAttachmentPresent:()MFMessageContentRequest forMessage:
{
  const __CFString *v4;

  if (a3)
    v4 = CFSTR("1");
  else
    v4 = CFSTR("0");
  return objc_msgSend(a1, "setCachedMetadataJSON:forKey:messageID:", v4, CFSTR("maild.isMailDropAttachmentPresent"), a4);
}

@end

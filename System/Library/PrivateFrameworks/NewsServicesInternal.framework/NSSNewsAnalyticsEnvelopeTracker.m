@implementation NSSNewsAnalyticsEnvelopeTracker

+ (void)registerEnvelopeCreationAnticipatedForContentType:(int)a3
{
  objc_msgSend(MEMORY[0x1E0D56B90], "registerEnvelopeCreationAnticipatedForContentType:", *(_QWORD *)&a3);
}

+ (void)registerEnvelopesAsCreated:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D56B90], "registerEnvelopesAsCreated:", a3);
}

@end

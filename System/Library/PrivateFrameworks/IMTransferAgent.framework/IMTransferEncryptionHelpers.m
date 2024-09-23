@implementation IMTransferEncryptionHelpers

+ (void)encryptURL:(id)a3 completionBlock:(id)a4
{
  sub_22D9939E4(1, a3, 0, 0, a4, 0);
}

+ (void)decryptURL:(id)a3 key:(id)a4 outputFileName:(id)a5 completionBlock:(id)a6
{
  sub_22D9939E4(0, a3, a4, a5, 0, a6);
}

@end

@implementation HAP2AccessoryServerSecureTransportBaseDefaultEncryptedSession

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end

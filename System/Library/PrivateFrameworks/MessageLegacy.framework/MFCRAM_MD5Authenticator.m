@implementation MFCRAM_MD5Authenticator

- (id)responseForServerData:(id)a3
{
  void *v5;
  uint64_t v6;
  id result;
  __CFData *Mutable;
  uint64_t v9;
  uint64_t v10;
  UInt8 bytes;
  char __str[3];
  _WORD c[124];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "username"), "dataUsingEncoding:", 4);
  v6 = objc_msgSend((id)objc_msgSend(-[MFSASLAuthenticator account](self, "account"), "password"), "dataUsingEncoding:", 4);
  result = 0;
  if (v5 && v6)
  {
    memset(c, 0, 220);
    bytes = 32;
    Mutable = CFDataCreateMutable(0, objc_msgSend(v5, "length") + 33);
    CFDataAppendBytes(Mutable, (const UInt8 *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
    CFDataAppendBytes(Mutable, &bytes, 1);
    MF_MD5HMAC_Init();
    CC_MD5_Update((CC_MD5_CTX *)c, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
    MF_MD5HMAC_Output();
    v9 = 0;
    do
    {
      v10 = v9 + 1;
      snprintf(__str, 3uLL, "%02x", *((unsigned __int8 *)&c[116] + v9));
      -[__CFData appendBytes:length:](Mutable, "appendBytes:length:", __str, 2);
      v9 = v10;
    }
    while (v10 != 16);
    return Mutable;
  }
  return result;
}

@end

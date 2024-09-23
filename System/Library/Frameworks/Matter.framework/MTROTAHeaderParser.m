@implementation MTROTAHeaderParser

+ (MTROTAHeader)headerFromData:(NSData *)data error:(NSError *)error
{
  NSData *v5;
  MTROTAHeader *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  int v12;

  v5 = data;
  v6 = [MTROTAHeader alloc];
  v8 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v5);
  v9 = (void *)v8;
  if (error && !v8)
  {
    LODWORD(v11) = 47;
    *((_QWORD *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTROTAHeader.mm";
    v12 = 82;
    sub_2340017F0((uint64_t)MTRError, &v11);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return (MTROTAHeader *)v9;
}

@end

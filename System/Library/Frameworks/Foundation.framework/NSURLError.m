@implementation NSURLError

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = -[NSError userInfo](self, "userInfo");
  v6 = (void *)-[NSDictionary mutableCopy](v5, "mutableCopy");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSErrorPeerCertificateChainKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSErrorClientCertificateChainKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSURLErrorFailingURLPeerTrustErrorKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSUnderlyingError"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __dictionaryThatCanCode_block_invoke;
  v7[3] = &unk_1E0F4D940;
  v7[4] = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSError encodeWithCoder:](+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", -[NSError domain](self, "domain"), -[NSError code](self, "code"), v6), "encodeWithCoder:", a3);
}

@end

@implementation FPDDomainCleanupResult

- (NSURL)resultURL
{
  return self->_resultURL;
}

- (void)setResultURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultURL, 0);
}

@end

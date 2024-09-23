@implementation FontProviderCell

- (NSString)providerBundle
{
  return self->providerBundle;
}

- (void)setProviderBundle:(id)a3
{
  objc_storeStrong((id *)&self->providerBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->providerBundle, 0);
}

@end

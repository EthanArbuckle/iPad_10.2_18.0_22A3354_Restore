@implementation BMEventAppAssociatingImplementor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleID, 0);
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  -[BMEventAppAssociatingImplementor bundleID](self, "bundleID", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

@end

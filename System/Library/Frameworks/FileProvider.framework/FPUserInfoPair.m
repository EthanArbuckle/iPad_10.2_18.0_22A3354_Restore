@implementation FPUserInfoPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

- (NSString)b
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)a
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (FPUserInfoPair)initWithA:(id)a3 b:(id)a4
{
  id v6;

  v6 = a4;
  -[FPUserInfoPair setA:](self, "setA:", a3);
  -[FPUserInfoPair setB:](self, "setB:", v6);

  return self;
}

- (void)setB:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setA:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end

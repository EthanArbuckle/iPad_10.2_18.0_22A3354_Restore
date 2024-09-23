@implementation _HKMutableFactorization

- (void)divideByFactorization:(id)a3
{
  id v4;

  objc_msgSend(a3, "reciprocal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKFactorization _multiplyByFactorization:](self, "_multiplyByFactorization:", v4);

}

@end

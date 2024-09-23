@implementation TKTokenKeyAlgorithm

- (TKTokenKeyAlgorithm)initWithAlgorithmsArray:(id)a3
{
  id v5;
  TKTokenKeyAlgorithm *v6;
  TKTokenKeyAlgorithm *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenKeyAlgorithm;
  v6 = -[TKTokenKeyAlgorithm init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_algorithms, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !-[NSArray count](v7->_algorithms, "count"))
    {

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isAlgorithm:(SecKeyAlgorithm)algorithm
{
  void *v4;

  -[NSArray lastObject](self->_algorithms, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(algorithm) = objc_msgSend(v4, "isEqual:", algorithm);

  return (char)algorithm;
}

- (BOOL)supportsAlgorithm:(SecKeyAlgorithm)algorithm
{
  return -[NSArray indexOfObject:](self->_algorithms, "indexOfObject:", algorithm) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithms, 0);
}

@end

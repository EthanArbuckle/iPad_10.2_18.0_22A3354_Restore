@implementation GKLinearCongruentialRandomSource

- (GKLinearCongruentialRandomSource)init
{
  id v4;
  uint64_t bytes;

  bytes = 0;
  if (SecRandomCopyBytes(0, 8uLL, &bytes))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("failed to generate secure random bytes"), MEMORY[0x24BDBD1B8]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return -[GKLinearCongruentialRandomSource initWithSeed:](self, "initWithSeed:", bytes);
}

- (GKLinearCongruentialRandomSource)initWithSeed:(uint64_t)seed
{
  GKLinearCongruentialRandomSource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKLinearCongruentialRandomSource;
  result = -[GKRandomSource init](&v5, sel_init);
  if (result)
    result->_seed = seed;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSeed:", self->_seed);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLinearCongruentialRandomSource)initWithCoder:(id)a3
{
  id v4;
  GKLinearCongruentialRandomSource *v5;

  v4 = a3;
  v5 = -[GKLinearCongruentialRandomSource init](self, "init");
  if (v5)
    v5->_seed = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("seed"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GKLinearCongruentialRandomSource;
  -[GKRandomSource encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_seed, CFSTR("seed"));

}

- (uint64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(uint64_t)seed
{
  self->_seed = seed;
}

- (unint64_t)nextBits:(int)a3
{
  unint64_t result;

  result = (0x5DEECE66DLL * self->_seed + 11) & 0xFFFFFFFFFFFFLL;
  self->_seed = result;
  if (a3 < 1)
    return 0;
  if (a3 <= 0x30)
    result >>= 48 - a3;
  return result;
}

- (int64_t)nextInt
{
  return (int)-[GKLinearCongruentialRandomSource nextBits:](self, "nextBits:", 32);
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  unint64_t v5;
  unint64_t result;
  unint64_t v7;

  v5 = a3 - 1;
  if ((a3 & (a3 - 1)) == 0)
    return (-[GKLinearCongruentialRandomSource nextBits:](self, "nextBits:", 32) * a3) >> 32;
  do
  {
    v7 = -[GKLinearCongruentialRandomSource nextBits:](self, "nextBits:", 32);
    result = v7 % a3;
  }
  while (v5 + v7 < v7 % a3);
  return result;
}

- (float)nextUniform
{
  return (float)-[GKLinearCongruentialRandomSource nextBits:](self, "nextBits:", 24) * 0.000000059605;
}

- (BOOL)nextBool
{
  return -[GKLinearCongruentialRandomSource nextBits:](self, "nextBits:", 1) != 0;
}

@end

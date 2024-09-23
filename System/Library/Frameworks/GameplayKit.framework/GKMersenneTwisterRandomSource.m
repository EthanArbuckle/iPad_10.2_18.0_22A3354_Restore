@implementation GKMersenneTwisterRandomSource

- (GKMersenneTwisterRandomSource)init
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
  return -[GKMersenneTwisterRandomSource initWithSeed:](self, "initWithSeed:", bytes);
}

- (GKMersenneTwisterRandomSource)initWithSeed:(uint64_t)seed
{
  GKMersenneTwisterRandomSource *v4;
  GKMersenneTwisterRandomSource *v5;
  uint64_t i;
  _QWORD __src[313];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKMersenneTwisterRandomSource;
  v4 = -[GKRandomSource init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_seed = seed;
    __src[0] = seed;
    for (i = 1; i != 312; ++i)
    {
      seed = i + 0x5851F42D4C957F2DLL * (seed ^ (seed >> 62));
      __src[i] = seed;
    }
    __src[312] = 0;
    memcpy(&v4->_engine, __src, sizeof(v4->_engine));
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSeed:", self->_seed);
  memcpy((void *)(v4 + 16), &self->_engine, 0x9C8uLL);
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKMersenneTwisterRandomSource;
  -[GKRandomSource encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (uint64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(uint64_t)seed
{
  uint64_t i;

  self->_seed = seed;
  self->_engine.__x_[0] = seed;
  for (i = 1; i != 312; ++i)
  {
    seed = i + 0x5851F42D4C957F2DLL * (seed ^ (seed >> 62));
    self->_engine.__x_[i] = seed;
  }
  self->_engine.__i_ = 0;
}

- (unint64_t)nextBits:(int)a3
{
  unint64_t i;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  i = self->_engine.__i_;
  v4 = (i + 1) % 0x138;
  v5 = i;
  v6 = self->_engine.__x_[(i + 156) % 0x138] ^ ((self->_engine.__x_[v4] & 0x7FFFFFFE | self->_engine.__x_[i] & 0xFFFFFFFF80000000) >> 1) ^ ((uint64_t)(self->_engine.__x_[v4] << 63) >> 63) & 0xB5026F5AA96619E9;
  self->_engine.__x_[v5] = v6;
  self->_engine.__i_ = v4;
  v7 = (((v6 >> 29) & 0x5555555555555555 ^ v6) << 17) & 0x71D67FFFEDA60000 ^ (v6 >> 29) & 0x5555555555555555 ^ v6;
  return ((v7 << 37) & 0xFFF7EEE000000000 ^ v7 ^ (((v7 << 37) & 0xFFF7EEE000000000 ^ v7) >> 43)) >> -(char)a3;
}

- (int64_t)nextInt
{
  return (int)-[GKMersenneTwisterRandomSource nextBits:](self, "nextBits:", 32);
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  unint64_t v5;
  unint64_t result;
  unint64_t v7;

  v5 = a3 - 1;
  if ((a3 & (a3 - 1)) == 0)
    return (-[GKMersenneTwisterRandomSource nextBits:](self, "nextBits:", 32) * a3) >> 32;
  do
  {
    v7 = -[GKMersenneTwisterRandomSource nextBits:](self, "nextBits:", 32);
    result = v7 % a3;
  }
  while (v5 + v7 < v7 % a3);
  return result;
}

- (float)nextUniform
{
  return (float)-[GKMersenneTwisterRandomSource nextBits:](self, "nextBits:", 24) * 0.000000059605;
}

- (BOOL)nextBool
{
  return -[GKMersenneTwisterRandomSource nextBits:](self, "nextBits:", 1) != 0;
}

- (id).cxx_construct
{
  unint64_t v2;
  uint64_t i;

  v2 = 5489;
  *((_QWORD *)self + 2) = 5489;
  for (i = 1; i != 312; ++i)
  {
    v2 = i + 0x5851F42D4C957F2DLL * (v2 ^ (v2 >> 62));
    *((_QWORD *)self + i + 2) = v2;
  }
  *((_QWORD *)self + 314) = 0;
  return self;
}

@end

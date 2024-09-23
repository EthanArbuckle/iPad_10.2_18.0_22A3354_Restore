@implementation GKCoherentNoiseSource

- (double)valueAt:(GKCoherentNoiseSource *)self
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Derived class %@ must override %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, MEMORY[0x24BDBD1B8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)cloneModule
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Derived class %@ must override %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, MEMORY[0x24BDBD1B8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)frequency
{
  self->_frequency = frequency;
}

- (NSInteger)octaveCount
{
  return self->_octaveCount;
}

- (void)setOctaveCount:(NSInteger)octaveCount
{
  self->_octaveCount = octaveCount;
}

- (double)lacunarity
{
  return self->_lacunarity;
}

- (void)setLacunarity:(double)lacunarity
{
  self->_lacunarity = lacunarity;
}

- (int32_t)seed
{
  return self->_seed;
}

- (void)setSeed:(int32_t)seed
{
  self->_seed = seed;
}

@end

@implementation SNMovieRemixDSPParameter

- (unsigned)key
{
  return sub_1D430431C();
}

- (void)setKey:(unsigned int)a3
{
  sub_1D4304350(*(uint64_t *)&a3);
}

- (float)value
{
  return sub_1D4304380();
}

- (void)setValue:(float)a3
{
  sub_1D43043B0(a3);
}

- (SNMovieRemixDSPParameter)init
{
  SNMovieRemixDSPParameter.init()();
}

@end

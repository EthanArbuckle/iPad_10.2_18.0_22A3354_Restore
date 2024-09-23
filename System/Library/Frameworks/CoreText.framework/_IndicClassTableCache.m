@implementation _IndicClassTableCache

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t v4;

  for (i = 8; i != 80; i += 8)
  {
    v4 = *(uint64_t *)((char *)&self->super.isa + i);
    if (v4)
      MEMORY[0x186DC0394](v4, 0x1000C8052888210);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end

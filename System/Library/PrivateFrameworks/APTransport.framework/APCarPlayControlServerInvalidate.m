@implementation APCarPlayControlServerInvalidate

uint64_t __APCarPlayControlServerInvalidate_block_invoke(uint64_t a1)
{
  return _APCarPlayControlServerInvalidate(*(_QWORD *)(a1 + 32));
}

uint64_t ___APCarPlayControlServerInvalidate_block_invoke(uint64_t a1, const void *a2)
{
  return APCarPlayControlServerRemoveInterface(*(_QWORD *)(a1 + 32), a2);
}

@end

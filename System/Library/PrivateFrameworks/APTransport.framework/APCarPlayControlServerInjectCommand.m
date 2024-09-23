@implementation APCarPlayControlServerInjectCommand

uint64_t __APCarPlayControlServerInjectCommand_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  size_t v4;

  v1 = a1[4];
  v2 = a1[5];
  v3 = (const char *)a1[6];
  v4 = strlen(v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, size_t, _QWORD))(v1 + 88))(v1, v2, v3, v4, *(_QWORD *)(v1 + 96));
}

@end

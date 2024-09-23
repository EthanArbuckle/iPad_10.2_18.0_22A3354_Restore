@implementation CFUUIDCreate

double __CFUUIDCreate_block_invoke(uint64_t a1)
{
  int v2;
  char *v3;
  double result;
  uuid_t out;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(out, 0, sizeof(out));
  v2 = __CFUUIDClass_block_invoke_useV1UUIDs;
  if (__CFUUIDClass_block_invoke_useV1UUIDs == 255)
  {
    v3 = getenv("CFUUIDVersionNumber");
    if (!v3)
    {
LABEL_6:
      uuid_generate_random(out);
      goto LABEL_7;
    }
    v2 = strtoul_l(v3, 0, 0, 0) == 1;
    __CFUUIDClass_block_invoke_useV1UUIDs = v2;
  }
  if (v2 != 1)
    goto LABEL_6;
  uuid_generate_time(out);
LABEL_7:
  result = *(double *)out;
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_OWORD *)out;
  return result;
}

@end

@implementation AppendModeWriteObjects

uint64_t __AppendModeWriteObjects_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unsigned int v6;

  v3 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)a3 + 16);
  v5 = v3 > v4;
  if (v3 >= v4)
    v6 = 0;
  else
    v6 = -1;
  if (v5)
    return 1;
  else
    return v6;
}

@end

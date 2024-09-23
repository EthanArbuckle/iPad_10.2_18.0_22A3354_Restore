@implementation NSUUID(CoordinationCore)

- (uint64_t)co_compare:()CoordinationCore
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11[0] = 0;
  v11[1] = 0;
  v10[0] = 0;
  v10[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v11);
  objc_msgSend(v4, "getUUIDBytes:", v10);
  v5 = 0;
  v6 = 1;
  while (1)
  {
    v7 = *((unsigned __int8 *)v11 + v5);
    v8 = *((unsigned __int8 *)v10 + v5);
    if (v7 < v8)
      break;
    if (v7 > v8)
      goto LABEL_7;
    if (++v5 == 16)
    {
      v6 = 0;
      goto LABEL_7;
    }
  }
  v6 = -1;
LABEL_7:

  return v6;
}

@end

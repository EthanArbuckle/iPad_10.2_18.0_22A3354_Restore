@implementation SNNComputeUnit

- (SNNComputeUnit)initWithComputeUnitKind:(int64_t)a3
{
  SNNComputeUnit *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SNNComputeUnit;
  result = -[SNNComputeUnit init](&v5, sel_init);
  if (result)
    result->_kind = a3;
  return result;
}

- (int)platform
{
  int64_t v2;
  int v3;

  v2 = -[SNNComputeUnit kind](self, "kind");
  if (v2 == 2)
    v3 = 50005;
  else
    v3 = 0;
  if (v2 == 3)
    return 10007;
  else
    return v3;
}

- (unint64_t)bitmask
{
  int64_t v2;

  v2 = -[SNNComputeUnit kind](self, "kind");
  if ((unint64_t)(v2 - 1) > 2)
    return -1;
  else
    return qword_242C4B7A0[v2 - 1];
}

+ (unint64_t)bitmakForComputeUnits:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v4 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "bitmask", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v4;
}

- (int64_t)kind
{
  return self->_kind;
}

@end

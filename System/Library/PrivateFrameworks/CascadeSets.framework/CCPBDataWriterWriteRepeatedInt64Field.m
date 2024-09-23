@implementation CCPBDataWriterWriteRepeatedInt64Field

void __CCPBDataWriterWriteRepeatedInt64Field_block_invoke(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = v4[3];
  v6 = (_BYTE *)v4[1];
  if (v5 < (unint64_t)(v6 + 10))
  {
    if (v5 - v4[2] <= 0xA)
      v7 = 10;
    else
      v7 = v5 - v4[2];
    -[CCPBMutableData _pb_growCapacityBy:](v4, v7);
    v6 = *(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8);
  }
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      *v6++ = a2 | 0x80;
      v8 = a2 >> 7;
      v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  *v6 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8) = v6 + 1;
}

@end

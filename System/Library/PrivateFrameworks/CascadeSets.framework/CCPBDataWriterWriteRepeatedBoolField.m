@implementation CCPBDataWriterWriteRepeatedBoolField

void __CCPBDataWriterWriteRepeatedBoolField_block_invoke(uint64_t a1, char a2)
{
  _QWORD *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;

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
  *v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8) = v6 + 1;
}

@end

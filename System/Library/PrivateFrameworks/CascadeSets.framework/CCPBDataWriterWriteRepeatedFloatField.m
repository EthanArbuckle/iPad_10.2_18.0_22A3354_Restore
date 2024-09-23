@implementation CCPBDataWriterWriteRepeatedFloatField

void __CCPBDataWriterWriteRepeatedFloatField_block_invoke(uint64_t a1, float a2)
{
  _QWORD *v4;
  unint64_t v5;
  float *v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = v4[3];
  v6 = (float *)v4[1];
  if (v5 < (unint64_t)(v6 + 1))
  {
    v7 = v5 - v4[2];
    if (v7 <= 4)
      v8 = 4;
    else
      v8 = v7;
    -[CCPBMutableData _pb_growCapacityBy:](v4, v8);
    v6 = *(float **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8);
  }
  *v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8) += 4;
}

@end

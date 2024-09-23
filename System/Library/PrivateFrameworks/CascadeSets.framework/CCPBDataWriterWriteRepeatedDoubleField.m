@implementation CCPBDataWriterWriteRepeatedDoubleField

void __CCPBDataWriterWriteRepeatedDoubleField_block_invoke(uint64_t a1, double a2)
{
  _QWORD *v4;
  unint64_t v5;
  double *v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = v4[3];
  v6 = (double *)v4[1];
  if (v5 < (unint64_t)(v6 + 1))
  {
    v7 = v5 - v4[2];
    if (v7 <= 8)
      v8 = 8;
    else
      v8 = v7;
    -[CCPBMutableData _pb_growCapacityBy:](v4, v8);
    v6 = *(double **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8);
  }
  *v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8) += 8;
}

@end

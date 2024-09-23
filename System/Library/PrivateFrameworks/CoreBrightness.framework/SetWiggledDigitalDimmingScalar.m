@implementation SetWiggledDigitalDimmingScalar

void __SetWiggledDigitalDimmingScalar_block_invoke(uint64_t a1)
{
  id v1;
  double v2;
  uint64_t v3;
  id v4;
  id v5;
  float v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v8 = a1;
  v7 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v6 = 0.0;
    v6 = *(float *)(v3 + 40);
    if (v6 == *(float *)(*(_QWORD *)(v3 + 32) + 1520))
    {
      v6 = v6 + (float)(0.000001 * (float)SetWiggledDigitalDimmingScalar_direction);
      SetWiggledDigitalDimmingScalar_direction = -SetWiggledDigitalDimmingScalar_direction;
    }
    v1 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v2 = v6;
    v5 = (id)objc_msgSend(v1, "initWithFloat:", v2);
    v4 = 0;
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("Scaler"), 0);
    (*(void (**)(_QWORD, const __CFString *, id))(*(_QWORD *)(v3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 24), CFSTR("UpdateDigitalDimmingBrightnessScaler"), v4);
    *(float *)(*(_QWORD *)(v3 + 32) + 1520) = v6;

  }
}

@end

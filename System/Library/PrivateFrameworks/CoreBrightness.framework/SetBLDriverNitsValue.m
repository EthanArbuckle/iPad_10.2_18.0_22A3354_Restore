@implementation SetBLDriverNitsValue

void __SetBLDriverNitsValue_block_invoke(uint64_t a1)
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
    v6 = *(float *)(v3 + 40) / *(float *)(*(_QWORD *)(v3 + 32) + 1532);
    if (*(float *)(*(_QWORD *)(v3 + 32) + 1520) != v6)
    {
      v1 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v2 = v6;
      v5 = (id)objc_msgSend(v1, "initWithFloat:", v2);
      v4 = 0;
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("Scaler"), 0);

      (*(void (**)(_QWORD, const __CFString *, id))(*(_QWORD *)(v3 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 24), CFSTR("UpdateDigitalDimmingBrightnessScaler"), v4);
      *(float *)(*(_QWORD *)(v3 + 32) + 1520) = v6;

    }
  }
}

float __SetBLDriverNitsValue_block_invoke_2(uint64_t a1)
{
  float result;
  id v2;
  double v3;
  uint64_t v4;
  id v5;
  id v6;
  float v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a1;
  v9 = a1;
  v8 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = 1.0;
    result = *(float *)(*(_QWORD *)(v4 + 32) + 1520);
    if (result != 1.0)
    {
      v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v3 = v7;
      v6 = (id)objc_msgSend(v2, "initWithFloat:", v3);
      v5 = 0;
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("Scaler"), 0);

      (*(void (**)(_QWORD, const __CFString *, id))(*(_QWORD *)(v4 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 24), CFSTR("UpdateDigitalDimmingBrightnessScaler"), v5);
      result = v7;
      *(float *)(*(_QWORD *)(v4 + 32) + 1520) = v7;
    }
  }
  return result;
}

float __SetBLDriverNitsValue_block_invoke_3(uint64_t a1)
{
  float result;
  id v2;
  double v3;
  uint64_t v4;
  id v5;
  id v6;
  float v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a1;
  v9 = a1;
  v8 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = 1.0;
    result = *(float *)(*(_QWORD *)(v4 + 32) + 1520);
    if (result != 1.0)
    {
      v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
      *(float *)&v3 = v7;
      v6 = (id)objc_msgSend(v2, "initWithFloat:", v3);
      v5 = 0;
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("Scaler"), 0);

      (*(void (**)(_QWORD, const __CFString *, id))(*(_QWORD *)(v4 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 24), CFSTR("UpdateDigitalDimmingBrightnessScaler"), v5);
      result = v7;
      *(float *)(*(_QWORD *)(v4 + 32) + 1520) = v7;
    }
  }
  return result;
}

void __SetBLDriverNitsValue_block_invoke_4(uint64_t a1)
{
  float v1;
  id v2;
  double v3;
  uint64_t v4;
  id v5;
  id v6;
  float v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a1;
  v9 = a1;
  v8 = a1;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = 0.0;
    v1 = 1.0;
    if (*(float *)(*(_QWORD *)(v4 + 32) + 1520) != 1.0)
      v1 = 1.0;
    v7 = v1;
    v2 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v3 = v7;
    v6 = (id)objc_msgSend(v2, "initWithFloat:", v3);
    v5 = 0;
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("Scaler"), 0);
    (*(void (**)(_QWORD, const __CFString *, id))(*(_QWORD *)(v4 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 24), CFSTR("UpdateDigitalDimmingBrightnessScaler"), v5);
    *(float *)(*(_QWORD *)(v4 + 32) + 1520) = v7;

  }
}

@end

@implementation HKAudioVisibleRangeQuantityContextDelegate

void __102___HKAudioVisibleRangeQuantityContextDelegate_valueString_applicationItems_representativeDisplayType___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0CB6300];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "averageLEQ");
  v7 = v6;
  objc_msgSend(v4, "duration");
  v9 = v8;

  v10 = (id)objc_msgSend(v5, "initWithValue:duration:", v7, v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v10);

}

double __109___HKAudioVisibleRangeQuantityContextDelegate_valueContextString_applicationItems_representativeDisplayType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "duration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

@end

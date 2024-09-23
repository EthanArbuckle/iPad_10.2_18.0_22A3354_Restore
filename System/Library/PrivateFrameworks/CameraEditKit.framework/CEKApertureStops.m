@implementation CEKApertureStops

uint64_t __56__CEKApertureStops_indexOfClosestValidValueForAperture___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;
  double v9;
  uint64_t v10;

  result = objc_msgSend(a2, "doubleValue");
  v9 = vabdd_f64(v8, *(double *)(a1 + 48));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v9 >= *(double *)(v10 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v10 + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

+ (id)closestValidValueForAperture:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "validApertureValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend((id)objc_opt_class(), "indexOfClosestValidValueForAperture:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validApertureValues
{
  if (validApertureValues_onceToken != -1)
    dispatch_once(&validApertureValues_onceToken, &__block_literal_global_5);
  return (id)validApertureValues_apertureValues;
}

+ (unint64_t)indexOfClosestValidValueForAperture:(double)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend((id)objc_opt_class(), "validApertureValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x7FEFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CEKApertureStops_indexOfClosestValidValueForAperture___block_invoke;
  v7[3] = &unk_1E70A5440;
  *(double *)&v7[6] = a3;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __39__CEKApertureStops_validApertureValues__block_invoke()
{
  void *v0;

  v0 = (void *)validApertureValues_apertureValues;
  validApertureValues_apertureValues = (uint64_t)&unk_1E70B4638;

}

+ (unint64_t)firstFullStopIndexAfterOrIncludingIndex:(unint64_t)a3
{
  unint64_t v3;

  v3 = ((a3 + 1) % 3) ^ 3;
  if (!((a3 + 1) % 3))
    v3 = 0;
  return v3 + a3;
}

+ (BOOL)isValidApertureIndexFullStop:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "firstFullStopIndexAfterOrIncludingIndex:", a3) == a3;
}

+ (BOOL)isValidApertureIndex:(unint64_t)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "validApertureValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "count") > a3;

  return a3;
}

@end

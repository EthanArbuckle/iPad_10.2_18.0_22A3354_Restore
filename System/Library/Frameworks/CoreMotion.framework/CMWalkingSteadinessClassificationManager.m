@implementation CMWalkingSteadinessClassificationManager

+ (BOOL)isWalkingSteadinessAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    sub_18F1F77DC();
    return ((unint64_t)sub_18F1F7BFC() >> 53) & 1;
  }
  return v2;
}

+ (BOOL)classificationForScore:(double)a3 classification:(int64_t *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7;
  uint64_t v8;
  double v9;
  int v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  int v18;

  v7 = &qword_18F507F08;
  while (1)
  {
    v8 = *v7;
    if (*(double *)v7 <= a3)
    {
      v9 = *((double *)v7 + 1);
      if (v9 > a3)
      {
        v11 = *((_DWORD *)v7 + 6);
        goto LABEL_10;
      }
    }
    if (*((_DWORD *)v7 + 6) == 1)
    {
      v9 = *((double *)v7 + 1);
      if (vabdd_f64(a3, v9) <= 1.0e-12)
        break;
    }
    v7 += 4;
    if (v7 == &qword_18F507F68)
      return 0;
  }
  v11 = 1;
LABEL_10:
  v17[0] = v8;
  *(double *)&v17[1] = v9;
  v18 = v11;
  v12 = (void *)objc_msgSend_classificationDataFromStruct_(CMWalkingSteadinessClassificationManager, a2, (uint64_t)v17, v4, v5);
  *a4 = objc_msgSend_classificationType(v12, v13, v14, v15, v16);
  return 1;
}

+ (double)minimumScoreForClassification:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  __int128 v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  _OWORD v17[2];

  LODWORD(v8) = objc_msgSend_mapClassificationTypeFromFrameworkToClassifier_(CMWalkingSteadinessClassificationManager, a2, a3, v3, v4)- 1;
  if (v8 >= 3)
    v8 = 0;
  else
    v8 = v8;
  v9 = &qword_18F507F08[4 * v8];
  v10 = *((_OWORD *)v9 + 1);
  v17[0] = *(_OWORD *)v9;
  v17[1] = v10;
  v11 = (void *)objc_msgSend_classificationDataFromStruct_(CMWalkingSteadinessClassificationManager, v5, (uint64_t)v17, v6, v7);
  objc_msgSend_lowerBound(v11, v12, v13, v14, v15);
  return result;
}

+ (double)maximumScoreForClassification:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  __int128 v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  _OWORD v17[2];

  LODWORD(v8) = objc_msgSend_mapClassificationTypeFromFrameworkToClassifier_(CMWalkingSteadinessClassificationManager, a2, a3, v3, v4)- 1;
  if (v8 >= 3)
    v8 = 0;
  else
    v8 = v8;
  v9 = &qword_18F507F08[4 * v8];
  v10 = *((_OWORD *)v9 + 1);
  v17[0] = *(_OWORD *)v9;
  v17[1] = v10;
  v11 = (void *)objc_msgSend_classificationDataFromStruct_(CMWalkingSteadinessClassificationManager, v5, (uint64_t)v17, v6, v7);
  objc_msgSend_upperBound(v11, v12, v13, v14, v15);
  return result;
}

+ (id)classificationDataFromStruct:(CLWalkingSteadinessClassificationData *)a3
{
  double var0;
  double var1;
  int var3;
  uint64_t v6;
  uint64_t v7;
  CMWalkingSteadinessClassificationData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  var0 = a3->var0;
  var1 = a3->var1;
  var3 = a3->var3;
  v6 = 1;
  if (var3 == 2)
    v6 = 2;
  if (var3 == 3)
    v7 = 3;
  else
    v7 = v6;
  v8 = [CMWalkingSteadinessClassificationData alloc];
  return (id)objc_msgSend_initWithLowerBound_upperBound_classificationType_(v8, v9, v7, v10, v11, var0, var1);
}

+ (int)mapClassificationTypeFromFrameworkToClassifier:(int64_t)a3
{
  int v3;

  if (a3 == 2)
    v3 = 2;
  else
    v3 = 1;
  if (a3 == 3)
    return 3;
  else
    return v3;
}

@end

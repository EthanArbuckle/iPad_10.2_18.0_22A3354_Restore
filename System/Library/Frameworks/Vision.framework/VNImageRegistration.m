@implementation VNImageRegistration

+ (BOOL)computeTransform:(CGAffineTransform *)a3 forRegisteringImageSignature:(id)a4 withSignature:(id)a5 minimumOverlap:(float)a6 error:(id *)a7
{
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  CGAffineTransform v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "signature");
  v14 = objc_msgSend(v12, "signature");
  v15 = v14;
  v31 = 0;
  v32 = 0;
  v16 = *(_QWORD *)(v13 + 8);
  if (v16 >= *(_QWORD *)(v14 + 8))
    v16 = *(_QWORD *)(v14 + 8);
  v17 = (int)(float)((float)v16 * a6);
  v28.a = 0.0;
  *(_QWORD *)&v28.b = &v28;
  *(_QWORD *)&v28.c = 0x2000000000;
  *(_QWORD *)&v28.d = 4736;
  v33 = &v32;
  v34 = 0x2000000000;
  v18 = *(_QWORD *)(v13 + 32);
  v19 = *(_QWORD *)(v13 + 40);
  v20 = *(_QWORD *)(v15 + 32);
  v21 = *(_QWORD *)(v15 + 40);
  if (v19 >= v21)
    v22 = *(_QWORD *)(v15 + 40);
  else
    v22 = *(_QWORD *)(v13 + 40);
  v35 = 4736;
  Projections_computeShiftBruteForce(v18, v19, (_QWORD *)(v13 + 48), v20, v21, (_QWORD *)(v15 + 48), (int)(float)((float)v22 * a6), (float *)&v31 + 1, &v30);
  *(_QWORD *)(*(_QWORD *)&v28.b + 24) = 4736;
  Projections_computeShiftBruteForce(*(_QWORD *)v13, *(_DWORD *)(v13 + 8), (_QWORD *)(v13 + 16), *(_QWORD *)v15, *(_DWORD *)(v15 + 8), (_QWORD *)(v15 + 16), v17, (float *)&v31, &v29);
  v33[3] = 4736;
  v23 = v31;
  v24 = *(_QWORD *)(*(_QWORD *)&v28.b + 24);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v28, 8);
  if (v24 == 4736)
    v25 = 4736;
  else
    v25 = 4710;
  if (v24 == 4736)
  {
    if (a3)
    {
      CGAffineTransformMakeTranslation(&v28, (float)-*((float *)&v23 + 1), *(float *)&v23);
      v26 = *(_OWORD *)&v28.c;
      *(_OWORD *)&a3->a = *(_OWORD *)&v28.a;
      *(_OWORD *)&a3->c = v26;
      *(_OWORD *)&a3->tx = *(_OWORD *)&v28.tx;
    }
  }
  else if (a7)
  {
    VNErrorForCVMLStatus((id)v25);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v24 == 4736;
}

@end

uint64_t _chooseOutgoingRowHeadForIncomingRowHead(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t **v6;
  unint64_t i;
  uint64_t **v8;
  uint64_t j;
  uint64_t v10;
  _QWORD v12[2];
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0xFFEFFFFFFFFFFFFFLL;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = ___chooseOutgoingRowHeadForIncomingRowHead_block_invoke;
  v14 = &unk_1E4A48FC8;
  v17 = a1;
  v18 = a2;
  v20 = a4;
  v15 = v21;
  v16 = &v22;
  v6 = (uint64_t **)(a2 + 8);
  v19 = a3;
  for (i = NSBitSetFindNext((uint64_t **)(a2 + 8), 0); i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext(v6, i + 1))
    v13((uint64_t)v12, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  v8 = (uint64_t **)(a2 + 24);
  for (j = NSBitSetFindNext(v8, 0); j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext(v8, j + 1))
    v13((uint64_t)v12, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  _Block_object_dispose(v21, 8);
  v10 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v10;
}

void sub_1A370D798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___chooseOutgoingRowHeadForIncomingRowHead_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  _QWORD *v11;

  if ((*(_BYTE *)(*(_QWORD *)a3 + 24) & 6) != 0)
  {
    v6 = a3 + 16;
    v7 = NSISLinExpCoefficientForVar(a3 + 16, *(_DWORD *)(**(_QWORD **)(a1 + 56) + 16));
    if (v7 < 0.0)
    {
      v8 = NSISLinExpConstant(v6) / v7;
      v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (v8 > v9 || (v8 == v9 ? (v10 = *(_BYTE *)(a1 + 72) == 0) : (v10 = 1), !v10 && (rand() & 1) == 0))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
        v11 = *(_QWORD **)(a1 + 64);
        *v11 = a2;
        v11[1] = a3;
      }
    }
  }
}

void NSISLinExpScaleByWithDroppedColProcessor(double *a1, uint64_t a2, double a3)
{
  double v6;
  _BOOL4 v7;
  BOOL v8;
  uint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  unsigned __int16 *v15;
  double v16;

  if (a3 == 0.0)
    NSISLinExpScaleByWithDroppedColProcessor_cold_1();
  if (a3 == 1.0)
    return;
  v6 = a1[1] * a3;
  if (v6 == 0.0)
    v7 = *(double *)&NSISEpsilon > 0.0;
  else
    v7 = fabs(v6) < *(double *)&NSISEpsilon;
  v8 = !v7;
  v10 = (unsigned __int16 *)(a1 + 2);
  v9 = *((_QWORD *)a1 + 2);
  if (!v8)
    v6 = 0.0;
  a1[1] = v6;
  if (v9 == *MEMORY[0x1E0C9AE50])
  {
    v10 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v11 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v11 = *(unsigned __int16 *)a1;
  }
  v12 = *((unsigned int *)a1 + 1);
  if (!(_DWORD)v12)
    return;
  v13 = 0;
  v14 = 0;
  v15 = &v10[4 * v11];
  do
  {
    while (1)
    {
      v16 = *(double *)&v10[4 * v14] * a3;
      if (v16 != 0.0)
        break;
      if (*(double *)&NSISEpsilon <= 0.0)
        goto LABEL_16;
LABEL_19:
      (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned int *)&v15[2 * v14]);
      vars_remove_idx((unsigned __int16 *)a1, v14);
      v12 = *((unsigned int *)a1 + 1);
      v13 = 1;
      if (v14 >= v12)
        goto LABEL_22;
    }
    if (fabs(v16) < *(double *)&NSISEpsilon)
      goto LABEL_19;
LABEL_16:
    *(double *)&v10[4 * v14++] = v16;
  }
  while (v14 < v12);
  if ((v13 & 1) == 0)
    return;
LABEL_22:
  expression_shrink_if_possible((char *)a1);
}

void NSISLinExpScaleBy(double *a1, double a2)
{
  NSISLinExpScaleByWithDroppedColProcessor(a1, (uint64_t)&__block_literal_global_38, a2);
}

void sub_1A370E110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL NSISLinExpEnumerateVarsAndCoefficientsUntil(unsigned __int16 *a1, uint64_t a2)
{
  double *v3;
  uint64_t v4;
  unint64_t v5;
  double *v6;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v3 = (double *)(a1 + 8);
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v3 = (double *)*((_QWORD *)a1 + 3);
    v4 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v4 = *a1;
  }
  v5 = *((unsigned int *)a1 + 1);
  if (!(_DWORD)v5)
    return 0;
  v6 = &v3[v4];
  if (((*(uint64_t (**)(uint64_t, _QWORD, double))(a2 + 16))(a2, *(unsigned int *)v6, *v3) & 1) != 0)
    return 1;
  v8 = 1;
  do
  {
    v9 = v8;
    if (v5 == v8)
      break;
    v10 = (*(uint64_t (**)(uint64_t, _QWORD, double))(a2 + 16))(a2, *((unsigned int *)v6 + v8), v3[v8]);
    v8 = v9 + 1;
  }
  while (!v10);
  return v9 < v5;
}

uint64_t ___row_enumerateColsWithCoefficientsUntil_block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 8 * (a2 >> 6));
  if ((*(_BYTE *)(v5 + 32 * (a2 & 0x3F) + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v5 + v7));
  }
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a3);
}

unint64_t NSISLinExpSetCoefficientForVar(unsigned __int16 *a1, unsigned int a2, double a3)
{
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t result;
  double *v14;

  v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISLinExpSetCoefficientForVar(NSISLinExp *, NSISFloat_t, NSISLinExpVar)"), CFSTR("NSISLinearExpression.m"), 703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(coefficient)"));
  }
  v8 = 0.0;
  if (a3 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0)
      goto LABEL_18;
  }
  else if (v6 < *(double *)&NSISEpsilon)
  {
    goto LABEL_18;
  }
  v8 = rint(a3);
  if (vabdd_f64(a3, v8) >= *(double *)&NSISEpsilon)
  {
    v9 = rint(a3 * 8.0);
    v10 = fabs(a3 * 8.0);
    if (vabdd_f64(v9, a3 * 8.0) >= *(double *)&NSISEpsilon * 8.0 || v10 == INFINITY)
      v8 = a3;
    else
      v8 = v9 * 0.125;
  }
LABEL_18:
  v14 = 0;
  result = vars_index_with_insert(a1, a2, 0, &v14);
  *v14 = v8;
  return result;
}

unint64_t _row_rawSetHead(uint64_t a1, _DWORD *a2, uint64_t a3, id **a4)
{
  uint64_t v8;
  uint64_t v9;
  id *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int *v17;
  unint64_t Index;
  int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;

  v8 = (uint64_t)(a4 + 1);
  v9 = NSBitSetCount((uint64_t)(a4 + 1));
  if (NSBitSetCount((uint64_t)(a4 + 3)) + v9)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _row_rawSetHead(NSISRow, NSISCol)"), CFSTR("NSISEngine_Row.h"), 133, CFSTR("Tried converting column variable %@ to a row head while it still appears as a body variable in some rows:%@"), **a4, _col_description(a3, (uint64_t **)a4));
  }
  v10 = *a4;
  NSBitSetReset(v8);
  NSBitSetReset((uint64_t)(a4 + 3));
  v11 = *((unsigned int *)*a4 + 5);
  v12 = a3 + 40 * ((v11 >> 30) & 1);
  NSBitSetAddIndex((unsigned int *)(v12 + 336), v11 & 0xFFFFFFFFBFFFFFFFLL);
  result = _table_removeStorageBlockIfPossible(*(_QWORD *)(v12 + 312), (uint64_t *)(v12 + 320), 0x19uLL, (uint64_t **)(v12 + 336));
  v14 = *(_QWORD *)a2;
  if (*(_QWORD *)a2)
  {
    v15 = a1 + 312;
    v16 = ((unint64_t)*(unsigned int *)(v14 + 24) >> 3) & 3;
    v17 = (unsigned int *)(a1 + 312 + 40 * v16 + 24);
    if (!NSBitSetCount((uint64_t)v17))
      _table_addStorageBlock((void **)(v15 + 40 * v16), (unint64_t *)(v15 + 40 * v16 + 8), (unint64_t *)(v15 + 40 * v16 + 16), 0x19uLL, 40, v17);
    Index = NSBitSetFirstIndex((uint64_t **)v17);
    v19 = Index;
    result = (unint64_t)NSBitSetRemoveIndex((uint64_t *)v17, Index);
    v20 = v19 | ((_DWORD)v16 << 30);
    v21 = 40 * ((v20 >> 30) & 1);
    v22 = (v20 & 0xBFFFFFFF) / 0x19uLL;
    v23 = (v20 & 0xBFFFFFFF) % 0x19;
    v24 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + v21) + 8 * v22) + 40 * v23);
    *v24 = v14;
    v24[1] = 0;
    v24[2] = 1;
    v24[3] = 0;
    v24[4] = 1;
    v25 = *(_QWORD *)(*(_QWORD *)(v15 + v21) + 8 * v22) + 40 * v23;
    LODWORD(v21) = *(_DWORD *)(v14 + 24) & 0xFFFFFFFE;
    *(_DWORD *)(v14 + 20) = v20;
    *(_DWORD *)(v14 + 24) = v21;
    *(_QWORD *)(v14 + 8) = v25;
  }
  *(_QWORD *)a2 = v10;
  *((_DWORD *)v10 + 6) |= 1u;
  *((_DWORD *)v10 + 5) = a2[2];
  v10[1] = a2;
  return result;
}

double NSBitSetReset(uint64_t a1)
{
  double result;

  if (*(_DWORD *)(a1 + 8) >= 2u)
    free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)&result = 1;
  *(_QWORD *)(a1 + 8) = 1;
  return result;
}

uint64_t _engineVar_addForVariableIfNeeded(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t Index;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  _QWORD *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  void *v30;
  void *v31;

  if (a2)
  {
    v4 = 0;
    while (a2[v4 + 3] != a1)
    {
      if (++v4 == 3)
        goto LABEL_7;
    }
    if (*((_DWORD *)a2 + v4 + 12) != -1)
      goto LABEL_9;
LABEL_7:
    if (!a2[2] || objc_msgSend(a2, "overflowEngineVarIndexForEngine:", a1) == -1)
      goto LABEL_13;
LABEL_9:
    v5 = 0;
    while (a2[v5 + 3] != a1)
    {
      if (++v5 == 3)
        goto LABEL_21;
    }
    v27 = *((_DWORD *)a2 + v5 + 12);
    if (v27 != -1)
      goto LABEL_24;
LABEL_21:
    if (a2[2])
      v27 = objc_msgSend(a2, "overflowEngineVarIndexForEngine:", a1);
    else
      v27 = -1;
LABEL_24:
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + (((unint64_t)v27 >> 3) & 0x1FFFFFF8)) + 32 * (v27 & 0x3F);
    if (*(_DWORD *)(v28 + 16) == -1)
    {
      v30 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 26, CFSTR("Unable to find index for variable:%@ in engine:%@"), a2, a1);
    }
    if (*(_QWORD **)v28 != a2)
    {
      v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISEngineVar _engineVar_forVariable(NSISEngine *, NSISVariable *)"), CFSTR("NSISEngine_EngineVar.h"), 27, CFSTR("Variable stored in table doesn't match passed in variable %@ != %@"), *(_QWORD *)v28, a2);
    }
  }
  else
  {
LABEL_13:
    if (_NSConstraintBasedLayoutDebug())
      NSLog(CFSTR("engine %p add variable %@"), a1, a2);
    if (!NSBitSetCount(a1 + 216))
      _table_addStorageBlock((void **)(a1 + 192), (unint64_t *)(a1 + 200), (unint64_t *)(a1 + 208), 0x40uLL, 32, (unsigned int *)(a1 + 216));
    Index = NSBitSetFirstIndex((uint64_t **)(a1 + 216));
    NSBitSetRemoveIndex((uint64_t *)(a1 + 216), Index);
    v7 = Index;
    v8 = (Index >> 3) & 0x1FFFFFF8;
    v9 = Index & 0x3F;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + v8) + 32 * v9;
    v11 = a2;
    v12 = 2 * (objc_msgSend(a2, "valueRestriction") & 3);
    v13 = objc_msgSend(a2, "orientationHint");
    *(_QWORD *)v10 = v11;
    *(_QWORD *)(v10 + 8) = 0;
    *(_DWORD *)(v10 + 16) = Index;
    *(_DWORD *)(v10 + 20) = -1;
    *(_DWORD *)(v10 + 24) = v12 & 0xFFFFFFE7 | (8 * (v13 & 3));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + v8);
    NSISVariableAddEngine((uint64_t)a2, a1, v7);
    v15 = a1 + 312;
    v16 = v14 + 32 * v9;
    v17 = ((unint64_t)*(unsigned int *)(v16 + 24) >> 3) & 3;
    v18 = (unsigned int *)(a1 + 312 + 40 * v17 + 24);
    if (!NSBitSetCount((uint64_t)v18))
      _table_addStorageBlock((void **)(v15 + 40 * v17), (unint64_t *)(v15 + 40 * v17 + 8), (unint64_t *)(v15 + 40 * v17 + 16), 0x19uLL, 40, v18);
    v19 = NSBitSetFirstIndex((uint64_t **)v18);
    v20 = v19;
    NSBitSetRemoveIndex((uint64_t *)v18, v19);
    v21 = v20 | ((_DWORD)v17 << 30);
    v22 = 40 * ((v21 >> 30) & 1);
    v23 = (v21 & 0xBFFFFFFF) / 0x19uLL;
    v24 = (v21 & 0xBFFFFFFF) % 0x19;
    v25 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + v22) + 8 * v23) + 40 * v24);
    *v25 = v16;
    v25[1] = 0;
    v25[2] = 1;
    v25[3] = 0;
    v25[4] = 1;
    v26 = *(_QWORD *)(*(_QWORD *)(v15 + v22) + 8 * v23) + 40 * v24;
    *(_DWORD *)(v16 + 24) &= ~1u;
    *(_DWORD *)(v16 + 20) = v21;
    *(_QWORD *)(v16 + 8) = v26;
  }
  return a1;
}

uint64_t NSBitSetCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t NSBitSetFindNext(uint64_t **a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  v2 = *((unsigned int *)a1 + 2);
  v3 = v2 << 6;
  if (v2 << 6 >= a2)
    v3 = a2;
  v4 = v3 >> 6;
  if (v2 >= 2)
    a1 = (uint64_t **)*a1;
  if (v2 <= v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  LOBYTE(v3) = v3 & 0x3F;
  v5 = v2 - v4;
  v6 = -64 * v4;
  v7 = (uint64_t *)&a1[v4];
  while (1)
  {
    v8 = *v7++;
    v3 = v8 & (-1 << v3);
    if (v3)
      break;
    v6 -= 64;
    if (!--v5)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return __clz(__rbit64(v3)) - v6;
}

uint64_t *NSBitSetRemoveIndex(uint64_t *result, unint64_t a2)
{
  unsigned int v2;
  uint64_t *v3;
  uint64_t *v4;

  v2 = *((_DWORD *)result + 2);
  if (v2 > (a2 >> 6))
  {
    v3 = result;
    if (v2 >= 2)
      v3 = (uint64_t *)*result;
    if ((v3[(a2 >> 6)] & (1 << a2)) != 0)
    {
      v4 = result;
      if (v2 >= 2)
        v4 = (uint64_t *)*result;
      v4[(a2 >> 6)] &= ~(1 << a2);
      --*((_DWORD *)result + 3);
    }
  }
  return result;
}

uint64_t NSBitSetFirstIndex(uint64_t **a1)
{
  return NSBitSetFindNext(a1, 0);
}

BOOL _NSConstraintBasedLayoutDebug()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutDebug"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugComputedValue, _NSFalseAppConfigPredicate);
}

unint64_t _table_removeStorageBlockIfPossible(unint64_t result, uint64_t *a2, NSUInteger a3, uint64_t **a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((unint64_t)*a2 >= 2)
  {
    v7 = result;
    result = NSBitSetCount((uint64_t)a4);
    if (result >= a3)
    {
      v8 = *a2;
      v9 = *a2 - 1;
      result = NSBitSetFindNextRange(a4, v9 * a3);
      if (result <= v9 * a3 && v8 * a3 <= result + v10)
      {
        free(*(void **)(v7 + 8 * v9));
        *(_QWORD *)(v7 + 8 * v9) = 0;
        *a2 = v9;
        return (unint64_t)NSBitSetRemoveIndexesInRange((uint64_t)a4, v9 * a3, a3);
      }
    }
  }
  return result;
}

uint64_t NSISVariableAddEngine(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t i;
  void *v7;

  v5 = result;
  for (i = 0; i != 3; ++i)
  {
    if (!*(_QWORD *)(result + 48 + 8 * i - 24))
    {
      *(_QWORD *)(result + 48 + 8 * i - 24) = a2;
      *(_DWORD *)(result + 48 + 4 * i) = a3;
      return result;
    }
  }
  v7 = *(void **)(result + 16);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 1282, 5);
    *(_QWORD *)(v5 + 16) = v7;
  }
  return objc_msgSend(v7, "setObject:forKey:", a3, a2);
}

BOOL _NSConstraintBasedLayoutAriadneTracepoints()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutAriadneTracepoints"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAriadneTracepointsComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t _noteValueOfVariableChanged(uint64_t result, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  void *v11;

  if (*(int *)(result + 144) <= 0)
  {
    v3 = result;
    v4 = (void *)*a3;
    v5 = *(void **)(result + 40);
    if (v5)
    {
      v6 = objc_msgSend(v5, "objectForKey:", *a3);
      if (v6)
      {
        v7 = (void *)v6;
        if (!*(_QWORD *)(v6 + 40)
          && !*(_QWORD *)(v6 + 48)
          && *(_QWORD *)(v3 + 48) != v6
          && _NSConstraintBasedLayoutTrackDirtyObservables())
        {
          -[NSISEngine _dirtyListPrependObservable:](v3, (uint64_t)v7);
        }
        objc_msgSend(v7, "receiveObservedValue:", *MEMORY[0x1E0C9AE50]);
      }
    }
    if (NSISObjectTableCount(*(_QWORD *)(v3 + 168)) >= 1)
    {
      v8 = (_QWORD *)NSISObjectTableFind(*(_QWORD *)(v3 + 168), (unint64_t)v4);
      if (v8)
      {
        v9 = v8;
        if (!v8[1] && !v8[2] && *(_QWORD **)(v3 + 176) != v8)
          -[NSISEngine _dirtyListPrependObservation:]((_QWORD *)v3, v8);
        objc_msgSend(v9, "valueWasDirtied");
      }
    }
    result = _NSConstraintBasedLayoutVariableChangeTransactions();
    if ((_DWORD)result)
    {
      if (!*(_BYTE *)(v3 + 163))
      {
        *(_BYTE *)(v3 + 163) = 1;
        if (!*(_DWORD *)(v3 + 140))
          result = objc_msgSend(*(id *)(v3 + 56), "solutionDidChangeInEngine:", v3);
      }
      ++*(_QWORD *)(v3 + 96);
    }
    else
    {
      v10 = *(_BYTE *)(v3 + 159);
      *(_BYTE *)(v3 + 159) = 1;
      ++*(_QWORD *)(v3 + 96);
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "nsis_valueOfVariable:didChangeInEngine:", v4, v3);
      v11 = *(void **)(v3 + 40);
      if (v11)
        objc_msgSend((id)objc_msgSend(v11, "objectForKey:", v4), "emitValueIfNeeded");
      result = NSISObjectTableCount(*(_QWORD *)(v3 + 168));
      if (result >= 1)
        result = objc_msgSend((id)NSISObjectTableFind(*(_QWORD *)(v3 + 168), (unint64_t)v4), "emitValueIfNeededWithEngine:", v3);
      *(_BYTE *)(v3 + 159) = v10;
    }
  }
  return result;
}

BOOL _NSGetBoolAppConfig(void *a1, int a2, unsigned __int8 *a3, uint64_t (*a4)(void))
{
  int v4;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  const __CFString *v12;
  unsigned __int8 v13;

  if (*a3)
  {
    LOBYTE(v4) = *a3 - 2;
    return v4 != 0;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  if (!objc_msgSend(v9, "objectForKey:", a1))
  {
    v4 = a4();
    if (v4)
      v13 = 3;
    else
      v13 = 2;
    atomic_store(v13, a3);
LABEL_15:
    if (v4 == a2
      || (objc_msgSend(a1, "isEqual:", CFSTR("NSLogUnusualAppConfig")) & 1) != 0
      || !_NSGetBoolAppConfig(CFSTR("NSLogUnusualAppConfig"), 0, &sNSLogUnusualAppConfigComputedValue, _NSFalseAppConfigPredicate))
    {
      return v4 != 0;
    }
    goto LABEL_8;
  }
  v4 = objc_msgSend(v9, "BOOLForKey:", a1);
  v10 = objc_msgSend((id)objc_msgSend(v9, "volatileDomainForName:", *MEMORY[0x1E0CB2878]), "objectForKey:", a1);
  if (v4)
    v11 = 3;
  else
    v11 = 2;
  atomic_store(v11, a3);
  if (!v10)
    goto LABEL_15;
LABEL_8:
  v12 = CFSTR("NO");
  if (v4)
    v12 = CFSTR("YES");
  NSLog(CFSTR("%@=%@"), a1, v12);
  return v4 != 0;
}

BOOL _NSConstraintBasedLayoutVariableChangeTransactions()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutVariableChangeTransactions"), 1, sNSConstraintBasedLayoutVariableChangeTransactionsComputedValue, _NSTrueAppConfigPredicate);
}

uint64_t NSISObjectTableCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t NSISObjectTableFind(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  int i;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    if (*(_DWORD *)(result + 8))
    {
      v2 = *(unsigned int *)(result + 16);
      if ((_DWORD)v2)
      {
        v3 = 73244475 * ((73244475 * (a2 ^ (a2 >> 16))) ^ ((73244475 * (a2 ^ (a2 >> 16))) >> 16));
        v4 = (v3 ^ (v3 >> 16)) % v2;
        for (i = *(_DWORD *)(result + 16); i; --i)
        {
          v6 = (uint64_t *)(*(_QWORD *)result + 16 * v4);
          v7 = v6[1];
          if (!v7)
            break;
          v8 = *v6;
          if (v7 != -1 && v8 == a2)
          {
            if (v4 == -1)
              return 0;
            else
              return v7;
          }
          if (v4 + 1 < v2)
            ++v4;
          else
            v4 = 0;
        }
      }
    }
    return 0;
  }
  return result;
}

const __CFString *sub_1A3710480()
{
  return CFSTR("NSSpace");
}

id sub_1A37104A0()
{
  uint64_t v0;
  id v1;

  os_unfair_lock_lock((os_unfair_lock_t)&symbolicConstantTableLock);
  v1 = (id)objc_msgSend((id)_NSFaultInObject(), "objectForKey:", v0);
  os_unfair_lock_unlock((os_unfair_lock_t)&symbolicConstantTableLock);
  return v1;
}

unint64_t _engineVar_rawRemove(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;

  if (_NSConstraintBasedLayoutDebug())
    NSLog(CFSTR("engine %p remove variable %@ at index %d"), a1, (id)*a2, *((unsigned int *)a2 + 4));
  if ((a2[3] & 1) != 0 || (v4 = a2[1], v5 = NSBitSetCount(v4 + 8), NSBitSetCount(v4 + 24) + v5))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _engineVar_rawRemove(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 181, CFSTR("Not possible to remove variable:%@ from engine %@."), _engineVar_description(a1, (uint64_t)a2), a1);
  }
  if ((a2[3] & 1) != 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *a2);
  }
  v6 = a2[1];
  NSBitSetReset(v6 + 8);
  NSBitSetReset(v6 + 24);
  v7 = *(unsigned int *)(*(_QWORD *)v6 + 20);
  v8 = a1 + 40 * ((v7 >> 30) & 1);
  NSBitSetAddIndex((unsigned int *)(v8 + 336), v7 & 0xFFFFFFFFBFFFFFFFLL);
  _table_removeStorageBlockIfPossible(*(_QWORD *)(v8 + 312), (uint64_t *)(v8 + 320), 0x19uLL, (uint64_t **)(v8 + 336));
  NSISVariableRemoveEngine(*a2, a1);

  *a2 = 0;
  a2[1] = 0;
  NSBitSetAddIndex((unsigned int *)(a1 + 216), *((unsigned int *)a2 + 4));
  return _table_removeStorageBlockIfPossible(*(_QWORD *)(a1 + 192), (uint64_t *)(a1 + 200), 0x40uLL, (uint64_t **)(a1 + 216));
}

void NSISVariableRemoveEngine(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  for (i = 24; i != 48; i += 8)
  {
    if (*(_QWORD *)(a1 + i) == a2)
    {
      *(_QWORD *)(a1 + i) = 0;
      return;
    }
  }
  v5 = objc_msgSend(*(id *)(a1 + 16), "count");
  objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", a2);
  v6 = objc_msgSend(*(id *)(a1 + 16), "count");
  if (!v6)
  {

    *(_QWORD *)(a1 + 16) = 0;
  }
  if (v6 >= v5)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISVariableRemoveEngine(NSISVariable *, NSISEngine *)"), CFSTR("NSISVariable.m"), 260, CFSTR("Unable to remove variable %@ from engine %p, it wasn't found."), a1, a2);
  }
}

BOOL _NSConstraintBasedLayoutDebugEngineConsistency()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutDebugEngineConsistency"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugEngineConsistencyComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t NSISLinExpVarCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

unsigned __int16 *_row_setHead(uint64_t a1, uint64_t a2, uint64_t a3, id **a4)
{
  unsigned __int16 *v6;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, unsigned int);
  void *v13;
  uint64_t v14;
  _QWORD *v15;

  _row_rawSetHead(a1, (_DWORD *)a2, a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___row_setHead_block_invoke;
  v9[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v9[4] = a1;
  v9[5] = a2;
  v6 = (unsigned __int16 *)(a2 + 16);
  if ((*(_BYTE *)(a2 + 80) & 1) != 0)
  {
    v8 = *(_QWORD *)v6;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = ___row_enumerateCols_block_invoke;
    v13 = &unk_1E4A48E98;
    v14 = a1;
    v15 = v9;
    return (unsigned __int16 *)-[NSISObjectiveLinearExpression enumerateVars:](v8, (uint64_t)&v10);
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = ___row_enumerateCols_block_invoke_2;
    v13 = &unk_1E4A48E98;
    v14 = a1;
    v15 = v9;
    return NSISLinExpEnumerateVars(v6, (uint64_t)&v10);
  }
}

unsigned __int16 *NSISLinExpEnumerateVars(unsigned __int16 *result, uint64_t a2)
{
  unsigned __int16 *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;

  v3 = result + 8;
  if (*((_QWORD *)result + 2) == *MEMORY[0x1E0C9AE50])
  {
    v3 = (unsigned __int16 *)*((_QWORD *)result + 3);
    v4 = *((_QWORD *)result + 4);
  }
  else
  {
    v4 = *result;
  }
  v5 = *((unsigned int *)result + 1);
  if ((_DWORD)v5)
  {
    v6 = &v3[4 * v4];
    do
    {
      v7 = *(_DWORD *)v6;
      v6 += 2;
      result = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, v7);
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t ___row_enumerateCols_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

void ___row_setHead_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

void sub_1A3711014(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 160) = 0;
  objc_exception_rethrow();
}

void sub_1A3711024(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void ___pivotToMakeColNewHeadOfRow_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *a3;
  if (((*a3)[3] & 1) == 0)
  {
    v5 = v3[1];
    v6 = NSBitSetCount(v5 + 8);
    if (!(NSBitSetCount(v5 + 24) + v6))
      _engineVar_rawRemove(a2, v3);
  }
}

uint64_t *___pivotToMakeColNewHeadOfRow_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t NSBitSetContainsIndex(uint64_t *a1, unint64_t a2)
{
  unsigned int v2;

  v2 = *((_DWORD *)a1 + 2);
  if (v2 <= (a2 >> 6))
    return 0;
  if (v2 >= 2)
    a1 = (uint64_t *)*a1;
  return ((unint64_t)a1[(a2 >> 6)] >> a2) & 1;
}

uint64_t NSBitSetFindNextRange(uint64_t **a1, unint64_t a2)
{
  uint64_t **v2;
  uint64_t result;
  char v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t v9;
  int v10;

  v2 = a1;
  result = NSBitSetFindNext(a1, a2);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = result + 1;
  v5 = (unint64_t)(result + 1) >> 6;
  v6 = *((_DWORD *)v2 + 2);
  if (v6 >= 2)
    v2 = (uint64_t **)*v2;
  if (v6 > v5)
  {
    v7 = (uint64_t)(int)v5 << 6;
    v8 = &v2[(int)v5];
    do
    {
      v9 = (uint64_t)*v8++;
      v10 = __clz(__rbit64((-1 << v4) & ~v9));
      if (((-1 << v4) & ~v9) == 0)
        v10 = -1;
      if ((v10 & 0x80000000) == 0)
        break;
      v4 = (v4 & 0xC0) + 64;
      v7 += 64;
      LODWORD(v5) = v5 + 1;
    }
    while (v6 > v5);
  }
  return result;
}

unint64_t ___row_remove_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned int v5;
  unint64_t v6;
  uint64_t *v7;
  unint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v5))
    v6 = v5 - 0x40000000;
  else
    v6 = v5;
  if (HIWORD(v5))
    v7 = a3 + 3;
  else
    v7 = a3 + 1;
  result = (unint64_t)NSBitSetRemoveIndex(v7, v6);
  v9 = *a3;
  if ((*(_BYTE *)(v9 + 24) & 1) == 0)
  {
    v10 = *(_QWORD *)(v9 + 8);
    v11 = NSBitSetCount(v10 + 8);
    result = NSBitSetCount(v10 + 24);
    if (!(result + v11))
      return _engineVar_rawRemove(a2, (uint64_t *)v9);
  }
  return result;
}

void sub_1A3711C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

BOOL _NSConstraintBasedLayoutTrackDirtyObservables()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutTrackDirtyObservables"), 1, (unsigned __int8 *)&sNSConstraintBasedLayoutTrackDirtyObservablesComputedValue, _NSTrueAppConfigPredicate);
}

uint64_t _NSFalseAppConfigPredicate()
{
  return 0;
}

uint64_t _NSTrueAppConfigPredicate()
{
  return 1;
}

double _col_removeFromAllRows(uint64_t a1, uint64_t a2)
{
  uint64_t **v4;
  uint64_t Next;
  unint64_t i;
  uint64_t **v7;
  uint64_t v8;
  uint64_t j;
  _QWORD v11[2];
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = ___col_removeFromAllRows_block_invoke;
  v13 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v14 = a1;
  v15 = a2;
  v4 = (uint64_t **)(a2 + 8);
  Next = NSBitSetFindNext((uint64_t **)(a2 + 8), 0);
  if (Next != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext(v4, i + 1))
      v12((uint64_t)v11, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  }
  v7 = (uint64_t **)(a2 + 24);
  v8 = NSBitSetFindNext(v7, 0);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (j = v8; j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext(v7, j + 1))
      v12((uint64_t)v11, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  NSBitSetReset((uint64_t)v4);
  return NSBitSetReset((uint64_t)v7);
}

void ___col_removeFromAllRows_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (uint64_t *)(a3 + 16);
  if ((*(_BYTE *)(a3 + 80) & 1) != 0)
    -[NSISObjectiveLinearExpression removeVar:](*v4, *(_DWORD *)(*(_QWORD *)v3 + 16));
  else
    NSISLinExpRemoveVar((unsigned __int16 *)v4, *(_DWORD *)(*(_QWORD *)v3 + 16));
}

double _substituteOutAllOccurencesOfBodyVar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t **v10;
  uint64_t v11;
  uint64_t **v12;
  double result;
  double v14;
  BOOL v15;
  uint64_t Next;
  unint64_t i;
  uint64_t v18;
  uint64_t j;
  _QWORD v20[2];
  void (*v21)(uint64_t, uint64_t, id **);
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;

  v10 = (uint64_t **)(a3 + 8);
  v11 = NSBitSetCount(a3 + 8);
  v12 = (uint64_t **)(a3 + 24);
  if (NSBitSetCount(a3 + 24) + v11)
  {
    v14 = NSISLinExpConstant(a5 + 16);
    if (v14 == 0.0)
      v15 = *(double *)&NSISEpsilon > 0.0;
    else
      v15 = fabs(v14) < *(double *)&NSISEpsilon;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v21 = ___substituteOutAllOccurencesOfBodyVar_block_invoke;
    v22 = &unk_1E4A48F80;
    v25 = a3;
    v26 = a4;
    v27 = a5;
    v28 = !v15;
    v23 = a1;
    v24 = a2;
    Next = NSBitSetFindNext(v10, 0);
    if (Next != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext(v10, i + 1))
        v21((uint64_t)v20, a2, (id **)(*(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17)));
    }
    v18 = NSBitSetFindNext(v12, 0);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (j = v18; j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext(v12, j + 1))
        v21((uint64_t)v20, a2, (id **)(*(_QWORD *)(*(_QWORD *)(a2 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17)));
    }
    NSBitSetReset((uint64_t)v10);
    return NSBitSetReset((uint64_t)v12);
  }
  return result;
}

void ___substituteOutAllOccurencesOfBodyVar_block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  int v6;
  int v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *(*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  uint64_t v21;
  id **v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  void *v26;
  uint64_t v27;
  id **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, unsigned int);
  void *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, unsigned int);
  void *v38;
  uint64_t v39;
  uint64_t *v40;

  v6 = *((_DWORD *)a3 + 20);
  LOBYTE(v7) = v6;
  if ((v6 & 1) == 0)
  {
    NSISLinExpConstant((uint64_t)(a3 + 2));
    v7 = *((_DWORD *)a3 + 20);
  }
  v22 = a3;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___substituteOutAllOccurencesOfBodyVar_block_invoke_2;
  v26 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v27 = a2;
  v28 = a3;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = ___substituteOutAllOccurencesOfBodyVar_block_invoke_3;
  v20 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v21 = a2;
  v8 = (unsigned __int16 *)(*(_QWORD *)(a1 + 64) + 16);
  v9 = *(_QWORD *)(a1 + 48);
  if ((v7 & 1) != 0)
  {
    v11 = (uint64_t)a3[2];
    v12 = *(unsigned int *)(*(_QWORD *)v9 + 16);
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = ___row_rawReplaceColWithRowBody_block_invoke;
    v38 = &unk_1E4A48E98;
    v39 = a2;
    v40 = &v23;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = ___row_rawReplaceColWithRowBody_block_invoke_2;
    v32 = &unk_1E4A48E98;
    v33 = a2;
    v34 = &v17;
    -[NSISObjectiveLinearExpression replaceVar:withExpression:processVarNewToReceiver:processVarDroppedFromReceiver:](v11, v12, v8, (uint64_t)&v35, (uint64_t)&v29);
  }
  else
  {
    v10 = *(_DWORD *)(*(_QWORD *)v9 + 16);
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = ___row_rawReplaceColWithRowBody_block_invoke_3;
    v38 = &unk_1E4A48E98;
    v39 = a2;
    v40 = &v23;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = ___row_rawReplaceColWithRowBody_block_invoke_4;
    v32 = &unk_1E4A48E98;
    v33 = a2;
    v34 = &v17;
    NSISLinExpReplaceVarWithExpression((unsigned __int16 *)a3 + 8, v10, (uint64_t)v8, (uint64_t)&v35, (uint64_t)&v29);
  }
  if (*(_BYTE *)(a1 + 72) && ((_BYTE)(*a3)[3] & 6) != 0)
  {
    v13 = NSISLinExpConstant((uint64_t)(a3 + 2));
    v14 = (*((_DWORD *)*a3 + 6) >> 1) & 3;
    if (v14 == 2)
    {
      if (v13 == 0.0)
      {
        if (*(double *)&NSISEpsilon > 0.0)
          goto LABEL_12;
      }
      else if (fabs(v13) < *(double *)&NSISEpsilon)
      {
        goto LABEL_12;
      }
LABEL_11:
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v16 = **a3;
      objc_msgSend(v15, "addObject:", v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_12;
    }
    if (v14 == 1 && v13 < 0.0)
      goto LABEL_11;
  }
LABEL_12:
  if ((v6 & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 72))
      _noteValueOfVariableChanged(*(_QWORD *)(a1 + 32), a2, *a3);
  }
}

double NSISLinExpConstant(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

void NSISLinExpReplaceVarWithExpression(unsigned __int16 *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v10;

  v10 = NSISLinExpCoefficientForVar((uint64_t)a1, a2);
  NSISLinExpRemoveVar(a1, a2);
  NSISLinExpIncrementConstant((uint64_t)a1, v10 * *(double *)(a3 + 8));
  expression_merge(a1, (unsigned __int16 *)a3, a4, a5, v10);
}

uint64_t NSISLinExpIncrementConstant(uint64_t result, double a2)
{
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  BOOL v13;

  v3 = result;
  v4 = fabs(a2);
  if (v4 >= INFINITY && v4 <= INFINITY)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISFloat_t NSISLinExpIncrementConstant(NSISLinExp *, NSISFloat_t)"), CFSTR("NSISLinearExpression.m"), 814, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(c)"));
  }
  v6 = *(double *)(v3 + 8);
  if (COERCE_UNSIGNED_INT64(-v6) >> 63 == *(_QWORD *)&a2 >> 63)
  {
    v7 = 0.0;
    if (vabdd_f64(-v6, a2) <= *(double *)&NSISEpsilon)
      goto LABEL_10;
    v8 = COERCE__INT64(-v6) - *(_QWORD *)&a2;
    if (v8 < 0)
      v8 = *(_QWORD *)&a2 - COERCE__INT64(-v6);
    if (v8 <= NSISMaxUlps)
      goto LABEL_10;
  }
  v7 = v6 + a2;
  if (v6 + a2 == 0.0)
  {
LABEL_10:
    v9 = 0.0;
    if (*(double *)&NSISEpsilon > 0.0)
      goto LABEL_22;
  }
  else
  {
    v9 = 0.0;
    if (fabs(v7) < *(double *)&NSISEpsilon)
      goto LABEL_22;
  }
  v9 = rint(v7);
  if (vabdd_f64(v7, v9) >= *(double *)&NSISEpsilon)
  {
    v10 = rint(v7 * 8.0);
    v11 = fabs(v7 * 8.0);
    v13 = vabdd_f64(v10, v7 * 8.0) >= *(double *)&NSISEpsilon * 8.0 || v11 == INFINITY;
    v9 = v10 * 0.125;
    if (v13)
      v9 = v7;
  }
LABEL_22:
  *(double *)(v3 + 8) = v9;
  return result;
}

void NSISLinExpRemoveVar(unsigned __int16 *a1, unsigned int a2)
{
  unint64_t v3;

  v3 = vars_index(a1, a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    vars_remove_idx(a1, v3);
    expression_shrink_if_possible((char *)a1);
  }
}

double NSISLinExpCoefficientForVar(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  double result;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v11;

  v3 = vars_index((unsigned __int16 *)a1, a2);
  result = 0.0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a1 + 16;
    if (*(_QWORD *)(a1 + 16) == *MEMORY[0x1E0C9AE50])
      v5 = *(_QWORD *)(a1 + 24);
    v6 = *(double *)(v5 + 8 * v3);
    if (v6 == 0.0)
    {
      v7 = *(double *)&NSISEpsilon;
      if (*(double *)&NSISEpsilon > 0.0)
        return result;
    }
    else
    {
      v7 = *(double *)&NSISEpsilon;
      if (fabs(v6) < *(double *)&NSISEpsilon)
        return result;
    }
    result = rint(v6);
    if (vabdd_f64(v6, result) >= v7)
    {
      v8 = rint(v6 * 8.0);
      v9 = fabs(v6 * 8.0);
      v11 = vabdd_f64(v8, v6 * 8.0) >= v7 * 8.0 || v9 == INFINITY;
      result = v8 * 0.125;
      if (v11)
        return *(double *)(v5 + 8 * v3);
    }
  }
  return result;
}

uint64_t vars_index(unsigned __int16 *a1, unsigned int a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned __int16 *v6;
  uint64_t result;
  unsigned int v8;

  v2 = a1 + 8;
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v2 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v3 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v3 = *a1;
  }
  v4 = *((unsigned int *)a1 + 1);
  if (!(_DWORD)v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  v6 = &v2[4 * v3];
  while (1)
  {
    result = v5 + ((v4 - v5) >> 1);
    v8 = *(_DWORD *)&v6[2 * result];
    if (v8 == a2)
      break;
    if (v8 >= a2)
      v4 = v5 + ((v4 - v5) >> 1);
    else
      v5 = result + 1;
    if (v5 >= v4)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

unsigned __int16 *NSISLinExpEnumerateVarsAndCoefficients(unsigned __int16 *result, uint64_t a2)
{
  double *v3;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  double v7;
  double v8;

  v3 = (double *)(result + 8);
  if (*((_QWORD *)result + 2) == *MEMORY[0x1E0C9AE50])
  {
    v3 = (double *)*((_QWORD *)result + 3);
    v4 = *((_QWORD *)result + 4);
  }
  else
  {
    v4 = *result;
  }
  v5 = *((unsigned int *)result + 1);
  if ((_DWORD)v5)
  {
    v6 = &v3[v4];
    do
    {
      v7 = *v3++;
      v8 = v7;
      LODWORD(v7) = *(_DWORD *)v6;
      v6 = (double *)((char *)v6 + 4);
      result = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, _QWORD, double))(a2 + 16))(a2, LODWORD(v7), v8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void NSISLinExpAddVar(unsigned __int16 *a1, unsigned int a2, double a3)
{
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  _BOOL4 v12;
  double *v13;
  char v14;

  v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISLinExpAddVar(NSISLinExp *, NSISLinExpVar, NSISFloat_t)"), CFSTR("NSISLinearExpression.m"), 785, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(coeff)"));
  }
  if (a3 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0)
      goto LABEL_20;
  }
  else if (v6 < *(double *)&NSISEpsilon)
  {
    goto LABEL_20;
  }
  v14 = 0;
  v13 = 0;
  v8 = vars_index_with_insert(a1, a2, &v14, &v13);
  v9 = *v13;
  if (COERCE_UNSIGNED_INT64(-a3) >> 63 == *(_QWORD *)v13 >> 63)
  {
    v10 = 0.0;
    if (vabdd_f64(-a3, v9) <= *(double *)&NSISEpsilon)
      goto LABEL_14;
    v11 = COERCE__INT64(-a3) - *(_QWORD *)v13;
    if (v11 < 0)
      v11 = *(_QWORD *)v13 - COERCE__INT64(-a3);
    if (v11 <= NSISMaxUlps)
      goto LABEL_14;
  }
  v10 = v9 + a3;
  if (v9 + a3 == 0.0)
LABEL_14:
    v12 = *(double *)&NSISEpsilon > 0.0;
  else
    v12 = fabs(v10) < *(double *)&NSISEpsilon;
  if (v12)
    v10 = 0.0;
  *v13 = v10;
  if (v10 == 0.0)
    vars_remove_idx(a1, v8);
LABEL_20:
  expression_shrink_if_possible((char *)a1);
}

void expression_shrink_if_possible(char *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  char *v6;
  BOOL v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;

  v1 = a1 + 16;
  v2 = *((_QWORD *)a1 + 2);
  if (v2 == *MEMORY[0x1E0C9AE50] && *((_DWORD *)a1 + 1) <= *(unsigned __int16 *)a1)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = (char *)pthread_getspecific(kPooledLinearExpressionKeys[v4]);
      if (v6)
        v7 = v6 + 16 == a1;
      else
        v7 = 0;
      v8 = !v7;
      if ((v5 & 1) == 0)
        break;
      v5 = 0;
      v4 = 1;
    }
    while ((v8 & 1) != 0);
    if (v8)
    {
      if (*(_QWORD *)v1 != v2)
        NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "vars_convert_to_inline", 224);
      v9 = *((unsigned int *)a1 + 1);
      v10 = *(unsigned __int16 *)a1;
      if (v9 > v10)
        NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "vars_convert_to_inline", 229);
      if (*(_QWORD *)v1 == v2)
      {
        v12 = (char *)*((_QWORD *)a1 + 3);
        v11 = *((_QWORD *)a1 + 4);
        v13 = v12;
      }
      else
      {
        v11 = *(unsigned __int16 *)a1;
        v12 = (char *)*((_QWORD *)a1 + 3);
        v13 = v1;
      }
      v14 = &v13[8 * v11];
      bzero(v1, 12 * v10);
      if (*(_QWORD *)v1 == v2)
      {
        v16 = (char *)*((_QWORD *)a1 + 3);
        v15 = *((_QWORD *)a1 + 4);
      }
      else
      {
        v15 = *(unsigned __int16 *)a1;
        v16 = v1;
      }
      memmove(&v16[8 * v15], v14, 4 * v9);
      memmove(v16, v13, 8 * v9);
      if (*(_QWORD *)v1 == v2)
        NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "vars_convert_to_inline", 241);
      free(v12);
    }
  }
}

void *vars_remove_idx(unsigned __int16 *a1, unint64_t a2)
{
  unint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  unint64_t v9;
  void *result;

  v4 = *((unsigned int *)a1 + 1);
  if (v4 <= a2)
    NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "vars_remove_idx", 489);
  v5 = a1 + 8;
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v5 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v6 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v6 = *a1;
  }
  v7 = &v5[4 * v6];
  v8 = v4 + ~a2;
  memmove(&v7[2 * a2], &v7[2 * a2 + 2], 4 * v8);
  v9 = v4 - 1;
  *(_DWORD *)&v7[2 * v9] = 0;
  result = memmove(&v5[4 * a2], &v5[4 * a2 + 4], 8 * v8);
  *(_QWORD *)&v5[4 * v9] = 0;
  *((_DWORD *)a1 + 1) = v9;
  return result;
}

unint64_t vars_index_with_insert(unsigned __int16 *a1, unsigned int a2, char *a3, _QWORD *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int16 *v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  unsigned int *v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  char v25;

  v8 = a1 + 8;
  v9 = *MEMORY[0x1E0C9AE50];
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v11 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v10 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v10 = *a1;
    v11 = a1 + 8;
  }
  v12 = *((unsigned int *)a1 + 1);
  if ((_DWORD)v12)
  {
    v13 = 0;
    v14 = &v11[4 * v10];
    v15 = *((unsigned int *)a1 + 1);
    while (1)
    {
      v16 = v13 + ((v15 - v13) >> 1);
      v17 = *(_DWORD *)&v14[2 * v16];
      if (v17 == a2)
        break;
      if (v17 >= a2)
        v15 = v13 + ((v15 - v13) >> 1);
      else
        v13 = v16 + 1;
      if (v13 >= v15)
        goto LABEL_14;
    }
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_14:
      if (v13 > v12)
        NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "vars_index_with_insert", 295);
      goto LABEL_16;
    }
    v25 = 0;
    v13 += (v15 - v13) >> 1;
    if (a3)
      goto LABEL_22;
  }
  else
  {
    v13 = 0;
LABEL_16:
    v18 = v12 + 1;
    expression_ensure_capacity(a1, v12 + 1);
    if (*((_QWORD *)a1 + 2) == v9)
    {
      v20 = (_QWORD *)*((_QWORD *)a1 + 3);
      v19 = *((_QWORD *)a1 + 4);
    }
    else
    {
      v19 = *a1;
      v20 = v8;
    }
    v21 = (unsigned int *)&v20[v19] + v13;
    v22 = v12 - v13;
    memmove(v21 + 1, v21, 4 * v22);
    *v21 = a2;
    v23 = v8;
    if (*v8 == v9)
      v23 = (_QWORD *)*((_QWORD *)a1 + 3);
    v24 = &v23[v13];
    memmove(v24 + 1, v24, 8 * v22);
    *v24 = 0;
    *((_DWORD *)a1 + 1) = v18;
    v25 = 1;
    if (a3)
LABEL_22:
      *a3 = v25;
  }
  if (a4)
  {
    if (*v8 == v9)
      v8 = (_QWORD *)*((_QWORD *)a1 + 3);
    *a4 = &v8[v13];
  }
  return v13;
}

void expression_ensure_capacity(unsigned __int16 *a1, unint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  char *v11;
  char v12;
  char *v13;

  if (*a1 < a2)
  {
    v3 = (char *)(a1 + 8);
    v4 = *((_QWORD *)a1 + 2);
    v5 = *MEMORY[0x1E0C9AE50];
    if (v4 == *MEMORY[0x1E0C9AE50])
    {
      v10 = *((_QWORD *)a1 + 4);
      if (v10 < a2)
      {
        v11 = (char *)*((_QWORD *)a1 + 3);
        v12 = flsl(a2);
        if (1 << v12 < v10)
          NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "slab_duplicate", 52);
        v13 = (char *)malloc_type_calloc(1uLL, 12 << v12, 0x1FF00ED2uLL);
        memmove(&v13[8 << v12], &v11[8 * v10], 4 * v10);
        memmove(v13, v11, 8 * v10);
        *((_QWORD *)a1 + 3) = v13;
        *((_QWORD *)a1 + 4) = 1 << v12;
        free(v11);
        if (*((_QWORD *)a1 + 2) != v4)
          NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "expression_ensure_capacity", 196);
      }
    }
    else
    {
      v6 = flsl(a2);
      v7 = *((_DWORD *)a1 + 1);
      v8 = *a1;
      if (1 << v6 < v8)
        NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), "slab_duplicate", 52);
      v9 = (char *)malloc_type_calloc(1uLL, 12 << v6, 0x1FF00ED2uLL);
      memmove(&v9[8 << v6], &v3[8 * v8], 4 * v8);
      memmove(v9, v3, 8 * v8);
      *((_QWORD *)a1 + 2) = v5;
      *((_QWORD *)a1 + 3) = v9;
      *((_DWORD *)a1 + 1) = v7;
      *((_QWORD *)a1 + 4) = 1 << v6;
    }
  }
}

uint64_t AddVarToSortedPriorityVectorList(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t result;

  result = -[NSISObjectiveLinearExpression valueRestrictionForVar:](a1, a2);
  if ((_DWORD)result == 1)
  {
    result = NSISSparseVectorStrongestTermIsNegative(a3);
    if ((_DWORD)result)
      return NSISSparseVectorMapAddToMinHeap(a1 + 16, a3);
  }
  return result;
}

_QWORD *_findWithHashFunction(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  _QWORD *result;
  void *v11;

  if (!*(_DWORD *)(a1 + 24))
    return 0;
  v4 = *(_DWORD *)(a1 + 32);
  v5 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  v6 = (v5 ^ HIWORD(v5)) % v4;
  v7 = 0x1E0CB3000uLL;
  v8 = v4;
  while (1)
  {
    v9 = *(_QWORD *)(a1 + 16);
    result = (_QWORD *)(v9 + 24 * v6);
    if (*result != -1)
    {
      if (!*result)
        return 0;
      if (*(_DWORD *)(v9 + 24 * v6 + 12) == a2)
        break;
    }
    if (v6 + 1 < v4)
      ++v6;
    else
      v6 = 0;
    if (!--v8)
    {
      v11 = (void *)objc_msgSend(*(id *)(v7 + 1160), "currentHandler");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISSparseVector *_findWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 272, CFSTR("Corrupt hash table"));
      v7 = 0x1E0CB3000;
    }
  }
  return result;
}

uint64_t NSISSparseVectorMinHeapDelete(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  _BOOL8 v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  _BOOL8 v37;
  uint64_t v38;

  v2 = *(unsigned int *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = -1;
  if ((_DWORD)v2 != -1)
  {
    v3 = result;
    v4 = *(_DWORD *)(result + 8);
    v5 = v4 - 1;
    if (v4 == 1)
    {
      *(_DWORD *)(result + 8) = 0;
      return result;
    }
    v6 = *(uint64_t **)result;
    v7 = *(_QWORD *)(*(_QWORD *)result + 8 * (int)v5);
    *(_DWORD *)(result + 8) = v5;
    if (v7 != a2)
    {
      if (v5 == 1)
      {
        *v6 = v7;
        *(_DWORD *)(v7 + 16) = 0;
        return result;
      }
      while (1)
      {
        v8 = (2 * (_DWORD)v2) | 1u;
        v9 = (2 * v2 + 2);
        v10 = v8 >= v5 || v9 >= v5;
        if (v10)
          break;
        v18 = v6[v8];
        v19 = v6[v9];
        v20 = NSISSparseVectorCompare((uint64_t *)v18, (uint64_t *)v19);
        if (!v20)
        {
          v21 = *(_DWORD *)(v18 + 12);
          v22 = *(_DWORD *)(v19 + 12);
          v10 = v21 >= v22;
          v23 = v21 > v22;
          v24 = !v10;
          v20 = v23 - v24;
        }
        v25 = *(_DWORD *)(v3 + 8);
        if (v20 == -1 && v25 > v8)
        {
          v27 = *(_QWORD *)(*(_QWORD *)v3 + 8 * v8);
          v28 = NSISSparseVectorCompare((uint64_t *)v27, (uint64_t *)v7);
          if (!v28)
          {
            v29 = *(_DWORD *)(v27 + 12);
            v30 = *(_DWORD *)(v7 + 12);
            v10 = v29 >= v30;
            v31 = v29 > v30;
            v32 = !v10;
            v28 = v31 - v32;
          }
          if (v28 == -1)
            goto LABEL_19;
          v25 = *(_DWORD *)(v3 + 8);
        }
        if (v25 <= v9)
          goto LABEL_46;
        v33 = *(_QWORD *)(*(_QWORD *)v3 + 8 * v9);
        v34 = NSISSparseVectorCompare((uint64_t *)v33, (uint64_t *)v7);
        if (!v34)
        {
          v35 = *(_DWORD *)(v33 + 12);
          v36 = *(_DWORD *)(v7 + 12);
          v10 = v35 >= v36;
          v37 = v35 > v36;
          v38 = !v10;
          v34 = v37 - v38;
        }
        if (v34 != -1)
          goto LABEL_46;
        v17 = v2;
        *(_QWORD *)(*(_QWORD *)v3 + 8 * v2) = *(_QWORD *)(*(_QWORD *)v3 + 8 * v9);
        v8 = (2 * v2 + 2);
LABEL_45:
        v6 = *(uint64_t **)v3;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v3 + 8 * v17) + 16) = v2;
        v5 = *(_DWORD *)(v3 + 8);
        v2 = v8;
      }
      if (v8 >= v5)
        goto LABEL_46;
      v11 = v6[v8];
      v12 = NSISSparseVectorCompare((uint64_t *)v11, (uint64_t *)v7);
      if (!v12)
      {
        v13 = *(_DWORD *)(v11 + 12);
        v14 = *(_DWORD *)(v7 + 12);
        v10 = v13 >= v14;
        v15 = v13 > v14;
        v16 = !v10;
        v12 = v15 - v16;
      }
      if (v12 != -1)
      {
LABEL_46:
        result = _siftUp((uint64_t *)v3, v7, v2);
        *(_QWORD *)(*(_QWORD *)v3 + 8 * result) = v7;
        *(_DWORD *)(v7 + 16) = result;
        return result;
      }
LABEL_19:
      v17 = v2;
      *(_QWORD *)(*(_QWORD *)v3 + 8 * v2) = *(_QWORD *)(*(_QWORD *)v3 + 8 * v8);
      goto LABEL_45;
    }
  }
  return result;
}

uint64_t NSISSparseVectorAddVectorTimesScalar(uint64_t result, unsigned __int16 *a2, double a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  double *v7;

  v3 = a2[4];
  if (a2[4])
  {
    v5 = result;
    v6 = 0;
    v7 = (double *)(*(_QWORD *)a2 + 8);
    do
    {
      result = NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(v5, v6, *(v7 - 1), *v7, a3);
      v6 = result;
      v7 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  double v10;
  uint64_t v11;
  double *v12;
  double v13;
  uint64_t v14;
  double *v15;
  _BOOL4 v16;
  double v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v33;
  double v34;
  uint64_t v37;
  void *v38;
  double *v39;
  void *v41;

  if (a3 <= 0.0)
  {
    v41 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFIndex NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(NSISSparseVector *, NSISPlaceValue_t, NSISFloat_t, NSISFloat_t, CFIndex)"), CFSTR("NSISSparseVector.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeValue > 0"));
  }
  if (a4 == 0.0)
  {
    v10 = *(double *)&NSISEpsilon;
    if (*(double *)&NSISEpsilon > 0.0)
      return a2;
  }
  else
  {
    v10 = *(double *)&NSISEpsilon;
    if (fabs(a4) < *(double *)&NSISEpsilon)
      return a2;
  }
  v11 = *(unsigned __int16 *)(a1 + 8);
  v12 = *(double **)a1;
  if (v11 <= a2)
  {
    v16 = 0;
LABEL_14:
    v13 = 0.0;
    goto LABEL_16;
  }
  v13 = v12[2 * a2];
  if (v13 > a3)
  {
    v14 = a2 + 1;
    v15 = &v12[2 * a2 + 2];
    while (1)
    {
      a2 = v14;
      v16 = v14 < v11;
      if (v14 >= v11)
        goto LABEL_14;
      v17 = *v15;
      v15 += 2;
      v13 = v17;
      ++v14;
      if (v17 <= a3)
        goto LABEL_16;
    }
  }
  v16 = 1;
LABEL_16:
  if (v13 != a3)
  {
    v26 = a4 * a5;
    if (a4 * a5 == 0.0)
    {
      v27 = 0.0;
      if (v10 > 0.0)
        goto LABEL_54;
    }
    else
    {
      v27 = 0.0;
      if (fabs(v26) < v10)
        goto LABEL_54;
    }
    v27 = rint(v26);
    if (vabdd_f64(v26, v27) >= v10)
    {
      v33 = rint(v26 * 8.0);
      v34 = fabs(v26 * 8.0);
      if (vabdd_f64(v33, v26 * 8.0) >= v10 * 8.0 || v34 == INFINITY)
        v27 = v26;
      else
        v27 = v33 * 0.125;
    }
LABEL_54:
    v37 = *(unsigned __int16 *)(a1 + 10);
    if (*(_WORD *)(a1 + 10))
    {
      if (v11 < v37)
        goto LABEL_61;
      v12 = (double *)malloc_type_realloc(*(void **)a1, 32 * v37, 0x1000040451B5BE8uLL);
      if (!v12)
      {
        v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFIndex NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(NSISSparseVector *, NSISPlaceValue_t, NSISFloat_t, NSISFloat_t, CFIndex)"), CFSTR("NSISSparseVector.m"), 111, CFSTR("Memory exhaustion."));
      }
      *(_WORD *)(a1 + 10) *= 2;
    }
    else
    {
      *(_WORD *)(a1 + 10) = 8;
      v12 = (double *)malloc_type_malloc(0x80uLL, 0x1000040451B5BE8uLL);
    }
    *(_QWORD *)a1 = v12;
LABEL_61:
    if (v12)
    {
      if (v16)
        memmove(&v12[2 * a2 + 2], &v12[2 * a2], 16 * (v11 - a2));
      v39 = &v12[2 * a2];
      *v39 = a3;
      v39[1] = v27;
      ++*(_WORD *)(a1 + 8);
    }
    return ++a2;
  }
  v18 = &v12[2 * a2];
  v20 = v18[1];
  v19 = v18 + 1;
  v21 = v20;
  v22 = -(a5 * a4);
  v23 = v20;
  if (*(_QWORD *)&v22 >> 63 == *(_QWORD *)&v20 >> 63)
  {
    v24 = 0.0;
    if (vabdd_f64(-(a5 * a4), v21) <= v10)
      goto LABEL_23;
    v25 = *(_QWORD *)&v22 - *(_QWORD *)&v23;
    if (v25 < 0)
      v25 = -v25;
    if (v25 <= NSISMaxUlps)
      goto LABEL_23;
  }
  v24 = v21 + a5 * a4;
  if (v24 == 0.0)
  {
LABEL_23:
    if (v10 > 0.0)
      goto LABEL_40;
    goto LABEL_29;
  }
  if (fabs(v24) >= v10)
  {
LABEL_29:
    v28 = rint(v24);
    if (vabdd_f64(v24, v28) >= v10)
    {
      v29 = rint(v24 * 8.0);
      v30 = fabs(v24 * 8.0);
      if (vabdd_f64(v29, v24 * 8.0) >= v10 * 8.0 || v30 == INFINITY)
        v28 = v24;
      else
        v28 = v29 * 0.125;
    }
    if (v28 == 0.0)
      goto LABEL_40;
    *v19 = v28;
    return ++a2;
  }
LABEL_40:
  if (v11 >= 2)
  {
    memmove(&v12[2 * a2], &v12[2 * a2 + 2], 16 * (~a2 + v11));
    LOWORD(v11) = *(_WORD *)(a1 + 8);
  }
  *(_WORD *)(a1 + 8) = v11 - 1;
  return a2;
}

void expression_merge(unsigned __int16 *a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, double a5)
{
  double *v9;
  uint64_t v10;
  double *v11;
  unint64_t v12;
  double v13;
  double v14;
  unsigned __int16 *v15;
  unint64_t v16;
  unint64_t v17;
  _BYTE *v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  unsigned int v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  _BOOL4 v31;
  double v32;
  _BOOL4 v33;
  unint64_t v34;
  unint64_t v35;
  _DWORD *v36;
  char *v37;
  unsigned __int16 *v38;
  unsigned __int16 *v39;
  unsigned __int16 *v40;
  unsigned __int16 *v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  _DWORD *v45;
  double *v46;
  double v47;
  _BOOL4 v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int16 *v53;
  unsigned __int16 *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *__src;
  char v59;
  _BYTE v60[1024];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = (double *)(a2 + 8);
  if (*((_QWORD *)a2 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v9 = (double *)*((_QWORD *)a2 + 3);
    v10 = *((_QWORD *)a2 + 4);
  }
  else
  {
    v10 = *a2;
  }
  v11 = &v9[v10];
  v12 = *((unsigned int *)a2 + 1);
  if (v12 <= 3)
  {
    if ((_DWORD)v12)
    {
      do
      {
        v13 = *v9++;
        v14 = v13;
        LODWORD(v13) = *(_DWORD *)v11;
        v11 = (double *)((char *)v11 + 4);
        expression_add_variable(a1, LODWORD(v13), a3, a4, v14, a5);
        --v12;
      }
      while (v12);
    }
    expression_shrink_if_possible((char *)a1);
    return;
  }
  v52 = v10;
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v15 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v56 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v56 = *a1;
    v15 = a1 + 8;
  }
  v16 = *((unsigned int *)a1 + 1);
  v17 = v16 + v12;
  v57 = v16;
  v55 = *MEMORY[0x1E0C9AE50];
  if (v16 + v12 >= 0x101)
  {
    v18 = malloc_type_malloc(4 * v17, 0x100004052888210uLL);
    v19 = (char *)malloc_type_malloc(8 * v17, 0x100004000313F17uLL);
    v16 = v57;
    __src = v19;
  }
  else
  {
    __src = &v59;
    v18 = v60;
  }
  v53 = a1 + 8;
  v54 = a1;
  if ((_DWORD)v16)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = -a5;
    while (1)
    {
      v24 = *(_DWORD *)&v15[4 * v56 + 2 * v21];
      v25 = *((unsigned int *)v11 + v22);
      if (v24 == (_DWORD)v25)
      {
        v26 = v9[v22];
        v27 = *(double *)&v15[4 * v21];
        if (COERCE_UNSIGNED_INT64(v26 * v23) >> 63 == *(_QWORD *)&v27 >> 63)
        {
          v28 = *(double *)&NSISEpsilon;
          v29 = 0.0;
          if (vabdd_f64(v26 * v23, v27) <= *(double *)&NSISEpsilon)
            goto LABEL_23;
          v30 = COERCE__INT64(v26 * v23) - *(_QWORD *)&v27;
          if (v30 < 0)
            v30 = *(_QWORD *)&v27 - COERCE__INT64(v26 * v23);
          if (v30 <= NSISMaxUlps)
            goto LABEL_23;
        }
        v29 = v27 + a5 * v26;
        v28 = *(double *)&NSISEpsilon;
        if (v29 == 0.0)
LABEL_23:
          v31 = v28 > 0.0;
        else
          v31 = fabs(v29) < *(double *)&NSISEpsilon;
        if (v31)
          v29 = 0.0;
        if (v29 == 0.0)
        {
          (*(void (**)(uint64_t))(a4 + 16))(a4);
          v16 = v57;
        }
        else
        {
          *(_DWORD *)&v18[4 * v20] = v24;
          *(double *)&__src[8 * v20++] = v29;
        }
        ++v21;
      }
      else
      {
        if (v24 < v25)
        {
          *(_DWORD *)&v18[4 * v20] = v24;
          *(_QWORD *)&__src[8 * v20++] = *(_QWORD *)&v15[4 * v21++];
          goto LABEL_41;
        }
        v32 = v9[v22] * a5;
        if (v32 == 0.0)
          v33 = *(double *)&NSISEpsilon > 0.0;
        else
          v33 = fabs(v32) < *(double *)&NSISEpsilon;
        if (v33)
          v32 = 0.0;
        if (v32 != 0.0)
        {
          *(_DWORD *)&v18[4 * v20] = v25;
          *(double *)&__src[8 * v20++] = v32;
          (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v25);
          v16 = v57;
        }
      }
      ++v22;
LABEL_41:
      if (v21 >= v16 || v22 >= v12)
        goto LABEL_45;
    }
  }
  v22 = 0;
  v21 = 0;
  v20 = 0;
LABEL_45:
  v34 = v16 - v21;
  if (v16 <= v21)
  {
    v41 = v53;
    v40 = v54;
  }
  else
  {
    v35 = v20 + v16 - v21;
    v36 = &v18[4 * v20];
    v37 = &__src[8 * v20];
    v38 = &v15[4 * v56 + 2 * v21];
    v39 = &v15[4 * v21];
    v41 = v53;
    v40 = v54;
    do
    {
      v42 = *(_DWORD *)v38;
      v38 += 2;
      *v36++ = v42;
      v43 = *(_QWORD *)v39;
      v39 += 4;
      *(_QWORD *)v37 = v43;
      v37 += 8;
      --v34;
    }
    while (v34);
    v20 = v35;
  }
  v44 = v12 - v22;
  if (v12 > v22)
  {
    v45 = (_DWORD *)&v9[v52] + v22;
    v46 = &v9[v22];
    do
    {
      v47 = *v46 * a5;
      if (v47 == 0.0)
        v48 = *(double *)&NSISEpsilon > 0.0;
      else
        v48 = fabs(v47) < *(double *)&NSISEpsilon;
      if (v48)
        v47 = 0.0;
      if (v47 != 0.0)
      {
        *(_DWORD *)&v18[4 * v20] = *v45;
        *(double *)&__src[8 * v20++] = v47;
        (*(void (**)(uint64_t))(a3 + 16))(a3);
      }
      ++v45;
      ++v46;
      --v44;
    }
    while (v44);
  }
  expression_ensure_capacity(v40, v20);
  if (*((_QWORD *)v40 + 2) == v55)
  {
    v41 = (unsigned __int16 *)*((_QWORD *)v40 + 3);
    v49 = *((_QWORD *)v40 + 4);
  }
  else
  {
    v49 = *v40;
  }
  v50 = (char *)&v41[4 * v49];
  memmove(v50, v18, 4 * v20);
  memcpy(v41, __src, 8 * v20);
  v51 = v57 - v20;
  if (v57 > v20)
  {
    bzero(&v50[4 * v57 + -4 * v51], 4 * v51);
    bzero(&v41[4 * v57 + -4 * v51], 8 * v51);
  }
  *((_DWORD *)v40 + 1) = v20;
  expression_shrink_if_possible((char *)v40);
  if (v18 != v60)
  {
    free(v18);
    free(__src);
  }
}

void NSBitSetAddIndex(unsigned int *a1, unint64_t a2)
{
  char v2;
  unint64_t v4;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;

  v2 = a2;
  v4 = a2 >> 6;
  v5 = a1[2];
  if (v5 <= (a2 >> 6))
  {
    _NSBitSetResize(a1, a2 >> 6);
    v5 = a1[2];
    v8 = 1 << v2;
LABEL_7:
    v9 = a1;
    if (v5 >= 2)
      v9 = *(unsigned int **)a1;
    *(_QWORD *)&v9[2 * v4] |= v8;
    ++a1[3];
    return;
  }
  v6 = a1;
  if (v5 >= 2)
    v6 = *(unsigned int **)a1;
  v7 = *(_QWORD *)&v6[2 * v4];
  v8 = 1 << a2;
  if ((v7 & (1 << a2)) == 0)
    goto LABEL_7;
}

void ___substituteOutAllOccurencesOfBodyVar_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke_3(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t *___substituteOutAllOccurencesOfBodyVar_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke_4(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

BOOL NSISSparseVectorStrongestTermIsNegative(_WORD *a1)
{
  return a1[4] && *(double *)(*(_QWORD *)a1 + 8) < 0.0;
}

unsigned __int16 *expression_add_variable(unsigned __int16 *result, unsigned int a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  unsigned __int16 *v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  _BOOL4 v18;
  double v19;
  double *v20;
  char v21;

  v10 = result;
  if (a5 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0)
      return result;
  }
  else if (fabs(a5) < *(double *)&NSISEpsilon)
  {
    return result;
  }
  v21 = 0;
  v20 = 0;
  v11 = a2;
  result = (unsigned __int16 *)vars_index_with_insert(result, a2, &v21, &v20);
  v12 = (unint64_t)result;
  v13 = *v20;
  v14 = -(a6 * a5);
  if (*(_QWORD *)&v14 >> 63 == *(_QWORD *)v20 >> 63)
  {
    v15 = *(double *)&NSISEpsilon;
    v16 = 0.0;
    if (vabdd_f64(-(a6 * a5), v13) <= *(double *)&NSISEpsilon)
      goto LABEL_11;
    v17 = *(_QWORD *)&v14 - *(_QWORD *)v20;
    if (v17 < 0)
      v17 = -v17;
    if (v17 <= NSISMaxUlps)
      goto LABEL_11;
  }
  v16 = v13 + a6 * a5;
  v15 = *(double *)&NSISEpsilon;
  if (v16 == 0.0)
LABEL_11:
    v18 = v15 > 0.0;
  else
    v18 = fabs(v16) < *(double *)&NSISEpsilon;
  if (v18)
    v19 = 0.0;
  else
    v19 = v16;
  *v20 = v19;
  if (v21)
    result = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v11);
  if (v19 == 0.0)
  {
    vars_remove_idx(v10, v12);
    return (unsigned __int16 *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v11);
  }
  return result;
}

void NSISSparseVectorMapDelete(uint64_t a1, unsigned int a2)
{
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  void *v18;
  void *v19;
  void *v20;

  v4 = 0x1E0CB3000uLL;
  if (!*(_DWORD *)(a1 + 24))
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 218, CFSTR("Tried to remove a sparse vector value from an empty map which shouldn't happen."));
    v4 = 0x1E0CB3000uLL;
  }
  v5 = *(_DWORD *)(a1 + 32);
  v6 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  v7 = (v6 ^ HIWORD(v6)) % v5;
  v8 = v5;
  while (1)
  {
    v9 = *(_QWORD *)(a1 + 16);
    v10 = *(_QWORD *)(v9 + 24 * v7);
    if (v10 != -1)
    {
      if (!v10)
      {
        v20 = (void *)objc_msgSend(*(id *)(v4 + 1160), "currentHandler");
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 227, CFSTR("Tried to remove a sparse vector value that wasn't in the map."));
        v4 = 0x1E0CB3000;
        v9 = *(_QWORD *)(a1 + 16);
      }
      if (*(_DWORD *)(v9 + 24 * v7 + 12) == a2)
        break;
    }
    if (v7 + 1 < v5)
      ++v7;
    else
      v7 = 0;
    if (!--v8)
    {
      v19 = (void *)objc_msgSend(*(id *)(v4 + 1160), "currentHandler");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 224, CFSTR("Corrupt hash table"));
      v4 = 0x1E0CB3000;
    }
  }
  NSISSparseVectorMinHeapDelete(a1, v9 + 24 * v7);
  v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v11 + 24 * v7) = -1;
  v12 = *(_DWORD *)(a1 + 28) + 1;
  v13 = *(_DWORD *)(a1 + 24) - 1;
  *(_DWORD *)(a1 + 24) = v13;
  *(_DWORD *)(a1 + 28) = v12;
  if (v7 + 1 < v5)
    v14 = v7 + 1;
  else
    v14 = 0;
  if (!*(_QWORD *)(v11 + 24 * v14))
  {
    do
    {
      --v12;
      *(_QWORD *)(v11 + 24 * v7) = 0;
      if (v7)
        v15 = v7;
      else
        v15 = v5;
      v7 = v15 - 1;
    }
    while (*(_QWORD *)(v11 + 24 * (v15 - 1)) == -1);
    *(_DWORD *)(a1 + 28) = v12;
  }
  v16 = *(_DWORD *)(a1 + 32);
  if (v16 >= 0x40 && v13 < v16 >> 3)
    _hashMapRehash(a1, -1);
}

__n128 NSISSparseVectorMapInsert(uint64_t a1, unsigned int a2, __n128 *a3)
{
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  __n128 *v12;
  __n128 result;

  v6 = *(_DWORD *)(a1 + 24);
  v7 = *(_DWORD *)(a1 + 28);
  if (v7 + v6 >= (3 * *(_DWORD *)(a1 + 32)) >> 2)
    _hashMapRehash(a1, v6 >= 4 * v7);
  v8 = *(_DWORD *)(a1 + 32);
  v9 = 73244475 * ((73244475 * (a2 ^ HIWORD(a2))) ^ ((73244475 * (a2 ^ HIWORD(a2))) >> 16));
  v10 = (v9 ^ HIWORD(v9)) % v8;
  v11 = *(_QWORD *)(a1 + 16);
  while (1)
  {
    v12 = (__n128 *)(v11 + 24 * v10);
    if (!v12->n128_u64[0])
      break;
    if (v12->n128_u64[0] == -1)
    {
      --*(_DWORD *)(a1 + 28);
      break;
    }
    if (v10 + 1 < v8)
      ++v10;
    else
      v10 = 0;
  }
  result = *a3;
  v12[1].n128_u64[0] = a3[1].n128_u64[0];
  *v12 = result;
  *(_DWORD *)(v11 + 24 * v10 + 12) = a2;
  ++*(_DWORD *)(a1 + 24);
  return result;
}

uint64_t NSISSparseVectorAddTermWithPlaceValueAndCoefficient(uint64_t a1, double a2, double a3)
{
  return NSISSparseVectorAddTermWithPlaceValueCoefficientStartingIndex(a1, 0, a2, a3, 1.0);
}

_QWORD *NSISSparseVectorInit(_QWORD *result)
{
  result[1] = 0;
  result[2] = 0;
  *result = 0;
  *((_DWORD *)result + 4) = -1;
  return result;
}

void NSISSparseVectorMinHeapDestroy(void **a1)
{
  if (a1)
    free(*a1);
}

void *NSISSparseVectorCreateCopy@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;

  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_DWORD *)(a2 + 16) = -1;
  v4 = malloc_type_malloc(16 * *(unsigned __int16 *)(a1 + 10), 0x1000040451B5BE8uLL);
  *(_QWORD *)a2 = v4;
  return memcpy(v4, *(const void **)a1, 16 * *(unsigned __int16 *)(a1 + 8));
}

uint64_t *NSISSparseVectorMultiplyByScalar(uint64_t *result, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;

  if (a2 != 1.0)
  {
    v2 = *((unsigned __int16 *)result + 4);
    if (*((_WORD *)result + 4))
    {
      v3 = 0;
      v4 = *result;
      v5 = *result + 16;
      v6 = *((unsigned __int16 *)result + 4);
      do
      {
        v7 = v4 + 16 * v3;
        v9 = *(double *)(v7 + 8);
        v8 = (double *)(v7 + 8);
        v10 = v9 * a2;
        if (v9 * a2 == 0.0)
        {
          v11 = *(double *)&NSISEpsilon;
          if (*(double *)&NSISEpsilon > 0.0)
            goto LABEL_20;
        }
        else
        {
          v11 = *(double *)&NSISEpsilon;
          if (fabs(v10) < *(double *)&NSISEpsilon)
            goto LABEL_20;
        }
        v12 = rint(v10);
        if (vabdd_f64(v10, v12) >= v11)
        {
          v13 = rint(v10 * 8.0);
          v14 = fabs(v10 * 8.0);
          if (vabdd_f64(v13, v10 * 8.0) >= v11 * 8.0 || v14 == INFINITY)
            v12 = v10;
          else
            v12 = v13 * 0.125;
        }
        if (v12 == 0.0)
        {
LABEL_20:
          v17 = v2 - 1;
          if (v3 < v2 - 1)
          {
            v18 = ~v3 + v2;
            v19 = (_OWORD *)(v5 + 16 * v3);
            do
            {
              *(v19 - 1) = *v19;
              ++v19;
              --v18;
            }
            while (v18);
            v6 = *((unsigned __int16 *)result + 4);
          }
          *((_WORD *)result + 4) = --v6;
          v2 = v17;
          continue;
        }
        *v8 = v12;
        ++v3;
      }
      while (v3 < v2);
    }
  }
  return result;
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t ___row_rawReplaceColWithRowBody_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

void NSISLinExpAddExpression(unsigned __int16 *a1, uint64_t a2, double a3)
{
  double v6;
  void *v7;

  v6 = fabs(a3);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISLinExpAddExpression(NSISLinExp *, NSISLinExp *, NSISFloat_t)"), CFSTR("NSISLinearExpression.m"), 761, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(multiplyBy)"));
  }
  NSISLinExpIncrementConstant((uint64_t)a1, *(double *)(a2 + 8) * a3);
  expression_merge(a1, (unsigned __int16 *)a2, (uint64_t)&__block_literal_global_18, (uint64_t)&__block_literal_global_18, a3);
}

uint64_t _siftUp(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  _BOOL8 v15;
  uint64_t v16;
  unsigned int v17;

  v3 = a3;
  v4 = (a3 | 0xFFFFFFFE) + a3;
  if (*((_DWORD *)a1 + 2) > v4 >> 1)
  {
    v7 = v4 >> 1;
    v8 = *a1;
    while (1)
    {
      v9 = v7;
      v10 = *(_QWORD *)(v8 + 8 * v7);
      v11 = NSISSparseVectorCompare((uint64_t *)v10, (uint64_t *)a2);
      if (!v11)
      {
        v12 = *(_DWORD *)(v10 + 12);
        v13 = *(_DWORD *)(a2 + 12);
        v14 = v12 >= v13;
        v15 = v12 > v13;
        v16 = !v14;
        v11 = v15 - v16;
      }
      if (v11 != 1)
        break;
      *(_QWORD *)(*a1 + 8 * v3) = *(_QWORD *)(*a1 + 8 * v9);
      v8 = *a1;
      *(_DWORD *)(*(_QWORD *)(*a1 + 8 * v3) + 16) = v3;
      v17 = (v9 | 0xFFFFFFFE) + v9;
      v7 = v17 >> 1;
      v3 = v9;
      if (*((_DWORD *)a1 + 2) <= v17 >> 1)
        return v9;
    }
  }
  return v3;
}

uint64_t NSISSparseVectorCompare(uint64_t *a1, uint64_t *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  double *v8;
  uint64_t result;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v2 = *((unsigned __int16 *)a1 + 4);
  v3 = *((unsigned __int16 *)a2 + 4);
  v4 = *a1;
  v5 = *a2;
  if (v2 >= v3)
    v6 = *((unsigned __int16 *)a2 + 4);
  else
    v6 = *((unsigned __int16 *)a1 + 4);
  if ((_DWORD)v6)
  {
    v7 = (double *)(v5 + 8);
    v8 = (double *)(v4 + 8);
    result = 1;
    v10 = v6;
    while (1)
    {
      v11 = *(v8 - 1);
      v12 = *(v7 - 1);
      if (v11 > v12)
        break;
      if (v11 != v12)
      {
        v14 = *v7;
        goto LABEL_21;
      }
      if (*v8 > *v7)
        return result;
      if (*v8 != *v7)
        return -1;
      v7 += 2;
      v8 += 2;
      if (!--v10)
        goto LABEL_13;
    }
    v13 = *v8;
    goto LABEL_18;
  }
LABEL_13:
  if (v2 > v3)
  {
    v13 = *(double *)(v4 + 16 * v6 + 8);
LABEL_18:
    if (v13 > 0.0)
      return 1;
    else
      return -1;
  }
  if (v3 <= v2)
    return 0;
  v14 = *(double *)(v5 + 16 * v6 + 8);
LABEL_21:
  if (v14 <= 0.0)
    return 1;
  else
    return -1;
}

__n128 NSISSparseVectorInitWithVector(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  a1[1].n128_u32[0] = -1;
  return result;
}

uint64_t _AnchorClassForAttribute(uint64_t a1)
{
  void *v2;
  uint64_t result;

  switch((int)a1)
  {
    case 0:
      v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class _AnchorClassForAttribute(NSLayoutAttribute)"), CFSTR("NSLayoutAnchor.m"), 527, CFSTR("ERROR: NSLayoutAnchors cannot be created with proxy attribute %ld"), a1);
      result = 0;
      break;
    default:
      result = objc_opt_class();
      break;
  }
  return result;
}

uint64_t NSISSparseVectorMinHeapInsert(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  void *v7;
  uint64_t result;

  v4 = *(unsigned int *)(a1 + 8);
  v5 = *(_DWORD *)(a1 + 12);
  if (v5 <= (int)v4 + 1)
  {
    if (v5)
      v6 = 2 * v5;
    else
      v6 = 32;
    v7 = malloc_type_realloc(*(void **)a1, 8 * v6, 0x2004093837F09uLL);
    *(_DWORD *)(a1 + 12) = v6;
    *(_QWORD *)a1 = v7;
    v4 = *(unsigned int *)(a1 + 8);
  }
  result = _siftUp((uint64_t *)a1, a2, v4);
  *(_QWORD *)(*(_QWORD *)a1 + 8 * result) = a2;
  ++*(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 16) = result;
  return result;
}

uint64_t ___objectiveRow_rawAddCol_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

void ___objectiveRow_addColWithPriorityTimes_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

uint64_t ___row_enumerateColsWithCoefficients_block_invoke(uint64_t a1, unsigned int a2, double a3)
{
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 8 * (a2 >> 6));
  if ((*(_BYTE *)(v5 + 32 * (a2 & 0x3F) + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v5 + v7));
  }
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(a3);
}

void _hashMapRehash(uint64_t a1, int a2)
{
  uint64_t v3;
  unsigned int v4;
  __int16 v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = *(unsigned int *)(a1 + 32);
  if (a2 == -1)
  {
    v6 = *(unsigned __int16 *)(a1 + 36);
    if (v6 >= 6)
    {
      LOWORD(v6) = v6 - 1;
      *(_WORD *)(a1 + 36) = v6;
    }
    v7 = 1 << v6;
    v8 = v7 - 1;
    v9 = v7 - ((v7 - 1) & (v3 >> 1));
    if ((v8 & (v3 >> 1)) == 0)
      v9 = 0;
    v4 = v9 + (v3 >> 1);
    *(_DWORD *)(a1 + 32) = v4;
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 32);
    if (a2 == 1)
    {
      v5 = *(_WORD *)(a1 + 36);
      v4 = (1 << v5) + v3;
      *(_DWORD *)(a1 + 32) = v4;
      if (v4 == 8 << v5)
        *(_WORD *)(a1 + 36) = v5 + 1;
    }
  }
  v10 = *(_QWORD **)(a1 + 16);
  *(_QWORD *)(a1 + 24) = 0;
  v11 = malloc_type_calloc(v4, 0x18uLL, 0x10200405AF6BDC9uLL);
  *(_QWORD *)(a1 + 16) = v11;
  if (v11)
  {
    if (!(_DWORD)v3)
      goto LABEL_17;
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _hashMapRehash(NSISSparseVectorMap *, NSISSparseVectorMapDirection)"), CFSTR("NSISSparseVectorMap.m"), 85, CFSTR("Unable to grow sparse vector hash table"));
    if (!(_DWORD)v3)
      goto LABEL_17;
  }
  v12 = v10;
  do
  {
    if ((unint64_t)(*v12 + 1) >= 2)
    {
      v13 = NSISSparseVectorMapInsert(a1, *((unsigned int *)v12 + 3), v12);
      v14 = *(unsigned int *)(v13 + 16);
      if ((_DWORD)v14 != -1)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v14) = v13;
    }
    v12 += 3;
    --v3;
  }
  while (v3);
LABEL_17:
  free(v10);
}

uint64_t ___objectiveRow_rawAddRowBody_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t *___objectiveRow_addRowBodyWithPriorityTimes_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t NSISSparseVectorGetStrongestTerm(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v4;

  if (*(_WORD *)(result + 8))
  {
    v3 = *(_QWORD **)result;
    *a2 = **(_QWORD **)result;
    v4 = v3[1];
  }
  else
  {
    *a2 = 0;
    v4 = 0;
  }
  *a3 = v4;
  return result;
}

uint64_t ___objectiveRow_rawAddRowBody_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

void ___objectiveRow_addRowBodyWithPriorityTimes_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

void sub_1A3715FB4()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;

  +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", v1, 7, 0, v0, 36, v4 + v3 - (v5 + v2));
  JUMPOUT(0x1A3715FE0);
}

void sub_1A3716008()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(v0, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", v1, 32, 0, v7 - v6));
  objc_msgSend(v0, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", v2, 7, 0, v1, 36, v6 + v5 - (v7 + v4)));
  __asm { BR              X10 }
}

void sub_1A371605C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v8 = v6 + v5 - (v7 + v4);
  v9 = v5 - v8;
  if (v5 - v8 == 0.0)
  {
    v10 = *(double *)&NSISEpsilon;
    v11 = 0.5;
    if (*(double *)&NSISEpsilon > 0.0)
      goto LABEL_4;
  }
  else
  {
    v10 = fabs(v9);
    v11 = 0.5;
    if (v10 < *(double *)&NSISEpsilon)
    {
LABEL_4:
      objc_msgSend(v0, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:constant:", v2, 7, 0, v1, 36, v8, v10));
      objc_msgSend(v0, "addObject:", +[NSAutoresizingMaskLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v1, 7, 0, v2, 7, v11, -(v8 * v11)));
      __asm { BR              X10 }
    }
  }
  v11 = v4 / v9;
  goto LABEL_4;
}

void *sub_1A37162DC()
{
  void *v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;

  objc_msgSend(v0, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", v1, 33, 0, v4 - v3));
  objc_msgSend(v0, "addObject:", +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:constant:](NSAutoresizingMaskLayoutConstraint, "constraintWithItem:attribute:relatedBy:constant:", v1, 8, 0, v2));
  return v0;
}

void sub_1A37172E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL NSLayoutConstraintIsPotentiallyDanglyInContainer(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(a2, "firstAnchor");
  v5 = (void *)objc_msgSend(a2, "secondAnchor");
  v6 = (void *)objc_msgSend(v4, "_nearestAncestorLayoutItem");
  if (v4 && (!v6 || v6 != a1 && (void *)objc_msgSend(v6, "nsli_superitem") != a1))
    return 1;
  v7 = (void *)objc_msgSend(v5, "_nearestAncestorLayoutItem");
  if (v5)
  {
    if (v7)
    {
      if (v7 != a1)
        return objc_msgSend(v7, "nsli_superitem") != (_QWORD)a1;
      return 0;
    }
    return 1;
  }
  return 0;
}

void sub_1A371796C()
{
  objc_end_catch();
  JUMPOUT(0x1A3717978);
}

unint64_t _minimizeConstantInObjectiveRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL4 v6;
  unint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id **v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = _NSConstraintBasedLayoutLogPivotCounts();
  for (i = 0; ; ++i)
  {
    if ((*(_BYTE *)(a3 + 80) & 1) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description(a2, a3));
    }
    LODWORD(v23) = 0;
    if (!-[NSISObjectiveLinearExpression restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:](*(_QWORD *)(a3 + 16), &v23))break;
    v8 = *(_QWORD *)(*(_QWORD *)(a2 + 192) + (((unint64_t)v23 >> 3) & 0x1FFFFFF8));
    v9 = v23 & 0x3F;
    v10 = v8 + 32 * v9;
    if ((*(_BYTE *)(v10 + 24) & 1) != 0)
    {
      v20 = 32 * v9;
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v8 + v20));
    }
    v11 = *(id ***)(v10 + 8);
    v23 = 0;
    v24 = 0;
    if ((_chooseOutgoingRowHeadForIncomingRowHead(a2, (uint64_t)v11, (uint64_t)&v23, i > 0x3E8) & 1) == 0)
    {
      if (_NSConstraintBasedLayoutLogEngineRebuilds())
      {
        v21 = 0;
        v22 = 0;
        if ((*(_BYTE *)(a3 + 80) & 1) == 0)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description(a2, a3));
        }
        -[NSISObjectiveLinearExpression leadingPriority:andValue:forVar:](*(_QWORD **)(a3 + 16), &v22, &v21, *((_DWORD *)*v11 + 4));
        v14 = _row_description(a2, a3);
        NSLog(CFSTR("Objective: %@"), v14);
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = **v11;
        NSLog(CFSTR("%@"), objc_msgSend(v15, "stringWithFormat:", CFSTR("Auto layout internal error.  Cannot find an outgoing row head for incoming head %@, which should never happen. Priority: %g, Coefficient: %.10f"), v16, v22, v21));
      }
      *(_BYTE *)(a1 + 162) = 1;
      if (i >= 0x3E9 && (_minimizeConstantInObjectiveRow_warnedAboutCyclingAvoidance & 1) == 0)
      {
        NSLog(CFSTR("Warning: This system of layout constraints is extremely difficult to optimize, taking %ld pivots.  Try ensuring your layout is not over-constrained and you have no redundant constraints. This warning will only be displayed once."), i);
        _minimizeConstantInObjectiveRow_warnedAboutCyclingAvoidance = 1;
      }
      return i;
    }
    _pivotToMakeColNewHeadOfRow(a1, a2, (uint64_t **)v11, v23, v24, 0);
    if (_NSConstraintBasedLayoutDebugEngineConsistency())
      objc_msgSend((id)a1, "verifyInternalIntegrity");
  }
  if (i)
    v13 = v6;
  else
    v13 = 0;
  if (v13)
    printf("%p: Optimized in %lu moves (cumulative pivots: %lu)\n", (const void *)a1, i, *(_QWORD *)(a1 + 88));
  return i;
}

uint64_t NSISSparseVectorMinHeapPeek(_DWORD *a1)
{
  if (a1[2])
    return **(_QWORD **)a1;
  else
    return 0;
}

void _pivotToMakeColNewHeadOfRow(uint64_t a1, uint64_t a2, uint64_t **a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned __int16 *v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  unint64_t Index;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t *v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int *v31;
  unsigned int *v32;
  unint64_t v33;
  unsigned int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  int v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  id *v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v56;
  _QWORD v58[6];
  _QWORD v59[6];
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, unsigned int);
  void *v63;
  uint64_t v64;
  _QWORD *v65;

  ++*(_QWORD *)(a1 + 88);
  v9 = (unsigned __int16 *)(a5 + 16);
  v10 = *(_QWORD *)a5;
  v53 = *a3;
  v11 = NSISLinExpConstant(a5 + 16);
  v12 = *(void **)(a1 + 8);
  if (objc_msgSend(v12, "count", v11))
    objc_msgSend(v12, "removeObjectIdenticalTo:", *(id *)v10);
  v13 = a1 + 312;
  v14 = ((unint64_t)*(unsigned int *)(v10 + 24) >> 3) & 3;
  v15 = (unsigned int *)(a1 + 312 + 40 * v14 + 24);
  if (!NSBitSetCount((uint64_t)v15))
    _table_addStorageBlock((void **)(v13 + 40 * v14), (unint64_t *)(v13 + 40 * v14 + 8), (unint64_t *)(v13 + 40 * v14 + 16), 0x19uLL, 40, v15);
  Index = NSBitSetFirstIndex((uint64_t **)v15);
  v17 = Index;
  NSBitSetRemoveIndex((uint64_t *)v15, Index);
  v18 = v17 | ((_DWORD)v14 << 30);
  v19 = 40 * ((v18 >> 30) & 1);
  v20 = (v18 & 0xBFFFFFFF) / 0x19uLL;
  v21 = (v18 & 0xBFFFFFFF) % 0x19;
  v22 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + v19) + 8 * v20) + 40 * v21);
  *v22 = v10;
  v22[1] = 0;
  v22[2] = 1;
  v22[3] = 0;
  v22[4] = 1;
  v23 = *(_QWORD *)(*(_QWORD *)(v13 + v19) + 8 * v20);
  LODWORD(v19) = *(_DWORD *)(v10 + 24) & 0xFFFFFFFE;
  *(_DWORD *)(v10 + 20) = v18;
  *(_DWORD *)(v10 + 24) = v19;
  v52 = v23 + 40 * v21;
  *(_QWORD *)(v10 + 8) = v52;
  v24 = MEMORY[0x1E0C809B0];
  *(_QWORD *)a5 = 0;
  if (a6)
  {
    v59[0] = v24;
    v59[1] = 3221225472;
    v59[2] = ___pivotToMakeColNewHeadOfRow_block_invoke;
    v59[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
    v25 = a4;
    v59[4] = a4;
    v59[5] = a5;
    if ((*(_BYTE *)(a5 + 80) & 1) != 0)
    {
      v36 = *(_QWORD *)v9;
      v60 = v24;
      v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke;
      v63 = &unk_1E4A48E98;
      v64 = a4;
      v65 = v59;
      -[NSISObjectiveLinearExpression enumerateVars:](v36, (uint64_t)&v60);
    }
    else
    {
      v60 = v24;
      v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke_2;
      v63 = &unk_1E4A48E98;
      v64 = a4;
      v65 = v59;
      NSISLinExpEnumerateVars(v9, (uint64_t)&v60);
    }
    v35 = a2;
    v37 = NSBitSetCount((uint64_t)(a3 + 1));
    if (!(NSBitSetCount((uint64_t)(a3 + 3)) + v37))
    {
      v38 = NSISLinExpConstant((uint64_t)v9);
      v39 = 0;
LABEL_29:
      v45 = (id *)v53;
      goto LABEL_35;
    }
  }
  else
  {
    v26 = *(_DWORD *)(a5 + 8);
    if (HIWORD(v26))
      v27 = v26 - 0x40000000;
    else
      v27 = v26;
    if (HIWORD(v26))
      v28 = (uint64_t *)(a3 + 3);
    else
      v28 = (uint64_t *)(a3 + 1);
    NSBitSetRemoveIndex(v28, v27);
    v29 = *(_DWORD *)(a5 + 8);
    v30 = v23 + 40 * v21;
    v31 = (unsigned int *)(v30 + 8);
    v32 = (unsigned int *)(v30 + 24);
    if (HIWORD(v29))
      v33 = v29 - 0x40000000;
    else
      v33 = v29;
    if (HIWORD(v29))
      v34 = v32;
    else
      v34 = v31;
    NSBitSetAddIndex(v34, v33);
    v35 = a2;
    v25 = a4;
  }
  v40 = NSISLinExpCoefficientForVar((uint64_t)v9, *((_DWORD *)*a3 + 4));
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = ___pivotToMakeColNewHeadOfRow_block_invoke_2;
  v58[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v58[4] = v25;
  v58[5] = a5;
  v41 = 1.0 / v40;
  v60 = MEMORY[0x1E0C809B0];
  v61 = 3221225472;
  v62 = ___row_rawScaleByWithDroppedColProcessor_block_invoke;
  v63 = &unk_1E4A48E98;
  v64 = v25;
  v65 = v58;
  NSISLinExpScaleByWithDroppedColProcessor((double *)v9, (uint64_t)&v60, -(1.0 / v40));
  v42 = fabs(1.0 / v40);
  if (v42 >= INFINITY && v42 <= INFINITY)
  {
    v43 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _pivotToMakeColNewHeadOfRow(NSISEngine *, NSISCol, NSISRow, BOOL)");
    v44 = _row_description(v25, a5);
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("NSISEngine.m"), 470, CFSTR("The reciprocal (%f) for a row coefficient (%f) in engine (%p) is not finite. Pivot row: %@, incoming row head: %@."), *(_QWORD *)&v41, *(_QWORD *)&v40, a1, v44, _col_description(v35, a3));
  }
  NSISLinExpReplaceVarWithVar(v9, *((_DWORD *)*a3 + 4), *(_DWORD *)(*(_QWORD *)v52 + 16), v41);
  _substituteOutAllOccurencesOfBodyVar(a1, v35, (uint64_t)a3, v25, a5);
  v38 = NSISLinExpConstant((uint64_t)v9);
  if ((a6 & 1) != 0)
  {
    v39 = 1;
    goto LABEL_29;
  }
  _row_rawSetHead(v25, (_DWORD *)a5, v35, (id **)a3);
  v46 = (*(_DWORD *)(*(_QWORD *)a5 + 24) >> 1) & 3;
  if (v46 == 2)
  {
    v45 = (id *)v53;
    if (v38 == 0.0)
    {
      if (*(double *)&NSISEpsilon > 0.0)
        goto LABEL_34;
    }
    else if (fabs(v38) < *(double *)&NSISEpsilon)
    {
      goto LABEL_34;
    }
  }
  else
  {
    v45 = (id *)v53;
    if (v46 != 1 || v38 >= 0.0)
      goto LABEL_34;
  }
  objc_msgSend(*(id *)(a1 + 8), "addObject:", *v45);
LABEL_34:
  v39 = 1;
LABEL_35:
  if (v38 != 0.0)
  {
    _noteValueOfVariableChanged(a1, v25, (_QWORD *)v10);
    _noteValueOfVariableChanged(a1, v35, v45);
  }
  if (a6)
  {
    if (v39)
      v47 = v35;
    else
      v47 = v25;
    if (v39)
      v48 = (uint64_t *)v45;
    else
      v48 = (uint64_t *)v10;
    _engineVar_rawRemove(v47, v48);
    if ((*(_BYTE *)(a5 + 80) & 1) != 0)
    {
      v49 = *(_QWORD *)v9;
      v60 = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke;
      v63 = &unk_1E4A48E98;
      v64 = v25;
      v65 = &__block_literal_global_464;
      -[NSISObjectiveLinearExpression enumerateVars:](v49, (uint64_t)&v60);
    }
    else
    {
      v60 = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = ___row_enumerateCols_block_invoke_2;
      v63 = &unk_1E4A48E98;
      v64 = v25;
      v65 = &__block_literal_global_464;
      NSISLinExpEnumerateVars(v9, (uint64_t)&v60);
    }
    if ((*(_BYTE *)(a5 + 80) & 1) != 0)
    {

      *(_QWORD *)v9 = 0;
    }
    else
    {
      NSISLinExpFree((uint64_t)v9);
    }
    v50 = *(unsigned int *)(a5 + 8);
    v51 = a1 + 40 * ((v50 >> 30) & 1);
    NSBitSetAddIndex((unsigned int *)(v51 + 256), v50 & 0xFFFFFFFFBFFFFFFFLL);
    _table_removeStorageBlockIfPossible(*(_QWORD *)(v51 + 232), (uint64_t *)(v51 + 240), 0x17uLL, (uint64_t **)(v51 + 256));
  }
}

void NSISLinExpReplaceVarWithVar(unsigned __int16 *a1, unsigned int a2, unsigned int a3, double a4)
{
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  unint64_t v15;
  double *v16;
  double *v17;

  v8 = fabs(a4);
  if (v8 >= INFINITY && v8 <= INFINITY)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISLinExpReplaceVarWithVar(NSISLinExp *, NSISLinExpVar, NSISLinExpVar, NSISFloat_t)"), CFSTR("NSISLinearExpression.m"), 717, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(coefficient)"));
  }
  v10 = 0.0;
  if (a4 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0)
      goto LABEL_18;
  }
  else if (v8 < *(double *)&NSISEpsilon)
  {
    goto LABEL_18;
  }
  v10 = rint(a4);
  if (vabdd_f64(a4, v10) >= *(double *)&NSISEpsilon)
  {
    v11 = rint(a4 * 8.0);
    v12 = fabs(a4 * 8.0);
    if (vabdd_f64(v11, a4 * 8.0) >= *(double *)&NSISEpsilon * 8.0 || v12 == INFINITY)
      v10 = a4;
    else
      v10 = v11 * 0.125;
  }
LABEL_18:
  v15 = vars_index(a1, a2);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    vars_remove_idx(a1, v15);
  if (v10 == 0.0)
  {
    expression_shrink_if_possible((char *)a1);
  }
  else
  {
    v17 = 0;
    vars_index_with_insert(a1, a3, 0, &v17);
    v16 = v17;
    if (*v17 != 0.0)
    {
      NSLog(CFSTR("NSISLinearExpressionAssert failure in %s, at line %d"), *v17, "NSISLinExpReplaceVarWithVar", 735);
      v16 = v17;
    }
    *v16 = v10;
  }
}

BOOL _NSConstraintBasedLayoutLogPivotCounts()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutLogPivotCounts"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutLogPivotCountsComputedValue, _NSFalseAppConfigPredicate);
}

void sub_1A3718FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSISSparseVectorMapForEach(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;

  v2 = *(unsigned int *)(result + 32);
  if ((_DWORD)v2)
  {
    v4 = result;
    v5 = 0;
    for (i = 0; i < v2; ++i)
    {
      if ((unint64_t)(*(_QWORD *)(*(_QWORD *)(v4 + 16) + v5) + 1) >= 2)
      {
        result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
        v2 = *(unsigned int *)(v4 + 32);
      }
      v5 += 24;
    }
  }
  return result;
}

uint64_t ___row_enumerateCols_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

void ___objectiveRow_addWithHeadAndBody_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

double _row_remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id *v7;
  id v8;
  id *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  unint64_t Index;
  int v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  id **v21;
  double result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t (*v26)(uint64_t, uint64_t, uint64_t *);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, unsigned int);
  void *v33;
  uint64_t v34;
  uint64_t *v35;

  v6 = **(id **)a3;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = ___row_remove_block_invoke;
  v27 = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v28 = a2;
  v29 = a3;
  v7 = (id *)(a3 + 16);
  if ((*(_BYTE *)(a3 + 80) & 1) != 0)
  {
    v8 = *v7;
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = ___row_enumerateCols_block_invoke;
    v33 = &unk_1E4A48E98;
    v34 = a2;
    v35 = &v24;
    -[NSISObjectiveLinearExpression enumerateVars:]((uint64_t)v8, (uint64_t)&v30);
  }
  else
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = ___row_enumerateCols_block_invoke_2;
    v33 = &unk_1E4A48E98;
    v34 = a2;
    v35 = &v24;
    NSISLinExpEnumerateVars((unsigned __int16 *)(a3 + 16), (uint64_t)&v30);
  }
  objc_msgSend(*(id *)(a1 + 8), "removeObjectIdenticalTo:", v6, v24, v25, v26, v27, v28, v29);
  v9 = *(id **)a3;
  if ((*(_BYTE *)(a3 + 80) & 1) != 0)
  {

    *v7 = 0;
  }
  else
  {
    NSISLinExpFree(a3 + 16);
  }
  v10 = *(unsigned int *)(a3 + 8);
  v11 = a1 + 40 * ((v10 >> 30) & 1);
  NSBitSetAddIndex((unsigned int *)(v11 + 256), v10 & 0xFFFFFFFFBFFFFFFFLL);
  _table_removeStorageBlockIfPossible(*(_QWORD *)(v11 + 232), (uint64_t *)(v11 + 240), 0x17uLL, (uint64_t **)(v11 + 256));
  v12 = a1 + 312;
  v13 = ((unint64_t)*((unsigned int *)v9 + 6) >> 3) & 3;
  v14 = (unsigned int *)(a1 + 312 + 40 * v13 + 24);
  if (!NSBitSetCount((uint64_t)v14))
    _table_addStorageBlock((void **)(v12 + 40 * v13), (unint64_t *)(v12 + 40 * v13 + 8), (unint64_t *)(v12 + 40 * v13 + 16), 0x19uLL, 40, v14);
  Index = NSBitSetFirstIndex((uint64_t **)v14);
  v16 = Index;
  NSBitSetRemoveIndex((uint64_t *)v14, Index);
  v17 = v16 | ((_DWORD)v13 << 30);
  v18 = 40 * ((v17 >> 30) & 1);
  v19 = (v17 & 0xBFFFFFFF) / 0x19uLL;
  v20 = (v17 & 0xBFFFFFFF) % 0x19;
  v21 = (id **)(*(_QWORD *)(*(_QWORD *)(v12 + v18) + 8 * v19) + 40 * v20);
  *v21 = v9;
  v21[1] = 0;
  *(_QWORD *)&result = 1;
  v21[2] = (id *)1;
  v21[3] = 0;
  v21[4] = (id *)1;
  v23 = *(_QWORD *)(*(_QWORD *)(v12 + v18) + 8 * v19) + 40 * v20;
  LODWORD(v18) = (_DWORD)v9[3] & 0xFFFFFFFE;
  *((_DWORD *)v9 + 5) = v17;
  *((_DWORD *)v9 + 6) = v18;
  v9[1] = (id)v23;
  return result;
}

uint64_t NSISSparseVectorMapClearContents(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(unsigned int *)(result + 32);
  if ((_DWORD)v1)
  {
    v2 = *(_QWORD **)(result + 16);
    do
    {
      *v2 = 0;
      v2 += 3;
      --v1;
    }
    while (v1);
  }
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 8) = 0;
  return result;
}

double NSISSparseVectorClearContents(uint64_t a1)
{
  double result;

  result = NAN;
  *(_QWORD *)(a1 + 12) = 0xFFFFFFFF00000000;
  *(_WORD *)(a1 + 8) = 0;
  return result;
}

BOOL NSISLinExpEnumerateVarsUntil(unsigned __int16 *a1, uint64_t a2)
{
  unsigned __int16 *v3;
  uint64_t v4;
  unint64_t v5;
  unsigned __int16 *v6;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v3 = a1 + 8;
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v3 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v4 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v4 = *a1;
  }
  v5 = *((unsigned int *)a1 + 1);
  if (!(_DWORD)v5)
    return 0;
  v6 = &v3[4 * v4];
  if (((*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned int *)v6) & 1) != 0)
    return 1;
  v8 = 1;
  do
  {
    v9 = v8;
    if (v5 == v8)
      break;
    v10 = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned int *)&v6[2 * v8]);
    v8 = v9 + 1;
  }
  while (!v10);
  return v9 < v5;
}

uint64_t ___row_enumerateColsUntil_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) + 8 * (a2 >> 6));
  if ((*(_BYTE *)(v3 + 32 * (a2 & 0x3F) + 24) & 1) != 0)
  {
    v5 = 32 * (a2 & 0x3F);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v3 + v5));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t *NSBitSetRemoveIndexesInRange(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  uint64_t *result;
  NSRange v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int8x8_t v13;
  uint8x8_t v14;
  __int32 v15;
  uint8x8_t v16;
  uint64_t v17;
  int v18;
  int8x8_t v19;
  uint8x8_t v20;
  uint64_t v21;
  int8x8_t v22;
  uint8x8_t v23;
  NSRange v24;
  NSRange v25;

  result = (uint64_t *)NSBitSetFindPrev((uint64_t **)a1, 0x7FFFFFFFFFFFFFFFuLL);
  if (result != (uint64_t *)0x7FFFFFFFFFFFFFFFLL)
  {
    v25.length = (NSUInteger)result + 1;
    v24.location = a2;
    v24.length = a3;
    v25.location = 0;
    v7 = NSIntersectionRange(v24, v25);
    result = (uint64_t *)v7.location;
    if (v7.length)
    {
      if (v7.length == 1)
      {
        return NSBitSetRemoveIndex((uint64_t *)a1, v7.location);
      }
      else
      {
        v8 = v7.location >> 6;
        v9 = (v7.location + v7.length - 1) >> 6;
        v10 = -1 << (LOBYTE(v7.location) + LOBYTE(v7.length));
        if (((v7.location + v7.length) & 0x3F) == 0)
          v10 = 0;
        v11 = (uint64_t *)a1;
        if (*(_DWORD *)(a1 + 8) >= 2u)
          v11 = *(uint64_t **)a1;
        v12 = ~(-1 << SLOBYTE(v7.location));
        if ((_DWORD)v8 == (_DWORD)v9)
        {
          v13 = (int8x8_t)(v11[v8] & (v10 | v12));
          v14 = (uint8x8_t)vcnt_s8((int8x8_t)v11[v8]);
          v14.i16[0] = vaddlv_u8(v14);
          v11[v8] = (uint64_t)v13;
          v15 = v14.i32[0];
          v16 = (uint8x8_t)vcnt_s8(v13);
          v16.i16[0] = vaddlv_u8(v16);
          LODWORD(v17) = v16.i32[0] - v15;
        }
        else if (v8 > v9)
        {
          LODWORD(v17) = 0;
        }
        else
        {
          v18 = 0;
          v17 = 0;
          do
          {
            v19 = (int8x8_t)v11[(v8 + v18)];
            result = (uint64_t *)(*(_QWORD *)&v19 & v12);
            v20 = (uint8x8_t)vcnt_s8(v19);
            v20.i16[0] = vaddlv_u8(v20);
            v21 = v17 - v20.u32[0];
            if ((_DWORD)v8 - (_DWORD)v9 + v18)
              v22 = 0;
            else
              v22 = (int8x8_t)(*(_QWORD *)&v19 & v10);
            if (!v18)
              v22 = (int8x8_t)result;
            v11[(v8 + v18)] = (uint64_t)v22;
            v23 = (uint8x8_t)vcnt_s8(v22);
            v23.i16[0] = vaddlv_u8(v23);
            v17 = v21 + v23.u32[0];
            ++v18;
          }
          while ((int)v8 + v18 <= v9);
        }
        *(_DWORD *)(a1 + 12) += v17;
      }
    }
  }
  return result;
}

unint64_t NSBitSetFindPrev(uint64_t **a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((a2 & 0x8000000000000000) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v2 = *((unsigned int *)a1 + 2);
  v3 = (v2 << 6) - 1 >= a2 ? a2 : (v2 << 6) - 1;
  v4 = v3 >> 6;
  if (v2 >= 2)
    a1 = (uint64_t **)*a1;
  if ((v4 & 0x80000000) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  LOBYTE(v5) = ~(_BYTE)v3 & 0x3F;
  LODWORD(v4) = v4 + 1;
  while (1)
  {
    v4 = (v4 - 1);
    v5 = (unint64_t)a1[v4] & (0xFFFFFFFFFFFFFFFFLL >> v5);
    if (v5)
      break;
    if ((int)v4 <= 0)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return (__clz(v5) | (v4 << 6)) ^ 0x3F;
}

BOOL NSISLinExpIsConstant(uint64_t a1)
{
  return *(_DWORD *)(a1 + 4) == 0;
}

uint64_t NSISObjectTableDelete(int32x2_t *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  unint64_t v7;
  unsigned int v8;
  __int32 v9;
  _QWORD *v10;
  int32x2_t v12;
  _QWORD *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  _QWORD *v17;

  v2 = a1[2].u32[0];
  if (a1[1].i32[0])
    v3 = (_DWORD)v2 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    v7 = 73244475 * ((73244475 * (a2 ^ (a2 >> 16))) ^ ((73244475 * (a2 ^ (a2 >> 16))) >> 16));
    v8 = (v7 ^ (v7 >> 16)) % v2;
    v9 = a1[2].i32[0];
    while (1)
    {
      v10 = (_QWORD *)(*(_QWORD *)a1 + 16 * v8);
      v4 = v10[1];
      if (!v4)
        return v4;
      if (v4 != -1 && *v10 == a2)
        break;
      if (v8 + 1 < v2)
        ++v8;
      else
        v8 = 0;
      if (!--v9)
        return 0;
    }
    if (v8 == -1)
      return 0;
    *v10 = 0;
    v10[1] = -1;
    v12 = vadd_s32(a1[1], (int32x2_t)0x1FFFFFFFFLL);
    a1[1] = v12;
    v13 = (_QWORD *)*a1;
    if (v8 + 1 < v2)
      v14 = v8 + 1;
    else
      v14 = 0;
    if (v13[2 * v14 + 1])
    {
      v15 = v12.i32[0];
      if (v12.i32[0])
      {
LABEL_23:
        v16 = a1[2].u32[0];
        if (v16 >= 0x40 && v15 < v16 >> 3)
          object_table_rehash((uint64_t)a1, -1);
        goto LABEL_31;
      }
    }
    else
    {
      do
      {
        --a1[1].i32[1];
        v17 = &v13[2 * v8];
        if (!v8)
          v8 = v2;
        --v8;
        *v17 = 0;
        v17[1] = 0;
        v13 = (_QWORD *)*a1;
      }
      while (*(_QWORD *)(*(_QWORD *)a1 + 16 * v8 + 8) == -1);
      v15 = a1[1].u32[0];
      if (v15)
        goto LABEL_23;
    }
    free(v13);
    *(_OWORD *)a1->i8 = cleared_object_table;
    a1[2] = (int32x2_t)0x500000000;
LABEL_31:

    return v4;
  }
  return 0;
}

void NSISObjectTableInsert(_DWORD *a1, void *a2, void *a3)
{
  unsigned int v6;
  int v7;
  void *v8;
  id v9;
  id v10;

  if (a1)
  {
    v6 = a1[2];
    v7 = a1[3];
    if (v7 + v6 >= (3 * a1[4]) >> 2)
      object_table_rehash((uint64_t)a1, v6 >= 4 * v7);
    v8 = (void *)object_table_insert_and_return_old_value_if_replaced((uint64_t)a1, (unint64_t)a2, (unint64_t)a3);
    v9 = a3;
    if (v8)

    else
      v10 = a2;
  }
}

void object_table_rehash(uint64_t a1, int a2)
{
  unint64_t *v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  unint64_t *v11;

  if (a1)
  {
    v3 = *(unint64_t **)a1;
    v4 = *(unsigned int *)(a1 + 16);
    if (a2 == -1)
    {
      v7 = *(_DWORD *)(a1 + 20);
      if (v7 >= 6)
        *(_DWORD *)(a1 + 20) = --v7;
      v8 = 1 << v7;
      v9 = v8 - 1;
      v10 = v8 - ((v8 - 1) & (v4 >> 1));
      if ((v9 & (v4 >> 1)) == 0)
        v10 = 0;
      v5 = v10 + (v4 >> 1);
      *(_DWORD *)(a1 + 16) = v5;
    }
    else
    {
      v5 = *(_DWORD *)(a1 + 16);
      if (a2 == 1)
      {
        v6 = *(_DWORD *)(a1 + 20);
        v5 = v4 + (1 << v6);
        *(_DWORD *)(a1 + 16) = v5;
        if (v5 == 8 << v6)
          *(_DWORD *)(a1 + 20) = v6 + 1;
      }
    }
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)a1 = malloc_type_calloc(v5, 0x10uLL, 0x80040803F642BuLL);
    if ((_DWORD)v4)
    {
      v11 = v3 + 1;
      do
      {
        if (*v11 + 1 >= 2)
          object_table_insert_and_return_old_value_if_replaced(a1, *(v11 - 1), *v11);
        v11 += 2;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }
}

unint64_t object_table_insert_and_return_old_value_if_replaced(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;

  v6 = *(unsigned int *)(a1 + 16);
  v7 = 73244475 * ((73244475 * (a2 ^ (a2 >> 16))) ^ ((73244475 * (a2 ^ (a2 >> 16))) >> 16));
  v8 = (v7 ^ (v7 >> 16)) % v6;
  while (1)
  {
    v9 = (unint64_t *)(*(_QWORD *)a1 + 16 * v8);
    v10 = v9[1];
    if (!v10)
      break;
    if (v10 == -1)
    {
      --*(_DWORD *)(a1 + 12);
      break;
    }
    v11 = v8;
    if ((objc_msgSend((id)a2, "isEqual:", *v9) & 1) != 0)
    {
      v12 = (unint64_t *)(*(_QWORD *)a1 + 16 * v11);
      *v12 = a2;
      v12[1] = a3;
      return v10;
    }
    if ((int)v11 + 1 < v6)
      v8 = v11 + 1;
    else
      v8 = 0;
  }
  *v9 = a2;
  v9[1] = a3;
  v10 = 0;
  ++*(_DWORD *)(a1 + 8);
  return v10;
}

void ConstraintDidPerformInitialSetup(uint64_t a1)
{
  unint64_t v2;

  v2 = *(_DWORD *)(a1 + 66) & 0xFFFFFFBF | ((unint64_t)*(unsigned __int16 *)(a1 + 70) << 32);
  *(_DWORD *)(a1 + 66) &= ~0x40u;
  *(_WORD *)(a1 + 70) = WORD2(v2);
  if (_NSConstraintBasedLayoutTrackAllocation())
    objc_setAssociatedObject((id)a1, CFSTR("kSavedConstraintAllocationStackKey"), (id)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"), (void *)0x303);
}

BOOL _NSConstraintBasedLayoutTrackAllocation()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutTrackAllocation"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutTrackAllocationComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t ResolveConstraintArguments(void **a1, uint64_t *a2, void **a3, uint64_t *a4, double a5)
{
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t result;
  BOOL v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;
  char v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  if (ResolveConstraintArguments_once != -1)
    dispatch_once(&ResolveConstraintArguments_once, &__block_literal_global_630);
  v10 = *a1;
  v11 = *a2;
  v12 = *a3;
  v13 = *a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = objc_msgSend(v10, "nsli_isLegalConstraintItem");
  }
  else
  {
    v14 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    result = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    result = objc_msgSend(v12, "nsli_isLegalConstraintItem");
  }
  else
  {
    result = 0;
  }
  v17 = a5 != 0.0 && v12 != 0;
  if (v10 && v11 <= 0x25 && ((1 << v11) & 0x3F00000001) != 0
    || v12 && v13 <= 0x25 && ((1 << v13) & 0x3F00000001) != 0)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), v10);
    v26 = CFSTR("%@: Unknown layout attribute");
    goto LABEL_63;
  }
  if (!v10)
  {
    v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Constraint must contain a first layout item"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), 0));
    goto LABEL_65;
  }
  if (v12)
    v18 = result;
  else
    v18 = 1;
  if ((v14 & v18 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), v10);
    v26 = CFSTR("%@: Constraint items must each be a view or layout guide.");
    goto LABEL_63;
  }
  if (v11 > 0x25 || ((1 << v11) & 0x3F00000181) == 0)
  {
    v20 = ResolveConstraintArguments_newExceptionBehaviorLocationToConstant;
    if (!ResolveConstraintArguments_newExceptionBehaviorLocationToConstant)
      v17 = 1;
    if (v17)
    {
      v21 = 0;
      v19 = 1;
      goto LABEL_33;
    }
    v27 = (void *)MEMORY[0x1E0CB3940];
    v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), v10);
    v26 = CFSTR("%@: A multiplier of 0 or a nil second item together with a location for the first attribute creates an illegal constraint of a location equal to a constant. Location attributes must be specified in pairs.");
LABEL_63:
    v29 = v27;
LABEL_64:
    v28 = objc_msgSend(v29, "stringWithFormat:", v26, v30);
LABEL_65:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0));
  }
  v19 = 0;
  v20 = ResolveConstraintArguments_newExceptionBehaviorLocationToConstant;
  v21 = 1;
LABEL_33:
  if (v13 <= 0x25 && ((1 << v13) & 0x3F00000181) != 0)
  {
    if ((v19 & 1) == 0)
      goto LABEL_36;
LABEL_53:
    if (v20)
      v23 = 1;
    else
      v23 = v21;
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), v10);
    if ((v23 & 1) != 0 || v12)
    {
      v30 = v25;
      v26 = CFSTR("%@: Invalid pairing of layout attributes.");
    }
    else
    {
      v30 = v25;
      v26 = CFSTR("%@: A constraint cannot be made that sets a location equal to a constant. Location attributes must be specified in pairs.");
    }
    v29 = v24;
    goto LABEL_64;
  }
  if ((v19 & 1) == 0)
    goto LABEL_53;
LABEL_36:
  if (!ResolveConstraintArguments_newExceptionBehaviorLanguageDirectionDependentToAbsolute)
    return result;
  if (v11 <= 0x12 && ((1 << v11) & 0x60060) != 0)
  {
    if (v13 > 0x12)
      return result;
    v22 = 1 << v13;
    if (((1 << v13) & 0x60060) == 0)
    {
LABEL_46:
      if ((v22 & 0x6006) == 0)
        return result;
      v27 = (void *)MEMORY[0x1E0CB3940];
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSLayoutConstraint for %@"), v10);
      v26 = CFSTR("%@: A constraint cannot be made between a leading/trailing attribute and a right/left attribute. Use leading/trailing for both or neither.");
      goto LABEL_63;
    }
LABEL_44:
    if (v11 > 0xE)
      return result;
    v22 = 1 << v11;
    goto LABEL_46;
  }
  if (v13 <= 0x12 && ((1 << v13) & 0x60060) != 0)
    goto LABEL_44;
  return result;
}

uint64_t _objectiveRow_addColWithPriorityTimes(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];

  v11 = MEMORY[0x1E0C809B0];
  v16[5] = a2;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___objectiveRow_addColWithPriorityTimes_block_invoke;
  v17[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v17[4] = a1;
  v17[5] = a2;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___objectiveRow_addColWithPriorityTimes_block_invoke_2;
  v16[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v16[4] = a1;
  if ((*(_BYTE *)(a2 + 80) & 1) == 0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description(a1, a2));
  }
  v12 = *(_QWORD *)(a2 + 16);
  v13 = *(_DWORD *)(*(_QWORD *)a6 + 16);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = ___objectiveRow_rawAddCol_block_invoke;
  v19[3] = &unk_1E4A48E98;
  v19[4] = a1;
  v19[5] = v17;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = ___objectiveRow_rawAddCol_block_invoke_2;
  v18[3] = &unk_1E4A48E98;
  v18[4] = a1;
  v18[5] = v16;
  return -[NSISObjectiveLinearExpression addVar:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](v12, v13, (uint64_t)v19, (uint64_t)v18, a3, a4);
}

uint64_t ___mutuallyExclusiveConstraintsForUnsatisfiableRow_block_invoke(uint64_t a1, uint64_t a2, id **a3)
{
  uint64_t result;

  result = objc_msgSend(**a3, "markedConstraint");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  return result;
}

void sub_1A371C99C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _AssertAutoLayoutOnAllowedThreadsOnly(uint64_t a1)
{
  uint64_t result;
  __CFString *v3;
  id v4;
  id v5;
  const __CFString *v6;

  result = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((result & 1) != 0)
  {
    *(_BYTE *)(a1 + 161) = 1;
    return result;
  }
  v3 = CFSTR("This application is modifying the autolayout engine from a background thread after the engine was accessed from the main thread. This can lead to engine corruption and weird crashes.\n Stack:%@");
  if (*(_BYTE *)(a1 + 161))
    goto LABEL_10;
  v4 = *(id *)(a1 + 128);
  if (!v4)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    *(_QWORD *)(a1 + 128) = v5;
    if (*(_BYTE *)(a1 + 161))
      goto LABEL_10;
    v4 = v5;
  }
  result = objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  if (v4 == (id)result)
    return result;
  if (!*(_BYTE *)(a1 + 161))
    v3 = CFSTR("This application is modifying the autolayout engine from more than a single background thread, which can lead to engine corruption and weird crashes. \n Stack:%@");
LABEL_10:
  NSLog(&v3->isa, objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols"));
  result = _NSConstraintBasedLayoutAllowBGThreads();
  if ((result & 1) == 0)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "name"), "isEqualToString:", CFSTR("WebThread"));
    if ((result & 1) == 0)
    {
      result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.mail"));
      if ((result & 1) == 0)
      {
        if (*(_BYTE *)(a1 + 161))
          v6 = CFSTR("Modifications to the layout engine must not be performed from a background thread after it has been accessed from the main thread.");
        else
          v6 = CFSTR("Modifications to the layout engine must not be performed from more than a single background thread.");
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0));
      }
    }
  }
  return result;
}

BOOL _NSConstraintBasedLayoutDeferOptimization()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutDeferOptimization"), 1, (unsigned __int8 *)&sNSConstraintBasedLayoutDeferOptimizationComputedValue, _NSTrueAppConfigPredicate);
}

void sub_1A371D5A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t NSISLinExpReplaceVarWithVarPlusDelta(uint64_t a1, unsigned int a2, double a3)
{
  double v4;

  v4 = NSISLinExpCoefficientForVar(a1, a2) * a3;
  return NSISLinExpIncrementConstant(a1, v4);
}

uint64_t ___objectiveRow_rawAddCol_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t *___objectiveRow_addColWithPriorityTimes_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

unsigned __int16 *_objectiveRow_addRowBodyWithPriorityTimes(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  unsigned __int16 *v12;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];

  v11 = MEMORY[0x1E0C809B0];
  v15[5] = a2;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___objectiveRow_addRowBodyWithPriorityTimes_block_invoke;
  v16[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v16[4] = a1;
  v16[5] = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___objectiveRow_addRowBodyWithPriorityTimes_block_invoke_2;
  v15[3] = &__block_descriptor_48_e16_v24__0_________8ls32l8;
  v15[4] = a1;
  if ((*(_BYTE *)(a2 + 80) & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISObjectiveLinearExpression *_objectiveRow_rawBody(NSISRow)"), CFSTR("NSISEngine_Row.h"), 418, CFSTR("Tried accessing the objective linear expression for regular row:%@"), _row_description(a1, a2));
  }
  v12 = *(unsigned __int16 **)(a2 + 16);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = ___objectiveRow_rawAddRowBody_block_invoke;
  v18[3] = &unk_1E4A48E98;
  v18[4] = a1;
  v18[5] = v16;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = ___objectiveRow_rawAddRowBody_block_invoke_2;
  v17[3] = &unk_1E4A48E98;
  v17[4] = a1;
  v17[5] = v15;
  return -[NSISObjectiveLinearExpression addExpression:priority:times:processVarNewToReceiver:processVarDroppedFromReceiver:](v12, (unsigned __int16 *)(a6 + 16), (uint64_t)v18, (uint64_t)v17, a3, a4);
}

void sub_1A371EE10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t _col_enumerateRowsUntil(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t Next;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;

  v5 = (uint64_t **)(a2 + 8);
  Next = NSBitSetFindNext((uint64_t **)(a2 + 8), 0);
  if (Next == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v8 = NSBitSetFindNext((uint64_t **)(a2 + 24), 0);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      for (i = v8; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext((uint64_t **)(a2 + 24), i + 1))
      {
        v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * (((i + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)i + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)i + 0x40000000) & 0xBFFFFFFF) % 0x17));
        if ((_DWORD)v9)
          break;
      }
    }
  }
  else
  {
    v7 = Next;
    while (((*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a3 + 16))(a3, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * ((v7 >> 30) & 1)) + 8 * ((v7 & 0xBFFFFFFF) / 0x17))+ 88 * ((v7 & 0xBFFFFFFF) % 0x17)) & 1) == 0)
    {
      v7 = NSBitSetFindNext(v5, v7 + 1);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_5;
    }
    return 1;
  }
  return v9;
}

void *_mutuallyExclusiveConstraintsForUnsatisfiableRow(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, unsigned int);
  void *v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___mutuallyExclusiveConstraintsForUnsatisfiableRow_block_invoke;
  v9[3] = &unk_1E4A48B78;
  v9[4] = v4;
  v5 = (unsigned __int16 *)(a2 + 16);
  if ((*(_BYTE *)(a2 + 80) & 1) != 0)
  {
    v6 = *(_QWORD *)v5;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = ___row_enumerateCols_block_invoke;
    v13 = &unk_1E4A48E98;
    v14 = a1;
    v15 = v9;
    -[NSISObjectiveLinearExpression enumerateVars:](v6, (uint64_t)&v10);
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = ___row_enumerateCols_block_invoke_2;
    v13 = &unk_1E4A48E98;
    v14 = a1;
    v15 = v9;
    NSISLinExpEnumerateVars(v5, (uint64_t)&v10);
  }
  v7 = objc_msgSend(**(id **)a2, "markedConstraint");
  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  return v4;
}

void NSISLinExpReplaceVarWithVarPlusDeltaTimesNewVar(unsigned __int16 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, double a6)
{
  double v10;

  v10 = NSISLinExpCoefficientForVar((uint64_t)a1, a2) * a6;
  NSISLinExpAddVarWithProcessors(a1, a3, a4, a5, v10);
}

void NSISLinExpAddVarWithProcessors(unsigned __int16 *a1, unsigned int a2, uint64_t a3, uint64_t a4, double a5)
{
  double v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  _BOOL4 v16;
  double v17;
  double *v18;
  char v19;

  v10 = fabs(a5);
  if (v10 >= INFINITY && v10 <= INFINITY)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISLinExpAddVarWithProcessors(NSISLinExp *, NSISLinExpVar, NSISFloat_t, void (^)(NSISLinExpVar), void (^)(NSISLinExpVar))"), CFSTR("NSISLinearExpression.m"), 797, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(coeff)"));
  }
  if (a5 == 0.0)
  {
    if (*(double *)&NSISEpsilon > 0.0)
      goto LABEL_23;
  }
  else if (v10 < *(double *)&NSISEpsilon)
  {
    goto LABEL_23;
  }
  v19 = 0;
  v18 = 0;
  v12 = vars_index_with_insert(a1, a2, &v19, &v18);
  v13 = *v18;
  if (COERCE_UNSIGNED_INT64(-a5) >> 63 == *(_QWORD *)v18 >> 63)
  {
    v14 = 0.0;
    if (vabdd_f64(-a5, v13) <= *(double *)&NSISEpsilon)
      goto LABEL_14;
    v15 = COERCE__INT64(-a5) - *(_QWORD *)v18;
    if (v15 < 0)
      v15 = *(_QWORD *)v18 - COERCE__INT64(-a5);
    if (v15 <= NSISMaxUlps)
      goto LABEL_14;
  }
  v14 = v13 + a5;
  if (v13 + a5 == 0.0)
LABEL_14:
    v16 = *(double *)&NSISEpsilon > 0.0;
  else
    v16 = fabs(v14) < *(double *)&NSISEpsilon;
  if (v16)
    v17 = 0.0;
  else
    v17 = v14;
  *v18 = v17;
  if (v19)
    (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a2);
  if (v17 == 0.0)
  {
    vars_remove_idx(a1, v12);
    (*(void (**)(uint64_t, _QWORD))(a4 + 16))(a4, a2);
  }
LABEL_23:
  expression_shrink_if_possible((char *)a1);
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_3(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

void NSISSparseVectorMapDestroy(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t i;
  void **v5;

  if (*(_DWORD *)(a1 + 24))
  {
    v2 = *(unsigned int *)(a1 + 32);
    if ((_DWORD)v2)
    {
      v3 = 0;
      for (i = 0; i < v2; ++i)
      {
        v5 = (void **)(*(_QWORD *)(a1 + 16) + v3);
        if ((unint64_t)*v5 + 1 >= 2)
        {
          NSISSparseVectorMinHeapDestroy(v5);
          v2 = *(unsigned int *)(a1 + 32);
        }
        v3 += 24;
      }
    }
  }
  free(*(void **)(a1 + 16));
  NSISSparseVectorMinHeapDestroy((void **)a1);
}

void NSISObjectTableDestroy(void **a1)
{
  if (a1)
  {
    NSISObjectTableForEach((uint64_t)a1, (uint64_t)&__block_literal_global_1);
    free(*a1);
    free(a1);
  }
}

uint64_t NSISObjectTableForEach(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v5;
  unint64_t i;

  if (result)
  {
    v2 = result;
    v3 = *(unsigned int *)(result + 16);
    if ((_DWORD)v3)
    {
      v5 = 0;
      for (i = 0; i < v3; ++i)
      {
        if ((unint64_t)(*(_QWORD *)(*(_QWORD *)v2 + v5 + 8) + 1) >= 2)
        {
          result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)v2 + v5));
          v3 = *(unsigned int *)(v2 + 16);
        }
        v5 += 16;
      }
    }
  }
  return result;
}

void NSBitSetAddIndexesInRange(unsigned int *a1, unint64_t a2, uint64_t a3)
{
  char v3;
  unint64_t v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  int8x8_t v13;
  uint8x8_t v14;
  __int32 v15;
  uint8x8_t v16;
  uint64_t v17;
  int v18;
  int8x8_t v19;
  uint64_t v20;
  uint8x8_t v21;
  uint64_t v22;
  int8x8_t v23;
  uint8x8_t v24;

  if (a3)
  {
    v3 = a2;
    if (a3 == 1)
    {
      NSBitSetAddIndex(a1, a2);
    }
    else
    {
      v5 = a2 >> 6;
      v6 = a2 + a3;
      v7 = a2 + a3 - 1;
      v8 = v7 >> 6;
      v9 = a1[2];
      if (v9 <= (v7 >> 6))
      {
        _NSBitSetResize(a1, v7 >> 6);
        v9 = a1[2];
      }
      if ((v6 & 0x3F) != 0)
        v10 = ~(-1 << v6);
      else
        v10 = -1;
      v11 = a1;
      if (v9 >= 2)
        v11 = *(unsigned int **)a1;
      v12 = -1 << v3;
      if ((_DWORD)v5 == (_DWORD)v8)
      {
        v13 = (int8x8_t)(*(_QWORD *)&v11[2 * v5] | v10 & v12);
        v14 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&v11[2 * v5]);
        v14.i16[0] = vaddlv_u8(v14);
        *(int8x8_t *)&v11[2 * v5] = v13;
        v15 = v14.i32[0];
        v16 = (uint8x8_t)vcnt_s8(v13);
        v16.i16[0] = vaddlv_u8(v16);
        LODWORD(v17) = v16.i32[0] - v15;
      }
      else if (v5 > v8)
      {
        LODWORD(v17) = 0;
      }
      else
      {
        v18 = 0;
        v17 = 0;
        do
        {
          v19 = *(int8x8_t *)&v11[2 * (v5 + v18)];
          v20 = *(_QWORD *)&v19 | v12;
          v21 = (uint8x8_t)vcnt_s8(v19);
          v21.i16[0] = vaddlv_u8(v21);
          v22 = v17 - v21.u32[0];
          if ((_DWORD)v5 - (_DWORD)v8 + v18)
            v23 = (int8x8_t)-1;
          else
            v23 = (int8x8_t)(*(_QWORD *)&v19 | v10);
          if (!v18)
            v23 = (int8x8_t)v20;
          *(int8x8_t *)&v11[2 * (v5 + v18)] = v23;
          v24 = (uint8x8_t)vcnt_s8(v23);
          v24.i16[0] = vaddlv_u8(v24);
          v17 = v22 + v24.u32[0];
          ++v18;
        }
        while ((int)v5 + v18 <= v8);
      }
      a1[3] += v17;
    }
  }
}

void _table_addStorageBlock(void **a1, unint64_t *a2, unint64_t *a3, unint64_t a4, uint64_t a5, unsigned int *a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = *a2;
  v11 = *a2 + 1;
  *a2 = v11;
  v12 = *a3;
  if (v11 <= *a3)
    goto LABEL_5;
  v13 = 0x100 / a4;
  if (0x100 / a4 <= 2 * v12)
    v13 = 2 * v12;
  *a3 = v13;
  v14 = malloc_type_realloc(*a1, 8 * v13, 0xA2040E1869066uLL);
  *a1 = v14;
  if (v14)
  {
LABEL_5:
    *((_QWORD *)*a1 + v10) = malloc_type_malloc(a5 * a4, 0x8FD56ACuLL);
    if (!*((_QWORD *)*a1 + v10))
      _table_addStorageBlock_cold_1(&v15, &v16);
    NSBitSetAddIndexesInRange(a6, v10 * a4, a4);
  }
  else
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
}

void _NSBitSetResize(unsigned int *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  int8x8_t *v6;
  uint64_t v7;
  char *v8;
  int8x8_t *v9;
  unsigned int v10;
  int8x8_t v11;
  uint8x8_t v12;
  void *v13;
  void *v14;

  v3 = a1[2];
  v4 = a1[2];
  do
  {
    v5 = v4;
    v4 *= 4;
  }
  while (v5 <= a2);
  if (v5 != (_DWORD)v3)
  {
    if (v3 < 2)
    {
      v8 = (char *)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
      if (!v8)
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSBitSetResize(NSBitSet *, uint32_t)"), CFSTR("NSBitSet.m"), 96, CFSTR("Memory exhaustion. Attempted to allocate storage for %zu bits."), (unint64_t)v5 << 6);
      }
      v9 = (int8x8_t *)a1;
      if (a1[2] >= 2)
        v9 = *(int8x8_t **)a1;
      memcpy(v8, v9, 8 * v3);
    }
    else
    {
      v6 = *(int8x8_t **)a1;
      v7 = v5;
      v8 = (char *)malloc_type_realloc(*(void **)a1, 8 * v5, 0x100004000313F17uLL);
      if (!v8)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSBitSetResize(NSBitSet *, uint32_t)"), CFSTR("NSBitSet.m"), 84, CFSTR("Memory exhaustion. Attempted to grow storage from %zu to %zu bits."), v3 << 6, (unint64_t)v5 << 6);
      }
      if (v5 <= v3)
      {
        v10 = 0;
        do
        {
          v11 = *v6++;
          v12 = (uint8x8_t)vcnt_s8(v11);
          v12.i16[0] = vaddlv_u8(v12);
          v10 += v12.i32[0];
          --v7;
        }
        while (v7);
        a1[3] = v10;
      }
      else
      {
        bzero(&v8[8 * v3], 8 * (int)(v5 - v3));
      }
    }
    *(_QWORD *)a1 = v8;
    a1[2] = v5;
  }
}

double NSISObjectTableCreate()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x18uLL, 0x102004024DAA5DEuLL);
  result = *(double *)&cleared_object_table;
  *(_OWORD *)v0 = cleared_object_table;
  v0[2] = 0x500000000;
  return result;
}

BOOL _NSConstraintBasedLayoutAllowUnoptimizedReads()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutAllowUnoptimizedReads"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAllowUnoptimizedReadsComputedValue, _NSFalseAppConfigPredicate);
}

_QWORD *NSISSparseVectorMinHeapInit(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

_QWORD *NSISSparseVectorMapInit(_QWORD *result)
{
  *(_OWORD *)result = 0u;
  *((_OWORD *)result + 1) = 0u;
  result[4] = 0x500000000;
  return NSISSparseVectorMinHeapInit(result);
}

void NSISLinExpFree(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16) == *MEMORY[0x1E0C9AE50])
    free(*(void **)(a1 + 24));
}

uint64_t NSBitSetRemoveIndexes(uint64_t result, uint64_t *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  __int32 v6;
  uint64_t *v7;
  uint64_t v8;
  uint8x8_t v9;
  __int32 v10;
  int8x8_t v11;
  uint8x8_t v12;
  uint8x8_t v13;

  v2 = *(_DWORD *)(result + 8);
  v3 = *((_DWORD *)a2 + 2);
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  if ((int)v4 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = a2;
      if (v3 >= 2)
        v7 = (uint64_t *)*a2;
      v8 = ~v7[v5];
      if (v2 <= 1)
      {
        v11 = (int8x8_t)(*(_QWORD *)(result + 8 * v5) & v8);
        v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(result + 8 * v5));
        v12.i16[0] = vaddlv_u8(v12);
        v10 = v12.i32[0];
        *(int8x8_t *)(result + 8 * v5) = v11;
      }
      else
      {
        v9 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(*(_QWORD *)result + 8 * v5));
        v9.i16[0] = vaddlv_u8(v9);
        v10 = v9.i32[0];
        *(_QWORD *)(*(_QWORD *)result + 8 * v5) &= v8;
        v11 = *(int8x8_t *)(*(_QWORD *)result + 8 * v5);
      }
      v13 = (uint8x8_t)vcnt_s8(v11);
      v13.i16[0] = vaddlv_u8(v13);
      v6 = v6 - v10 + v13.i32[0];
      ++v5;
    }
    while (v4 != v5);
  }
  *(_DWORD *)(result + 12) += v6;
  return result;
}

BOOL NSLayoutConstraintIsDanglyInContainer(void *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(a2, "firstAnchor");
  v5 = (void *)objc_msgSend(a2, "secondAnchor");
  v6 = objc_msgSend(v4, "_nearestAncestorLayoutItem");
  v7 = objc_msgSend(v5, "_nearestAncestorLayoutItem");
  if (v4
    && (!v6
     || +[NSLayoutConstraint _findCommonAncestorOfItem:andItem:](NSLayoutConstraint, "_findCommonAncestorOfItem:andItem:", a1, v6) != a1))
  {
    return 1;
  }
  if (v5)
  {
    if (v7)
      return +[NSLayoutConstraint _findCommonAncestorOfItem:andItem:](NSLayoutConstraint, "_findCommonAncestorOfItem:andItem:", a1, v7) != a1;
    return 1;
  }
  return 0;
}

void *__isMaps_block_invoke()
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (result)
    result = (void *)objc_msgSend(result, "isEqualToString:", CFSTR("com.apple.Maps"));
  isMaps_isMaps = (char)result;
  return result;
}

void sub_1A37222A4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A37222C4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A3722280);
}

void _CALSDKVersionInit()
{
  if (_CALSDKVersionInit_init_once != -1)
    dispatch_once(&_CALSDKVersionInit_init_once, &__block_literal_global);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t i;
  _QWORD *v14;
  uint64_t v15;
  void *v17;
  NSDictionary *v18;
  uint64_t v20;
  uint64_t v21;
  va_list v22;
  _QWORD v23[2];
  va_list va;

  va_start(va, firstValue);
  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", commaSeparatedKeysString);
  v6 = _NSFaultInObject();
  v7 = _NSFaultInObject();
  while (1)
  {
    v23[0] = 0;
    objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v7, 0);
    objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v6, v23);
    if (!v23[0])
      break;
    objc_msgSend(v4, "addObject:");
  }

  v8 = objc_msgSend(v4, "count");
  v9 = MEMORY[0x1E0C80A78]();
  v11 = (uint64_t *)((char *)&v21 - v10);
  if (v9 >= 0x101)
    v11 = malloc_type_malloc(8 * v8, 0x400A2AC0F1uLL);
  if (v8 >= 1)
  {
    va_copy(v22, va);
    *v11 = firstValue;
    if (firstValue)
      v12 = -1;
    else
      v12 = 0;
    if (v8 != 1)
    {
      for (i = 1; i != v8; ++i)
      {
        v14 = v22;
        v22 += 8;
        v15 = *v14;
        v11[i] = v15;
        if (v12 == -1 && v15 == 0)
          v12 = i;
      }
    }
    if (v12 != -1)
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSDictionaryOfVariableBindings failed because either one of the values is nil, or there's something wrong with the way the macro is being invoked.  Cannot assign value nil for key \"%@\". Keys:%@"), objc_msgSend(v4, "objectAtIndex:"), v4);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v20, 0));
    }
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v11, v8);
  v18 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjects:forKeys:", v17, v4);

  if ((unint64_t)v8 >= 0x101)
    free(v11);
  return v18;
}

uint64_t _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(void *a1, void *a2, unsigned int a3, void *a4, double *a5)
{
  int v10;
  double v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  void *v17;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(a4, "nsli_isRTL");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((v10 & 1) != 0)
      {
        v11 = 1.0;
        result = 1;
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_31;
    v10 = 0;
  }
  v13 = objc_msgSend(a1, "_directionAbstraction");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a2)
      goto LABEL_21;
    if (a3 > 0x24)
      goto LABEL_35;
    if (((1 << a3) & 0x1500006006) != 0)
    {
      v14 = 1;
      if (v10)
        goto LABEL_22;
      goto LABEL_31;
    }
    if (((1 << a3) & 0x60060) != 0)
    {
      v14 = 0;
      if (v10)
        goto LABEL_22;
      goto LABEL_31;
    }
    if (((1 << a3) & 0x80200) == 0)
    {
LABEL_35:
      v14 = -1;
      if (v10)
        goto LABEL_22;
    }
    else
    {
LABEL_21:
      v14 = 2;
      if (v10)
        goto LABEL_22;
    }
LABEL_31:
    result = 0;
    v11 = 1.0;
    goto LABEL_32;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutXAxisAnchorResolvedDirection _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(NSLayoutAnchor * _Nonnull, id _Nullable, NSLayoutAttribute, id<NSLayoutItem> _Nullable, CGFloat * _Nullable)"), CFSTR("NSLayoutAnchor.m"), 1279, CFSTR("Incompatible anchor comparison for resolving anchor abstractions: %@ with %@"), a1, a2);
  }
  v14 = objc_msgSend(a2, "_directionAbstraction");
  if (!v10)
    goto LABEL_31;
LABEL_22:
  v16 = v13 != 1 && v14 != 1;
  v11 = -1.0;
  result = 1;
  if (v13 && v14 && !v16)
    goto LABEL_31;
LABEL_32:
  if (a5)
    *a5 = v11;
  return result;
}

BOOL _NSConstraintBasedLayoutAnchorEquivalence()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutAnchorEquivalence"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAnchorEquivalenceComputedValue, _NSFalseAppConfigPredicate);
}

unint64_t NSBitSetLastIndex(uint64_t **a1)
{
  return NSBitSetFindPrev(a1, 0x7FFFFFFFFFFFFFFFuLL);
}

uint64_t NSBitSetFindPrevRange(uint64_t **a1, unint64_t a2)
{
  uint64_t **v2;
  unint64_t Prev;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  unsigned int v9;

  v2 = a1;
  Prev = NSBitSetFindPrev(a1, a2);
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (Prev != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = Prev - 1;
    if (*((_DWORD *)v2 + 2) >= 2u)
      v2 = (uint64_t **)*v2;
    if ((v5 & 0x2000000000) == 0)
    {
      v6 = (v5 >> 6);
      for (i = v6 << 6; ; i -= 64)
      {
        v8 = 0xFFFFFFFFFFFFFFFFLL >> ~(_BYTE)v5;
        v9 = __clz(v8 & ~(unint64_t)v2[v6]) ^ 0x3F;
        if ((v8 & ~(unint64_t)v2[v6]) == 0)
          v9 = -1;
        if ((v9 & 0x80000000) == 0)
          break;
        v5 = (v5 | 0x3F) - 64;
        if (v6-- <= 0)
          return v5 + 1;
      }
      v5 = i + v9;
    }
    return v5 + 1;
  }
  return v4;
}

void sub_1A372779C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1A3727E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A37281A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _engineVar_description(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;

  if ((*(_DWORD *)(a2 + 24) & 1) != 0)
    v2 = CFSTR("rowIndex");
  else
    v2 = CFSTR("colIndex");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%3u: %@ %@:%u"), *(unsigned int *)(a2 + 16), *(_QWORD *)a2, v2, *(unsigned int *)(a2 + 20));
}

uint64_t _row_headDescription(uint64_t a1, id **a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (*a2)
    v3 = objc_msgSend(**a2, "description");
  else
    v3 = 0;
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
}

uint64_t _row_description(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((*(_BYTE *)(a2 + 80) & 1) != 0)
    v4 = objc_msgSend(*(id *)(a2 + 16), "description");
  else
    v4 = NSISLinExpDescriptionInEngine(a2 + 16, a1);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%3u: %@ == %@"), *(unsigned int *)(a2 + 8), _row_headDescription(a1, (id **)a2), v4);
}

uint64_t _col_description(uint64_t a1, uint64_t **a2)
{
  void *v3;
  uint64_t v4;
  uint64_t Next;
  unint64_t i;
  uint64_t v7;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  void *v18;
  uint64_t v19;

  if (!a2 || !*a2)
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tstorage:%@"), a2, v10, v11, v12);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v16 = ___col_description_block_invoke;
  v17 = &unk_1E4A48798;
  v13 = (void *)v4;
  v18 = v3;
  v19 = v4;
  Next = NSBitSetFindNext(a2 + 1, 0);
  if (Next != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = Next; i != 0x7FFFFFFFFFFFFFFFLL; i = NSBitSetFindNext(a2 + 1, i + 1))
      v16((uint64_t)v15, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * ((i >> 30) & 1)) + 8 * ((i & 0xBFFFFFFF) / 0x17))+ 88 * ((i & 0xBFFFFFFF) % 0x17));
  }
  v7 = NSBitSetFindNext(a2 + 3, 0);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (j = v7; j != 0x7FFFFFFFFFFFFFFFLL; j = NSBitSetFindNext(a2 + 3, j + 1))
      v16((uint64_t)v15, a1, *(_QWORD *)(*(_QWORD *)(a1 + 232 + 40 * (((j + 0x40000000) >> 30) & 1))+ 8 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) / 0x17uLL))+ 88 * ((((_DWORD)j + 0x40000000) & 0xBFFFFFFF) % 0x17));
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%3u: %@ == rowIndexes:(%@) rowHeads:(%@)"), *((unsigned int *)*a2 + 5), objc_msgSend((id)**a2, "description"), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")), objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
}

uint64_t ___col_description_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a3 + 8)));
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", _row_headDescription(a2, (id **)a3));
}

void sub_1A372A200(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A372A220(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A372A1D8);
}

void sub_1A372A500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A372AA1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A372ABA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A372ACE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A372BDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A372CFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A372DB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1A372DE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A372E140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void ___row_addColWithCoefficient_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (unsigned int *)(a3 + 24);
  else
    v5 = (unsigned int *)(a3 + 8);
  NSBitSetAddIndex(v5, v4);
}

uint64_t *___row_addColWithCoefficient_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___row_rawAddCol_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t ___row_rawAddCol_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

uint64_t ___row_rawReplaceColWithColPlusDeltaTimesNewCol_block_invoke_4(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

_QWORD *___fallbackMarkerForConstraintToBreakInRow_block_invoke(_QWORD *result, uint64_t a2, id **a3)
{
  _QWORD *v3;
  id *v4;

  if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 40))
  {
    v3 = result;
    v4 = *a3;
    result = (_QWORD *)objc_msgSend(**a3, "markedConstraint");
    if (result)
    {
      result = *v4;
      *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t *___pivotToMakeColNewHeadOfRow_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  uint64_t *v5;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (HIWORD(v3))
    v4 = v3 - 0x40000000;
  else
    v4 = v3;
  if (HIWORD(v3))
    v5 = (uint64_t *)(a3 + 24);
  else
    v5 = (uint64_t *)(a3 + 8);
  return NSBitSetRemoveIndex(v5, v4);
}

uint64_t ___row_rawScaleByWithDroppedColProcessor_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 192) + 8 * (a2 >> 6));
  v5 = v4 + 32 * (a2 & 0x3F);
  if ((*(_BYTE *)(v5 + 24) & 1) != 0)
  {
    v7 = 32 * (a2 & 0x3F);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSISCol _engineVar_col(NSISEngineVar)"), CFSTR("NSISEngine_EngineVar.h"), 121, CFSTR("Tried accessing the col index for a variable that is a row head:%@"), *(_QWORD *)(v4 + v7));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(v5 + 8));
}

id _NSLayoutRuleDiffAndUpdateInParent(void *a1, id *a2, uint64_t a3)
{
  id *v4;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _NSConstraintDescriptionLayoutRuleNode *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id result;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[6];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v4 = a2;
  v56 = *MEMORY[0x1E0C80C00];
  if (a2)
    v6 = objc_msgSend(*a2, "count");
  else
    v6 = 0;
  v7 = objc_msgSend(a1, "count");
  if (v6 <= 3 * v7)
    v6 = 3 * v7;
  v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v37 = v4;
  if (v4)
    v4 = (id *)*v4;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  objc_msgSend(v9, "addObjectsFromArray:", a1);
  v11 = objc_msgSend(a1, "count");
  if (v11)
  {
    v12 = v11;
    do
    {
      objc_msgSend(v10, "addObject:", a3);
      --v12;
    }
    while (v12);
  }
  if (objc_msgSend(v9, "count"))
  {
    v13 = 0;
    v39 = v9;
    do
    {
      v14 = (void *)objc_msgSend(v9, "objectAtIndex:", v13);
      v15 = (void *)objc_msgSend(v10, "objectAtIndex:", v13);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v49;
LABEL_15:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v4);
          v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v19);
          if ((objc_msgSend((id)objc_msgSend(v20, "representedRule"), "isEqual:", v14) & 1) != 0)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
            if (v17)
              goto LABEL_15;
            goto LABEL_25;
          }
        }
        if (!v20)
          goto LABEL_25;
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = ___NSLayoutRuleRecursiveMoveNodes_block_invoke;
        v52[3] = &unk_1E4A49038;
        v52[4] = v4;
        v52[5] = v38;
        _NSLayoutRuleRecursiveApply(v20, (uint64_t)v52);
        v9 = v39;
        if ((void *)objc_msgSend(v20, "parentNode") != v15)
        {
          objc_msgSend(v20, "setParentNode:", v15);
          objc_msgSend(v15, "_addChildRuleNode:", v20);
        }
      }
      else
      {
LABEL_25:
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = -[_NSLayoutRuleNode initWithRule:]([_NSConstraintDescriptionLayoutRuleNode alloc], "initWithRule:", v14);
          v9 = v39;
        }
        else
        {
          v21 = -[_NSLayoutRuleNode initWithRule:]([_NSCompositeLayoutRuleNode alloc], "initWithRule:", v14);
          v22 = (void *)objc_msgSend(v14, "makeChildRules");
          v9 = v39;
          objc_msgSend(v39, "addObjectsFromArray:", v22);
          v23 = objc_msgSend(v22, "count");
          if (v23)
          {
            v24 = v23;
            do
            {
              objc_msgSend(v10, "addObject:", v21);
              --v24;
            }
            while (v24);
          }
        }
        if (v21)
        {
          objc_msgSend(v8, "addObject:", v21);
          objc_msgSend(v38, "addObject:", v21);
          if (v15)
          {
            -[_NSLayoutRuleNode setParentNode:](v21, "setParentNode:", v15);
            objc_msgSend(v15, "_addChildRuleNode:", v21);
          }

        }
      }
      ++v13;
    }
    while (v13 < objc_msgSend(v9, "count"));
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v4);
        v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = (void *)objc_msgSend(v29, "ownedConstraint");
          objc_msgSend(v30, "_setContainerDeclaredConstraint:", 0);
          objc_msgSend(v30, "_setAssociatedRuleNode:", 0);
          objc_msgSend(v30, "setActive:", 0);
        }
      }
      v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v26);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  result = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (result)
  {
    v32 = result;
    v33 = *(_QWORD *)v41;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(v8);
        v35 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v34);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = (void *)objc_msgSend((id)objc_msgSend(v35, "representedRule"), "makeLayoutConstraint");
          objc_msgSend(v36, "setActive:", 1);
          objc_msgSend(v36, "_setContainerDeclaredConstraint:", 1);
          objc_msgSend(v36, "_setAssociatedRuleNode:", v35);
          objc_msgSend(v35, "setOwnedConstraint:", v36);
        }
        v34 = (char *)v34 + 1;
      }
      while (v32 != v34);
      result = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      v32 = result;
    }
    while (result);
  }
  if (v37)
  {

    result = v38;
    *v37 = result;
  }
  return result;
}

uint64_t _NSLayoutRuleRemoveNodeHierarchyFromParent(void *a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _QWORD v9[5];

  if (a1)
  {
    v6 = a1;
    while ((void *)objc_msgSend(v6, "parentNode") != a2)
    {
      v6 = (void *)objc_msgSend(v6, "parentNode");
      if (!v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSLayoutRuleRemoveNodeHierarchyFromParent(_NSLayoutRuleNode *, id<_NSLayoutRuleNodeParent>, NSMutableArray<_NSLayoutRuleNode *> **)"), CFSTR("NSLayoutRuleNode.m"), 207, CFSTR("%@ is not in %@'s rule subtree"), a1, a2);
    v6 = 0;
  }
  objc_msgSend(a2, "_removeChildRuleNode:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___NSLayoutRuleRemoveNodeHierarchyFromParent_block_invoke;
  v9[3] = &__block_descriptor_40_e27_v16__0___NSLayoutRuleNode_8l;
  v9[4] = a3;
  return _NSLayoutRuleRecursiveApply(v6, (uint64_t)v9);
}

uint64_t _NSLayoutRuleRecursiveApply(void *a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  (*(void (**)(uint64_t, void *))(a2 + 16))(a2, a1);
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = (void *)objc_msgSend(a1, "_childRuleNodes", 0);
    result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (result)
    {
      v6 = result;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          _NSLayoutRuleRecursiveApply(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), a2);
        }
        while (v6 != v8);
        result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t _NSRuleNodeAppendDebugDescription(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v8 = a3;
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR(" "));
      --v8;
    }
    while (v8);
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(a1, "representedRule");
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    objc_msgSend(a2, "appendFormat:", CFSTR("<%@: '%@'"), v11, objc_msgSend(v9, "ruleDescription"));
  }
  else
  {
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    objc_msgSend(a2, "appendFormat:", CFSTR("<%@: '%p'"), v11, a1);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return objc_msgSend(a2, "appendFormat:", CFSTR(" />\n"));
  objc_msgSend(a2, "appendFormat:", CFSTR(">\n"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = (void *)objc_msgSend(a1, "_childRuleNodes");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17);
        if (!a4
          || (*(unsigned int (**)(uint64_t, _QWORD))(a4 + 16))(a4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17)))
        {
          _NSRuleNodeAppendDebugDescription(v18, a2, v5 + 4, a4);
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }
  if (v5 >= 1)
  {
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR(" "));
      --v5;
    }
    while (v5);
  }
  return objc_msgSend(a2, "appendFormat:", CFSTR("</%@>\n"), v11);
}

void _NSSetBoolAppConfig(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unsigned __int8 v3;

  if (a3)
    v3 = 3;
  else
    v3 = 2;
  atomic_store(v3, a2);
}

BOOL _NSConstraintBasedLayoutShouldIntegralize()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutShouldIntegralize"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutShouldIntegralizeComputedValue, _NSFalseAppConfigPredicate);
}

BOOL _NSConstraintBasedLayoutDebugIntegralization()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutDebugIntegralization"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugIntegralizationComputedValue, (uint64_t (*)(void))NSConstraintBasedLayoutDebugIntegralizationDefaultValueFunction);
}

BOOL _NSConstraintBasedLayoutOutputEngineTrace()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutOutputEngineTrace"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutOutputEngineTraceComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t _NSConstraintBasedLayoutSetOutputEngineTrace(uint64_t result)
{
  unsigned __int8 v1;

  if ((_DWORD)result)
    v1 = 3;
  else
    v1 = 2;
  atomic_store(v1, (unsigned __int8 *)&sNSConstraintBasedLayoutOutputEngineTraceComputedValue);
  return result;
}

BOOL _NSConstraintBasedLayoutLogEngineRebuilds()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutLogEngineRebuilds"), 0, sNSConstraintBasedLayoutLogEngineRebuildsComputedValue, _NSFalseAppConfigPredicate);
}

BOOL _NSConstraintBasedLayoutAllowBGThreads()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutAllowBGThreads"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutAllowBGThreadsComputedValue, NSConstraintBasedLayoutAllowBGThreadsDefaultValueFunction);
}

uint64_t _NSConstraintBasedLayoutSetAllowBGThreads(uint64_t result)
{
  unsigned __int8 v1;

  if ((_DWORD)result)
    v1 = 3;
  else
    v1 = 2;
  atomic_store(v1, (unsigned __int8 *)&sNSConstraintBasedLayoutAllowBGThreadsComputedValue);
  return result;
}

BOOL _NSConstraintBasedLayoutExplicitVariableObservation()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutExplicitVariableObservation"), 1, sNSConstraintBasedLayoutExplicitVariableObservationComputedValue, _NSTrueAppConfigPredicate);
}

CFMutableDictionaryRef NSISObjectToFloatDictCreate()
{
  return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &objectToFloatValueCallBacks);
}

double NSISObjectToFloatDictGetValue(const __CFDictionary *a1, const void *a2)
{
  return COERCE_DOUBLE(CFDictionaryGetValue(a1, a2));
}

void NSISObjectToFloatDictSetValue(CFMutableDictionaryRef theDict, const void *key, double a3)
{
  if (a3 == 0.0)
    CFDictionaryRemoveValue(theDict, key);
  else
    CFDictionarySetValue(theDict, key, *(const void **)&a3);
}

void NSISObjectToFloatDictEnumerateUsingBlock(const __CFDictionary *a1, void *context)
{
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)NSISObjectToFloatDictBlockApplierFunction, context);
}

uint64_t NSISObjectToFloatDictBlockApplierFunction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, double))(a3 + 16))(a3, a1, *(double *)&a2);
}

CFMutableDictionaryRef NSISObjectToFloatDictCreateCopy(CFDictionaryRef theDict)
{
  return CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theDict);
}

double NSISUnwrapExactFloat(void *a1)
{
  void *v1;
  uint64_t v2;
  double v4;
  float v5;

  v1 = (void *)objc_msgSend(a1, "objectForKey:", CFSTR("data"));
  v2 = objc_msgSend(v1, "length");
  if (v2 == 8)
  {
    v4 = 0.0;
    objc_msgSend(v1, "getBytes:length:", &v4, 8);
    return v4;
  }
  else if (v2 == 4)
  {
    v5 = 0.0;
    objc_msgSend(v1, "getBytes:length:", &v5, 4);
    return v5;
  }
  else
  {
    return 3.40282347e38;
  }
}

const __CFString *NSISWrapObject(unsigned int *a1)
{
  unsigned int *v1;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  if (!a1)
    return CFSTR("(null)");
  v1 = a1;
  if ((_NSIsNSString() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0 && (_NSIsNSNumber() & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (const __CFString *)NSISWrapVariable(v1);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot wrap object %@"), v1);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v7, 0));
    }
    v3 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v1, "constant");
    v6 = NSISWrapExactFloat(v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __NSISWrapLinearExpression_block_invoke;
    v8[3] = &unk_1E4A49060;
    v8[4] = v3;
    v8[5] = v4;
    objc_msgSend(v1, "enumerateVariablesAndCoefficients:", v8);
    return (const __CFString *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("linear_expression"), CFSTR("type"), v3, CFSTR("variables"), v4, CFSTR("coefficients"), v6, CFSTR("constant"), 0);
  }
  return (const __CFString *)v1;
}

uint64_t NSISWrapVariable(unsigned int *a1)
{
  uint64_t v2;
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;

  v2 = objc_msgSend((id)objc_msgSend(a1, "delegate"), "nsis_valueOfVariableIsUserObservable:", a1);
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1[15]);
  v8 = objc_msgSend(a1, "description");
  v9 = objc_msgSend((id)objc_msgSend(a1, "markedConstraint"), "description");
  if (v9)
    v10 = (const __CFString *)v9;
  else
    v10 = &stru_1E4A49B28;
  return objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", CFSTR("variable"), CFSTR("type"), v5, CFSTR("class"), v6, CFSTR("userObservable"), v7, CFSTR("ident"), v8, CFSTR("description"), v10, CFSTR("markedConstraintDescription"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "orientationHint")), CFSTR("orientationHint"), 0);
}

uint64_t NSISWrapExactFloat(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double v4;

  v4 = a1;
  v1 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 8);
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v4);
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("float"), CFSTR("type"), v1, CFSTR("data"), v2, CFSTR("approx"), 0);
}

void _NSISRecordOperation(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9, uint64_t a10)
{
  id v12;
  unsigned int *v13;
  unsigned int **v14;
  void *v15;
  id v16;
  unsigned int **v17;

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = (unsigned int **)&a10;
  v13 = a9;
  if (a9)
  {
    do
    {
      objc_msgSend(v12, "addObject:", NSISWrapObject(v13));
      v14 = v17++;
      v13 = *v14;
    }
    while (*v14);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", NSStringFromSelector(a2), CFSTR("command"), v12, CFSTR("args"), 0);
  v16 = (id)objc_msgSend(a1, "objectForKey:", CFSTR("Actions"));
  if (!v16)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "setObject:forKey:", v16, CFSTR("Actions"));

  }
  objc_msgSend(v16, "addObject:", v15);

}

uint64_t _NSISPlaybackOperationsOnEngine(void *a1, void *a2, int a3)
{
  NSISPlaybackOperation *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSISPlaybackOperation *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(NSISPlaybackOperation);
  v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("Actions"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        -[NSISPlaybackOperation playbackOneAction:onEngine:](v6, "playbackOneAction:onEngine:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), a1);
        if (a3)
          objc_msgSend(a1, "verifyInternalIntegrity");
      }
      v10 += v9;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  v13 = v6;
  return v10;
}

BOOL NSConstraintBasedLayoutDebugIntegralizationDefaultValueFunction()
{
  return _NSGetBoolAppConfig(CFSTR("NSConstraintBasedLayoutDebug"), 0, (unsigned __int8 *)&sNSConstraintBasedLayoutDebugComputedValue, _NSFalseAppConfigPredicate);
}

uint64_t NSConstraintBasedLayoutAllowBGThreadsDefaultValueFunction()
{
  return dyld_program_sdk_at_least() ^ 1;
}

CFStringRef ObjectToFloatValueCopyDescriptionCallBack(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%g"), a1);
}

uint64_t NSISSparseVectorMinHeapForEach(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  if (*(_DWORD *)(result + 8))
  {
    v3 = result;
    v4 = 0;
    do
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)v3 + 8 * v4++));
    while (v4 < *(unsigned int *)(v3 + 8));
  }
  return result;
}

uint64_t VerifyHeapIntegrity(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  void *v18;

  LODWORD(v1) = *(_DWORD *)(result + 8);
  if ((int)v1 >= 1)
  {
    v2 = result;
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(*(_QWORD *)v2 + 8 * v4);
      if (v3 + 1 < (int)v1)
      {
        v6 = *(_QWORD *)(*(_QWORD *)v2 + 8 * v3 + 8);
        result = NSISSparseVectorCompare(*(uint64_t **)(*(_QWORD *)v2 + 8 * v4), (uint64_t *)v6);
        if (!result)
        {
          v7 = *(_DWORD *)(v5 + 12);
          v8 = *(_DWORD *)(v6 + 12);
          v9 = v7 >= v8;
          v10 = v7 > v8;
          v11 = !v9;
          result = v10 - v11;
        }
        if (result != -1)
        {
          v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          result = objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void VerifyHeapIntegrity(NSISSparseVectorMinHeap *)"), CFSTR("NSISSparseVectorMinHeap.m"), 197, CFSTR("The value at position %d was bigger than its left child."), v4);
        }
      }
      if (v3 + 2 < *(int *)(v2 + 8))
      {
        v12 = *(_QWORD *)(*(_QWORD *)v2 + 8 * v3 + 16);
        result = NSISSparseVectorCompare((uint64_t *)v5, (uint64_t *)v12);
        if (!result)
        {
          v13 = *(_DWORD *)(v5 + 12);
          v14 = *(_DWORD *)(v12 + 12);
          v9 = v13 >= v14;
          v15 = v13 > v14;
          v16 = !v9;
          result = v15 - v16;
        }
        if (result != -1)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          result = objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void VerifyHeapIntegrity(NSISSparseVectorMinHeap *)"), CFSTR("NSISSparseVectorMinHeap.m"), 201, CFSTR("The value at position %d was bigger than its right child."), v4);
        }
      }
      ++v4;
      v1 = *(int *)(v2 + 8);
      v3 += 2;
    }
    while (v4 < v1);
  }
  return result;
}

uint64_t NSISSparseVectorDescription(unsigned __int16 *a1)
{
  void *v2;
  uint64_t v3;
  double *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, double, double);
  void *v11;
  void *v12;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __NSISSparseVectorDescription_block_invoke;
  v11 = &unk_1E4A49088;
  v12 = v2;
  v3 = a1[4];
  if (a1[4])
  {
    v4 = (double *)(*(_QWORD *)a1 + 8);
    do
    {
      v10((uint64_t)&v8, *(v4 - 1), *v4);
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  return objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@>"), v6, v8, v9);
}

void NSISLinExpAddExpressionWithProcessors(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  double v10;
  void *v11;

  v10 = fabs(a5);
  if (v10 >= INFINITY && v10 <= INFINITY)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void NSISLinExpAddExpressionWithProcessors(NSISLinExp *, NSISLinExp *, NSISFloat_t, void (^)(NSISLinExpVar), void (^)(NSISLinExpVar))"), CFSTR("NSISLinearExpression.m"), 772, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isfinite(multiplyBy)"));
  }
  NSISLinExpIncrementConstant((uint64_t)a1, *(double *)(a2 + 8) * a5);
  expression_merge(a1, (unsigned __int16 *)a2, a3, a4, a5);
}

uint64_t NSISLinExpSetConstant(uint64_t result, double a2)
{
  *(double *)(result + 8) = a2;
  return result;
}

uint64_t NSISLinExpDescription(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[6];

  v2 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%g"), *(_QWORD *)(a1 + 8));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __NSISLinExpDescription_block_invoke;
  v4[3] = &unk_1E4A49148;
  v4[4] = v2;
  v4[5] = a1;
  NSISLinExpEnumerateVars((unsigned __int16 *)a1, (uint64_t)v4);
  return v2;
}

uint64_t NSISLinExpDescriptionInEngine(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v6[7];

  v4 = objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%g"), *(_QWORD *)(a1 + 8));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __NSISLinExpDescriptionInEngine_block_invoke;
  v6[3] = &unk_1E4A49170;
  v6[4] = a2;
  v6[5] = v4;
  v6[6] = a1;
  NSISLinExpEnumerateVars((unsigned __int16 *)a1, (uint64_t)v6);
  return v4;
}

id NSISLinExpVarsArray(unsigned __int16 *a1)
{
  unsigned __int16 *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int16 *v5;
  unsigned int v6;

  v1 = a1 + 8;
  if (*((_QWORD *)a1 + 2) == *MEMORY[0x1E0C9AE50])
  {
    v1 = (unsigned __int16 *)*((_QWORD *)a1 + 3);
    v2 = *((_QWORD *)a1 + 4);
  }
  else
  {
    v2 = *a1;
  }
  v3 = *((unsigned int *)a1 + 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  if ((_DWORD)v3)
  {
    v5 = &v1[4 * v2];
    do
    {
      v6 = *(_DWORD *)v5;
      v5 += 2;
      objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
      --v3;
    }
    while (v3);
  }
  return v4;
}

uint64_t __var_handlers_for_variable_handlers_block_invoke(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "variableForEngineVarIndex:", a2));
}

uint64_t __var_handlers_for_variable_handlers_block_invoke_2(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "variableForEngineVarIndex:", a2));
}

__n128 _insertWithHashFunction(uint64_t a1, uint64_t a2, __n128 *a3, unsigned int (*a4)(uint64_t))
{
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  __n128 *v13;
  __n128 result;

  v8 = *(_DWORD *)(a1 + 24);
  v9 = *(_DWORD *)(a1 + 28);
  if (v9 + v8 >= (3 * *(_DWORD *)(a1 + 32)) >> 2)
    _hashMapRehash(a1, v8 >= 4 * v9);
  v10 = *(_DWORD *)(a1 + 32);
  v11 = a4(a2) % v10;
  v12 = *(_QWORD *)(a1 + 16);
  while (1)
  {
    v13 = (__n128 *)(v12 + 24 * v11);
    if (!v13->n128_u64[0])
      break;
    if (v13->n128_u64[0] == -1)
    {
      --*(_DWORD *)(a1 + 28);
      break;
    }
    if (v11 + 1 < v10)
      ++v11;
    else
      v11 = 0;
  }
  result = *a3;
  v13[1].n128_u64[0] = a3[1].n128_u64[0];
  *v13 = result;
  *(_DWORD *)(v12 + 24 * v11 + 12) = a2;
  ++*(_DWORD *)(a1 + 24);
  return result;
}

void _deleteWithHashFunction(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t))
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  void *v18;
  void *v19;
  void *v20;

  if (!*(_DWORD *)(a1 + 24))
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 218, CFSTR("Tried to remove a sparse vector value from an empty map which shouldn't happen."));
  }
  v6 = *(_DWORD *)(a1 + 32);
  v7 = a3(a2) % v6;
  v8 = v6;
  while (1)
  {
    v9 = *(_QWORD *)(a1 + 16);
    v10 = *(_QWORD *)(v9 + 24 * v7);
    if (v10 != -1)
    {
      if (!v10)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 227, CFSTR("Tried to remove a sparse vector value that wasn't in the map."));
        v9 = *(_QWORD *)(a1 + 16);
      }
      if (*(_DWORD *)(v9 + 24 * v7 + 12) == (_DWORD)a2)
        break;
    }
    if (v7 + 1 < v6)
      ++v7;
    else
      v7 = 0;
    if (!--v8)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _deleteWithHashFunction(NSISSparseVectorMap *, uint32_t, HASH_FUNCTION)"), CFSTR("NSISSparseVectorMap.m"), 224, CFSTR("Corrupt hash table"));
    }
  }
  NSISSparseVectorMinHeapDelete(a1, v9 + 24 * v7);
  v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v11 + 24 * v7) = -1;
  v12 = *(_DWORD *)(a1 + 28) + 1;
  v13 = *(_DWORD *)(a1 + 24) - 1;
  *(_DWORD *)(a1 + 24) = v13;
  *(_DWORD *)(a1 + 28) = v12;
  if (v7 + 1 < v6)
    v14 = v7 + 1;
  else
    v14 = 0;
  if (!*(_QWORD *)(v11 + 24 * v14))
  {
    do
    {
      --v12;
      *(_QWORD *)(v11 + 24 * v7) = 0;
      if (v7)
        v15 = v7;
      else
        v15 = v6;
      v7 = v15 - 1;
    }
    while (*(_QWORD *)(v11 + 24 * (v15 - 1)) == -1);
    *(_DWORD *)(a1 + 28) = v12;
  }
  v16 = *(_DWORD *)(a1 + 32);
  if (v16 >= 0x40 && v13 < v16 >> 3)
    _hashMapRehash(a1, -1);
}

uint64_t NSISSparseVectorMinNegativeRestrictedVariable(_DWORD *a1)
{
  void *v3;

  if (!a1[2])
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t NSISSparseVectorMinNegativeRestrictedVariable(NSISSparseVectorMap *)"), CFSTR("NSISSparseVectorMap.m"), 305, CFSTR("Peeking when the tree has no elements is undefined"));
  }
  return *(unsigned int *)(NSISSparseVectorMinHeapPeek(a1) + 12);
}

uint64_t NSISSparseVectorMapMinHeapForEach(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*(int *)(result + 8) >= 1)
  {
    v3 = result;
    v4 = 0;
    v5 = 0;
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, *(_QWORD *)(v3 + 16) + v4);
      ++v5;
      v4 += 24;
    }
    while (v5 < *(int *)(v3 + 8));
  }
  return result;
}

void sub_1A3733724(_Unwind_Exception *exception_object, int a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    v4 = v2;
    objc_exception_throw(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A3733CB0(_Unwind_Exception *exception_object, int a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    v4 = v2;
    objc_exception_throw(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _NSLayoutConstraintNumberExceedsLimit()
{
  int v0;

  v0 = _NSLayoutConstraintNumberExceedsLimit_alreadyWarned;
  if ((_NSLayoutConstraintNumberExceedsLimit_alreadyWarned & 1) == 0)
  {
    NSLog(CFSTR("%@ Break on %s to debug.  This will be logged only once.  This may break in the future."), CFSTR("This NSLayoutConstraint is being configured with a constant that exceeds internal limits.  A smaller value will be substituted, but this problem should be fixed."), "BOOL _NSLayoutConstraintNumberExceedsLimit(void)");
    _NSLayoutConstraintNumberExceedsLimit_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t AnchorEqualOrNil(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v10;

  v4 = objc_msgSend(a1, "_anchorType");
  if (v4 != objc_msgSend(a2, "_anchorType"))
    goto LABEL_9;
  v5 = objc_msgSend(a1, "_anchorType");
  if (v5 < 2)
  {
    v7 = a1 == a2;
    goto LABEL_4;
  }
  if (v5 != 2)
    return v6 & 1;
  v8 = objc_msgSend(a1, "_proxiedItem");
  if (v8 != objc_msgSend(a2, "_proxiedItem"))
  {
LABEL_9:
    v6 = 0;
    return v6 & 1;
  }
  v10 = objc_msgSend(a1, "_proxiedAttribute");
  v7 = v10 == objc_msgSend(a2, "_proxiedAttribute");
LABEL_4:
  v6 = v7;
  return v6 & 1;
}

uint64_t _NSLayoutConstraintDelegateCallFromUnknownVariable()
{
  int v0;

  v0 = _NSLayoutConstraintDelegateCallFromUnknownVariable_alreadyWarned;
  if ((_NSLayoutConstraintDelegateCallFromUnknownVariable_alreadyWarned & 1) == 0)
  {
    NSLog(CFSTR("%@ Break on %s to debug.  This will be logged only once.  This may break in the future."), CFSTR("This NSLayoutConstraint seems to be the delegate of an NSISVariable it doesn't know anything about. This is an internal Cocoa bug."), "BOOL _NSLayoutConstraintDelegateCallFromUnknownVariable(void)");
    _NSLayoutConstraintDelegateCallFromUnknownVariable_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void *NSLayoutConstraintEnumeratePiercedItems(void *a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *result;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  do
    v6 = (void *)__ldaxr(&NSLayoutConstraintEnumeratePiercedItems_sNextPiercingToken);
  while (__stlxr((unint64_t)v6 + 1, &NSLayoutConstraintEnumeratePiercedItems_sNextPiercingToken));
  v7 = (void *)objc_msgSend(a2, "firstAnchor");
  v8 = (void *)objc_msgSend(a2, "secondAnchor");
  if (objc_msgSend(v7, "_anchorType") == 2 && objc_msgSend(v8, "_anchorType") == 2)
  {
    _identifyPiercedItems(a1, (void *)objc_msgSend(v7, "_proxiedItem"), v6, a3);
    return _identifyPiercedItems(a1, (void *)objc_msgSend(v8, "_proxiedItem"), v6, a3);
  }
  else
  {
    v10 = (void *)objc_msgSend(a2, "_referencedLayoutItems");
    if (objc_msgSend(v10, "count") != 1 || (result = (void *)objc_msgSend(v10, "anyObject"), result != a1))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      result = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (result)
      {
        v11 = result;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v10);
            _identifyPiercedItems(a1, *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), v6, a3);
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          result = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v11 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

void *_identifyPiercedItems(void *result, void *a2, void *a3, uint64_t a4)
{
  void *v6;
  void *v7;

  if (a2 != result)
  {
    v6 = a2;
    v7 = result;
    result = (void *)objc_msgSend(a2, "nsli_piercingToken");
    if (result != a3)
    {
      while (1)
      {
        result = (void *)objc_msgSend(v6, "nsli_superitem");
        if (!result)
          break;
        v6 = result;
        if (result == v7)
          break;
        result = (void *)objc_msgSend(result, "nsli_piercingToken");
        if (result == a3)
          break;
        objc_msgSend(v6, "nsli_setPiercingToken:", a3);
        (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
      }
    }
  }
  return result;
}

uint64_t NSLayoutConstraintPiercedItemsInContainer(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "_referencedLayoutItems");
  if (objc_msgSend(v3, "count") == 1 && (void *)objc_msgSend(v3, "anyObject") == a1)
    return objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        if (v9 != a1 && (objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8)) & 1) == 0)
        {
          v10 = objc_msgSend(v9, "nsli_superitem");
          if (v10 && v10 != (_QWORD)a1)
          {
            v12 = (void *)v10;
            do
            {
              if ((objc_msgSend(v4, "containsObject:", v12) & 1) != 0)
                break;
              objc_msgSend(v4, "addObject:", v12);
              v13 = objc_msgSend(v12, "nsli_superitem");
              if (!v13)
                break;
              v12 = (void *)v13;
            }
            while ((void *)v13 != a1);
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v6 = v14;
    }
    while (v14);
  }
  return (uint64_t)v4;
}

uint64_t _NSRuntimeResolvedAmbiguityDetected()
{
  int v0;

  v0 = _NSRuntimeResolvedAmbiguityDetected_alreadyWarned;
  if ((_NSRuntimeResolvedAmbiguityDetected_alreadyWarned & 1) == 0)
  {
    NSLog(CFSTR("%@ Break on %s to debug.  This will be logged only once.  This may break in the future."), CFSTR("A view or layout guide was marked as having ambiguous layout at design-time.  The ambiguity was resolved before layout, but the item should still be marked 'Suppress ambiguity warnings' in interface builder in order to save the time spent checking for this.  This warning will only appear once."), "BOOL _NSRuntimeResolvedAmbiguityDetected(void)");
    _NSRuntimeResolvedAmbiguityDetected_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t _NSRuntimeAmbiguityDetected()
{
  int v0;

  v0 = _NSRuntimeAmbiguityDetected_alreadyWarned;
  if ((_NSRuntimeAmbiguityDetected_alreadyWarned & 1) == 0)
  {
    NSLog(CFSTR("%@ Break on %s to debug.  This will be logged only once.  This may break in the future."), CFSTR("A view or layout guide was marked as having ambiguous layout at design-time.  Please resolve the ambiguity by adding constraints before layout.  This can be done programmatically or in interface builder.  In the mean time, the layout for this item and anything that depends on it may not be correct.  This warning will only appear once."), "BOOL _NSRuntimeAmbiguityDetected(void)");
    _NSRuntimeAmbiguityDetected_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t _NSLayoutConstraintToNilAnchor()
{
  int v0;

  v0 = _NSLayoutConstraintToNilAnchor_alreadyWarned;
  if ((_NSLayoutConstraintToNilAnchor_alreadyWarned & 1) == 0)
  {
    NSLog(CFSTR("%@ Break on %s to debug.  This will be logged only once.  This may break in the future."), CFSTR("A constraint factory method was passed a nil layout anchor.  This is not allowed, and may cause confusing exceptions."), "BOOL _NSLayoutConstraintToNilAnchor(void)");
    _NSLayoutConstraintToNilAnchor_alreadyWarned = 1;
  }
  return v0 ^ 1u;
}

uint64_t ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(void *a1, void *a2, void *a3)
{
  return _ResolvedDirectionForAnchorAbstractionsForAnchorsInLayoutDirectionContext(a1, a2, 0, a3, 0);
}

uint64_t _NSLayoutConstraintComparableHash(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, double a9, double a10, double a11, uint64_t a12)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;

  if (a1)
    v20 = 31 * (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), "hash") + a3);
  else
    v20 = 0;
  v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10), "hash") + v20;
  v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a11), "hash");
  v23 = a4 - (v22 - v21 + 32 * v21) + 32 * (v22 - v21 + 32 * v21);
  result = a6 - (a5 - v23 + 32 * v23) + 32 * (a5 - v23 + 32 * v23);
  if (a2)
    return a12 - (31 * (a7 - result + 32 * result) + a8) + 32 * (31 * (a7 - result + 32 * result) + a8);
  return result;
}

void _NSLayoutConstraintDiffConstraints(void *a1, int a2, void *a3, int a4, _QWORD *a5, size_t *a6, _QWORD *a7, size_t *a8, _QWORD *a9, _QWORD *a10, size_t *a11, _QWORD *a12, size_t *a13, char a14)
{
  size_t v18;
  unint64_t v19;
  size_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  _QWORD *v27;
  _QWORD *v28;
  size_t v29;
  size_t v30;
  _BOOL4 v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t i;
  uint64_t j;
  void *v38;
  size_t v39;
  size_t v40;
  size_t v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  _BOOL4 v45;
  size_t v46;
  _BYTE *v47;
  uint64_t *v48;
  size_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t *v57;
  size_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  _QWORD *v63;
  size_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _BYTE v74[12];
  int v75;
  int v76;
  _BOOL4 v77;
  unint64_t v78;
  size_t *v79;
  _BOOL4 v80;
  size_t *v81;
  uint64_t v82;
  unint64_t v83;
  _BYTE *v84;
  uint64_t *v85;
  _BOOL4 v86;
  _BYTE *v87;
  unint64_t v88;
  size_t v89;
  size_t v90[3];

  v81 = a8;
  v79 = a6;
  v75 = a2;
  v76 = a4;
  v90[1] = *MEMORY[0x1E0C80C00];
  v18 = objc_msgSend(a1, "count");
  v19 = objc_msgSend(a3, "count");
  v20 = v19;
  if (v18 >= v19)
    v21 = v19;
  else
    v21 = v18;
  v78 = v21;
  v22 = 8 * v18;
  v77 = 8 * v18 > 0x1000;
  if (8 * v18 <= 0x1000)
  {
    if (v18)
    {
      MEMORY[0x1E0C80A78]();
      v23 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero(v23, 8 * v18);
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = malloc_type_malloc(8 * v18, 0x80040B8603338uLL);
  }
  v24 = 8 * v20;
  v86 = 8 * v20 > 0x1000;
  if (8 * v20 > 0x1000)
  {
    v25 = malloc_type_malloc(8 * v20, 0x80040B8603338uLL);
    if (!v18)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v20)
  {
    MEMORY[0x1E0C80A78]();
    v25 = &v74[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
    bzero(v25, 8 * v20);
    if (!v18)
      goto LABEL_15;
    goto LABEL_14;
  }
  v25 = 0;
  if (v18)
LABEL_14:
    objc_msgSend(a1, "getObjects:range:", v23, 0, v18);
LABEL_15:
  if (v20)
    objc_msgSend(a3, "getObjects:range:", v25, 0, v20);
  v89 = 0;
  v90[0] = 0;
  v88 = 0;
  v82 = 8 * v20;
  v83 = 8 * v18;
  if ((a14 & 1) != 0)
  {
    v90[0] = v18;
    if (v22 <= 0x1000)
    {
      if (v18)
      {
        MEMORY[0x1E0C80A78]();
        v26 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v26, 8 * v18);
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
    }
    v89 = v20;
    if (v24 <= 0x1000)
    {
      if (v20)
      {
        MEMORY[0x1E0C80A78]();
        v87 = &v74[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v87, 8 * v20);
        if (!v18)
          goto LABEL_46;
      }
      else
      {
        v87 = 0;
        if (!v18)
          goto LABEL_46;
      }
    }
    else
    {
      v87 = malloc_type_malloc(8 * v20, 0x100004000313F17uLL);
      if (!v18)
        goto LABEL_46;
    }
    for (i = 0; i != v18; ++i)
      *(_QWORD *)&v26[8 * i] = i;
LABEL_46:
    v85 = (uint64_t *)v26;
    if (v20)
    {
      for (j = 0; j != v20; ++j)
      {
        *(_QWORD *)&v87[8 * j] = j;
        v38 = *(void **)&v25[8 * j];
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v38 = (void *)objc_msgSend(v38, "_constraintValueCopy");
        *(_QWORD *)&v25[8 * j] = v38;
      }
      v39 = 0;
      v84 = 0;
      v34 = 0;
      v80 = 0;
      v40 = v18;
      v41 = v20;
    }
    else
    {
      v39 = 0;
      v41 = 0;
      v84 = 0;
      v34 = 0;
      v80 = 0;
      v40 = v18;
    }
LABEL_77:
    v45 = v77;
    goto LABEL_78;
  }
  if (v18 != v20)
  {
LABEL_28:
    if (v22 <= 0x1000)
    {
      if (v18)
      {
        MEMORY[0x1E0C80A78]();
        v35 = &v74[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v35, 8 * v18);
      }
      else
      {
        v35 = 0;
      }
    }
    else
    {
      v35 = malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
    }
    if (v24 <= 0x1000)
    {
      if (v20)
      {
        MEMORY[0x1E0C80A78]();
        v87 = &v74[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v87, 8 * v20);
      }
      else
      {
        v87 = 0;
      }
    }
    else
    {
      v87 = malloc_type_malloc(8 * v20, 0x100004000313F17uLL);
    }
    v46 = 8 * v78;
    v80 = 8 * v78 > 0x1000;
    v85 = (uint64_t *)v35;
    if (8 * v78 <= 0x1000)
    {
      if (v78)
      {
        MEMORY[0x1E0C80A78]();
        v47 = &v74[-((v46 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v47, v46);
        MEMORY[0x1E0C80A78]();
        v34 = (uint64_t *)v47;
        bzero(v47, v46);
      }
      else
      {
        v47 = 0;
        v34 = 0;
      }
    }
    else
    {
      v47 = malloc_type_malloc(8 * v78, 0x100004000313F17uLL);
      v34 = (uint64_t *)malloc_type_malloc(v46, 0x100004000313F17uLL);
    }
    v84 = v47;
    _NSLayoutConstraintSortDiff((uint64_t)v23, v18, v75, (uint64_t)v25, v20, v76, (uint64_t)v85, v90, (uint64_t)v87, &v89, (uint64_t)v47, (uint64_t)v34, &v88);
    v41 = v89;
    if (v89 > v20)
    {
      v70 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)"), CFSTR("NSLayoutConstraintDiff.m"), 195, CFSTR("_NSLayoutConstraintSortDiff post-condition"));
    }
    v40 = v90[0];
    if (v90[0] > v18)
    {
      v71 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)"), CFSTR("NSLayoutConstraintDiff.m"), 196, CFSTR("_NSLayoutConstraintSortDiff post-condition"));
    }
    v39 = v88;
    if (v88 > v78)
    {
      v78 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)");
      objc_msgSend((id)v78, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("NSLayoutConstraintDiff.m"), 197, CFSTR("_NSLayoutConstraintSortDiff post-condition"));
    }
    if (v39 > v18)
    {
      v73 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSLayoutConstraintDiffConstraints(NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull, BOOL, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, id<_NSLayoutConstraintComparable> * _Nullable, NSUInteger * _Nullable, BOOL)"), CFSTR("NSLayoutConstraintDiff.m"), 198, CFSTR("_NSLayoutConstraintSortDiff post-condition"));
    }
    goto LABEL_77;
  }
  if (v18)
  {
    v27 = v23;
    v28 = v25;
    v29 = v18;
    while (*v27 == *v28)
    {
      ++v28;
      ++v27;
      if (!--v29)
        goto LABEL_25;
    }
    goto LABEL_28;
  }
LABEL_25:
  v88 = v78;
  v30 = 8 * v78;
  v31 = 8 * v78 > 0x1000;
  if (8 * v78 <= 0x1000)
  {
    if (!v78)
    {
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v84 = 0;
      v85 = 0;
      v45 = 0;
      v87 = 0;
      v86 = 0;
      v34 = 0;
      v80 = 0;
      goto LABEL_78;
    }
    v80 = 8 * v78 > 0x1000;
    MEMORY[0x1E0C80A78]();
    v42 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
    v84 = &v74[-v42];
    bzero(&v74[-v42], v30);
    MEMORY[0x1E0C80A78]();
    v34 = (uint64_t *)&v74[-v42];
    bzero(&v74[-v42], v30);
    v33 = v78;
  }
  else
  {
    v84 = malloc_type_malloc(8 * v78, 0x100004000313F17uLL);
    v32 = (uint64_t *)malloc_type_malloc(v30, 0x100004000313F17uLL);
    v33 = v78;
    v34 = v32;
    if (!v78)
    {
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v85 = 0;
      v45 = 0;
      v87 = 0;
      v86 = 0;
      v80 = 1;
      goto LABEL_78;
    }
    v80 = v31;
  }
  v43 = 0;
  v44 = v84;
  do
  {
    *(_QWORD *)&v44[8 * v43] = v43;
    v34[v43] = v43;
    ++v43;
  }
  while (v33 != v43);
  v40 = 0;
  v41 = 0;
  v85 = 0;
  v45 = 0;
  v87 = 0;
  v86 = 0;
  v39 = v33;
LABEL_78:
  if (v79)
  {
    *v79 = v41;
    if (a5)
    {
      if (v41)
      {
        v48 = (uint64_t *)v87;
        v49 = v41;
        do
        {
          v50 = *v48++;
          *a5++ = *(_QWORD *)&v25[8 * v50];
          --v49;
        }
        while (v49);
      }
    }
  }
  if (v81)
  {
    *v81 = v40;
    if (a7)
    {
      if (v40)
      {
        v51 = v85;
        do
        {
          v52 = *v51++;
          *a7++ = *(_QWORD *)&v23[8 * v52];
          --v40;
        }
        while (v40);
      }
    }
  }
  v53 = (uint64_t *)v84;
  if (a11)
  {
    v54 = a9;
    *a11 = v39;
    if (a9)
    {
      v55 = a10;
      if (a10)
      {
        if (v39)
        {
          v56 = v53;
          v57 = v34;
          v58 = v39;
          do
          {
            v59 = *v56++;
            *v54++ = *(_QWORD *)&v23[8 * v59];
            v60 = *v57++;
            *v55++ = *(_QWORD *)&v25[8 * v60];
            --v58;
          }
          while (v58);
        }
      }
    }
  }
  v61 = v82;
  if (a13)
  {
    *a13 = v20;
    if (a12)
    {
      if (v39)
      {
        v62 = v53;
        v63 = a12;
        v64 = v39;
        do
        {
          v65 = *v62++;
          *v63++ = *(_QWORD *)&v23[8 * v65];
          --v64;
        }
        while (v64);
      }
      if (v41)
      {
        v66 = &a12[v39];
        v67 = (uint64_t *)v87;
        do
        {
          v68 = *v67++;
          *v66++ = *(_QWORD *)&v25[8 * v68];
          --v41;
        }
        while (v41);
      }
    }
  }
  if (v83 > 0x1000)
    free(v23);
  v69 = v80;
  if (v61 > 0x1000)
    free(v25);
  if (v45)
    free(v85);
  if (v86)
    free(v87);
  if (v69)
  {
    free(v53);
    free(v34);
  }
}

void _NSLayoutConstraintSortDiff(uint64_t a1, size_t a2, char a3, uint64_t a4, size_t a5, char a6, uint64_t a7, size_t *a8, uint64_t a9, size_t *a10, uint64_t a11, uint64_t a12, _QWORD *a13)
{
  size_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  size_t v29;
  size_t v30;
  size_t v31;
  _QWORD *v32;
  char *v33;
  uint64_t v34;
  size_t v35;
  unint64_t v36;
  size_t v37;
  size_t v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  size_t *v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  size_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[6];
  _QWORD __compar[8];

  v45 = a8;
  v47 = a7;
  v51 = a1;
  v52 = a4;
  __compar[6] = *MEMORY[0x1E0C80C00];
  v17 = 8 * a2;
  if (8 * a2 <= 0x1000)
  {
    if (a2)
    {
      MEMORY[0x1E0C80A78]();
      v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v18, v17);
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    a1 = (uint64_t)malloc_type_malloc(8 * a2, 0x100004000313F17uLL);
    v18 = (char *)a1;
  }
  if (8 * a5 <= 0x1000)
  {
    if (a5)
    {
      MEMORY[0x1E0C80A78]();
      v19 = (char *)&v43 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v19, 8 * a5);
      if (!a2)
        goto LABEL_15;
    }
    else
    {
      v19 = 0;
      if (!a2)
        goto LABEL_15;
    }
  }
  else
  {
    a1 = (uint64_t)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
    v19 = (char *)a1;
    if (!a2)
      goto LABEL_15;
  }
  v20 = 0;
  do
  {
    *(_QWORD *)&v18[8 * v20] = v20;
    ++v20;
  }
  while (a2 != v20);
LABEL_15:
  v43 = 8 * a5;
  v44 = v17;
  if (a5)
  {
    v21 = 0;
    do
    {
      *(_QWORD *)&v19[8 * v21] = v21;
      ++v21;
    }
    while (a5 != v21);
  }
  v22 = MEMORY[0x1E0C809B0];
  if ((a3 & 1) == 0)
  {
    __compar[0] = MEMORY[0x1E0C809B0];
    __compar[1] = 3221225472;
    __compar[2] = ___NSLayoutConstraintSortDiff_block_invoke;
    __compar[3] = &unk_1E4A495C8;
    __compar[4] = &__block_literal_global_8;
    __compar[5] = v51;
    qsort_b(v18, a2, 8uLL, __compar);
  }
  if ((a6 & 1) == 0)
  {
    v53[0] = v22;
    v53[1] = 3221225472;
    v53[2] = ___NSLayoutConstraintSortDiff_block_invoke_2;
    v53[3] = &unk_1E4A495C8;
    v53[4] = &__block_literal_global_8;
    v53[5] = v52;
    qsort_b(v19, a5, 8uLL, v53);
  }
  v23 = 0;
  v46 = a9;
  v24 = 0;
  if (a2)
  {
    v48 = 0;
    v49 = 0;
    v25 = 0;
    if (a5)
    {
      v25 = 0;
      v48 = 0;
      v49 = 0;
      v24 = 0;
      v23 = 0;
      v50 = a12;
      do
      {
        v26 = *(_QWORD *)&v18[8 * v23];
        v27 = *(_QWORD *)&v19[8 * v24];
        a1 = ___NSLayoutConstraintDiffConstraints_block_invoke(a1, *(void **)(v51 + 8 * v26), *(void **)(v52 + 8 * v27));
        if ((unint64_t)(a1 + 1) >= 3)
        {
          if (a1 == 2)
          {
            v29 = v48;
            *(_QWORD *)(v46 + 8 * v48) = v27;
            ++v24;
            v48 = v29 + 1;
          }
          else if (a1 == -2)
          {
            v28 = v49;
            *(_QWORD *)(v47 + 8 * v49) = v26;
            v49 = v28 + 1;
            ++v23;
          }
        }
        else
        {
          *(_QWORD *)(a11 + 8 * v25) = v26;
          *(_QWORD *)(v50 + 8 * v25++) = v27;
          ++v23;
          ++v24;
        }
      }
      while (v23 < a2 && v24 < a5);
    }
  }
  else
  {
    v48 = 0;
    v49 = 0;
    v25 = 0;
  }
  v30 = a2 - v23;
  if (a2 <= v23)
  {
    v36 = v43;
    v35 = v49;
  }
  else
  {
    v31 = v49 + a2 - v23;
    v32 = (_QWORD *)(v47 + 8 * v49);
    v33 = &v18[8 * v23];
    do
    {
      v34 = *(_QWORD *)v33;
      v33 += 8;
      *v32++ = v34;
      --v30;
    }
    while (v30);
    v35 = v31;
    v36 = v43;
  }
  v37 = v48;
  v38 = a5 - v24;
  if (a5 > v24)
  {
    v39 = (_QWORD *)(v46 + 8 * v48);
    v40 = &v19[8 * v24];
    do
    {
      v41 = *(_QWORD *)v40;
      v40 += 8;
      *v39++ = v41;
      --v38;
    }
    while (v38);
    v37 = v37 + a5 - v24;
  }
  if (v44 > 0x1000)
    free(v18);
  if (v36 > 0x1000)
    free(v19);
  if (v37 + v25 != a5)
  {
    v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  }
  *v45 = v35;
  *a10 = v37;
  *a13 = v25;
}

void _NSLayoutConstraintDiffConstraintsReturnNSArrays(void *a1, int a2, void *a3, int a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, char a10)
{
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _BYTE *v21;
  size_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _BYTE v28[4];
  int v29;
  void *v30;
  int v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _BYTE *v35;
  size_t v36;
  size_t v37;
  size_t v38;
  size_t v39[2];

  v34 = a8;
  v31 = a4;
  v29 = a2;
  v39[1] = *MEMORY[0x1E0C80C00];
  v15 = objc_msgSend(a1, "count");
  v30 = a3;
  v16 = objc_msgSend(a3, "count");
  v17 = v16;
  if (v15 >= v16)
    v18 = v16;
  else
    v18 = v15;
  v39[0] = 0;
  v19 = 8 * v15;
  if (8 * v15 <= 0x1000)
  {
    if (v15)
    {
      MEMORY[0x1E0C80A78]();
      v35 = &v28[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero(v35, 8 * v15);
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = malloc_type_malloc(8 * v15, 0x80040B8603338uLL);
  }
  v38 = 0;
  v20 = 8 * v17;
  if (8 * v17 <= 0x1000)
  {
    if (v17)
    {
      MEMORY[0x1E0C80A78]();
      v21 = &v28[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero(v21, 8 * v17);
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
  }
  v37 = 0;
  v22 = 8 * v18;
  v32 = a5;
  v33 = a7;
  if (8 * v18 <= 0x1000)
  {
    v23 = a6;
    if (v18)
    {
      MEMORY[0x1E0C80A78]();
      v18 = (unint64_t)&v28[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero((void *)v18, v22);
      MEMORY[0x1E0C80A78]();
      v24 = (_QWORD *)v18;
      bzero((void *)v18, v22);
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v23 = a6;
    v18 = (unint64_t)malloc_type_malloc(8 * v18, 0x80040B8603338uLL);
    v24 = malloc_type_malloc(v22, 0x80040B8603338uLL);
  }
  v36 = 0;
  if (v20 <= 0x1000)
  {
    if (v17)
    {
      MEMORY[0x1E0C80A78]();
      v17 = (unint64_t)&v28[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
      bzero((void *)v17, v20);
    }
  }
  else
  {
    v17 = (unint64_t)malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
  }
  _NSLayoutConstraintDiffConstraints(a1, v29, v30, v31, v21, &v38, v35, v39, (_QWORD *)v18, v24, &v37, (_QWORD *)v17, &v36, a10);
  v25 = v32;
  if (v32)
    *v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, v38);
  if (v23)
    *v23 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, v39[0]);
  v26 = v33;
  if (v33)
    *v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, v37);
  v27 = v34;
  if (v34)
    *v27 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, v37);
  if (a9)
    *a9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, v36);
  if (v19 > 0x1000)
    free(v35);
  if (v20 > 0x1000)
    free(v21);
  if (v22 > 0x1000)
  {
    free((void *)v18);
    free(v24);
  }
  if (v20 > 0x1000)
    free((void *)v17);
}

void **_NSLayoutConstraintApplyDiffWithCounterparts(void **result, void **a2, uint64_t a3)
{
  uint64_t v3;
  void **v5;

  if (a3)
  {
    v3 = a3;
    v5 = result;
    do
    {
      result = (void **)*v5;
      if (*v5 != *a2)
        result = (void **)objc_msgSend(result, "_setMutablePropertiesFromConstraint:");
      ++a2;
      ++v5;
      --v3;
    }
    while (v3);
  }
  return result;
}

unint64_t _NSLayoutConstraintApplyDiffWithCounterpartsNSArrays(void *a1, void *a2)
{
  uint64_t v4;
  unint64_t result;
  unint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = objc_msgSend(a1, "count");
  if (v4 != objc_msgSend(a2, "count"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _NSLayoutConstraintApplyDiffWithCounterpartsNSArrays(NSArray<NSLayoutConstraint *> * _Nonnull, NSArray<id<_NSLayoutConstraintComparable>> * _Nonnull)"), CFSTR("NSLayoutConstraintDiff.m"), 336, CFSTR("Unexpected difference in length"));
  }
  result = objc_msgSend(a1, "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      v7 = (void *)objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v8 = objc_msgSend(a2, "objectAtIndexedSubscript:", i);
      if (v7 != (void *)v8)
        objc_msgSend(v7, "_setMutablePropertiesFromConstraint:", v8);
      result = objc_msgSend(a1, "count");
    }
  }
  return result;
}

void _table_addStorageBlock_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void NSISLinExpScaleByWithDroppedColProcessor_cold_1()
{
  __assert_rtn("NSISLinExpScaleByWithDroppedColProcessor", "NSISLinearExpression.m", 1012, "scalar != 0");
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1E0CB2868](aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1E0CB2DC0](table, key, originalKey, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

BOOL NSShouldRetainWithZone(id anObject, NSZone *requestedZone)
{
  return MEMORY[0x1E0CB31A0](anObject, requestedZone);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _NSFaultInObject()
{
  return MEMORY[0x1E0CB3BF0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1E0C830B8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1E0C83420](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1E0C83EB0](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1E0C840E0](__base, __nel, __width, __compar);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  double result;

  MEMORY[0x1E0C85620](a1, a2, a3);
  return result;
}


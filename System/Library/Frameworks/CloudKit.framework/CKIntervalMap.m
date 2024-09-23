@implementation CKIntervalMap

- (CKIntervalMap)init
{
  CKIntervalMap *v2;
  uint64_t v3;
  CKIntervalMapRangeMapContainer *rangeMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKIntervalMap;
  v2 = -[CKIntervalMap init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    rangeMap = v2->_rangeMap;
    v2->_rangeMap = (CKIntervalMapRangeMapContainer *)v3;

  }
  return v2;
}

- (void)maintainInvariants
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  __n128 *v9;
  __n128 *v10;
  uint64_t v11;
  unint64_t v12;
  const std::nothrow_t *v13;
  unint64_t v14;
  __n128 *v15;
  BOOL v16;
  __n128 *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t *v25;
  unint64_t *v26;
  BOOL v27;
  unint64_t *v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64x2_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int64x2_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  int64x2_t v51;
  unint64_t v52;
  int64x2_t *v53;
  int64x2_t v54;
  unint64_t v55;
  unint64_t *v56;

  if (objc_msgSend_dirty(self, a2, v2, v3))
  {
    objc_msgSend_rangeMap(self, v5, v6, v7);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v9 = (__n128 *)v8[1];
    v10 = (__n128 *)v8[2];
    v11 = (char *)v10 - (char *)v9;
    if ((unint64_t)((char *)v10 - (char *)v9) >= 0x21)
    {
      v12 = v11 >> 5;
      if (v11 < 1)
      {
LABEL_7:
        v17 = 0;
        v14 = 0;
      }
      else
      {
        v13 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
        v14 = v11 >> 5;
        while (1)
        {
          v15 = (__n128 *)operator new(32 * v14, v13);
          if (v15)
            break;
          v16 = v14 > 1;
          v14 >>= 1;
          if (!v16)
            goto LABEL_7;
        }
        v17 = v15;
      }
      sub_18A706704(v9, v10, v12, v17, v14);
      if (v17)
        operator delete(v17);
      v9 = (__n128 *)v8[1];
      v10 = (__n128 *)v8[2];
    }
    if (v9 != v10)
      sub_18A706674(v8 + 1, 0, ((char *)v10 - (char *)v9) >> 5);

    objc_msgSend_rangeMap(self, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(unint64_t **)(v21 + 16);
    if ((unint64_t *)v23 != v24)
    {
      v25 = *(unint64_t **)(v21 + 16);
      v26 = *(unint64_t **)(v21 + 8);
      while (1)
      {
        if (v25 != v24)
        {
          v27 = *v25 <= v26[1] + *v26 && v25[1] + *v25 >= *v26;
          if (v27 && v25[2] == v26[2])
            break;
        }
        v25 = v26;
        v26 += 4;
        if (v26 == v24)
          goto LABEL_56;
      }
      v51 = 0uLL;
      v52 = 0;
      v28 = v24;
      do
      {
        if (v28 != v24
          && ((v29 = *(_QWORD *)(v23 + 8) + *(_QWORD *)v23, *v28 <= v29)
            ? (v30 = v28[1] + *v28 >= *(_QWORD *)v23)
            : (v30 = 0),
              v30 && v28[2] == *(_QWORD *)(v23 + 16)))
        {
          v44 = *(_QWORD *)(v51.i64[1] - 32);
          v27 = v29 >= v44;
          v45 = v29 - v44;
          if (!v27)
            v45 = 0;
          *(_QWORD *)(v51.i64[1] - 24) = v45;
        }
        else
        {
          v31 = v51.i64[1];
          if (v51.i64[1] >= v52)
          {
            v33 = (v51.i64[1] - v51.i64[0]) >> 5;
            if ((unint64_t)(v33 + 1) >> 59)
              sub_18A7075A8();
            v34 = (uint64_t)(v52 - v51.i64[0]) >> 4;
            if (v34 <= v33 + 1)
              v34 = v33 + 1;
            if (v52 - v51.i64[0] >= 0x7FFFFFFFFFFFFFE0)
              v35 = 0x7FFFFFFFFFFFFFFLL;
            else
              v35 = v34;
            v56 = &v52;
            if (v35)
              v35 = (unint64_t)sub_18A707628(v35);
            else
              v36 = 0;
            v37 = v35 + 32 * v33;
            v53 = (int64x2_t *)v35;
            v54.i64[0] = v37;
            v55 = v35 + 32 * v36;
            *(_OWORD *)v37 = *(_OWORD *)v23;
            *(_QWORD *)(v37 + 16) = *(id *)(v23 + 16);
            *(_QWORD *)(v37 + 24) = *(_QWORD *)(v23 + 24);
            v32 = v37 + 32;
            v54.i64[1] = v32;
            v38 = v51.i64[1];
            v39 = v51.i64[0];
            v40 = v54.i64[0];
            if (v51.i64[1] == v51.i64[0])
            {
              v42 = vdupq_n_s64(v51.u64[1]);
            }
            else
            {
              do
              {
                *(_OWORD *)(v40 - 32) = *(_OWORD *)(v38 - 32);
                v41 = *(_QWORD *)(v38 - 16);
                *(_QWORD *)(v38 - 16) = 0;
                *(_QWORD *)(v40 - 16) = v41;
                *(_QWORD *)(v40 - 8) = *(_QWORD *)(v38 - 8);
                v40 -= 32;
                v38 -= 32;
              }
              while (v38 != v39);
              v42 = v51;
              v32 = v54.u64[1];
            }
            v51.i64[0] = v40;
            v51.i64[1] = v32;
            v54 = v42;
            v43 = v52;
            v52 = v55;
            v55 = v43;
            v53 = (int64x2_t *)v42.i64[0];
            sub_18A707684((uint64_t)&v53);
          }
          else
          {
            *(_OWORD *)v51.i64[1] = *(_OWORD *)v23;
            *(_QWORD *)(v31 + 16) = *(id *)(v23 + 16);
            *(_QWORD *)(v31 + 24) = *(_QWORD *)(v23 + 24);
            v32 = v31 + 32;
          }
          v51.i64[1] = v32;
        }
        v28 = (unint64_t *)v23;
        v23 += 32;
      }
      while ((unint64_t *)v23 != v24);
      v46 = v52;
      v47 = *(int64x2_t *)(v22 + 8);
      *(int64x2_t *)(v22 + 8) = v51;
      v51 = v47;
      v48 = *(_QWORD *)(v22 + 24);
      *(_QWORD *)(v22 + 24) = v46;
      v52 = v48;
      v53 = &v51;
      sub_18A706600((void ***)&v53);
    }
LABEL_56:

    objc_msgSend_setDirty_(self, v49, 0, v50);
  }
}

- (BOOL)containsIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v30;

  objc_msgSend_maintainInvariants(self, a2, a3, v3);
  objc_msgSend_rangeMap(self, v6, v7, v8);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t *)v9[1];
  v11 = (unint64_t *)v9[2];
  if (v10 == v11)
    goto LABEL_28;
  v12 = ((char *)v11 - (char *)v10) >> 5;
  v13 = (unint64_t *)v9[1];
  do
  {
    v14 = v12 >> 1;
    v15 = &v13[4 * (v12 >> 1)];
    v17 = *v15;
    v16 = v15 + 4;
    v12 += ~(v12 >> 1);
    if (v17 < a3)
      v13 = v16;
    else
      v12 = v14;
  }
  while (v12);
  v18 = a3 + 1;
  while (v13 != v10)
  {
    v19 = v13;
    v21 = *(v13 - 4);
    v13 -= 4;
    v20 = v21;
    if (v21 <= a3)
    {
      v22 = *(v19 - 3) + v20;
      v23 = v22 <= a3 || v20 > v18;
      if (!v23 && v22 >= v18)
        continue;
    }
    goto LABEL_19;
  }
  v19 = (unint64_t *)v9[1];
LABEL_19:
  if (v19 == v11
    || (v25 = *v19, *v19 > a3)
    || ((v26 = v19[1] + v25, v26 > a3) ? (v27 = v25 > v18) : (v27 = 1), !v27 ? (v28 = v26 >= v18) : (v28 = 0), !v28))
  {
LABEL_28:
    v19 = (unint64_t *)v9[2];
  }
  v30 = v19 != v11 && v19 != 0;

  return v30;
}

- (BOOL)containsIndexes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend_maintainInvariants(self, v5, v6, v7);
  v8 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A705EAC;
  v14[3] = &unk_1E1F624A8;
  v9 = v8;
  v15 = v9;
  objc_msgSend_enumerateObjectsForIndexes_usingBlock_(self, v10, (uint64_t)v4, (uint64_t)v14);
  LOBYTE(self) = objc_msgSend_containsIndexes_(v9, v11, (uint64_t)v4, v12);

  return (char)self;
}

- (id)allIndexes
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t i;
  _QWORD *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;

  objc_msgSend_maintainInvariants(self, a2, v2, v3);
  v8 = (void *)objc_opt_new();
  v9 = 0;
  for (i = 0; ; ++i)
  {
    objc_msgSend_rangeMap(self, v5, v6, v7);
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12 = v11[2] - v11[1];

    if (i >= v12 >> 5)
      break;
    objc_msgSend_rangeMap(self, v13, v14, v15);
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v17 = v16[1] + v9;
    v18 = *(_QWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(id *)(v17 + 16);

    objc_msgSend_addIndexesInRange_(v8, v21, v18, v19);
    v9 += 32;
  }
  return v8;
}

- (void)enumerateObjectsForIndexes:(id)a3 usingBlock:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v13 = a3;
  v6 = a4;
  objc_msgSend_maintainInvariants(self, v7, v8, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A70605C;
  v14[3] = &unk_1E1F624D0;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  objc_msgSend_enumerateRangesUsingBlock_(v13, v11, (uint64_t)v14, v12);

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  _QWORD *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;

  objc_msgSend_maintainInvariants(self, a2, v2, v3);
  v5 = (void *)objc_opt_new();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v5, v8, (uint64_t)CFSTR("<%@"), v9, v7);

  v13 = 0;
  for (i = 0; ; ++i)
  {
    objc_msgSend_rangeMap(self, v10, v11, v12);
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v16 = v15[2] - v15[1];

    if (i >= v16 >> 5)
      break;
    objc_msgSend_rangeMap(self, v17, v18, v19);
    v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v21 = (uint64_t *)(v20[1] + v13);
    v22 = *v21;
    v23 = v21[1];
    v24 = (id)v21[2];

    if (i)
      objc_msgSend_appendFormat_(v5, v25, (uint64_t)CFSTR(", "), v26);
    else
      objc_msgSend_appendFormat_(v5, v25, (uint64_t)CFSTR(" "), v26);
    if (v23 == 1)
    {
      objc_msgSend_appendFormat_(v5, v27, (uint64_t)CFSTR("%lu:%@"), v28, v22, v24);
    }
    else if (v23)
    {
      objc_msgSend_appendFormat_(v5, v27, (uint64_t)CFSTR("%lu-%lu:%@"), v28, v22, v22 + v23 - 1, v24);
    }
    else
    {
      objc_msgSend_appendFormat_(v5, v27, (uint64_t)CFSTR("%lu(0)"), v28, v22);
    }

    v13 += 32;
  }
  objc_msgSend_appendFormat_(v5, v17, (uint64_t)CFSTR(">"), v19);
  return v5;
}

- (CKIntervalMapRangeMapContainer)rangeMap
{
  return self->_rangeMap;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeMap, 0);
}

@end

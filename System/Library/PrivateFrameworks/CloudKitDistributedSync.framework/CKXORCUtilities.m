@implementation CKXORCUtilities

+ (void)enumerateColumn:(void *)a3 includingRoot:(BOOL)a4 shallow:(BOOL)a5 withBlock:(id)a6
{
  _BOOL4 v6;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  const void *v12;
  _QWORD *v13;
  int v14;
  _QWORD *v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  int v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  void (**v67)(id, const void *, _QWORD);
  _BOOL4 v68;
  char *v69;
  char *__p;
  char *__pa;
  char *v72;

  v6 = a5;
  v68 = a4;
  v67 = (void (**)(id, const void *, _QWORD))a6;
  v8 = (char *)operator new(8uLL);
  v9 = 0;
  *(_QWORD *)v8 = a3;
  v10 = v8 + 8;
  v72 = v8 + 8;
  v69 = v8;
  do
  {
    if (v9)
      v11 = !v6;
    else
      v11 = 1;
    v12 = (const void *)*((_QWORD *)v10 - 1);
    __p = v10 - 8;
    if (v9 || v68)
      v67[2](v67, v12, v9);
    if (v12)
    {
      v13 = __dynamic_cast(v12, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
      if (v13)
        v14 = v11;
      else
        v14 = 0;
      if (v14 == 1)
      {
        v15 = v13;
        v16 = (_QWORD *)v13[10];
        if (v16 != (_QWORD *)v13[11])
        {
          v17 = __p;
          do
          {
            if (v17 >= v72)
            {
              v18 = (v17 - v69) >> 3;
              if ((unint64_t)(v18 + 1) >> 61)
                sub_1D4B182AC();
              v19 = (v72 - v69) >> 2;
              if (v19 <= v18 + 1)
                v19 = v18 + 1;
              if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8)
                v20 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v20 = v19;
              if (v20)
                v21 = (char *)sub_1D4B182C0((uint64_t)&v72, v20);
              else
                v21 = 0;
              v22 = &v21[8 * v18];
              *(_QWORD *)v22 = *v16;
              v17 = v22 + 8;
              v23 = __p;
              if (__p != v69)
              {
                do
                {
                  v24 = *((_QWORD *)v23 - 1);
                  v23 -= 8;
                  *((_QWORD *)v22 - 1) = v24;
                  v22 -= 8;
                }
                while (v23 != v69);
                v23 = v69;
              }
              v69 = v22;
              v72 = &v21[8 * v20];
              if (v23)
                operator delete(v23);
            }
            else
            {
              *(_QWORD *)v17 = *v16;
              v17 += 8;
            }
            __p = v17;
            ++v16;
          }
          while (v16 != (_QWORD *)v15[11]);
        }
      }
      v25 = __dynamic_cast(v12, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E98463D0, 0);
      if (v25)
        v26 = v11;
      else
        v26 = 0;
      if ((v26 & 1) != 0)
      {
        v27 = v25;
        v29 = (_QWORD *)v25[20];
        v28 = (_QWORD *)v25[21];
        v10 = __p;
        while (v29 != v28)
        {
          if (v10 >= v72)
          {
            v30 = (v10 - v69) >> 3;
            if ((unint64_t)(v30 + 1) >> 61)
              sub_1D4B182AC();
            v31 = (v72 - v69) >> 2;
            if (v31 <= v30 + 1)
              v31 = v30 + 1;
            if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8)
              v32 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v32 = v31;
            if (v32)
              v33 = (char *)sub_1D4B182C0((uint64_t)&v72, v32);
            else
              v33 = 0;
            v34 = &v33[8 * v30];
            *(_QWORD *)v34 = *v29;
            v10 = v34 + 8;
            v35 = __p;
            if (__p != v69)
            {
              do
              {
                v36 = *((_QWORD *)v35 - 1);
                v35 -= 8;
                *((_QWORD *)v34 - 1) = v36;
                v34 -= 8;
              }
              while (v35 != v69);
              v35 = v69;
            }
            v69 = v34;
            v72 = &v33[8 * v32];
            if (v35)
              operator delete(v35);
          }
          else
          {
            *(_QWORD *)v10 = *v29;
            v10 += 8;
          }
          __p = v10;
          ++v29;
          v28 = (_QWORD *)v27[21];
        }
      }
      else
      {
        v10 = __p;
      }
      v37 = __dynamic_cast(v12, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E98461B0, 0);
      if (v37)
        v38 = v11;
      else
        v38 = 0;
      if (v38 == 1)
      {
        v39 = v37;
        v40 = v37[15];
        if (v10 >= v72)
        {
          v42 = (v10 - v69) >> 3;
          if ((unint64_t)(v42 + 1) >> 61)
            sub_1D4B182AC();
          v43 = (v72 - v69) >> 2;
          if (v43 <= v42 + 1)
            v43 = v42 + 1;
          if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8)
            v44 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v44 = v43;
          if (v44)
            v45 = (char *)sub_1D4B182C0((uint64_t)&v72, v44);
          else
            v45 = 0;
          v46 = &v45[8 * v42];
          *(_QWORD *)v46 = v40;
          v41 = v46 + 8;
          v47 = __p;
          if (__p != v69)
          {
            do
            {
              v48 = *((_QWORD *)v47 - 1);
              v47 -= 8;
              *((_QWORD *)v46 - 1) = v48;
              v46 -= 8;
            }
            while (v47 != v69);
            v47 = v69;
          }
          v69 = v46;
          v72 = &v45[8 * v44];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *(_QWORD *)v10 = v40;
          v41 = v10 + 8;
        }
        __pa = v41;
        v49 = v39[16];
        if (v41 >= v72)
        {
          v50 = (v41 - v69) >> 3;
          if ((unint64_t)(v50 + 1) >> 61)
            sub_1D4B182AC();
          v51 = (v72 - v69) >> 2;
          if (v51 <= v50 + 1)
            v51 = v50 + 1;
          if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8)
            v52 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v52 = v51;
          if (v52)
            v53 = (char *)sub_1D4B182C0((uint64_t)&v72, v52);
          else
            v53 = 0;
          v54 = &v53[8 * v50];
          *(_QWORD *)v54 = v49;
          v10 = v54 + 8;
          v55 = __pa;
          if (__pa != v69)
          {
            do
            {
              v56 = *((_QWORD *)v55 - 1);
              v55 -= 8;
              *((_QWORD *)v54 - 1) = v56;
              v54 -= 8;
            }
            while (v55 != v69);
            v55 = v69;
          }
          v69 = v54;
          v72 = &v53[8 * v52];
          if (v55)
            operator delete(v55);
        }
        else
        {
          *(_QWORD *)v41 = v49;
          v10 = v41 + 8;
        }
        __p = v10;
      }
      v57 = __dynamic_cast(v12, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846280, 0);
      if (v57)
        v58 = v11;
      else
        v58 = 0;
      if (v58 == 1)
      {
        v59 = v57[15];
        if (v10 >= v72)
        {
          v60 = (v10 - v69) >> 3;
          if ((unint64_t)(v60 + 1) >> 61)
            sub_1D4B182AC();
          v61 = (v72 - v69) >> 2;
          if (v61 <= v60 + 1)
            v61 = v60 + 1;
          if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8)
            v62 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v62 = v61;
          if (v62)
            v63 = (char *)sub_1D4B182C0((uint64_t)&v72, v62);
          else
            v63 = 0;
          v64 = &v63[8 * v60];
          *(_QWORD *)v64 = v59;
          v10 = v64 + 8;
          v65 = __p;
          if (__p != v69)
          {
            do
            {
              v66 = *((_QWORD *)v65 - 1);
              v65 -= 8;
              *((_QWORD *)v64 - 1) = v66;
              v64 -= 8;
            }
            while (v65 != v69);
            v65 = v69;
          }
          v69 = v64;
          v72 = &v63[8 * v62];
          if (v65)
            operator delete(v65);
        }
        else
        {
          *(_QWORD *)v10 = v59;
          v10 += 8;
        }
      }
    }
    else
    {
      v10 -= 8;
    }
    ++v9;
  }
  while (v10 != v69);
  if (v10)
    operator delete(v10);

}

+ (void)setDefaultValuesForStruct:(unint64_t)a3 withRootColumn:(void *)a4 atOffset:(unint64_t)a5 withSchema:(id)a6 orcHelpers:(id)a7
{
  id v13;
  const char *v14;
  const void *v15;
  _QWORD *v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  id v38;

  v38 = a6;
  v13 = a7;
  v15 = *(const void **)(*((_QWORD *)a4 + 10) + 8 * objc_msgSend_topLevelIndexForStruct_(v13, v14, a3));
  if (v15)
    v16 = __dynamic_cast(v15, (const struct __class_type_info *)&unk_1E98463E8, (const struct __class_type_info *)&unk_1E9846490, 0);
  else
    v16 = 0;
  *(_BYTE *)(v16[5] + a5) = 1;
  if (!sub_1D4BB5C78((uint64_t)v38, a3))
  {
LABEL_18:

    return;
  }
  v17 = 0;
  while (1)
  {
    v18 = (const char *)sub_1D4BB5CBC((uint64_t)v38, v17, a3);
    v20 = sub_1D4BB5700((uint64_t)v38, v18, v19);
    if (!v20)
    {
      v30 = objc_msgSend_valueColumnIndexForField_(v13, v21, (uint64_t)v18);
      v33 = v16[10];
      if (v30 >= (v16[11] - v33) >> 3 || (v28 = *(_QWORD *)(v33 + 8 * v30)) == 0)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, a1, CFSTR("CKXORCUtilities.mm"), 73, CFSTR("Unexpected null value column in writer"));

        v28 = 0;
      }
      v29 = sub_1D4BB5980((uint64_t)v38, v18, v32) ^ 1;
      goto LABEL_16;
    }
    if (v20 != 2 || sub_1D4BB57C8((uint64_t)v38, v18, v22))
      goto LABEL_17;
    v24 = objc_msgSend_listColumnIndexForReference_(v13, v23, (uint64_t)v18);
    v27 = v16[10];
    if (v24 >= (v16[11] - v27) >> 3)
      break;
    v28 = *(_QWORD *)(v27 + 8 * v24);
    if (!v28)
      break;
    v29 = 1;
LABEL_16:
    *(_BYTE *)(*(_QWORD *)(v28 + 40) + a5) = v29;
LABEL_17:
    if (++v17 >= sub_1D4BB5C78((uint64_t)v38, a3))
      goto LABEL_18;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v25, v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, a1, CFSTR("CKXORCUtilities.mm"), 90, CFSTR("Unexpected null struct list column in writer"));

  __break(1u);
}

@end

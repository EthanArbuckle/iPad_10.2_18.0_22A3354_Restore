@implementation ZN13PDFLinearizer14collectObjectsEP7

uint64_t *___ZN13PDFLinearizer14collectObjectsEP7__sFILE_block_invoke(uint64_t *result, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  BOOL v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  BOOL v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  BOOL v25;

  v2 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 64);
  if (0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 72) - v2) >> 3) <= a2)
  {
    __break(1u);
  }
  else
  {
    v3 = (_QWORD *)(v2 + 56 * a2);
    v6 = (_QWORD *)*v3;
    v4 = v3 + 1;
    v5 = v6;
    if (v6 != v4)
    {
      v7 = result;
      v8 = result + 8;
      do
      {
        v9 = v5[4];
        v10 = *(_QWORD *)(v7[5] + 8);
        v13 = *(_QWORD **)(v10 + 48);
        v11 = (_QWORD *)(v10 + 48);
        v12 = v13;
        if (!v13)
          goto LABEL_15;
        v14 = v11;
        do
        {
          v15 = v12[4];
          v16 = v15 >= v9;
          if (v15 >= v9)
            v17 = v12;
          else
            v17 = v12 + 1;
          if (v16)
            v14 = v12;
          v12 = (_QWORD *)*v17;
        }
        while (*v17);
        if (v14 == v11 || v9 < v14[4])
        {
LABEL_15:
          result = std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(v11 - 1, v5[4], v5[4]);
          v18 = (_QWORD *)*v8;
          if (!*v8)
            goto LABEL_26;
          v19 = v8;
          do
          {
            v20 = v18[4];
            v21 = v20 >= v9;
            if (v20 >= v9)
              v22 = v18;
            else
              v22 = v18 + 1;
            if (v21)
              v19 = v18;
            v18 = (_QWORD *)*v22;
          }
          while (*v22);
          if (v19 == v8 || v9 < v19[4])
LABEL_26:
            result = (uint64_t *)(*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(v7[6] + 8) + 40) + 16))();
        }
        v23 = (_QWORD *)v5[1];
        if (v23)
        {
          do
          {
            v24 = v23;
            v23 = (_QWORD *)*v23;
          }
          while (v23);
        }
        else
        {
          do
          {
            v24 = (_QWORD *)v5[2];
            v25 = *v24 == (_QWORD)v5;
            v5 = v24;
          }
          while (!v25);
        }
        v5 = v24;
      }
      while (v24 != v4);
    }
  }
  return result;
}

@end

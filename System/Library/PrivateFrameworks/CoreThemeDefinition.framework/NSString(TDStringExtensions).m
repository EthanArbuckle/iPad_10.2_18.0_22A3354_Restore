@implementation NSString(TDStringExtensions)

- (uint64_t)td_stringByStandardizingPath
{
  uint64_t v2;
  int v3;
  _BOOL4 v4;
  int HasDotDot;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _WORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _WORD *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  _WORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _WORD *v29;
  uint64_t v30;
  uint64_t v31;
  _WORD *v32;
  size_t v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  int v37;
  _WORD *v39;
  _BOOL4 v40;
  uint64_t v41;
  unsigned __int16 v42;
  _WORD v43[2];
  _WORD v44[1021];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v41 = objc_msgSend(a1, "length");
  objc_msgSend((id)objc_msgSend(a1, "stringByExpandingTildeInPath"), "getCharacters:range:", &v42, 0, v41);
  __CUITransmutePathSlashes(&v42, &v41);
  v2 = v41;
  if (v41 < 2)
  {
    v4 = 0;
  }
  else if (v43[v41 - 2] == 47)
  {
    while ((unint64_t)v2 > 2)
    {
      v3 = *((unsigned __int16 *)&v41 + v2-- + 2);
      if (v3 != 47)
        goto LABEL_5;
    }
    v4 = 0;
    v2 = 1;
  }
  else
  {
LABEL_5:
    v4 = 0;
    if (v2 >= 2 && v42 == 92)
      v4 = v43[0] == 92;
  }
  HasDotDot = _pathHasDotDot(&v42, v2, v4);
  v6 = -2 * v2;
  do
  {
    v7 = v2;
    v8 = v6;
    if (v4)
    {
      if (v2 <= 4)
      {
        v41 = v2;
LABEL_18:
        v11 = 3;
        goto LABEL_28;
      }
    }
    else if (v2 < 3)
    {
      v41 = v2;
      if (v2 != 2)
        goto LABEL_101;
      goto LABEL_20;
    }
    v9 = &v43[v2 - 1];
    if (*(v9 - 2) != 47)
      break;
    v10 = (unsigned __int16)*(v9 - 1);
    v6 = v8 + 4;
    v2 -= 2;
  }
  while (v10 == 46);
  v41 = v7;
  if (v4)
    goto LABEL_18;
LABEL_20:
  if (v43[0] == 47)
  {
    v12 = 0;
    while (v43[v12 - 1] == 46)
    {
      v13 = v12 + 2;
      v14 = (unsigned __int16)v44[v12];
      v12 += 2;
      if (v14 != 47)
        goto LABEL_26;
    }
    v13 = v12;
    if (!v12)
      goto LABEL_27;
LABEL_26:
    v7 -= v13;
    v41 = v7;
    __memmove_chk();
  }
LABEL_27:
  v11 = 0;
LABEL_28:
  if (v7 >= 3 && v11 < v7 - 2)
  {
    do
    {
      v15 = &v43[v11 - 1];
      if (*v15 == 47 && v15[1] == 46 && v43[v11 + 1] == 47)
      {
        memmove(v15 + 1, v15 + 3, 2 * (v7 - v11) - 6);
        v7 -= 2;
        --v11;
      }
      if (v7 < 3)
        break;
      ++v11;
    }
    while (v11 < v7 - 2);
    v41 = v7;
  }
  if (v7 > 2)
    v16 = HasDotDot;
  else
    v16 = 0;
  if (v16 == 1)
  {
    v39 = v44;
    v17 = v7;
    v40 = v4;
    do
    {
      if (v4)
      {
        v18 = 3;
        if ((unint64_t)v17 >= 4)
        {
          while (v43[v18 - 1] != 47)
          {
            if (v17 == ++v18)
            {
              v18 = v17;
              break;
            }
          }
        }
        if (v17 <= v18 + 1)
          v19 = v18 + 1;
        else
          v19 = v17;
        while (1)
        {
          v20 = v18 + 1;
          if (v18 + 1 >= v17)
            break;
          v21 = (unsigned __int16)v43[v18++];
          if (v21 == 47)
            goto LABEL_55;
        }
        v20 = v19;
      }
      else
      {
        v20 = 0;
      }
LABEL_55:
      v22 = v17 - 2;
      v23 = v17 > 2;
      if (v17 < 3 || v20 >= v22)
      {
        v25 = v7;
        v26 = v17;
        v27 = v17;
      }
      else
      {
        v24 = &v43[v20 - 1];
        v25 = v7;
        v26 = v17;
        v27 = v17;
        do
        {
          if ((unint64_t)v27 >= 4
            && v20 < v27 - 4
            && *v24 == 47
            && v43[v20] == 46
            && v43[v20 + 1] == 46
            && v43[v20 + 2] == 47)
          {
            memmove(v24 + 1, v24 + 4, 2 * (v27 - v20) - 8);
            v25 -= 3;
            v26 = v25;
            v27 = v25;
            v28 = v20 - 1;
          }
          else
          {
            v28 = v20;
          }
          if (v27 >= 3 && v28 == v27 - 3 && v43[v28 - 1] == 47)
          {
            v29 = &v43[v28 - 1];
            if (v29[1] == 46 && v29[2] == 46)
            {
              v25 = v27 - 2;
              v26 = v27 - 2;
              v27 -= 2;
            }
          }
          v22 = v27 - 2;
          v23 = v27 > 2;
          if (v27 < 3)
            break;
          v30 = v28 + 1;
          if (v30 >= v22)
            break;
        }
        while (v20 == v30);
      }
      if (v23)
      {
        v4 = v40;
        if (v20 < v27)
        {
          do
          {
            v7 = v20 + 1;
            if (v20 + 1 >= v22)
              break;
            v31 = 0;
            v32 = &v44[v20];
            v33 = 2 * (v27 - 5 - v20);
            while (*(v32 - 2) != 47)
            {
              ++v32;
              ++v31;
              v33 -= 2;
              if (!(1 - v22 + v20 + v31))
                goto LABEL_94;
            }
            v34 = v20 + v31 + 1;
            if (v27 >= 4 && v34 < v27 - 4 && *(v32 - 1) == 46 && *v32 == 46 && v32[1] == 47)
            {
              v7 = v27 - v31 - 4;
              memmove(&v43[v20], v32 + 2, v33);
              v17 = v7;
              goto LABEL_96;
            }
            if (!(v20 + v31 + 4 - v27) && *(&v42 + v27 - 3) == 47 && *(&v42 + v27 - 2) == 46)
            {
              v17 = v20 + 1;
              if (*(&v42 + v27 - 1) == 46)
                goto LABEL_96;
            }
            v20 += v31 + 1;
          }
          while (v34 < v27);
        }
LABEL_94:
        v7 = v25;
        v17 = v26;
      }
      else
      {
        v7 = v25;
        v17 = v26;
        v4 = v40;
      }
LABEL_96:
      v35 = _pathHasDotDot(&v42, v17, v4);
    }
    while (v17 >= 3 && (v35 & 1) != 0);
    v41 = v7;
  }
LABEL_101:
  __CUITransmutePathSlashes(&v42, &v41);
  v36 = v41;
  if (v41 >= 2 && v43[v41 - 2] == 47)
  {
    while (v36 > 2)
    {
      v37 = *((unsigned __int16 *)&v41 + v36-- + 2);
      if (v37 != 47)
        return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v42, v36, v39);
    }
    v36 = 1;
  }
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v42, v36, v39);
}

@end

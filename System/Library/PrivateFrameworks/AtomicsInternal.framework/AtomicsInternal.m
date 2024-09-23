uint64_t Int8.AtomicRepresentation._storage.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*Int8.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_BYTE *sub_236B3AB64@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_236B3AB70(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t Int16.AtomicRepresentation._storage.setter(uint64_t result)
{
  _WORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Int16.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_WORD *sub_236B3ABC8@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_236B3ABD4(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

uint64_t Int32.AtomicRepresentation._storage.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Int32.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_DWORD *sub_236B3AC2C@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_236B3AC38(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t Int64.AtomicRepresentation._storage.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Int64.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unint64_t *sub_236B3AC90@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B3D0C4(result, a2, a3);
}

unint64_t *sub_236B3AC98(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  return sub_236B3D148(result, a2, a3);
}

unint64_t *sub_236B3ACA0@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D1CC(result, a2, a3, a4);
}

uint64_t sub_236B3ACA8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B3D2A0(a1, a2, a3, a4, a5);
}

uint64_t sub_236B3ACB0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B3D3B4(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B3ACD8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B3D61C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t *sub_236B3AD00@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D770(result, a2, a3, a4);
}

uint64_t *sub_236B3AD08@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D858(result, a2, a3, a4);
}

uint64_t *sub_236B3AD10@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D940(result, a2, a3, a4);
}

uint64_t *sub_236B3AD18@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3DA28(result, a2, a3, a4);
}

uint64_t *sub_236B3AD20@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3DB10(result, a2, a3, a4);
}

uint64_t UInt8.AtomicRepresentation._storage.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*UInt8.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned __int8 *sub_236B3AD48@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X8>)
{
  unsigned __int8 v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }
  if (!a2)
  {
    v3 = *result;
    goto LABEL_6;
  }
  result = (unsigned __int8 *)sub_236B48CD8();
  __break(1u);
  return result;
}

unsigned __int8 *sub_236B3ADD0(unsigned __int8 *result, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 v3;

  v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unsigned __int8 *)sub_236B48CD8();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unsigned __int8 *sub_236B3AE58@<X0>(unsigned __int8 *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (unsigned __int8 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B3AF30(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  int v5;
  unsigned __int8 v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      v8 = 1;
      goto LABEL_18;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

uint64_t sub_236B3B04C(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned __int8 v7;
  int v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          v9 = 1;
          goto LABEL_62;
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 2:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 3:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 4:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 5:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
LABEL_61:
          v9 = 1;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
LABEL_41:
          v9 = 0;
          __clrex();
          goto LABEL_62;
        case 5:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
      }
LABEL_64:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }
}

uint64_t sub_236B3B2BC(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned __int8 v7;
  int v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 == 2)
        goto LABEL_10;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_11;
    case 2:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 != 2 && a6)
        goto LABEL_29;
LABEL_10:
      v8 = __ldaxr(a4);
      if (v8 != v6)
        goto LABEL_20;
LABEL_11:
      if (!__stxr(v7, a4))
        goto LABEL_28;
      goto LABEL_26;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_25;
    case 4:
      if (a6 != 5 && a6 != 2)
        goto LABEL_23;
      goto LABEL_24;
    case 5:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
LABEL_23:
      if (!a6)
      {
LABEL_24:
        v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            v9 = 1;
            goto LABEL_27;
          }
        }
        else
        {
LABEL_20:
          __clrex();
        }
LABEL_26:
        v9 = 0;
LABEL_27:
        *a1 = v8;
        return v9;
      }
LABEL_29:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }
}

char *sub_236B3B410@<X0>(char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (char *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

char *sub_236B3B4FC@<X0>(char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (char *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

char *sub_236B3B5E8@<X0>(char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (char *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

char *sub_236B3B6D4@<X0>(char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (char *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

char *sub_236B3B7C0@<X0>(char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (char *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t UInt16.AtomicRepresentation._storage.setter(uint64_t result)
{
  _WORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*UInt16.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned __int16 *sub_236B3B8CC@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X1>, unsigned __int16 *a3@<X8>)
{
  unsigned __int16 v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }
  if (!a2)
  {
    v3 = *result;
    goto LABEL_6;
  }
  result = (unsigned __int16 *)sub_236B48CD8();
  __break(1u);
  return result;
}

unsigned __int16 *sub_236B3B954(unsigned __int16 *result, unsigned __int16 *a2, uint64_t a3)
{
  unsigned __int16 v3;

  v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unsigned __int16 *)sub_236B48CD8();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unsigned __int16 *sub_236B3B9DC@<X0>(unsigned __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned __int16 v4;
  unsigned __int16 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (unsigned __int16 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B3BAB4(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5)
{
  int v5;
  unsigned __int16 v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      v8 = 1;
      goto LABEL_18;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

uint64_t sub_236B3BBD0(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned __int16 v7;
  int v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          v9 = 1;
          goto LABEL_62;
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 2:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 3:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 4:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 5:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
LABEL_61:
          v9 = 1;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
LABEL_41:
          v9 = 0;
          __clrex();
          goto LABEL_62;
        case 5:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
      }
LABEL_64:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }
}

uint64_t sub_236B3BE40(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned __int16 v7;
  int v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 == 2)
        goto LABEL_10;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_11;
    case 2:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 != 2 && a6)
        goto LABEL_29;
LABEL_10:
      v8 = __ldaxr(a4);
      if (v8 != v6)
        goto LABEL_20;
LABEL_11:
      if (!__stxr(v7, a4))
        goto LABEL_28;
      goto LABEL_26;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_25;
    case 4:
      if (a6 != 5 && a6 != 2)
        goto LABEL_23;
      goto LABEL_24;
    case 5:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
LABEL_23:
      if (!a6)
      {
LABEL_24:
        v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            v9 = 1;
            goto LABEL_27;
          }
        }
        else
        {
LABEL_20:
          __clrex();
        }
LABEL_26:
        v9 = 0;
LABEL_27:
        *a1 = v8;
        return v9;
      }
LABEL_29:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }
}

__int16 *sub_236B3BF94@<X0>(__int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4;
  unsigned __int16 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (__int16 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

__int16 *sub_236B3C080@<X0>(__int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4;
  unsigned __int16 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (__int16 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

__int16 *sub_236B3C16C@<X0>(__int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4;
  unsigned __int16 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (__int16 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

__int16 *sub_236B3C258@<X0>(__int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4;
  unsigned __int16 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (__int16 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

__int16 *sub_236B3C344@<X0>(__int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4;
  unsigned __int16 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (__int16 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t UInt32.AtomicRepresentation._storage.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*UInt32.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned int *sub_236B3C450@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, unsigned int *a3@<X8>)
{
  unsigned int v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }
  if (!a2)
  {
    v3 = *result;
    goto LABEL_6;
  }
  result = (unsigned int *)sub_236B48CD8();
  __break(1u);
  return result;
}

unsigned int *sub_236B3C4D8(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  unsigned int v3;

  v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unsigned int *)sub_236B48CD8();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unsigned int *sub_236B3C560@<X0>(unsigned int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4;
  unsigned int v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (unsigned int *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B3C638(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      v8 = 1;
      goto LABEL_18;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

uint64_t sub_236B3C754(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          v9 = 1;
          goto LABEL_62;
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 2:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 3:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 4:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 5:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
LABEL_61:
          v9 = 1;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
LABEL_41:
          v9 = 0;
          __clrex();
          goto LABEL_62;
        case 5:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
      }
LABEL_64:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }
}

uint64_t sub_236B3C9C4(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 == 2)
        goto LABEL_10;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_11;
    case 2:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 != 2 && a6)
        goto LABEL_29;
LABEL_10:
      v8 = __ldaxr(a4);
      if (v8 != v6)
        goto LABEL_20;
LABEL_11:
      if (!__stxr(v7, a4))
        goto LABEL_28;
      goto LABEL_26;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_25;
    case 4:
      if (a6 != 5 && a6 != 2)
        goto LABEL_23;
      goto LABEL_24;
    case 5:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
LABEL_23:
      if (!a6)
      {
LABEL_24:
        v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            v9 = 1;
            goto LABEL_27;
          }
        }
        else
        {
LABEL_20:
          __clrex();
        }
LABEL_26:
        v9 = 0;
LABEL_27:
        *a1 = v8;
        return v9;
      }
LABEL_29:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }
}

int *sub_236B3CB18@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4;
  unsigned int v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (int *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

int *sub_236B3CC04@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4;
  unsigned int v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (int *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

int *sub_236B3CCF0@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4;
  unsigned int v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (int *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

int *sub_236B3CDDC@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4;
  unsigned int v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (int *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

int *sub_236B3CEC8@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4;
  unsigned int v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (int *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t UInt64.AtomicRepresentation._storage.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*UInt64.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

uint64_t Int.AtomicRepresentation._storage.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Int.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_QWORD *sub_236B3CFF4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_236B3D000(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t *sub_236B3D00C@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B3D0C4(result, a2, a3);
}

unint64_t *sub_236B3D014(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  return sub_236B3D148(result, a2, a3);
}

unint64_t *sub_236B3D01C@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D1CC(result, a2, a3, a4);
}

uint64_t sub_236B3D024(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B3D2A0(a1, a2, a3, a4, a5);
}

uint64_t sub_236B3D02C(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B3D3B4(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B3D054(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B3D61C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t *sub_236B3D07C@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D770(result, a2, a3, a4);
}

uint64_t *sub_236B3D084@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D858(result, a2, a3, a4);
}

uint64_t *sub_236B3D08C@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3D940(result, a2, a3, a4);
}

uint64_t *sub_236B3D094@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3DA28(result, a2, a3, a4);
}

uint64_t *sub_236B3D09C@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B3DB10(result, a2, a3, a4);
}

uint64_t UInt.AtomicRepresentation._storage.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*UInt.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unint64_t *sub_236B3D0C4@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }
  if (!a2)
  {
    v3 = *result;
    goto LABEL_6;
  }
  result = (unint64_t *)sub_236B48CD8();
  __break(1u);
  return result;
}

unint64_t *sub_236B3D148(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  unint64_t v3;

  v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unint64_t *)sub_236B48CD8();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unint64_t *sub_236B3D1CC@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (unint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B3D2A0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      goto LABEL_16;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

uint64_t sub_236B3D3B4(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }
      goto LABEL_61;
    case 2:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }
      goto LABEL_61;
    case 3:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }
      goto LABEL_61;
    case 4:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }
      goto LABEL_61;
    case 5:
      switch(a6)
      {
        case 0:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
LABEL_61:
          v9 = 1;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
LABEL_41:
          v9 = 0;
          __clrex();
          goto LABEL_62;
        case 5:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
      }
LABEL_63:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_63;
  }
}

uint64_t sub_236B3D61C(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 == 2)
        goto LABEL_10;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_11;
    case 2:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 != 2 && a6)
        goto LABEL_29;
LABEL_10:
      v8 = __ldaxr(a4);
      if (v8 != v6)
        goto LABEL_20;
LABEL_11:
      if (!__stxr(v7, a4))
        goto LABEL_28;
      goto LABEL_26;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
      if (a6)
        goto LABEL_29;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_25;
    case 4:
      if (a6 != 5 && a6 != 2)
        goto LABEL_23;
      goto LABEL_24;
    case 5:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
LABEL_23:
      if (!a6)
      {
LABEL_24:
        v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            v9 = 1;
            goto LABEL_27;
          }
        }
        else
        {
LABEL_20:
          __clrex();
        }
LABEL_26:
        v9 = 0;
LABEL_27:
        *a1 = v8;
        return v9;
      }
LABEL_29:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }
}

uint64_t *sub_236B3D770@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (uint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t *sub_236B3D858@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (uint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t *sub_236B3D940@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (uint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t *sub_236B3DA28@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (uint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t *sub_236B3DB10@<X0>(uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (uint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t DoubleWord.AtomicRepresentation._storage.setter(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*DoubleWord.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_UNKNOWN **sub_236B3DC18()
{
  return &protocol witness table for Int8.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DC24()
{
  return &protocol witness table for Int8.AtomicRepresentation;
}

unint64_t sub_236B3DC30(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DC54();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DC54()
{
  unint64_t result;

  result = qword_25643F4D0;
  if (!qword_25643F4D0)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE3E80], MEMORY[0x24BEE3E50]);
    atomic_store(result, (unint64_t *)&qword_25643F4D0);
  }
  return result;
}

_UNKNOWN **sub_236B3DC98()
{
  return &protocol witness table for Int16.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DCA4()
{
  return &protocol witness table for Int16.AtomicRepresentation;
}

unint64_t sub_236B3DCB0(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DCD4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DCD4()
{
  unint64_t result;

  result = qword_25643F4D8;
  if (!qword_25643F4D8)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE3F60], MEMORY[0x24BEE3F30]);
    atomic_store(result, (unint64_t *)&qword_25643F4D8);
  }
  return result;
}

_UNKNOWN **sub_236B3DD18()
{
  return &protocol witness table for Int32.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DD24()
{
  return &protocol witness table for Int32.AtomicRepresentation;
}

unint64_t sub_236B3DD30(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DD54();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DD54()
{
  unint64_t result;

  result = qword_25643F4E0;
  if (!qword_25643F4E0)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE3FD8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_25643F4E0);
  }
  return result;
}

_UNKNOWN **sub_236B3DD98()
{
  return &protocol witness table for Int64.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DDA4()
{
  return &protocol witness table for Int64.AtomicRepresentation;
}

unint64_t sub_236B3DDB0(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DDD4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DDD4()
{
  unint64_t result;

  result = qword_25643F4E8;
  if (!qword_25643F4E8)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_25643F4E8);
  }
  return result;
}

_UNKNOWN **sub_236B3DE18()
{
  return &protocol witness table for UInt8.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DE24()
{
  return &protocol witness table for UInt8.AtomicRepresentation;
}

unint64_t sub_236B3DE30(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DE54();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DE54()
{
  unint64_t result;

  result = qword_25643F4F0;
  if (!qword_25643F4F0)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE42A0], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_25643F4F0);
  }
  return result;
}

_UNKNOWN **sub_236B3DE98()
{
  return &protocol witness table for UInt16.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DEA4()
{
  return &protocol witness table for UInt16.AtomicRepresentation;
}

unint64_t sub_236B3DEB0(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DED4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DED4()
{
  unint64_t result;

  result = qword_25643F4F8;
  if (!qword_25643F4F8)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE44C0], MEMORY[0x24BEE4478]);
    atomic_store(result, (unint64_t *)&qword_25643F4F8);
  }
  return result;
}

_UNKNOWN **sub_236B3DF18()
{
  return &protocol witness table for UInt32.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DF24()
{
  return &protocol witness table for UInt32.AtomicRepresentation;
}

unint64_t sub_236B3DF30(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DF54();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DF54()
{
  unint64_t result;

  result = qword_25643F500;
  if (!qword_25643F500)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_25643F500);
  }
  return result;
}

_UNKNOWN **sub_236B3DF98()
{
  return &protocol witness table for UInt64.AtomicRepresentation;
}

_UNKNOWN **sub_236B3DFA4()
{
  return &protocol witness table for UInt64.AtomicRepresentation;
}

unint64_t sub_236B3DFB0(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3DFD4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3DFD4()
{
  unint64_t result;

  result = qword_25643F508;
  if (!qword_25643F508)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_25643F508);
  }
  return result;
}

_UNKNOWN **sub_236B3E018()
{
  return &protocol witness table for Int.AtomicRepresentation;
}

_UNKNOWN **sub_236B3E024()
{
  return &protocol witness table for Int.AtomicRepresentation;
}

unint64_t sub_236B3E030(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3E054();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3E054()
{
  unint64_t result;

  result = qword_25643F510;
  if (!qword_25643F510)
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25643F510);
  }
  return result;
}

_UNKNOWN **sub_236B3E098()
{
  return &protocol witness table for UInt.AtomicRepresentation;
}

_UNKNOWN **sub_236B3E0A4()
{
  return &protocol witness table for UInt.AtomicRepresentation;
}

unint64_t sub_236B3E0B0(uint64_t a1)
{
  unint64_t result;

  result = sub_236B3E0D4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_236B3E0D4()
{
  unint64_t result;

  result = qword_25643F518[0];
  if (!qword_25643F518[0])
  {
    result = MEMORY[0x23B7FD278](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(result, qword_25643F518);
  }
  return result;
}

_UNKNOWN **sub_236B3E118()
{
  return &protocol witness table for DoubleWord.AtomicRepresentation;
}

__n128 sub_236B3E124@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

__n128 sub_236B3E130@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = *v1;
  *a1 = *v1;
  return result;
}

unsigned __int128 *sub_236B3E13C@<X0>(unsigned __int128 *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int128 v5;
  unsigned __int128 v6;
  unsigned __int128 v7;

  switch(a2)
  {
    case 0:
      do
      {
        v6 = __ldxp(result);
        v3 = *((_QWORD *)&v6 + 1);
        v4 = v6;
      }
      while (__stxp(v6, result));
      goto LABEL_9;
    case 2:
      do
      {
        v5 = __ldaxp(result);
        v3 = *((_QWORD *)&v5 + 1);
        v4 = v5;
      }
      while (__stxp(v5, result));
LABEL_9:
      *a3 = v4;
      a3[1] = v3;
      return result;
    case 5:
      do
      {
        v7 = __ldaxp(result);
        v3 = *((_QWORD *)&v7 + 1);
        v4 = v7;
      }
      while (__stlxp(v7, result));
      goto LABEL_9;
  }
  result = (unsigned __int128 *)sub_236B48CD8();
  __break(1u);
  return result;
}

unint64_t *sub_236B3E1E4(unint64_t *result, unsigned __int128 *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *result;
  v4 = result[1];
  if (a3 == 5)
  {
    do
      __ldaxp(a2);
    while (__stlxp(__PAIR128__(v4, v3), a2));
  }
  else if (a3 == 3)
  {
    do
      __ldxp(a2);
    while (__stlxp(__PAIR128__(v4, v3), a2));
  }
  else if (a3)
  {
    result = (unint64_t *)sub_236B48CD8();
    __break(1u);
  }
  else
  {
    do
      __ldxp(a2);
    while (__stxp(__PAIR128__(v4, v3), a2));
  }
  return result;
}

unint64_t *sub_236B3E28C@<X0>(unint64_t *result@<X0>, unsigned __int128 *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int128 v8;
  unsigned __int128 v9;
  unsigned __int128 v10;
  unsigned __int128 v11;
  unsigned __int128 v12;

  v4 = *result;
  v5 = result[1];
  switch(a3)
  {
    case 0:
      do
      {
        v8 = __ldxp(a2);
        v6 = *((_QWORD *)&v8 + 1);
        v7 = v8;
      }
      while (__stxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 2:
      do
      {
        v10 = __ldaxp(a2);
        v6 = *((_QWORD *)&v10 + 1);
        v7 = v10;
      }
      while (__stxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 3:
      do
      {
        v11 = __ldxp(a2);
        v6 = *((_QWORD *)&v11 + 1);
        v7 = v11;
      }
      while (__stlxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 4:
      do
      {
        v9 = __ldaxp(a2);
        v6 = *((_QWORD *)&v9 + 1);
        v7 = v9;
      }
      while (__stlxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 5:
      do
      {
        v12 = __ldaxp(a2);
        v6 = *((_QWORD *)&v12 + 1);
        v7 = v12;
      }
      while (__stlxp(__PAIR128__(v5, v4), a2));
LABEL_11:
      *a4 = v7;
      a4[1] = v6;
      break;
    default:
      result = (unint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B3E364(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int128 v11;
  int v12;
  unsigned __int128 v13;
  int v14;
  unsigned __int128 v15;
  int v16;
  unsigned __int128 v17;
  int v18;
  BOOL v20;
  uint64_t result;

  v6 = *a2;
  v5 = a2[1];
  v7 = *a3;
  v8 = a3[1];
  switch(a5)
  {
    case 0:
      do
      {
        while (1)
        {
          v13 = __ldxp(a4);
          v9 = *((_QWORD *)&v13 + 1);
          v10 = v13;
          v14 = (_QWORD)v13 != v6;
          if (*((_QWORD *)&v13 + 1) != v5)
            ++v14;
          if (!v14)
            break;
          if (!__stxp(v13, a4))
            goto LABEL_29;
        }
      }
      while (__stxp(__PAIR128__(v8, v7), a4));
      goto LABEL_29;
    case 2:
      do
      {
        while (1)
        {
          v15 = __ldaxp(a4);
          v9 = *((_QWORD *)&v15 + 1);
          v10 = v15;
          v16 = (_QWORD)v15 != v6;
          if (*((_QWORD *)&v15 + 1) != v5)
            ++v16;
          if (!v16)
            break;
          if (!__stxp(v15, a4))
            goto LABEL_29;
        }
      }
      while (__stxp(__PAIR128__(v8, v7), a4));
      goto LABEL_29;
    case 3:
      do
      {
        while (1)
        {
          v17 = __ldxp(a4);
          v9 = *((_QWORD *)&v17 + 1);
          v10 = v17;
          v18 = (_QWORD)v17 != v6;
          if (*((_QWORD *)&v17 + 1) != v5)
            ++v18;
          if (!v18)
            break;
          if (!__stlxp(v17, a4))
            goto LABEL_29;
        }
      }
      while (__stlxp(__PAIR128__(v8, v7), a4));
      goto LABEL_29;
    case 4:
    case 5:
      goto LABEL_2;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  do
  {
    while (1)
    {
LABEL_2:
      v11 = __ldaxp(a4);
      v9 = *((_QWORD *)&v11 + 1);
      v10 = v11;
      v12 = (_QWORD)v11 != v6;
      if (*((_QWORD *)&v11 + 1) != v5)
        ++v12;
      if (!v12)
        break;
      if (!__stlxp(v11, a4))
        goto LABEL_29;
    }
  }
  while (__stlxp(__PAIR128__(v8, v7), a4));
LABEL_29:
  v20 = v10 == v6 && v9 == v5;
  *a1 = v10;
  a1[1] = v9;
  return v20;
}

uint64_t sub_236B3E4C0(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int128 v12;
  int v13;
  unsigned __int128 v14;
  int v15;
  BOOL v17;
  uint64_t result;
  unsigned __int128 v19;
  int v20;
  unsigned __int128 v21;
  int v22;

  v7 = *a2;
  v6 = a2[1];
  v8 = *a3;
  v9 = a3[1];
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_21;
      if (a6 == 2)
        goto LABEL_12;
      if (a6)
        goto LABEL_50;
      do
      {
        while (1)
        {
          v19 = __ldxp(a4);
          v10 = *((_QWORD *)&v19 + 1);
          v11 = v19;
          v20 = (_QWORD)v19 != v7;
          if (*((_QWORD *)&v19 + 1) != v6)
            ++v20;
          if (!v20)
            break;
          if (!__stxp(v19, a4))
            goto LABEL_27;
        }
      }
      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 2:
      if (a6 == 5)
        goto LABEL_21;
      if (a6 != 2 && a6)
        goto LABEL_50;
      do
      {
        while (1)
        {
LABEL_12:
          v12 = __ldaxp(a4);
          v10 = *((_QWORD *)&v12 + 1);
          v11 = v12;
          v13 = (_QWORD)v12 != v7;
          if (*((_QWORD *)&v12 + 1) != v6)
            ++v13;
          if (!v13)
            break;
          if (!__stxp(v12, a4))
            goto LABEL_27;
        }
      }
      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_21;
      if (a6)
        goto LABEL_50;
      do
      {
        while (1)
        {
          v21 = __ldxp(a4);
          v10 = *((_QWORD *)&v21 + 1);
          v11 = v21;
          v22 = (_QWORD)v21 != v7;
          if (*((_QWORD *)&v21 + 1) != v6)
            ++v22;
          if (!v22)
            break;
          if (!__stlxp(v21, a4))
            goto LABEL_27;
        }
      }
      while (__stlxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6)
        goto LABEL_50;
      break;
    default:
LABEL_50:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  do
  {
    while (1)
    {
LABEL_21:
      v14 = __ldaxp(a4);
      v10 = *((_QWORD *)&v14 + 1);
      v11 = v14;
      v15 = (_QWORD)v14 != v7;
      if (*((_QWORD *)&v14 + 1) != v6)
        ++v15;
      if (!v15)
        break;
      if (!__stlxp(v14, a4))
        goto LABEL_27;
    }
  }
  while (__stlxp(__PAIR128__(v9, v8), a4));
LABEL_27:
  v17 = v11 == v7 && v10 == v6;
  *a1 = v11;
  a1[1] = v10;
  return v17;
}

uint64_t sub_236B3E674(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int128 v12;
  int v13;
  unsigned __int128 v14;
  int v15;
  BOOL v17;
  uint64_t result;
  unsigned __int128 v19;
  int v20;
  unsigned __int128 v21;
  int v22;

  v7 = *a2;
  v6 = a2[1];
  v8 = *a3;
  v9 = a3[1];
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_21;
      if (a6 == 2)
        goto LABEL_12;
      if (a6)
        goto LABEL_50;
      do
      {
        while (1)
        {
          v19 = __ldxp(a4);
          v10 = *((_QWORD *)&v19 + 1);
          v11 = v19;
          v20 = (_QWORD)v19 != v7;
          if (*((_QWORD *)&v19 + 1) != v6)
            ++v20;
          if (!v20)
            break;
          if (!__stxp(v19, a4))
            goto LABEL_27;
        }
      }
      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 2:
      if (a6 == 5)
        goto LABEL_21;
      if (a6 != 2 && a6)
        goto LABEL_50;
      do
      {
        while (1)
        {
LABEL_12:
          v12 = __ldaxp(a4);
          v10 = *((_QWORD *)&v12 + 1);
          v11 = v12;
          v13 = (_QWORD)v12 != v7;
          if (*((_QWORD *)&v12 + 1) != v6)
            ++v13;
          if (!v13)
            break;
          if (!__stxp(v12, a4))
            goto LABEL_27;
        }
      }
      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_21;
      if (a6)
        goto LABEL_50;
      do
      {
        while (1)
        {
          v21 = __ldxp(a4);
          v10 = *((_QWORD *)&v21 + 1);
          v11 = v21;
          v22 = (_QWORD)v21 != v7;
          if (*((_QWORD *)&v21 + 1) != v6)
            ++v22;
          if (!v22)
            break;
          if (!__stlxp(v21, a4))
            goto LABEL_27;
        }
      }
      while (__stlxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6)
        goto LABEL_50;
      break;
    default:
LABEL_50:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  do
  {
    while (1)
    {
LABEL_21:
      v14 = __ldaxp(a4);
      v10 = *((_QWORD *)&v14 + 1);
      v11 = v14;
      v15 = (_QWORD)v14 != v7;
      if (*((_QWORD *)&v14 + 1) != v6)
        ++v15;
      if (!v15)
        break;
      if (!__stlxp(v14, a4))
        goto LABEL_27;
    }
  }
  while (__stlxp(__PAIR128__(v9, v8), a4));
LABEL_27:
  v17 = v11 == v7 && v10 == v6;
  *a1 = v11;
  a1[1] = v10;
  return v17;
}

ValueMetadata *type metadata accessor for Int8.AtomicRepresentation()
{
  return &type metadata for Int8.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int16.AtomicRepresentation()
{
  return &type metadata for Int16.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int32.AtomicRepresentation()
{
  return &type metadata for Int32.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int64.AtomicRepresentation()
{
  return &type metadata for Int64.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt8.AtomicRepresentation()
{
  return &type metadata for UInt8.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt16.AtomicRepresentation()
{
  return &type metadata for UInt16.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt32.AtomicRepresentation()
{
  return &type metadata for UInt32.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt64.AtomicRepresentation()
{
  return &type metadata for UInt64.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int.AtomicRepresentation()
{
  return &type metadata for Int.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt.AtomicRepresentation()
{
  return &type metadata for UInt.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for DoubleWord.AtomicRepresentation()
{
  return &type metadata for DoubleWord.AtomicRepresentation;
}

uint64_t AtomicOptionalRawRepresentableStorage._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v1, AssociatedTypeWitness);
}

uint64_t AtomicOptionalRawRepresentableStorage._storage.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(v1, a1, AssociatedTypeWitness);
}

uint64_t (*AtomicOptionalRawRepresentableStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t sub_236B3E9FC@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *);
  uint64_t v29;

  v26 = a5;
  v27 = a2;
  v28 = a1;
  v29 = a6;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(v29, 1, 1, a4);
  v25 = a3;
  v24 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
  v28(v18, v12);
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v6)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v12, v25);
  return result;
}

uint64_t sub_236B3EB94(uint64_t a1)
{
  return sub_236B3EBA8(a1);
}

uint64_t sub_236B3EBA8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v6 - v4, a1);
  return sub_236B48C84();
}

uint64_t sub_236B3EC64@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t AssociatedConformanceWitness;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a3;
  v5 = a2[2];
  v6 = sub_236B48CB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v25 - v8;
  v25[1] = a2[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v25 - v12;
  v25[2] = a2[4];
  v14 = swift_getAssociatedTypeWitness();
  v26 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v25 - v15;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v27 = a1;
  v17(v9, a1, v6);
  v18 = *(_QWORD *)(v5 - 8);
  v19 = 1;
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 1, v5);
  v21 = v7;
  v22 = v6;
  if (v20 != 1)
  {
    sub_236B48C78();
    v19 = 0;
    v21 = v18;
    v22 = v5;
  }
  (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v13, v19, 1, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v13, v14, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v27, v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v16, v14);
}

uint64_t sub_236B3EE88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t AssociatedConformanceWitness;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v21 = a2;
  v3 = a1[4];
  v20 = a1[3];
  v4 = a1[2];
  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)&v18 - v7;
  v9 = sub_236B48CB4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14 = v19;
  v13(v8, v19, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  v23 = v4;
  v24 = v20;
  v25 = v3;
  v26 = v4;
  sub_236B3E9FC((void (*)(char *, char *))sub_236B40A2C, (uint64_t)v22, MEMORY[0x24BEE4078], v4, v16, v21);
  (*(void (**)(uint64_t, _QWORD *))(*(a1 - 1) + 8))(v14, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_236B3F030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v18 = a4;
  v6 = a3[2];
  v7 = a3[3];
  swift_getAssociatedTypeWitness();
  v8 = sub_236B48CB4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - v10;
  v12 = a3[4];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(a1, v17, AssociatedTypeWitness, AssociatedConformanceWitness);
  v20 = v6;
  v21 = v7;
  v22 = v12;
  v23 = v6;
  sub_236B3E9FC((void (*)(char *, char *))sub_236B409E0, (uint64_t)v19, MEMORY[0x24BEE4078], v6, v15, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_236B3F18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t AssociatedConformanceWitness;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = a2;
  v25 = a3;
  v5 = *(_QWORD *)(a4 + 16);
  v6 = sub_236B48CB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - v8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - v12;
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v26 = a1;
  v14(v9, a1, v6);
  v15 = *(_QWORD *)(v5 - 8);
  v16 = 1;
  v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v5);
  v18 = v7;
  v19 = v6;
  if (v17 != 1)
  {
    sub_236B48C78();
    v16 = 0;
    v18 = v15;
    v19 = v5;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v19);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v13, v16, 1, AssociatedTypeWitness);
  v20 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v13, v24, v25, v20, AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v26, v6);
}

uint64_t sub_236B3F36C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t AssociatedConformanceWitness;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a2;
  v36 = a3;
  v37 = a5;
  v7 = a4[2];
  v8 = sub_236B48CB4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v33 - v10;
  v39 = a4[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = sub_236B48CB4();
  v33 = *(_QWORD *)(v13 - 8);
  v34 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v33 - v17;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v38 = a1;
  v19(v11, a1, v8);
  v20 = *(_QWORD *)(v7 - 8);
  v21 = 1;
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 1, v7);
  v23 = v9;
  v24 = v8;
  if (v22 != 1)
  {
    sub_236B48C78();
    v21 = 0;
    v23 = v20;
    v24 = v7;
  }
  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v16, v21, 1, AssociatedTypeWitness);
  v25 = a4[4];
  v26 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v16, v35, v36, v26, AssociatedConformanceWitness);
  MEMORY[0x24BDAC7A8](v28);
  v29 = v39;
  *(&v33 - 4) = v7;
  *(&v33 - 3) = v29;
  *(&v33 - 2) = v25;
  *(&v33 - 1) = v7;
  v30 = v34;
  sub_236B3E9FC((void (*)(char *, char *))sub_236B40A2C, (uint64_t)(&v33 - 6), MEMORY[0x24BEE4078], v7, v31, v37);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v38, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v30);
}

uint64_t sub_236B3F5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  int v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t AssociatedConformanceWitness;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  char *v52;
  _BYTE *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t TupleTypeMetadata2;
  uint64_t v67;

  v58 = a4;
  v59 = a5;
  v67 = a3;
  v61 = a1;
  v8 = *(_QWORD *)(a6 + 16);
  v9 = sub_236B48CB4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v52 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v51 - v13;
  v56 = a6;
  v15 = *(_QWORD *)(a6 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = sub_236B48CB4();
  v55 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v54 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v51 - v20;
  v60 = v22;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v57 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v23 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v53 = (char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v65 = (char *)&v51 - v25;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v26(v14, a2, v9);
  v27 = *(_QWORD *)(v8 - 8);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v29 = v28(v14, 1, v8);
  v64 = v15;
  v51 = v27;
  if (v29 == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v30(v21, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    sub_236B48C78();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v8);
    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v30(v21, 0, 1, AssociatedTypeWitness);
  }
  v31 = v21;
  v32 = v52;
  v26(v52, v67, v9);
  v33 = 1;
  v34 = v28(v32, 1, v8);
  v62 = v10;
  v63 = v9;
  v35 = v54;
  if (v34 != 1)
  {
    sub_236B48C78();
    v33 = 0;
    v10 = v51;
    v9 = v8;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v32, v9);
  v30(v35, v33, 1, AssociatedTypeWitness);
  v36 = v65;
  v37 = v8;
  v38 = TupleTypeMetadata2;
  v39 = &v65[*(int *)(TupleTypeMetadata2 + 48)];
  v40 = *(_QWORD *)(v56 + 32);
  v41 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  LOBYTE(v41) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 56))(v39, v31, v35, v58, v59, v41, AssociatedConformanceWitness);
  v43 = v55;
  v44 = *(void (**)(char *, uint64_t))(v55 + 8);
  v45 = v60;
  v44(v31, v60);
  *v36 = v41 & 1;
  v46 = &v53[*(int *)(v38 + 48)];
  *v53 = v41 & 1;
  v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v43 + 16))(v46, v39, v45);
  MEMORY[0x24BDAC7A8](v47);
  v48 = v64;
  *(&v51 - 4) = v37;
  *(&v51 - 3) = v48;
  *(&v51 - 2) = v40;
  *(&v51 - 1) = v37;
  sub_236B3E9FC((void (*)(char *, char *))sub_236B40A2C, (uint64_t)(&v51 - 6), MEMORY[0x24BEE4078], v37, v49, v61);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v67, v63);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v65, TupleTypeMetadata2);
  v44(v46, v45);
  return v41 & 1;
}

uint64_t sub_236B3FA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  int v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t AssociatedConformanceWitness;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  char *v53;
  _BYTE *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t TupleTypeMetadata2;
  uint64_t v69;

  v60 = a5;
  v61 = a6;
  v59 = a4;
  v69 = a3;
  v63 = a1;
  v9 = *(_QWORD *)(a7 + 16);
  v10 = sub_236B48CB4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v52 - v14;
  v57 = a7;
  v16 = *(_QWORD *)(a7 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = sub_236B48CB4();
  v56 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v55 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v52 - v21;
  v62 = v23;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v58 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v24 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v54 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v67 = (char *)&v52 - v26;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v27(v15, a2, v10);
  v28 = *(_QWORD *)(v9 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v15, 1, v9);
  v66 = v16;
  v52 = v28;
  if (v30 == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v31(v22, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    sub_236B48C78();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v9);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v31(v22, 0, 1, AssociatedTypeWitness);
  }
  v32 = v22;
  v33 = v53;
  v27(v53, v69, v10);
  v34 = 1;
  v35 = v29(v33, 1, v9);
  v64 = v11;
  v65 = v10;
  v36 = v55;
  if (v35 != 1)
  {
    sub_236B48C78();
    v34 = 0;
    v11 = v52;
    v10 = v9;
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v33, v10);
  v31(v36, v34, 1, AssociatedTypeWitness);
  v37 = v67;
  v38 = v9;
  v39 = TupleTypeMetadata2;
  v40 = &v67[*(int *)(TupleTypeMetadata2 + 48)];
  v41 = *(_QWORD *)(v57 + 32);
  v42 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  LOBYTE(v42) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 64))(v40, v32, v36, v59, v60, v61, v42, AssociatedConformanceWitness);
  v44 = v56;
  v45 = *(void (**)(char *, uint64_t))(v56 + 8);
  v46 = v62;
  v45(v32, v62);
  *v37 = v42 & 1;
  v47 = &v54[*(int *)(v39 + 48)];
  *v54 = v42 & 1;
  v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v44 + 16))(v47, v40, v46);
  MEMORY[0x24BDAC7A8](v48);
  v49 = v66;
  *(&v52 - 4) = v38;
  *(&v52 - 3) = v49;
  *(&v52 - 2) = v41;
  *(&v52 - 1) = v38;
  sub_236B3E9FC((void (*)(char *, char *))sub_236B40A2C, (uint64_t)(&v52 - 6), MEMORY[0x24BEE4078], v38, v50, v63);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v69, v65);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v67, TupleTypeMetadata2);
  v45(v47, v46);
  return v42 & 1;
}

uint64_t sub_236B3FE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  int v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t AssociatedConformanceWitness;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  char *v53;
  _BYTE *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t TupleTypeMetadata2;
  uint64_t v69;

  v60 = a5;
  v61 = a6;
  v59 = a4;
  v69 = a3;
  v63 = a1;
  v9 = *(_QWORD *)(a7 + 16);
  v10 = sub_236B48CB4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v52 - v14;
  v57 = a7;
  v16 = *(_QWORD *)(a7 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = sub_236B48CB4();
  v56 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v55 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v52 - v21;
  v62 = v23;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v58 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v24 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v54 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v67 = (char *)&v52 - v26;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v27(v15, a2, v10);
  v28 = *(_QWORD *)(v9 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v15, 1, v9);
  v66 = v16;
  v52 = v28;
  if (v30 == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v31(v22, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    sub_236B48C78();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v9);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v31(v22, 0, 1, AssociatedTypeWitness);
  }
  v32 = v22;
  v33 = v53;
  v27(v53, v69, v10);
  v34 = 1;
  v35 = v29(v33, 1, v9);
  v64 = v11;
  v65 = v10;
  v36 = v55;
  if (v35 != 1)
  {
    sub_236B48C78();
    v34 = 0;
    v11 = v52;
    v10 = v9;
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v33, v10);
  v31(v36, v34, 1, AssociatedTypeWitness);
  v37 = v67;
  v38 = v9;
  v39 = TupleTypeMetadata2;
  v40 = &v67[*(int *)(TupleTypeMetadata2 + 48)];
  v41 = *(_QWORD *)(v57 + 32);
  v42 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  LOBYTE(v42) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v40, v32, v36, v59, v60, v61, v42, AssociatedConformanceWitness);
  v44 = v56;
  v45 = *(void (**)(char *, uint64_t))(v56 + 8);
  v46 = v62;
  v45(v32, v62);
  *v37 = v42 & 1;
  v47 = &v54[*(int *)(v39 + 48)];
  *v54 = v42 & 1;
  v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v44 + 16))(v47, v40, v46);
  MEMORY[0x24BDAC7A8](v48);
  v49 = v66;
  *(&v52 - 4) = v38;
  *(&v52 - 3) = v49;
  *(&v52 - 2) = v41;
  *(&v52 - 1) = v38;
  sub_236B3E9FC((void (*)(char *, char *))sub_236B40A2C, (uint64_t)(&v52 - 6), MEMORY[0x24BEE4078], v38, v50, v63);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v69, v65);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v67, TupleTypeMetadata2);
  v45(v47, v46);
  return v42 & 1;
}

uint64_t sub_236B40284()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_236B4028C()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236B4032C(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(_QWORD *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_236B403EC(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_236B4045C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B404E0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B40564(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B405E8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B4066C(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2)
    return 0;
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (a2 <= v6)
    goto LABEL_18;
  v7 = *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if ((_DWORD)v7)
  {
    if (v7 > 3)
      LODWORD(v7) = 4;
    __asm { BR              X11 }
  }
  return (v6 + v11 + 1);
}

void sub_236B407DC(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (a3 <= v7)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      v9 = 4u;
    }
    else if (v11 >= 0x100)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 > 1;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for AtomicOptionalRawRepresentableStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicOptionalRawRepresentableStorage);
}

uint64_t sub_236B409E0(uint64_t a1)
{
  return sub_236B3EBA8(a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7FD260](a1, v6, a5);
}

uint64_t sub_236B40A2C(uint64_t a1)
{
  return sub_236B409E0(a1);
}

uint64_t _concurrencyWindow.getter()
{
  return 20;
}

uint64_t _AtomicReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  uint64_t result;

  if (a2)
  {
    sub_236B48CC0();
    sub_236B48C6C();
    DoubleWord.description.getter();
    sub_236B48C6C();
    swift_bridgeObjectRelease();
    result = sub_236B48CD8();
    __break(1u);
  }
  return result;
}

uint64_t sub_236B40B14(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  uint64_t result;

  if ((a1 & 0x8000000000000000) == 0 && !HIDWORD(a1))
    return a3(a2, a1);
  result = sub_236B48CCC();
  __break(1u);
  return result;
}

uint64_t static _AtomicReferenceStorage.atomicExchange(_:at:)(unint64_t a1, unsigned __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10[2];

  swift_unknownObjectRetain();
  v10[0] = sub_236B41CAC(a2, 0, 0, 1);
  v10[1] = v4;
  if ((sub_236B41D88(v10, a1, a2) & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    do
    {
      v7 = sub_236B41D88(v10, a1, a2);
      v6 = v8;
      swift_unknownObjectRelease();
    }
    while ((v7 & 1) == 0);
  }
  swift_unknownObjectRelease();
  return v6;
}

uint64_t static _AtomicReferenceStorage.atomicCompareExchange(expected:desired:at:)(uint64_t a1, unint64_t a2, unsigned __int128 *a3)
{
  char v3;

  v3 = sub_236B42084(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3 & 1;
}

uint64_t AtomicReferenceStorage._storage.setter(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*AtomicReferenceStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t AtomicReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  uint64_t result;

  if (_AtomicReferenceStorage.dispose()(a1, a2))
  {
    swift_unknownObjectRetain();
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_unknownObjectRelease();
      return a1;
    }
  }
  else
  {
    sub_236B48CCC();
    __break(1u);
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

void sub_236B40DD0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AtomicReferenceStorage.init(_:)();
  *a1 = v2;
  a1[1] = 0;
}

uint64_t sub_236B40DF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = AtomicReferenceStorage.dispose()(*v1, v1[1]);
  *a1 = result;
  return result;
}

uint64_t sub_236B40E28@<X0>(unsigned __int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = _s15AtomicsInternal23_AtomicReferenceStorageV10atomicLoad2atyXlSgSpyACG_tFZ_0(a1);
  if (v3)
  {
    v4 = v3;
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      result = swift_unknownObjectRelease();
      *a2 = v4;
      return result;
    }
  }
  else
  {
    sub_236B48CCC();
    __break(1u);
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B40F3C(unint64_t *a1, unsigned __int128 *a2)
{
  unint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v7[2];

  v3 = *a1;
  swift_unknownObjectRetain();
  v7[0] = sub_236B41CAC(a2, 0, 0, 1);
  v7[1] = v4;
  if ((sub_236B41D88(v7, v3, a2) & 1) == 0)
  {
    do
    {
      v5 = sub_236B41D88(v7, v3, a2);
      swift_unknownObjectRelease();
    }
    while ((v5 & 1) == 0);
  }
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_236B40FE8@<X0>(unint64_t *a1@<X0>, unsigned __int128 *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12[2];

  v5 = *a1;
  swift_unknownObjectRetain_n();
  v12[0] = sub_236B41CAC(a2, 0, 0, 1);
  v12[1] = v6;
  if ((sub_236B41D88(v12, v5, a2) & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    do
    {
      v9 = sub_236B41D88(v12, v5, a2);
      v8 = v10;
      swift_unknownObjectRelease();
    }
    while ((v9 & 1) == 0);
  }
  swift_unknownObjectRelease();
  if (v8)
  {
    v12[0] = v8;
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      result = swift_unknownObjectRelease();
      *a3 = v8;
      return result;
    }
  }
  else
  {
    sub_236B48CCC();
    __break(1u);
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B4118C(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  swift_unknownObjectRetain();
  v8 = sub_236B42084(v6, v7, a4);
  v10 = v9;
  swift_unknownObjectRelease();
  if (v10)
  {
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *a1 = v10;
      return v8 & 1;
    }
  }
  else
  {
    sub_236B48CCC();
    __break(1u);
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B412E4(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  return sub_236B41334(a1, a2, a3, a4) & 1;
}

uint64_t sub_236B4130C(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  return sub_236B41334(a1, a2, a3, a4) & 1;
}

uint64_t sub_236B41334(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  swift_unknownObjectRetain();
  v8 = sub_236B42084(v6, v7, a4);
  v10 = v9;
  swift_unknownObjectRelease();
  if (v10)
  {
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *a1 = v10;
      return v8 & 1;
    }
  }
  else
  {
    sub_236B48CCC();
    __break(1u);
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t (*AtomicOptionalReferenceStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t AtomicOptionalReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  uint64_t result;

  if (!_AtomicReferenceStorage.dispose()(a1, a2))
    return a1;
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    return a1;
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

void sub_236B41558(_QWORD *a1@<X8>)
{
  uint64_t v2;

  AtomicOptionalReferenceStorage.init(_:)();
  *a1 = v2;
  a1[1] = 0;
}

uint64_t sub_236B41580@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = AtomicOptionalReferenceStorage.dispose()(*v1, v1[1]);
  *a1 = v3;
  return result;
}

uint64_t sub_236B415B8@<X0>(unsigned __int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  unint64_t v5;
  unsigned __int128 v6;
  unsigned __int128 v7;
  int v8;
  uint64_t result;
  uint64_t v11;

  do
  {
    v6 = __ldxp(a1);
    v5 = *((_QWORD *)&v6 + 1);
    v4 = v6;
  }
  while (__stxp(v6, a1));
  if ((_QWORD)v6)
  {
    while ((_WORD)v5 != 0xFFFF)
    {
      do
      {
        while (1)
        {
          v7 = __ldaxp(a1);
          v8 = (_QWORD)v7 != v4;
          if (*((_QWORD *)&v7 + 1) != v5)
            ++v8;
          if (!v8)
            break;
          if (!__stxp(v7, a1))
            goto LABEL_10;
        }
      }
      while (__stxp(__PAIR128__(v5 & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(v5 + 1), v4), a1));
LABEL_10:
      if ((_QWORD)v7 == v4 && *((_QWORD *)&v7 + 1) == v5)
      {
        v5 = v5 & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(v5 + 1);
        goto LABEL_18;
      }
      v5 = *((_QWORD *)&v7 + 1);
      v4 = v7;
      if (!(_QWORD)v7)
        goto LABEL_18;
    }
    sub_236B48CD8();
    __break(1u);
    goto LABEL_23;
  }
  __dmb(9u);
LABEL_18:
  result = sub_236B41ADC(v4, v5, a1);
  v11 = result;
  if (!result)
  {
LABEL_21:
    *a2 = v11;
    return result;
  }
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    result = swift_unknownObjectRelease();
    goto LABEL_21;
  }
LABEL_23:
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B41744@<X0>(unint64_t *a1@<X0>, unsigned __int128 *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12[2];

  v5 = *a1;
  swift_unknownObjectRetain_n();
  v12[0] = sub_236B41CAC(a2, 0, 0, 1);
  v12[1] = v6;
  if ((sub_236B41D88(v12, v5, a2) & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    do
    {
      v9 = sub_236B41D88(v12, v5, a2);
      v8 = v10;
      swift_unknownObjectRelease();
    }
    while ((v9 & 1) == 0);
  }
  swift_unknownObjectRelease();
  if (!v8)
    goto LABEL_7;
  v12[0] = v8;
  swift_unknownObjectRetain_n();
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_7:
    result = swift_unknownObjectRelease();
    *a3 = v8;
    return result;
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B418A8(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  swift_unknownObjectRetain();
  v8 = sub_236B42084(v6, v7, a4);
  v10 = v9;
  swift_unknownObjectRelease();
  if (!v10)
    goto LABEL_4;
  swift_unknownObjectRetain_n();
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_4:
    swift_unknownObjectRelease();
    *a1 = v10;
    return v8 & 1;
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B419C4(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  swift_unknownObjectRetain();
  v8 = sub_236B42084(v6, v7, a4);
  v10 = v9;
  swift_unknownObjectRelease();
  if (!v10)
    goto LABEL_4;
  swift_unknownObjectRetain_n();
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_4:
    swift_unknownObjectRelease();
    *a1 = v10;
    return v8 & 1;
  }
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B41ADC(unint64_t a1, unint64_t a2, unsigned __int128 *a3)
{
  unint64_t v6;
  unint64_t v7;
  unsigned __int128 v8;
  int v9;
  BOOL v11;
  uint64_t result;

  if (!a1)
    return a1;
  swift_unknownObjectRetain();
  v6 = a1;
  v7 = a2;
  while ((_WORD)v7)
  {
    do
    {
      while (1)
      {
        v8 = __ldaxp(a3);
        v9 = (_QWORD)v8 != v6;
        if (*((_QWORD *)&v8 + 1) != v7)
          ++v9;
        if (!v9)
          break;
        if (!__stlxp(v8, a3))
          goto LABEL_10;
      }
    }
    while (__stlxp(__PAIR128__(v7 & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(v7 - 1), v6), a3));
LABEL_10:
    if ((_QWORD)v8 == v6 && *((_QWORD *)&v8 + 1) == v7)
      return a1;
    if ((_QWORD)v8)
      v11 = (_QWORD)v8 == a1;
    else
      v11 = 0;
    if (v11)
    {
      v7 = *((_QWORD *)&v8 + 1);
      v6 = v8;
      if ((*((_QWORD *)&v8 + 1) ^ a2) < 0x10000)
        continue;
    }
    swift_unknownObjectRelease();
    return a1;
  }
  result = sub_236B48CD8();
  __break(1u);
  return result;
}

uint64_t _s15AtomicsInternal23_AtomicReferenceStorageV10atomicLoad2atyXlSgSpyACG_tFZ_0(unsigned __int128 *a1)
{
  unint64_t v2;
  unint64_t v3;
  unsigned __int128 v4;
  unsigned __int128 v5;
  int v6;
  uint64_t result;

  do
  {
    v4 = __ldxp(a1);
    v3 = *((_QWORD *)&v4 + 1);
    v2 = v4;
  }
  while (__stxp(v4, a1));
  if ((_QWORD)v4)
  {
    while ((_WORD)v3 != 0xFFFF)
    {
      do
      {
        while (1)
        {
          v5 = __ldaxp(a1);
          v6 = (_QWORD)v5 != v2;
          if (*((_QWORD *)&v5 + 1) != v3)
            ++v6;
          if (!v6)
            break;
          if (!__stxp(v5, a1))
            goto LABEL_10;
        }
      }
      while (__stxp(__PAIR128__(v3 & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(v3 + 1), v2), a1));
LABEL_10:
      if ((_QWORD)v5 == v2 && *((_QWORD *)&v5 + 1) == v3)
      {
        v3 = v3 & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(v3 + 1);
        return sub_236B41ADC(v2, v3, a1);
      }
      v3 = *((_QWORD *)&v5 + 1);
      v2 = v5;
      if (!(_QWORD)v5)
        return sub_236B41ADC(v2, v3, a1);
    }
    result = sub_236B48CD8();
    __break(1u);
  }
  else
  {
    __dmb(9u);
    return sub_236B41ADC(v2, v3, a1);
  }
  return result;
}

uint64_t sub_236B41CAC(unsigned __int128 *a1, unint64_t a2, uint64_t a3, char a4)
{
  unsigned __int128 v4;
  unsigned __int128 v5;
  int v6;
  uint64_t result;

  if ((a4 & 1) != 0)
  {
    do
    {
      v4 = __ldxp(a1);
      a3 = *((_QWORD *)&v4 + 1);
      a2 = v4;
    }
    while (__stxp(v4, a1));
  }
  if (a2)
  {
    while ((_WORD)a3 != 0xFFFF)
    {
      do
      {
        while (1)
        {
          v5 = __ldaxp(a1);
          v6 = (_QWORD)v5 != a2;
          if (*((_QWORD *)&v5 + 1) != a3)
            ++v6;
          if (!v6)
            break;
          if (!__stxp(v5, a1))
            goto LABEL_11;
        }
      }
      while (__stxp(__PAIR128__(a3 & 0xFFFFFFFFFFFF0000 | (unsigned __int16)(a3 + 1), a2), a1));
LABEL_11:
      if ((_QWORD)v5 != a2 || *((_QWORD *)&v5 + 1) != a3)
      {
        a3 = *((_QWORD *)&v5 + 1);
        a2 = v5;
        if ((_QWORD)v5)
          continue;
      }
      return a2;
    }
    result = sub_236B48CD8();
    __break(1u);
  }
  else
  {
    __dmb(9u);
    return a2;
  }
  return result;
}

uint64_t sub_236B41D88(uint64_t *a1, unint64_t a2, unsigned __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int128 *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int128 v14;
  int v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned __int128 v22;
  int v23;
  uint64_t v24;
  unsigned __int128 v25;
  int v26;
  unint64_t v28;
  unsigned __int128 *v29;
  uint64_t v30;
  unsigned __int128 *v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  BOOL v35;

  v6 = *a1;
  v7 = a1[1];
  v8 = (v7 & 0xFFFFFFFFFFFF0000) + 0x10000;
  if (!*a1)
  {
    do
    {
      while (1)
      {
        v22 = __ldaxp(a3);
        v21 = *((_QWORD *)&v22 + 1);
        v20 = v22;
        v23 = (_QWORD)v22 != 0;
        if (*((_QWORD *)&v22 + 1) != v7)
          ++v23;
        if (!v23)
          break;
        if (!__stlxp(v22, a3))
          goto LABEL_22;
      }
    }
    while (__stlxp(__PAIR128__(v8, a2), a3));
LABEL_22:
    if (!((unint64_t)v22 | *((_QWORD *)&v22 + 1) ^ v7))
      return 1;
    v29 = a3;
LABEL_48:
    v32 = sub_236B41CAC(v29, v20, v21, 0);
    result = 0;
    *a1 = v32;
    a1[1] = v34;
    return result;
  }
  v9 = (unsigned __int16)a1[1];
  if (!(unsigned __int16)a1[1])
    goto LABEL_59;
  v10 = v9 + 20;
  sub_236B40B14(v9 + 20, v6, _sa_retain_n);
  v11 = a3;
  do
  {
    while (1)
    {
      v14 = __ldaxp(a3);
      v12 = *((_QWORD *)&v14 + 1);
      v13 = v14;
      v15 = (_QWORD)v14 != v6;
      if (*((_QWORD *)&v14 + 1) != v7)
        ++v15;
      if (!v15)
        break;
      if (!__stlxp(v14, a3))
        goto LABEL_10;
    }
  }
  while (__stlxp(__PAIR128__(v8, a2), a3));
LABEL_10:
  if (*((_QWORD *)&v14 + 1) == v7 && (_QWORD)v14 == v6)
  {
    v17 = v6;
    v18 = v14;
    LOWORD(v19) = WORD4(v14);
    goto LABEL_50;
  }
  if (((unint64_t)v7 ^ *((_QWORD *)&v14 + 1)) >> 16)
  {
    v19 = *((_QWORD *)&v14 + 1);
    v18 = v14;
LABEL_47:
    v30 = v6;
    v31 = v11;
    sub_236B40B14(v10 + 1, v30, (uint64_t (*)(uint64_t, unint64_t))_sa_release_n);
    v29 = v31;
    v20 = v18;
    v21 = v19;
    goto LABEL_48;
  }
  v24 = v6;
  while (1)
  {
    if (!v13)
      goto LABEL_59;
    if (v13 != v24)
      goto LABEL_59;
    v9 = (unsigned __int16)v12;
    if (!(_WORD)v12)
      goto LABEL_59;
    if (v10 < (unsigned __int16)v12)
    {
      if ((unsigned __int16)v12 + 20 - v10 < 0)
        goto LABEL_60;
      _sa_retain_n(v6, (unsigned __int16)v12 + 20 - v10);
      v10 = (unsigned __int16)v12 + 20;
      v11 = a3;
    }
    *a1 = v13;
    a1[1] = v12;
    do
    {
      while (1)
      {
        v25 = __ldaxp(v11);
        v19 = *((_QWORD *)&v25 + 1);
        v18 = v25;
        v26 = (_QWORD)v25 != v13;
        if (*((_QWORD *)&v25 + 1) != v12)
          ++v26;
        if (!v26)
          break;
        if (!__stlxp(v25, v11))
          goto LABEL_39;
      }
    }
    while (__stlxp(__PAIR128__(v8, a2), v11));
LABEL_39:
    if (*((_QWORD *)&v25 + 1) == v12 && (_QWORD)v25 == v13)
      break;
    v28 = v12 ^ *((_QWORD *)&v25 + 1);
    v24 = v13;
    v12 = *((_QWORD *)&v25 + 1);
    v13 = v25;
    if (v28 >= 0x10000)
      goto LABEL_47;
  }
  v17 = v13;
LABEL_50:
  if ((unsigned __int16)v19 != v9 || (v18 ? (v35 = v18 == v17) : (v35 = 0), !v35 || v10 < (unsigned __int16)v19))
  {
    while (1)
    {
LABEL_59:
      sub_236B48CD8();
      __break(1u);
LABEL_60:
      sub_236B48CCC();
      __break(1u);
    }
  }
  sub_236B40B14(v10 - (unsigned __int16)v19 + 1, v6, (uint64_t (*)(uint64_t, unint64_t))_sa_release_n);
  return 1;
}

uint64_t sub_236B42084(uint64_t a1, unint64_t a2, unsigned __int128 *a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;

  swift_unknownObjectRetain();
  v6 = sub_236B41CAC(a3, 0, 0, 1);
  v10 = v6;
  v11 = v7;
  if (!v6)
    goto LABEL_5;
LABEL_2:
  if (a1 && v6 == a1)
  {
    while ((sub_236B41D88((uint64_t *)&v10, a2, a3) & 1) == 0)
    {
      swift_unknownObjectRelease();
      v6 = v10;
      if (v10)
        goto LABEL_2;
LABEL_5:
      if (a1)
        goto LABEL_9;
    }
    if (v8)
    {
      if (!a1 || v8 != a1)
        goto LABEL_18;
    }
    else if (a1)
    {
LABEL_18:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    }
    return 1;
  }
LABEL_9:
  if (a2)
    swift_unknownObjectRelease();
  sub_236B41ADC(v6, v11, a3);
  return 0;
}

ValueMetadata *type metadata accessor for _AtomicReferenceStorage()
{
  return &type metadata for _AtomicReferenceStorage;
}

uint64_t sub_236B421B0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for AtomicReferenceStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicReferenceStorage);
}

uint64_t type metadata accessor for AtomicOptionalReferenceStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicOptionalReferenceStorage);
}

uint64_t sub_236B421D8()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t Bool.AtomicRepresentation._storage.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*Bool.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_UNKNOWN **sub_236B42214()
{
  return &protocol witness table for Bool.AtomicRepresentation;
}

void sub_236B42220(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1 & 1;
}

unsigned __int8 *sub_236B42230@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  unsigned __int8 v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
LABEL_6:
    *a3 = v3 & 1;
    return result;
  }
  if (!a2)
  {
    v3 = *result;
    goto LABEL_6;
  }
  result = (unsigned __int8 *)sub_236B48CD8();
  __break(1u);
  return result;
}

unsigned __int8 *sub_236B422BC@<X0>(unsigned __int8 *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  unsigned __int8 v4;
  unsigned __int8 v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5 & 1;
      break;
    default:
      result = (unsigned __int8 *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B42398(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  int v5;
  unsigned __int8 v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      v8 = 1;
      goto LABEL_18;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  *a1 = v7 & 1;
  return v8;
}

uint64_t sub_236B424B8(_BYTE *a1, _BYTE *a2, _BYTE *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t result;

  if ((*a2 & 1) != 0)
  {
    if (*a3)
    {
      v6 = 1;
      switch(a5)
      {
        case 0:
          v7 = 1;
          if (!a6)
            goto LABEL_97;
          if (a6 != 2)
            goto LABEL_76;
          goto LABEL_19;
        case 2:
          goto LABEL_35;
        case 3:
          v10 = 1;
          if (!a6)
            goto LABEL_101;
          if (a6 != 2)
            goto LABEL_80;
          goto LABEL_68;
        case 4:
          goto LABEL_41;
        default:
          goto LABEL_22;
      }
    }
    switch(a5)
    {
      case 0:
        v6 = 1;
        if (a6)
          goto LABEL_18;
        v7 = 0;
        goto LABEL_97;
      case 2:
        v6 = 1;
        if (!a6)
          goto LABEL_89;
        goto LABEL_61;
      case 3:
        v6 = 1;
        if (a6)
          goto LABEL_67;
        v10 = 0;
        goto LABEL_101;
      case 4:
        v6 = 1;
        if (!a6)
          goto LABEL_85;
        goto LABEL_49;
      case 5:
        v6 = 1;
        if (a6)
          goto LABEL_72;
        v9 = 0;
        goto LABEL_105;
      default:
        goto LABEL_110;
    }
  }
  if ((*a3 & 1) != 0)
  {
    v6 = 0;
    switch(a5)
    {
      case 0:
        v6 = 0;
        v7 = 1;
        if (a6 == 5)
          goto LABEL_77;
        if (a6 == 2)
          goto LABEL_19;
        if (a6)
          goto LABEL_110;
        goto LABEL_97;
      case 2:
        v6 = 0;
LABEL_35:
        v11 = 1;
        if (!a6)
        {
          LOBYTE(a6) = 1;
          goto LABEL_89;
        }
        if (a6 != 2)
          goto LABEL_62;
        goto LABEL_37;
      case 3:
        v6 = 0;
        v10 = 1;
        if (a6 == 5)
          goto LABEL_81;
        if (a6 == 2)
          goto LABEL_68;
        if (a6)
          goto LABEL_110;
        goto LABEL_101;
      case 4:
        v6 = 0;
LABEL_41:
        v12 = 1;
        if (!a6)
        {
          LOBYTE(a6) = 1;
          goto LABEL_85;
        }
        if (a6 != 2)
          goto LABEL_50;
        break;
      default:
LABEL_22:
        if (a5 != 5)
          goto LABEL_110;
        v9 = 1;
        if (a6 == 5)
          goto LABEL_93;
        if (a6 == 2)
          goto LABEL_73;
        if (a6)
          goto LABEL_110;
        goto LABEL_105;
    }
LABEL_43:
    while (1)
    {
      v8 = __ldaxr(a4);
      if (v8 != v6)
        break;
      if (!__stlxr(v12, a4))
        goto LABEL_107;
    }
LABEL_108:
    v13 = 0;
    __clrex();
  }
  else
  {
    switch(a5)
    {
      case 0:
        v6 = 0;
        if (a6)
        {
LABEL_18:
          v7 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_19:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stxr(v7, a4));
          }
          else
          {
LABEL_76:
            if (a6 != 5)
              goto LABEL_110;
            do
            {
LABEL_77:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stlxr(v7, a4));
          }
          break;
        }
        v7 = 0;
        do
        {
LABEL_97:
          v8 = __ldxr(a4);
          if (v8 != v6)
            goto LABEL_108;
        }
        while (__stxr(v7, a4));
        v13 = 1;
        goto LABEL_109;
      case 2:
        v6 = 0;
        if (a6)
        {
LABEL_61:
          v11 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_37:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stxr(v11, a4));
          }
          else
          {
LABEL_62:
            if (a6 != 5)
              goto LABEL_110;
            do
            {
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stlxr(v11, a4));
          }
        }
        else
        {
          do
          {
LABEL_89:
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_108;
          }
          while (__stxr(a6, a4));
        }
        break;
      case 3:
        v6 = 0;
        if (a6)
        {
LABEL_67:
          v10 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_68:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stlxr(v10, a4));
          }
          else
          {
LABEL_80:
            if (a6 != 5)
              goto LABEL_110;
            do
            {
LABEL_81:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stlxr(v10, a4));
          }
        }
        else
        {
          v10 = 0;
          do
          {
LABEL_101:
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_108;
          }
          while (__stlxr(v10, a4));
        }
        break;
      case 4:
        v6 = 0;
        if (a6)
        {
LABEL_49:
          v12 = 0;
          if (a6 == 2)
            goto LABEL_43;
LABEL_50:
          if (a6 != 5)
            goto LABEL_110;
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_108;
          }
          while (__stlxr(v12, a4));
        }
        else
        {
          do
          {
LABEL_85:
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_108;
          }
          while (__stlxr(a6, a4));
        }
        break;
      case 5:
        v6 = 0;
        if (a6)
        {
LABEL_72:
          v9 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_73:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stlxr(v9, a4));
          }
          else
          {
            if (a6 != 5)
            {
LABEL_110:
              sub_236B48C60();
              result = sub_236B48CD8();
              __break(1u);
              return result;
            }
            do
            {
LABEL_93:
              v8 = __ldaxr(a4);
              if (v8 != v6)
                goto LABEL_108;
            }
            while (__stlxr(v9, a4));
          }
        }
        else
        {
          v9 = 0;
          do
          {
LABEL_105:
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_108;
          }
          while (__stlxr(v9, a4));
        }
        break;
      default:
        goto LABEL_110;
    }
LABEL_107:
    v13 = 1;
  }
LABEL_109:
  *a1 = v8 & 1;
  return v13;
}

uint64_t sub_236B428DC(_BYTE *a1, _BYTE *a2, _BYTE *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int v7;
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t result;

  if ((*a2 & 1) != 0)
  {
    if (*a3)
    {
      v6 = 1;
      switch(a5)
      {
        case 0:
          v7 = 1;
          if (!a6)
            goto LABEL_17;
          goto LABEL_47;
        case 2:
          goto LABEL_38;
        case 3:
          goto LABEL_41;
        case 4:
          goto LABEL_33;
        default:
          goto LABEL_19;
      }
    }
    switch(a5)
    {
      case 0:
        LOBYTE(v6) = 0;
        v7 = 1;
        if (!a6)
          goto LABEL_17;
        goto LABEL_47;
      case 2:
        LOBYTE(v6) = 0;
LABEL_38:
        v7 = 1;
        if (!a6)
          goto LABEL_48;
        goto LABEL_47;
      case 3:
        LOBYTE(v6) = 0;
LABEL_41:
        v7 = 1;
        if (a6)
          goto LABEL_42;
        goto LABEL_56;
      case 4:
        LOBYTE(v6) = 0;
LABEL_33:
        v7 = 1;
        if (!a6)
          goto LABEL_52;
        goto LABEL_42;
      case 5:
        v9 = 0;
        v6 = 1;
        if (!a6)
          goto LABEL_61;
        goto LABEL_59;
      default:
        goto LABEL_67;
    }
  }
  if ((*a3 & 1) != 0)
  {
    v6 = 0;
    switch(a5)
    {
      case 0:
        v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5)
          goto LABEL_52;
        if (a6 == 2)
          goto LABEL_48;
        if (a6)
          goto LABEL_67;
        goto LABEL_17;
      case 2:
        v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6)
          goto LABEL_48;
        goto LABEL_47;
      case 3:
        v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5 || a6 == 2)
          goto LABEL_52;
        if (a6)
          goto LABEL_67;
        goto LABEL_56;
      case 4:
        v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6)
          goto LABEL_52;
        goto LABEL_42;
      default:
LABEL_19:
        if (a5 != 5)
          goto LABEL_67;
        v9 = 1;
        if (a6 != 5 && a6 != 2 && a6)
          goto LABEL_67;
        goto LABEL_61;
    }
  }
  switch(a5)
  {
    case 0:
      LOBYTE(v6) = 0;
      v7 = 0;
      if (a6)
        goto LABEL_47;
LABEL_17:
      v8 = __ldxr(a4);
      if (v8 == v7)
        goto LABEL_49;
      goto LABEL_64;
    case 2:
      LOBYTE(v6) = 0;
      v7 = 0;
      if (!a6)
        goto LABEL_48;
LABEL_47:
      if (a6 != 2)
        goto LABEL_51;
LABEL_48:
      v8 = __ldaxr(a4);
      if (v8 != v7)
        goto LABEL_64;
LABEL_49:
      if (!__stxr(v6, a4))
        goto LABEL_63;
      goto LABEL_65;
    case 3:
      LOBYTE(v6) = 0;
      v7 = 0;
      if (a6)
        goto LABEL_42;
LABEL_56:
      v8 = __ldxr(a4);
      if (v8 == v7)
        goto LABEL_53;
      goto LABEL_64;
    case 4:
      LOBYTE(v6) = 0;
      v7 = 0;
      if (!a6)
        goto LABEL_52;
LABEL_42:
      if (a6 == 2)
        goto LABEL_52;
LABEL_51:
      if (a6 != 5)
        goto LABEL_67;
LABEL_52:
      v8 = __ldaxr(a4);
      if (v8 != v7)
        goto LABEL_64;
LABEL_53:
      if (!__stlxr(v6, a4))
        goto LABEL_63;
      goto LABEL_65;
    case 5:
      v9 = 0;
      v6 = 0;
      if (!a6)
        goto LABEL_61;
LABEL_59:
      if (a6 == 2 || a6 == 5)
      {
LABEL_61:
        v8 = __ldaxr(a4);
        if (v8 == v6)
        {
          if (!__stlxr(v9, a4))
          {
LABEL_63:
            v10 = 1;
LABEL_66:
            *a1 = v8 & 1;
            return v10;
          }
        }
        else
        {
LABEL_64:
          __clrex();
        }
LABEL_65:
        v10 = 0;
        goto LABEL_66;
      }
LABEL_67:
      sub_236B48C60();
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_67;
  }
}

ValueMetadata *type metadata accessor for Bool.AtomicRepresentation()
{
  return &type metadata for Bool.AtomicRepresentation;
}

uint64_t sub_236B42BC8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  return result;
}

unint64_t *sub_236B42C34@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B42FA0(result, a2, a3);
}

unint64_t *sub_236B42C40@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B43100(result, a2, a3, a4);
}

uint64_t sub_236B42C48(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B43228(a1, a2, a3, a4, a5);
}

uint64_t sub_236B42C50(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B433B0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42C78(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B4368C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42CA4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  return result;
}

unint64_t *sub_236B42D10@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B42FA0(result, a2, a3);
}

unint64_t *sub_236B42D18@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B43100(result, a2, a3, a4);
}

uint64_t sub_236B42D20(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B43228(a1, a2, a3, a4, a5);
}

uint64_t sub_236B42D28(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B433B0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42D50(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B4368C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42D7C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  return result;
}

unint64_t *sub_236B42DE8@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B42FA0(result, a2, a3);
}

unint64_t *sub_236B42DF0@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B43100(result, a2, a3, a4);
}

uint64_t sub_236B42DF8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B43228(a1, a2, a3, a4, a5);
}

uint64_t sub_236B42E00(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B433B0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42E28(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B4368C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42E54@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  return result;
}

unint64_t *sub_236B42EC0@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B42FA0(result, a2, a3);
}

unint64_t *sub_236B42EC8@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B43100(result, a2, a3, a4);
}

uint64_t sub_236B42ED0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B43228(a1, a2, a3, a4, a5);
}

uint64_t sub_236B42ED8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B433B0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42F00(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B4368C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B42F2C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  return result;
}

unint64_t *sub_236B42F98@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_236B42FA0(result, a2, a3);
}

unint64_t *sub_236B42FA0@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
    if (v3)
    {
LABEL_4:
      *a3 = v3;
      return result;
    }
    goto LABEL_7;
  }
  if (!a2)
  {
    v3 = *result;
    if (*result)
      goto LABEL_4;
LABEL_7:
    sub_236B48CCC();
    __break(1u);
  }
  result = (unint64_t *)sub_236B48CD8();
  __break(1u);
  return result;
}

unint64_t *sub_236B43070(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  unint64_t v3;

  v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unint64_t *)sub_236B48CD8();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unint64_t *sub_236B430F8@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_236B43100(result, a2, a3, a4);
}

unint64_t *sub_236B43100@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      if (!v5)
        goto LABEL_14;
      *a4 = v5;
      break;
    default:
      sub_236B48CD8();
      __break(1u);
LABEL_14:
      result = (unint64_t *)sub_236B48CCC();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B43220(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B43228(a1, a2, a3, a4, a5);
}

uint64_t sub_236B43228(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      goto LABEL_16;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      sub_236B48CD8();
      __break(1u);
      goto LABEL_21;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  if (v7)
  {
    *a1 = v7;
    return v8;
  }
  else
  {
LABEL_21:
    result = sub_236B48CCC();
    __break(1u);
  }
  return result;
}

uint64_t sub_236B43388(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B433B0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B433B0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 2:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 3:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 4:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_41;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }
      goto LABEL_61;
    case 5:
      if (a6)
      {
        if (a6 == 2)
        {
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        }
        else
        {
          if (a6 != 5)
          {
LABEL_64:
            sub_236B48CD8();
            __break(1u);
            goto LABEL_65;
          }
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_61;
          }
        }
LABEL_41:
        v9 = 0;
        __clrex();
        goto LABEL_62;
      }
      do
      {
        v8 = __ldaxr(a4);
        if (v8 != v6)
          goto LABEL_41;
      }
      while (__stlxr(v7, a4));
LABEL_61:
      v9 = 1;
LABEL_62:
      if (v8)
      {
        *a1 = v8;
        return v9;
      }
LABEL_65:
      result = sub_236B48CCC();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }
}

uint64_t sub_236B43664(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_236B4368C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_236B4368C(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 == 2)
        goto LABEL_13;
      if (a6)
        goto LABEL_30;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_14;
    case 2:
      if (a6 == 5)
        goto LABEL_24;
      if (a6 != 2 && a6)
        goto LABEL_30;
LABEL_13:
      v8 = __ldaxr(a4);
      if (v8 != v6)
        goto LABEL_20;
LABEL_14:
      if (!__stxr(v7, a4))
        goto LABEL_28;
      goto LABEL_26;
    case 3:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
      if (a6)
        goto LABEL_30;
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_20;
      goto LABEL_25;
    case 4:
      if (a6 != 5 && a6 != 2)
        goto LABEL_23;
      goto LABEL_24;
    case 5:
      if (a6 == 5 || a6 == 2)
        goto LABEL_24;
LABEL_23:
      if (a6)
        goto LABEL_30;
LABEL_24:
      v8 = __ldaxr(a4);
      if (v8 == v6)
      {
LABEL_25:
        if (!__stlxr(v7, a4))
        {
LABEL_28:
          v9 = 1;
          if (v8)
            goto LABEL_27;
          goto LABEL_29;
        }
      }
      else
      {
LABEL_20:
        __clrex();
      }
LABEL_26:
      v9 = 0;
      if (v8)
      {
LABEL_27:
        *a1 = v8;
        return v9;
      }
LABEL_29:
      sub_236B48CCC();
      __break(1u);
LABEL_30:
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_30;
  }
}

_UNKNOWN **sub_236B43854()
{
  return &protocol witness table for UnsafeRawPointer.AtomicRepresentation;
}

_UNKNOWN **sub_236B43860()
{
  return &protocol witness table for UnsafeMutableRawPointer.AtomicRepresentation;
}

void sub_236B4386C()
{
  JUMPOUT(0x23B7FD278);
}

void sub_236B4387C()
{
  JUMPOUT(0x23B7FD278);
}

void sub_236B4388C()
{
  JUMPOUT(0x23B7FD278);
}

_UNKNOWN **sub_236B4389C()
{
  return &protocol witness table for UnsafeRawPointer.AtomicOptionalRepresentation;
}

_UNKNOWN **sub_236B438A8()
{
  return &protocol witness table for UnsafeMutableRawPointer.AtomicOptionalRepresentation;
}

void sub_236B438B4()
{
  JUMPOUT(0x23B7FD278);
}

uint64_t sub_236B438C4(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B7FD278](&protocol conformance descriptor for UnsafePointer<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_236B438F0()
{
  JUMPOUT(0x23B7FD278);
}

uint64_t sub_236B43900(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B7FD278](&protocol conformance descriptor for UnsafeMutablePointer<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_236B4392C()
{
  JUMPOUT(0x23B7FD278);
}

uint64_t sub_236B4393C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B7FD278](&protocol conformance descriptor for Unmanaged<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t *sub_236B43968@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3;

  if (a2 == 5 || a2 == 2)
  {
    v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }
  if (!a2)
  {
    v3 = *result;
    goto LABEL_6;
  }
  result = (unint64_t *)sub_236B48CD8();
  __break(1u);
  return result;
}

unint64_t *sub_236B439F0@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *result;
  switch(a3)
  {
    case 0:
      do
        v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2:
      do
        v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3:
      do
        v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5:
      do
        v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (unint64_t *)sub_236B48CD8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_236B43AC8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = *a3;
  switch(a5)
  {
    case 0:
      do
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
      }
      while (__stxr(v6, a4));
      goto LABEL_16;
    case 2:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stxr(v6, a4))
          goto LABEL_16;
      }
    case 3:
      while (1)
      {
        v7 = __ldxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 4:
      while (1)
      {
        v7 = __ldaxr(a4);
        if (v7 != v5)
          goto LABEL_17;
        if (!__stlxr(v6, a4))
          goto LABEL_16;
      }
    case 5:
      break;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  while (1)
  {
    v7 = __ldaxr(a4);
    if (v7 != v5)
      break;
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      v8 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v8 = 0;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

uint64_t sub_236B43BE0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  if (*a3)
  {
    switch(a5)
    {
      case 0:
        goto LABEL_8;
      case 2:
        goto LABEL_24;
      case 3:
        goto LABEL_32;
      case 4:
        goto LABEL_16;
      case 5:
        if (a6 == 5)
          goto LABEL_65;
        if (a6 == 2)
          goto LABEL_42;
        if (a6)
          goto LABEL_69;
        goto LABEL_45;
      default:
        goto LABEL_69;
    }
  }
  switch(a5)
  {
    case 0:
LABEL_8:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_39;
            if (!__stxr(v7, a4))
              goto LABEL_67;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }
      goto LABEL_67;
    case 2:
LABEL_24:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
            if (!__stxr(v7, a4))
              goto LABEL_67;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }
      goto LABEL_67;
    case 3:
LABEL_32:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldxr(a4);
            if (v8 != v6)
              goto LABEL_39;
            if (!__stlxr(v7, a4))
              goto LABEL_67;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }
      goto LABEL_67;
    case 4:
LABEL_16:
      switch(a6)
      {
        case 0:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
            if (!__stlxr(v7, a4))
              goto LABEL_67;
          }
        case 2:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
          break;
        case 5:
          do
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }
      goto LABEL_67;
    case 5:
      switch(a6)
      {
        case 0:
          do
          {
LABEL_45:
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
          }
          while (__stlxr(v7, a4));
LABEL_67:
          v9 = 1;
LABEL_68:
          *a1 = v8;
          return v9;
        case 2:
LABEL_42:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              break;
            if (!__stlxr(v7, a4))
              goto LABEL_67;
          }
LABEL_39:
          v9 = 0;
          __clrex();
          goto LABEL_68;
        case 5:
LABEL_65:
          while (1)
          {
            v8 = __ldaxr(a4);
            if (v8 != v6)
              goto LABEL_39;
            if (!__stlxr(v7, a4))
              goto LABEL_67;
          }
      }
LABEL_69:
      sub_236B48C60();
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_69;
  }
}

uint64_t sub_236B43E88(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v6 = *a2;
  v7 = *a3;
  if (*a3)
  {
    switch(a5)
    {
      case 0:
        if (a6 == 5)
          goto LABEL_32;
        if (a6 == 2)
          goto LABEL_27;
        if (a6)
          goto LABEL_42;
        goto LABEL_35;
      case 2:
        if (a6 == 5)
          goto LABEL_32;
        if (a6 != 2 && a6)
          goto LABEL_42;
        goto LABEL_27;
      case 3:
        if (a6 == 5 || a6 == 2)
          goto LABEL_32;
        if (a6)
          goto LABEL_42;
        goto LABEL_38;
      case 4:
      case 5:
        if (a6 != 5 && a6 != 2 && a6)
          goto LABEL_42;
        goto LABEL_32;
      default:
        goto LABEL_42;
    }
  }
  switch(a5)
  {
    case 0:
      if (a6)
      {
        if (a6 != 2)
          goto LABEL_31;
        goto LABEL_27;
      }
LABEL_35:
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_39;
      goto LABEL_36;
    case 2:
      if (a6 && a6 != 2)
        goto LABEL_31;
LABEL_27:
      v8 = __ldaxr(a4);
      if (v8 != v6)
        goto LABEL_39;
LABEL_36:
      if (!__stxr(v7, a4))
        goto LABEL_37;
      goto LABEL_40;
    case 3:
      if (a6)
        goto LABEL_30;
LABEL_38:
      v8 = __ldxr(a4);
      if (v8 != v6)
        goto LABEL_39;
      goto LABEL_33;
    case 4:
    case 5:
      if (!a6)
        goto LABEL_32;
LABEL_30:
      if (a6 == 2)
        goto LABEL_32;
LABEL_31:
      if (a6 == 5)
      {
LABEL_32:
        v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_33:
          if (!__stlxr(v7, a4))
          {
LABEL_37:
            v9 = 1;
LABEL_41:
            *a1 = v8;
            return v9;
          }
        }
        else
        {
LABEL_39:
          __clrex();
        }
LABEL_40:
        v9 = 0;
        goto LABEL_41;
      }
LABEL_42:
      sub_236B48C60();
      result = sub_236B48CD8();
      __break(1u);
      return result;
    default:
      goto LABEL_42;
  }
}

ValueMetadata *type metadata accessor for UnsafeRawPointer.AtomicRepresentation()
{
  return &type metadata for UnsafeRawPointer.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UnsafeMutableRawPointer.AtomicRepresentation()
{
  return &type metadata for UnsafeMutableRawPointer.AtomicRepresentation;
}

uint64_t type metadata accessor for UnsafePointer.AtomicRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafePointer.AtomicRepresentation);
}

uint64_t type metadata accessor for UnsafeMutablePointer.AtomicRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeMutablePointer.AtomicRepresentation);
}

uint64_t type metadata accessor for Unmanaged.AtomicRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Unmanaged.AtomicRepresentation);
}

ValueMetadata *type metadata accessor for UnsafeRawPointer.AtomicOptionalRepresentation()
{
  return &type metadata for UnsafeRawPointer.AtomicOptionalRepresentation;
}

ValueMetadata *type metadata accessor for UnsafeMutableRawPointer.AtomicOptionalRepresentation()
{
  return &type metadata for UnsafeMutableRawPointer.AtomicOptionalRepresentation;
}

uint64_t type metadata accessor for UnsafePointer.AtomicOptionalRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafePointer.AtomicOptionalRepresentation);
}

uint64_t type metadata accessor for UnsafeMutablePointer.AtomicOptionalRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeMutablePointer.AtomicOptionalRepresentation);
}

uint64_t type metadata accessor for Unmanaged.AtomicOptionalRepresentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Unmanaged.AtomicOptionalRepresentation);
}

uint64_t sub_236B440CC(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  unsigned __int8 v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a3;
  v6 = *a2;
  switch(a5)
  {
    case 0:
      v7 = __ldxr(a4);
      if (v7 != v6)
        goto LABEL_12;
      goto LABEL_7;
    case 2:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_12;
LABEL_7:
      if (!__stxr(v5, a4))
        goto LABEL_11;
      goto LABEL_13;
    case 3:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_10;
      goto LABEL_12;
    case 4:
    case 5:
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          v8 = 1;
          goto LABEL_14;
        }
      }
      else
      {
LABEL_12:
        __clrex();
      }
LABEL_13:
      v8 = 0;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B441BC(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5)
{
  unsigned __int16 v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a3;
  v6 = *a2;
  switch(a5)
  {
    case 0:
      v7 = __ldxr(a4);
      if (v7 != v6)
        goto LABEL_12;
      goto LABEL_7;
    case 2:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_12;
LABEL_7:
      if (!__stxr(v5, a4))
        goto LABEL_11;
      goto LABEL_13;
    case 3:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_10;
      goto LABEL_12;
    case 4:
    case 5:
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          v8 = 1;
          goto LABEL_14;
        }
      }
      else
      {
LABEL_12:
        __clrex();
      }
LABEL_13:
      v8 = 0;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B442AC(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a3;
  v6 = *a2;
  switch(a5)
  {
    case 0:
      v7 = __ldxr(a4);
      if (v7 != v6)
        goto LABEL_12;
      goto LABEL_7;
    case 2:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_12;
LABEL_7:
      if (!__stxr(v5, a4))
        goto LABEL_11;
      goto LABEL_13;
    case 3:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_10;
      goto LABEL_12;
    case 4:
    case 5:
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          v8 = 1;
          goto LABEL_14;
        }
      }
      else
      {
LABEL_12:
        __clrex();
      }
LABEL_13:
      v8 = 0;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B4439C(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a3;
  v6 = *a2;
  switch(a5)
  {
    case 0:
      v7 = __ldxr(a4);
      if (v7 != v6)
        goto LABEL_12;
      goto LABEL_7;
    case 2:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_12;
LABEL_7:
      if (!__stxr(v5, a4))
        goto LABEL_11;
      goto LABEL_13;
    case 3:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_10;
      goto LABEL_12;
    case 4:
    case 5:
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          v8 = 1;
          goto LABEL_14;
        }
      }
      else
      {
LABEL_12:
        __clrex();
      }
LABEL_13:
      v8 = 0;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B4448C(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int128 v11;
  int v12;
  unsigned __int128 v13;
  int v14;
  unsigned __int128 v15;
  int v16;
  unsigned __int128 v17;
  int v18;
  BOOL v20;
  uint64_t result;

  v5 = *a3;
  v6 = a3[1];
  v8 = *a2;
  v7 = a2[1];
  switch(a5)
  {
    case 0:
      do
      {
        while (1)
        {
          v13 = __ldxp(a4);
          v9 = *((_QWORD *)&v13 + 1);
          v10 = v13;
          v14 = (_QWORD)v13 != v8;
          if (*((_QWORD *)&v13 + 1) != v7)
            ++v14;
          if (!v14)
            break;
          if (!__stxp(v13, a4))
            goto LABEL_29;
        }
      }
      while (__stxp(__PAIR128__(v6, v5), a4));
      goto LABEL_29;
    case 2:
      do
      {
        while (1)
        {
          v15 = __ldaxp(a4);
          v9 = *((_QWORD *)&v15 + 1);
          v10 = v15;
          v16 = (_QWORD)v15 != v8;
          if (*((_QWORD *)&v15 + 1) != v7)
            ++v16;
          if (!v16)
            break;
          if (!__stxp(v15, a4))
            goto LABEL_29;
        }
      }
      while (__stxp(__PAIR128__(v6, v5), a4));
      goto LABEL_29;
    case 3:
      do
      {
        while (1)
        {
          v17 = __ldxp(a4);
          v9 = *((_QWORD *)&v17 + 1);
          v10 = v17;
          v18 = (_QWORD)v17 != v8;
          if (*((_QWORD *)&v17 + 1) != v7)
            ++v18;
          if (!v18)
            break;
          if (!__stlxp(v17, a4))
            goto LABEL_29;
        }
      }
      while (__stlxp(__PAIR128__(v6, v5), a4));
      goto LABEL_29;
    case 4:
    case 5:
      goto LABEL_2;
    default:
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
  do
  {
    while (1)
    {
LABEL_2:
      v11 = __ldaxp(a4);
      v9 = *((_QWORD *)&v11 + 1);
      v10 = v11;
      v12 = (_QWORD)v11 != v8;
      if (*((_QWORD *)&v11 + 1) != v7)
        ++v12;
      if (!v12)
        break;
      if (!__stlxp(v11, a4))
        goto LABEL_29;
    }
  }
  while (__stlxp(__PAIR128__(v6, v5), a4));
LABEL_29:
  v20 = v10 == v8 && v9 == v7;
  *a1 = v10;
  a1[1] = v9;
  return v20;
}

uint64_t sub_236B445E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(void);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _BYTE *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t AssociatedConformanceWitness;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t TupleTypeMetadata2;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v69 = a4;
  v72 = a1;
  v10 = *(_QWORD *)(a6 + 16);
  v80 = *(_QWORD *)(a6 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = sub_236B48CB4();
  v68 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v75 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v77 = (char *)&v61 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v71 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v64 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v67 = (char *)&v61 - v18;
  v19 = sub_236B48CB4();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v61 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v78 = v27;
  v79 = v26;
  v28 = *(void (**)(void))(v27 + 16);
  v76 = (char *)&v61 - v29;
  v28();
  if (a5 <= 5 && ((0x3Du >> a5) & 1) != 0)
  {
    v65 = a6;
    v73 = v12;
    v74 = a3;
    v70 = a5;
    v30 = qword_236B498D0[a5];
    v31 = a2;
    v32 = v79;
    ((void (*)(char *, uint64_t, uint64_t))v28)(v25, v31, v79);
    v33 = *(_QWORD *)(v10 - 8);
    v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    v35 = v34(v25, 1, v10);
    v62 = v33;
    v63 = v30;
    if (v35 == 1)
    {
      v36 = v78;
      (*(void (**)(char *, uint64_t))(v78 + 8))(v25, v32);
      v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
      v37(v77, 1, 1, AssociatedTypeWitness);
    }
    else
    {
      v38 = v77;
      sub_236B48C78();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v10);
      v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
      v37(v38, 0, 1, AssociatedTypeWitness);
      v36 = v78;
    }
    v39 = AssociatedTypeWitness;
    ((void (*)(char *, char *, uint64_t))v28)(v22, v76, v32);
    v40 = 1;
    if (v34(v22, 1, v10) != 1)
    {
      sub_236B48C78();
      v40 = 0;
      v36 = v62;
      v32 = v10;
    }
    (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v32);
    v41 = v75;
    v37(v75, v40, 1, v39);
    v43 = TupleTypeMetadata2;
    v42 = v67;
    v44 = &v67[*(int *)(TupleTypeMetadata2 + 48)];
    v45 = *(_QWORD *)(v65 + 32);
    v46 = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v48 = v77;
    LOBYTE(v46) = (*(uint64_t (**)(char *, char *, char *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v44, v77, v41, v69, v70, v63, v46, AssociatedConformanceWitness);
    v49 = v68;
    v75 = *(char **)(v68 + 8);
    v50 = v73;
    ((void (*)(char *, uint64_t))v75)(v48, v73);
    v51 = v46 & 1;
    *v42 = v46 & 1;
    v52 = &v64[*(int *)(v43 + 48)];
    *v64 = v46 & 1;
    v53 = (*(uint64_t (**)(_BYTE *, char *, uint64_t))(v49 + 16))(v52, v44, v50);
    MEMORY[0x24BDAC7A8](v53);
    v54 = v80;
    *(&v61 - 4) = v10;
    *(&v61 - 3) = v54;
    v59 = v45;
    v60 = v10;
    sub_236B3E9FC((void (*)(char *, char *))sub_236B45B18, (uint64_t)(&v61 - 6), MEMORY[0x24BEE4078], v10, v55, v72);
    v56 = v79;
    v57 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
    v57(v74, v79);
    (*(void (**)(_BYTE *, uint64_t))(v71 + 8))(v42, v43);
    v57((uint64_t)v76, v56);
    ((void (*)(_BYTE *, uint64_t))v75)(v52, v50);
    return v51;
  }
  else
  {
    result = sub_236B48CD8();
    __break(1u);
  }
  return result;
}

uint64_t sub_236B44AEC(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if ((unint64_t)(a5 - 2) >= 4 && a5 != 0)
  {
    sub_236B48CD8();
    __break(1u);
LABEL_9:
    sub_236B48CCC();
    __break(1u);
    goto LABEL_10;
  }
  v8 = *a3;
  v9 = *a2;
  swift_unknownObjectRetain_n();
  v10 = sub_236B42084(v9, v8, a4);
  v12 = v11;
  swift_unknownObjectRelease();
  if (!v12)
    goto LABEL_9;
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *a1 = v12;
    return v10 & 1;
  }
LABEL_10:
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B44CA8(_QWORD *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if ((unint64_t)(a5 - 2) < 4 || a5 == 0)
  {
    v8 = *a3;
    v9 = *a2;
    swift_unknownObjectRetain_n();
    v10 = sub_236B42084(v9, v8, a4);
    v12 = v11;
    swift_unknownObjectRelease();
    if (v12)
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_10;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *a1 = v12;
    return v10 & 1;
  }
  sub_236B48CD8();
  __break(1u);
LABEL_10:
  result = sub_236B48CE4();
  __break(1u);
  return result;
}

uint64_t sub_236B44E28(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  unsigned __int8 v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a3;
  v6 = *a2;
  switch(a5)
  {
    case 0:
      v7 = __ldxr(a4);
      if (v7 != v6)
        goto LABEL_13;
      if (__stxr(v5, a4))
        goto LABEL_14;
      goto LABEL_12;
    case 2:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_13;
      if (!__stxr(v5, a4))
        goto LABEL_12;
      goto LABEL_14;
    case 3:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_11;
      goto LABEL_13;
    case 4:
    case 5:
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_11:
        if (!__stlxr(v5, a4))
        {
LABEL_12:
          v8 = 1;
          goto LABEL_15;
        }
      }
      else
      {
LABEL_13:
        __clrex();
      }
LABEL_14:
      v8 = 0;
LABEL_15:
      *a1 = v7 & 1;
      return v8;
    default:
      sub_236B48C60();
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B44F30(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B44F40(a1, a2, a3, a4, a5);
}

uint64_t sub_236B44F38(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B44F40(a1, a2, a3, a4, a5);
}

uint64_t sub_236B44F40(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = *a3;
  v6 = *a2;
  switch(a5)
  {
    case 0:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_10;
      goto LABEL_14;
    case 2:
    case 4:
      if (a5 == 4 || a5 == 3)
        goto LABEL_4;
      if (a5 != 2)
        goto LABEL_18;
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stxr(v5, a4))
        {
LABEL_11:
          v8 = 1;
          goto LABEL_16;
        }
      }
      else
      {
LABEL_14:
        __clrex();
      }
LABEL_15:
      v8 = 0;
LABEL_16:
      if (!v7)
      {
        while (1)
        {
          sub_236B48CCC();
          __break(1u);
LABEL_18:
          sub_236B48C60();
          sub_236B48CD8();
          __break(1u);
        }
      }
      *a1 = v7;
      return v8;
    case 3:
      v7 = __ldxr(a4);
      if (v7 == v6)
        goto LABEL_7;
      goto LABEL_14;
    case 5:
LABEL_4:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_14;
LABEL_7:
      if (!__stlxr(v5, a4))
        goto LABEL_11;
      goto LABEL_15;
    default:
      goto LABEL_18;
  }
}

uint64_t sub_236B450D8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B450F0(a1, a2, a3, a4, a5);
}

uint64_t sub_236B450E0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B450F0(a1, a2, a3, a4, a5);
}

uint64_t sub_236B450E8(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_236B450F0(a1, a2, a3, a4, a5);
}

uint64_t sub_236B450F0(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *a3;
  switch(a5)
  {
    case 0:
      v9 = *a2;
      v7 = __ldxr(a4);
      if (v7 == v9)
        goto LABEL_14;
      goto LABEL_16;
    case 2:
    case 4:
      v6 = *a2;
      if (a5 == 4 || a5 == 3)
        goto LABEL_8;
      if (a5 != 2)
        goto LABEL_20;
      v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_14:
        if (!__stxr(v5, a4))
        {
LABEL_15:
          v10 = 1;
          goto LABEL_18;
        }
      }
      else
      {
LABEL_16:
        __clrex();
      }
LABEL_17:
      v10 = 0;
LABEL_18:
      if (!v7)
      {
        while (1)
        {
          sub_236B48CCC();
          __break(1u);
LABEL_20:
          sub_236B48C60();
          sub_236B48CD8();
          __break(1u);
        }
      }
      *a1 = v7;
      return v10;
    case 3:
      v8 = *a2;
      v7 = __ldxr(a4);
      if (v7 == v8)
        goto LABEL_11;
      goto LABEL_16;
    case 5:
      v6 = *a2;
LABEL_8:
      v7 = __ldaxr(a4);
      if (v7 != v6)
        goto LABEL_16;
LABEL_11:
      if (!__stlxr(v5, a4))
        goto LABEL_15;
      goto LABEL_17;
    default:
      goto LABEL_20;
  }
}

uint64_t sub_236B4529C(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;

  v5 = *a3;
  v6 = *a2;
  v7 = 2;
  switch(a5)
  {
    case 0:
      v8 = __ldxr(a4);
      if (v8 == v6)
      {
LABEL_17:
        if (!__stxr(v5, a4))
        {
LABEL_22:
          v9 = 1;
          goto LABEL_26;
        }
      }
      else
      {
LABEL_24:
        __clrex();
      }
LABEL_25:
      v9 = 0;
LABEL_26:
      *a1 = v8;
      return v9;
    case 2:
    case 4:
      goto LABEL_6;
    case 3:
      v7 = 0;
      goto LABEL_6;
    case 5:
      v7 = 5;
LABEL_6:
      if (v5)
      {
        switch(a5)
        {
          case 2:
            if (v7 != 5)
              goto LABEL_16;
            goto LABEL_20;
          case 3:
            if (v7 != 5 && v7 != 2)
              goto LABEL_23;
            goto LABEL_20;
          case 4:
          case 5:
            goto LABEL_20;
          default:
            goto LABEL_27;
        }
      }
      switch(a5)
      {
        case 2:
          if (v7 && v7 != 2)
            goto LABEL_20;
LABEL_16:
          v8 = __ldaxr(a4);
          if (v8 == v6)
            goto LABEL_17;
          goto LABEL_24;
        case 3:
          if (v7)
            goto LABEL_20;
LABEL_23:
          v8 = __ldxr(a4);
          if (v8 != v6)
            goto LABEL_24;
          goto LABEL_21;
        case 4:
        case 5:
LABEL_20:
          v8 = __ldaxr(a4);
          if (v8 != v6)
            goto LABEL_24;
LABEL_21:
          if (!__stlxr(v5, a4))
            goto LABEL_22;
          goto LABEL_25;
        default:
          goto LABEL_27;
      }
    default:
LABEL_27:
      sub_236B48C60();
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B4549C(unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v5 = *a3;
  v6 = 2;
  switch(a5)
  {
    case 0:
      v7 = *a2;
      v8 = __ldxr(a4);
      if (v8 == v7)
      {
LABEL_17:
        if (!__stxr(v5, a4))
        {
LABEL_22:
          v10 = 1;
          goto LABEL_26;
        }
      }
      else
      {
LABEL_24:
        __clrex();
      }
LABEL_25:
      v10 = 0;
LABEL_26:
      *a1 = v8;
      return v10;
    case 2:
    case 4:
      goto LABEL_6;
    case 3:
      v6 = 0;
      goto LABEL_6;
    case 5:
      v6 = 5;
LABEL_6:
      v9 = *a2;
      if (v5)
      {
        switch(a5)
        {
          case 2:
            if (v6 != 5)
              goto LABEL_16;
            goto LABEL_20;
          case 3:
            if (v6 != 5 && v6 != 2)
              goto LABEL_23;
            goto LABEL_20;
          case 4:
          case 5:
            goto LABEL_20;
          default:
            goto LABEL_27;
        }
      }
      switch(a5)
      {
        case 2:
          if (v6 && v6 != 2)
            goto LABEL_20;
LABEL_16:
          v8 = __ldaxr(a4);
          if (v8 == v9)
            goto LABEL_17;
          goto LABEL_24;
        case 3:
          if (v6)
            goto LABEL_20;
LABEL_23:
          v8 = __ldxr(a4);
          if (v8 != v9)
            goto LABEL_24;
          goto LABEL_21;
        case 4:
        case 5:
LABEL_20:
          v8 = __ldaxr(a4);
          if (v8 != v9)
            goto LABEL_24;
LABEL_21:
          if (!__stlxr(v5, a4))
            goto LABEL_22;
          goto LABEL_25;
        default:
          goto LABEL_27;
      }
    default:
LABEL_27:
      sub_236B48C60();
      result = sub_236B48CD8();
      __break(1u);
      return result;
  }
}

uint64_t sub_236B4569C(uint64_t a1, char *a2, uint64_t a3, void (*a4)(char *, uint64_t), unint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t TupleTypeMetadata2;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t AssociatedConformanceWitness;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t result;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _BYTE *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;

  v60 = a4;
  v57 = a2;
  v64 = a1;
  v9 = *(_QWORD *)(a6 + 16);
  v10 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v50 - v11;
  v55 = *(_QWORD *)(a6 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v59 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v53 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v50 - v15;
  v18 = v17;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v61 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v20 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v56 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v54 = (char *)&v50 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v50 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v50 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = v29;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v63 = a3;
  v30(v28, a3, v9);
  if (a5 <= 5 && ((0x3Du >> a5) & 1) != 0)
  {
    v51 = qword_236B498D0[a5];
    v52 = TupleTypeMetadata2;
    v31 = *(int *)(TupleTypeMetadata2 + 48);
    v65 = v26;
    v32 = &v26[v31];
    v50 = a5;
    v33 = swift_getAssociatedTypeWitness();
    sub_236B48C78();
    v34 = v53;
    sub_236B48C78();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v36 = (*(uint64_t (**)(char *, char *, char *, void (*)(char *, uint64_t), unint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v32, v16, v34, v60, v50, v51, v33, AssociatedConformanceWitness);
    v57 = v28;
    v37 = v52;
    v38 = v59;
    v39 = v16;
    v40 = v18;
    v60 = *(void (**)(char *, uint64_t))(v59 + 8);
    v60(v39, v18);
    v41 = v36 & 1;
    *v65 = v36 & 1;
    v42 = *(int *)(v37 + 48);
    v43 = v54;
    v44 = &v54[v42];
    *v54 = v36 & 1;
    v45 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    v45(&v43[v42], v32, v40);
    v45(&v56[*(int *)(v37 + 48)], v32, v40);
    v46 = v62;
    sub_236B48C84();
    v47 = v58;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v46, 1, v9) != 1)
    {
      v48 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      v48(v63, v9);
      (*(void (**)(_BYTE *, uint64_t))(v61 + 8))(v65, v37);
      v48((uint64_t)v57, v9);
      (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v64, v46, v9);
      v60(v44, v40);
      return v41;
    }
  }
  else
  {
    sub_236B48CD8();
    __break(1u);
  }
  result = sub_236B48CCC();
  __break(1u);
  return result;
}

uint64_t sub_236B45B18(uint64_t a1)
{
  return sub_236B3EB94(a1);
}

uint64_t UnsafeAtomicLazyReference.Storage._storage.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*UnsafeAtomicLazyReference.Storage._storage.modify())()
{
  return nullsub_1;
}

uint64_t UnsafeAtomicLazyReference.Storage.init()()
{
  return 0;
}

uint64_t UnsafeAtomicLazyReference.Storage.dispose()()
{
  uint64_t *v0;
  uint64_t result;

  result = *v0;
  *v0 = 0;
  return result;
}

uint64_t static UnsafeAtomicLazyReference.create()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = type metadata accessor for UnsafeAtomicLazyReference.Storage(0, a1, a3, a4);
  v5 = sub_236B48CA8();
  v7 = 0;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v5, &v7, v4);
  return v5;
}

uint64_t type metadata accessor for UnsafeAtomicLazyReference.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeAtomicLazyReference.Storage);
}

uint64_t sub_236B45BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a2, a1);
}

uint64_t UnsafeAtomicLazyReference.destroy()(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = 0;
  type metadata accessor for UnsafeAtomicLazyReference.Storage(0, a2, a3, a4);
  sub_236B48C90();
  return v4;
}

uint64_t ManagedAtomicLazyReference._storage.getter()
{
  return 0;
}

uint64_t ManagedAtomicLazyReference.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t ManagedAtomicLazyReference.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = 0;
  return result;
}

uint64_t ManagedAtomicLazyReference.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_unknownObjectRelease();
  return v0;
}

uint64_t ManagedAtomicLazyReference.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_236B45CAC()
{
  uint64_t v0;

  return v0 + 16;
}

unint64_t UnsafeAtomicLazyReference.storeIfNilThenLoad(_:)(unint64_t a1, unint64_t *a2)
{
  unint64_t v4;

  swift_unknownObjectRetain();
  while (1)
  {
    v4 = __ldaxr(a2);
    if (v4)
      break;
    if (!__stlxr(a1, a2))
      return a1;
  }
  __clrex();
  swift_unknownObjectRetain();
  swift_unknownObjectRelease_n();
  return v4;
}

uint64_t UnsafeAtomicLazyReference.load()(unint64_t *a1)
{
  uint64_t result;

  result = atomic_load(a1);
  if (result)
    return swift_unknownObjectRetain();
  return result;
}

unint64_t ManagedAtomicLazyReference.storeIfNilThenLoad(_:)(unint64_t a1)
{
  uint64_t v1;
  unint64_t *v3;
  unint64_t v4;

  v3 = (unint64_t *)(v1 + 16);
  swift_unknownObjectRetain();
  while (1)
  {
    v4 = __ldaxr(v3);
    if (v4)
      break;
    if (!__stlxr(a1, v3))
      return a1;
  }
  __clrex();
  swift_unknownObjectRetain();
  swift_unknownObjectRelease_n();
  return v4;
}

uint64_t ManagedAtomicLazyReference.load()()
{
  uint64_t v0;
  uint64_t result;

  result = atomic_load((unint64_t *)(v0 + 16));
  if (result)
    return swift_unknownObjectRetain();
  return result;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_236B45DE0(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_236B45E24(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

uint64_t type metadata accessor for UnsafeAtomicLazyReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeAtomicLazyReference);
}

uint64_t sub_236B45E70()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ManagedAtomicLazyReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ManagedAtomicLazyReference);
}

uint64_t static UnsafeAtomic.create(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v13 - v8;
  v10 = sub_236B48CA8();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v6, AssociatedTypeWitness, AssociatedConformanceWitness);
  sub_236B45BD8((uint64_t)v9, v10, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v10;
}

uint64_t UnsafeAtomic.destroy()(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - v4, a1, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  sub_236B48C9C();
  return sub_236B48C90();
}

uint64_t ManagedAtomic._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v3, AssociatedTypeWitness);
}

uint64_t ManagedAtomic._storage.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(v3, a1, AssociatedTypeWitness);
  return swift_endAccess();
}

uint64_t (*ManagedAtomic._storage.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_236B46254(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;

  v3 = *(_QWORD *)(v1 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v14 - v9;
  v11 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v6, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11 + *(_QWORD *)(*(_QWORD *)v11 + 96), v10, AssociatedTypeWitness);
  return v11;
}

uint64_t ManagedAtomic.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v12;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v6 = (char *)&v12 - v5;
  v7 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0 + 16, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96), AssociatedTypeWitness);
  return v0;
}

uint64_t ManagedAtomic.__deallocating_deinit()
{
  ManagedAtomic.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_236B46504()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for UnsafeAtomic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeAtomic);
}

uint64_t sub_236B46518()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for ManagedAtomic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ManagedAtomic);
}

AtomicsInternal::DoubleWord __swiftcall DoubleWord.init(high:low:)(Swift::UInt high, Swift::UInt low)
{
  Swift::UInt v4;
  AtomicsInternal::DoubleWord result;

  v4 = high;
  result.second = v4;
  result.first = low;
  return result;
}

uint64_t DoubleWord.high.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DoubleWord.high.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

_QWORD *(*DoubleWord.high.modify(_QWORD *a1))(_QWORD *result)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  a1[1] = v1;
  return sub_236B465DC;
}

_QWORD *sub_236B465DC(_QWORD *result)
{
  *(_QWORD *)(result[1] + 8) = *result;
  return result;
}

uint64_t DoubleWord.low.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*DoubleWord.low.modify(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  return sub_236B4660C;
}

uint64_t sub_236B4660C(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

BOOL static DoubleWord.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL sub_236B46628(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t DoubleWord.hash(into:)()
{
  sub_236B48D08();
  return sub_236B48D08();
}

uint64_t DoubleWord.hashValue.getter()
{
  sub_236B48CFC();
  sub_236B48D08();
  sub_236B48D08();
  return sub_236B48D14();
}

uint64_t sub_236B466CC()
{
  sub_236B48CFC();
  sub_236B48D08();
  sub_236B48D08();
  return sub_236B48D14();
}

uint64_t sub_236B46724()
{
  sub_236B48D08();
  return sub_236B48D08();
}

uint64_t sub_236B4675C()
{
  sub_236B48CFC();
  sub_236B48D08();
  sub_236B48D08();
  return sub_236B48D14();
}

unint64_t DoubleWord.description.getter()
{
  sub_236B48CC0();
  swift_bridgeObjectRelease();
  sub_236B48CF0();
  sub_236B48C6C();
  swift_bridgeObjectRelease();
  sub_236B48C6C();
  sub_236B48CF0();
  sub_236B48C6C();
  swift_bridgeObjectRelease();
  sub_236B48C6C();
  return 0xD000000000000012;
}

unint64_t sub_236B468B8()
{
  unint64_t result;

  result = qword_25643FBA0;
  if (!qword_25643FBA0)
  {
    result = MEMORY[0x23B7FD278](&protocol conformance descriptor for DoubleWord, &type metadata for DoubleWord);
    atomic_store(result, (unint64_t *)&qword_25643FBA0);
  }
  return result;
}

unint64_t sub_236B468FC()
{
  return DoubleWord.description.getter();
}

Swift::Void __swiftcall atomicMemoryFence(ordering:)(AtomicsInternal::AtomicUpdateOrdering ordering)
{
  switch(ordering._rawValue)
  {
    case 0:
      return;
    case 2:
      __dmb(9u);
      break;
    case 3:
    case 4:
    case 5:
      __dmb(0xBu);
      break;
    default:
      sub_236B48CD8();
      __break(1u);
      break;
  }
}

uint64_t AtomicLoadOrdering._rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AtomicLoadOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicLoadOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_236B469C0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t AtomicLoadOrdering.hash(into:)()
{
  return sub_236B48D08();
}

uint64_t sub_236B46A00()
{
  return sub_236B48D08();
}

uint64_t AtomicLoadOrdering.description.getter(uint64_t a1)
{
  uint64_t v2;

  switch(a1)
  {
    case 5:
      return sub_236B48C60();
    case 2:
      return 0x6E69726975716361;
    case 0:
      return 0x646578616C6572;
  }
  sub_236B48CC0();
  v2 = sub_236B48C60();
  swift_bridgeObjectRelease();
  sub_236B48CF0();
  sub_236B48C6C();
  swift_bridgeObjectRelease();
  sub_236B48C60();
  sub_236B48C6C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_236B46B54()
{
  uint64_t *v0;

  return AtomicLoadOrdering.description.getter(*v0);
}

uint64_t AtomicStoreOrdering._rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AtomicStoreOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicStoreOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t AtomicStoreOrdering.description.getter(uint64_t a1)
{
  uint64_t v2;

  switch(a1)
  {
    case 5:
      return sub_236B48C60();
    case 3:
      return 0x6E697361656C6572;
    case 0:
      return 0x646578616C6572;
  }
  sub_236B48CC0();
  v2 = sub_236B48C60();
  swift_bridgeObjectRelease();
  sub_236B48CF0();
  sub_236B48C6C();
  swift_bridgeObjectRelease();
  sub_236B48C60();
  sub_236B48C6C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_236B46CB4()
{
  uint64_t *v0;

  return AtomicStoreOrdering.description.getter(*v0);
}

uint64_t AtomicUpdateOrdering._rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AtomicUpdateOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicUpdateOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _s15AtomicsInternal18AtomicLoadOrderingV9hashValueSivg_0()
{
  sub_236B48CFC();
  sub_236B48D08();
  return sub_236B48D14();
}

uint64_t sub_236B46D30()
{
  sub_236B48CFC();
  sub_236B48D08();
  return sub_236B48D14();
}

uint64_t sub_236B46D74()
{
  sub_236B48CFC();
  sub_236B48D08();
  return sub_236B48D14();
}

uint64_t AtomicUpdateOrdering.description.getter(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = 0x6E69726975716361;
  switch(a1)
  {
    case 0:
      result = 0x646578616C6572;
      break;
    case 2:
      return result;
    case 3:
    case 4:
    case 5:
      result = sub_236B48C60();
      break;
    default:
      sub_236B48CC0();
      v3 = sub_236B48C60();
      swift_bridgeObjectRelease();
      sub_236B48CF0();
      sub_236B48C6C();
      swift_bridgeObjectRelease();
      sub_236B48C60();
      sub_236B48C6C();
      swift_bridgeObjectRelease();
      result = v3;
      break;
  }
  return result;
}

unint64_t sub_236B46F08()
{
  unint64_t result;

  result = qword_25643FBA8;
  if (!qword_25643FBA8)
  {
    result = MEMORY[0x23B7FD278](&protocol conformance descriptor for AtomicLoadOrdering, &type metadata for AtomicLoadOrdering);
    atomic_store(result, (unint64_t *)&qword_25643FBA8);
  }
  return result;
}

unint64_t sub_236B46F50()
{
  unint64_t result;

  result = qword_25643FBB0;
  if (!qword_25643FBB0)
  {
    result = MEMORY[0x23B7FD278](&protocol conformance descriptor for AtomicStoreOrdering, &type metadata for AtomicStoreOrdering);
    atomic_store(result, (unint64_t *)&qword_25643FBB0);
  }
  return result;
}

unint64_t sub_236B46F98()
{
  unint64_t result;

  result = qword_25643FBB8[0];
  if (!qword_25643FBB8[0])
  {
    result = MEMORY[0x23B7FD278](&protocol conformance descriptor for AtomicUpdateOrdering, &type metadata for AtomicUpdateOrdering);
    atomic_store(result, qword_25643FBB8);
  }
  return result;
}

uint64_t sub_236B46FDC()
{
  uint64_t *v0;

  return AtomicUpdateOrdering.description.getter(*v0);
}

ValueMetadata *type metadata accessor for AtomicLoadOrdering()
{
  return &type metadata for AtomicLoadOrdering;
}

ValueMetadata *type metadata accessor for AtomicStoreOrdering()
{
  return &type metadata for AtomicStoreOrdering;
}

ValueMetadata *type metadata accessor for AtomicUpdateOrdering()
{
  return &type metadata for AtomicUpdateOrdering;
}

uint64_t AtomicRawRepresentableStorage._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v1, AssociatedTypeWitness);
}

uint64_t AtomicRawRepresentableStorage._storage.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(v1, a1, AssociatedTypeWitness);
}

uint64_t (*AtomicRawRepresentableStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t sub_236B47128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;
  uint64_t v15;

  v15 = a3;
  v4 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v14 - v6;
  v8 = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - v10;
  sub_236B48C78();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v7, v8, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v15, v11, v8);
}

uint64_t sub_236B4728C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v18 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v17 - v6;
  v8 = swift_checkMetadataState();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13 = v17;
  v12(v7, v17, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  sub_236B48C84();
  v15 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v3) == 1)
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v13, a1);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v11, v3);
  }
  return result;
}

uint64_t sub_236B474B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v20 = a1;
  v21 = a2;
  v22 = a4;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - v6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v19 - v13;
  v15 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v20, v21, v15, AssociatedConformanceWitness);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, AssociatedTypeWitness);
  sub_236B48C84();
  v17 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1, v4) == 1)
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v22, v7, v4);
  }
  return result;
}

uint64_t sub_236B476CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;
  uint64_t v14;

  v14 = a3;
  v6 = *(_QWORD *)(a4 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v13 - v8;
  v10 = swift_getAssociatedTypeWitness();
  sub_236B48C78();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v9, a2, v14, v10, AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

uint64_t sub_236B477FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t AssociatedConformanceWitness;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = a2;
  v21 = a3;
  v22 = a5;
  v23 = a1;
  v5 = *(_QWORD *)(a4 + 16);
  v6 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v20 - v14;
  v16 = swift_getAssociatedTypeWitness();
  sub_236B48C78();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v13, v20, v21, v16, AssociatedConformanceWitness);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, AssociatedTypeWitness);
  sub_236B48C84();
  v18 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v5) == 1)
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v23, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v22, v8, v5);
  }
  return result;
}

uint64_t sub_236B47A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t), uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t AssociatedConformanceWitness;
  char *v29;
  char v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;

  v46 = a4;
  v47 = a5;
  v50 = a1;
  v51 = a3;
  v7 = *(_QWORD *)(a6 + 16);
  v8 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)&v40 - v9;
  v10 = *(_QWORD *)(a6 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v45 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v40 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v42 = TupleTypeMetadata2;
  v48 = v18;
  v19 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v44 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v40 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v40 - v25;
  v41 = (char *)&v40 + *(int *)(v24 + 48) - v25;
  v27 = swift_getAssociatedTypeWitness();
  v43 = v10;
  sub_236B48C78();
  sub_236B48C78();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v29 = v41;
  v30 = (*(uint64_t (**)(char *, char *, char *, uint64_t, void (*)(char *, uint64_t), uint64_t, uint64_t))(AssociatedConformanceWitness + 56))(v41, v16, v14, v46, v47, v27, AssociatedConformanceWitness);
  v31 = v45;
  v32 = v16;
  v33 = v42;
  v47 = *(void (**)(char *, uint64_t))(v45 + 8);
  v47(v32, AssociatedTypeWitness);
  v34 = v30 & 1;
  *v26 = v30 & 1;
  v35 = &v23[*(int *)(v33 + 48)];
  *v23 = v30 & 1;
  v36 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v36(v35, v29, AssociatedTypeWitness);
  v36(&v44[*(int *)(v33 + 48)], v29, AssociatedTypeWitness);
  v37 = v49;
  sub_236B48C84();
  v38 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v37, 1, v7) == 1)
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v51, v7);
    (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v26, v33);
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v50, v37, v7);
    v47(v35, AssociatedTypeWitness);
    return v34;
  }
  return result;
}

uint64_t sub_236B47DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t AssociatedConformanceWitness;
  char *v30;
  char v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  _BYTE *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v50 = a5;
  v51 = a6;
  v49 = a4;
  v54 = a1;
  v55 = a3;
  v8 = *(_QWORD *)(a7 + 16);
  v9 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v42 - v10;
  v11 = *(_QWORD *)(a7 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v48 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v45 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v42 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v52 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v18 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v47 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v46 = (char *)&v42 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v42 - v23;
  v43 = (char *)&v42 + *(int *)(v22 + 48) - v23;
  v25 = swift_getAssociatedTypeWitness();
  v44 = v11;
  sub_236B48C78();
  v26 = v45;
  sub_236B48C78();
  v27 = TupleTypeMetadata2;
  v28 = v24;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v30 = v43;
  v31 = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(AssociatedConformanceWitness + 64))(v43, v16, v26, v49, v50, v51, v25, AssociatedConformanceWitness);
  v32 = v48;
  v33 = *(void (**)(char *, uint64_t))(v48 + 8);
  v33(v16, AssociatedTypeWitness);
  v34 = v31 & 1;
  v51 = v28;
  *v28 = v31 & 1;
  v35 = *(int *)(v27 + 48);
  v36 = v46;
  v37 = &v46[v35];
  *v46 = v31 & 1;
  v38 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v38(&v36[v35], v30, AssociatedTypeWitness);
  v39 = v53;
  v38(&v47[*(int *)(v27 + 48)], v30, AssociatedTypeWitness);
  sub_236B48C84();
  v40 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v39, 1, v8) == 1)
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v55, v8);
    (*(void (**)(_BYTE *, uint64_t))(v52 + 8))(v51, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v54, v39, v8);
    v33(v37, AssociatedTypeWitness);
    return v34;
  }
  return result;
}

uint64_t sub_236B48134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t AssociatedConformanceWitness;
  char *v30;
  char v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  _BYTE *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v50 = a5;
  v51 = a6;
  v49 = a4;
  v54 = a1;
  v55 = a3;
  v8 = *(_QWORD *)(a7 + 16);
  v9 = sub_236B48CB4();
  MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v42 - v10;
  v11 = *(_QWORD *)(a7 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v48 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v45 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v42 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v52 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v18 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v47 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v46 = (char *)&v42 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v42 - v23;
  v43 = (char *)&v42 + *(int *)(v22 + 48) - v23;
  v25 = swift_getAssociatedTypeWitness();
  v44 = v11;
  sub_236B48C78();
  v26 = v45;
  sub_236B48C78();
  v27 = TupleTypeMetadata2;
  v28 = v24;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v30 = v43;
  v31 = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v43, v16, v26, v49, v50, v51, v25, AssociatedConformanceWitness);
  v32 = v48;
  v33 = *(void (**)(char *, uint64_t))(v48 + 8);
  v33(v16, AssociatedTypeWitness);
  v34 = v31 & 1;
  v51 = v28;
  *v28 = v31 & 1;
  v35 = *(int *)(v27 + 48);
  v36 = v46;
  v37 = &v46[v35];
  *v46 = v31 & 1;
  v38 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v38(&v36[v35], v30, AssociatedTypeWitness);
  v39 = v53;
  v38(&v47[*(int *)(v27 + 48)], v30, AssociatedTypeWitness);
  sub_236B48C84();
  v40 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v39, 1, v8) == 1)
  {
    result = sub_236B48CCC();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v55, v8);
    (*(void (**)(_BYTE *, uint64_t))(v52 + 8))(v51, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v54, v39, v8);
    v33(v37, AssociatedTypeWitness);
    return v34;
  }
  return result;
}

uint64_t sub_236B484BC()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_236B4855C(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(_QWORD *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_236B4861C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_236B4868C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B48710(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B48794(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B48818(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_236B4889C(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2)
    return 0;
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (a2 <= v6)
    goto LABEL_18;
  v7 = *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if ((_DWORD)v7)
  {
    if (v7 > 3)
      LODWORD(v7) = 4;
    __asm { BR              X11 }
  }
  return (v6 + v11 + 1);
}

void sub_236B48A0C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (a3 <= v7)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      v9 = 4u;
    }
    else if (v11 >= 0x100)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 > 1;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for AtomicRawRepresentableStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicRawRepresentableStorage);
}

uint64_t DoubleWord.first.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*DoubleWord.first.modify())()
{
  return nullsub_1;
}

uint64_t DoubleWord.second.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DoubleWord.second.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*DoubleWord.second.modify())()
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for DoubleWord()
{
  return &type metadata for DoubleWord;
}

uint64_t sub_236B48C60()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_236B48C6C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236B48C78()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_236B48C84()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_236B48C90()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_236B48C9C()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_236B48CA8()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t sub_236B48CB4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_236B48CC0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_236B48CCC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_236B48CD8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_236B48CE4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_236B48CF0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_236B48CFC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_236B48D08()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_236B48D14()
{
  return MEMORY[0x24BEE4328]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}


void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Merge8<A, B, C, D, E, F, G, H>()
{
  static Publishers.Merge8<>.== infix(_:_:)();
}

uint64_t sub_18B5C0B24(char a1)
{
  return a1 & 1;
}

uint64_t static Publishers.MergeMany<>.== infix(_:_:)()
{
  return static Array<A>.== infix(_:_:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.MergeMany<A>()
{
  return static Publishers.MergeMany<>.== infix(_:_:)();
}

Swift::Void __swiftcall Array._checkSubscript_mutating(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  char isClassOrObjCExistentialType;
  uint64_t v5;

  v2 = v1;
  isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  if (a1 < 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  v5 = v2 & 0xFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0)
    v5 = v2;
  if (*(_QWORD *)(v5 + 16) <= (unint64_t)a1)
    goto LABEL_7;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t associated type witness table accessor for Publisher.Failure : Error in Publishers.Merge8<A, B, C, D, E, F, G, H>()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t getEnumTagSinglePayload for Publishers.Merge(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5C0CE4 + 4 * byte_18B5F91B0[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.Merge(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
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
  }
  else
  {
    v9 = 0u;
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
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
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
  __asm { BR              X16 }
}

uint64_t getEnumTagSinglePayload for Publishers.Merge3(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;

  v4 = *(_QWORD *)(a3[2] - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = a3[4];
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) > v8)
    v8 = *(_DWORD *)(v10 + 84);
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v6 + 80);
  v12 = *(_QWORD *)(v4 + 64) + v11;
  v13 = *(_QWORD *)(v6 + 64);
  v14 = *(unsigned __int8 *)(v10 + 80);
  v15 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_25;
  v16 = ((v13 + v14 + (v12 & ~v11)) & ~v14) + *(_QWORD *)(v10 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_25;
      goto LABEL_16;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_25;
      goto LABEL_16;
    }
    if (v19 < 2)
    {
LABEL_25:
      if (v8)
      {
        if (v5 == v8)
          return (*(uint64_t (**)(void))(v4 + 48))();
        v22 = (v12 + a1) & ~v11;
        if (v7 == v8)
          return (*(uint64_t (**)(uint64_t))(v6 + 48))(v22);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))((v22 + v13 + v14) & ~v14, *(unsigned int *)(v10 + 84), v9);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_25;
LABEL_16:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if ((_DWORD)v16)
  {
    if (v16 <= 3)
      v21 = ((v13 + v14 + (v12 & ~(_DWORD)v11)) & ~(_DWORD)v14) + *(_DWORD *)(v10 + 64);
    else
      v21 = 4;
    __asm { BR              X11 }
  }
  return v8 + v20 + 1;
}

void storeEnumTagSinglePayload for Publishers.Merge3(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) > v7)
    v7 = *(_DWORD *)(v8 + 84);
  v9 = ((*(_QWORD *)(v6 + 64)
       + *(unsigned __int8 *)(v8 + 80)
       + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
     + *(_QWORD *)(v8 + 64);
  if (a3 > v7)
  {
    if (v9 <= 3)
    {
      v12 = ((a3 - v7 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0u;
  }
  if (v7 < a2)
  {
    v11 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v13 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X21 }
}

uint64_t getEnumTagSinglePayload for Publishers.Merge4(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
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
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  v12 = a3[4];
  v13 = a3[5];
  v14 = *(_QWORD *)(v12 - 8);
  v15 = *(unsigned int *)(v14 + 84);
  if (v15 > v11)
    v11 = *(_DWORD *)(v14 + 84);
  v16 = *(_QWORD *)(v13 - 8);
  v17 = *(unsigned int *)(v16 + 84);
  if (v17 > v11)
    v11 = *(_DWORD *)(v16 + 84);
  if (!a2)
    return 0;
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = *(_QWORD *)(v7 + 64) + v18;
  v20 = *(_QWORD *)(v9 + 64);
  v21 = *(unsigned __int8 *)(v14 + 80);
  v22 = *(_QWORD *)(v14 + 64);
  v23 = *(unsigned __int8 *)(v16 + 80);
  v24 = a2 - v11;
  if (a2 <= v11)
    goto LABEL_27;
  v25 = ((v22 + v23 + ((v20 + v21 + (v19 & ~v18)) & ~v21)) & ~v23) + *(_QWORD *)(v16 + 64);
  v26 = 8 * v25;
  if (v25 <= 3)
  {
    v28 = ((v24 + ~(-1 << v26)) >> v26) + 1;
    if (HIWORD(v28))
    {
      v27 = *(_DWORD *)(a1 + v25);
      if (!v27)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v28 > 0xFF)
    {
      v27 = *(unsigned __int16 *)(a1 + v25);
      if (!*(_WORD *)(a1 + v25))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v28 < 2)
    {
LABEL_27:
      if (v11)
      {
        if (v8 == v11)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v6);
        v31 = (v19 + a1) & ~v18;
        if (v10 == v11)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v9 + 48))(v31, *(unsigned int *)(v9 + 84), v5);
        v32 = (v31 + v20 + v21) & ~v21;
        if ((_DWORD)v15 == v11)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v32, v15, v12);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))((v32 + v22 + v23) & ~v23, v17, v13);
      }
      return 0;
    }
  }
  v27 = *(unsigned __int8 *)(a1 + v25);
  if (!*(_BYTE *)(a1 + v25))
    goto LABEL_27;
LABEL_18:
  v29 = (v27 - 1) << v26;
  if (v25 > 3)
    v29 = 0;
  if ((_DWORD)v25)
  {
    if (v25 <= 3)
      v30 = ((v22 + v23 + ((v20 + v21 + (v19 & ~(_DWORD)v18)) & ~(_DWORD)v21)) & ~(_DWORD)v23) + *(_DWORD *)(v16 + 64);
    else
      v30 = 4;
    __asm { BR              X11 }
  }
  return v11 + v29 + 1;
}

void storeEnumTagSinglePayload for Publishers.Merge4(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) <= v7)
    v9 = v7;
  else
    v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(a4[5] - 8);
  if (*(_DWORD *)(v10 + 84) > v9)
    v9 = *(_DWORD *)(v10 + 84);
  v11 = ((*(_QWORD *)(v8 + 64)
        + *(unsigned __int8 *)(v10 + 80)
        + ((*(_QWORD *)(v6 + 64)
          + *(unsigned __int8 *)(v8 + 80)
          + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
      + *(_QWORD *)(v10 + 64);
  if (a3 > v9)
  {
    if (v11 <= 3)
    {
      v14 = ((a3 - v9 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else
      {
        v12 = v14 > 1;
        if (v14 >= 0x100)
          v12 = 2;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0u;
  }
  if (v9 < a2)
  {
    v13 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v15 = v13 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v11 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X27 }
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Merge5(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;

  v4 = *(_QWORD *)(a3[2] - 8);
  v5 = *(_QWORD *)(a3[3] - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v4 + 64) + v6;
  v8 = *(_QWORD *)(a3[4] - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = *(_QWORD *)(v5 + 64) + v9;
  v11 = *(_QWORD *)(a3[5] - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = *(_QWORD *)(v8 + 64) + v12;
  v14 = *(_QWORD *)(a3[6] - 8);
  v15 = *(_DWORD *)(v14 + 80);
  v16 = *(_DWORD *)(v4 + 80);
  v17 = (*(_BYTE *)(v5 + 80) | v16 | *(_BYTE *)(v8 + 80) | v12 | v15);
  if (v17 <= 7
    && ((*(_QWORD *)(v11 + 64)
       + v15
       + ((v13 + ((v10 + (v7 & ~v6)) & ~v9)) & ~(unint64_t)v12)) & ~(unint64_t)v15)
     + *(_QWORD *)(v14 + 64) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | v16 | *(_DWORD *)(v8 + 80) | v12 | v15) & 0x100000) == 0)
  {
    v22 = ~v6;
    v33 = ~v9;
    v34 = a3[5];
    v36 = ~(unint64_t)v12;
    v37 = ~(unint64_t)v15;
    v38 = a3[6];
    v31 = a3[3];
    v32 = a3[4];
    v35 = *(_QWORD *)(v11 + 64) + v15;
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    v39 = a1;
    v24 = ((unint64_t)a1 + v7) & v22;
    v25 = ((unint64_t)a2 + v7) & v22;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(v24, v25, v31);
    v26 = v24 + v10;
    v21 = v39;
    v27 = v26 & v33;
    v28 = (v25 + v10) & v33;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16))(v26 & v33, v28, v32);
    v29 = (v28 + v13) & v36;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((v27 + v13) & v36, v29, v34);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 16))((((v27 + v13) & v36) + v35) & v37, (v29 + v35) & v37, v38);
  }
  else
  {
    v20 = *a2;
    *a1 = *a2;
    v21 = (uint64_t *)(v20 + ((v17 + 16) & ~v17));
    swift_retain();
  }
  return v21;
}

uint64_t assignWithCopy for Publishers.Merge5(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v22, v23);
  v24 = *(_QWORD *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v24 + 24))((*(_QWORD *)(v19 + 64) + *(unsigned __int8 *)(v24 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80), (*(_QWORD *)(v19 + 64) + *(unsigned __int8 *)(v24 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80));
  return a1;
}

uint64_t initializeWithTake for Publishers.Merge5(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(v22, v23);
  v24 = *(_QWORD *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v24 + 32))((*(_QWORD *)(v19 + 64) + *(unsigned __int8 *)(v24 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80), (*(_QWORD *)(v19 + 64) + *(unsigned __int8 *)(v24 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80));
  return a1;
}

uint64_t assignWithTake for Publishers.Merge5(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 40))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 40))(v22, v23);
  v24 = *(_QWORD *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v24 + 40))((*(_QWORD *)(v19 + 64) + *(unsigned __int8 *)(v24 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80), (*(_QWORD *)(v19 + 64) + *(unsigned __int8 *)(v24 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Merge5(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  char v31;
  int v32;
  unsigned int v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  v13 = a3[4];
  v12 = a3[5];
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_DWORD *)(v14 + 84);
  if (v15 > v11)
    v11 = *(_DWORD *)(v14 + 84);
  v16 = *(_QWORD *)(v12 - 8);
  v17 = *(unsigned int *)(v16 + 84);
  if (v17 <= v11)
    v18 = v11;
  else
    v18 = *(_DWORD *)(v16 + 84);
  v19 = a3[6];
  v20 = *(_QWORD *)(v19 - 8);
  if (*(_DWORD *)(v20 + 84) > v18)
    v18 = *(_DWORD *)(v20 + 84);
  if (!a2)
    return 0;
  v21 = *(unsigned __int8 *)(v9 + 80);
  v22 = *(_QWORD *)(v7 + 64) + v21;
  v23 = *(_QWORD *)(v9 + 64);
  v24 = *(unsigned __int8 *)(v14 + 80);
  v25 = *(_QWORD *)(v14 + 64);
  v26 = *(unsigned __int8 *)(v16 + 80);
  v27 = *(unsigned __int8 *)(v20 + 80);
  v28 = *(_QWORD *)(v16 + 64) + v27;
  v29 = a2 - v18;
  if (a2 <= v18)
    goto LABEL_30;
  v30 = ((v28 + ((v25 + v26 + ((v23 + v24 + (v22 & ~v21)) & ~v24)) & ~v26)) & ~v27) + *(_QWORD *)(v20 + 64);
  v31 = 8 * v30;
  if (v30 <= 3)
  {
    v33 = ((v29 + ~(-1 << v31)) >> v31) + 1;
    if (HIWORD(v33))
    {
      v32 = *(_DWORD *)(a1 + v30);
      if (!v32)
        goto LABEL_30;
      goto LABEL_21;
    }
    if (v33 > 0xFF)
    {
      v32 = *(unsigned __int16 *)(a1 + v30);
      if (!*(_WORD *)(a1 + v30))
        goto LABEL_30;
      goto LABEL_21;
    }
    if (v33 < 2)
    {
LABEL_30:
      if (v18)
      {
        if (v8 == v18)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v6);
        v36 = (v22 + a1) & ~v21;
        if (v10 == v18)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v9 + 48))(v36, *(unsigned int *)(v9 + 84), v5);
        v37 = (v36 + v23 + v24) & ~v24;
        if (v15 == v18)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v14 + 48))(v37, *(unsigned int *)(v14 + 84), v13);
        v38 = (v37 + v25 + v26) & ~v26;
        if ((_DWORD)v17 == v18)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v38, v17, v12);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v20 + 48))((v28 + v38) & ~v27, *(unsigned int *)(v20 + 84), v19);
      }
      return 0;
    }
  }
  v32 = *(unsigned __int8 *)(a1 + v30);
  if (!*(_BYTE *)(a1 + v30))
    goto LABEL_30;
LABEL_21:
  v34 = (v32 - 1) << v31;
  if (v30 > 3)
    v34 = 0;
  if ((_DWORD)v30)
  {
    if (v30 <= 3)
      v35 = ((v28 + ((v25 + v26 + ((v23 + v24 + (v22 & ~(_DWORD)v21)) & ~(_DWORD)v24)) & ~(_DWORD)v26)) & ~(_DWORD)v27)
          + *(_DWORD *)(v20 + 64);
    else
      v35 = 4;
    __asm { BR              X11 }
  }
  return v18 + v34 + 1;
}

uint64_t storeEnumTagSinglePayload for Publishers.Merge5(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  result = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(result + 84))
    v7 = *(_DWORD *)(result + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) > v7)
    v7 = *(_DWORD *)(v8 + 84);
  v9 = *(_QWORD *)(a4[5] - 8);
  if (*(_DWORD *)(v9 + 84) <= v7)
    v10 = v7;
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(_QWORD *)(a4[6] - 8);
  if (*(_DWORD *)(v11 + 84) > v10)
    v10 = *(_DWORD *)(v11 + 84);
  v12 = ((*(_QWORD *)(v9 + 64)
        + *(unsigned __int8 *)(v11 + 80)
        + ((*(_QWORD *)(v8 + 64)
          + *(unsigned __int8 *)(v9 + 80)
          + ((*(_QWORD *)(v6 + 64)
            + *(unsigned __int8 *)(v8 + 80)
            + ((*(_QWORD *)(result + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(_QWORD *)(v11 + 64);
  if (a3 <= v10)
  {
    v13 = 0u;
    if (v10 < a2)
      goto LABEL_16;
  }
  else
  {
    if (v12 > 3)
    {
      v13 = 1u;
      if (v10 >= a2)
        return result;
LABEL_16:
      v14 = ~v10 + a2;
      if (v12 < 4)
      {
        if ((_DWORD)v12)
        {
          v16 = v14 & ~(-1 << (8 * v12));
          bzero(a1, v12);
          if ((_DWORD)v12 == 3)
          {
            *a1 = v16;
            *((_BYTE *)a1 + 2) = BYTE2(v16);
          }
          else if ((_DWORD)v12 == 2)
          {
            *a1 = v16;
          }
          else
          {
            *(_BYTE *)a1 = v16;
          }
        }
      }
      else
      {
        bzero(a1, v12);
        *(_DWORD *)a1 = v14;
      }
      __asm { BR              X10 }
    }
    v15 = ((a3 - v10 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v13 = 4u;
    }
    else if (v15 >= 0x100)
    {
      v13 = 2;
    }
    else
    {
      v13 = v15 > 1;
    }
    if (v10 < a2)
      goto LABEL_16;
  }
  return result;
}

void sub_18B5C2270()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_18B5C2278()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

_QWORD *initializeBufferWithCopyOfBuffer for Publishers.Merge6(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v5 = *(_QWORD *)(a3[2] - 8);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = *(_QWORD *)(v5 + 64) + v7;
  v9 = *(_QWORD *)(a3[4] - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = *(_QWORD *)(v6 + 64) + v10;
  v12 = *(_QWORD *)(a3[5] - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v45 = *(_QWORD *)(v9 + 64) + v13;
  v14 = *(_QWORD *)(a3[6] - 8);
  v15 = *(_DWORD *)(v14 + 80);
  v44 = *(_QWORD *)(v12 + 64) + v15;
  v16 = *(_QWORD *)(a3[7] - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = *(_QWORD *)(v14 + 64) + v17;
  v19 = (*(_BYTE *)(v6 + 80) | *(_BYTE *)(v5 + 80) | *(_BYTE *)(v9 + 80) | *(_BYTE *)(v12 + 80) | *(_BYTE *)(v14 + 80) | v17);
  if (v19 <= 7
    && ((v18 + ((v44 + ((v45 + ((v11 + (v8 & ~v7)) & ~v10)) & ~v13)) & ~v15)) & ~(unint64_t)v17)
     + *(_QWORD *)(v16 + 64) <= 0x18
    && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v5 + 80) | *(_DWORD *)(v9 + 80) | *(_DWORD *)(v12 + 80) | *(_DWORD *)(v14 + 80) | v17) & 0x100000) == 0)
  {
    v35 = a3[4];
    v36 = a3[3];
    v24 = ~v7;
    v37 = ~v10;
    v38 = a3[5];
    v39 = ~v13;
    v40 = a3[6];
    v41 = ~v15;
    v42 = ~(unint64_t)v17;
    v43 = a3[7];
    (*(void (**)(_QWORD *, _QWORD *))(v5 + 16))(a1, a2);
    v25 = a2;
    v26 = a1;
    v27 = ((unint64_t)a1 + v8) & v24;
    v28 = ((unint64_t)v25 + v8) & v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v27, v28, v36);
    v29 = v27 + v11;
    v23 = v26;
    v30 = v29 & v37;
    v31 = (v28 + v11) & v37;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16))(v29 & v37, v31, v35);
    v32 = (v31 + v45) & v39;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))((v30 + v45) & v39, v32, v38);
    v33 = (((v30 + v45) & v39) + v44) & v41;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v33, (v32 + v44) & v41, v40);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v16 + 16))((v33 + v18) & v42, (((v32 + v44) & v41) + v18) & v42, v43);
  }
  else
  {
    v22 = *a2;
    *a1 = *a2;
    v23 = (_QWORD *)(v22 + ((v19 + 16) & ~v19));
    swift_retain();
  }
  return v23;
}

uint64_t assignWithCopy for Publishers.Merge6(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 24))(v28, v29);
  v30 = *(_QWORD *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v30 + 24))((*(_QWORD *)(v25 + 64) + *(unsigned __int8 *)(v30 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80), (*(_QWORD *)(v25 + 64) + *(unsigned __int8 *)(v30 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  return a1;
}

uint64_t initializeWithTake for Publishers.Merge6(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 32))(v28, v29);
  v30 = *(_QWORD *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v30 + 32))((*(_QWORD *)(v25 + 64) + *(unsigned __int8 *)(v30 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80), (*(_QWORD *)(v25 + 64) + *(unsigned __int8 *)(v30 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  return a1;
}

uint64_t assignWithTake for Publishers.Merge6(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 40))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 40))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 40))(v28, v29);
  v30 = *(_QWORD *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v30 + 40))((*(_QWORD *)(v25 + 64) + *(unsigned __int8 *)(v30 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80), (*(_QWORD *)(v25 + 64) + *(unsigned __int8 *)(v30 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Merge6(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  char v33;
  int v34;
  unsigned int v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  v13 = a3[4];
  v12 = a3[5];
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_DWORD *)(v14 + 84);
  if (v15 > v11)
    v11 = *(_DWORD *)(v14 + 84);
  v16 = *(_QWORD *)(v12 - 8);
  v17 = *(unsigned int *)(v16 + 84);
  if (v17 <= v11)
    v18 = v11;
  else
    v18 = *(_DWORD *)(v16 + 84);
  v19 = a3[6];
  v20 = a3[7];
  v21 = *(_QWORD *)(v19 - 8);
  v22 = *(_DWORD *)(v21 + 84);
  if (v22 <= v18)
    v23 = v18;
  else
    v23 = *(_DWORD *)(v21 + 84);
  v24 = *(_QWORD *)(v20 - 8);
  if (*(_DWORD *)(v24 + 84) > v23)
    v23 = *(_DWORD *)(v24 + 84);
  if (!a2)
    return 0;
  v25 = *(unsigned __int8 *)(v9 + 80);
  v46 = *(_QWORD *)(v7 + 64) + v25;
  v45 = *(_QWORD *)(v9 + 64);
  v26 = *(unsigned __int8 *)(v14 + 80);
  v44 = *(_QWORD *)(v14 + 64);
  v27 = *(unsigned __int8 *)(v16 + 80);
  v28 = *(unsigned __int8 *)(v21 + 80);
  v43 = *(_QWORD *)(v16 + 64) + v28;
  v29 = *(unsigned __int8 *)(v24 + 80);
  v30 = *(_QWORD *)(v21 + 64) + v29;
  v31 = a2 - v23;
  if (a2 <= v23)
    goto LABEL_33;
  v32 = ((v30 + ((v43 + ((v44 + v27 + ((v45 + v26 + (v46 & ~v25)) & ~v26)) & ~v27)) & ~v28)) & ~v29)
      + *(_QWORD *)(v24 + 64);
  v33 = 8 * v32;
  if (v32 <= 3)
  {
    v35 = ((v31 + ~(-1 << v33)) >> v33) + 1;
    if (HIWORD(v35))
    {
      v34 = *(_DWORD *)(a1 + v32);
      v30 = *(_QWORD *)(v21 + 64) + v29;
      if (!v34)
        goto LABEL_33;
      goto LABEL_24;
    }
    if (v35 > 0xFF)
    {
      v34 = *(unsigned __int16 *)(a1 + v32);
      v30 = *(_QWORD *)(v21 + 64) + v29;
      if (!*(_WORD *)(a1 + v32))
        goto LABEL_33;
      goto LABEL_24;
    }
    v30 = *(_QWORD *)(v21 + 64) + v29;
    if (v35 < 2)
    {
LABEL_33:
      if (v23)
      {
        if (v8 == v23)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v6);
        v38 = (v46 + a1) & ~v25;
        if (v10 == v23)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v9 + 48))(v38, *(unsigned int *)(v9 + 84), v5);
        v39 = (v38 + v45 + v26) & ~v26;
        if (v15 == v23)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v14 + 48))(v39, *(unsigned int *)(v14 + 84), v13);
        v40 = (v39 + v44 + v27) & ~v27;
        if ((_DWORD)v17 == v23)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v40, v17, v12);
        v42 = (v43 + v40) & ~v28;
        if (v22 == v23)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v21 + 48))(v42, *(unsigned int *)(v21 + 84), v19);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v24 + 48))((v30 + v42) & ~v29, *(unsigned int *)(v24 + 84), v20);
      }
      return 0;
    }
  }
  v34 = *(unsigned __int8 *)(a1 + v32);
  if (!*(_BYTE *)(a1 + v32))
    goto LABEL_33;
LABEL_24:
  v36 = (v34 - 1) << v33;
  if (v32 > 3)
    v36 = 0;
  if ((_DWORD)v32)
  {
    if (v32 <= 3)
      v37 = v32;
    else
      v37 = 4;
    __asm { BR              X11 }
  }
  return v23 + v36 + 1;
}

void storeEnumTagSinglePayload for Publishers.Merge6(_BYTE *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v15;
  int v16;

  v4 = *(_QWORD *)(a4[2] - 8);
  v5 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v5 + 84) <= *(_DWORD *)(v4 + 84))
    v6 = *(_DWORD *)(v4 + 84);
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v7 + 84) > v6)
    v6 = *(_DWORD *)(v7 + 84);
  v8 = *(_QWORD *)(a4[5] - 8);
  v9 = *(_QWORD *)(a4[6] - 8);
  v10 = *(_QWORD *)(a4[7] - 8);
  v11 = ((*(_QWORD *)(v9 + 64)
        + *(unsigned __int8 *)(v10 + 80)
        + ((*(_QWORD *)(v8 + 64)
          + *(unsigned __int8 *)(v9 + 80)
          + ((*(_QWORD *)(v7 + 64)
            + *(unsigned __int8 *)(v8 + 80)
            + ((*(_QWORD *)(v5 + 64)
              + *(unsigned __int8 *)(v7 + 80)
              + ((*(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
      + *(_QWORD *)(v10 + 64);
  if (*(_DWORD *)(v8 + 84) > v6)
    v6 = *(_DWORD *)(v8 + 84);
  if (*(_DWORD *)(v9 + 84) > v6)
    v6 = *(_DWORD *)(v9 + 84);
  if (*(_DWORD *)(v10 + 84) > v6)
    v6 = *(_DWORD *)(v10 + 84);
  if (a3 <= v6)
  {
    v12 = 0u;
    if (v6 >= a2)
      goto LABEL_29;
  }
  else if (v11 <= 3)
  {
    v15 = ((a3 - v6 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
    if (HIWORD(v15))
    {
      v12 = 4u;
    }
    else if (v15 >= 0x100)
    {
      v12 = 2;
    }
    else
    {
      v12 = v15 > 1;
    }
    if (v6 >= a2)
LABEL_29:
      __asm { BR              X11 }
  }
  else
  {
    v12 = 1u;
    if (v6 >= a2)
      goto LABEL_29;
  }
  v13 = ~v6 + a2;
  if (v11 < 4)
  {
    if ((_DWORD)v11)
    {
      v16 = v13 & ~(-1 << (8 * v11));
      bzero(a1, v11);
      if ((_DWORD)v11 == 3)
      {
        *(_WORD *)a1 = v16;
        a1[2] = BYTE2(v16);
      }
      else if ((_DWORD)v11 == 2)
      {
        *(_WORD *)a1 = v16;
      }
      else
      {
        *a1 = v16;
      }
    }
  }
  else
  {
    bzero(a1, v11);
    *(_DWORD *)a1 = v13;
  }
  __asm { BR              X10 }
}

uint64_t sub_18B5C2F04(uint64_t result)
{
  uint64_t v1;
  char v2;

  *(_BYTE *)(result + v1) = v2;
  return result;
}

uint64_t sub_18B5C2F0C(uint64_t result)
{
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(result + v1) = v2;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Merge7(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v4 = a3[3];
  v5 = a3[4];
  v6 = *(_QWORD *)(a3[2] - 8);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v49 = *(_QWORD *)(v6 + 64) + v8;
  v9 = a3[6];
  v10 = *(_QWORD *)(v5 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v47 = *(_QWORD *)(v7 + 64) + v11;
  v12 = *(_QWORD *)(a3[5] - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v50 = *(_QWORD *)(v10 + 64) + v13;
  v14 = a3[8];
  v15 = *(_QWORD *)(v9 - 8);
  v16 = *(_DWORD *)(v15 + 80);
  v48 = *(_QWORD *)(v12 + 64) + v16;
  v17 = *(_QWORD *)(a3[7] - 8);
  v18 = *(_DWORD *)(v17 + 80);
  v51 = *(_QWORD *)(v15 + 64) + v18;
  v19 = *(_QWORD *)(v14 - 8);
  v20 = *(_DWORD *)(v19 + 80);
  v52 = *(_QWORD *)(v17 + 64) + v20;
  v21 = *(_DWORD *)(v6 + 80);
  v22 = (*(_BYTE *)(v7 + 80) | v21 | *(_BYTE *)(v10 + 80) | *(_BYTE *)(v12 + 80) | *(_BYTE *)(v15 + 80) | v18 | v20);
  if (v22 <= 7
    && ((v52
       + ((v51 + ((v48 + ((v50 + ((v47 + (v49 & ~v8)) & ~v11)) & ~v13)) & ~v16)) & ~(unint64_t)v18)) & ~(unint64_t)v20)
     + *(_QWORD *)(v19 + 64) <= 0x18
    && ((*(_DWORD *)(v7 + 80) | v21 | *(_DWORD *)(v10 + 80) | *(_DWORD *)(v12 + 80) | *(_DWORD *)(v15 + 80) | v18 | v20) & 0x100000) == 0)
  {
    v41 = a3[5];
    v27 = ~v8;
    v37 = ~v11;
    v38 = ~v13;
    v40 = ~v16;
    v43 = ~(unint64_t)v18;
    v44 = ~(unint64_t)v20;
    v45 = *(_QWORD *)(v14 - 8);
    v46 = a3[8];
    v42 = a3[7];
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    v39 = v9;
    v26 = a1;
    v28 = ((unint64_t)a1 + v49) & v27;
    v29 = ((unint64_t)a2 + v49) & v27;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v28, v29, v4);
    v30 = (v29 + v47) & v37;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16))((v28 + v47) & v37, v30, v5);
    v31 = (((v28 + v47) & v37) + v50) & v38;
    v32 = (v30 + v50) & v38;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(v31, v32, v41);
    v33 = (v31 + v48) & v40;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v15 + 16))(v33, (v32 + v48) & v40, v39);
    v34 = (v33 + v51) & v43;
    v35 = (((v32 + v48) & v40) + v51) & v43;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 16))(v34, v35, v42);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 16))((v34 + v52) & v44, (v35 + v52) & v44, v46);
  }
  else
  {
    v25 = *a2;
    *a1 = *a2;
    v26 = (uint64_t *)(v25 + ((v22 + 16) & ~v22));
    swift_retain();
  }
  return v26;
}

uint64_t assignWithCopy for Publishers.Merge7(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 24))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 24))(v34, v35);
  v36 = *(_QWORD *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v36 + 24))((*(_QWORD *)(v31 + 64) + *(unsigned __int8 *)(v36 + 80) + v34) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80), (*(_QWORD *)(v31 + 64) + *(unsigned __int8 *)(v36 + 80) + v35) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  return a1;
}

uint64_t initializeWithTake for Publishers.Merge7(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 32))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 32))(v34, v35);
  v36 = *(_QWORD *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v36 + 32))((*(_QWORD *)(v31 + 64) + *(unsigned __int8 *)(v36 + 80) + v34) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80), (*(_QWORD *)(v31 + 64) + *(unsigned __int8 *)(v36 + 80) + v35) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  return a1;
}

uint64_t assignWithTake for Publishers.Merge7(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 40))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 40))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 40))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 40))(v34, v35);
  v36 = *(_QWORD *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v36 + 40))((*(_QWORD *)(v31 + 64) + *(unsigned __int8 *)(v36 + 80) + v34) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80), (*(_QWORD *)(v31 + 64) + *(unsigned __int8 *)(v36 + 80) + v35) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Merge7(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  unsigned int v27;
  unsigned int v28;
  unint64_t v29;
  char v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v5 = a3[3];
  v6 = *(_QWORD *)(a3[2] - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7)
    v10 = *(_DWORD *)(v6 + 84);
  else
    v10 = *(_DWORD *)(v8 + 84);
  v11 = *(_QWORD *)(a3[4] - 8);
  v12 = *(_DWORD *)(v11 + 84);
  if (v12 > v10)
    v10 = *(_DWORD *)(v11 + 84);
  v13 = *(_QWORD *)(a3[5] - 8);
  v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v10)
    v15 = v10;
  else
    v15 = *(_DWORD *)(v13 + 84);
  v16 = *(_QWORD *)(a3[6] - 8);
  v17 = *(_DWORD *)(v16 + 84);
  if (v17 > v15)
    v15 = *(_DWORD *)(v16 + 84);
  v18 = *(_QWORD *)(a3[7] - 8);
  v19 = *(unsigned int *)(v18 + 84);
  if (v19 <= v15)
    v20 = v15;
  else
    v20 = *(_DWORD *)(v18 + 84);
  v21 = *(_QWORD *)(a3[8] - 8);
  if (*(_DWORD *)(v21 + 84) <= v20)
    v22 = v20;
  else
    v22 = *(_DWORD *)(v21 + 84);
  if (!a2)
    return 0;
  v23 = *(unsigned __int8 *)(v8 + 80);
  v47 = *(_QWORD *)(v6 + 64) + v23;
  v45 = *(_QWORD *)(v8 + 64);
  v46 = *(unsigned __int8 *)(v11 + 80);
  v24 = *(unsigned __int8 *)(v16 + 80);
  v43 = *(_QWORD *)(v13 + 64) + v24;
  v44 = *(_QWORD *)(v11 + 64);
  v25 = *(unsigned __int8 *)(v18 + 80);
  v42 = *(_QWORD *)(v16 + 64) + v25;
  v40 = *(_QWORD *)(v18 + 64) + *(unsigned __int8 *)(v21 + 80);
  v41 = *(unsigned __int8 *)(v21 + 80);
  v26 = a2 >= v22;
  v27 = a2 - v22;
  if (v27 == 0 || !v26)
  {
LABEL_37:
    if (v22)
    {
      if ((_DWORD)v7 == v22)
        return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 48))(a1, v7);
      v35 = *(unsigned __int8 *)(v13 + 80);
      if ((_DWORD)v9 == v22)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))((v47 + a1) & ~v23, v9, v5);
      v36 = (((v47 + a1) & ~v23) + v45 + v46) & ~v46;
      if (v12 == v22)
        return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v11 + 48))((((v47 + a1) & ~v23) + v45 + v46) & ~v46, *(unsigned int *)(v11 + 84), a3[4]);
      v37 = (v36 + v44 + v35) & ~v35;
      if (v14 == v22)
        return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v13 + 48))((v36 + v44 + v35) & ~v35, *(unsigned int *)(v13 + 84), a3[5]);
      v39 = (v43 + v37) & ~v24;
      if (v17 == v22)
        return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v16 + 48))((v43 + v37) & ~v24, *(unsigned int *)(v16 + 84), a3[6]);
      if ((_DWORD)v19 == v22)
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v18 + 48))((v42 + v39) & ~v25, v19, a3[7]);
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v21 + 48))((v40 + ((v42 + v39) & ~v25)) & ~v41, *(unsigned int *)(v21 + 84), a3[8]);
    }
    return 0;
  }
  v28 = v27;
  v29 = ((v40
        + ((v42
          + ((v43
            + ((v44 + *(unsigned __int8 *)(v13 + 80) + ((v45 + v46 + (v47 & ~v23)) & ~v46)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))) & ~v24)) & ~v25)) & ~v41)
      + *(_QWORD *)(v21 + 64);
  v30 = 8 * v29;
  if (v29 <= 3)
  {
    v32 = ((v28 + ~(-1 << v30)) >> v30) + 1;
    if (HIWORD(v32))
    {
      v31 = *(_DWORD *)(a1 + v29);
      if (!v31)
        goto LABEL_37;
      goto LABEL_28;
    }
    if (v32 > 0xFF)
    {
      v31 = *(unsigned __int16 *)(a1 + v29);
      if (!*(_WORD *)(a1 + v29))
        goto LABEL_37;
      goto LABEL_28;
    }
    if (v32 < 2)
      goto LABEL_37;
  }
  v31 = *(unsigned __int8 *)(a1 + v29);
  if (!*(_BYTE *)(a1 + v29))
    goto LABEL_37;
LABEL_28:
  v33 = (v31 - 1) << v30;
  if (v29 > 3)
    v33 = 0;
  if ((_DWORD)v29)
  {
    if (v29 <= 3)
      v34 = ((v40
            + ((v42
              + ((v43
                + ((v44 + *(unsigned __int8 *)(v13 + 80) + ((v45 + v46 + (v47 & ~(_DWORD)v23)) & ~(_DWORD)v46)) & ~*(unsigned __int8 *)(v13 + 80))) & ~(_DWORD)v24)) & ~(_DWORD)v25)) & ~(_DWORD)v41)
          + *(_DWORD *)(v21 + 64);
    else
      v34 = 4;
    __asm { BR              X11 }
  }
  return v22 + v33 + 1;
}

void storeEnumTagSinglePayload for Publishers.Merge7(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  v7 = *(_QWORD *)(a4[4] - 8);
  v8 = *(_QWORD *)(a4[5] - 8);
  v9 = *(_QWORD *)(a4[6] - 8);
  v10 = *(_QWORD *)(a4[7] - 8);
  v11 = *(_QWORD *)(a4[8] - 8);
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = *(unsigned __int8 *)(v10 + 80);
  v14 = ((*(_QWORD *)(v10 + 64)
        + *(unsigned __int8 *)(v11 + 80)
        + ((*(_QWORD *)(v9 + 64)
          + v13
          + ((*(_QWORD *)(v8 + 64)
            + *(unsigned __int8 *)(v9 + 80)
            + ((*(_QWORD *)(v7 + 64)
              + v12
              + ((*(_QWORD *)(v6 + 64)
                + *(unsigned __int8 *)(v7 + 80)
                + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & ~v12)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~v13)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
      + *(_QWORD *)(v11 + 64);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v15 = *(_DWORD *)(v5 + 84);
  else
    v15 = *(_DWORD *)(v6 + 84);
  if (*(_DWORD *)(v7 + 84) > v15)
    v15 = *(_DWORD *)(v7 + 84);
  if (*(_DWORD *)(v8 + 84) > v15)
    v15 = *(_DWORD *)(v8 + 84);
  if (*(_DWORD *)(v9 + 84) > v15)
    v15 = *(_DWORD *)(v9 + 84);
  if (*(_DWORD *)(v10 + 84) > v15)
    v15 = *(_DWORD *)(v10 + 84);
  if (*(_DWORD *)(v11 + 84) > v15)
    v15 = *(_DWORD *)(v11 + 84);
  if (a3 <= v15)
  {
    v16 = 0u;
    if (v15 >= a2)
      goto LABEL_30;
  }
  else if (v14 <= 3)
  {
    v18 = ((a3 - v15 + ~(-1 << (8 * v14))) >> (8 * v14)) + 1;
    if (HIWORD(v18))
    {
      v16 = 4u;
    }
    else
    {
      v16 = v18 > 1;
      if (v18 >= 0x100)
        v16 = 2;
    }
    if (v15 >= a2)
LABEL_30:
      __asm { BR              X9 }
  }
  else
  {
    v16 = 1u;
    if (v15 >= a2)
      goto LABEL_30;
  }
  v17 = ~v15 + a2;
  if (v14 < 4)
  {
    if ((_DWORD)v14)
    {
      v19 = v17 & ~(-1 << (8 * v14));
      bzero(a1, v14);
      if ((_DWORD)v14 == 3)
      {
        *a1 = v19;
        *((_BYTE *)a1 + 2) = BYTE2(v19);
      }
      else if ((_DWORD)v14 == 2)
      {
        *a1 = v19;
      }
      else
      {
        *(_BYTE *)a1 = v19;
      }
    }
  }
  else
  {
    bzero(a1, v14);
    *(_DWORD *)a1 = v17;
  }
  __asm { BR              X10 }
}

void sub_18B5C3E7C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 + v0) = v1;
}

void sub_18B5C3E84()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;

  *(_WORD *)(v2 + v0) = v1;
}

uint64_t type metadata instantiation function for Publishers.Merge8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Publishers.Merge8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          result = swift_checkMetadataState();
          if (v5 <= 0x3F)
          {
            result = swift_checkMetadataState();
            if (v6 <= 0x3F)
            {
              result = swift_checkMetadataState();
              if (v7 <= 0x3F)
              {
                result = swift_checkMetadataState();
                if (v8 <= 0x3F)
                {
                  swift_initStructMetadata();
                  return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Merge8(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v65;
  uint64_t v66;

  v6 = a3[2];
  v5 = a3[3];
  v59 = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v57 = *(_QWORD *)(v7 + 64) + v9;
  v10 = *(_QWORD *)(v8 + 64);
  v65 = a3[4];
  v11 = *(_QWORD *)(v65 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v54 = v10 + v12;
  v13 = *(_QWORD *)(v11 + 64);
  v66 = a3[5];
  v14 = *(_QWORD *)(v66 - 8);
  v15 = *(_DWORD *)(v14 + 80);
  v58 = v13 + v15;
  v16 = (v13 + v15 + ((v10 + v12 + (v57 & ~v9)) & ~v12)) & ~v15;
  v17 = a3[6];
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_DWORD *)(v18 + 80);
  v55 = *(_QWORD *)(v14 + 64) + v19;
  v20 = *(_QWORD *)(a3[7] - 8);
  v21 = *(_DWORD *)(v20 + 80);
  v61 = *(_QWORD *)(v18 + 64) + v21;
  v22 = a3[9];
  v63 = v20;
  v23 = *(_QWORD *)(v20 + 64);
  v24 = *(_QWORD *)(a3[8] - 8);
  v25 = *(_DWORD *)(v24 + 80);
  v56 = v23 + v25;
  v26 = *(_QWORD *)(v22 - 8);
  v27 = *(_DWORD *)(v26 + 80);
  v62 = *(_QWORD *)(v24 + 64) + v27;
  v64 = v26;
  v28 = *(_DWORD *)(v7 + 80);
  v29 = (*(_BYTE *)(v8 + 80) | v28 | *(_BYTE *)(v11 + 80) | *(_BYTE *)(v14 + 80) | *(_BYTE *)(v18 + 80) | v21 | v25 | v27);
  if (v29 <= 7
    && ((v62
       + ((v56 + ((v61 + ((v55 + v16) & ~v19)) & ~(unint64_t)v21)) & ~(unint64_t)v25)) & ~(unint64_t)v27)
     + *(_QWORD *)(v26 + 64) <= 0x18
    && ((*(_DWORD *)(v8 + 80) | v28 | *(_DWORD *)(v11 + 80) | *(_DWORD *)(v14 + 80) | *(_DWORD *)(v18 + 80) | v21 | v25 | v27) & 0x100000) == 0)
  {
    v52 = a3[7];
    v53 = a3[8];
    v34 = ~v9;
    v46 = ~v12;
    v47 = ~v15;
    v48 = ~v19;
    v49 = ~(unint64_t)v21;
    v50 = ~(unint64_t)v25;
    v51 = ~(unint64_t)v27;
    v35 = v5;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v59);
    v60 = v22;
    v33 = a1;
    v36 = ((unint64_t)a1 + v57) & v34;
    v37 = ((unint64_t)a2 + v57) & v34;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(v36, v37, v35);
    v38 = (v37 + v54) & v46;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((v36 + v54) & v46, v38, v65);
    v39 = (((v36 + v54) & v46) + v58) & v47;
    v40 = (v38 + v58) & v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 16))(v39, v40, v66);
    v41 = (v39 + v55) & v48;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v18 + 16))(v41, (v40 + v55) & v48, v17);
    v42 = (v41 + v61) & v49;
    v43 = (((v40 + v55) & v48) + v61) & v49;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v63 + 16))(v42, v43, v52);
    v44 = (v42 + v56) & v50;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 16))(v44, (v43 + v56) & v50, v53);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v64 + 16))((v44 + v62) & v51, (((v43 + v56) & v50) + v62) & v51, v60);
  }
  else
  {
    v32 = *a2;
    *a1 = *a2;
    v33 = (uint64_t *)(v32 + ((v29 + 16) & ~v29));
    swift_retain();
  }
  return v33;
}

uint64_t destroy for Publishers.Merge8(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v4 = *(_QWORD *)(a2[2] - 8);
  (*(void (**)(void))(v4 + 8))();
  v5 = *(_QWORD *)(v4 + 64) + a1;
  v6 = *(_QWORD *)(a2[3] - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v7);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(_QWORD *)(a2[4] - 8);
  v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  (*(void (**)(unint64_t))(v9 + 8))(v10);
  v11 = *(_QWORD *)(v9 + 64);
  v12 = *(_QWORD *)(a2[5] - 8);
  v13 = (v10 + v11 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  (*(void (**)(unint64_t))(v12 + 8))(v13);
  v14 = *(_QWORD *)(v12 + 64);
  v15 = *(_QWORD *)(a2[6] - 8);
  v16 = (v13 + v14 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  (*(void (**)(unint64_t))(v15 + 8))(v16);
  v17 = *(_QWORD *)(v15 + 64);
  v18 = *(_QWORD *)(a2[7] - 8);
  v19 = (v16 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  (*(void (**)(unint64_t))(v18 + 8))(v19);
  v20 = *(_QWORD *)(v18 + 64);
  v21 = *(_QWORD *)(a2[8] - 8);
  v22 = (v19 + v20 + *(unsigned __int8 *)(v21 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  (*(void (**)(unint64_t))(v21 + 8))(v22);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(a2[9] - 8) + 8))((v22
                                                                                       + *(_QWORD *)(v21 + 64)
                                                                                       + *(unsigned __int8 *)(*(_QWORD *)(a2[9] - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a2[9] - 8) + 80));
}

uint64_t initializeWithCopy for Publishers.Merge8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v34, v35);
  v36 = *(_QWORD *)(v31 + 64);
  v37 = *(_QWORD *)(a3[8] - 8);
  v38 = *(unsigned __int8 *)(v37 + 80);
  v39 = v36 + v38;
  v40 = (v39 + v34) & ~v38;
  v41 = (v39 + v35) & ~v38;
  (*(void (**)(uint64_t, uint64_t))(v37 + 16))(v40, v41);
  v42 = *(_QWORD *)(a3[9] - 8);
  (*(void (**)(unint64_t, unint64_t))(v42 + 16))((*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80), (*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
  return a1;
}

uint64_t assignWithCopy for Publishers.Merge8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 24))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 24))(v34, v35);
  v36 = *(_QWORD *)(v31 + 64);
  v37 = *(_QWORD *)(a3[8] - 8);
  v38 = *(unsigned __int8 *)(v37 + 80);
  v39 = v36 + v38;
  v40 = (v39 + v34) & ~v38;
  v41 = (v39 + v35) & ~v38;
  (*(void (**)(uint64_t, uint64_t))(v37 + 24))(v40, v41);
  v42 = *(_QWORD *)(a3[9] - 8);
  (*(void (**)(unint64_t, unint64_t))(v42 + 24))((*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80), (*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
  return a1;
}

uint64_t initializeWithTake for Publishers.Merge8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 32))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 32))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 32))(v34, v35);
  v36 = *(_QWORD *)(v31 + 64);
  v37 = *(_QWORD *)(a3[8] - 8);
  v38 = *(unsigned __int8 *)(v37 + 80);
  v39 = v36 + v38;
  v40 = (v39 + v34) & ~v38;
  v41 = (v39 + v35) & ~v38;
  (*(void (**)(uint64_t, uint64_t))(v37 + 32))(v40, v41);
  v42 = *(_QWORD *)(a3[9] - 8);
  (*(void (**)(unint64_t, unint64_t))(v42 + 32))((*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80), (*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
  return a1;
}

uint64_t assignWithTake for Publishers.Merge8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 40))(v16, v17);
  v18 = *(_QWORD *)(v13 + 64);
  v19 = *(_QWORD *)(a3[5] - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = v18 + v20;
  v22 = (v21 + v16) & ~v20;
  v23 = (v21 + v17) & ~v20;
  (*(void (**)(uint64_t, uint64_t))(v19 + 40))(v22, v23);
  v24 = *(_QWORD *)(v19 + 64);
  v25 = *(_QWORD *)(a3[6] - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = v24 + v26;
  v28 = (v27 + v22) & ~v26;
  v29 = (v27 + v23) & ~v26;
  (*(void (**)(uint64_t, uint64_t))(v25 + 40))(v28, v29);
  v30 = *(_QWORD *)(v25 + 64);
  v31 = *(_QWORD *)(a3[7] - 8);
  v32 = *(unsigned __int8 *)(v31 + 80);
  v33 = v30 + v32;
  v34 = (v33 + v28) & ~v32;
  v35 = (v33 + v29) & ~v32;
  (*(void (**)(uint64_t, uint64_t))(v31 + 40))(v34, v35);
  v36 = *(_QWORD *)(v31 + 64);
  v37 = *(_QWORD *)(a3[8] - 8);
  v38 = *(unsigned __int8 *)(v37 + 80);
  v39 = v36 + v38;
  v40 = (v39 + v34) & ~v38;
  v41 = (v39 + v35) & ~v38;
  (*(void (**)(uint64_t, uint64_t))(v37 + 40))(v40, v41);
  v42 = *(_QWORD *)(a3[9] - 8);
  (*(void (**)(unint64_t, unint64_t))(v42 + 40))((*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80), (*(_QWORD *)(v37 + 64) + *(unsigned __int8 *)(v42 + 80) + v41) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Merge8(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  char v36;
  int v37;
  unsigned int v38;
  int v39;
  int v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v6 = a3[2];
  v7 = a3[3];
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v7 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v9)
    v12 = *(_DWORD *)(v8 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = a3[4];
  v14 = a3[5];
  v15 = *(_QWORD *)(v13 - 8);
  v16 = *(_DWORD *)(v15 + 84);
  if (v16 > v12)
    v12 = *(_DWORD *)(v15 + 84);
  v17 = *(_QWORD *)(v14 - 8);
  v18 = *(_DWORD *)(v17 + 84);
  if (v18 > v12)
    v12 = *(_DWORD *)(v17 + 84);
  v20 = a3[6];
  v19 = a3[7];
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_DWORD *)(v21 + 84);
  if (v22 > v12)
    v12 = *(_DWORD *)(v21 + 84);
  v23 = *(_QWORD *)(v19 - 8);
  v24 = *(unsigned int *)(v23 + 84);
  if (v24 > v12)
    v12 = *(_DWORD *)(v23 + 84);
  v25 = a3[8];
  v26 = a3[9];
  v27 = *(_QWORD *)(v25 - 8);
  v28 = *(_DWORD *)(v27 + 84);
  if (v28 > v12)
    v12 = *(_DWORD *)(v27 + 84);
  v29 = *(_QWORD *)(v26 - 8);
  v30 = *(_DWORD *)(v29 + 84);
  if (v30 <= v12)
    result = v12;
  else
    result = v30;
  if (!a2)
    return 0;
  v50 = v20;
  v51 = v14;
  v49 = v26;
  v62 = *(unsigned __int8 *)(v10 + 80);
  v63 = *(_QWORD *)(v8 + 64) + v62;
  v60 = *(_QWORD *)(v10 + 64);
  v61 = *(unsigned __int8 *)(v15 + 80);
  v59 = *(_QWORD *)(v15 + 64);
  v32 = *(unsigned __int8 *)(v21 + 80);
  v58 = *(_QWORD *)(v17 + 64) + v32;
  v56 = *(_QWORD *)(v21 + 64) + *(unsigned __int8 *)(v23 + 80);
  v57 = *(unsigned __int8 *)(v23 + 80);
  v54 = *(_QWORD *)(v23 + 64) + *(unsigned __int8 *)(v27 + 80);
  v55 = *(unsigned __int8 *)(v27 + 80);
  v52 = *(_QWORD *)(v27 + 64) + *(unsigned __int8 *)(v29 + 80);
  v53 = *(unsigned __int8 *)(v29 + 80);
  v33 = *(unsigned __int8 *)(v17 + 80);
  v34 = a2 - result;
  if (a2 <= result)
    goto LABEL_37;
  v35 = ((v52
        + ((v54 + ((v56 + ((v58 + ((v59 + v33 + ((v60 + v61 + (v63 & ~v62)) & ~v61)) & ~v33)) & ~v32)) & ~v57)) & ~v55)) & ~v53)
      + *(_QWORD *)(v29 + 64);
  v36 = 8 * v35;
  if (v35 > 3)
    goto LABEL_20;
  v38 = ((v34 + ~(-1 << v36)) >> v36) + 1;
  if (HIWORD(v38))
  {
    v37 = *(_DWORD *)(a1 + v35);
    goto LABEL_29;
  }
  if (v38 > 0xFF)
  {
    v37 = *(unsigned __int16 *)(a1 + v35);
LABEL_29:
    if (!v37)
      goto LABEL_37;
    goto LABEL_30;
  }
  if (v38 >= 2)
  {
LABEL_20:
    v37 = *(unsigned __int8 *)(a1 + v35);
    if (!*(_BYTE *)(a1 + v35))
      goto LABEL_37;
LABEL_30:
    v39 = (v37 - 1) << v36;
    if (v35 > 3)
      v39 = 0;
    if ((_DWORD)v35)
    {
      if (v35 <= 3)
        v40 = v35;
      else
        v40 = 4;
      __asm { BR              X11 }
    }
    return (result + v39 + 1);
  }
LABEL_37:
  if ((_DWORD)result)
  {
    if (v9 == (_DWORD)result)
    {
      v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
      v42 = a1;
      v24 = *(unsigned int *)(v8 + 84);
      v25 = v6;
      return v41(v42, v24, v25);
    }
    v43 = *(unsigned __int8 *)(v17 + 80);
    v44 = v19;
    v45 = (v63 + a1) & ~v62;
    if ((_DWORD)v11 != (_DWORD)result)
    {
      if (v16 == (_DWORD)result)
      {
        v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
        v42 = (v45 + v60 + v61) & ~v61;
        v24 = *(unsigned int *)(v15 + 84);
        v25 = v13;
      }
      else
      {
        v46 = ((v45 + v60 + v61) & ~v61) + v59 + v33;
        if (v18 == (_DWORD)result)
        {
          v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
          v42 = v46 & ~v43;
          v24 = *(unsigned int *)(v17 + 84);
          v25 = v51;
        }
        else
        {
          v47 = (v58 + (v46 & ~v43)) & ~v32;
          if (v22 == (_DWORD)result)
          {
            v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
            v42 = v47;
            v24 = *(unsigned int *)(v21 + 84);
            v25 = v50;
          }
          else
          {
            v48 = (v56 + v47) & ~v57;
            if ((_DWORD)v24 == (_DWORD)result)
            {
              v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
              v42 = (v56 + v47) & ~v57;
              v25 = v44;
            }
            else if (v28 == (_DWORD)result)
            {
              v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
              v42 = (v54 + v48) & ~v55;
              v24 = *(unsigned int *)(v27 + 84);
            }
            else
            {
              v42 = (v52 + ((v54 + v48) & ~v55)) & ~v53;
              v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
              v24 = *(unsigned int *)(v29 + 84);
              v25 = v49;
            }
          }
        }
      }
      return v41(v42, v24, v25);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))((v63 + a1) & ~v62, v11, v7);
  }
  return result;
}

void storeEnumTagSinglePayload for Publishers.Merge8(_BYTE *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;

  v4 = *(_QWORD *)(a4[2] - 8);
  v5 = *(_QWORD *)(a4[3] - 8);
  v6 = *(_QWORD *)(a4[4] - 8);
  v7 = *(_QWORD *)(a4[5] - 8);
  v8 = *(_QWORD *)(a4[6] - 8);
  v9 = *(_QWORD *)(a4[7] - 8);
  v10 = a4[9];
  v11 = *(_QWORD *)(a4[8] - 8);
  v12 = *(unsigned __int8 *)(v5 + 80);
  v13 = *(unsigned __int8 *)(v6 + 80);
  v14 = *(unsigned __int8 *)(v7 + 80);
  v15 = *(_QWORD *)(v10 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = ((*(_QWORD *)(v11 + 64)
        + v16
        + ((*(_QWORD *)(v9 + 64)
          + *(unsigned __int8 *)(v11 + 80)
          + ((*(_QWORD *)(v8 + 64)
            + *(unsigned __int8 *)(v9 + 80)
            + ((*(_QWORD *)(v7 + 64)
              + *(unsigned __int8 *)(v8 + 80)
              + ((*(_QWORD *)(v6 + 64)
                + v14
                + ((*(_QWORD *)(v5 + 64) + v13 + ((*(_QWORD *)(v4 + 64) + v12) & ~v12)) & ~v13)) & ~v14)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))) & ~v16)
      + *(_QWORD *)(v15 + 64);
  if (*(_DWORD *)(v5 + 84) <= *(_DWORD *)(v4 + 84))
    v18 = *(_DWORD *)(v4 + 84);
  else
    v18 = *(_DWORD *)(v5 + 84);
  if (*(_DWORD *)(v6 + 84) > v18)
    v18 = *(_DWORD *)(v6 + 84);
  if (*(_DWORD *)(v7 + 84) > v18)
    v18 = *(_DWORD *)(v7 + 84);
  if (*(_DWORD *)(v8 + 84) > v18)
    v18 = *(_DWORD *)(v8 + 84);
  if (*(_DWORD *)(v9 + 84) > v18)
    v18 = *(_DWORD *)(v9 + 84);
  if (*(_DWORD *)(v11 + 84) > v18)
    v18 = *(_DWORD *)(v11 + 84);
  if (*(_DWORD *)(v15 + 84) > v18)
    v18 = *(_DWORD *)(v15 + 84);
  if (a3 <= v18)
  {
    v19 = 0u;
    if (v18 >= a2)
      goto LABEL_33;
  }
  else if (v17 <= 3)
  {
    v21 = ((a3 - v18 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
    if (HIWORD(v21))
    {
      v19 = 4u;
    }
    else if (v21 >= 0x100)
    {
      v19 = 2;
    }
    else
    {
      v19 = v21 > 1;
    }
    if (v18 >= a2)
LABEL_33:
      __asm { BR              X1 }
  }
  else
  {
    v19 = 1u;
    if (v18 >= a2)
      goto LABEL_33;
  }
  v20 = ~v18 + a2;
  if (v17 < 4)
  {
    if ((_DWORD)v17)
    {
      v22 = v20 & ~(-1 << (8 * v17));
      bzero(a1, v17);
      if ((_DWORD)v17 == 3)
      {
        *(_WORD *)a1 = v22;
        a1[2] = BYTE2(v22);
      }
      else if ((_DWORD)v17 == 2)
      {
        *(_WORD *)a1 = v22;
      }
      else
      {
        *a1 = v22;
      }
    }
  }
  else
  {
    bzero(a1, v17);
    *(_DWORD *)a1 = v20;
  }
  __asm { BR              X10 }
}

void sub_18B5C53C0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(v2 - 96) + v1) = v0;
}

void sub_18B5C53CC()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;

  *(_WORD *)(*(_QWORD *)(v2 - 96) + v1) = v0;
}

void sub_18B5C53D8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(*(_QWORD *)(v2 - 96) + v1) = v0;
  JUMPOUT(0x18B5C53E0);
}

_QWORD *assignWithCopy for Publishers._Merged.Side(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for Publishers._Merged.Side(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t partial apply for closure #1 in closure #1 in Publishers._Merged.request(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[5] + 48))(v0[6], v0[4]);
}

uint64_t partial apply for closure #1 in Publishers._Merged.receive(completion:_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[5] + 56))(v0[6], v0[4]);
}

uint64_t Result.Publisher.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
  type metadata accessor for Result();
  return swift_storeEnumTagMultiPayload();
}

uint64_t Result.publisher.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  MEMORY[0x1E0C80A78](a1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v4);
  v6 = type metadata accessor for Result();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, v4, v6);
}

uint64_t Result.Publisher.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Result();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Result.Publisher.init(catching:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v12 = type metadata accessor for Result();
  MEMORY[0x1E0C80A78](v12);
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a1;
  v23 = a2;
  _ss6ResultOsRi_zrlE8catchingAByxq_Gxyq_YKXE_tcfC((void (*)(_BYTE *))partial apply for closure #1 in Result.Publisher.init(catching:), (uint64_t)&v15[-v13]);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  return _ss6ResultOsRi_zrlE8mapErroryAByxqd__Gqd__q_XEs0C0Rd__lF((void (*)(char *))partial apply for closure #2 in Result.Publisher.init(catching:), v12, a6);
}

uint64_t closure #2 in Result.Publisher.init(catching:)()
{
  MEMORY[0x18D77AC00]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  return swift_dynamicCast();
}

uint64_t _ss6ResultOsRi_zrlE8mapErroryAByxqd__Gqd__q_XEs0C0Rd__lF@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](a1);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v10, v3, v7);
    a1(v10);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 32))(a3, v3, *(_QWORD *)(a2 + 16));
  }
  type metadata accessor for Result();
  return swift_storeEnumTagMultiPayload();
}

uint64_t *Result.Publisher.Inner.__allocating_init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return Result.Publisher.Inner.init(downstream:output:)(a1, a2);
}

uint64_t Result.Publisher.Inner.customMirror.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t *v16;

  v1 = *v0;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v0;
  v8 = *(_QWORD *)(v1 + 80);
  getContiguousArrayStorageType<A>(for:)(v8, v8);
  v9 = *(_QWORD *)(v8 - 8);
  swift_allocObject();
  swift_retain();
  v10 = static Array._adoptStorage(_:count:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v11, (uint64_t)v0 + *(_QWORD *)(*v0 + 120), v8);
  _finalizeUninitializedArray<A>(_:)();
  v15 = v10;
  v12 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF50], v13);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v4);
  return Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)();
}

void Result.Publisher.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 1701015119;
  a1[1] = 0xE400000000000000;
}

uint64_t Result.Publisher.Inner.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v2 = type metadata accessor for Optional();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 56))((char *)&v8 - v4, 1, 1, v1);
  v6 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 112);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 40))(v6, v5, v2);
  return swift_endAccess();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Result<A, B>.Publisher.Inner<A1>()
{
  return 1701015119;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Result<A, B>.Publisher.Inner<A1>()
{
  return Result.Publisher.Inner.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Result<A, B>.Publisher.Inner<A1>(_QWORD *a1@<X8>)
{
  Result.Publisher.Inner.playgroundDescription.getter(a1);
}

uint64_t protocol witness for Cancellable.cancel() in conformance Result<A, B>.Publisher.Inner<A1>()
{
  return Result.Publisher.Inner.cancel()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Result<A, B>.Publisher(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return static Result.Publisher<>.== infix(_:_:)(a1, a2, a3[2], a3[3], *(_QWORD *)(a4 - 8), *(_QWORD *)(a4 - 16), a3[4]);
}

uint64_t Result.Publisher<>.contains(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v18 = a3;
  v19 = a1;
  v20 = a4;
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  v8 = type metadata accessor for Result();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - v10;
  v12 = type metadata accessor for Result();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v17 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, v8);
  v21 = v5;
  v22 = v6;
  v23 = v18;
  v24 = v7;
  v25 = v19;
  _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF((void (*)(char *))partial apply for closure #1 in Result.Publisher<>.contains(_:), v8, (uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  Result.publisher.getter(v12, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t partial apply for closure #1 in Result.Publisher<>.contains(_:)@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = dispatch thunk of static Equatable.== infix(_:_:)();
  *a1 = result & 1;
  return result;
}

uint64_t _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](a1);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v13 + 16))(v12, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 32))(a3, v12, *(_QWORD *)(a2 + 24));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    a1(v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  type metadata accessor for Result();
  return swift_storeEnumTagMultiPayload();
}

uint64_t Result.Publisher<>.max()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

uint64_t Result.Publisher.allSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return Result.Publisher.allSatisfy(_:)(a1, a2, a3, (void (*)(char *))partial apply for closure #1 in Result.Publisher.allSatisfy(_:), a4);
}

uint64_t Result.Publisher.tryAllSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return Result.Publisher.tryAllSatisfy(_:)(a1, a2, a3, (void (*)(char *))partial apply for closure #1 in Result.Publisher.tryAllSatisfy(_:), a4);
}

uint64_t partial apply for closure #1 in Result.Publisher.tryAllSatisfy(_:)@<X0>(_BYTE *a1@<X8>)
{
  return partial apply for closure #1 in Result.Publisher.tryAllSatisfy(_:)(a1);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 40))();
  if (!v2)
    *a1 = result & 1;
  return result;
}

uint64_t Result.Publisher.collect()@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a2;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = type metadata accessor for Result();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - v8;
  type metadata accessor for Array();
  v10 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2, v6);
  v16 = v3;
  v17 = v4;
  v18 = v5;
  _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF((void (*)(char *))partial apply for closure #1 in Result.Publisher.collect(), v6, (uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  Result.publisher.getter(v10, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v10);
}

uint64_t closure #1 in Result.Publisher.collect()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  getContiguousArrayStorageType<A>(for:)(a2, a2);
  v6 = *(_QWORD *)(a2 - 8);
  swift_allocObject();
  v7 = static Array._adoptStorage(_:count:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  result = v7;
  _finalizeUninitializedArray<A>(_:)();
  *a3 = v7;
  return result;
}

uint64_t partial apply for closure #1 in Result.Publisher.collect()@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in Result.Publisher.collect()(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t Result.Publisher.tryMin(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Result.Publisher.tryMin(by:)(a1, a2, a3, (void (*)(_BYTE *))partial apply for closure #1 in Result.Publisher.tryMin(by:), a4);
}

uint64_t partial apply for closure #1 in Result.Publisher.tryMin(by:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return partial apply for closure #1 in Result.Publisher.tryMin(by:)(a1, a2);
}

{
  uint64_t v2;

  return closure #1 in Result.Publisher.tryMin(by:)(*(_QWORD *)(v2 + 40), *(uint64_t (**)(uint64_t, uint64_t))(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t _ss6ResultOsRi_zrlE3getxyq_YKF@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  if (swift_getEnumCaseMultiPayload() != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 32))(a3, v3);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 32))(a2, v3, *(_QWORD *)(a1 + 24));
  return swift_willThrowTypedImpl();
}

uint64_t Result.Publisher.tryMax(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Result.Publisher.tryMin(by:)(a1, a2, a3, (void (*)(_BYTE *))partial apply for closure #1 in Result.Publisher.tryMin(by:), a4);
}

uint64_t Result.Publisher.tryMin(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(_BYTE *)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = v5;
  v18 = a5;
  v11 = *(_QWORD *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v12 = type metadata accessor for Result();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v17 - v14;
  v19 = v11;
  v20 = *(_OWORD *)(a3 + 24);
  v21 = v7;
  v22 = a1;
  v23 = a2;
  _ss6ResultOsRi_zrlE8catchingAByxq_Gxyq_YKXE_tcfC(a4, (uint64_t)&v17 - v14);
  Result.publisher.getter(v12, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t closure #1 in Result.Publisher.tryMin(by:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t *a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v27 = a5;
  v24 = a3;
  v25 = a2;
  v9 = *(_QWORD *)(a4 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v24 - v13;
  v26 = v15;
  v16 = type metadata accessor for Result();
  MEMORY[0x1E0C80A78](v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v24 - v18, a1, v16);
  v19 = v28;
  _ss6ResultOsRi_zrlE3getxyq_YKF(v16, (uint64_t)v14, a6);
  if (!v19)
    return v25(a6, a6);
  v20 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v20(v12, v14, a4);
  v21 = swift_allocError();
  result = ((uint64_t (*)(uint64_t, char *, uint64_t))v20)(v22, v12, a4);
  *v27 = v21;
  return result;
}

uint64_t Result.Publisher.contains(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return Result.Publisher.allSatisfy(_:)(a1, a2, a3, (void (*)(char *))partial apply for closure #1 in Result.Publisher.allSatisfy(_:), a4);
}

uint64_t Result.Publisher.allSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, void (*a4)(char *)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v19 = a2;
  v20 = a4;
  v18 = a1;
  v21 = a5;
  v6 = a3[2];
  v7 = a3[3];
  v8 = a3[4];
  v9 = type metadata accessor for Result();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - v11;
  v13 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v18 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v5, v9);
  v22 = v6;
  v23 = v7;
  v24 = v8;
  v25 = v18;
  v26 = v19;
  _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF(v20, v9, (uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  Result.publisher.getter(v13, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t partial apply for closure #1 in Result.Publisher.allSatisfy(_:)@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 40))();
  *a1 = result & 1;
  return result;
}

uint64_t Result.Publisher.tryContains(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return Result.Publisher.tryAllSatisfy(_:)(a1, a2, a3, (void (*)(char *))partial apply for closure #1 in Result.Publisher.tryAllSatisfy(_:), a4);
}

uint64_t Result.Publisher.tryAllSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, void (*a4)(char *)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  void (*v19)(char *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v19 = a4;
  v9 = a3[2];
  v10 = a3[3];
  v11 = a3[4];
  v12 = type metadata accessor for Result();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v18 - v14, v5, v12);
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = a1;
  v24 = a2;
  Result.tryMap<A>(_:)(v19, v12, MEMORY[0x1E0DEAFA0], &v25);
  result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v17 = v26;
  *(_QWORD *)a5 = v25;
  *(_BYTE *)(a5 + 8) = v17;
  return result;
}

uint64_t Result.Publisher.count()@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v16 = a2;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = type metadata accessor for Result();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - v8;
  v10 = type metadata accessor for Result();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v15 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2, v6);
  v17 = v3;
  v18 = v4;
  v19 = v5;
  _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF((void (*)(char *))partial apply for closure #1 in Optional.Publisher.count(), v6, (uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  Result.publisher.getter(v10, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t Result.Publisher.last()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

uint64_t Result.Publisher.ignoreOutput()@<X0>(_BYTE *a1@<X8>)
{
  return Empty.init(completeImmediately:)(1, a1);
}

uint64_t Result.Publisher.map<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = a1;
  v20 = a2;
  v21 = a5;
  v6 = a3[2];
  v7 = a3[3];
  v8 = a3[4];
  v9 = type metadata accessor for Result();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - v11;
  v13 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v18 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v18, v9);
  v22 = v6;
  v23 = v7;
  v24 = a4;
  v25 = v8;
  v26 = v19;
  v27 = v20;
  _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF((void (*)(char *))partial apply for closure #1 in Result.Publisher.map<A>(_:), v9, (uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  Result.publisher.getter(v13, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t partial apply for closure #1 in Result.Publisher.map<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t Result.Publisher.tryMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = a1;
  v20 = a2;
  v21 = a5;
  v6 = a3[2];
  v7 = a3[3];
  v8 = a3[4];
  v9 = type metadata accessor for Result();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v13 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (uint64_t *)((char *)&v18 - v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v18, v9);
  v22 = v6;
  v23 = v7;
  v24 = a4;
  v25 = v8;
  v26 = v19;
  v27 = v20;
  Result.tryMap<A>(_:)((void (*)(char *))partial apply for closure #1 in Result.Publisher.tryMap<A>(_:), v9, a4, v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  Result.publisher.getter(v13, v21);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t partial apply for closure #1 in Result.Publisher.tryMap<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t Result.Publisher.mapError<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v22 = a1;
  v23 = a2;
  v24 = a6;
  v8 = a3[2];
  v9 = a3[3];
  v20 = a3[4];
  v10 = type metadata accessor for Result();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v19 - v12;
  v14 = type metadata accessor for Result();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v19 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v21, v10);
  v25 = v8;
  v26 = v9;
  v27 = a4;
  v28 = v20;
  v29 = a5;
  v30 = v22;
  v31 = v23;
  _ss6ResultOsRi_zrlE8mapErroryAByxqd__Gqd__q_XEs0C0Rd__lF((void (*)(char *))_ReferencedBasedAnySubscriber.playgroundDescription.getter, v10, (uint64_t)v17);
  Result.publisher.getter(v14, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t Result.Publisher.reduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Result.Publisher.reduce<A>(_:_:)(a1, a2, a3, a4, a5, (void (*)(char *))partial apply for closure #1 in Result.Publisher.reduce<A>(_:_:), a6);
}

uint64_t Result.Publisher.tryReduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v20 = a2;
  v21 = a1;
  v22 = a3;
  v23 = a6;
  v7 = a4[2];
  v8 = a4[3];
  v9 = a4[4];
  v10 = type metadata accessor for Result();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v19 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v14 = type metadata accessor for Result();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (_QWORD *)((char *)v19 - v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 16))(v13, v19[1], v10);
  v24 = v7;
  v25 = v8;
  v26 = a5;
  v27 = v9;
  v28 = v20;
  v29 = v22;
  v30 = v21;
  Result.tryMap<A>(_:)((void (*)(char *))partial apply for closure #1 in Result.Publisher.tryReduce<A>(_:_:), v10, a5, v17);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  Result.publisher.getter(v14, v23);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t partial apply for closure #1 in Result.Publisher.tryReduce<A>(_:_:)(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 48))(*(_QWORD *)(v1 + 64), a1);
}

uint64_t Result.Publisher.removeDuplicates(by:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

uint64_t Result.Publisher.tryRemoveDuplicates(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = v4;
  v19 = a1;
  v20 = a2;
  v21 = a4;
  v6 = a3[2];
  v7 = a3[3];
  v8 = a3[4];
  v9 = type metadata accessor for Result();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - v11;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v13 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (uint64_t *)((char *)&v18 - v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v5, v9);
  v22 = v6;
  v23 = v7;
  v24 = v8;
  v25 = v19;
  v26 = v20;
  Result.tryMap<A>(_:)((void (*)(char *))partial apply for closure #1 in Result.Publisher.tryRemoveDuplicates(by:), v9, v6, v16);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  Result.publisher.getter(v13, v21);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t partial apply for closure #1 in Result.Publisher.tryRemoveDuplicates(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t result;

  v6 = *(_QWORD *)(v2 + 16);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(a1, a1);
  if (!v3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return result;
}

uint64_t Result.Publisher.replaceError(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v4 = v3;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](a1);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Result();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - v13, v4, v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a3, v10, v7);
    type metadata accessor for Result();
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v16(v10, v14, v7);
    v16(a3, v10, v7);
    type metadata accessor for Result();
    return swift_storeEnumTagMultiPayload();
  }
}

uint64_t Result.Publisher.replaceEmpty(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t Result.Publisher.retry(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t Result.Publisher.scan<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Result.Publisher.reduce<A>(_:_:)(a1, a2, a3, a4, a5, (void (*)(char *))partial apply for closure #1 in Result.Publisher.reduce<A>(_:_:), a6);
}

uint64_t Result.Publisher.reduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, void (*a6)(char *)@<X5>, uint64_t a7@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v23 = a3;
  v24 = a6;
  v21 = a2;
  v22 = a1;
  v25 = a7;
  v8 = a4[2];
  v9 = a4[3];
  v10 = a4[4];
  v11 = type metadata accessor for Result();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v20 - v13;
  v15 = type metadata accessor for Result();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v20 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v20, v11);
  v26 = v8;
  v27 = v9;
  v28 = a5;
  v29 = v10;
  v30 = v21;
  v31 = v23;
  v32 = v22;
  _ss6ResultO3mapyAByqd__q_Gqd__xXERi_d__lF(v24, v11, (uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  Result.publisher.getter(v15, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t partial apply for closure #1 in Result.Publisher.reduce<A>(_:_:)(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 48))(*(_QWORD *)(v1 + 64), a1);
}

uint64_t Result.Publisher.tryScan<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = v6;
  v20 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v13 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v19 - v15;
  v21 = *(_OWORD *)(a4 + 16);
  v17 = *(_QWORD *)(a4 + 32);
  v22 = a5;
  v23 = v17;
  v24 = a2;
  v25 = a3;
  v26 = a1;
  v27 = v7;
  _ss6ResultOsRi_zrlE8catchingAByxq_Gxyq_YKXE_tcfC((void (*)(_BYTE *))partial apply for closure #1 in Result.Publisher.tryScan<A>(_:_:), (uint64_t)v16);
  Result.publisher.getter(v13, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t closure #1 in Result.Publisher.tryScan<A>(_:_:)@<X0>(void (*a1)(uint64_t, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, uint64_t *a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a4;
  v31 = a3;
  v32 = a2;
  v33 = a1;
  v30 = a7;
  v10 = *(_QWORD *)(a6 - 8);
  v11 = MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v30 - v14;
  v34 = v16;
  v17 = type metadata accessor for Result();
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v30 - v19;
  v21 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v20, v35, v17);
  v25 = v36;
  _ss6ResultOsRi_zrlE3getxyq_YKF(v17, (uint64_t)v15, (uint64_t)v23);
  if (v25)
  {
    v26 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v26(v13, v15, a6);
    v27 = swift_allocError();
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v26)(v28, v13, a6);
    *a8 = v27;
  }
  else
  {
    v33(v31, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, a5);
  }
  return result;
}

uint64_t partial apply for closure #1 in Result.Publisher.tryScan<A>(_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return closure #1 in Result.Publisher.tryScan<A>(_:_:)(*(void (**)(uint64_t, char *))(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2, a1);
}

uint64_t Result.Publisher<>.setFailureType<A>(to:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = a2;
  v8 = a3;
  return Result.Publisher.init(catching:)((uint64_t)partial apply for closure #1 in Result.Publisher<>.setFailureType<A>(to:), (uint64_t)&v5, v6, a2, a3, a4);
}

uint64_t closure #1 in Result.Publisher<>.setFailureType<A>(to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v4 = type metadata accessor for Result();
  MEMORY[0x1E0C80A78](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v9 - v6, a1, v4);
  return _ss6ResultOsRi_zrlE3getxyq_YKF(v4, v7, a2);
}

uint64_t partial apply for closure #1 in Result.Publisher<>.setFailureType<A>(to:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return closure #1 in Result.Publisher<>.setFailureType<A>(to:)(*(_QWORD *)(v1 + 40), a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Result.Publisher(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80));
  if (v7 <= 7
    && (unint64_t)(v6 + 1) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 >= 2)
    {
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X15 }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t *))(v5 + 16))(a1);
      *((_BYTE *)v3 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v6) = 0;
    }
  }
  else
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v3;
}

uint64_t assignWithCopy for Result.Publisher(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
      v12 = *(_QWORD *)(v6 - 8);
    else
      v12 = *(_QWORD *)(v5 - 8);
    if (v10 == 1)
      v13 = *(_QWORD *)(a3 + 24);
    else
      v13 = *(_QWORD *)(a3 + 16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v13);
    v14 = *(unsigned __int8 *)(a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = v14 == 1;
    if (v14 == 1)
      v17 = v8;
    else
      v17 = v7;
    if (v14 == 1)
      v18 = v6;
    else
      v18 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a2, v18);
    *(_BYTE *)(a1 + v9) = v16;
  }
  return a1;
}

uint64_t initializeWithTake for Result.Publisher(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v6 + 64) <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X16 }
  }
  v10 = v8 == 1;
  if (v8 == 1)
    v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t))(v5 + 32))(a1);
  *(_BYTE *)(a1 + v7) = v10;
  return a1;
}

uint64_t assignWithTake for Result.Publisher(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
      v12 = *(_QWORD *)(v6 - 8);
    else
      v12 = *(_QWORD *)(v5 - 8);
    if (v10 == 1)
      v13 = *(_QWORD *)(a3 + 24);
    else
      v13 = *(_QWORD *)(a3 + 16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v13);
    v14 = *(unsigned __int8 *)(a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = v14 == 1;
    if (v14 == 1)
      v17 = v8;
    else
      v17 = v7;
    if (v14 == 1)
      v18 = v6;
    else
      v18 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(a1, a2, v18);
    *(_BYTE *)(a1 + v9) = v16;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Result.Publisher(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (v3 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64))
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5C7ED4 + 4 * byte_18B5F99C0[(v4 - 1)]))();
}

void storeEnumTagSinglePayload for Result.Publisher(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0u;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t partial apply for closure #1 in Result.Publisher.init(catching:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 40))();
  if (v2)
    *a1 = v2;
  return result;
}

uint64_t partial apply for closure #2 in Result.Publisher.init(catching:)()
{
  return closure #2 in Result.Publisher.init(catching:)();
}

uint64_t type metadata completion function for Publishers.Invoke1I1O.Inner()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t Publishers.Invoke1I1O.Inner.__allocating_init(downstream:invoke:target:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.Invoke1I1O.Inner.__allocating_init(downstream:invoke:target:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))Publishers.Invoke1I1O.Inner.init(downstream:invoke:target:));
}

void Publishers.Invoke1I1O.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x4931656B6F766E49;
  a1[1] = 0xEA00000000004F31;
}

uint64_t *Publishers.Invoke1I1O.Inner.init(downstream:invoke:target:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD *v13;

  v9 = *v4;
  *(uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 160)) = 0;
  *((_BYTE *)v4 + *(_QWORD *)(*v4 + 168)) = 0;
  v10 = (uint64_t)v4 + *(_QWORD *)(*v4 + 176);
  *(_OWORD *)v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_QWORD *)(v10 + 32) = 0;
  v11 = *(_QWORD *)(*v4 + 184);
  v12 = (_DWORD *)swift_slowAlloc();
  *v12 = 0;
  *(uint64_t *)((char *)v4 + v11) = (uint64_t)v12;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 104) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 136), a1);
  v13 = (uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 144));
  *v13 = a2;
  v13[1] = a3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 88) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 152), a4);
  return v4;
}

uint64_t *Publishers.Invoke1I1O.Inner.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 184)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 104) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136));
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 152));
  outlined destroy of Subscription?((uint64_t)v0 + *(_QWORD *)(*v0 + 176));
  return v0;
}

uint64_t Publishers.Invoke1I1O.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.Invoke1I1O.Inner.deinit);
}

void type metadata accessor for Publishers.Invoke1I1O.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t type metadata completion function for Publishers.Invoke2I1O.Inner()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t Publishers.Invoke1I1O.Inner.request(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  result = swift_beginAccess();
  if (*(_QWORD *)(v3 + 24))
  {
    outlined init with copy of Subscription(v3, (uint64_t)v7);
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  return result;
}

uint64_t Publishers.Invoke1I1O.Inner.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 176);
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 24))
  {
    outlined init with copy of Subscription(v1, (uint64_t)&v5);
    v3 = *((_QWORD *)&v6 + 1);
    v2 = v7;
    __swift_project_boxed_opaque_existential_1(&v5, *((uint64_t *)&v6 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 8))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
  }
  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v5, v1);
  return swift_endAccess();
}

uint64_t Publishers.Invoke1I1O.Inner.receive(subscription:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  _UNKNOWN **v14;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of Subscription?(v4, (uint64_t)v12);
  v5 = v13;
  outlined destroy of Subscription?((uint64_t)v12);
  if (v5)
  {
    v6 = a1[3];
    v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v6);
  }
  else
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v12);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v12, v4);
    swift_endAccess();
    v13 = v3;
    v14 = &protocol witness table for Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>;
    v12[0] = v1;
    v9 = *(_QWORD *)(v3 + 128);
    v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v9 + 40);
    v11 = *(_QWORD *)(v3 + 104);
    swift_retain();
    v10(v12, v11, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
}

void Publishers.Invoke1I1O.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void (*v9)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t);

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 184);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v2 + v4));
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 160);
  v6 = *(_QWORD *)(v2 + v5);
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + v5) = v8;
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + v4));
    v9 = (void (*)(uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(*(uint64_t (**)(uint64_t))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 144)))(v2+ *(_QWORD *)(*(_QWORD *)v2 + 152));
    swift_retain();
    v9(a1, partial apply for closure #1 in Publishers.Invoke1I1O.Inner.receive(_:), v2);
    swift_release();
    swift_release();
  }
}

void closure #1 in Publishers.Invoke1I1O.Inner.receive(_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[3];
  uint64_t v59;
  uint64_t v60;

  v54 = a2;
  v55 = a1;
  v4 = *a3;
  v5 = *(_QWORD *)(*a3 + 128);
  v6 = *(_QWORD *)(*a3 + 112);
  v56 = *(_QWORD *)(*a3 + 104);
  v57 = v5;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = type metadata accessor for Subscribers.Completion(0, v6, AssociatedConformanceWitness, v8);
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x1E0C80A78](v9);
  v49 = (char *)&v48 - v10;
  v11 = type metadata accessor for Optional();
  v52 = *(_QWORD *)(v11 - 8);
  v53 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v48 - v13;
  v15 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v12);
  v48 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v4 + 96);
  v18 = type metadata accessor for Optional();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v48 - v21;
  v23 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v55, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v22, 1, v17) == 1)
  {
    v27 = v56;
    v26 = v57;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    v29 = v52;
    v28 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v14, v54, v53);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v28);
      return;
    }
    v42 = v48;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v48, v14, v6);
    v43 = v49;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v49, v42, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v43, 0, 1, v6);
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 56))(v43, v27, v26);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v43, v51);
    v39 = *(void (**)(char *, uint64_t))(v15 + 8);
    v40 = v42;
    v41 = v6;
    goto LABEL_10;
  }
  v54 = v15;
  v55 = v23;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v22, v17);
  v30 = v56;
  v31 = v57;
  v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 48))(v25, v56, v57);
  v33 = *(_QWORD *)(*a3 + 184);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)a3 + v33));
  v34 = *(_QWORD *)(*a3 + 160);
  v35 = *(uint64_t *)((char *)a3 + v34);
  v36 = __OFSUB__(v35, 1);
  v37 = v35 - 1;
  if (v36)
  {
    __break(1u);
    goto LABEL_20;
  }
  *(uint64_t *)((char *)a3 + v34) = v37;
  if (*((_BYTE *)a3 + *(_QWORD *)(*a3 + 168)) == 1 && !v37)
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)a3 + v33));
    v38 = v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v49, 1, 1, v6);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 56))(v38, v30, v31);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v51);
    v39 = *(void (**)(char *, uint64_t))(v55 + 8);
LABEL_8:
    v40 = v25;
    v41 = v17;
LABEL_10:
    v39(v40, v41);
    return;
  }
  v44 = v55;
  if (v32 != 0x8000000000000000)
  {
    if ((v32 & 0x8000000000000000) == 0)
    {
      if (!v32)
      {
        os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)a3 + v33));
        v39 = *(void (**)(char *, uint64_t))(v44 + 8);
        goto LABEL_8;
      }
      goto LABEL_15;
    }
LABEL_20:
    __break(1u);
    return;
  }
LABEL_15:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)a3 + v33));
  v45 = (uint64_t)a3 + *(_QWORD *)(*a3 + 176);
  swift_beginAccess();
  if (*(_QWORD *)(v45 + 24))
  {
    outlined init with copy of Subscription(v45, (uint64_t)v58);
    swift_endAccess();
    v46 = v59;
    v47 = v60;
    __swift_project_boxed_opaque_existential_1(v58, v59);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 24))(v32, v46, v47);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v17);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v17);
    swift_endAccess();
  }
}

void Publishers.Invoke1I1O.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 184);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + v4));
  *((_BYTE *)v1 + *(_QWORD *)(*v1 + 168)) = 1;
  v5 = *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 160));
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + v4));
  if (!v5)
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 128) + 56))(a1, *(_QWORD *)(v3 + 104));
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>(_QWORD *a1)
{
  return Publishers.Invoke1I1O.Inner.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>(uint64_t a1)
{
  Publishers.Invoke1I1O.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>(uint64_t a1)
{
  Publishers.Invoke1I1O.Inner.receive(completion:)(a1);
}

uint64_t protocol witness for Subscription.request(_:) in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>(uint64_t a1)
{
  return Publishers.Invoke1I1O.Inner.request(_:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>()
{
  return 0x4931656B6F766E49;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>(_QWORD *a1@<X8>)
{
  Publishers.Invoke1I1O.Inner.playgroundDescription.getter(a1);
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>()
{
  return Publishers.Invoke1I1O.Inner.cancel()();
}

uint64_t Publishers.Invoke2I1O.Inner.__allocating_init(downstream:invoke:target:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.Invoke1I1O.Inner.__allocating_init(downstream:invoke:target:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))Publishers.Invoke2I1O.Inner.init(downstream:invoke:target:));
}

uint64_t Publishers.Invoke1I1O.Inner.__allocating_init(downstream:invoke:target:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  swift_allocObject();
  return a5(a1, a2, a3, a4);
}

void Publishers.Invoke2I1O.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x4932656B6F766E49;
  a1[1] = 0xEA00000000004F31;
}

uint64_t *Publishers.Invoke2I1O.Inner.init(downstream:invoke:target:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD *v13;

  v9 = *v4;
  *(uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 176)) = 0;
  *((_BYTE *)v4 + *(_QWORD *)(*v4 + 184)) = 0;
  v10 = (uint64_t)v4 + *(_QWORD *)(*v4 + 192);
  *(_OWORD *)v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_QWORD *)(v10 + 32) = 0;
  v11 = *(_QWORD *)(*v4 + 200);
  v12 = (_DWORD *)swift_slowAlloc();
  *v12 = 0;
  *(uint64_t *)((char *)v4 + v11) = (uint64_t)v12;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 120) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 152), a1);
  v13 = (uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 160));
  *v13 = a2;
  v13[1] = a3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 88) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 168), a4);
  return v4;
}

uint64_t *Publishers.Invoke2I1O.Inner.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 200)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 120) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 152));
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 168));
  outlined destroy of Subscription?((uint64_t)v0 + *(_QWORD *)(*v0 + 192));
  return v0;
}

uint64_t Publishers.Invoke2I1O.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.Invoke2I1O.Inner.deinit);
}

void type metadata accessor for Publishers.Invoke2I1O.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.Invoke2I1O.Inner.request(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 192);
  result = swift_beginAccess();
  if (*(_QWORD *)(v3 + 24))
  {
    outlined init with copy of Subscription(v3, (uint64_t)v7);
    v5 = v8;
    v6 = v9;
    __swift_project_boxed_opaque_existential_1(v7, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  return result;
}

uint64_t Publishers.Invoke2I1O.Inner.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 192);
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 24))
  {
    outlined init with copy of Subscription(v1, (uint64_t)&v5);
    v3 = *((_QWORD *)&v6 + 1);
    v2 = v7;
    __swift_project_boxed_opaque_existential_1(&v5, *((uint64_t *)&v6 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v2 + 8) + 8))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
  }
  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v5, v1);
  return swift_endAccess();
}

uint64_t Publishers.Invoke2I1O.Inner.receive(subscription:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  _UNKNOWN **v14;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 192);
  swift_beginAccess();
  outlined init with copy of Subscription?(v4, (uint64_t)v12);
  v5 = v13;
  outlined destroy of Subscription?((uint64_t)v12);
  if (v5)
  {
    v6 = a1[3];
    v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v6);
  }
  else
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v12);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v12, v4);
    swift_endAccess();
    v13 = v3;
    v14 = &protocol witness table for Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>;
    v12[0] = v1;
    v9 = *(_QWORD *)(v3 + 144);
    v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v9 + 40);
    v11 = *(_QWORD *)(v3 + 120);
    swift_retain();
    v10(v12, v11, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
}

void Publishers.Invoke2I1O.Inner.receive(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void (*v18)(char *, char *, void (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v19;

  v3 = v2;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 96);
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 104);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v11 = (char *)&v19 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))((char *)&v19 - v10, a1, v6);
  v12 = &v11[*(int *)(TupleTypeMetadata2 + 48)];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v12, a2, v7);
  v13 = *(_QWORD *)(*(_QWORD *)v3 + 200);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v3 + v13));
  v14 = *(_QWORD *)(*(_QWORD *)v3 + 176);
  v15 = *(_QWORD *)(v3 + v14);
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + v14) = v17;
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 + v13));
    v18 = (void (*)(char *, char *, void (*)(uint64_t, uint64_t), uint64_t))(*(uint64_t (**)(uint64_t))(v3 + *(_QWORD *)(*(_QWORD *)v3 + 160)))(v3+ *(_QWORD *)(*(_QWORD *)v3 + 168));
    swift_retain();
    v18(v11, v12, partial apply for closure #1 in Publishers.Invoke2I1O.Inner.receive(_:), v3);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, TupleTypeMetadata2);
  }
}

void closure #1 in Publishers.Invoke2I1O.Inner.receive(_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[3];
  uint64_t v59;
  uint64_t v60;

  v54 = a2;
  v55 = a1;
  v4 = *a3;
  v5 = *(_QWORD *)(*a3 + 144);
  v6 = *(_QWORD *)(*a3 + 128);
  v56 = *(_QWORD *)(*a3 + 120);
  v57 = v5;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = type metadata accessor for Subscribers.Completion(0, v6, AssociatedConformanceWitness, v8);
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x1E0C80A78](v9);
  v49 = (char *)&v48 - v10;
  v11 = type metadata accessor for Optional();
  v52 = *(_QWORD *)(v11 - 8);
  v53 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v48 - v13;
  v15 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v12);
  v48 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v4 + 112);
  v18 = type metadata accessor for Optional();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v48 - v21;
  v23 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v55, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v22, 1, v17) == 1)
  {
    v27 = v56;
    v26 = v57;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    v29 = v52;
    v28 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v14, v54, v53);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v28);
      return;
    }
    v42 = v48;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v48, v14, v6);
    v43 = v49;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v49, v42, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v43, 0, 1, v6);
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 56))(v43, v27, v26);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v43, v51);
    v39 = *(void (**)(char *, uint64_t))(v15 + 8);
    v40 = v42;
    v41 = v6;
    goto LABEL_10;
  }
  v54 = v15;
  v55 = v23;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v22, v17);
  v30 = v56;
  v31 = v57;
  v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v57 + 48))(v25, v56, v57);
  v33 = *(_QWORD *)(*a3 + 200);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)a3 + v33));
  v34 = *(_QWORD *)(*a3 + 176);
  v35 = *(uint64_t *)((char *)a3 + v34);
  v36 = __OFSUB__(v35, 1);
  v37 = v35 - 1;
  if (v36)
  {
    __break(1u);
    goto LABEL_20;
  }
  *(uint64_t *)((char *)a3 + v34) = v37;
  if (*((_BYTE *)a3 + *(_QWORD *)(*a3 + 184)) == 1 && !v37)
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)a3 + v33));
    v38 = v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v49, 1, 1, v6);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 56))(v38, v30, v31);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v51);
    v39 = *(void (**)(char *, uint64_t))(v55 + 8);
LABEL_8:
    v40 = v25;
    v41 = v17;
LABEL_10:
    v39(v40, v41);
    return;
  }
  v44 = v55;
  if (v32 != 0x8000000000000000)
  {
    if ((v32 & 0x8000000000000000) == 0)
    {
      if (!v32)
      {
        os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)a3 + v33));
        v39 = *(void (**)(char *, uint64_t))(v44 + 8);
        goto LABEL_8;
      }
      goto LABEL_15;
    }
LABEL_20:
    __break(1u);
    return;
  }
LABEL_15:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)a3 + v33));
  v45 = (uint64_t)a3 + *(_QWORD *)(*a3 + 192);
  swift_beginAccess();
  if (*(_QWORD *)(v45 + 24))
  {
    outlined init with copy of Subscription(v45, (uint64_t)v58);
    swift_endAccess();
    v46 = v59;
    v47 = v60;
    __swift_project_boxed_opaque_existential_1(v58, v59);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 24))(v32, v46, v47);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v17);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v17);
    swift_endAccess();
  }
}

void Publishers.Invoke2I1O.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 200);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + v4));
  *((_BYTE *)v1 + *(_QWORD *)(*v1 + 184)) = 1;
  v5 = *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 176));
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + v4));
  if (!v5)
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 144) + 56))(a1, *(_QWORD *)(v3 + 120));
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>(_QWORD *a1)
{
  return Publishers.Invoke2I1O.Inner.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>(uint64_t a1)
{
  uint64_t TupleTypeMetadata2;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  Publishers.Invoke2I1O.Inner.receive(_:)(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>(uint64_t a1)
{
  Publishers.Invoke2I1O.Inner.receive(completion:)(a1);
}

uint64_t protocol witness for Subscription.request(_:) in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>(uint64_t a1)
{
  return Publishers.Invoke2I1O.Inner.request(_:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>()
{
  return 0x4932656B6F766E49;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>(_QWORD *a1@<X8>)
{
  Publishers.Invoke2I1O.Inner.playgroundDescription.getter(a1);
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>()
{
  return Publishers.Invoke2I1O.Inner.cancel()();
}

uint64_t associated type witness table accessor for Subscriber.Failure : Error in Publishers.Invoke2I1O<A, B, C, D, E>.Inner<A1, B1>()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t associated type witness table accessor for Subscriber.Failure : Error in Publishers.Invoke1I1O<A, B, C>.Inner<A1, B1>()
{
  return swift_getAssociatedConformanceWitness();
}

void partial apply for closure #1 in Publishers.Invoke1I1O.Inner.receive(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  closure #1 in Publishers.Invoke1I1O.Inner.receive(_:)(a1, a2, v2);
}

void partial apply for closure #1 in Publishers.Invoke2I1O.Inner.receive(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  closure #1 in Publishers.Invoke2I1O.Inner.receive(_:)(a1, a2, v2);
}

uint64_t *initializeBufferWithCopyOfBuffer for PartialCompletion(uint64_t *__dst, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80));
  if (v7 <= 7
    && (unint64_t)(v6 + 1) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 >= 2)
    {
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X16 }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t *))(v5 + 16))(__dst);
      *((_BYTE *)v3 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(__dst);
      *((_BYTE *)v3 + v6) = 0;
    }
  }
  else
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v3;
}

unsigned __int8 *assignWithCopy for PartialCompletion(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    if (__dst[v9] >= 2u)
    {
      if (v9 <= 3)
        v10 = v9;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    v11 = *(_QWORD *)(v5 - 8);
    v12 = *(_QWORD *)(a3 + 16);
    if (__dst[v9])
    {
      v11 = *(_QWORD *)(v6 - 8);
      v12 = *(_QWORD *)(a3 + 24);
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(__dst, v12);
    v13 = __src[v9];
    if (v13 >= 2)
    {
      if (v9 <= 3)
        v14 = v9;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v8 + 16))(__dst, __src, v6);
      __dst[v9] = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(__dst, __src, v5);
      __dst[v9] = 0;
    }
  }
  return __dst;
}

_BYTE *initializeWithTake for PartialCompletion(_BYTE *__dst, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X15 }
  }
  if (v7 == 1)
  {
    (*(void (**)(_BYTE *))(v5 + 32))(__dst);
    __dst[v6] = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v6] = 0;
  }
  return __dst;
}

unsigned __int8 *assignWithTake for PartialCompletion(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    if (__dst[v9] >= 2u)
    {
      if (v9 <= 3)
        v10 = v9;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    v11 = *(_QWORD *)(v5 - 8);
    v12 = *(_QWORD *)(a3 + 16);
    if (__dst[v9])
    {
      v11 = *(_QWORD *)(v6 - 8);
      v12 = *(_QWORD *)(a3 + 24);
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(__dst, v12);
    v13 = __src[v9];
    if (v13 >= 2)
    {
      if (v9 <= 3)
        v14 = v9;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v8 + 32))(__dst, __src, v6);
      __dst[v9] = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(__dst, __src, v5);
      __dst[v9] = 0;
    }
  }
  return __dst;
}

uint64_t getEnumTagSinglePayload for PartialCompletion(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (v3 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64))
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5C9FBC + 4 * byte_18B5F9D88[(v4 - 1)]))();
}

void storeEnumTagSinglePayload for PartialCompletion(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0u;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t getEnumTag for PartialCompletion(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64);
  if (v2 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64))
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5CA200 + 4 * byte_18B5F9D96[v3]))();
}

void destructiveInjectEnumTag for PartialCompletion(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8)
                                                                                + 64))
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t Publisher.tryScan<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publisher.reduce<A>(_:_:)(a1, a2, a3, a4, a5, a6, type metadata accessor for Publishers.TryScan, a7);
}

uint64_t Publishers.TryScan.init(upstream:initialResult:nextPartialResult:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  return Publishers.Reduce.init(upstream:initial:nextPartialResult:)(a1, a2, a3, a4, a5, a6, a7, type metadata accessor for Publishers.TryScan, a8);
}

uint64_t type metadata accessor for Publishers.TryScan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.TryScan);
}

uint64_t Publishers.Scan.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Scan.Inner.__allocating_init(downstream:nextPartialResult:initialResult:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = swift_allocObject();
  v9 = *(_QWORD *)v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 96) - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)v8 + 120), a1);
  v10 = (_QWORD *)(v8 + *(_QWORD *)(*(_QWORD *)v8 + 128));
  *v10 = a2;
  v10[1] = a3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 88) - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)v8 + 136), a4);
  return v8;
}

uint64_t Publishers.Scan.Inner.customMirror.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _BYTE v17[24];
  uint64_t v18;

  v1 = *(_QWORD **)v0;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_18B5F4780;
  *(_QWORD *)(v8 + 32) = 0x657274736E776F64;
  *(_QWORD *)(v8 + 40) = 0xEA00000000006D61;
  v9 = v0 + v1[15];
  v10 = v1[12];
  *(_QWORD *)(v8 + 72) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(boxed_opaque_existential_1, v9, v10);
  *(_QWORD *)(v8 + 80) = 0x746C75736572;
  *(_QWORD *)(v8 + 88) = 0xE600000000000000;
  v12 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 136);
  swift_beginAccess();
  v13 = v1[11];
  *(_QWORD *)(v8 + 120) = v13;
  v14 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 96));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v14, v12, v13);
  v15 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v4);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.Scan.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 1851876179;
  a1[1] = 0xE400000000000000;
}

uint64_t Publishers.Scan.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)v1 + 112) + 56))(a1, *(_QWORD *)(*(_QWORD *)v1 + 96));
}

uint64_t *Publishers.Scan.Inner.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*v0 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 120));
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136));
  return v0;
}

uint64_t Publishers.Scan.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.Scan.Inner.deinit);
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.Scan<A, B>.Inner<A1>(uint64_t a1)
{
  return Publishers.Scan.Inner.receive(completion:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Scan<A, B>.Inner<A1>()
{
  return 1851876179;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Scan<A, B>.Inner<A1>()
{
  return Publishers.Scan.Inner.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Scan<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Scan.Inner.playgroundDescription.getter(a1);
}

void Publishers.TryScan.receive<A>(subscriber:)(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x1E0C80A78](a1);
  MEMORY[0x1E0C80A78](v1);
  type metadata accessor for Publishers.TryScan.Inner();
}

uint64_t sub_18B5CA7BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v9, *(_QWORD *)(v10 - 136), v5);
  v12 = *(int *)(v6 + 44);
  v13 = (uint64_t *)(v1 + *(int *)(v6 + 48));
  v14 = *v13;
  v15 = v13[1];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v2, v1 + v12, v8);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v10 - 120) = Publishers.TryScan.Inner.init(downstream:nextPartialResult:initialResult:)(v9, v14, v15, v2);
  v16 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.TryScan<A, B>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v10 - 120, v4, a1, *(_QWORD *)(v10 - 128), v16);
  return swift_release();
}

void type metadata accessor for Publishers.TryScan.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t *Publishers.TryScan.Inner.__allocating_init(downstream:nextPartialResult:initialResult:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  return Publishers.TryScan.Inner.init(downstream:nextPartialResult:initialResult:)(a1, a2, a3, a4);
}

uint64_t Publishers.TryScan.Inner.customMirror.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD *v21;

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_18B5F5810;
  *(_QWORD *)(v9 + 32) = 0x657274736E776F64;
  *(_QWORD *)(v9 + 40) = 0xEA00000000006D61;
  v10 = (char *)v0 + v2[15];
  v11 = v2[12];
  *(_QWORD *)(v9 + 72) = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 + 48));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, v10, v11);
  *(_QWORD *)(v9 + 80) = 0x737574617473;
  *(_QWORD *)(v9 + 88) = 0xE600000000000000;
  v13 = (uint64_t)v1 + *(_QWORD *)(*v1 + 144);
  swift_beginAccess();
  *(_QWORD *)(v9 + 120) = &type metadata for SubscriptionStatus;
  v14 = swift_allocObject();
  *(_QWORD *)(v9 + 96) = v14;
  outlined init with copy of SubscriptionStatus(v13, v14 + 16);
  *(_QWORD *)(v9 + 128) = 0x746C75736572;
  *(_QWORD *)(v9 + 136) = 0xE600000000000000;
  v15 = (char *)v1 + *(_QWORD *)(*v1 + 136);
  swift_beginAccess();
  v16 = v2[11];
  *(_QWORD *)(v9 + 168) = v16;
  v17 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 + 144));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v17, v15, v16);
  v18 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v8, 1, 1, v18);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.TryScan.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x6E616353797254;
  a1[1] = 0xE700000000000000;
}

uint64_t *Publishers.TryScan.Inner.init(downstream:nextPartialResult:initialResult:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD *v13;

  v9 = *v4;
  v10 = (uint64_t)v4 + *(_QWORD *)(*v4 + 144);
  *(_OWORD *)v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_QWORD *)(v10 + 32) = 0;
  *(_BYTE *)(v10 + 40) = 2;
  v11 = *(_QWORD *)(*v4 + 152);
  v12 = (_DWORD *)swift_slowAlloc();
  *v12 = 0;
  *(uint64_t *)((char *)v4 + v11) = (uint64_t)v12;
  *((_BYTE *)v4 + *(_QWORD *)(*v4 + 160)) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 96) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 120), a1);
  v13 = (uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 128));
  *v13 = a2;
  v13[1] = a3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v9 + 88) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 136), a4);
  return v4;
}

uint64_t *Publishers.TryScan.Inner.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 152)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 120));
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(_QWORD *)(*v0 + 144));
  return v0;
}

uint64_t Publishers.TryScan.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.TryScan.Inner.deinit);
}

uint64_t Publishers.TryScan.Inner.receive(subscription:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void (*v11)(uint64_t **, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t *v13;
  int8x16_t v14;
  int8x16_t v15;
  char v16;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 152);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + v4));
  v5 = (uint64_t)v1 + *(_QWORD *)(*v1 + 144);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v13);
  if (v16 == 2
    && (v6 = vorrq_s8(v14, v15),
        !(*(_QWORD *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v13)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v13);
    v16 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v13, v5);
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + v4));
    v15.i64[0] = v3;
    v15.i64[1] = (uint64_t)&protocol witness table for Publishers.TryScan<A, B>.Inner<A1>;
    v13 = v1;
    v10 = *(_QWORD *)(v3 + 112);
    v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    v12 = *(_QWORD *)(v3 + 96);
    swift_retain();
    v11(&v13, v12, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }
  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v13);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + v4));
    v8 = a1[3];
    v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v8);
  }
}

uint64_t Publishers.TryScan.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  char *v16;
  uint64_t v17;
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;

  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v20 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v19 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v19 - v11;
  v13 = *(void (**)(char *, uint64_t))(v1 + v3[16]);
  v14 = v1 + v3[17];
  swift_beginAccess();
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v19(v10, v14, v4);
  v13(v10, a1);
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v10, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v14, v12, v4);
  swift_endAccess();
  v16 = v20;
  v19(v20, v14, v4);
  v17 = (*(uint64_t (**)(char *, _QWORD))(v3[14] + 48))(v16, v3[12]);
  v15(v16, v4);
  return v17;
}

void Publishers.TryScan.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  char *v5;
  uint64_t AssociatedConformanceWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  unsigned __int8 v21;

  v18 = a1;
  v2 = *(_QWORD **)v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v19 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v5 = (char *)&v17 - v4;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v8 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - v10;
  v12 = v2[19];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + v12));
  v13 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v13, (uint64_t)v20);
  LODWORD(v13) = v21;
  outlined destroy of SubscriptionStatus((uint64_t)v20);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v12));
  if (!(_DWORD)v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
    v14 = v19;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, AssociatedTypeWitness) == 1)
    {
      v20[0] = 0;
      (*(void (**)(_QWORD *, _QWORD))(v2[14] + 56))(v20, v2[12]);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v5, v11, AssociatedTypeWitness);
      v15 = swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v16, v5, AssociatedTypeWitness);
      v20[0] = v15;
      (*(void (**)(_QWORD *, _QWORD))(v2[14] + 56))(v20, v2[12]);
      MEMORY[0x18D77ABF4](v15);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v5, AssociatedTypeWitness);
    }
  }
}

void Publishers.TryScan.Inner.request(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7[2];
  char v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v1 + v3));
  v4 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v7);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v7);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v3));
  }
  else
  {
    outlined init with take of Subscription(v7, (uint64_t)v9);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v1 + v3));
    v5 = v10;
    v6 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
}

void Publishers.TryScan.Inner.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  char v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 152);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + v1));
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 144);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
  }
  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    v5 = 1;
    v6 = 0u;
    v7 = 0u;
    v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
    v3 = v10;
    v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 8))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.TryScan<A, B>.Inner<A1>(_QWORD *a1)
{
  return Publishers.TryScan.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.TryScan<A, B>.Inner<A1>(uint64_t a1)
{
  return Publishers.TryScan.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.TryScan<A, B>.Inner<A1>(uint64_t a1)
{
  Publishers.TryScan.Inner.receive(completion:)(a1);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.TryScan<A, B>.Inner<A1>(uint64_t a1)
{
  Publishers.TryScan.Inner.request(_:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.TryScan<A, B>.Inner<A1>()
{
  return 0x6E616353797254;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.TryScan<A, B>.Inner<A1>()
{
  return Publishers.TryScan.Inner.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryScan<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.TryScan.Inner.playgroundDescription.getter(a1);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.TryScan<A, B>.Inner<A1>()
{
  Publishers.TryScan.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryScan<A, B>(uint64_t a1)
{
  Publishers.TryScan.receive<A>(subscriber:)(a1);
}

uint64_t getEnumTagSinglePayload for Publishers.Scan(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6)
    v9 = *(_DWORD *)(v5 + 84);
  else
    v9 = *(_DWORD *)(v7 + 84);
  if (v9 <= 0x7FFFFFFF)
    v9 = 0x7FFFFFFF;
  if (!a2)
    return 0;
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = *(_QWORD *)(v5 + 64) + v10;
  v12 = *(_QWORD *)(v7 + 64) + 7;
  if (v9 >= a2)
  {
    if (v6 == v9)
    {
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 48))(a1, *(unsigned int *)(v5 + 84), v4);
    }
    else
    {
      v17 = (v11 + a1) & ~v10;
      if (v8 == v9)
      {
        return (*(uint64_t (**)(uint64_t))(v7 + 48))(v17);
      }
      else
      {
        v18 = *(_QWORD *)((v12 + v17) & 0xFFFFFFFFFFFFF8);
        if (v18 >= 0xFFFFFFFF)
          LODWORD(v18) = -1;
        return (v18 + 1);
      }
    }
  }
  else
  {
    if (((((v12 + (v11 & ~v10)) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v13 = 2;
    else
      v13 = a2 - v9 + 1;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5CB6B0 + 4 * byte_18B5F9DD8[v15]))();
  }
}

void storeEnumTagSinglePayload for Publishers.Scan(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 >= a3)
  {
    v11 = 0u;
    if (a2 <= v7)
      goto LABEL_19;
  }
  else
  {
    if (((*(_DWORD *)(v6 + 64) + 7 + ((*(_DWORD *)(v5 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v9 = a3 - v7 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_19:
      __asm { BR              X0 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7 + ((*(_DWORD *)(v5 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7 + ((*(_QWORD *)(v5 + 64) + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_18B5CB874()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5CB904);
}

void sub_18B5CB87C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5CB884);
  JUMPOUT(0x18B5CB904);
}

void sub_18B5CB8C8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5CB904);
}

void sub_18B5CB8D0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5CB904);
}

uint64_t sub_18B5CB8D8(uint64_t a1, int a2, int a3)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_WORD *)(v12 + v13) = 0;
  if (!a2)
    JUMPOUT(0x18B5CB904);
  if (v6 == v9)
  {
    v3 = *(uint64_t (**)(uint64_t))(v10 + 56);
    v4 = v12;
  }
  else
  {
    v4 = (v11 + v12) & v7;
    if (a3 != v9)
      JUMPOUT(0x18B5CB8E4);
    v3 = *(uint64_t (**)(uint64_t))(v8 + 56);
  }
  return v3(v4);
}

uint64_t type metadata completion function for Publishers.TryScan.Inner()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_18B5CB9D8()
{
  uint64_t v0;

  if (*(unsigned __int8 *)(v0 + 56) <= 1u)
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

void ImmediateScheduler.SchedulerTimeType.distance(to:)(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

Combine::ImmediateScheduler::SchedulerTimeType::Stride __swiftcall ImmediateScheduler.SchedulerTimeType.Stride.init(integerLiteral:)(Combine::ImmediateScheduler::SchedulerTimeType::Stride integerLiteral)
{
  Combine::ImmediateScheduler::SchedulerTimeType::Stride *v1;

  v1->magnitude = integerLiteral.magnitude;
  return integerLiteral;
}

uint64_t ImmediateScheduler.SchedulerTimeType.Stride.magnitude.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ImmediateScheduler.SchedulerTimeType.Stride.magnitude.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ImmediateScheduler.SchedulerTimeType.Stride.magnitude.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

Combine::ImmediateScheduler::SchedulerTimeType::Stride __swiftcall ImmediateScheduler.SchedulerTimeType.Stride.init(floatLiteral:)(Swift::Double floatLiteral)
{
  _QWORD *v1;
  Combine::ImmediateScheduler::SchedulerTimeType::Stride result;

  if ((~*(_QWORD *)&floatLiteral & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (floatLiteral <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (floatLiteral < 9.22337204e18)
  {
    *v1 = (uint64_t)floatLiteral;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t ImmediateScheduler.SchedulerTimeType.Stride.init<A>(exactly:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  _BOOL4 v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  char *v45;
  char v46;
  char *v47;
  char v48;
  uint64_t v49;
  char *v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t AssociatedConformanceWitness;
  char *v58;
  char v59;
  char *v60;
  int64_t v61;
  uint64_t v62;
  uint64_t result;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;

  v72 = a4;
  v67 = *(_QWORD *)(*(_QWORD *)(a3 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v9 = (char *)&v64 - v8;
  v10 = MEMORY[0x1E0C80A78](v7);
  v65 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v64 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v70 = (char *)&v64 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v69 = (char *)&v64 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v68 = (char *)&v64 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v64 - v22;
  v24 = MEMORY[0x1E0C80A78](v21);
  v26 = (char *)&v64 - v25;
  MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v64 - v27;
  v73 = v29;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v71 = a1;
  v30((char *)&v64 - v27, a1, a2);
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v30(v26, (uint64_t)v28, a2);
  v66 = v14;
  v31 = (a1 & 1) != 0 && dispatch thunk of BinaryInteger.bitWidth.getter() > 64;
  v32 = *(void (**)(char *, uint64_t))(v73 + 8);
  v32(v26, a2);
  v30(v23, (uint64_t)v28, a2);
  if (!v31)
  {
    v32(v23, a2);
    v34 = v70;
    goto LABEL_10;
  }
  v75 = 0x8000000000000000;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    v33 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v34 = v70;
    if (v33 >= 64)
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v35 = v68;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v36 = dispatch thunk of static Comparable.< infix(_:_:)();
      v32(v35, a2);
      v32(v23, a2);
      if ((v36 & 1) != 0)
        goto LABEL_36;
      goto LABEL_10;
    }
LABEL_28:
    v54 = dispatch thunk of BinaryInteger._lowWord.getter();
    v32(v23, a2);
    if (v54 < v75)
      goto LABEL_36;
    goto LABEL_10;
  }
  v48 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v49 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v48 & 1) == 0)
  {
    v34 = v70;
    if (v49 >= 64)
    {
      v32(v23, a2);
      goto LABEL_10;
    }
    goto LABEL_28;
  }
  if (v49 <= 64)
  {
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x18D77A864](&unk_18B5FA4F0, 256, AssociatedTypeWitness, AssociatedConformanceWitness);
    v58 = v68;
    MEMORY[0x18D77A804](v9, a2, v67);
    v59 = dispatch thunk of static Comparable.< infix(_:_:)();
    v32(v58, a2);
    v60 = v65;
    (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v65, v23, a2);
    if ((v59 & 1) != 0)
    {
      v32(v60, a2);
    }
    else
    {
      v61 = v75;
      v62 = dispatch thunk of BinaryInteger._lowWord.getter();
      v32(v60, a2);
      v34 = v70;
      if (v62 >= v61)
        goto LABEL_10;
    }
LABEL_36:
    v52 = 0;
    v53 = 1;
    v40 = v71;
    v39 = v72;
    goto LABEL_37;
  }
  lazy protocol witness table accessor for type Int and conformance Int();
  v50 = v68;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  v51 = dispatch thunk of static Comparable.< infix(_:_:)();
  v32(v50, a2);
  v32(v23, a2);
  v34 = v70;
  if ((v51 & 1) != 0)
    goto LABEL_36;
LABEL_10:
  v37 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v38 = v69;
  v30(v69, (uint64_t)v28, a2);
  if (v37 < 65)
  {
    v41 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v32(v38, a2);
    if (v41 != 64)
    {
      v30(v34, (uint64_t)v28, a2);
      v40 = v71;
      v39 = v72;
      goto LABEL_24;
    }
    v42 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v30(v34, (uint64_t)v28, a2);
    v40 = v71;
    v39 = v72;
    if ((v42 & 1) != 0)
    {
LABEL_24:
      v32(v34, a2);
      goto LABEL_25;
    }
  }
  else
  {
    v32(v38, a2);
    v30(v34, (uint64_t)v28, a2);
    v40 = v71;
    v39 = v72;
  }
  v75 = 0x7FFFFFFFFFFFFFFFLL;
  v43 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v44 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v43 & 1) != 0)
  {
    if (v44 > 64)
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v45 = v68;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      v46 = dispatch thunk of static Comparable.< infix(_:_:)();
      v32(v45, a2);
      v47 = v34;
      goto LABEL_31;
    }
    goto LABEL_22;
  }
  if (v44 <= 63)
  {
LABEL_22:
    dispatch thunk of BinaryInteger._lowWord.getter();
    goto LABEL_24;
  }
  v74 = 0x7FFFFFFFFFFFFFFFLL;
  v55 = v68;
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v68, v34, a2);
  lazy protocol witness table accessor for type Int and conformance Int();
  v56 = v66;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  v46 = dispatch thunk of static Comparable.< infix(_:_:)();
  v32(v56, a2);
  v47 = v55;
LABEL_31:
  v32(v47, a2);
  if ((v46 & 1) != 0)
  {
    v52 = 0;
    v53 = 1;
    goto LABEL_37;
  }
LABEL_25:
  v52 = dispatch thunk of BinaryInteger._lowWord.getter();
  v53 = 0;
LABEL_37:
  v32(v28, a2);
  result = ((uint64_t (*)(uint64_t, uint64_t))v32)(v40, a2);
  *(_QWORD *)v39 = v52;
  *(_BYTE *)(v39 + 8) = v53;
  return result;
}

BOOL static ImmediateScheduler.SchedulerTimeType.Stride.< infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

uint64_t *static ImmediateScheduler.SchedulerTimeType.Stride.* infix(_:_:)@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  v3 = *result * *a2;
  if ((unsigned __int128)(*result * (__int128)*a2) >> 64 == v3 >> 63)
    *a3 = v3;
  else
    __break(1u);
  return result;
}

_QWORD *static ImmediateScheduler.SchedulerTimeType.Stride.+ infix(_:_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

_QWORD *static ImmediateScheduler.SchedulerTimeType.Stride.- infix(_:_:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *a3 = *result - *a2;
  return result;
}

_QWORD *static ImmediateScheduler.SchedulerTimeType.Stride.-= infix(_:_:)(_QWORD *result, _QWORD *a2)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *result -= *a2;
  return result;
}

uint64_t *static ImmediateScheduler.SchedulerTimeType.Stride.*= infix(_:_:)(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *result * *a2;
  if ((unsigned __int128)(*result * (__int128)*a2) >> 64 == v2 >> 63)
    *result = v2;
  else
    __break(1u);
  return result;
}

_QWORD *static ImmediateScheduler.SchedulerTimeType.Stride.+= infix(_:_:)(_QWORD *result, _QWORD *a2)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *result += *a2;
  return result;
}

void static ImmediateScheduler.SchedulerTimeType.Stride.seconds(_:)(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ImmediateScheduler.SchedulerTimeType.Stride.nanoseconds(_:)(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL static ImmediateScheduler.SchedulerTimeType.Stride.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys()
{
  return 0x647574696E67616DLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys()
{
  lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys()
{
  lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t ImmediateScheduler.SchedulerTimeType.Stride.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys, &unk_1E216E5A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys, &unk_1E216E5A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys, &unk_1E216E5A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys, &unk_1E216E5A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

uint64_t ImmediateScheduler.SchedulerTimeType.Stride.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    v9 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

double *protocol witness for ExpressibleByFloatLiteral.init(floatLiteral:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(double *result@<X0>, _QWORD *a2@<X8>)
{
  double v2;

  v2 = *result;
  if ((~*(_QWORD *)result & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 9.22337204e18)
  {
    *a2 = (uint64_t)v2;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

_QWORD *protocol witness for static SignedNumeric.- prefix(_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(0, *result))
    __break(1u);
  else
    *a2 = -*result;
  return result;
}

void protocol witness for SignedNumeric.negate() in conformance ImmediateScheduler.SchedulerTimeType.Stride()
{
  _QWORD *v0;

  if (__OFSUB__(0, *v0))
    __break(1u);
  else
    *v0 = -*v0;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ImmediateScheduler.SchedulerTimeType.Stride.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys>);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys and conformance ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t *protocol witness for static Numeric.* infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  v3 = *result * *a2;
  if ((unsigned __int128)(*result * (__int128)*a2) >> 64 == v3 >> 63)
    *a3 = v3;
  else
    __break(1u);
  return result;
}

uint64_t *protocol witness for static Numeric.*= infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *result * *a2;
  if ((unsigned __int128)(*result * (__int128)*a2) >> 64 == v2 >> 63)
    *result = v2;
  else
    __break(1u);
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *result, _QWORD *a2)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *result += *a2;
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *a3 = *result - *a2;
  return result;
}

_QWORD *protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance ImmediateScheduler.SchedulerTimeType.Stride(_QWORD *result, _QWORD *a2)
{
  if (__OFSUB__(*result, *a2))
    __break(1u);
  else
    *result -= *a2;
  return result;
}

_QWORD *protocol witness for ExpressibleByIntegerLiteral.init(integerLiteral:) in conformance ImmediateScheduler.SchedulerTimeType.Stride@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ImmediateScheduler.schedule(options:_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void ImmediateScheduler.minimumTolerance.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t ImmediateScheduler.schedule(after:tolerance:options:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t ImmediateScheduler.schedule(after:interval:tolerance:options:_:)@<X0>(void (*a1)(void)@<X4>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *boxed_opaque_existential_1;

  a1();
  if (one-time initialization token for singleton != -1)
    swift_once();
  v3 = qword_1ECECCD60;
  v4 = unk_1ECECCD68;
  v5 = __swift_project_boxed_opaque_existential_1(&static Subscriptions._EmptySubscription.singleton, qword_1ECECCD60);
  a2[3] = v3;
  a2[4] = *(_QWORD *)(v4 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2);
  return (*(uint64_t (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v5, v3);
}

uint64_t associated type witness table accessor for ExpressibleByFloatLiteral.FloatLiteralType : _ExpressibleByBuiltinFloatLiteral in ImmediateScheduler.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB0F0];
}

unint64_t lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride, &type metadata for ImmediateScheduler.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride, &type metadata for ImmediateScheduler.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride, &type metadata for ImmediateScheduler.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride, &type metadata for ImmediateScheduler.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride, &type metadata for ImmediateScheduler.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType.Stride, &type metadata for ImmediateScheduler.SchedulerTimeType.Stride);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType.Stride and conformance ImmediateScheduler.SchedulerTimeType.Stride);
  }
  return result;
}

uint64_t associated type witness table accessor for Numeric.Magnitude : Comparable in ImmediateScheduler.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB430];
}

uint64_t associated type witness table accessor for Numeric.Magnitude : Numeric in ImmediateScheduler.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB450];
}

uint64_t associated type witness table accessor for ExpressibleByIntegerLiteral.IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral in ImmediateScheduler.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E0DEB488];
}

unint64_t lazy protocol witness table accessor for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType, &type metadata for ImmediateScheduler.SchedulerTimeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType, &type metadata for ImmediateScheduler.SchedulerTimeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ImmediateScheduler.SchedulerTimeType, &type metadata for ImmediateScheduler.SchedulerTimeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ImmediateScheduler.SchedulerTimeType and conformance ImmediateScheduler.SchedulerTimeType);
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for Scheduler.SchedulerTimeType.Strideable.Stride : SchedulerTimeIntervalConvertible in ImmediateScheduler()
{
  return &protocol witness table for ImmediateScheduler.SchedulerTimeType.Stride;
}

uint64_t protocol witness for Scheduler.schedule(after:tolerance:options:_:) in conformance ImmediateScheduler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t protocol witness for Scheduler.schedule(after:interval:tolerance:options:_:) in conformance ImmediateScheduler@<X0>(void (*a1)(void)@<X4>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *boxed_opaque_existential_1;

  a1();
  if (one-time initialization token for singleton != -1)
    swift_once();
  v3 = qword_1ECECCD60;
  v4 = unk_1ECECCD68;
  v5 = __swift_project_boxed_opaque_existential_1(&static Subscriptions._EmptySubscription.singleton, qword_1ECECCD60);
  a2[3] = v3;
  a2[4] = *(_QWORD *)(v4 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2);
  return (*(uint64_t (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v5, v3);
}

ValueMetadata *type metadata accessor for ImmediateScheduler()
{
  return &type metadata for ImmediateScheduler;
}

ValueMetadata *type metadata accessor for ImmediateScheduler.SchedulerTimeType()
{
  return &type metadata for ImmediateScheduler.SchedulerTimeType;
}

ValueMetadata *type metadata accessor for ImmediateScheduler.SchedulerTimeType.Stride()
{
  return &type metadata for ImmediateScheduler.SchedulerTimeType.Stride;
}

uint64_t storeEnumTagSinglePayload for ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_18B5CCD58 + 4 * byte_18B5FA070[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_18B5CCD78 + 4 * byte_18B5FA075[v4]))();
}

_BYTE *sub_18B5CCD58(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_18B5CCD78(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18B5CCD80(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18B5CCD88(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18B5CCD90(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18B5CCD98(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for ImmediateScheduler.SchedulerTimeType.Stride.CodingKeys()
{
  return &unk_1E216E5A0;
}

uint64_t Publisher.count()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t Publishers.Count.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t Publishers.Count.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

void Publishers.Count.receive<A>(subscriber:)()
{
  type metadata accessor for Publishers.Count.Inner();
}

uint64_t sub_18B5CCF88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t *v7;

  swift_allocObject();
  v7 = specialized Publishers.Count.Inner.init(downstream:initial:reduce:)(v1, 0, 0);
  v5 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ReduceProducer<A, B, C, D, E>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v7, v2, a1, v3, v5);
  return swift_release();
}

void type metadata accessor for Publishers.Count.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.Count.Inner.description.getter()
{
  return 0x746E756F43;
}

uint64_t Publishers.Count.Inner.receive(newValue:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t result;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  v1 = (_QWORD *)(v0 + 16);
  result = swift_beginAccess();
  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    if (!__OFADD__(*v1, 1))
    {
      *(_QWORD *)(v0 + 16) = *v1 + 1;
      *(_BYTE *)(v0 + 24) = 0;
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      type metadata accessor for PartialCompletion(0, MEMORY[0x1E0DEE9C0] + 8, AssociatedTypeWitness, AssociatedConformanceWitness);
      return swift_storeEnumTagMultiPayload();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Count<A>()
{
  Publishers.Count.receive<A>(subscriber:)();
}

uint64_t static Publishers.Count<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Count<A>()
{
  return static Publishers.Count<>.== infix(_:_:)();
}

uint64_t *specialized Publishers.Count.Inner.init(downstream:initial:reduce:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;

  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v6);
  v10 = a2;
  v11 = a3 & 1;
  return ReduceProducer.init(downstream:initial:reduce:)((uint64_t)v6, (uint64_t)&v10, v8);
}

uint64_t getEnumTagSinglePayload for Publishers.Count(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
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
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
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
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5CD294 + 4 * byte_18B5FA4F8[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.Count(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for Publishers.Count(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Count);
}

uint64_t Publisher.last(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.LastWhere, a5);
}

uint64_t Publishers.LastWhere.init(upstream:predicate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.LastWhere, a6);
}

uint64_t type metadata accessor for Publishers.LastWhere(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.LastWhere);
}

uint64_t Publisher.tryLast(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.TryLastWhere, a5);
}

uint64_t Publishers.TryLastWhere.init(upstream:predicate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.TryLastWhere, a6);
}

uint64_t type metadata accessor for Publishers.TryLastWhere(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.TryLastWhere);
}

uint64_t Publishers.LastWhere.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.LastWhere.Inner, (uint64_t)&unk_1E2175F00, (uint64_t)_s6Output7Combine9PublisherPQzSbIegnd_AESbIegnr_AbCRzAB10SubscriberRd__7FailureQyd__AGRtzSb5InputRtd__r__lTRTA_0);
}

void type metadata accessor for Publishers.LastWhere.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.LastWhere.Inner.description.getter()
{
  return 0x726568577473614CLL;
}

uint64_t Publishers.LastWhere.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t AssociatedConformanceWitness;
  uint64_t v19;
  uint64_t v20[3];

  v3 = v2;
  v19 = a2;
  v5 = *v2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v20[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v20[-1] - v12;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))((char *)v3 + *(_QWORD *)(v5 + 152)))(v20, a1);
  if (LOBYTE(v20[0]) == 1)
  {
    v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, a1, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v13, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v13, v7);
    v15 = (char *)v3 + *(_QWORD *)(*v3 + 136);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v15, v11, v7);
    swift_endAccess();
  }
  v16 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for PartialCompletion(0, MEMORY[0x1E0DEE9C0] + 8, v16, AssociatedConformanceWitness);
  return swift_storeEnumTagMultiPayload();
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.LastWhere<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t Publishers.TryLastWhere.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.TryLastWhere.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.TryLastWhere.Inner, (uint64_t)&unk_1E2175ED8, (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error));
}

uint64_t Publishers.TryLastWhere.Inner.description.getter()
{
  return 0x577473614C797254;
}

uint64_t Publishers.TryLastWhere.Inner.receive(newValue:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  _QWORD v16[4];

  v2 = v1;
  v4 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v16 - v11;
  (*(void (**)(_QWORD *__return_ptr, uint64_t))((char *)v2 + *(_QWORD *)(v4 + 152)))(v16, a1);
  if (LOBYTE(v16[0]) == 1)
  {
    v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, a1, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    v14 = (char *)v2 + *(_QWORD *)(*v2 + 136);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v14, v10, v6);
    swift_endAccess();
  }
  return 0;
}

uint64_t vtable thunk for ReduceProducer.receive(newValue:) dispatching to Publishers.TryLastWhere.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = Publishers.TryLastWhere.Inner.receive(newValue:)(a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryLastWhere<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.TryLastWhere.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t *specialized Publishers.TryLastWhere.Inner.init(downstream:initial:reduce:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v27 = a4;
  v28 = a6;
  v25 = a5;
  v26 = a3;
  v24 = a2;
  v8 = *v6;
  v9 = *(_QWORD *)(*v6 + 456);
  v10 = *(_QWORD *)(*v6 + 440);
  swift_getAssociatedTypeWitness();
  v11 = type metadata accessor for Optional();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v23 - v14;
  v16 = *(_QWORD *)(v8 + 448);
  MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v18, a1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v24, v11);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v10;
  v20[3] = v16;
  v20[4] = v9;
  v21 = v26;
  v20[5] = *(_QWORD *)(v8 + 464);
  v20[6] = v21;
  v20[7] = v27;
  v29[0] = v28;
  v29[1] = v20;
  return ReduceProducer.init(downstream:initial:reduce:)((uint64_t)v18, (uint64_t)v15, (uint64_t)v29);
}

void type metadata accessor for Publishers.TryLastWhere.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t getEnumTagSinglePayload for Publishers.LastWhere(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5CDB28 + 4 * byte_18B5FA5A8[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.LastWhere(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5CDCA0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5CDD18);
}

void sub_18B5CDCA8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5CDCB0);
  JUMPOUT(0x18B5CDD18);
}

void sub_18B5CDCF0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5CDD18);
}

void sub_18B5CDCF8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5CDD18);
}

uint64_t sub_18B5CDD00(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x18B5CDD18);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x18B5CDD14);
    JUMPOUT(0x18B5CDD0CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_18B5CDD30()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t Publishers.IgnoreOutput.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t Publishers.IgnoreOutput.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

void Publishers.IgnoreOutput.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
  strcpy((char *)a1, "IgnoreOutput");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.IgnoreOutput<A>.Inner<A1>()
{
  return 0x754F65726F6E6749;
}

uint64_t protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.IgnoreOutput<A>.Inner<A1>@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_QWORD *)(v2 + *(int *)(result + 52));
  return result;
}

uint64_t static Publishers.IgnoreOutput<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.IgnoreOutput<A>()
{
  return static Publishers.IgnoreOutput<>.== infix(_:_:)();
}

uint64_t getEnumTagSinglePayload for Publishers.IgnoreOutput(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
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
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
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
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5CDED4 + 4 * byte_18B5FA698[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.IgnoreOutput(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.IgnoreOutput.Inner(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t assignWithCopy for Publishers.IgnoreOutput.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t initializeWithTake for Publishers.IgnoreOutput.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for Publishers.IgnoreOutput.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.IgnoreOutput.Inner(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_18B5CE308 + 4 * byte_18B5FA6A6[v8]))();
}

void storeEnumTagSinglePayload for Publishers.IgnoreOutput.Inner(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0u;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_18B5CE448()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_18B5CE450(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5CE458);
}

void sub_18B5CE474()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_18B5CE47C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_18B5CE484(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x18B5CE48CLL);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

void (*CurrentValueSubject.value.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  CurrentValueSubject.value.getter((uint64_t)v7);
  return CurrentValueSubject.value.modify;
}

void CurrentValueSubject.value.modify(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void *, uint64_t);

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v4, v5);
    specialized CurrentValueSubject.value.setter((uint64_t)v3);
    v7 = *(void (**)(void *, uint64_t))(v6 + 8);
    v7(v3, v5);
  }
  else
  {
    specialized CurrentValueSubject.value.setter(*(_QWORD *)(*(_QWORD *)a1 + 32));
    v7 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v7(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t CurrentValueSubject.Conduit.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return CurrentValueSubject.Conduit.init(_:_:)(a1, a2);
}

void CurrentValueSubject.send(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 88);
  v8 = *(_QWORD *)(*v4 + 96);
  v9 = type metadata accessor for Subscribers.Completion(255, v7, v8, a4);
  v10 = type metadata accessor for Optional();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v22 - v12;
  v14 = (os_unfair_lock_s *)v4[2];
  os_unfair_lock_lock(v14);
  if (*((_BYTE *)v4 + 24) == 1)
  {
    *((_BYTE *)v4 + 24) = 0;
    v15 = a1;
    v23 = a1;
    v16 = *(_QWORD *)(v9 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v13, v15, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v9);
    v17 = (uint64_t)v4 + *(_QWORD *)(*v4 + 120);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v17, v13, v10);
    swift_endAccess();
    v18 = (uint64_t)v4 + *(_QWORD *)(*v4 + 128);
    swift_beginAccess();
    v19 = *(_QWORD *)v18;
    v20 = *(_BYTE *)(v18 + 8);
    outlined copy of ConduitList<A, Never><A>(*(_QWORD *)v18, v20);
    type metadata accessor for ConduitList(0, *(_QWORD *)(v6 + 80), v7, v8);
    ConduitList.removeAll()();
    os_unfair_lock_unlock(v14);
    MEMORY[0x1E0C80A78](v21);
    *(&v22 - 2) = v23;
    ConduitList.forEach(_:)((uint64_t)partial apply for closure #1 in PassthroughSubject.send(completion:), (uint64_t)(&v22 - 4), v19, v20);
    outlined consume of ConduitList<A, Never><A>(v19, v20);
  }
  else
  {
    os_unfair_lock_unlock(v14);
  }
}

uint64_t CurrentValueSubject.Conduit.init(_:_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  v18 = a2;
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 176);
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - v8;
  v2[2] = 0;
  v10 = (char *)v2 + *(_QWORD *)(v4 + 200);
  v11 = *(_QWORD *)(v5 - 8);
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v12(v10, 1, 1, v5);
  *(_QWORD *)((char *)v2 + *(_QWORD *)(*v2 + 208)) = 0;
  v13 = *(_QWORD *)(*v2 + 216);
  swift_retain();
  v14 = (_DWORD *)swift_slowAlloc();
  *v14 = 0;
  *(_QWORD *)((char *)v2 + v13) = v14;
  v15 = *(_QWORD *)(*v2 + 224);
  v16 = (_QWORD *)swift_slowAlloc();
  *v16 = 0;
  *(_QWORD *)((char *)v2 + v15) = v16;
  *((_BYTE *)v2 + *(_QWORD *)(*v2 + 232)) = 0;
  v2[2] = a1;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v9, v18, v5);
  v12(v9, 0, 1, v5);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v10, v9, v6);
  swift_endAccess();
  swift_release();
  return ConduitBase.init()();
}

void CurrentValueSubject.Conduit.customMirror.getter(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD *v21;

  v20[1] = a1;
  v2 = (_QWORD *)*v1;
  v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + v2[27]));
  v21 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_18B5F5C60;
  *(_QWORD *)(v9 + 32) = 0x746E65726170;
  *(_QWORD *)(v9 + 40) = 0xE600000000000000;
  v10 = v1[2];
  v11 = v2[20];
  v12 = v2[21];
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for CurrentValueSubject(255, v11, v12, AssociatedConformanceWitness);
  v14 = type metadata accessor for Optional();
  *(_QWORD *)(v9 + 48) = v10;
  *(_QWORD *)(v9 + 72) = v14;
  *(_QWORD *)(v9 + 80) = 0x657274736E776F64;
  *(_QWORD *)(v9 + 88) = 0xEA00000000006D61;
  v15 = (char *)v1 + *(_QWORD *)(*v1 + 200);
  swift_beginAccess();
  v16 = type metadata accessor for Optional();
  *(_QWORD *)(v9 + 120) = v16;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 + 96));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(boxed_opaque_existential_1, v15, v16);
  *(_QWORD *)(v9 + 128) = 0x646E616D6564;
  *(_QWORD *)(v9 + 136) = 0xE600000000000000;
  *(_QWORD *)(v9 + 144) = *(_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 208));
  *(_QWORD *)(v9 + 168) = &type metadata for Subscribers.Demand;
  *(_QWORD *)(v9 + 176) = 0x7463656A627573;
  v18 = v1[2];
  *(_QWORD *)(v9 + 216) = v14;
  *(_QWORD *)(v9 + 184) = 0xE700000000000000;
  *(_QWORD *)(v9 + 192) = v18;
  v19 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  swift_retain();
  swift_retain();
  swift_retain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 216)));
}

void CurrentValueSubject.Conduit.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000018B5FA830;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance CurrentValueSubject<A, B>.Conduit<A1>()
{
  return 0xD000000000000013;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance CurrentValueSubject<A, B>.Conduit<A1>(uint64_t a1@<X8>)
{
  CurrentValueSubject.Conduit.customMirror.getter(a1);
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance CurrentValueSubject<A, B>.Conduit<A1>(_QWORD *a1@<X8>)
{
  CurrentValueSubject.Conduit.playgroundDescription.getter(a1);
}

void sub_18B5CEC84(uint64_t a1@<X8>)
{
  CurrentValueSubject.value.getter(a1);
}

void sub_18B5CECA4(uint64_t a1)
{
  specialized CurrentValueSubject.value.setter(a1);
}

uint64_t sub_18B5CECC4()
{
  return 24;
}

__n128 sub_18B5CECD0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t method lookup function for CurrentValueSubject()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CurrentValueSubject.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t Subscribers.Assign.__allocating_init(object:keyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  Subscribers.Assign.init(object:keyPath:)(a1, a2);
  return v4;
}

uint64_t Subscribers.Assign.object.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 104);
  swift_beginAccess();
  v4 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t Subscribers.Assign.keyPath.getter()
{
  return swift_retain();
}

uint64_t Subscribers.Assign.description.getter()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = v0;
  v2 = *v0;
  v3 = *(_QWORD *)(*v0 + 80);
  v4 = type metadata accessor for Optional();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v21 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)v1 + *(_QWORD *)(v2 + 104);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return 0x6E6769737341;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v8, v3);
    v22 = 0x206E6769737341;
    v23 = 0xE700000000000000;
    swift_getDynamicType();
    v14._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 46;
    v15._object = (void *)0xE100000000000000;
    String.append(_:)(v15);
    v16 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter();
    if (v17)
    {
      v18 = v17;
    }
    else
    {
      v16 = 0;
      v18 = 0xE000000000000000;
    }
    v19 = v18;
    String.append(_:)(*(Swift::String *)&v16);
    swift_bridgeObjectRelease();
    v13 = v22;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v3);
  }
  return v13;
}

uint64_t Subscribers.Assign.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t *v21;

  v20 = a1;
  v2 = *v1;
  v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_18B5F5810;
  *(_QWORD *)(v9 + 32) = 0x7463656A626FLL;
  *(_QWORD *)(v9 + 40) = 0xE600000000000000;
  v10 = (uint64_t)v1 + *(_QWORD *)(v2 + 104);
  swift_beginAccess();
  v11 = type metadata accessor for Optional();
  *(_QWORD *)(v9 + 72) = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, v10, v11);
  *(_QWORD *)(v9 + 80) = 0x6874615079656BLL;
  *(_QWORD *)(v9 + 88) = 0xE700000000000000;
  v13 = *v1;
  v14 = *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 112));
  v15 = type metadata accessor for ReferenceWritableKeyPath();
  *(_QWORD *)(v9 + 96) = v14;
  *(_QWORD *)(v9 + 120) = v15;
  *(_QWORD *)(v9 + 128) = 0x737574617473;
  *(_QWORD *)(v9 + 136) = 0xE600000000000000;
  v16 = (uint64_t)v1 + *(_QWORD *)(v13 + 120);
  swift_beginAccess();
  *(_QWORD *)(v9 + 168) = &type metadata for SubscriptionStatus;
  v17 = swift_allocObject();
  *(_QWORD *)(v9 + 144) = v17;
  outlined init with copy of SubscriptionStatus(v16, v17 + 16);
  v18 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v8, 1, 1, v18);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  swift_retain();
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

uint64_t Subscribers.Assign.playgroundDescription.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Subscribers.Assign.description.getter();
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18B5CF200()
{
  uint64_t v0;

  if (*(unsigned __int8 *)(v0 + 56) <= 1u)
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

_QWORD *Subscribers.Assign.deinit()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  MEMORY[0x18D77ADB0](v0[2], -1, -1);
  v1 = (char *)v0 + *(_QWORD *)(*v0 + 104);
  v2 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(_QWORD *)(*v0 + 120));
  return v0;
}

uint64_t Subscribers.Assign.__deallocating_deinit()
{
  Subscribers.Assign.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall Subscribers.Assign.cancel()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v1 = type metadata accessor for Optional();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v11 - v3;
  v5 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v5);
  v6 = (uint64_t)v0 + *(_QWORD *)(*v0 + 120);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v6, (uint64_t)&v12);
  if (v15)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v12);
    os_unfair_lock_unlock(v5);
  }
  else
  {
    outlined init with take of Subscription((__int128 *)&v12, (uint64_t)v16);
    v12 = 1;
    v13 = 0u;
    v14 = 0u;
    v15 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v12, v6);
    swift_endAccess();
    v7 = (char *)v0 + *(_QWORD *)(*v0 + 104);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v4, (uint64_t)partial apply for closure #1 in Subscribers.Assign.cancel(), (uint64_t)v0, v1, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDD18], v8);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v9 = v17;
    v10 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 8))(v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
}

void closure #1 in Subscribers.Assign.receive(completion:)(os_unfair_lock_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v2 = *(_QWORD *)&(*a1)[20]._os_unfair_lock_opaque;
  v3 = type metadata accessor for Optional();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - v5;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))((char *)&v8 - v5, 1, 1, v2);
  v7 = (char *)a1 + *(_QWORD *)&(*a1)[26]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 40))(v7, v6, v3);
  swift_endAccess();
  os_unfair_lock_unlock(a1[2]);
}

void protocol witness for Subscriber.receive(completion:) in conformance Subscribers.Assign<A, B>()
{
  specialized Subscribers.Assign.receive(completion:)();
}

void protocol witness for Cancellable.cancel() in conformance Subscribers.Assign<A, B>()
{
  Subscribers.Assign.cancel()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Subscribers.Assign<A, B>()
{
  return Subscribers.Assign.description.getter();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Subscribers.Assign<A, B>@<X0>(uint64_t a1@<X8>)
{
  return Subscribers.Assign.customMirror.getter(a1);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Subscribers.Assign<A, B>@<X0>(uint64_t *a1@<X8>)
{
  return Subscribers.Assign.playgroundDescription.getter(a1);
}

void specialized Subscribers.Assign.receive(completion:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  int v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  unsigned __int8 v14;

  v1 = type metadata accessor for Optional();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v10 - v3;
  v5 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v5);
  v6 = (uint64_t)v0 + *(_QWORD *)(*v0 + 120);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v6, (uint64_t)&v11);
  v7 = v14;
  outlined destroy of SubscriptionStatus((uint64_t)&v11);
  if (v7)
  {
    os_unfair_lock_unlock(v5);
  }
  else
  {
    v11 = 1;
    v12 = 0u;
    v13 = 0u;
    v14 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v11, v6);
    swift_endAccess();
    v8 = (char *)v0 + *(_QWORD *)(*v0 + 104);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v8, v1);
    _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v4, (uint64_t)partial apply for closure #1 in Subscribers.Assign.cancel(), (uint64_t)v0, v1, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDD18], v9);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

void partial apply for closure #1 in Subscribers.Assign.cancel()()
{
  os_unfair_lock_t *v0;

  closure #1 in Subscribers.Assign.receive(completion:)(v0);
}

uint64_t method lookup function for Subscribers.Assign()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Subscribers.Assign.__allocating_init(object:keyPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t Scheduler.schedule(after:interval:tolerance:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a5;
  v19 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = type metadata accessor for Optional();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v18 - v15;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))((char *)&v18 - v15, 1, 1, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 72))(a1, a2, a3, v16, v19, v20, a6, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t Scheduler.schedule(after:interval:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;

  v17 = a4;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v14 = (char *)&v16 - v13;
  (*(void (**)(uint64_t, uint64_t))(a6 + 48))(a5, a6);
  Scheduler.schedule(after:interval:tolerance:_:)(a1, a2, (uint64_t)v14, a3, v17, a5, a6);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
}

uint64_t dispatch thunk of static SchedulerTimeIntervalConvertible.seconds(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static SchedulerTimeIntervalConvertible.milliseconds(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static SchedulerTimeIntervalConvertible.microseconds(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of static SchedulerTimeIntervalConvertible.nanoseconds(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Scheduler.now.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Scheduler.minimumTolerance.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Scheduler.schedule(options:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of Scheduler.schedule(after:tolerance:options:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 64))();
}

uint64_t dispatch thunk of Scheduler.schedule(after:interval:tolerance:options:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 72))();
}

uint64_t Publishers.SwitchToLatest.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

void Publisher<>.switchToLatest()()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Publishers.SetFailureType();
}

{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for Publishers.SetFailureType();
}

uint64_t sub_18B5CFB04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE v7[96];

  v3 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v5 = &v7[-v4];
  Publisher<>.setFailureType<A>(to:)(v1, (uint64_t)&v7[-v4]);
  MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.SetFailureType<A, B>, a1);
  ((void (*)(uint64_t))Publisher<>.switchToLatest())(a1);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, a1);
}

uint64_t sub_18B5CFC40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v11;

  v5 = type metadata accessor for Publishers.Map(0, v2, a1, v1);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - v7;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v2;
  v9[3] = v1;
  v9[4] = v3;
  Publisher.map<A>(_:)((uint64_t)partial apply for closure #1 in Publisher<>.switchToLatest(), (uint64_t)v9, v2, a1, v1, (uint64_t)v8);
  swift_release();
  MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.Map<A, B>, v5);
  MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.SetFailureType<A, B>, a1);
  ((void (*)(uint64_t))Publisher<>.switchToLatest())(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t closure #1 in Publisher<>.switchToLatest()@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return Publisher<>.setFailureType<A>(to:)(AssociatedTypeWitness, a1);
}

uint64_t sub_18B5CFDF4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher<>.switchToLatest()@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in Publisher<>.switchToLatest()(a1);
}

uint64_t Publishers.SwitchToLatest.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t *Publishers.SwitchToLatest.Outer.__allocating_init(downstream:)(uint64_t a1)
{
  swift_allocObject();
  return Publishers.SwitchToLatest.Outer.init(downstream:)(a1);
}

void Publishers.SwitchToLatest.Outer.Side.customMirror.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_18B5F41E0;
  *(_QWORD *)(v2 + 32) = 0xD000000000000012;
  *(_QWORD *)(v2 + 40) = 0x800000018B5FECA0;
  *(_QWORD *)(v2 + 72) = &type metadata for CombineIdentifier;
  type metadata accessor for Publishers.SwitchToLatest.Outer();
}

uint64_t sub_18B5CFF70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(v0);
  v3 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v1);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.SwitchToLatest.Outer.Side.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
  strcpy((char *)a1, "SwitchToLatest");
  *(_BYTE *)(a1 + 15) = -18;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.SwitchToLatest<A, B>.Outer<A1>.Side()
{
  return 0x6F54686374697753;
}

uint64_t Publishers.SwitchToLatest.Outer.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  _BYTE v14[40];

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 168);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + v1));
  *(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 184)) = 1;
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 144);
  swift_beginAccess();
  outlined init with copy of Subscription?(v2, (uint64_t)v14);
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)v12, v2);
  swift_endAccess();
  v3 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 136);
  swift_beginAccess();
  outlined init with copy of Subscription?(v3, (uint64_t)v12);
  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v9, v3);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
  outlined init with copy of Subscription?((uint64_t)v14, (uint64_t)&v9);
  v4 = *((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v5 = v11;
    __swift_project_boxed_opaque_existential_1(&v9, *((uint64_t *)&v10 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 8))(v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)&v9);
  }
  outlined init with copy of Subscription?((uint64_t)v12, (uint64_t)&v9);
  v6 = *((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v7 = v11;
    __swift_project_boxed_opaque_existential_1(&v9, *((uint64_t *)&v10 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v6);
    outlined destroy of Subscription?((uint64_t)v12);
    outlined destroy of Subscription?((uint64_t)v14);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)v12);
    outlined destroy of Subscription?((uint64_t)v14);
    return outlined destroy of Subscription?((uint64_t)&v9);
  }
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.SwitchToLatest<A, B>.Outer<A1>(uint64_t a1@<X8>)
{
  Publishers.SwitchToLatest.Outer.Side.playgroundDescription.getter(a1);
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.SwitchToLatest<A, B>.Outer<A1>()
{
  return Publishers.SwitchToLatest.Outer.cancel()();
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.SwitchToLatest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t assignWithCopy for Publishers.SwitchToLatest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 24))();
  return a1;
}

uint64_t initializeWithTake for Publishers.SwitchToLatest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 32))();
  return a1;
}

uint64_t assignWithTake for Publishers.SwitchToLatest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 40))();
  return a1;
}

uint64_t Publishers.Retry.init(upstream:retries:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(a6, a1, a4);
  result = type metadata accessor for Publishers.Retry(0, a4, a5, v11);
  v13 = a6 + *(int *)(result + 36);
  *(_QWORD *)v13 = a2;
  *(_BYTE *)(v13 + 8) = a3 & 1;
  return result;
}

uint64_t Publishers.Retry.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Retry.retries.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

_QWORD *Publishers.Retry.Inner.__allocating_init(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v7;

  v7 = a4 & 1;
  swift_allocObject();
  return Publishers.Retry.Inner.init(_:_:_:)(a1, a2, a3, v7);
}

void Publishers.Retry.Inner.cancel()()
{
  type metadata accessor for Publishers.Retry.Inner.State();
}

void sub_18B5D04B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  os_unfair_lock_s *v10;
  char *v11;
  uint64_t v12;
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  os_unfair_lock_s *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[96];

  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v3 - 280) = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v9 = &v21[-v8];
  v10 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v10);
  v11 = (char *)v1 + *(_QWORD *)(*v1 + 120);
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v5 + 16))(v9, v11, a1);
  v12 = *(_QWORD *)(v3 - 272);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v14 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v14 + 48))(v9, 1, TupleTypeMetadata2) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v9, a1);
    v15 = v10;
  }
  else
  {
    *(_QWORD *)(v3 - 272) = v10;
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(&v9[*(int *)(TupleTypeMetadata2 + 48)], v12);
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v9, v2);
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    v17 = *(_QWORD *)(v3 - 280);
    v16(v17, 1, 1, TupleTypeMetadata2);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 40))(v11, v17, a1);
    swift_endAccess();
    v18 = (uint64_t)v1 + *(_QWORD *)(*v1 + 128);
    swift_beginAccess();
    outlined init with copy of Subscription?(v18, v3 - 224);
    if (*(_QWORD *)(v3 - 200))
    {
      outlined init with take of Subscription((__int128 *)(v3 - 224), v3 - 152);
      *(_QWORD *)(v3 - 192) = 0;
      *(_OWORD *)(v3 - 224) = 0u;
      *(_OWORD *)(v3 - 208) = 0u;
      swift_beginAccess();
      outlined assign with take of Subscription?(v3 - 224, v18);
      swift_endAccess();
      os_unfair_lock_unlock(*(os_unfair_lock_t *)(v3 - 272));
      v19 = *(_QWORD *)(v3 - 128);
      v20 = *(_QWORD *)(v3 - 120);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 - 152), v19);
      (*(void (**)(uint64_t))(*(_QWORD *)(v20 + 8) + 8))(v19);
      __swift_destroy_boxed_opaque_existential_1(v3 - 152);
      return;
    }
    outlined destroy of Subscription?(v3 - 224);
    v15 = *(os_unfair_lock_s **)(v3 - 272);
  }
  os_unfair_lock_unlock(v15);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Retry<A>.Inner<A1>()
{
  Publishers.Retry.Inner.cancel()();
}

uint64_t static Publishers.Retry<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;

  v6 = type metadata accessor for Publishers.Retry(0, a3, a4, a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v24 - v11;
  v13 = dispatch thunk of static Equatable.== infix(_:_:)();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, a1, v6);
  v14(v10, a2, v6);
  if ((v13 & 1) != 0)
  {
    v15 = &v12[*(int *)(v6 + 36)];
    v16 = *(_QWORD *)v15;
    v17 = v15[8];
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v12, v6);
    v19 = &v10[*(int *)(v6 + 36)];
    v20 = *(_QWORD *)v19;
    v21 = v19[8];
    v18(v10, v6);
    if ((v17 & 1) == 0)
      return (v16 == v20) & ~(_DWORD)v21;
  }
  else
  {
    v22 = *(void (**)(char *, uint64_t))(v7 + 8);
    v22(v10, v6);
    v22(v12, v6);
    return 0;
  }
  return v21;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Retry<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Publishers.Retry<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Retry(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = *(_BYTE *)(v10 + 8);
    v12 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v12 = *(_QWORD *)v10;
    *(_BYTE *)(v12 + 8) = v11;
  }
  return v4;
}

uint64_t assignWithCopy for Publishers.Retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = v9;
  return a1;
}

uint64_t initializeWithTake for Publishers.Retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = v9;
  return a1;
}

uint64_t assignWithTake for Publishers.Retry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v7 = *(_QWORD *)v8;
  *(_BYTE *)(v7 + 8) = v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Retry(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  v6 = ((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 9;
  v7 = (a2 - v5 + 255) >> (8 * v6);
  if (v6 < 4)
    v8 = v7 + 1;
  else
    v8 = 2;
  if (v8 >= 0x10000)
    v9 = 4;
  else
    v9 = 2;
  if (v8 < 0x100)
    v9 = 1;
  if (v8 >= 2)
    v10 = v9;
  else
    v10 = 0;
  return ((uint64_t (*)(void))((char *)&loc_18B5D0AF0 + 4 * byte_18B5FAD10[v10]))();
}

void storeEnumTagSinglePayload for Publishers.Retry(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 9;
  if (v7 >= a3)
  {
    v12 = 0u;
    if (v7 >= a2)
      goto LABEL_14;
  }
  else
  {
    v9 = (a3 - v7 + 255) >> (8 * v8);
    if (v8 <= 3)
      v10 = v9 + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    if (v7 >= a2)
LABEL_14:
      __asm { BR              X11 }
  }
  if (v8 >= 4)
    v13 = ~v7 + a2;
  else
    v13 = (~(_BYTE)v7 + a2);
  bzero(a1, v8);
  if ((_DWORD)v8 == 1)
    *a1 = v13;
  else
    *(_DWORD *)a1 = v13;
  __asm { BR              X10 }
}

void sub_18B5D0C68()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_18B5D0C70(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5D0C78);
}

void sub_18B5D0C94()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_18B5D0C9C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_18B5D0CA4(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x18B5D0CACLL);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t getEnumTagSinglePayload for Publishers.Retry.Chances(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Publishers.Retry.Chances(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t getEnumTag for Publishers.Retry.Chances(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t destructiveInjectEnumTag for Publishers.Retry.Chances(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

uint64_t type metadata accessor for Publishers.Retry.Chances(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Retry.Chances);
}

_QWORD *initializeBufferWithCopyOfBuffer for Publishers.Retry.Inner.State(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  size_t v15;
  uint64_t v16;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v24;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_DWORD *)(v8 + 80);
  v11 = *(_QWORD *)(v7 + 64) + v10;
  v12 = (v11 & ~v10) + *(_QWORD *)(v8 + 64);
  v13 = *(unsigned int *)(v7 + 84);
  v14 = v9 | v13;
  if (v9 | v13)
    v15 = (v11 & ~v10) + *(_QWORD *)(v8 + 64);
  else
    v15 = v12 + 1;
  v16 = (*(_BYTE *)(v7 + 80) | *(_BYTE *)(v8 + 80));
  if (v16 > 7 || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v15 > 0x18)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v19 + ((v16 + 16) & ~v16));
    swift_retain();
    return a1;
  }
  v20 = ~v10;
  v24 = v20;
  if (!v14)
  {
    if (!*((_BYTE *)a2 + v12))
      goto LABEL_28;
    v21 = (*((unsigned __int8 *)a2 + v12) - 1) << (8 * v12);
    if (v12 > 3)
      v21 = 0;
    if ((_DWORD)v12)
    {
      if (v12 <= 3)
        v22 = v12;
      else
        v22 = 4;
      __asm { BR              X11 }
    }
    if (v21 == -1)
      goto LABEL_28;
    goto LABEL_26;
  }
  if (v13 >= v9)
  {
    if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, v13, v6))
      goto LABEL_28;
LABEL_26:
    memcpy(a1, a2, v15);
    return a1;
  }
  if ((*(unsigned int (**)(unint64_t))(v8 + 48))(((unint64_t)a2 + v11) & v20))
    goto LABEL_26;
LABEL_28:
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v11) & v24, ((unint64_t)a2 + v11) & v24, v5);
  if (!v14)
    *((_BYTE *)a1 + v12) = 0;
  return a1;
}

_BYTE *assignWithCopy for Publishers.Retry.Inner.State(_BYTE *a1, unsigned __int8 *a2, uint64_t a3)
{
  const void *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  int v15;
  unint64_t v16;
  size_t v17;
  int v18;
  uint64_t v19;
  uint64_t (*v21)(unint64_t, uint64_t, uint64_t);
  uint64_t v22;
  int v23;
  int v24;
  char v25;
  int v26;
  int v27;
  uint64_t (*v29)(unsigned __int8 *, uint64_t, uint64_t);
  int v30;
  int v31;
  int v32;
  size_t v33;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = a2;
  v4 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = ~v11;
  v13 = *(_QWORD *)(v7 + 64) + v11;
  v14 = (v13 & ~v11) + *(_QWORD *)(v9 + 64);
  v15 = v10 | v8;
  v38 = v13;
  v39 = v5;
  v37 = v7;
  if (v10 | v8)
  {
    if (v8 >= v10)
    {
      v29 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(v7 + 48);
      v30 = v29(a1, v8, v6);
      v24 = v29(a2, v8, v6);
      v3 = a2;
      if (v30)
      {
LABEL_4:
        if (!v24)
          goto LABEL_36;
        goto LABEL_30;
      }
    }
    else
    {
      v16 = (unint64_t)&a1[v13] & v12;
      v35 = *(_QWORD *)(a3 + 16);
      v36 = v4;
      v17 = (v13 & ~v11) + *(_QWORD *)(v9 + 64);
      v18 = v10 | v8;
      v19 = ~v11;
      v21 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48);
      v22 = *(_QWORD *)(v7 + 64) + v11;
      v23 = v21(v16, v10, v5);
      v24 = v21((unint64_t)&a2[v22] & v19, v10, v5);
      v3 = a2;
      v12 = v19;
      v15 = v18;
      v14 = v17;
      v6 = v35;
      v4 = v36;
      if (v23)
        goto LABEL_4;
    }
    v7 = v37;
    if (!v24)
    {
LABEL_34:
      (*(void (**)(_BYTE *, const void *, uint64_t))(v7 + 24))(v4, v3, v6);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 24))((unint64_t)&v4[v38] & v12, ((unint64_t)v3 + v38) & v12, v39);
      return v4;
    }
LABEL_29:
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v4, v6);
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))((unint64_t)&v4[v38] & v12, v39);
    goto LABEL_30;
  }
  v25 = 8 * v14;
  if (!a1[v14])
    goto LABEL_41;
  v26 = (a1[v14] - 1) << v25;
  if (v14 > 3)
    v26 = 0;
  if ((_DWORD)v14)
  {
    if (v14 <= 3)
      v27 = v14;
    else
      v27 = 4;
    __asm { BR              X12 }
  }
  if (v26 == -1)
  {
LABEL_41:
    if (!a2[v14])
      goto LABEL_34;
    v31 = (a2[v14] - 1) << v25;
    if (v14 > 3)
      v31 = 0;
    if ((_DWORD)v14)
    {
      if (v14 <= 3)
        v32 = v14;
      else
        v32 = 4;
      __asm { BR              X11 }
    }
    v7 = *(_QWORD *)(v6 - 8);
    if (v31 == -1)
      goto LABEL_34;
    goto LABEL_29;
  }
  if (!a2[v14] || (a2[v14] - 1) << v25 == -1)
  {
LABEL_36:
    (*(void (**)(_BYTE *, const void *, uint64_t))(v37 + 16))(v4, v3, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((unint64_t)&v4[v38] & v12, ((unint64_t)v3 + v38) & v12, v39);
    if (!v15)
      v4[v14] = 0;
    return v4;
  }
LABEL_30:
  if (v15)
    v33 = v14;
  else
    v33 = v14 + 1;
  memcpy(v4, v3, v33);
  return v4;
}

_BYTE *initializeWithTake for Publishers.Retry.Inner.State(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  int v15;
  int v16;
  int v17;
  size_t v18;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(_DWORD *)(v9 + 84);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = ~v11;
  v13 = *(_QWORD *)(v7 + 64) + v11;
  v14 = (v13 & ~v11) + *(_QWORD *)(v9 + 64);
  v15 = v10 | v8;
  if (v10 | v8)
  {
    if (v8 >= v10)
    {
      if (!(*(unsigned int (**)(_BYTE *))(v7 + 48))(a2))
        goto LABEL_19;
    }
    else if (!(*(unsigned int (**)(unint64_t, _QWORD, _QWORD))(v9 + 48))((unint64_t)&a2[v13] & v12, *(unsigned int *)(v9 + 84), *(_QWORD *)(a3 + 24)))
    {
LABEL_19:
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 32))((unint64_t)&a1[v13] & v12, (unint64_t)&a2[v13] & v12, v5);
      if (!v15)
        a1[v14] = 0;
      return a1;
    }
  }
  else
  {
    if (!a2[v14])
      goto LABEL_19;
    v16 = (a2[v14] - 1) << (8 * v14);
    if (v14 > 3)
      v16 = 0;
    if ((_DWORD)v14)
    {
      if (v14 <= 3)
        v17 = (v13 & ~(_DWORD)v11) + *(_DWORD *)(v9 + 64);
      else
        v17 = 4;
      __asm { BR              X11 }
    }
    if (v16 == -1)
      goto LABEL_19;
  }
  if (v15)
    v18 = v14;
  else
    v18 = v14 + 1;
  memcpy(a1, a2, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Retry.Inner.State(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned int v20;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v6 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v6 + 64) + 1;
  }
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v6 + 80);
  v12 = *(_QWORD *)(v4 + 64) + v11;
  v13 = a2 - v9;
  if (a2 > v9)
  {
    v14 = v10 + (v12 & ~v11);
    v15 = 8 * v14;
    if (v14 > 3)
      goto LABEL_10;
    v17 = ((v13 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      v16 = *(_DWORD *)(a1 + v14);
      if (v16)
        goto LABEL_17;
    }
    else
    {
      if (v17 <= 0xFF)
      {
        if (v17 < 2)
          goto LABEL_26;
LABEL_10:
        v16 = *(unsigned __int8 *)(a1 + v14);
        if (!*(_BYTE *)(a1 + v14))
          goto LABEL_26;
LABEL_17:
        v18 = (v16 - 1) << v15;
        if (v14 > 3)
          v18 = 0;
        if ((_DWORD)v14)
        {
          if (v14 <= 3)
            v19 = v14;
          else
            v19 = 4;
          __asm { BR              X12 }
        }
        return v9 + v18 + 1;
      }
      v16 = *(unsigned __int16 *)(a1 + v14);
      if (*(_WORD *)(a1 + v14))
        goto LABEL_17;
    }
  }
LABEL_26:
  if (v8 < 2)
    return 0;
  if (v5 >= v7)
    v20 = (*(uint64_t (**)(void))(v4 + 48))();
  else
    v20 = (*(uint64_t (**)(uint64_t))(v6 + 48))((v12 + a1) & ~v11);
  if (v20 >= 2)
    return v20 - 1;
  else
    return 0;
}

void storeEnumTagSinglePayload for Publishers.Retry.Inner.State(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  v5 = 0u;
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v7 + 84) <= *(_DWORD *)(v6 + 84))
    v8 = *(_DWORD *)(v6 + 84);
  else
    v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = *(_QWORD *)(v6 + 64) + v10;
  v12 = *(_QWORD *)(v7 + 64);
  if (v8)
    v13 = (v11 & ~v10) + v12;
  else
    v13 = (v11 & ~v10) + v12 + 1;
  if (a3 > v9)
  {
    if (v13 > 3)
    {
      v5 = 1u;
      if (v9 >= a2)
LABEL_26:
        __asm { BR              X0 }
LABEL_19:
      v15 = ~v9 + a2;
      if (v13 < 4)
      {
        if ((_DWORD)v13)
        {
          v16 = v15 & ~(-1 << (8 * v13));
          bzero(a1, v13);
          if ((_DWORD)v13 == 3)
          {
            *a1 = v16;
            *((_BYTE *)a1 + 2) = BYTE2(v16);
          }
          else if ((_DWORD)v13 == 2)
          {
            *a1 = v16;
          }
          else
          {
            *(_BYTE *)a1 = v16;
          }
        }
      }
      else
      {
        bzero(a1, v13);
        *(_DWORD *)a1 = v15;
      }
      __asm { BR              X10 }
    }
    v14 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v14))
    {
      v5 = 4u;
      if (v9 >= a2)
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v14 >= 0x100)
      v5 = 2;
    else
      v5 = v14 > 1;
  }
  if (v9 >= a2)
    goto LABEL_26;
  goto LABEL_19;
}

void sub_18B5D17F4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_18B5D17FC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_18B5D1840()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_18B5D1848()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_18B5D1858()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t getEnumTag for Publishers.Retry.Inner.State(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_DWORD *)(v2 + 84);
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = *(_QWORD *)(v2 + 64) + v6;
  if (v5 | v3)
  {
    if (v3 >= v5)
      return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 48))(a1, *(unsigned int *)(v2 + 84));
    else
      return (*(uint64_t (**)(uint64_t))(v4 + 48))((v7 + a1) & ~v6);
  }
  else
  {
    v9 = (v7 & ~v6) + *(_QWORD *)(v4 + 64);
    if (*(_BYTE *)(a1 + v9))
    {
      v10 = (*(unsigned __int8 *)(a1 + v9) - 1) << (8 * v9);
      if (v9 > 3)
        v10 = 0;
      if ((_DWORD)v9)
      {
        if (v9 > 3)
          LODWORD(v9) = 4;
        return ((uint64_t (*)(void))((char *)&loc_18B5D1900 + 4 * byte_18B5FAD59[(v9 - 1)]))();
      }
      else
      {
        return (v10 + 1);
      }
    }
    else
    {
      return 0;
    }
  }
}

void destructiveInjectEnumTag for Publishers.Retry.Inner.State(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  void (*v15)(_BYTE *);

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  if (v8 >= a2)
  {
    if (v8)
    {
      if (!a2)
        return;
    }
    else
    {
      a1[v11] = 0;
      if (!a2)
        return;
    }
    if (v5 >= v7)
    {
      v15 = *(void (**)(_BYTE *))(v4 + 56);
    }
    else
    {
      a1 = (_BYTE *)((unint64_t)&a1[v10] & ~v9);
      v15 = *(void (**)(_BYTE *))(v6 + 56);
    }
    v15(a1);
    return;
  }
  v12 = ~v8 + a2;
  if (v11 >= 4)
  {
    bzero(a1, (v10 & ~v9) + *(_QWORD *)(v6 + 64));
    *(_DWORD *)v3 = v12;
    LOBYTE(v13) = 1;
    if (v8)
      return;
    goto LABEL_23;
  }
  v13 = (v12 >> (8 * v11)) + 1;
  if (!(_DWORD)v11)
  {
LABEL_22:
    if (v8)
      return;
    goto LABEL_23;
  }
  v14 = v12 & ~(-1 << (8 * v11));
  bzero(a1, (v10 & ~v9) + *(_QWORD *)(v6 + 64));
  if ((_DWORD)v11 == 3)
  {
    *(_WORD *)v3 = v14;
    v3[2] = BYTE2(v14);
    goto LABEL_22;
  }
  if ((_DWORD)v11 == 2)
  {
    *(_WORD *)v3 = v14;
    if (v8)
      return;
    goto LABEL_23;
  }
  *v3 = v14;
  if (!v8)
LABEL_23:
    v3[v11] = v13;
}

void Publishers.Retry.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x7972746552;
  a1[1] = 0xE500000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Retry<A>.Inner<A1>()
{
  return 0x7972746552;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Retry<A>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Retry.Inner.playgroundDescription.getter(a1);
}

uint64_t type metadata completion function for ContinuationSubscriber()
{
  return swift_initClassMetadata2();
}

uint64_t withUnsafeContinuation<A>(isolation:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
  }
  return swift_task_switch();
}

uint64_t withUnsafeContinuation<A>(isolation:_:)()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = (void (*)(uint64_t))v0[11];
  v0[7] = v0[10];
  v0[2] = v0;
  v0[3] = withUnsafeContinuation<A>(isolation:_:);
  v2 = swift_continuation_init();
  v1(v2);
  return swift_continuation_await();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  return (*(uint64_t (**)(void))(*v0 + 8))();
}

uint64_t withUnsafeThrowingContinuation<A>(isolation:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
  }
  return swift_task_switch();
}

uint64_t withUnsafeThrowingContinuation<A>(isolation:_:)()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = (void (*)(uint64_t))v0[11];
  v0[7] = v0[10];
  v0[2] = v0;
  v0[3] = withUnsafeThrowingContinuation<A>(isolation:_:);
  v2 = swift_continuation_init();
  v1(v2);
  return swift_continuation_await();
}

{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
    swift_willThrow();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t ContinuationSubscriber.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;

  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_QWORD *)(v2 + 56) = 0;
  v3 = (_DWORD *)swift_slowAlloc();
  *v3 = 0;
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 16) = a1;
  return v2;
}

uint64_t ContinuationSubscriber.init(_:)(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v3;

  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  v3 = (_DWORD *)swift_slowAlloc();
  *v3 = 0;
  *(_QWORD *)(v1 + 64) = v3;
  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t ContinuationSubscriber.deinit()
{
  uint64_t v0;

  MEMORY[0x18D77ADB0](*(_QWORD *)(v0 + 64), -1, -1);
  outlined destroy of Subscription?(v0 + 24);
  return v0;
}

uint64_t ContinuationSubscriber.__deallocating_deinit()
{
  uint64_t v0;

  MEMORY[0x18D77ADB0](*(_QWORD *)(v0 + 64), -1, -1);
  outlined destroy of Subscription?(v0 + 24);
  return swift_deallocClassInstance();
}

void type metadata accessor for ContinuationSubscriber()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t ContinuationSubscriber.receive(subscription:)(_QWORD *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v3 = *(os_unfair_lock_s **)(v1 + 64);
  os_unfair_lock_lock(v3);
  v4 = v1 + 24;
  swift_beginAccess();
  outlined init with copy of Subscription?(v1 + 24, (uint64_t)v11);
  v5 = v12;
  outlined destroy of Subscription?((uint64_t)v11);
  if (v5)
  {
    os_unfair_lock_unlock(v3);
    v7 = a1[3];
    v6 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 8))(v7);
  }
  else
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v11, v4);
    swift_endAccess();
    os_unfair_lock_unlock(v3);
    v9 = a1[3];
    v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(1, v9, v10);
  }
}

uint64_t ContinuationSubscriber.receive(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(*v1 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (os_unfair_lock_s *)v1[8];
  os_unfair_lock_lock(v7);
  v8 = v1[2];
  if (v8)
  {
    v1[2] = 0;
    os_unfair_lock_unlock(v7);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
    UnsafeContinuation.resume(returning:)((uint64_t)v6, v8, v3);
  }
  else
  {
    os_unfair_lock_unlock(v7);
  }
  return 0;
}

void ContinuationSubscriber.handleFailure(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 96);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v3 + 88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v5);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (os_unfair_lock_s *)v1[8];
  os_unfair_lock_lock(v12);
  v13 = v1[2];
  if (v13)
  {
    v1[2] = 0;
    os_unfair_lock_unlock(v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
    swift_dynamicCast();
    UnsafeContinuation.resume(throwing:)((uint64_t)v7, v13, *(_QWORD *)(v3 + 80), v4);
  }
  else
  {
    os_unfair_lock_unlock(v12);
  }
}

uint64_t ContinuationSubscriber.receive(completion:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  os_unfair_lock_s *v13;
  _OWORD v16[2];
  uint64_t v17;

  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v9 = type metadata accessor for Subscribers.Completion(0, v3, *(_QWORD *)(v7 + 104), v8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v16 - v11 + 16;
  v13 = (os_unfair_lock_s *)v1[8];
  os_unfair_lock_lock(v13);
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)v16, (uint64_t)(v1 + 3));
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) == 1)
  {
    os_unfair_lock_unlock(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v12, v3);
    os_unfair_lock_unlock(v13);
    ContinuationSubscriber.handleFailure(_:)((uint64_t)v6);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t static ContinuationSubscriber.withUnsafeSubscription<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t static ContinuationSubscriber.withUnsafeSubscription<A>(_:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v9;

  v2 = v0[5];
  v1 = (_QWORD *)v0[6];
  v4 = v0[3];
  v3 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  v6 = v1[10];
  v5[2] = v6;
  v5[3] = v1[11];
  v5[4] = v3;
  v5[5] = v1[13];
  v5[6] = v2;
  v5[7] = v4;
  v9 = (char *)&async function pointer to withUnsafeContinuation<A>(isolation:_:)
     + async function pointer to withUnsafeContinuation<A>(isolation:_:);
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  *v7 = v0;
  v7[1] = static ContinuationSubscriber.withUnsafeSubscription<A>(_:);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t (*)(uint64_t), _QWORD *, uint64_t))v9)(v0[2], 0, 0, partial apply for closure #1 in static ContinuationSubscriber.withUnsafeSubscription<A>(_:), v5, v6);
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void closure #1 in static ContinuationSubscriber.withUnsafeSubscription<A>(_:)()
{
  type metadata accessor for ContinuationSubscriber();
}

uint64_t sub_18B5D2450(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v9;

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_QWORD *)(v5 + 56) = 0;
  v6 = (_DWORD *)swift_slowAlloc();
  *v6 = 0;
  *(_QWORD *)(v5 + 64) = v6;
  *(_QWORD *)(v5 + 16) = v3;
  v9 = v5;
  v7 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ContinuationSubscriber<A, B, C>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v9, v2, a1, v1, v7);
  return swift_release();
}

uint64_t static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v9;

  v2 = v0[5];
  v1 = (_QWORD *)v0[6];
  v4 = v0[3];
  v3 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  v6 = v1[10];
  v5[2] = v6;
  v5[3] = v1[11];
  v5[4] = v3;
  v5[5] = v1[13];
  v5[6] = v2;
  v5[7] = v4;
  v9 = (char *)&async function pointer to withUnsafeThrowingContinuation<A>(isolation:_:)
     + async function pointer to withUnsafeThrowingContinuation<A>(isolation:_:);
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  *v7 = v0;
  v7[1] = static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t (*)(uint64_t), _QWORD *, uint64_t))v9)(v0[2], 0, 0, partial apply for closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:), v5, v6);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)()
{
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  swift_getAssociatedConformanceWitness();
  type metadata accessor for ContinuationSubscriber();
}

uint64_t sub_18B5D2704(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v9;

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_QWORD *)(v5 + 56) = 0;
  v6 = (_DWORD *)swift_slowAlloc();
  *v6 = 0;
  *(_QWORD *)(v5 + 64) = v6;
  *(_QWORD *)(v5 + 16) = v3;
  v9 = v5;
  v7 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for ContinuationSubscriber<A, B, C>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v9, v2, a1, v1, v7);
  return swift_release();
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance ContinuationSubscriber<A, B, C>(_QWORD *a1)
{
  return ContinuationSubscriber.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance ContinuationSubscriber<A, B, C>(uint64_t a1)
{
  ContinuationSubscriber.receive(_:)(a1);
  return 0;
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance ContinuationSubscriber<A, B, C>(uint64_t a1)
{
  return ContinuationSubscriber.receive(completion:)(a1);
}

uint64_t associated type witness table accessor for Subscriber.Failure : Error in ContinuationSubscriber<A, B, C>(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t partial apply for closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:));
}

uint64_t partial apply for closure #1 in static ContinuationSubscriber.withUnsafeSubscription<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in static ContinuationSubscriber.withUnsafeSubscription<A>(_:));
}

uint64_t partial apply for closure #1 in static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[7], v2[2], v2[3], v2[4], v2[5], v2[6]);
}

void Publishers.MapError.init(upstream:_:)()
{
  type metadata accessor for Publishers.MapError();
}

uint64_t sub_18B5D2868(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = (_QWORD *)(v5 + *(int *)(a1 + 52));
  *v6 = v3;
  v6[1] = v2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v5, v4, v1);
}

uint64_t Publishers.MapError.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.MapError.transform.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 52));
  swift_retain();
  return v2;
}

void Publishers.MapError.init(upstream:transform:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for Publishers.MapError();
}

uint64_t sub_18B5D2954(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(result + 52));
  *v4 = v2;
  v4[1] = v1;
  return result;
}

void Publishers.MapError.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x726F72724570614DLL;
  a1[1] = 0xE800000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.MapError<A, B>.Inner<A1>()
{
  return 0x726F72724570614DLL;
}

uint64_t getEnumTagSinglePayload for Publishers.MapError(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5D2A3C + 4 * byte_18B5FB010[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.MapError(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5D2BB4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D2C2CLL);
}

void sub_18B5D2BBC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5D2BC4);
  JUMPOUT(0x18B5D2C2CLL);
}

void sub_18B5D2C04()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D2C2CLL);
}

void sub_18B5D2C0C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D2C2CLL);
}

uint64_t sub_18B5D2C14(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x18B5D2C2CLL);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x18B5D2C28);
    JUMPOUT(0x18B5D2C20);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t getEnumTagSinglePayload for Publishers.MapError.Inner(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5D2CC8 + 4 * byte_18B5FB01F[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.MapError.Inner(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 32) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5D2E48()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D2EC0);
}

void sub_18B5D2E50(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5D2E58);
  JUMPOUT(0x18B5D2EC0);
}

void sub_18B5D2E98()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D2EC0);
}

void sub_18B5D2EA0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D2EC0);
}

uint64_t sub_18B5D2EA8(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x18B5D2EC0);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x18B5D2EBCLL);
    JUMPOUT(0x18B5D2EB4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t Publishers.Throttle.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Throttle.interval.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v4, AssociatedTypeWitness);
}

uint64_t Publishers.Throttle.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 56));
}

uint64_t Publishers.Throttle.latest.getter(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 60));
}

void Publishers.Throttle.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x656C74746F726854;
  a1[1] = 0xE800000000000000;
}

void Publishers.Throttle.Inner.receive(completion:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[8];
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v13 = a1;
  v2 = (_QWORD *)*v1;
  v3 = v2[14];
  v4 = v2[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11[7] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v11[6] = (char *)v11 - v6;
  v15 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v5);
  v14 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2[12];
  v9 = v2[13];
  v10 = v2[15];
  v16 = v2[10];
  v17 = v4;
  v18 = v8;
  v19 = v9;
  v20 = v3;
  v21 = v10;
  type metadata accessor for Publishers.Throttle.Inner.State();
}

void sub_18B5D30E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v16 = MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v15 - 240) = (char *)&a9 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  *(_QWORD *)(v15 - 208) = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v18);
  *(_QWORD *)(v15 - 216) = (char *)&a9 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v15 - 136) = v10;
  *(_QWORD *)(v15 - 128) = v11;
  *(_QWORD *)(v15 - 200) = v9;
  *(_QWORD *)(v15 - 120) = v9;
  *(_QWORD *)(v15 - 112) = v12;
  *(_QWORD *)(v15 - 104) = v13;
  *(_QWORD *)(v15 - 96) = v14;
  type metadata accessor for Publishers.Throttle.Inner.Scheduling();
}

void sub_18B5D3188(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  os_unfair_lock_s *v10;
  char *v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  int *TupleTypeMetadata;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  os_unfair_lock_s *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  *(_QWORD *)(v7 - 224) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v7 - 232) = (char *)&v50 - v9;
  v10 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v10);
  v11 = (char *)v1 + *(_QWORD *)(*v1 + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v2, v11, v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(_QWORD *)(v7 - 320) = v11;
    *(_QWORD *)(v7 - 304) = v10;
    *(_QWORD *)(v7 - 296) = v3;
    *(_QWORD *)(v7 - 312) = v4;
    *(_QWORD *)(v7 - 328) = v6;
    v12 = *(_QWORD *)(v7 - 200);
    *(_QWORD *)(v7 - 192) = a1;
    *(_QWORD *)(v7 - 184) = v12;
    *(_QWORD *)(v7 - 176) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Subscription);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    type metadata accessor for Subscribers.Completion(255, AssociatedTypeWitness, AssociatedConformanceWitness, v15);
    *(_QWORD *)(v7 - 168) = type metadata accessor for Optional();
    TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
    v17 = a1;
    v18 = v2 + TupleTypeMetadata[12];
    v19 = (__int128 *)(v2 + TupleTypeMetadata[16]);
    v20 = v2 + TupleTypeMetadata[20];
    v21 = v2;
    v22 = v17;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v7 - 224) + 32))(*(_QWORD *)(v7 - 232), v21);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 208) + 32))(*(_QWORD *)(v7 - 216), v18, v12);
    outlined init with take of Subscription(v19, v7 - 136);
    v24 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v23);
    v25 = *(_QWORD *)(v24 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v20, 1, v24) == 1)
    {
      v26 = type metadata accessor for Optional();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v20, v26);
      v27 = v22;
      v28 = *(_QWORD *)(v7 - 232);
      v29 = v28 + *(int *)(v22 + 68);
      v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 248) + 16);
      v31 = *(_QWORD *)(v7 - 256);
      *(_QWORD *)(v7 - 336) = v5;
      v30(v31, v29, v5);
      v32 = *(_QWORD *)(v7 - 288);
      (*(void (**)(uint64_t))(*(_QWORD *)(v7 - 328) + 40))(v5);
      v33 = (char *)v1 + *(_QWORD *)(*v1 + 168);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, _QWORD))(*(_QWORD *)(v7 - 280) + 40))(v33, v32, *(_QWORD *)(v7 - 272));
      swift_endAccess();
      v34 = *(_QWORD *)(v7 - 240);
      v35 = v34 + TupleTypeMetadata[12];
      v36 = v34 + TupleTypeMetadata[16];
      v37 = v34 + TupleTypeMetadata[20];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 224) + 16))(v34, v28, v27);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v7 - 208) + 16))(v35, *(_QWORD *)(v7 - 216), *(_QWORD *)(v7 - 200));
      outlined init with copy of Subscription(v7 - 136, v36);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v25 + 16))(v37, *(_QWORD *)(v7 - 264), v24);
      v38 = v27;
      v39 = *(_QWORD *)(v7 - 248);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v25 + 56))(v37, 0, 1, v24);
      v40 = *(_QWORD *)(v7 - 312);
      swift_storeEnumTagMultiPayload();
      v41 = *(_QWORD *)(v7 - 320);
      swift_beginAccess();
      v42 = v41;
      v43 = *(_QWORD *)(v7 - 336);
      v44 = v34;
      v45 = *(_QWORD *)(v7 - 256);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 296) + 40))(v42, v44, v40);
      swift_endAccess();
      v46 = *(_QWORD *)(*v1 + 176);
      v47 = *(os_unfair_lock_s **)(v7 - 304);
      if ((*((_BYTE *)v1 + v46) & 1) != 0)
      {
        os_unfair_lock_unlock(v47);
      }
      else
      {
        *((_BYTE *)v1 + v46) = 1;
        os_unfair_lock_unlock(v47);
        swift_retain();
        Scheduler.schedule(_:)((uint64_t)partial apply for closure #1 in Publishers.Throttle.Inner.receive(completion:), (uint64_t)v1, v43, *(_QWORD *)(v7 - 328));
        swift_release();
      }
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v45, v43);
      __swift_destroy_boxed_opaque_existential_1(v7 - 136);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v7 - 208) + 8))(*(_QWORD *)(v7 - 216), *(_QWORD *)(v7 - 200));
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v7 - 224) + 8))(*(_QWORD *)(v7 - 232), v38);
      return;
    }
    __swift_destroy_boxed_opaque_existential_1(v7 - 136);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v7 - 208) + 8))(*(_QWORD *)(v7 - 216), *(_QWORD *)(v7 - 200));
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v7 - 224) + 8))(*(_QWORD *)(v7 - 232), v22);
    v48 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 8))(v20, v48);
    v4 = *(_QWORD *)(v7 - 312);
    v3 = *(_QWORD *)(v7 - 296);
    v10 = *(os_unfair_lock_s **)(v7 - 304);
    v11 = *(char **)(v7 - 320);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  }
  if ((*((_BYTE *)v1 + *(_QWORD *)(*v1 + 176)) & 1) == 0)
  {
    v49 = *(_QWORD *)(v7 - 240);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 40))(v11, v49, v4);
    swift_endAccess();
  }
  os_unfair_lock_unlock(v10);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Throttle<A, B>.Inner<A1>(uint64_t a1)
{
  Publishers.Throttle.Inner.receive(completion:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Throttle<A, B>.Inner<A1>()
{
  return 0x656C74746F726854;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Throttle<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Throttle.Inner.playgroundDescription.getter(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Throttle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  unint64_t v27;

  v5 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v7 + v10;
  v12 = *(_QWORD *)(v4 - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v14 = *(_QWORD *)(v9 + 64) + v13;
  v15 = *(_QWORD *)(v12 + 64);
  v16 = (*(_BYTE *)(v9 + 80) | *(_BYTE *)(v6 + 80) | v13);
  if (v16 > 7
    || ((*(_DWORD *)(v9 + 80) | *(_DWORD *)(v6 + 80) | v13) & 0x100000) != 0
    || v15 + ((v14 + (v11 & ~v10)) & ~(unint64_t)v13) + 1 > 0x18)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v16 + 16) & ~v16));
    swift_retain();
  }
  else
  {
    v20 = ~v10;
    v26 = AssociatedTypeWitness;
    v27 = ~(unint64_t)v13;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v21 = ((unint64_t)a1 + v11) & v20;
    v22 = ((unint64_t)a2 + v11) & v20;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v21, v22, v26);
    v23 = (v21 + v14) & v27;
    v24 = (v22 + v14) & v27;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))(v23, v24, v4);
    *(_BYTE *)(v23 + v15) = *(_BYTE *)(v24 + v15);
  }
  return a1;
}

uint64_t initializeWithCopy for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v10 + 64);
  v15 = *(_QWORD *)(v8 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = v14 + v16;
  v18 = (v17 + v12) & ~v16;
  v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, v19, v8);
  *(_BYTE *)(v18 + *(_QWORD *)(v15 + 64)) = *(_BYTE *)(v19 + *(_QWORD *)(v15 + 64));
  return a1;
}

uint64_t assignWithCopy for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v10 + 64);
  v15 = *(_QWORD *)(v8 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = v14 + v16;
  v18 = (v17 + v12) & ~v16;
  v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 24))(v18, v19, v8);
  *(_BYTE *)(v18 + *(_QWORD *)(v15 + 64)) = *(_BYTE *)(v19 + *(_QWORD *)(v15 + 64));
  return a1;
}

uint64_t initializeWithTake for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v10 + 64);
  v15 = *(_QWORD *)(v8 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = v14 + v16;
  v18 = (v17 + v12) & ~v16;
  v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v18, v19, v8);
  *(_BYTE *)(v18 + *(_QWORD *)(v15 + 64)) = *(_BYTE *)(v19 + *(_QWORD *)(v15 + 64));
  return a1;
}

uint64_t assignWithTake for Publishers.Throttle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v10 + 64);
  v15 = *(_QWORD *)(v8 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = v14 + v16;
  v18 = (v17 + v12) & ~v16;
  v19 = (v17 + v13) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40))(v18, v19, v8);
  *(_BYTE *)(v18 + *(_QWORD *)(v15 + 64)) = *(_BYTE *)(v19 + *(_QWORD *)(v15 + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Throttle(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  unsigned int v30;
  int v31;

  v6 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8)
    v12 = v8;
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(v5 - 8);
  v14 = *(unsigned int *)(v13 + 84);
  if (v14 > v12)
    v12 = *(_DWORD *)(v13 + 84);
  if (v12 <= 0xFE)
    v12 = 254;
  if (!a2)
    return 0;
  v15 = AssociatedTypeWitness;
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = *(_QWORD *)(v7 + 64) + v16;
  v18 = *(_QWORD *)(v10 + 64);
  v19 = *(unsigned __int8 *)(v13 + 80);
  v20 = *(_QWORD *)(v13 + 64);
  if (a2 <= v12)
    goto LABEL_27;
  v21 = v20 + ((v18 + v19 + (v17 & ~v16)) & ~v19) + 1;
  v22 = 8 * v21;
  if (v21 > 3)
    goto LABEL_11;
  v24 = ((a2 - v12 + ~(-1 << v22)) >> v22) + 1;
  if (HIWORD(v24))
  {
    v23 = *(_DWORD *)(a1 + v21);
    if (v23)
      goto LABEL_18;
  }
  else
  {
    if (v24 <= 0xFF)
    {
      if (v24 < 2)
        goto LABEL_27;
LABEL_11:
      v23 = *(unsigned __int8 *)(a1 + v21);
      if (!*(_BYTE *)(a1 + v21))
        goto LABEL_27;
LABEL_18:
      v25 = (v23 - 1) << v22;
      if (v21 > 3)
        v25 = 0;
      if ((_DWORD)v20 + (((_DWORD)v18 + (_DWORD)v19 + (v17 & ~(_DWORD)v16)) & ~(_DWORD)v19) != -1)
      {
        if (v21 <= 3)
          v26 = v20 + ((v18 + v19 + (v17 & ~(_DWORD)v16)) & ~(_DWORD)v19) + 1;
        else
          v26 = 4;
        __asm { BR              X12 }
      }
      v31 = v12 + v25;
      return (v31 + 1);
    }
    v23 = *(unsigned __int16 *)(a1 + v21);
    if (*(_WORD *)(a1 + v21))
      goto LABEL_18;
  }
LABEL_27:
  if ((_DWORD)v8 == v12)
  {
    v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v28 = a1;
    v14 = v8;
    v15 = v6;
    return v27(v28, v14, v15);
  }
  v28 = (v17 + a1) & ~v16;
  if (v11 == v12)
  {
    v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v14 = *(unsigned int *)(v10 + 84);
    return v27(v28, v14, v15);
  }
  v28 = (v28 + v18 + v19) & ~v19;
  if ((_DWORD)v14 == v12)
  {
    v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    v15 = v5;
    return v27(v28, v14, v15);
  }
  v30 = *(unsigned __int8 *)(v28 + v20);
  if (v30 < 2)
    return 0;
  v31 = (v30 + 2147483646) & 0x7FFFFFFF;
  return (v31 + 1);
}

void storeEnumTagSinglePayload for Publishers.Throttle(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  int v19;

  v7 = *(_QWORD *)(a4 + 24);
  v8 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v9 = *(_DWORD *)(v8 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v10 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v10 + 84) <= v9)
    v11 = v9;
  else
    v11 = *(_DWORD *)(v10 + 84);
  v12 = *(_QWORD *)(v7 - 8);
  if (*(_DWORD *)(v12 + 84) > v11)
    v11 = *(_DWORD *)(v12 + 84);
  if (v11 <= 0xFE)
    v11 = 254;
  v13 = *(unsigned __int8 *)(v10 + 80);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = *(_QWORD *)(v12 + 64) + ((*(_QWORD *)(v10 + 64) + v14 + ((*(_QWORD *)(v8 + 64) + v13) & ~v13)) & ~v14) + 1;
  if (a3 <= v11)
  {
    v16 = 0u;
  }
  else if (v15 <= 3)
  {
    v18 = ((a3 - v11 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v18))
    {
      v16 = 4u;
    }
    else if (v18 >= 0x100)
    {
      v16 = 2;
    }
    else
    {
      v16 = v18 > 1;
    }
  }
  else
  {
    v16 = 1u;
  }
  if (v11 < a2)
  {
    v17 = ~v11 + a2;
    if (v15 < 4)
    {
      if (*(_DWORD *)(v12 + 64)
         + ((*(_DWORD *)(v10 + 64) + (_DWORD)v14 + ((*(_DWORD *)(v8 + 64) + (_DWORD)v13) & ~(_DWORD)v13)) & ~(_DWORD)v14) != -1)
      {
        v19 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if ((_DWORD)v15 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if ((_DWORD)v15 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v12 + 64) + ((*(_QWORD *)(v10 + 64) + v14 + ((*(_QWORD *)(v8 + 64) + v13) & ~v13)) & ~v14) + 1);
      *(_DWORD *)a1 = v17;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X4 }
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Throttle.Inner.State(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 *v36;
  unint64_t v37;
  int v38;
  int v39;
  size_t v41;
  unint64_t v42;
  uint64_t v43;
  size_t __n;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int __dsta;

  v4 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_QWORD *)(v4 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v46 = AssociatedTypeWitness;
  v47 = *(_QWORD *)(v6 + 64) + v8;
  v48 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10;
  v50 = *(_QWORD *)(v7 + 64);
  v51 = v9;
  v49 = v50 + v10 + (v47 & ~(unint64_t)v8) + 1;
  v45 = *(_QWORD *)(v9 + 64);
  v12 = (v49 & ~(unint64_t)v10) + v45;
  v52 = *(_QWORD *)(a3 + 32);
  v14 = swift_getAssociatedTypeWitness();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_DWORD *)(v15 + 84);
  v17 = *(_DWORD *)(v15 + 80);
  if (v16)
    v18 = *(_QWORD *)(v15 + 64);
  else
    v18 = *(_QWORD *)(v15 + 64) + 1;
  if (v16 >= 2)
    v19 = v18;
  else
    v19 = v18 + 1;
  v13 = (v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (((v17 + v13 + 40) & ~v17) + v19 <= v12)
    v20 = (v49 & ~(unint64_t)v10) + v45;
  else
    v20 = ((v17 + v13 + 40) & ~v17) + v19;
  v21 = v8 | v10 | *(_DWORD *)(v15 + 80) | *(_DWORD *)(v6 + 80);
  if ((v21 & 0x1000F8) == 0 && v20 + 1 <= 0x18)
  {
    v22 = *((unsigned __int8 *)a2 + v20);
    if (v22 >= 2)
    {
      if (v20 <= 3)
        v23 = v20;
      else
        v23 = 4;
      __asm { BR              X12 }
    }
    v25 = a1;
    v26 = ~(unint64_t)v8;
    v27 = ~v11;
    if (v22 != 1)
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v46);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v48 + 16))(((unint64_t)a1 + v47) & v26, ((unint64_t)a2 + v47) & v26, v4);
      *(_BYTE *)((((unint64_t)a1 + v47) & v26) + v50) = *(_BYTE *)((((unint64_t)a2 + v47) & v26) + v50);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v51 + 16))(((unint64_t)a1 + v49) & v27, ((unint64_t)a2 + v49) & v27, v52);
      *((_BYTE *)a1 + v20) = 0;
      return v25;
    }
    v41 = v19;
    v42 = v20;
    v43 = v14;
    __n = v18;
    v28 = a1;
    __dsta = *(_DWORD *)(v15 + 84);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(v28, a2, v46);
    v29 = ((unint64_t)a2 + v47) & v26;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v48 + 16))(((unint64_t)v25 + v47) & v26, v29, v4);
    *(_BYTE *)((((unint64_t)v25 + v47) & v26) + v50) = *(_BYTE *)(v29 + v50);
    v30 = ((unint64_t)a2 + v49) & v27;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v51 + 16))(((unint64_t)v25 + v49) & v27, v30, v52);
    v31 = (v45 + 7 + (((unint64_t)v25 + v49) & v27)) & 0xFFFFFFFFFFFFFFF8;
    v32 = (v45 + 7 + v30) & 0xFFFFFFFFFFFFFFF8;
    v33 = *(_QWORD *)(v32 + 24);
    *(_QWORD *)(v31 + 24) = v33;
    *(_QWORD *)(v31 + 32) = *(_QWORD *)(v32 + 32);
    (**(void (***)(unint64_t, unint64_t))(v33 - 8))(v31, v32);
    v34 = v32 + v17;
    v35 = (void *)((v31 + v17 + 40) & ~v17);
    v36 = (unsigned __int8 *)((v34 + 40) & ~v17);
    if (__dsta > 1)
    {
      v37 = v42;
      if ((*(unsigned int (**)(uint64_t))(v15 + 48))((v34 + 40) & ~v17) >= 2)
      {
LABEL_36:
        memcpy(v35, v36, v41);
LABEL_37:
        *((_BYTE *)v25 + v37) = 1;
        return v25;
      }
    }
    else
    {
      v37 = v42;
      if (v36[__n])
      {
        v38 = (v36[__n] - 1) << (8 * __n);
        if (__n > 3)
          v38 = 0;
        if ((_DWORD)__n)
        {
          if (__n <= 3)
            v39 = __n;
          else
            v39 = 4;
          __asm { BR              X11 }
        }
        if (v38 != -1)
          goto LABEL_36;
      }
    }
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v15 + 48))(v36, 1, v43))
    {
      memcpy(v35, v36, __n);
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v15 + 16))(v35, v36, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v35, 0, 1, v43);
    }
    if (__dsta <= 1)
      *((_BYTE *)v35 + __n) = 0;
    goto LABEL_37;
  }
  v24 = *a2;
  *a1 = *a2;
  v25 = (uint64_t *)(v24 + (((v21 & 0xF8 | 7u) + 16) & ~(unint64_t)(v21 & 0xF8 | 7u)));
  swift_retain();
  return v25;
}

uint64_t assignWithCopy for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  size_t v17;
  size_t v18;
  size_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unsigned __int8 *v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  size_t __n;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  if (a1 != a2)
  {
    v6 = *(_QWORD *)(a3 + 24);
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v52 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v53 = AssociatedTypeWitness;
    v8 = *(_QWORD *)(v6 - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v54 = *(_QWORD *)(v52 + 64) + v9;
    v10 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
    v11 = *(unsigned __int8 *)(v10 + 80);
    v47 = *(_QWORD *)(v8 + 64);
    v55 = v47 + v11 + (v54 & ~v9) + 1;
    v46 = *(_QWORD *)(v10 + 64);
    v12 = (v55 & ~v11) + v46;
    v56 = *(_QWORD *)(a3 + 32);
    v13 = swift_getAssociatedTypeWitness();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned __int8 *)(v14 + 80);
    v16 = *(_DWORD *)(v14 + 84);
    v49 = v14;
    v50 = v13;
    v17 = *(_QWORD *)(v14 + 64);
    if (v16)
      v18 = v17;
    else
      v18 = v17 + 1;
    v48 = v16;
    if (v16 >= 2)
      v19 = v18;
    else
      v19 = v18 + 1;
    if (((v15 + ((v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~v15) + v19 > v12)
      v12 = ((v15 + ((v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 40) & ~v15) + v19;
    v20 = *(unsigned __int8 *)(a1 + v12);
    if (v20 >= 2)
    {
      if (v12 <= 3)
        v21 = v12;
      else
        v21 = 4;
      __asm { BR              X12 }
    }
    v22 = ~v9;
    v51 = ~v11;
    __n = v19;
    v45 = ~v15;
    if (v20 != 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(a1, v53);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v54 + a1) & v22, v6);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))((v55 + a1) & v51, v56);
      goto LABEL_31;
    }
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(a1, v53);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))((v54 + a1) & v22, v6);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))((v55 + a1) & v51, v56);
    v23 = (v46 + ((v55 + a1) & v51) + 7) & 0xFFFFFFFFFFFFFFF8;
    __swift_destroy_boxed_opaque_existential_1(v23);
    v24 = (v23 + v15 + 40) & v45;
    if (v48 > 1)
    {
      if ((*(unsigned int (**)(uint64_t))(v49 + 48))(v24) >= 2)
        goto LABEL_31;
    }
    else if (*(_BYTE *)(v24 + v18))
    {
      v25 = (*(unsigned __int8 *)(v24 + v18) - 1) << (8 * v18);
      if (v18 > 3)
        v25 = 0;
      if ((_DWORD)v18)
      {
        if (v18 <= 3)
          v26 = v18;
        else
          v26 = 4;
        __asm { BR              X11 }
      }
      if (v25 != -1)
      {
LABEL_31:
        v27 = *(unsigned __int8 *)(a2 + v12);
        if (v27 >= 2)
        {
          if (v12 <= 3)
            v28 = v12;
          else
            v28 = 4;
          __asm { BR              X12 }
        }
        if (v27 != 1)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(a1, a2, v53);
          v29 = (v54 + a1) & v22;
          v30 = (v54 + a2) & v22;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v29, v30, v6);
          *(_BYTE *)(v29 + v47) = *(_BYTE *)(v30 + v47);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))((v55 + a1) & v51, (v55 + a2) & v51, v56);
          *(_BYTE *)(a1 + v12) = 0;
          return a1;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(a1, a2, v53);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))((v54 + a1) & v22, (v54 + a2) & v22, v6);
        *(_BYTE *)(((v54 + a1) & v22) + v47) = *(_BYTE *)(((v54 + a2) & v22) + v47);
        v31 = (v55 + a2) & v51;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))((v55 + a1) & v51, v31, v56);
        v32 = (v46 + 7 + ((v55 + a1) & v51)) & 0xFFFFFFFFFFFFFFF8;
        v33 = (v46 + 7 + v31) & 0xFFFFFFFFFFFFFFF8;
        v34 = *(_QWORD *)(v33 + 24);
        *(_QWORD *)(v32 + 24) = v34;
        *(_QWORD *)(v32 + 32) = *(_QWORD *)(v33 + 32);
        (**(void (***)(unint64_t, unint64_t))(v34 - 8))(v32, v33);
        v35 = v33 + v15;
        v36 = (void *)((v32 + v15 + 40) & v45);
        v37 = (unsigned __int8 *)((v35 + 40) & v45);
        if (v48 > 1)
        {
          v40 = v49;
          v39 = v50;
          v38 = v18;
          if ((*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(v49 + 48))((v35 + 40) & v45, v48, v50) >= 2)
          {
LABEL_54:
            memcpy(v36, v37, __n);
            goto LABEL_55;
          }
        }
        else
        {
          v38 = v18;
          v40 = v49;
          v39 = v50;
          if (v37[v18])
          {
            v41 = (v37[v18] - 1) << (8 * v18);
            if (v18 > 3)
              v41 = 0;
            if ((_DWORD)v18)
            {
              if (v18 <= 3)
                v42 = v18;
              else
                v42 = 4;
              __asm { BR              X11 }
            }
            if (v41 != -1)
              goto LABEL_54;
          }
        }
        if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v40 + 48))(v37, 1, v39))
        {
          memcpy(v36, v37, v38);
          if (v48 > 1)
            goto LABEL_55;
        }
        else
        {
          (*(void (**)(void *, unsigned __int8 *, uint64_t))(v40 + 16))(v36, v37, v39);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v36, 0, 1, v39);
          if (v48 > 1)
          {
LABEL_55:
            *(_BYTE *)(a1 + v12) = 1;
            return a1;
          }
        }
        *((_BYTE *)v36 + v38) = 0;
        goto LABEL_55;
      }
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v24, 1, v50))
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v24, v50);
    goto LABEL_31;
  }
  return a1;
}

uint64_t initializeWithTake for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  size_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  void *v37;
  unsigned __int8 *v38;
  size_t v39;
  int v40;
  int v41;
  unint64_t v42;
  size_t __n;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v5 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v50 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v52 = AssociatedTypeWitness;
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v53 = *(_QWORD *)(v50 + 64) + v8;
  v9 = *(_QWORD *)(a3 + 32);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v55 = *(_QWORD *)(v7 + 64);
  v56 = v10;
  v54 = v55 + v11 + (v53 & ~v8) + 1;
  v49 = *(_QWORD *)(v10 + 64);
  v12 = (v54 & ~v11) + v49;
  v14 = swift_getAssociatedTypeWitness();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = *(_DWORD *)(v15 + 84);
  if (v17)
    v18 = *(_QWORD *)(v15 + 64);
  else
    v18 = *(_QWORD *)(v15 + 64) + 1;
  if (v17 >= 2)
    v19 = v18;
  else
    v19 = v18 + 1;
  v13 = (v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (((v16 + v13 + 40) & ~v16) + v19 <= v12)
    v20 = (v54 & ~v11) + v49;
  else
    v20 = ((v16 + v13 + 40) & ~v16) + v19;
  v21 = *(unsigned __int8 *)(a2 + v20);
  if (v21 >= 2)
  {
    if (v20 <= 3)
      v22 = v20;
    else
      v22 = 4;
    __asm { BR              X12 }
  }
  v23 = ~v8;
  v24 = ~v11;
  if (v21 == 1)
  {
    __n = v19;
    v45 = v18;
    v46 = v20;
    v47 = v9;
    v48 = v14;
    v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32);
    v28 = a1;
    v51 = *(_DWORD *)(v15 + 84);
    v30 = a2;
    v29(a1, a2, v52);
    v31 = (v53 + a1) & v23;
    v32 = (v53 + a2) & v23;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v31, v32, v5);
    *(_BYTE *)(v31 + v55) = *(_BYTE *)(v32 + v55);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))((v54 + a1) & v24, (v54 + v30) & v24, v47);
    v33 = (v49 + 7 + ((v54 + a1) & v24)) & 0xFFFFFFFFFFFFFFF8;
    v34 = (v49 + 7 + ((v54 + v30) & v24)) & 0xFFFFFFFFFFFFFFF8;
    v35 = *(_QWORD *)(v34 + 32);
    v36 = *(_OWORD *)(v34 + 16);
    *(_OWORD *)v33 = *(_OWORD *)v34;
    *(_OWORD *)(v33 + 16) = v36;
    *(_QWORD *)(v33 + 32) = v35;
    v37 = (void *)((v33 + v16 + 40) & ~v16);
    v38 = (unsigned __int8 *)((v34 + v16 + 40) & ~v16);
    if (v51 > 1)
    {
      v39 = v45;
      if ((*(unsigned int (**)(unsigned __int8 *))(v15 + 48))(v38) >= 2)
      {
LABEL_33:
        memcpy(v37, v38, __n);
        v42 = v46;
LABEL_34:
        *(_BYTE *)(a1 + v42) = 1;
        return v28;
      }
    }
    else
    {
      v39 = v45;
      if (v38[v45])
      {
        v40 = (v38[v45] - 1) << (8 * v45);
        if (v45 > 3)
          v40 = 0;
        if ((_DWORD)v45)
        {
          if (v45 <= 3)
            v41 = v45;
          else
            v41 = 4;
          __asm { BR              X11 }
        }
        if (v40 != -1)
          goto LABEL_33;
      }
    }
    if ((*(unsigned int (**)(unsigned __int8 *, uint64_t, uint64_t))(v15 + 48))(v38, 1, v48))
    {
      memcpy(v37, v38, v39);
    }
    else
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v15 + 32))(v37, v38, v48);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v37, 0, 1, v48);
    }
    v42 = v46;
    if (v51 <= 1)
      *((_BYTE *)v37 + v39) = 0;
    goto LABEL_34;
  }
  v25 = v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(a1, a2, v52);
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v27 = v9;
  v28 = a1;
  v26((v53 + a1) & v23, (v53 + a2) & v23, v5);
  *(_BYTE *)(((v53 + a1) & v23) + v55) = *(_BYTE *)(((v53 + a2) & v23) + v55);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))((v54 + a1) & v24, (v54 + a2) & v24, v27);
  *(_BYTE *)(a1 + v25) = 0;
  return v28;
}

uint64_t getEnumTagSinglePayload for Publishers.Throttle.Inner.State(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  int v18;
  unsigned int v20;
  int v21;
  unsigned int v22;

  v6 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(a3 + 32);
  v9 = ((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)
       + ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
       + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  v10 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v11 = (((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(v10 + 64);
  if (!v12)
    ++v13;
  if (v12 < 2)
    ++v13;
  v14 = v13 + v11;
  if (v14 <= v9)
    v15 = v9;
  else
    v15 = v14;
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_26;
  v16 = v15 + 1;
  v17 = 8 * (v15 + 1);
  if ((v15 + 1) <= 3)
  {
    v20 = ((a2 + ~(-1 << v17) - 253) >> v17) + 1;
    if (HIWORD(v20))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v20 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v20 < 2)
    {
LABEL_26:
      v22 = *(unsigned __int8 *)(a1 + v15);
      if (v22 >= 3)
        return (v22 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_26;
LABEL_19:
  v21 = (v18 - 1) << v17;
  if (v16 > 3)
    v21 = 0;
  if ((_DWORD)v16)
  {
    if (v16 > 3)
      LODWORD(v16) = 4;
    __asm { BR              X11 }
  }
  return (v21 + 254);
}

void storeEnumTagSinglePayload for Publishers.Throttle.Inner.State(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  size_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;

  v8 = *(_QWORD *)(a4 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(a4 + 32);
  v11 = ((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64)
        + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80)
        + ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))
        + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80))
      + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  v12 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v13 = (((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_DWORD *)(v12 + 84);
  v15 = *(_QWORD *)(v12 + 64);
  if (!v14)
    ++v15;
  if (v14 < 2)
    ++v15;
  v16 = v15 + v13;
  if (v16 <= v11)
    v16 = v11;
  v17 = v16 + 1;
  if (a3 < 0xFE)
  {
    v18 = 0u;
  }
  else if (v17 <= 3)
  {
    v20 = ((a3 + ~(-1 << (8 * v17)) - 253) >> (8 * v17)) + 1;
    if (HIWORD(v20))
    {
      v18 = 4u;
    }
    else if (v20 >= 0x100)
    {
      v18 = 2;
    }
    else
    {
      v18 = v20 > 1;
    }
  }
  else
  {
    v18 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v19 = a2 - 254;
  if (v17 < 4)
  {
    if ((_DWORD)v16 != -1)
    {
      v21 = v19 & ~(-1 << (8 * v17));
      bzero(a1, v17);
      if ((_DWORD)v17 == 3)
      {
        *(_WORD *)a1 = v21;
        a1[2] = BYTE2(v21);
      }
      else if ((_DWORD)v17 == 2)
      {
        *(_WORD *)a1 = v21;
      }
      else
      {
        *a1 = v21;
      }
    }
  }
  else
  {
    bzero(a1, v16 + 1);
    *(_DWORD *)a1 = v19;
  }
  __asm { BR              X10 }
}

uint64_t getEnumTag for Publishers.Throttle.Inner.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(a2 + 32);
  v7 = ((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)
       + ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80))
       + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v9 = (((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = *(_DWORD *)(v8 + 84);
  v11 = *(_QWORD *)(v8 + 64);
  if (!v10)
    ++v11;
  if (v10 < 2)
    ++v11;
  v12 = v11 + v9;
  if (v12 <= v7)
    v12 = v7;
  result = *(unsigned __int8 *)(a1 + v12);
  if (result >= 2)
  {
    if (v12 <= 3)
      v14 = v12;
    else
      v14 = 4;
    __asm { BR              X12 }
  }
  return result;
}

uint64_t destructiveInjectEnumTag for Publishers.Throttle.Inner.State(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  size_t v15;
  size_t v16;
  char v17;
  int v18;

  v6 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(a3 + 32);
  v9 = ((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80)
       + ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
       + 1) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  result = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(result - 8);
  v12 = (((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_DWORD *)(v11 + 84);
  v14 = *(_QWORD *)(v11 + 64);
  if (!v13)
    ++v14;
  if (v13 < 2)
    ++v14;
  v15 = v14 + v12;
  if (v15 <= v9)
    v16 = v9;
  else
    v16 = v15;
  if (a2 > 1)
  {
    if (v16 <= 3)
      v17 = ((a2 - 2) >> (8 * v16)) + 2;
    else
      v17 = 2;
    a1[v16] = v17;
    if (v16 >= 4)
      v18 = 4;
    else
      v18 = v16;
    bzero(a1, v16);
    __asm { BR              X10 }
  }
  a1[v16] = a2;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Throttle.Inner.Scheduling(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v5 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = *(_QWORD *)(v8 + 64);
  v12 = (*(_BYTE *)(v7 + 80) | *(_BYTE *)(v8 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || v11 + (v10 & (unint64_t)~v9) + 1 > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
    v17 = ((unint64_t)a2 + v10) & v16;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v16, v17, v5);
    *(_BYTE *)((((unint64_t)a1 + v10) & v16) + v11) = *(_BYTE *)(v17 + v11);
  }
  return a1;
}

uint64_t assignWithCopy for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, v5);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t initializeWithTake for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v5);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t assignWithTake for Publishers.Throttle.Inner.Scheduling(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v5);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Throttle.Inner.Scheduling(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  unsigned int v25;
  int v26;

  v5 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (v11 <= 0xFE)
    v11 = 254;
  if (!a2)
    return 0;
  v12 = AssociatedTypeWitness;
  v13 = *(unsigned __int8 *)(v9 + 80);
  v14 = *(_QWORD *)(v7 + 64) + v13;
  v15 = *(_QWORD *)(v9 + 64);
  if (a2 <= v11)
    goto LABEL_25;
  v16 = v15 + (v14 & ~v13) + 1;
  v17 = 8 * v16;
  if (v16 > 3)
    goto LABEL_9;
  v19 = ((a2 - v11 + ~(-1 << v17)) >> v17) + 1;
  if (HIWORD(v19))
  {
    v18 = *(_DWORD *)(a1 + v16);
    if (v18)
      goto LABEL_16;
  }
  else
  {
    if (v19 <= 0xFF)
    {
      if (v19 < 2)
        goto LABEL_25;
LABEL_9:
      v18 = *(unsigned __int8 *)(a1 + v16);
      if (!*(_BYTE *)(a1 + v16))
        goto LABEL_25;
LABEL_16:
      v20 = (v18 - 1) << v17;
      if (v16 > 3)
        v20 = 0;
      if ((_DWORD)v15 + (v14 & ~(_DWORD)v13) != -1)
      {
        if (v16 <= 3)
          v21 = v15 + (v14 & ~(_DWORD)v13) + 1;
        else
          v21 = 4;
        __asm { BR              X12 }
      }
      v26 = v11 + v20;
      return (v26 + 1);
    }
    v18 = *(unsigned __int16 *)(a1 + v16);
    if (*(_WORD *)(a1 + v16))
      goto LABEL_16;
  }
LABEL_25:
  if (v8 == v11)
  {
    v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v23 = a1;
    v10 = *(unsigned int *)(v7 + 84);
    return v22(v23, v10, v12);
  }
  v23 = (v14 + a1) & ~v13;
  if ((_DWORD)v10 == v11)
  {
    v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    v12 = v5;
    return v22(v23, v10, v12);
  }
  v25 = *(unsigned __int8 *)(v23 + v15);
  if (v25 < 2)
    return 0;
  v26 = (v25 + 2147483646) & 0x7FFFFFFF;
  return (v26 + 1);
}

void storeEnumTagSinglePayload for Publishers.Throttle.Inner.Scheduling(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v7 = *(_QWORD *)(a4 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v9 = *(_QWORD *)(v7 - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= 0xFE)
    v11 = 254;
  else
    v11 = v10;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = *(_QWORD *)(v9 + 64) + ((*(_QWORD *)(v8 + 64) + v12) & ~v12) + 1;
  if (a3 <= v11)
  {
    v14 = 0u;
  }
  else if (v13 <= 3)
  {
    v16 = ((a3 - v11 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v16))
    {
      v14 = 4u;
    }
    else if (v16 >= 0x100)
    {
      v14 = 2;
    }
    else
    {
      v14 = v16 > 1;
    }
  }
  else
  {
    v14 = 1u;
  }
  if (v11 < a2)
  {
    v15 = ~v11 + a2;
    if (v13 < 4)
    {
      if (*(_DWORD *)(v9 + 64) + ((*(_DWORD *)(v8 + 64) + (_DWORD)v12) & ~(_DWORD)v12) != -1)
      {
        v17 = v15 & ~(-1 << (8 * v13));
        bzero(a1, v13);
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v9 + 64) + ((*(_QWORD *)(v8 + 64) + v12) & ~v12) + 1);
      *(_DWORD *)a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X17 }
}

uint64_t associated type witness table accessor for Subscriber.Failure : Error in Publishers.Throttle<A, B>.Inner<A1>()
{
  return swift_getAssociatedConformanceWitness();
}

void Publishers.Share.__allocating_init(upstream:)(uint64_t a1)
{
  specialized Publishers.Share.__allocating_init(upstream:)(a1);
}

uint64_t sub_18B5D654C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 8))(v1);
  return a1;
}

uint64_t Publishers.Share.upstream.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 104));
}

void Publishers.Share.init(upstream:)(uint64_t a1)
{
  specialized Publishers.Share.init(upstream:)(a1);
}

uint64_t sub_18B5D65B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 8))(v1);
  return a1;
}

BOOL static Publishers.Share.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t *Publishers.Share.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 104));
  return v0;
}

uint64_t Publishers.Share.__deallocating_deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 104));
  return swift_deallocClassInstance();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Publishers.Share<A>(uint64_t *a1, uint64_t *a2)
{
  return static Publishers.Share.== infix(_:_:)(*a1, *a2);
}

void specialized Publishers.Share.__allocating_init(upstream:)(uint64_t a1)
{
  swift_allocObject();
  specialized Publishers.Share.init(upstream:)(a1);
}

uint64_t method lookup function for Publishers.Share()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Publishers.Share.__allocating_init(upstream:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error)@<X0>(uint64_t (*a1)(void)@<X2>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = a1();
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t Publisher<>.min()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t result;
  uint64_t (**v15)();
  uint64_t v16;

  v9 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, a1);
  v12 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v12 + 2) = a1;
  *((_QWORD *)v12 + 3) = a2;
  *((_QWORD *)v12 + 4) = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a1);
  result = type metadata accessor for Publishers.Comparison(0, a1, a2, v13);
  v15 = (uint64_t (**)())(a4 + *(int *)(result + 36));
  *v15 = partial apply for closure #1 in Publisher<>.min();
  v15[1] = v12;
  return result;
}

uint64_t sub_18B5D67F8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher<>.min()()
{
  swift_getAssociatedTypeWitness();
  return dispatch thunk of static Comparable.< infix(_:_:)() & 1;
}

uint64_t Publishers.Comparison.init(upstream:areInIncreasingOrder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.Comparison, a6);
}

uint64_t type metadata accessor for Publishers.Comparison(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Comparison);
}

uint64_t Publisher<>.max()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t result;
  uint64_t (**v15)();
  uint64_t v16;

  v9 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, a1);
  v12 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v12 + 2) = a1;
  *((_QWORD *)v12 + 3) = a2;
  *((_QWORD *)v12 + 4) = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a1);
  result = type metadata accessor for Publishers.Comparison(0, a1, a2, v13);
  v15 = (uint64_t (**)())(a4 + *(int *)(result + 36));
  *v15 = partial apply for closure #1 in Publisher<>.max();
  v15[1] = v12;
  return result;
}

uint64_t sub_18B5D6960()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher<>.max()()
{
  swift_getAssociatedTypeWitness();
  return dispatch thunk of static Comparable.< infix(_:_:)() & 1;
}

uint64_t Publisher.min(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.Comparison, a5);
}

uint64_t Publisher.tryMin(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.TryComparison, a5);
}

uint64_t Publishers.TryComparison.init(upstream:areInIncreasingOrder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.TryComparison, a6);
}

uint64_t type metadata accessor for Publishers.TryComparison(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.TryComparison);
}

uint64_t Publisher.max(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t (**v16)(uint64_t, uint64_t);
  uint64_t v18;

  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  v14 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  *((_QWORD *)v14 + 3) = a4;
  *((_QWORD *)v14 + 4) = a1;
  *((_QWORD *)v14 + 5) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  v16 = (uint64_t (**)(uint64_t, uint64_t))(a5
                                                  + *(int *)(type metadata accessor for Publishers.Comparison(0, a3, a4, v15)+ 36));
  *v16 = partial apply for closure #1 in Publisher.max(by:);
  v16[1] = v14;
  return swift_retain();
}

uint64_t sub_18B5D6AE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher.max(by:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a2, a1) & 1;
}

uint64_t Publisher.tryMax(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t (**v16)(uint64_t, uint64_t);
  uint64_t v18;

  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  v14 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  *((_QWORD *)v14 + 3) = a4;
  *((_QWORD *)v14 + 4) = a1;
  *((_QWORD *)v14 + 5) = a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  v16 = (uint64_t (**)(uint64_t, uint64_t))(a5
                                                  + *(int *)(type metadata accessor for Publishers.TryComparison(0, a3, a4, v15)+ 36));
  *v16 = partial apply for closure #1 in Publisher.tryMax(by:);
  v16[1] = v14;
  return swift_retain();
}

uint64_t partial apply for closure #1 in Publisher.tryMax(by:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a2, a1) & 1;
}

uint64_t Publishers.Comparison.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Comparison.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.Comparison.Inner, (uint64_t)&unk_1E2176410, (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@unowned Bool));
}

void type metadata accessor for Publishers.Comparison.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.Comparison.Inner.description.getter()
{
  return 0x73697261706D6F43;
}

uint64_t Publishers.Comparison.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t AssociatedConformanceWitness;
  _QWORD v25[4];
  _QWORD v26[3];

  v25[0] = a1;
  v25[3] = a2;
  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 456);
  v25[1] = *(_QWORD *)(*v2 + 440);
  v25[2] = v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)v25 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)v25 - v15;
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](v14);
  v19 = (char *)v25 - v18;
  v20 = (uint64_t)v2 + *(_QWORD *)(v3 + 136);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v16, v20, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    (*(void (**)(char *, _QWORD, uint64_t))(v17 + 16))(v13, v25[0], AssociatedTypeWitness);
LABEL_5:
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v13, v6);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v20, v10, v6);
    swift_endAccess();
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, AssociatedTypeWitness);
  v21 = v25[0];
  (*(void (**)(_QWORD *__return_ptr, _QWORD, char *))((char *)v2 + *(_QWORD *)(*v2 + 152)))(v26, v25[0], v19);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, AssociatedTypeWitness);
  if (LOBYTE(v26[0]) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v13, v21, AssociatedTypeWitness);
    goto LABEL_5;
  }
LABEL_6:
  v22 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for PartialCompletion(0, MEMORY[0x1E0DEE9C0] + 8, v22, AssociatedConformanceWitness);
  return swift_storeEnumTagMultiPayload();
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Comparison<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.Comparison.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t Publishers.TryComparison.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.TryComparison.Inner, (uint64_t)&unk_1E21763E8, (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error));
}

uint64_t Publishers.TryComparison.Inner.description.getter()
{
  return 0x61706D6F43797254;
}

uint64_t Publishers.TryComparison.Inner.receive(newValue:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v21[0] = a1;
  v2 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = type metadata accessor for Optional();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)v21 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)v21 - v13;
  v15 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](v12);
  v17 = (char *)v21 - v16;
  v18 = (uint64_t)v1 + *(_QWORD *)(v2 + 136);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v18, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    (*(void (**)(char *, _QWORD, uint64_t))(v15 + 16))(v11, v21[0], AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v14, AssociatedTypeWitness);
    (*(void (**)(_QWORD *__return_ptr, _QWORD, char *))((char *)v1 + *(_QWORD *)(*v1 + 152)))(v22, v21[0], v17);
    v20 = v21[0];
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, AssociatedTypeWitness);
    if (LOBYTE(v22[0]) != 1)
      return 0;
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v11, v20, AssociatedTypeWitness);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v11, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v18, v8, v4);
  swift_endAccess();
  return 0;
}

uint64_t vtable thunk for ReduceProducer.receive(newValue:) dispatching to Publishers.TryComparison.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = Publishers.TryComparison.Inner.receive(newValue:)(a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryComparison<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.TryComparison.receive<A>(subscriber:)(a1, a4, a2, a3);
}

void type metadata accessor for Publishers.TryComparison.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t getEnumTagSinglePayload for Publishers.Comparison(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5D72EC + 4 * byte_18B5FB3F0[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.Comparison(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5D7464()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D74DCLL);
}

void sub_18B5D746C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5D7474);
  JUMPOUT(0x18B5D74DCLL);
}

void sub_18B5D74B4()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D74DCLL);
}

void sub_18B5D74BC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D74DCLL);
}

uint64_t sub_18B5D74C4(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x18B5D74DCLL);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x18B5D74D8);
    JUMPOUT(0x18B5D74D0);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_18B5D74F4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t Publisher.replaceNil<A>(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;
  uint64_t v15;

  v9 = *(_QWORD *)(a3 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v11);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = (char *)swift_allocObject();
  *((_QWORD *)v13 + 2) = a2;
  *((_QWORD *)v13 + 3) = a3;
  *((_QWORD *)v13 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v13[v12], v11, a3);
  Publisher.map<A>(_:)((uint64_t)partial apply for closure #1 in Publisher.replaceNil<A>(with:), (uint64_t)v13, a2, a3, a4, a5);
  return swift_release();
}

uint64_t closure #1 in Publisher.replaceNil<A>(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - v10, a1, v8);
  v12 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a3) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a4, v11, a3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a4, a2, a3);
}

uint64_t sub_18B5D76F8()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publisher.replaceNil<A>(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return closure #1 in Publisher.replaceNil<A>(with:)(a1, v2 + ((v4 + 40) & ~v4), v3, a2);
}

uint64_t Publisher.replaceEmpty(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Publisher.replaceError(with:)(a1, a2, a3, (uint64_t (*)(char *, char *, uint64_t, uint64_t))Publishers.ReplaceEmpty.init(upstream:output:));
}

uint64_t Publishers.ReplaceEmpty.init(upstream:output:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publishers.ReplaceError.init(upstream:output:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceEmpty, a5);
}

uint64_t type metadata accessor for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.ReplaceEmpty);
}

void Publishers.ReplaceEmpty.receive<A>(subscriber:)()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  MEMORY[0x1E0C80A78](v1);
  type metadata accessor for Publishers.ReplaceEmpty.Inner();
}

uint64_t sub_18B5D785C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v8, *(_QWORD *)(v9 - 128), v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v7, *(_QWORD *)(v9 - 120), v6);
  swift_allocObject();
  *(_QWORD *)(v9 - 112) = Publishers.ReplaceEmpty.Inner.init(downstream:output:)(v8, v7);
  v11 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.ReplaceEmpty<A>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v9 - 112, v3, a1, v1, v11);
  return swift_release();
}

void type metadata accessor for Publishers.ReplaceEmpty.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  return Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t))Publishers.ReplaceEmpty.Inner.init(downstream:output:));
}

void Publishers.ReplaceEmpty.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
  strcpy((char *)a1, "ReplaceEmpty");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t *Publishers.ReplaceEmpty.Inner.init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;

  v5 = *v2;
  *((_BYTE *)v2 + *(_QWORD *)(*v2 + 128)) = 0;
  v6 = *(_QWORD *)(*v2 + 136);
  v7 = (_DWORD *)swift_slowAlloc();
  *v7 = 0;
  *(uint64_t *)((char *)v2 + v6) = (uint64_t)v7;
  *((_BYTE *)v2 + *(_QWORD *)(*v2 + 144)) = 0;
  *((_BYTE *)v2 + *(_QWORD *)(*v2 + 152)) = 0;
  v8 = (uint64_t)v2 + *(_QWORD *)(*v2 + 160);
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_BYTE *)(v8 + 40) = 2;
  v9 = (uint64_t)v2 + *(_QWORD *)(*v2 + 112);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v9, a2, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 88) - 8) + 32))((uint64_t)v2 + *(_QWORD *)(*v2 + 120), a1);
  return v2;
}

uint64_t *Publishers.ReplaceEmpty.Inner.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;

  v1 = *v0;
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 136)), -1, -1);
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 112);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v2, AssociatedTypeWitness);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 120));
  outlined destroy of SubscriptionStatus((uint64_t)v0 + *(_QWORD *)(*v0 + 160));
  return v0;
}

uint64_t Publishers.ReplaceEmpty.Inner.__deallocating_deinit()
{
  return Publishers.DropWhile.Inner.__deallocating_deinit((void (*)(void))Publishers.ReplaceEmpty.Inner.deinit);
}

uint64_t Publishers.ReplaceEmpty.Inner.receive(subscription:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  int8x16_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void (*v11)(uint64_t **, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  int8x16_t v16;
  int8x16_t v17;
  char v18;

  v3 = *v1;
  v4 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(*v1 + 136));
  os_unfair_lock_lock(v4);
  v5 = (uint64_t)v1 + *(_QWORD *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v15);
  if (v18 == 2
    && (v6 = vorrq_s8(v16, v17),
        !(*(_QWORD *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | (unint64_t)v15)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v15);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v15);
    v18 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v15, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v17.i64[0] = v3;
    v17.i64[1] = (uint64_t)&protocol witness table for Publishers.ReplaceEmpty<A>.Inner<A1>;
    v15 = v1;
    v10 = *(_QWORD *)(v3 + 104);
    v11 = *(void (**)(uint64_t **, uint64_t, uint64_t))(v10 + 40);
    v12 = *(_QWORD *)(v3 + 88);
    swift_retain();
    v11(&v15, v12, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
    v13 = a1[3];
    v14 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v13);
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v14 + 24))(0x8000000000000000, v13, v14);
  }
  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v15);
    os_unfair_lock_unlock(v4);
    v8 = a1[3];
    v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v8);
  }
}

uint64_t Publishers.ReplaceEmpty.Inner.receive(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  _BYTE v7[48];

  v3 = *v1;
  v4 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(*v1 + 136));
  os_unfair_lock_lock(v4);
  v5 = (uint64_t)v1 + *(_QWORD *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v7);
  LODWORD(v5) = v7[40];
  outlined destroy of SubscriptionStatus((uint64_t)v7);
  if ((_DWORD)v5)
  {
    os_unfair_lock_unlock(v4);
    return 0;
  }
  else
  {
    *((_BYTE *)v1 + *(_QWORD *)(*v1 + 128)) = 1;
    os_unfair_lock_unlock(v4);
    return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 104) + 48))(a1, *(_QWORD *)(v3 + 88));
  }
}

void Publishers.ReplaceEmpty.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  char *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  int v14;
  os_unfair_lock_s *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  os_unfair_lock_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  unsigned __int8 v38;

  v34 = a1;
  v2 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v6 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  v33 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v28 - v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v11 = (char *)&v28 - v10;
  v12 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(v2 + 136));
  os_unfair_lock_lock(v12);
  v13 = (uint64_t)v1 + *(_QWORD *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v13, (uint64_t)&v35);
  v14 = v38;
  outlined destroy of SubscriptionStatus((uint64_t)&v35);
  if (v14)
  {
    v15 = v12;
LABEL_3:
    os_unfair_lock_unlock(v15);
    return;
  }
  v31 = v2;
  v32 = v12;
  v29 = v11;
  v30 = AssociatedTypeWitness;
  v28 = v8;
  v35 = 1;
  v36 = 0u;
  v37 = 0u;
  v38 = 2;
  swift_beginAccess();
  outlined assign with take of SubscriptionStatus((uint64_t)&v35, v13);
  swift_endAccess();
  if (*((_BYTE *)v1 + *(_QWORD *)(*v1 + 128)) == 1)
  {
    os_unfair_lock_unlock(v32);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v31 + 104) + 56))(v34, *(_QWORD *)(v31 + 88));
  }
  else
  {
    v16 = *((unsigned __int8 *)v1 + *(_QWORD *)(*v1 + 144));
    v17 = *(int *)(TupleTypeMetadata2 + 48);
    v18 = v33;
    v19 = v34;
    v20 = v29;
    v21 = v6;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v29, v34, v6);
    v20[v17] = v16;
    v22 = v30;
    v23 = *(_QWORD *)(v30 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v30) == 1)
    {
      if (!v16)
      {
        *((_BYTE *)v1 + *(_QWORD *)(*v1 + 152)) = 1;
        v15 = v32;
        goto LABEL_3;
      }
      os_unfair_lock_unlock(v32);
      v24 = *(_QWORD *)(v31 + 104);
      v25 = *(_QWORD *)(v31 + 88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))((uint64_t)v1 + *(_QWORD *)(*v1 + 112), v25, v24);
      v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
      v27 = v28;
      v26(v28, 1, 1, v22);
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 56))(v27, v25, v24);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v21);
    }
    else
    {
      os_unfair_lock_unlock(v32);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v31 + 104) + 56))(v19, *(_QWORD *)(v31 + 88));
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v21);
    }
  }
}

void Publishers.ReplaceEmpty.Inner.cancel()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  char v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v1 = *(os_unfair_lock_s **)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136));
  os_unfair_lock_lock(v1);
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(v1);
  }
  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    v5 = 1;
    v6 = 0u;
    v7 = 0u;
    v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    v3 = v10;
    v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 8))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
}

void Publishers.ReplaceEmpty.Inner.request(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17[2];
  char v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v3 = *(_QWORD **)v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v7 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v17 - v9;
  if (a1 == 0x8000000000000000)
    goto LABEL_4;
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (!a1)
  {
LABEL_11:
    __break(1u);
    return;
  }
LABEL_4:
  v11 = *(os_unfair_lock_s **)(v1 + v3[17]);
  os_unfair_lock_lock(v11);
  if (*(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152)) == 1)
  {
    os_unfair_lock_unlock(v11);
    v12 = v3[13];
    v13 = v3[11];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 112), v13, v12);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v10, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 56))(v10, v13, v12);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v14 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 160);
    swift_beginAccess();
    outlined init with copy of SubscriptionStatus(v14, (uint64_t)v17);
    if (v18)
    {
      outlined destroy of SubscriptionStatus((uint64_t)v17);
      *(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 144)) = 1;
      os_unfair_lock_unlock(v11);
    }
    else
    {
      outlined init with take of Subscription(v17, (uint64_t)v19);
      *(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 144)) = 1;
      os_unfair_lock_unlock(v11);
      v15 = v20;
      v16 = v21;
      __swift_project_boxed_opaque_existential_1(v19, v20);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 24))(a1, v15, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    }
  }
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>(_QWORD *a1)
{
  return Publishers.ReplaceEmpty.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>(uint64_t a1)
{
  return Publishers.ReplaceEmpty.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>(uint64_t a1)
{
  Publishers.ReplaceEmpty.Inner.receive(completion:)(a1);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.ReplaceEmpty<A>.Inner<A1>(uint64_t a1)
{
  Publishers.ReplaceEmpty.Inner.request(_:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.ReplaceEmpty<A>.Inner<A1>()
{
  return 0x456563616C706552;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.ReplaceEmpty<A>.Inner<A1>(uint64_t a1@<X8>)
{
  Publishers.ReplaceEmpty.Inner.playgroundDescription.getter(a1);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.ReplaceEmpty<A>.Inner<A1>()
{
  Publishers.ReplaceEmpty.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.ReplaceEmpty<A>()
{
  Publishers.ReplaceEmpty.receive<A>(subscriber:)();
}

uint64_t Publishers.ReplaceEmpty.output.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v1, AssociatedTypeWitness);
}

uint64_t Publishers.ReplaceEmpty.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

uint64_t Publishers.ReplaceError.Inner.__allocating_init(downstream:output:)(uint64_t a1, uint64_t a2)
{
  return Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t))Publishers.ReplaceError.Inner.init(downstream:output:));
}

uint64_t Publishers.ReplaceEmpty.Inner.__allocating_init(downstream:output:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  swift_allocObject();
  return a3(a1, a2);
}

void Publishers.ReplaceError.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
  strcpy((char *)a1, "ReplaceError");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.ReplaceError<A>.Inner<A1>()
{
  return 0x456563616C706552;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.ReplaceError<A>.Inner<A1>(uint64_t a1@<X8>)
{
  Publishers.ReplaceError.Inner.playgroundDescription.getter(a1);
}

uint64_t static Publishers.ReplaceEmpty<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static Publishers.ReplaceEmpty<>.== infix(_:_:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceEmpty);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.ReplaceEmpty<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static Publishers.ReplaceEmpty<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), *(_QWORD *)(a4 - 8), *(_QWORD *)(a4 - 16));
}

uint64_t static Publishers.ReplaceError<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static Publishers.ReplaceEmpty<>.== infix(_:_:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.ReplaceError);
}

uint64_t static Publishers.ReplaceEmpty<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  _QWORD v21[2];

  v21[1] = a6;
  v9 = a7(0, a3, a4);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v21 - v14;
  v16 = dispatch thunk of static Equatable.== infix(_:_:)();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v17(v15, a1, v9);
  v17(v13, a2, v9);
  if ((v16 & 1) != 0)
  {
    swift_getAssociatedTypeWitness();
    v18 = dispatch thunk of static Equatable.== infix(_:_:)();
  }
  else
  {
    v18 = 0;
  }
  v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  v19(v15, v9);
  return v18 & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.ReplaceError<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static Publishers.ReplaceError<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), *(_QWORD *)(a4 - 8), *(_QWORD *)(a4 - 16));
}

uint64_t type metadata completion function for Publishers.ReplaceEmpty.Inner()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.ReplaceEmpty(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_QWORD *)(v5 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = *(_QWORD *)(v7 + 64) + v9;
  v11 = (*(_BYTE *)(v7 + 80) | *(_BYTE *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || (v10 & (unint64_t)~v9) + *(_QWORD *)(v8 + 64) > 0x18)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    v15 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v15, ((unint64_t)a2 + v10) & v15, v5);
  }
  return a1;
}

uint64_t assignWithCopy for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t initializeWithTake for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t assignWithTake for Publishers.ReplaceEmpty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, AssociatedTypeWitness);
  v8 = *(_QWORD *)(v5 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.ReplaceEmpty(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int v18;
  int v19;

  v5 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (!a2)
    return 0;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = *(_QWORD *)(v7 + 64) + v12;
  if (a2 <= v11)
    goto LABEL_23;
  v14 = (v13 & ~v12) + *(_QWORD *)(v9 + 64);
  v15 = 8 * v14;
  if (v14 <= 3)
  {
    v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      v16 = *(_DWORD *)(a1 + v14);
      if (!v16)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      v16 = *(unsigned __int16 *)(a1 + v14);
      if (!*(_WORD *)(a1 + v14))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_23:
      if (v11)
      {
        if (v8 >= v10)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), AssociatedTypeWitness);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))((v13 + a1) & ~v12, v10, v5);
      }
      return 0;
    }
  }
  v16 = *(unsigned __int8 *)(a1 + v14);
  if (!*(_BYTE *)(a1 + v14))
    goto LABEL_23;
LABEL_14:
  v18 = (v16 - 1) << v15;
  if (v14 > 3)
    v18 = 0;
  if ((_DWORD)v14)
  {
    if (v14 <= 3)
      v19 = (v13 & ~(_DWORD)v12) + *(_DWORD *)(v9 + 64);
    else
      v19 = 4;
    __asm { BR              X12 }
  }
  return v11 + v18 + 1;
}

void storeEnumTagSinglePayload for Publishers.ReplaceEmpty(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  v7 = *(_QWORD *)(a4 + 16);
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v9 = *(_QWORD *)(v7 - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = ((*(_QWORD *)(v8 + 64) + v11) & ~v11) + *(_QWORD *)(v9 + 64);
  if (a3 <= v10)
  {
    v13 = 0u;
  }
  else if (v12 <= 3)
  {
    v15 = ((a3 - v10 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v13 = 4u;
    }
    else if (v15 >= 0x100)
    {
      v13 = 2;
    }
    else
    {
      v13 = v15 > 1;
    }
  }
  else
  {
    v13 = 1u;
  }
  if (v10 < a2)
  {
    v14 = ~v10 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        v16 = v14 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, ((*(_QWORD *)(v8 + 64) + v11) & ~v11) + *(_QWORD *)(v9 + 64));
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

uint64_t Publisher.assertNoFailure(_:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v27 = a6;
  HIDWORD(v26) = a5;
  v17 = *(_QWORD *)(a7 - 8);
  MEMORY[0x1E0C80A78](a1);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v9, v20);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a9, v19, a7);
  v22 = (int *)type metadata accessor for Publishers.AssertNoFailure(0, a7, a8, v21);
  v23 = (_QWORD *)(a9 + v22[9]);
  *v23 = a1;
  v23[1] = a2;
  v24 = a9 + v22[10];
  *(_QWORD *)v24 = a3;
  *(_QWORD *)(v24 + 8) = a4;
  *(_BYTE *)(v24 + 16) = BYTE4(v26);
  *(_QWORD *)(a9 + v22[11]) = v27;
  return swift_bridgeObjectRetain();
}

int *Publishers.AssertNoFailure.init(upstream:prefix:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v18;
  int *result;
  _QWORD *v20;
  uint64_t v21;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(a9, a1, a8);
  result = (int *)type metadata accessor for Publishers.AssertNoFailure(0, a8, a10, v18);
  v20 = (_QWORD *)(a9 + result[9]);
  *v20 = a2;
  v20[1] = a3;
  v21 = a9 + result[10];
  *(_QWORD *)v21 = a4;
  *(_QWORD *)(v21 + 8) = a5;
  *(_BYTE *)(v21 + 16) = a6;
  *(_QWORD *)(a9 + result[11]) = a7;
  return result;
}

uint64_t type metadata accessor for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.AssertNoFailure);
}

uint64_t Publishers.AssertNoFailure.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.AssertNoFailure.prefix.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t Publishers.AssertNoFailure.file.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 40));
}

uint64_t Publishers.AssertNoFailure.line.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 44));
}

void Publishers.AssertNoFailure.receive<A>(subscriber:)(uint64_t a1)
{
  MEMORY[0x1E0C80A78](a1);
  type metadata accessor for Publishers.AssertNoFailure.Inner();
}

void sub_18B5D9148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;

  *(_QWORD *)(v15 - 120) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v17 = (char *)&a9 - v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v14, v13, v11);
  *(_QWORD *)(v15 - 152) = *(_QWORD *)(v10 + *(int *)(v12 + 40) + 8);
  *(_QWORD *)(v15 - 144) = v10;
  swift_bridgeObjectRetain();
  Publishers.AssertNoFailure.Inner.init(downstream:prefix:file:line:)(v14, (uint64_t)v17, v11);
}

uint64_t sub_18B5D91F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.AssertNoFailure<A>.Inner<A1>, v2);
  Publisher.subscribe<A>(_:)(v3, v0, v2, v1, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v3, v2);
}

void type metadata accessor for Publishers.AssertNoFailure.Inner()
{
  JUMPOUT(0x18D77AC60);
}

void Publishers.AssertNoFailure.Inner.init(downstream:prefix:file:line:)(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a2, a1, a3);
  type metadata accessor for Publishers.AssertNoFailure.Inner();
}

void sub_18B5D92D8(int *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = (_QWORD *)(v1 + a1[13]);
  *v7 = v6;
  v7[1] = v5;
  v8 = v1 + a1[14];
  *(_QWORD *)v8 = v4;
  *(_QWORD *)(v8 + 8) = v3;
  *(_BYTE *)(v8 + 16) = v2;
  *(_QWORD *)(v1 + a1[15]) = v12;
  v9 = a1[16];
  if (one-time initialization token for lock != -1)
    swift_once();
  v10 = (os_unfair_lock_s *)static lock in Global #1 in CombineIdentifier.init();
  os_unfair_lock_lock((os_unfair_lock_t)static lock in Global #1 in CombineIdentifier.init());
  v11 = static generation in Global #1 in CombineIdentifier.init();
  if (static generation in Global #1 in CombineIdentifier.init() == -1)
  {
    __break(1u);
  }
  else
  {
    ++static generation in Global #1 in CombineIdentifier.init();
    os_unfair_lock_unlock(v10);
    *(_QWORD *)(v1 + v9) = v11;
  }
}

uint64_t Publishers.AssertNoFailure.Inner.customMirror.getter(int *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  (*(void (**)(char *, uint64_t, int *))(v11 + 16))((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_18B5F5810;
  *(_QWORD *)(v12 + 32) = 1701603686;
  *(_QWORD *)(v12 + 40) = 0xE400000000000000;
  v13 = a1[13];
  v14 = v1 + a1[14];
  v15 = *(_BYTE *)(v14 + 16);
  v16 = MEMORY[0x1E0DEC348];
  *(_OWORD *)(v12 + 48) = *(_OWORD *)v14;
  *(_BYTE *)(v12 + 64) = v15;
  v17 = *(_QWORD *)(v1 + a1[15]);
  *(_QWORD *)(v12 + 72) = v16;
  *(_QWORD *)(v12 + 80) = 1701734764;
  v18 = MEMORY[0x1E0DEBB98];
  *(_QWORD *)(v12 + 88) = 0xE400000000000000;
  *(_QWORD *)(v12 + 96) = v17;
  *(_QWORD *)(v12 + 120) = v18;
  *(_QWORD *)(v12 + 128) = 0x786966657270;
  v19 = v1 + v13;
  v20 = *(_QWORD *)(v1 + v13);
  v21 = *(_QWORD *)(v19 + 8);
  *(_QWORD *)(v12 + 168) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v12 + 136) = 0xE600000000000000;
  *(_QWORD *)(v12 + 144) = v20;
  *(_QWORD *)(v12 + 152) = v21;
  v22 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  swift_bridgeObjectRetain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.AssertNoFailure.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x6F4E747265737341;
  a1[1] = 0xEF6572756C696146;
}

uint64_t Publishers.AssertNoFailure.Inner.receive(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t result;
  _BYTE v12[15];
  char v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v7 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = &v12[-v9];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(&v12[-v9], a1, v7);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 48))(v10, 1, AssociatedTypeWitness) == 1)
  {
    v13 = 1;
    return (*(uint64_t (**)(char *, _QWORD))(*(_QWORD *)(a2 + 40) + 56))(&v13, *(_QWORD *)(a2 + 24));
  }
  else
  {
    result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.AssertNoFailure<A>.Inner<A1>()
{
  return 0x6F4E747265737341;
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.AssertNoFailure<A>(uint64_t a1)
{
  Publishers.AssertNoFailure.receive<A>(subscriber:)(a1);
}

uint64_t type metadata completion function for Publishers.AssertNoFailure()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.AssertNoFailure(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    v14 = *(_OWORD *)v13;
    *(_BYTE *)(v12 + 16) = *(_BYTE *)(v13 + 16);
    *(_OWORD *)v12 = v14;
    *(_QWORD *)(((unint64_t)v10 + 47) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v11 + 47) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_BYTE *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = v11;
  *(_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = *(_QWORD *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t initializeWithTake for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(_OWORD *)v9 = v11;
  *(_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for Publishers.AssertNoFailure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = *(_QWORD *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.AssertNoFailure(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5D9BEC + 4 * byte_18B5FB818[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.AssertNoFailure(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5D9D6C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D9DE4);
}

void sub_18B5D9D74(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5D9D7CLL);
  JUMPOUT(0x18B5D9DE4);
}

void sub_18B5D9DC0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D9DE4);
}

void sub_18B5D9DC8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5D9DE4);
}

uint64_t sub_18B5D9DD0(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x18B5D9DDCLL);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x18B5D9DE4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata completion function for Publishers.AssertNoFailure.Inner()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.AssertNoFailure.Inner(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  _QWORD *v15;
  _QWORD *v16;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v10[1] = v11[1];
    v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    v14 = *(_OWORD *)v13;
    *(_BYTE *)(v12 + 16) = *(_BYTE *)(v13 + 16);
    *(_OWORD *)v12 = v14;
    v15 = (_QWORD *)(((unint64_t)v10 + 47) & 0xFFFFFFFFFFFFF8);
    v16 = (_QWORD *)(((unint64_t)v11 + 47) & 0xFFFFFFFFFFFFF8);
    *v15 = *v16;
    *(_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  _QWORD *v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_BYTE *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = v11;
  v12 = (_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  *v12 = *v13;
  *(_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = *(_QWORD *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  v11 = (_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  *v11 = *v12;
  *(_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t initializeWithTake for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  _QWORD *v12;
  _QWORD *v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  *(_OWORD *)v9 = v11;
  v12 = (_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  *v12 = *v13;
  *(_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v13 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for Publishers.AssertNoFailure.Inner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = *(_QWORD *)(v10 + 8);
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  v11 = (_QWORD *)(((unint64_t)v7 + 47) & 0xFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v8 + 47) & 0xFFFFFFFFFFFFF8);
  *v11 = *v12;
  *(_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.AssertNoFailure.Inner(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5DA340 + 4 * byte_18B5FB827[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.AssertNoFailure.Inner(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 47) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5DA4C8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5DA540);
}

void sub_18B5DA4D0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5DA4D8);
  JUMPOUT(0x18B5DA540);
}

void sub_18B5DA51C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5DA540);
}

void sub_18B5DA524()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5DA540);
}

uint64_t sub_18B5DA52C(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x18B5DA538);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x18B5DA540);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

void Publisher.drop<A>(untilOutputFrom:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21 = a5;
  v12 = *(_QWORD *)(a3 - 8);
  v13 = MEMORY[0x1E0C80A78](a1);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v13);
  v19 = (char *)&v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a2);
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = v21;
  type metadata accessor for Publishers.DropUntilOutput();
}

uint64_t sub_18B5DA63C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

void Publishers.DropUntilOutput.init(upstream:other:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
  type metadata accessor for Publishers.DropUntilOutput();
}

uint64_t sub_18B5DA6CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v3 + *(int *)(a1 + 52), v2, v1);
}

void type metadata accessor for Publishers.DropUntilOutput()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.DropUntilOutput.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.DropUntilOutput.other.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

void Publishers.DropUntilOutput.receive<A>(subscriber:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[0] = a1;
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v5 + 16))((char *)v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6[1] = v2 + *(int *)(a2 + 52);
  specialized Publishers.DropUntilOutput.Inner.__allocating_init(downstream:other:)();
}

void sub_18B5DA7EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 144) = v0;
  *(_QWORD *)(v6 - 136) = v4;
  *(_QWORD *)(v6 - 128) = v3;
  *(_QWORD *)(v6 - 120) = v4;
  *(_QWORD *)(v6 - 112) = v1;
  *(_QWORD *)(v6 - 104) = v5;
  *(_QWORD *)(v6 - 96) = v2;
  *(_QWORD *)(v6 - 88) = v5;
  type metadata accessor for Publishers.DropUntilOutput.Inner();
}

void sub_18B5DA810(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v8 - 120) = a1;
  *(_QWORD *)(v8 - 112) = &protocol witness table for Publishers.DropUntilOutput<A, B>.Inner<A1, B1>;
  *(_QWORD *)(v8 - 144) = v3;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  swift_retain_n();
  v9(v8 - 144, v5, v4);
  __swift_destroy_boxed_opaque_existential_1(v8 - 144);
  *(_QWORD *)(v8 - 152) = v3;
  *(_QWORD *)(v8 - 144) = v1;
  *(_QWORD *)(v8 - 136) = v6;
  *(_QWORD *)(v8 - 128) = v5;
  *(_QWORD *)(v8 - 120) = v6;
  *(_QWORD *)(v8 - 112) = v2;
  *(_QWORD *)(v8 - 104) = v7;
  *(_QWORD *)(v8 - 96) = v4;
  *(_QWORD *)(v8 - 88) = v7;
  type metadata accessor for Publishers.DropUntilOutput.Inner.OtherSubscriber();
}

uint64_t sub_18B5DA870(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v9 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber, a1);
  Publisher.subscribe<A>(_:)(v7 - 152, v5, a1, v6, v9);
  *(_QWORD *)(v7 - 144) = v3;
  v10 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.DropUntilOutput<A, B>.Inner<A1, B1>, v4);
  Publisher.subscribe<A>(_:)(v7 - 144, v1, v4, v2, v10);
  return swift_release_n();
}

void Publishers.DropUntilOutput.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x69746E55706F7244;
  a1[1] = 0xEF74757074754F6CLL;
}

uint64_t *Publishers.DropUntilOutput.Inner.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 160)), -1, -1);
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 168)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 144));
  outlined destroy of Subscription?((uint64_t)v0 + *(_QWORD *)(*v0 + 176));
  outlined destroy of Subscription?((uint64_t)v0 + *(_QWORD *)(*v0 + 192));
  return v0;
}

uint64_t Publishers.DropUntilOutput.Inner.__deallocating_deinit()
{
  Publishers.DropUntilOutput.Inner.deinit();
  return swift_deallocClassInstance();
}

uint64_t Publishers.DropUntilOutput.Inner.cancel()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[40];
  _BYTE v15[40];

  v1 = *(os_unfair_lock_s **)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 160));
  os_unfair_lock_lock(v1);
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 176);
  swift_beginAccess();
  outlined init with copy of Subscription?(v2, (uint64_t)v15);
  v3 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 192);
  swift_beginAccess();
  outlined init with copy of Subscription?(v3, (uint64_t)v14);
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v11, v2);
  swift_endAccess();
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v11, v3);
  swift_endAccess();
  *(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 208)) = 1;
  os_unfair_lock_unlock(v1);
  outlined init with copy of Subscription?((uint64_t)v15, (uint64_t)&v9);
  if (v10)
  {
    outlined init with take of Subscription(&v9, (uint64_t)&v11);
    v4 = *((_QWORD *)&v12 + 1);
    v5 = v13;
    __swift_project_boxed_opaque_existential_1(&v11, *((uint64_t *)&v12 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 8))(v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)&v9);
  }
  outlined init with copy of Subscription?((uint64_t)v14, (uint64_t)&v9);
  if (v10)
  {
    outlined init with take of Subscription(&v9, (uint64_t)&v11);
    v6 = *((_QWORD *)&v12 + 1);
    v7 = v13;
    __swift_project_boxed_opaque_existential_1(&v11, *((uint64_t *)&v12 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v6);
    outlined destroy of Subscription?((uint64_t)v14);
    outlined destroy of Subscription?((uint64_t)v15);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)v14);
    outlined destroy of Subscription?((uint64_t)v15);
    return outlined destroy of Subscription?((uint64_t)&v9);
  }
}

void Publishers.DropUntilOutput.Inner.request(_:)(uint64_t a1)
{
  uint64_t *v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v3 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(*v1 + 160));
  os_unfair_lock_lock(v3);
  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 184);
  v6 = *(uint64_t *)((char *)v1 + v5);
  v7 = 0x8000000000000000;
  if (v6 == 0x8000000000000000)
    goto LABEL_9;
  if (a1 != 0x8000000000000000)
  {
    if ((v6 | a1) < 0)
    {
      __break(1u);
      goto LABEL_14;
    }
    v7 = v6 + a1;
    if (!__OFADD__(v6, a1))
    {
      if ((v7 & 0x8000000000000000) == 0)
        goto LABEL_8;
LABEL_14:
      __break(1u);
      return;
    }
    v7 = 0x8000000000000000;
  }
LABEL_8:
  *(uint64_t *)((char *)v1 + v5) = v7;
  v4 = *v1;
LABEL_9:
  v8 = (uint64_t)v1 + *(_QWORD *)(v4 + 176);
  swift_beginAccess();
  outlined init with copy of Subscription?(v8, (uint64_t)&v11);
  if (v12)
  {
    outlined init with take of Subscription(&v11, (uint64_t)v13);
    os_unfair_lock_unlock(v3);
    v9 = v14;
    v10 = v15;
    __swift_project_boxed_opaque_existential_1(v13, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(a1, v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)&v11);
    os_unfair_lock_unlock(v3);
  }
}

void Publishers.DropUntilOutput.Inner.receive(subscription:)(_QWORD *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;

  v3 = *(os_unfair_lock_s **)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 160));
  os_unfair_lock_lock(v3);
  v4 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  outlined init with copy of Subscription?(v4, (uint64_t)v11);
  v5 = v12;
  outlined destroy of Subscription?((uint64_t)v11);
  if (!v5 && (*(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 208)) & 1) == 0)
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v11, v4);
    swift_endAccess();
    v8 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 184));
    if (v8 != 0x8000000000000000)
    {
      if (v8 < 0)
      {
        __break(1u);
        return;
      }
      if (!v8)
      {
        os_unfair_lock_unlock(v3);
        return;
      }
    }
    os_unfair_lock_unlock(v3);
    v9 = a1[3];
    v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v8, v9, v10);
    return;
  }
  os_unfair_lock_unlock(v3);
  v7 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 8))(v7);
}

void Publishers.DropUntilOutput.Inner.receive(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(*v1 + 160));
  os_unfair_lock_lock(v4);
  v5 = *v1;
  if (*((_BYTE *)v1 + *(_QWORD *)(*v1 + 152)) == 1 && (*((_BYTE *)v1 + *(_QWORD *)(v5 + 208)) & 1) == 0)
  {
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 128) + 48))(a1, *(_QWORD *)(v3 + 96));
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    v6 = *(_QWORD *)(v5 + 184);
    v7 = *(uint64_t *)((char *)v1 + v6);
    if (v7 == 0x8000000000000000)
    {
LABEL_7:
      os_unfair_lock_unlock(v4);
      return;
    }
    if (v7 < 0)
    {
      __break(1u);
    }
    else if (v7)
    {
      *(uint64_t *)((char *)v1 + v6) = v7 - 1;
      goto LABEL_7;
    }
    __break(1u);
  }
}

void Publishers.DropUntilOutput.Inner.receive(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  v3 = *v1;
  v4 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(*v1 + 160));
  os_unfair_lock_lock(v4);
  v5 = *(_QWORD *)(*v1 + 208);
  if ((*((_BYTE *)v1 + v5) & 1) != 0)
  {
    os_unfair_lock_unlock(v4);
  }
  else
  {
    *((_BYTE *)v1 + v5) = 1;
    os_unfair_lock_unlock(v4);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 128) + 56))(a1, *(_QWORD *)(v3 + 96));
    os_unfair_recursive_lock_unlock();
  }
}

void Publishers.DropUntilOutput.Inner.OtherSubscriber.combineIdentifier.getter()
{
  type metadata accessor for Publishers.DropUntilOutput.Inner();
}

void sub_18B5DAFF8()
{
  _QWORD *v0;

  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(v0);
}

uint64_t Publishers.DropUntilOutput.Inner.OtherSubscriber.customMirror.getter()
{
  return Publishers.Multicast.Inner.customMirror.getter();
}

uint64_t Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(subscription:)(_QWORD *a1)
{
  return Publishers.DropUntilOutput.Inner.receiveOther(subscription:)(a1);
}

uint64_t Publishers.DropUntilOutput.Inner.receiveOther(subscription:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 192);
  swift_beginAccess();
  outlined init with copy of Subscription?(v3, (uint64_t)v10);
  v4 = v11;
  outlined destroy of Subscription?((uint64_t)v10);
  if (v4)
  {
    v6 = a1[3];
    v5 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 8))(v6);
  }
  else
  {
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)v10);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)v10, v3);
    swift_endAccess();
    v8 = a1[3];
    v9 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(1, v8, v9);
  }
}

uint64_t Publishers.DropUntilOutput.Inner.receiveOther()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  _OWORD v4[2];
  uint64_t v5;

  v1 = *(os_unfair_lock_s **)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 160));
  os_unfair_lock_lock(v1);
  *(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152)) = 1;
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 192);
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)v4, v2);
  swift_endAccess();
  os_unfair_lock_unlock(v1);
  return 0;
}

void Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(completion:)(uint64_t a1)
{
  Publishers.DropUntilOutput.Inner.receiveOther(completion:)(a1);
}

void Publishers.DropUntilOutput.Inner.receiveOther(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v2 = v1;
  v4 = *v1;
  v5 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(*v1 + 160));
  os_unfair_lock_lock(v5);
  v6 = *v2;
  if (*((_BYTE *)v2 + *(_QWORD *)(*v2 + 152)) == 1)
  {
    v16 = 0;
    v14 = 0u;
    v15 = 0u;
    v7 = (uint64_t)v2 + *(_QWORD *)(v6 + 192);
    swift_beginAccess();
    outlined assign with take of Subscription?((uint64_t)&v14, v7);
    swift_endAccess();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    *((_BYTE *)v2 + *(_QWORD *)(v6 + 200)) = 1;
    v8 = (uint64_t)v2 + *(_QWORD *)(*v2 + 176);
    swift_beginAccess();
    outlined init with copy of Subscription?(v8, (uint64_t)&v11);
    if (*((_QWORD *)&v12 + 1))
    {
      outlined init with take of Subscription(&v11, (uint64_t)&v14);
      v13 = 0;
      v11 = 0u;
      v12 = 0u;
      swift_beginAccess();
      outlined assign with take of Subscription?((uint64_t)&v11, v8);
      swift_endAccess();
      os_unfair_lock_unlock(v5);
      v10 = *((_QWORD *)&v15 + 1);
      v9 = v16;
      __swift_project_boxed_opaque_existential_1(&v14, *((uint64_t *)&v15 + 1));
      (*(void (**)(uint64_t))(*(_QWORD *)(v9 + 8) + 8))(v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
    }
    else
    {
      outlined destroy of Subscription?((uint64_t)&v11);
      os_unfair_lock_unlock(v5);
    }
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 + 128) + 56))(a1, *(_QWORD *)(v4 + 96));
    os_unfair_recursive_lock_unlock();
  }
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber(_QWORD *a1)
{
  return Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  return specialized Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(_:)();
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber(uint64_t a1)
{
  Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(completion:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  return 0x69746E55706F7244;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  return Publishers.DropUntilOutput.Inner.OtherSubscriber.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber(_QWORD *a1@<X8>)
{
  Publishers.DropUntilOutput.Inner.playgroundDescription.getter(a1);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>.OtherSubscriber()
{
  Publishers.DropUntilOutput.Inner.OtherSubscriber.combineIdentifier.getter();
}

void protocol witness for Subscriber.receive(subscription:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>(_QWORD *a1)
{
  Publishers.DropUntilOutput.Inner.receive(subscription:)(a1);
}

void protocol witness for Subscriber.receive(_:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>(uint64_t a1)
{
  Publishers.DropUntilOutput.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>(uint64_t a1)
{
  Publishers.DropUntilOutput.Inner.receive(completion:)(a1);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>(uint64_t a1)
{
  Publishers.DropUntilOutput.Inner.request(_:)(a1);
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>(_QWORD *a1@<X8>)
{
  Publishers.DropUntilOutput.Inner.playgroundDescription.getter(a1);
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.DropUntilOutput<A, B>.Inner<A1, B1>()
{
  return Publishers.DropUntilOutput.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.DropUntilOutput<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Publishers.DropUntilOutput.receive<A>(subscriber:)(a1, a4);
}

void static Publishers.DropUntilOutput<>.== infix(_:_:)()
{
  type metadata accessor for Publishers.DropUntilOutput();
}

uint64_t sub_18B5DB638(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  char v10;
  void (*v11)(_BYTE *, uint64_t, uint64_t);
  char v12;
  void (*v13)(_BYTE *, uint64_t);
  _BYTE v15[96];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v15[-v8];
  v10 = dispatch thunk of static Equatable.== infix(_:_:)();
  v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v2, a1);
  v11(v7, v1, a1);
  if ((v10 & 1) != 0)
    v12 = dispatch thunk of static Equatable.== infix(_:_:)();
  else
    v12 = 0;
  v13 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v13(v9, a1);
  return v12 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.DropUntilOutput<A, B>()
{
  static Publishers.DropUntilOutput<>.== infix(_:_:)();
}

uint64_t specialized Publishers.DropUntilOutput.Inner.OtherSubscriber.receive(_:)()
{
  return Publishers.DropUntilOutput.Inner.receiveOther()();
}

uint64_t *specialized Publishers.DropUntilOutput.Inner.init(downstream:other:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  *((_BYTE *)v1 + *(_QWORD *)(*v1 + 152)) = 0;
  v4 = *(_QWORD *)(*v1 + 160);
  v5 = (_DWORD *)swift_slowAlloc();
  *v5 = 0;
  *(uint64_t *)((char *)v1 + v4) = (uint64_t)v5;
  v6 = *(_QWORD *)(*v1 + 168);
  v7 = (_QWORD *)swift_slowAlloc();
  *v7 = 0;
  *(uint64_t *)((char *)v1 + v6) = (uint64_t)v7;
  v8 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 184)) = 0;
  v9 = (uint64_t)v1 + *(_QWORD *)(*v1 + 192);
  *(_OWORD *)v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_QWORD *)(v9 + 32) = 0;
  *((_BYTE *)v1 + *(_QWORD *)(*v1 + 200)) = 0;
  *((_BYTE *)v1 + *(_QWORD *)(*v1 + 208)) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 96) - 8) + 32))((uint64_t)v1 + *(_QWORD *)(*v1 + 144), a1);
  return v1;
}

void specialized Publishers.DropUntilOutput.Inner.__allocating_init(downstream:other:)()
{
  type metadata accessor for Publishers.DropUntilOutput.Inner();
}

uint64_t *sub_18B5DB870()
{
  uint64_t v0;

  swift_allocObject();
  return specialized Publishers.DropUntilOutput.Inner.init(downstream:other:)(v0);
}

void type metadata accessor for Publishers.DropUntilOutput.Inner()
{
  JUMPOUT(0x18D77AC60);
}

void type metadata accessor for Publishers.DropUntilOutput.Inner.OtherSubscriber()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t getEnumTagSinglePayload for Publishers.DropUntilOutput(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5DB98C + 4 * byte_18B5FB988[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.DropUntilOutput(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
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
  }
  else
  {
    v9 = 0u;
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
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
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
  __asm { BR              X16 }
}

uint64_t type metadata completion function for Publishers.DropUntilOutput.Inner()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t Publishers.HandleEvents.init(upstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int *v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t result;

  v18 = (int *)type metadata accessor for Publishers.HandleEvents(0, a13, a14, a4);
  v19 = (_QWORD *)(a9 + v18[9]);
  v20 = (uint64_t *)(a9 + v18[10]);
  v21 = (_QWORD *)(a9 + v18[11]);
  v22 = (_QWORD *)(a9 + v18[12]);
  v23 = (_QWORD *)(a9 + v18[13]);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a13 - 8) + 32))(a9, a1, a13);
  *v19 = a2;
  v19[1] = a3;
  *v20 = a4;
  v20[1] = a5;
  *v21 = a6;
  v21[1] = a7;
  *v22 = a8;
  v22[1] = a10;
  *v23 = a11;
  v23[1] = a12;
  return result;
}

uint64_t Publishers.HandleEvents.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t key path getter for Publishers.HandleEvents.receiveSubscription : <A>Publishers.HandleEvents<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)(uint64_t a1)@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  v6 = (uint64_t *)(a1
                 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, *(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 8), a4)+ 36));
  v7 = *v6;
  v8 = v6[1];
  if (*v6)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = _s7Combine12Subscription_pytIegnr_AaB_pIegn_TRTA_0;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  *a5 = v10;
  a5[1] = (uint64_t (*)(uint64_t))v9;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
}

uint64_t key path setter for Publishers.HandleEvents.receiveSubscription : <A>Publishers.HandleEvents<A>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  v8 = a1[1];
  if (*a1)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = _s7Combine12Subscription_pytIegnr_AaB_pIegn_TRTA_0;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v5, v6, a4) + 36));
  v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  *v11 = (uint64_t)v10;
  v11[1] = v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveSubscription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveSubscription.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t result;

  v6 = (uint64_t *)(v3 + *(int *)(a3 + 36));
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveSubscription.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveOutput : <A>Publishers.HandleEvents<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  uint64_t (*v12)();

  v6 = *(_QWORD *)(a3 + a2 - 16);
  v7 = *(_QWORD *)(a3 + a2 - 8);
  v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v6, v7, a4) + 40));
  v9 = *v8;
  v10 = v8[1];
  if (*v8)
  {
    v11 = (uint64_t (*)())swift_allocObject();
    *((_QWORD *)v11 + 2) = v6;
    *((_QWORD *)v11 + 3) = v7;
    *((_QWORD *)v11 + 4) = v9;
    *((_QWORD *)v11 + 5) = v10;
    v12 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@out ());
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  *a5 = v12;
  a5[1] = v11;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v9);
}

uint64_t key path setter for Publishers.HandleEvents.receiveOutput : <A>Publishers.HandleEvents<A>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)();
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  v8 = a1[1];
  if (*a1)
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v5;
    v9[3] = v6;
    v9[4] = v7;
    v9[5] = v8;
    v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@out ());
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v5, v6, a4) + 40));
  v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  *v11 = (uint64_t)v10;
  v11[1] = (uint64_t)v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveOutput.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 40));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveOutput.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t result;

  v6 = (uint64_t *)(v3 + *(int *)(a3 + 40));
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveOutput.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveCompletion : <A>Publishers.HandleEvents<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  uint64_t (*v12)();

  v6 = *(_QWORD *)(a3 + a2 - 16);
  v7 = *(_QWORD *)(a3 + a2 - 8);
  v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v6, v7, a4) + 44));
  v9 = *v8;
  v10 = v8[1];
  if (*v8)
  {
    v11 = (uint64_t (*)())swift_allocObject();
    *((_QWORD *)v11 + 2) = v6;
    *((_QWORD *)v11 + 3) = v7;
    *((_QWORD *)v11 + 4) = v9;
    *((_QWORD *)v11 + 5) = v10;
    v12 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Completion<A.Publisher.Failure>) -> ();
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  *a5 = v12;
  a5[1] = v11;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v9);
}

uint64_t key path setter for Publishers.HandleEvents.receiveCompletion : <A>Publishers.HandleEvents<A>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)();
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  v8 = a1[1];
  if (*a1)
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v5;
    v9[3] = v6;
    v9[4] = v7;
    v9[5] = v8;
    v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Completion<A.Publisher.Failure>) -> ();
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v5, v6, a4) + 44));
  v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  *v11 = (uint64_t)v10;
  v11[1] = (uint64_t)v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveCompletion.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 44));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveCompletion.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t result;

  v6 = (uint64_t *)(v3 + *(int *)(a3 + 44));
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveCompletion.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveCancel : <A>Publishers.HandleEvents<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)();

  v6 = (uint64_t *)(a1
                 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, *(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 8), a4)+ 48));
  v7 = *v6;
  v8 = v6[1];
  if (*v6)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = partial apply for thunk for @escaping @callee_guaranteed () -> ();
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  *a5 = v10;
  a5[1] = (uint64_t (*)())v9;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
}

uint64_t key path setter for Publishers.HandleEvents.receiveCancel : <A>Publishers.HandleEvents<A>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)();
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  v8 = a1[1];
  if (*a1)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscription) -> (@out ());
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v5, v6, a4) + 48));
  v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  *v11 = (uint64_t)v10;
  v11[1] = v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveCancel.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 48));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveCancel.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t result;

  v6 = (uint64_t *)(v3 + *(int *)(a3 + 48));
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveCancel.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

uint64_t key path getter for Publishers.HandleEvents.receiveRequest : <A>Publishers.HandleEvents<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *);

  v6 = (uint64_t *)(a1
                 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, *(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 8), a4)+ 52));
  v7 = *v6;
  v8 = v6[1];
  if (*v6)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = partial apply for thunk for @escaping @callee_guaranteed (@unowned Subscribers.Demand) -> ();
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  *a5 = v10;
  a5[1] = v9;
  return outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
}

uint64_t key path setter for Publishers.HandleEvents.receiveRequest : <A>Publishers.HandleEvents<A>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  uint64_t v12;
  uint64_t result;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v6 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  v8 = a1[1];
  if (*a1)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Demand) -> (@out ());
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Publishers.HandleEvents(0, v5, v6, a4) + 52));
  v12 = *v11;
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v7);
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(v12);
  *v11 = (uint64_t)v10;
  v11[1] = v9;
  return result;
}

uint64_t Publishers.HandleEvents.receiveRequest.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 52));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

uint64_t Publishers.HandleEvents.receiveRequest.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t result;

  v6 = (uint64_t *)(v3 + *(int *)(a3 + 52));
  result = _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe(*v6);
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Publishers.HandleEvents.receiveRequest.modify())()
{
  return specialized closure #1 in Publisher.multicast<A>(subject:);
}

void Publishers.HandleEvents.Inner.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
  strcpy((char *)a1, "HandleEvents");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.HandleEvents<A>.Inner<A1>()
{
  return 0x7645656C646E6148;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.HandleEvents<A>.Inner<A1>(uint64_t a1@<X8>)
{
  Publishers.HandleEvents.Inner.playgroundDescription.getter(a1);
}

uint64_t sub_18B5DC6E4()
{
  return 16;
}

__n128 sub_18B5DC6F0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_18B5DC704()
{
  return 16;
}

__n128 sub_18B5DC710(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_18B5DC724()
{
  return 16;
}

__n128 sub_18B5DC730(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_18B5DC744()
{
  return 16;
}

__n128 sub_18B5DC750(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_18B5DC764()
{
  return 16;
}

__n128 sub_18B5DC770(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.HandleEvents(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v11 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v10 = *(_OWORD *)v11;
    }
    else
    {
      v12 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      *(_QWORD *)(v10 + 8) = v12;
      swift_retain();
    }
    v13 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    v14 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v14 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v13 = *(_OWORD *)v14;
    }
    else
    {
      v15 = *(_QWORD *)(v14 + 8);
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *(_QWORD *)(v13 + 8) = v15;
      swift_retain();
    }
    v16 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8;
    v17 = (v14 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v17 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
    }
    else
    {
      v18 = *(_QWORD *)(v17 + 8);
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *(_QWORD *)(v16 + 8) = v18;
      swift_retain();
    }
    v19 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
    v20 = (v17 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v20 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v19 = *(_OWORD *)v20;
    }
    else
    {
      v21 = *(_QWORD *)(v20 + 8);
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *(_QWORD *)(v19 + 8) = v21;
      swift_retain();
    }
    v22 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
    v23 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v23 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v22 = *(_OWORD *)v23;
      return v4;
    }
    v24 = *(_QWORD *)(v23 + 8);
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *(_QWORD *)(v22 + 8) = v24;
  }
  swift_retain();
  return v4;
}

uint64_t assignWithCopy for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      v11 = v8[1];
      *v7 = v9;
      v7[1] = v11;
      swift_retain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v9 >= 0xFFFFFFFF)
    {
      v10 = v8[1];
      *v7 = v9;
      v7[1] = v10;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  *(_OWORD *)v7 = *(_OWORD *)v8;
LABEL_8:
  v12 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (unint64_t *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = *v13;
  if (*v12 < 0xFFFFFFFFuLL)
  {
    if (v14 >= 0xFFFFFFFF)
    {
      v16 = v13[1];
      *v12 = v14;
      v12[1] = v16;
      swift_retain();
      goto LABEL_15;
    }
  }
  else
  {
    if (v14 >= 0xFFFFFFFF)
    {
      v15 = v13[1];
      *v12 = v14;
      v12[1] = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  *(_OWORD *)v12 = *(_OWORD *)v13;
LABEL_15:
  v17 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v18 = (unint64_t *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  v19 = *v18;
  if (*v17 < 0xFFFFFFFFuLL)
  {
    if (v19 >= 0xFFFFFFFF)
    {
      v21 = v18[1];
      *v17 = v19;
      v17[1] = v21;
      swift_retain();
      goto LABEL_22;
    }
  }
  else
  {
    if (v19 >= 0xFFFFFFFF)
    {
      v20 = v18[1];
      *v17 = v19;
      v17[1] = v20;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  *(_OWORD *)v17 = *(_OWORD *)v18;
LABEL_22:
  v22 = (_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  v23 = (unint64_t *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  v24 = *v23;
  if (*v22 < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v26 = v23[1];
      *v22 = v24;
      v22[1] = v26;
      swift_retain();
      goto LABEL_29;
    }
  }
  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v25 = v23[1];
      *v22 = v24;
      v22[1] = v25;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  *(_OWORD *)v22 = *(_OWORD *)v23;
LABEL_29:
  v27 = (_QWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  v28 = (unint64_t *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  v29 = *v28;
  if (*v27 < 0xFFFFFFFFuLL)
  {
    if (v29 >= 0xFFFFFFFF)
    {
      v31 = v28[1];
      *v27 = v29;
      v27[1] = v31;
      swift_retain();
      return a1;
    }
LABEL_35:
    *(_OWORD *)v27 = *(_OWORD *)v28;
    return a1;
  }
  if (v29 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_35;
  }
  v30 = v28[1];
  *v27 = v29;
  v27[1] = v30;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v7 = *(_OWORD *)v8;
  }
  else
  {
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v7 = *(_QWORD *)v8;
    *(_QWORD *)(v7 + 8) = v9;
  }
  v10 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v11 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v10 = *(_OWORD *)v11;
  }
  else
  {
    v12 = *(_QWORD *)(v11 + 8);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *(_QWORD *)(v10 + 8) = v12;
  }
  v13 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v14 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  else
  {
    v15 = *(_QWORD *)(v14 + 8);
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *(_QWORD *)(v13 + 8) = v15;
  }
  v16 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  v17 = (v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v17 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v16 = *(_OWORD *)v17;
  }
  else
  {
    v18 = *(_QWORD *)(v17 + 8);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *(_QWORD *)(v16 + 8) = v18;
  }
  v19 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  v20 = (uint64_t *)((v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  v21 = *v20;
  if ((unint64_t)*v20 < 0xFFFFFFFF)
  {
    *(_OWORD *)v19 = *(_OWORD *)v20;
  }
  else
  {
    v22 = v20[1];
    *(_QWORD *)v19 = v21;
    *(_QWORD *)(v19 + 8) = v22;
  }
  return a1;
}

uint64_t assignWithTake for Publishers.HandleEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      v11 = v8[1];
      *v7 = v9;
      v7[1] = v11;
      goto LABEL_8;
    }
  }
  else
  {
    if (v9 >= 0xFFFFFFFF)
    {
      v10 = v8[1];
      *v7 = v9;
      v7[1] = v10;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  *(_OWORD *)v7 = *(_OWORD *)v8;
LABEL_8:
  v12 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (unint64_t *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = *v13;
  if (*v12 < 0xFFFFFFFFuLL)
  {
    if (v14 >= 0xFFFFFFFF)
    {
      v16 = v13[1];
      *v12 = v14;
      v12[1] = v16;
      goto LABEL_15;
    }
  }
  else
  {
    if (v14 >= 0xFFFFFFFF)
    {
      v15 = v13[1];
      *v12 = v14;
      v12[1] = v15;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  *(_OWORD *)v12 = *(_OWORD *)v13;
LABEL_15:
  v17 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  v18 = (unint64_t *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  v19 = *v18;
  if (*v17 < 0xFFFFFFFFuLL)
  {
    if (v19 >= 0xFFFFFFFF)
    {
      v21 = v18[1];
      *v17 = v19;
      v17[1] = v21;
      goto LABEL_22;
    }
  }
  else
  {
    if (v19 >= 0xFFFFFFFF)
    {
      v20 = v18[1];
      *v17 = v19;
      v17[1] = v20;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  *(_OWORD *)v17 = *(_OWORD *)v18;
LABEL_22:
  v22 = (_QWORD *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
  v23 = (unint64_t *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  v24 = *v23;
  if (*v22 < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v26 = v23[1];
      *v22 = v24;
      v22[1] = v26;
      goto LABEL_29;
    }
  }
  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      v25 = v23[1];
      *v22 = v24;
      v22[1] = v25;
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  *(_OWORD *)v22 = *(_OWORD *)v23;
LABEL_29:
  v27 = (_QWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  v28 = (unint64_t *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  v29 = *v28;
  if (*v27 < 0xFFFFFFFFuLL)
  {
    if (v29 >= 0xFFFFFFFF)
    {
      v31 = v28[1];
      *v27 = v29;
      v27[1] = v31;
      return a1;
    }
LABEL_35:
    *(_OWORD *)v27 = *(_OWORD *)v28;
    return a1;
  }
  if (v29 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_35;
  }
  v30 = v28[1];
  *v27 = v29;
  v27[1] = v30;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.HandleEvents(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      if ((v12 + 1) >= 2)
        return v12;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5DD028 + 4 * byte_18B5FBC20[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.HandleEvents(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((((((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5DD1C8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5DD24CLL);
}

void sub_18B5DD1D0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5DD1D8);
  JUMPOUT(0x18B5DD24CLL);
}

void sub_18B5DD220()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5DD24CLL);
}

void sub_18B5DD228()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5DD24CLL);
}

uint64_t sub_18B5DD230(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE)
      JUMPOUT(0x18B5DD23CLL);
    *(_QWORD *)((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) = a2;
LABEL_6:
    JUMPOUT(0x18B5DD24CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t sub_18B5DD264()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Demand) -> (@out ())(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@unowned Subscribers.Demand) -> ()(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> ()()
{
  uint64_t v0;

  return thunk for @escaping @callee_guaranteed () -> ()(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_18B5DD2E4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@out ())()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t _s7Combine12Subscription_pytIegnr_AaB_pIegn_TRTA_0(uint64_t a1)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed (@in_guaranteed Subscribers.Completion<B>) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

void Publisher.prepend<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v20[4];

  v12 = *(_QWORD *)(a2 - 8);
  v13 = MEMORY[0x1E0C80A78](a1);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v13);
  v19 = (char *)v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v6, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a3);
  v20[0] = a3;
  v20[1] = a2;
  v20[2] = a5;
  v20[3] = a4;
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_18B5DD42C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

uint64_t Publisher.append(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Publisher.prepend(_:)(a1, a2, a3, (uint64_t (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))Publisher.append<A>(_:));
}

void Publisher.append<A>(_:)()
{
  type metadata accessor for Publishers.Sequence();
}

void sub_18B5DD4D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  *(_QWORD *)(v3 - 144) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v3 - 112) = v1;
  *(_QWORD *)(v3 - 104) = AssociatedTypeWitness;
  *(_QWORD *)(v3 - 96) = v2;
  *(_QWORD *)(v3 - 88) = AssociatedConformanceWitness;
  type metadata accessor for Publishers.Sequence();
}

void sub_18B5DD560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  *(_QWORD *)(v13 - 160) = *(_QWORD *)(a1 - 8);
  v15 = MEMORY[0x1E0C80A78](a1);
  v17 = (char *)&a9 - v16;
  v18 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v15);
  v20 = (char *)&a9 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 16))(v20, *(_QWORD *)(v13 - 136), v10);
  Sequence.publisher.getter(v9, v12);
  Publishers.Sequence.setFailureType<A>(to:)(v11, (uint64_t)v17);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 144) + 8))(v12, v11);
  v21 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.Sequence<A, B>, a1);
  (*(void (**)(_QWORD, char *, uint64_t))(v18 + 32))(*(_QWORD *)(v13 - 120), v20, v10);
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = a1;
  *(_QWORD *)(v13 - 96) = *(_QWORD *)(v13 - 152);
  *(_QWORD *)(v13 - 88) = v21;
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_18B5DD658(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 160) + 32))(v1 + *(int *)(a1 + 52), v2, v3);
}

uint64_t Publishers.Concatenate.prefix.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Concatenate.suffix.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t Publishers.Concatenate.Inner.__allocating_init(_:suffix:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  Publishers.Concatenate.Inner.init(_:suffix:)(a1, a2);
  return v4;
}

uint64_t Publishers.Concatenate.Inner.prefixSubscriber.getter()
{
  return swift_retain();
}

void Publishers.Concatenate.Inner.PrefixSubscriber.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x6E657461636E6F43;
  a1[1] = 0xEB00000000657461;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber()
{
  return 0x6E657461636E6F43;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber()
{
  return Publishers.DropUntilOutput.Inner.OtherSubscriber.customMirror.getter();
}

void Publishers.Concatenate.Inner.PrefixSubscriber.combineIdentifier.getter()
{
  type metadata accessor for Publishers.Concatenate.Inner();
}

void sub_18B5DD7B0()
{
  _QWORD *v0;

  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(v0);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>.PrefixSubscriber()
{
  Publishers.Concatenate.Inner.PrefixSubscriber.combineIdentifier.getter();
}

void closure #3 in Publishers.Concatenate.Inner.cancel()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  v3 = type metadata accessor for Optional();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - v5;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))((char *)&v8 - v5, 1, 1, v2);
  v7 = a1 + *(_QWORD *)(*(_QWORD *)a1 + 152);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v7, v6, v3);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 168)));
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Concatenate<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Concatenate.Inner.PrefixSubscriber.playgroundDescription.getter(a1);
}

void static Publishers.Concatenate<>.== infix(_:_:)()
{
  type metadata accessor for Publishers.Concatenate();
}

uint64_t sub_18B5DD93C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  char v10;
  void (*v11)(_BYTE *, uint64_t, uint64_t);
  char v12;
  void (*v13)(_BYTE *, uint64_t);
  _BYTE v15[96];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v15[-v8];
  v10 = dispatch thunk of static Equatable.== infix(_:_:)();
  v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v2, a1);
  v11(v7, v1, a1);
  if ((v10 & 1) != 0)
    v12 = dispatch thunk of static Equatable.== infix(_:_:)();
  else
    v12 = 0;
  v13 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v13(v9, a1);
  return v12 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Concatenate<A, B>()
{
  static Publishers.Concatenate<>.== infix(_:_:)();
}

uint64_t getEnumTagSinglePayload for Publishers.Concatenate(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5DDB20 + 4 * byte_18B5FBDE0[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.Concatenate(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
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
  }
  else
  {
    v9 = 0u;
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
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
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
  __asm { BR              X16 }
}

void partial apply for closure #3 in Publishers.Concatenate.Inner.cancel()()
{
  uint64_t v0;

  closure #3 in Publishers.Concatenate.Inner.cancel()(v0);
}

uint64_t CombineIdentifier.value.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t CombineIdentifier.init(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  result = swift_unknownObjectRelease();
  *a2 = a1;
  return result;
}

uint64_t CombineIdentifier.description.getter()
{
  Swift::String v0;

  lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  v0._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  return 30768;
}

void CombineIdentifier.hash(into:)()
{
  Swift::UInt64 *v0;

  Hasher._combine(_:)(*v0);
}

BOOL static CombineIdentifier.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CombineIdentifier()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CombineIdentifier()
{
  Swift::UInt64 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CombineIdentifier()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CombineIdentifier()
{
  Swift::String v0;

  lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  v0._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  return 30768;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    result = MEMORY[0x18D77ACE4](MEMORY[0x1E0DEE1C8], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CombineIdentifier and conformance CombineIdentifier()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CombineIdentifier and conformance CombineIdentifier;
  if (!lazy protocol witness table cache variable for type CombineIdentifier and conformance CombineIdentifier)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for CombineIdentifier, &type metadata for CombineIdentifier);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CombineIdentifier and conformance CombineIdentifier);
  }
  return result;
}

uint64_t Publishers.Debounce.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Debounce.dueTime.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v4, AssociatedTypeWitness);
}

uint64_t Publishers.Debounce.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 56));
}

uint64_t Publishers.Debounce.options.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 60);
  swift_getAssociatedTypeWitness();
  v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

void Publishers.Debounce.Inner.__allocating_init(_:dueTime:scheduler:options:)()
{
  swift_allocObject();
  Publishers.Debounce.Inner.init(_:dueTime:scheduler:options:)();
}

void Publishers.Debounce.Inner.customMirror.getter()
{
  os_unfair_lock_t *v0;
  os_unfair_lock_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  os_unfair_lock_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  _BYTE v17[24];
  os_unfair_lock_t *v18;

  v1 = *v0;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  os_unfair_lock_lock(v0[2]);
  v18 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_18B5F5810;
  *(_QWORD *)(v8 + 32) = 0x657274736E776F64;
  *(_QWORD *)(v8 + 40) = 0xEA00000000006D61;
  v9 = (char *)v0 + *(_QWORD *)&(*v0)[36]._os_unfair_lock_opaque;
  v10 = *(_QWORD *)&v1[24]._os_unfair_lock_opaque;
  *(_QWORD *)(v8 + 72) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 48));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(boxed_opaque_existential_1, v9, v10);
  *(_QWORD *)(v8 + 80) = 0xD000000000000010;
  *(_QWORD *)(v8 + 88) = 0x800000018B5FEDC0;
  v12 = *v0;
  *(_QWORD *)(v8 + 96) = *(os_unfair_lock_t *)((char *)v0 + *(_QWORD *)&(*v0)[52]._os_unfair_lock_opaque);
  *(_QWORD *)(v8 + 120) = &type metadata for Subscribers.Demand;
  strcpy((char *)(v8 + 128), "currentValue");
  *(_BYTE *)(v8 + 141) = 0;
  *(_WORD *)(v8 + 142) = -5120;
  v13 = (char *)v0 + *(_QWORD *)&v12[48]._os_unfair_lock_opaque;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  v14 = type metadata accessor for Optional();
  *(_QWORD *)(v8 + 168) = v14;
  v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 144));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v15, v13, v14);
  v16 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v4);
  swift_retain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(v0[2]);
}

void Publishers.Debounce.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x65636E756F626544;
  a1[1] = 0xE800000000000000;
}

void Publishers.Debounce.Inner.receive(completion:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[8];
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  os_unfair_lock_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[24];

  v27 = a1;
  v2 = *(_QWORD *)(*v1 + 120);
  v23 = (_QWORD *)*v1;
  v3 = v23[12];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v7 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v6);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v22 - v10;
  v25 = v2;
  v12 = swift_getAssociatedTypeWitness();
  v24 = type metadata accessor for Optional();
  v13 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v15 = (char *)v22 - v14;
  v26 = (os_unfair_lock_t)v1[2];
  os_unfair_lock_lock(v26);
  v16 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v16, (uint64_t)&v28);
  if (!(_BYTE)v32)
  {
    v22[4] = v9;
    v22[5] = v11;
    v22[6] = v8;
    v22[7] = v7;
    outlined init with take of Subscription(&v28, (uint64_t)v33);
    outlined init with copy of Subscription((uint64_t)v33, (uint64_t)&v28);
    LOBYTE(v32) = 1;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v28, v16);
    swift_endAccess();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v15, 1, 1, v12);
    v17 = (char *)v1 + *(_QWORD *)(*v1 + 192);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v17, v15, v24);
    swift_endAccess();
    v24 = (uint64_t)v1;
    swift_beginAccess();
    swift_beginAccess();
    v19 = v23[10];
    v18 = (_QWORD *)v23[11];
    v21 = v23[13];
    v20 = v23[14];
    swift_bridgeObjectRetain();
    v22[2] = v19;
    *(_QWORD *)&v28 = v19;
    *((_QWORD *)&v28 + 1) = v18;
    v23 = v18;
    v29 = v3;
    v30 = v21;
    v22[1] = v21;
    v22[3] = v20;
    v31 = v20;
    v32 = v25;
    type metadata accessor for Publishers.Debounce.Inner.CancellerState();
  }
  outlined destroy of SubscriptionStatus((uint64_t)&v28);
  os_unfair_lock_unlock(v26);
}

uint64_t closure #1 in Publishers.Debounce.Inner.receive(completion:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  os_unfair_recursive_lock_lock_with_options();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 120) + 56))(a2, *(_QWORD *)(v3 + 96));
  return os_unfair_recursive_lock_unlock();
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Debounce<A, B>.Inner<A1>(uint64_t a1)
{
  Publishers.Debounce.Inner.receive(completion:)(a1);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Debounce<A, B>.Inner<A1>()
{
  return 0x65636E756F626544;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Debounce<A, B>.Inner<A1>()
{
  Publishers.Debounce.Inner.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Debounce<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Debounce.Inner.playgroundDescription.getter(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Debounce(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  const void *v36;
  size_t __n;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = *(_QWORD *)(a3 + 24);
  v44 = *(_QWORD *)(a3 + 16);
  v45 = *(_QWORD *)(v44 - 8);
  v4 = *(_QWORD *)(v45 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v7;
  v40 = v4 + v7;
  v9 = (v4 + v8) & ~v8;
  v10 = *(_QWORD *)(v3 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = v11;
  v41 = *(_QWORD *)(v6 + 64) + v11;
  v13 = (v41 + v9) & ~(unint64_t)v11;
  v42 = v10;
  v43 = AssociatedTypeWitness;
  v14 = *(_QWORD *)(v10 + 64);
  v15 = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = v17;
  v19 = v14 + v17;
  if (*(_DWORD *)(v16 + 84))
    v20 = *(_QWORD *)(v16 + 64);
  else
    v20 = *(_QWORD *)(v16 + 64) + 1;
  v21 = v7 | *(_DWORD *)(v45 + 80) | v11 | v17;
  v22 = (v7 | *(_BYTE *)(v45 + 80) | v11 | v17);
  v23 = v21 & 0x100000;
  if (v22 <= 7 && v20 + ((v19 + v13) & ~v18) <= 0x18 && v23 == 0)
  {
    v28 = ~(unint64_t)v7;
    v29 = ~v12;
    __n = v20;
    v39 = ~v18;
    v27 = a1;
    v30 = v15;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v45 + 16))(a1, a2, v44);
    v31 = ((unint64_t)a1 + v40) & ~v8;
    v32 = ((unint64_t)a2 + v40) & v28;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v31, v32, v43);
    v33 = (v31 + v41) & v29;
    v34 = (v32 + v41) & v29;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v42 + 16))(v33, v34, v3);
    v35 = (void *)((v33 + v19) & v39);
    v36 = (const void *)((v34 + v19) & v39);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v36, 1, v30))
    {
      memcpy(v35, v36, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v35, v36, v30);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v35, 0, 1, v30);
    }
  }
  else
  {
    v26 = *a2;
    *a1 = *a2;
    v27 = (uint64_t *)(v26 + ((v22 + 16) & ~v22));
    swift_retain();
  }
  return v27;
}

uint64_t assignWithCopy for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  size_t v27;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v8 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v10 + 64) + v15;
  v17 = (v16 + v12) & ~v15;
  v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(v17, v18, v8);
  v19 = *(_QWORD *)(v14 + 64);
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (void *)((v19 + v22 + v17) & ~v22);
  v24 = (void *)((v19 + v22 + v18) & ~v22);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1, v20);
  v26 = v25(v24, 1, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v23, v24, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v20);
      return a1;
    }
  }
  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v23, v24, v20);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v27 = *(_QWORD *)(v21 + 64);
  else
    v27 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v23, v24, v27);
  return a1;
}

uint64_t initializeWithTake for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  const void *v24;
  size_t v25;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v8 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v10 + 64) + v15;
  v17 = (v16 + v12) & ~v15;
  v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v17, v18, v8);
  v19 = *(_QWORD *)(v14 + 64);
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (void *)((v19 + v22 + v17) & ~v22);
  v24 = (const void *)((v19 + v22 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v24, 1, v20))
  {
    if (*(_DWORD *)(v21 + 84))
      v25 = *(_QWORD *)(v21 + 64);
    else
      v25 = *(_QWORD *)(v21 + 64) + 1;
    memcpy(v23, v24, v25);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v23, v24, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v20);
  }
  return a1;
}

uint64_t assignWithTake for Publishers.Debounce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  size_t v27;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v8 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v10 + 64) + v15;
  v17 = (v16 + v12) & ~v15;
  v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v17, v18, v8);
  v19 = *(_QWORD *)(v14 + 64);
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (void *)((v19 + v22 + v17) & ~v22);
  v24 = (void *)((v19 + v22 + v18) & ~v22);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1, v20);
  v26 = v25(v24, 1, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v23, v24, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v20);
      return a1;
    }
  }
  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v23, v24, v20);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v27 = *(_QWORD *)(v21 + 64);
  else
    v27 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v23, v24, v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Debounce(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  unsigned int v27;
  int v28;
  int v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t AssociatedTypeWitness;
  uint64_t v36;
  unsigned int v37;

  v4 = *(_QWORD *)(a3 + 24);
  v36 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v36 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v37 = v6;
  if (v8 <= v6)
    v9 = v6;
  else
    v9 = *(_DWORD *)(v7 + 84);
  v10 = *(_QWORD *)(v4 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v9)
    v12 = v9;
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v14 = *(_DWORD *)(v13 + 84);
  v15 = v14 - 1;
  if (!v14)
    v15 = 0;
  if (v15 <= v12)
    v15 = v12;
  if (v14)
    v16 = *(_QWORD *)(v13 + 64);
  else
    v16 = *(_QWORD *)(v13 + 64) + 1;
  if (!a2)
    return 0;
  v17 = *(unsigned __int8 *)(v7 + 80);
  v18 = *(_QWORD *)(v5 + 64) + v17;
  v19 = *(_QWORD *)(v7 + 64);
  v20 = *(unsigned __int8 *)(v10 + 80);
  v21 = *(_QWORD *)(v10 + 64);
  v22 = *(unsigned __int8 *)(v13 + 80);
  v23 = a1;
  if (a2 <= v15)
    goto LABEL_33;
  v24 = v16 + ((v21 + v22 + ((v19 + v20 + (v18 & ~v17)) & ~v20)) & ~v22);
  v25 = 8 * v24;
  if (v24 > 3)
    goto LABEL_17;
  v27 = ((a2 - v15 + ~(-1 << v25)) >> v25) + 1;
  if (HIWORD(v27))
  {
    v26 = *(_DWORD *)(a1 + v24);
    if (!v26)
      goto LABEL_33;
    goto LABEL_24;
  }
  if (v27 > 0xFF)
  {
    v26 = *(unsigned __int16 *)(a1 + v24);
    if (!*(_WORD *)(a1 + v24))
      goto LABEL_33;
    goto LABEL_24;
  }
  if (v27 >= 2)
  {
LABEL_17:
    v26 = *(unsigned __int8 *)(a1 + v24);
    if (!*(_BYTE *)(a1 + v24))
      goto LABEL_33;
LABEL_24:
    v28 = (v26 - 1) << v25;
    if (v24 > 3)
      v28 = 0;
    if ((_DWORD)v24)
    {
      if (v24 <= 3)
        v29 = v24;
      else
        v29 = 4;
      __asm { BR              X12 }
    }
    return v15 + v28 + 1;
  }
LABEL_33:
  if (!v15)
    return 0;
  if (v37 == v15)
  {
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    v31 = v37;
    v32 = v36;
    return v30(v23, v31, v32);
  }
  v23 = (v18 + a1) & ~v17;
  if ((_DWORD)v8 == v15)
  {
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v31 = v8;
    v32 = AssociatedTypeWitness;
    return v30(v23, v31, v32);
  }
  v23 = (v23 + v19 + v20) & ~v20;
  if ((_DWORD)v11 == v15)
  {
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v31 = v11;
    v32 = v4;
    return v30(v23, v31, v32);
  }
  v33 = (*(uint64_t (**)(uint64_t))(v13 + 48))((v23 + v21 + v22) & ~v22);
  if (v33 >= 2)
    return v33 - 1;
  else
    return 0;
}

void storeEnumTagSinglePayload for Publishers.Debounce(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;

  v4 = *(_QWORD *)(a4 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v7 + 84) <= v6)
    v8 = v6;
  else
    v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v4 - 8);
  if (*(_DWORD *)(v9 + 84) <= v8)
    v10 = v8;
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = 0u;
  v12 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v13 = *(_DWORD *)(v12 + 84);
  v14 = v13 - 1;
  if (!v13)
    v14 = 0;
  if (v14 <= v10)
    v15 = v10;
  else
    v15 = v14;
  v16 = *(unsigned __int8 *)(v7 + 80);
  v19 = *(unsigned __int8 *)(v9 + 80);
  v21 = *(unsigned __int8 *)(v12 + 80);
  if (v13)
    v22 = *(_QWORD *)(v12 + 64);
  else
    v22 = *(_QWORD *)(v12 + 64) + 1;
  v20 = *(_QWORD *)(v9 + 64);
  v18 = *(_QWORD *)(v7 + 64);
  v17 = *(_QWORD *)(v5 + 64) + v16;
  v23 = ((v20 + v21 + ((v18 + v19 + (v17 & ~(_DWORD)v16)) & ~(_DWORD)v19)) & ~(_DWORD)v21) + v22;
  if (a3 > v15)
  {
    if (v23 <= 3)
    {
      v24 = ((a3 - v15 + ~(-1 << (8 * v23))) >> (8 * v23)) + 1;
      if (HIWORD(v24))
      {
        v11 = 4u;
      }
      else if (v24 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v24 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  if (v15 < a2)
  {
    v25 = ~v15 + a2;
    if (v23 < 4)
    {
      if (v23)
      {
        v26 = v25 & ~(-1 << (8 * v23));
        bzero(a1, ((v20 + v21 + ((v18 + v19 + (v17 & ~v16)) & ~v19)) & ~v21) + v22);
        if (v23 == 3)
        {
          *(_WORD *)a1 = v26;
          a1[2] = BYTE2(v26);
        }
        else if (v23 == 2)
        {
          *(_WORD *)a1 = v26;
        }
        else
        {
          *a1 = v26;
        }
      }
    }
    else
    {
      bzero(a1, ((v20 + v21 + ((v18 + v19 + (v17 & ~v16)) & ~v19)) & ~v21) + v22);
      *(_DWORD *)a1 = v25;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X6 }
}

void sub_18B5DF924()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + v2) = v0;
}

void sub_18B5DF92C()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;

  *(_WORD *)(v1 + v2) = v0;
}

void sub_18B5DF9C0()
{
  _BYTE *v0;
  char v1;

  *v0 = v1;
}

void sub_18B5DF9F4()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_18B5DF9FC()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_18B5DFA0C()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t sub_18B5DFA18()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v3)- 8)+ 80);
  v5 = (v4 + 72) & ~v4;
  swift_release();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v5, 1, AssociatedTypeWitness))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v5, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Publishers.Debounce.Inner.receive(completion:)()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;
  uint64_t v4;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v3)- 8)+ 80);
  return closure #1 in Publishers.Debounce.Inner.receive(completion:)(*(uint64_t **)(v0 + 64), v0 + ((v4 + 72) & ~v4));
}

uint64_t sub_18B5DFB98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t Fail.init(error:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t Fail.init(outputType:failure:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t Fail.error.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t Fail.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a2 + 24);
  v8 = type metadata accessor for Subscribers.Completion(0, v7, *(_QWORD *)(a2 + 32), a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - v10;
  if (one-time initialization token for singleton != -1)
    swift_once();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 40))(&static Subscriptions._EmptySubscription.singleton, a3, a4);
  v12 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v11, v4, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v11, 0, 1, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 56))(v11, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Fail<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Fail.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t static Fail<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Fail<A, B>()
{
  return static Fail<>.== infix(_:_:)();
}

uint64_t type metadata completion function for Fail()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Fail(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
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
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
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
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5DFE80 + 4 * byte_18B5FC3D0[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Fail(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for Fail(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Fail);
}

uint64_t Publishers.Last.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t Publishers.Last.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Last.Inner.description.getter()
{
  return 1953718604;
}

uint64_t static Publishers.Last<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Last<A>()
{
  return static Publishers.Last<>.== infix(_:_:)();
}

uint64_t getEnumTagSinglePayload for Publishers.Last(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
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
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
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
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5E01B0 + 4 * byte_18B5FC458[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.Last(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for Publishers.Last(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.Last);
}

uint64_t PublisherBoxBase.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t PublisherBoxBase.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t PublisherBoxBase.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PublisherBoxBase.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void PublisherBoxBase.receive<A>(subscriber:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t PublisherBox.base.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 120) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 136));
}

uint64_t PublisherBox.init(_:)(uint64_t a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 120) - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 136), a1);
  return v1;
}

uint64_t PublisherBox.__ivar_destroyer()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 120) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136));
}

uint64_t PublisherBox.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 120) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136));
  return v0;
}

void PublisherBox.__allocating_init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void PublisherBox.init()()
{
  specialized PublisherBox.init()();
}

uint64_t AnyPublisher.description.getter()
{
  return 0x696C627550796E41;
}

void AnyPublisher.playgroundDescription.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEA968];
  strcpy((char *)a1, "AnyPublisher");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AnyPublisher<A, B>()
{
  return 0x696C627550796E41;
}

void specialized PublisherBox.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t method lookup function for PublisherBoxBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PublisherBoxBase.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PublisherBoxBase.receive<A>(subscriber:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t method lookup function for PublisherBox()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PublisherBox.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t Publishers.Map.init(upstream:transform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publishers.CompactMap.init(upstream:transform:)(a1, a2, a3, a4, a5, a6, type metadata accessor for Publishers.Map, a7);
}

uint64_t Publishers.TryMap.init(upstream:transform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publishers.CompactMap.init(upstream:transform:)(a1, a2, a3, a4, a5, a6, type metadata accessor for Publishers.TryMap, a7);
}

uint64_t Publishers.Map.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

void Publishers.Map.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 7364941;
  a1[1] = 0xE300000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Map<A, B>.Inner<A1>()
{
  return 7364941;
}

void Publishers.TryMap.Inner.__allocating_init(downstream:map:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  Publishers.TryMap.Inner.init(downstream:map:)(a1, a2, a3);
}

void Publishers.TryMap.Inner.customMirror.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];
  uint64_t v10;
  _QWORD *v11;

  v1 = *v0;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v0;
  v6 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = *(_QWORD *)(v1 + 112);
  v8 = *(_OWORD *)(v1 + 96);
  v9[0] = *(_OWORD *)(v1 + 80);
  v9[1] = v8;
  v10 = v7;
  type metadata accessor for Publishers.TryMap.Inner();
}

uint64_t sub_18B5E0788()
{
  uint64_t v0;

  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v0);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.TryMap.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x70614D797254;
  a1[1] = 0xE600000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.TryMap<A, B>.Inner<A1>()
{
  return 0x70614D797254;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.TryMap<A, B>.Inner<A1>()
{
  Publishers.TryMap.Inner.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryMap<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.TryMap.Inner.playgroundDescription.getter(a1);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.TryMap<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + *(_QWORD *)(**(_QWORD **)v1 + 152));
}

uint64_t Publishers.Map.tryMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t (**v23)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v6 = v5;
  v25 = a1;
  v26 = a5;
  v10 = a3[2];
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  v16 = *v15;
  v17 = v15[1];
  v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  v19 = a3[3];
  v20 = a3[4];
  *((_QWORD *)v18 + 2) = v10;
  *((_QWORD *)v18 + 3) = v19;
  *((_QWORD *)v18 + 4) = a4;
  *((_QWORD *)v18 + 5) = v20;
  *((_QWORD *)v18 + 6) = v25;
  *((_QWORD *)v18 + 7) = a2;
  *((_QWORD *)v18 + 8) = v16;
  *((_QWORD *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v22 = v26;
  v21(v26, v13, v10);
  v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.TryMap(0, v10, a4, v20) + 44));
  *v23 = partial apply for closure #1 in Publishers.Map.tryMap<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.Map.tryMap<A>(_:)(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t);
  uint64_t v15;

  v9 = *(_QWORD *)(a7 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13(v10);
  a2(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a7);
}

uint64_t partial apply for closure #1 in Publishers.Map.tryMap<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in Publishers.CompactMap.compactMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in Publishers.Map.tryMap<A>(_:));
}

uint64_t Publishers.TryMap.map<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t (**v23)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v6 = v5;
  v25 = a1;
  v26 = a5;
  v10 = a3[2];
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  v16 = *v15;
  v17 = v15[1];
  v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  v19 = a3[3];
  v20 = a3[4];
  *((_QWORD *)v18 + 2) = v10;
  *((_QWORD *)v18 + 3) = v19;
  *((_QWORD *)v18 + 4) = a4;
  *((_QWORD *)v18 + 5) = v20;
  *((_QWORD *)v18 + 6) = v25;
  *((_QWORD *)v18 + 7) = a2;
  *((_QWORD *)v18 + 8) = v16;
  *((_QWORD *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v22 = v26;
  v21(v26, v13, v10);
  v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.TryMap(0, v10, a4, v20) + 44));
  *v23 = partial apply for closure #1 in Publishers.TryMap.map<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.TryMap.map<A>(_:)(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t result;
  uint64_t v16;

  v10 = *(_QWORD *)(a7 - 8);
  v11 = MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v14(v11);
  if (!v7)
  {
    a2(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, a7);
  }
  return result;
}

uint64_t partial apply for closure #1 in Publishers.TryMap.map<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in Publishers.CompactMap.compactMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in Publishers.TryMap.map<A>(_:));
}

uint64_t Publishers.TryMap.tryMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t (**v23)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v6 = v5;
  v25 = a1;
  v26 = a5;
  v10 = a3[2];
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)(v6 + *(int *)(v14 + 44));
  v16 = *v15;
  v17 = v15[1];
  v18 = (uint64_t (*)(uint64_t))swift_allocObject();
  v19 = a3[3];
  v20 = a3[4];
  *((_QWORD *)v18 + 2) = v10;
  *((_QWORD *)v18 + 3) = v19;
  *((_QWORD *)v18 + 4) = a4;
  *((_QWORD *)v18 + 5) = v20;
  *((_QWORD *)v18 + 6) = v25;
  *((_QWORD *)v18 + 7) = a2;
  *((_QWORD *)v18 + 8) = v16;
  *((_QWORD *)v18 + 9) = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v22 = v26;
  v21(v26, v13, v10);
  v23 = (uint64_t (**)(uint64_t))(v22
                                         + *(int *)(type metadata accessor for Publishers.TryMap(0, v10, a4, v20) + 44));
  *v23 = partial apply for closure #1 in Publishers.TryMap.tryMap<A>(_:);
  v23[1] = v18;
  swift_retain();
  return swift_retain();
}

uint64_t closure #1 in Publishers.TryMap.tryMap<A>(_:)(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t result;
  uint64_t v16;

  v10 = *(_QWORD *)(a7 - 8);
  v11 = MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v14(v11);
  if (!v7)
  {
    a2(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, a7);
  }
  return result;
}

uint64_t partial apply for closure #1 in Publishers.TryMap.tryMap<A>(_:)(uint64_t a1)
{
  return partial apply for closure #1 in Publishers.CompactMap.compactMap<A>(_:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in Publishers.TryMap.tryMap<A>(_:));
}

uint64_t Publishers.Timeout.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Timeout.interval.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v4, AssociatedTypeWitness);
}

uint64_t Publishers.Timeout.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 56));
}

uint64_t Publishers.Timeout.options.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 60);
  swift_getAssociatedTypeWitness();
  v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t Publishers.Timeout.customError.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 64));
  outlined copy of (@escaping @callee_guaranteed @substituted <A> (@in_guaranteed Subscribers.Completion<A>) -> (@unowned Bool) for <A.Failure>)?<A><A1>(v2);
  return v2;
}

_QWORD *Publishers.Timeout.Inner.__allocating_init(_:interval:scheduler:options:customError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  return Publishers.Timeout.Inner.init(_:interval:scheduler:options:customError:)(a1, a2, a3, a4, a5, a6);
}

void Publishers.Timeout.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x74756F656D6954;
  a1[1] = 0xE700000000000000;
}

void Publishers.Timeout.Inner.timedOut()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(_QWORD);
  void (*v20)(_QWORD);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;

  v1 = v0;
  v2 = *v0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v6 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v26 - v9;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v26 - v12;
  v14 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v14);
  v15 = *v1;
  v16 = *(_QWORD *)(*v1 + 192);
  if ((*((_BYTE *)v1 + v16) & 1) != 0)
  {
    os_unfair_lock_unlock(v14);
  }
  else
  {
    v29 = v6;
    v17 = (uint64_t)v1 + *(_QWORD *)(v15 + 184);
    swift_beginAccess();
    outlined init with copy of SubscriptionStatus(v17, (uint64_t)&v30);
    if (v33)
    {
      outlined destroy of SubscriptionStatus((uint64_t)&v30);
      os_unfair_lock_unlock(v14);
    }
    else
    {
      outlined init with take of Subscription((__int128 *)&v30, (uint64_t)v34);
      v18 = (_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 176));
      v19 = (void (*)(_QWORD))*v18;
      v28 = v18[1];
      *((_BYTE *)v1 + v16) = 1;
      v20 = v19;
      v30 = 1;
      v31 = 0u;
      v32 = 0u;
      v33 = 2;
      swift_beginAccess();
      outlined assign with take of SubscriptionStatus((uint64_t)&v30, v17);
      swift_endAccess();
      *(_QWORD *)((char *)v1 + *(_QWORD *)(*v1 + 200)) = 0;
      swift_release();
      os_unfair_lock_unlock(v14);
      if (v20)
      {
        v21 = swift_retain();
        v27 = v20;
        v20(v21);
        v23 = v35;
        v22 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t))(*(_QWORD *)(v22 + 8) + 8))(v23);
        os_unfair_recursive_lock_lock_with_options();
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v10, v13, AssociatedTypeWitness);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v10, 0, 1, AssociatedTypeWitness);
        (*(void (**)(char *, _QWORD))(*(_QWORD *)(v2 + 120) + 56))(v10, *(_QWORD *)(v2 + 96));
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v29);
        os_unfair_recursive_lock_unlock();
        _sxSbRi_zRi0_zly6OutputQzIsegnd_Sg7Combine9PublisherRzAD10SubscriberRd__7FailureQyd__AGRtz5InputQyd__ABRSr__lWOe((uint64_t)v27);
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
      }
      else
      {
        v25 = v35;
        v24 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t))(*(_QWORD *)(v24 + 8) + 8))(v25);
        os_unfair_recursive_lock_lock_with_options();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v10, 1, 1, AssociatedTypeWitness);
        (*(void (**)(char *, _QWORD))(*(_QWORD *)(v2 + 120) + 56))(v10, *(_QWORD *)(v2 + 96));
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v29);
        os_unfair_recursive_lock_unlock();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    }
  }
}

void Publishers.Timeout.Inner.cancel()()
{
  _QWORD *v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7[2];
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v1 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v1);
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 184);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v12);
  outlined init with copy of SubscriptionStatus((uint64_t)&v12, (uint64_t)v7);
  if (v8 != 1 && v8)
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    outlined destroy of SubscriptionStatus((uint64_t)v7);
  }
  else
  {
    outlined init with take of Subscription(v7, (uint64_t)&v9);
  }
  outlined destroy of SubscriptionStatus((uint64_t)&v12);
  if (*((_QWORD *)&v10 + 1))
  {
    outlined init with take of Subscription(&v9, (uint64_t)v16);
    v12 = 1;
    v13 = 0u;
    v14 = 0u;
    v15 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v12, v2);
    swift_endAccess();
    v3 = *(_QWORD *)(*v0 + 200);
    v4 = *(_QWORD *)((char *)v0 + v3);
    *(_QWORD *)((char *)v0 + v3) = 0;
    os_unfair_lock_unlock(v1);
    if (v4)
    {
      swift_retain();
      AnyCancellable.cancel()();
      swift_release();
    }
    v5 = v17;
    v6 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 8) + 8))(v5);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)&v9);
    os_unfair_lock_unlock(v1);
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Timeout<A, B>.Inner<A1>()
{
  return 0x74756F656D6954;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Timeout<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Timeout.Inner.playgroundDescription.getter(a1);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Timeout<A, B>.Inner<A1>()
{
  Publishers.Timeout.Inner.cancel()();
}

uint64_t type metadata completion function for Publishers.Timeout()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Timeout(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  const void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  size_t __n;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = *(_QWORD *)(a3 + 24);
  v45 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(v45 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = v8;
  v40 = v5 + v8;
  v10 = *(_QWORD *)(v3 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v41 = *(_QWORD *)(v7 + 64) + v11;
  v12 = (v41 + ((v5 + v9) & ~v9)) & ~(unint64_t)v11;
  v42 = v10;
  v43 = AssociatedTypeWitness;
  v13 = *(_QWORD *)(v10 + 64);
  v14 = swift_getAssociatedTypeWitness();
  v15 = v4;
  v44 = v14;
  v16 = *(_QWORD *)(v14 - 8);
  v17 = *(_DWORD *)(v16 + 80);
  v18 = v13 + v17;
  if (*(_DWORD *)(v16 + 84))
    v19 = *(_QWORD *)(v16 + 64);
  else
    v19 = *(_QWORD *)(v16 + 64) + 1;
  v20 = v8 | *(_DWORD *)(v15 + 80) & 0xF8 | v11 | v17;
  if (v20 > 7
    || ((v11 | *(_DWORD *)(v16 + 80) | *(_DWORD *)(v15 + 80) | v8) & 0x100000) != 0
    || ((v19 + 7 + ((v13 + v17 + v12) & ~v17)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v23 = *a2;
    *a1 = *a2;
    v27 = (uint64_t *)(v23 + (((v20 | 7) + 16) & ~(unint64_t)(v20 | 7)));
  }
  else
  {
    __n = v19;
    v39 = v19 + 7;
    v24 = ~(unint64_t)v8;
    v25 = ~(unint64_t)v11;
    v26 = ~v17;
    v27 = a1;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v15 + 16))(a1, a2, v45);
    v28 = ((unint64_t)a1 + v40) & ~v9;
    v29 = ((unint64_t)a2 + v40) & v24;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v28, v29, v43);
    v30 = (v28 + v41) & v25;
    v31 = (v29 + v41) & v25;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v42 + 16))(v30, v31, v3);
    v32 = (void *)((v30 + v18) & v26);
    v33 = (const void *)((v31 + v18) & v26);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v33, 1, v44))
    {
      memcpy(v32, v33, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v32, v33, v44);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v32, 0, 1, v44);
    }
    v34 = ((unint64_t)v32 + v39) & 0xFFFFFFFFFFFFFFF8;
    v35 = ((unint64_t)v33 + v39) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v35 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v34 = *(_OWORD *)v35;
      return v27;
    }
    v36 = *(_QWORD *)(v35 + 8);
    *(_QWORD *)v34 = *(_QWORD *)v35;
    *(_QWORD *)(v34 + 8) = v36;
  }
  swift_retain();
  return v27;
}

uint64_t assignWithCopy for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  size_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v8 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v10 + 64) + v15;
  v17 = (v16 + v12) & ~v15;
  v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(v17, v18, v8);
  v19 = *(_QWORD *)(v14 + 64);
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (void *)((v19 + v22 + v17) & ~v22);
  v24 = (void *)((v19 + v22 + v18) & ~v22);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1, v20);
  v26 = v25(v24, 1, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v23, v24, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v20);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v23, v24, v20);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v27 = *(_QWORD *)(v21 + 64);
  else
    v27 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v23, v24, v27);
LABEL_10:
  if (*(_DWORD *)(v21 + 84))
    v28 = *(_QWORD *)(v21 + 64);
  else
    v28 = *(_QWORD *)(v21 + 64) + 1;
  v29 = (_QWORD *)(((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v30 = (unint64_t *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v31 = *v30;
  if (*v29 < 0xFFFFFFFFuLL)
  {
    if (v31 >= 0xFFFFFFFF)
    {
      v33 = v30[1];
      *v29 = v31;
      v29[1] = v33;
      swift_retain();
      return a1;
    }
LABEL_19:
    *(_OWORD *)v29 = *(_OWORD *)v30;
    return a1;
  }
  if (v31 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_19;
  }
  v32 = v30[1];
  *v29 = v31;
  v29[1] = v32;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  const void *v24;
  int v25;
  uint64_t v26;
  size_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v8 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v10 + 64) + v15;
  v17 = (v16 + v12) & ~v15;
  v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v17, v18, v8);
  v19 = *(_QWORD *)(v14 + 64);
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (void *)((v19 + v22 + v17) & ~v22);
  v24 = (const void *)((v19 + v22 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v24, 1, v20))
  {
    v25 = *(_DWORD *)(v21 + 84);
    v26 = *(_QWORD *)(v21 + 64);
    if (v25)
      v27 = *(_QWORD *)(v21 + 64);
    else
      v27 = v26 + 1;
    memcpy(v23, v24, v27);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v23, v24, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v20);
    v25 = *(_DWORD *)(v21 + 84);
    v26 = *(_QWORD *)(v21 + 64);
  }
  if (v25)
    v28 = v26;
  else
    v28 = v26 + 1;
  v29 = ((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (uint64_t *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v31 = *v30;
  if ((unint64_t)*v30 < 0xFFFFFFFF)
  {
    *(_OWORD *)v29 = *(_OWORD *)v30;
  }
  else
  {
    v32 = v30[1];
    *(_QWORD *)v29 = v31;
    *(_QWORD *)(v29 + 8) = v32;
  }
  return a1;
}

uint64_t assignWithTake for Publishers.Timeout(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  size_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v7 + v11 + a1) & ~v11;
  v13 = (v7 + v11 + a2) & ~v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v12, v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v8 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v10 + 64) + v15;
  v17 = (v16 + v12) & ~v15;
  v18 = (v16 + v13) & ~v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v17, v18, v8);
  v19 = *(_QWORD *)(v14 + 64);
  v20 = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (void *)((v19 + v22 + v17) & ~v22);
  v24 = (void *)((v19 + v22 + v18) & ~v22);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v25(v23, 1, v20);
  v26 = v25(v24, 1, v20);
  if ((_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v23, v24, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v20);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v23, v24, v20);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v23, v20);
  }
  if (*(_DWORD *)(v21 + 84))
    v27 = *(_QWORD *)(v21 + 64);
  else
    v27 = *(_QWORD *)(v21 + 64) + 1;
  memcpy(v23, v24, v27);
LABEL_10:
  if (*(_DWORD *)(v21 + 84))
    v28 = *(_QWORD *)(v21 + 64);
  else
    v28 = *(_QWORD *)(v21 + 64) + 1;
  v29 = (_QWORD *)(((unint64_t)v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v30 = (unint64_t *)(((unint64_t)v24 + v28 + 7) & 0xFFFFFFFFFFFFFFF8);
  v31 = *v30;
  if (*v29 < 0xFFFFFFFFuLL)
  {
    if (v31 >= 0xFFFFFFFF)
    {
      v33 = v30[1];
      *v29 = v31;
      v29[1] = v33;
      return a1;
    }
LABEL_19:
    *(_OWORD *)v29 = *(_OWORD *)v30;
    return a1;
  }
  if (v31 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_19;
  }
  v32 = v30[1];
  *v29 = v31;
  v29[1] = v32;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Timeout(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t AssociatedTypeWitness;
  uint64_t v37;
  unsigned int v38;

  v4 = *(_QWORD *)(a3 + 24);
  v37 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v37 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v38 = v6;
  if (v8 <= v6)
    v9 = v6;
  else
    v9 = *(_DWORD *)(v7 + 84);
  v10 = *(_QWORD *)(v4 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v9)
    v12 = v9;
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v14 = *(_DWORD *)(v13 + 84);
  if (v14)
    v15 = v14 - 1;
  else
    v15 = 0;
  if (v15 <= v12)
    v16 = v12;
  else
    v16 = v15;
  if (v16 <= 0x7FFFFFFE)
    v16 = 2147483646;
  v17 = *(_QWORD *)(v13 + 64);
  if (!v14)
    ++v17;
  if (!a2)
    return 0;
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = *(_QWORD *)(v5 + 64) + v18;
  v20 = *(_QWORD *)(v7 + 64);
  v21 = *(unsigned __int8 *)(v10 + 80);
  v22 = *(_QWORD *)(v10 + 64);
  v23 = *(unsigned __int8 *)(v13 + 80);
  v24 = v17 + 7;
  v25 = a1;
  if (v16 < a2)
  {
    if (((((v24 + ((v22 + v23 + ((v20 + v21 + (v19 & ~v18)) & ~v21)) & ~v23)) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v26 = 2;
    else
      v26 = a2 - v16 + 1;
    if (v26 >= 0x10000)
      v27 = 4;
    else
      v27 = 2;
    if (v26 < 0x100)
      v27 = 1;
    if (v26 >= 2)
      v28 = v27;
    else
      v28 = 0;
    __asm { BR              X6 }
  }
  if (v38 == v16)
  {
    v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    v30 = v38;
    v31 = v37;
    return v29(v25, v30, v31);
  }
  v25 = (v19 + a1) & ~v18;
  if ((_DWORD)v8 == v16)
  {
    v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v30 = v8;
    v31 = AssociatedTypeWitness;
    return v29(v25, v30, v31);
  }
  v25 = (v25 + v20 + v21) & ~v21;
  if ((_DWORD)v11 == v16)
  {
    v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v30 = v11;
    v31 = v4;
    return v29(v25, v30, v31);
  }
  v33 = (v25 + v22 + v23) & ~v23;
  if (v15 == v16)
  {
    if (v14 < 2)
      return 0;
    v35 = (*(uint64_t (**)(uint64_t))(v13 + 48))(v33);
    if (v35 >= 2)
      return v35 - 1;
    else
      return 0;
  }
  else
  {
    v34 = *(_QWORD *)((v24 + v33) & 0xFFFFFFFFFFFFF8);
    if (v34 >= 0xFFFFFFFF)
      LODWORD(v34) = -1;
    if ((v34 + 1) >= 2)
      return v34;
    else
      return 0;
  }
}

void storeEnumTagSinglePayload for Publishers.Timeout(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  unsigned int v26;

  v5 = *(_QWORD *)(a4 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v8 + 84) <= v7)
    v9 = v7;
  else
    v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(v5 - 8);
  if (*(_DWORD *)(v10 + 84) <= v9)
    v11 = v9;
  else
    v11 = *(_DWORD *)(v10 + 84);
  v12 = 0u;
  v13 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v14 = *(_DWORD *)(v13 + 84);
  if (v14)
    v15 = v14 - 1;
  else
    v15 = 0;
  if (v15 <= v11)
    v16 = v11;
  else
    v16 = v15;
  if (v16 <= 0x7FFFFFFE)
    v16 = 2147483646;
  v17 = *(unsigned __int8 *)(v8 + 80);
  v20 = *(unsigned __int8 *)(v10 + 80);
  v22 = *(unsigned __int8 *)(v13 + 80);
  v23 = *(_QWORD *)(v13 + 64);
  if (!v14)
    ++v23;
  v21 = *(_QWORD *)(v10 + 64);
  v19 = *(_QWORD *)(v8 + 64);
  v18 = *(_QWORD *)(v6 + 64) + v17;
  if (v16 < a3)
  {
    if ((((_DWORD)v23
         + 7
         + (((_DWORD)v21
           + (_DWORD)v22
           + (((_DWORD)v19 + (_DWORD)v20 + (v18 & ~(_DWORD)v17)) & ~(_DWORD)v20)) & ~(_DWORD)v22)) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v24 = a3 - v16 + 1;
    else
      v24 = 2;
    if (v24 >= 0x10000)
      v25 = 4;
    else
      v25 = 2;
    if (v24 < 0x100)
      v25 = 1;
    if (v24 >= 2)
      v12 = v25;
    else
      v12 = 0;
  }
  if (a2 > v16)
  {
    if ((((_DWORD)v23
         + 7
         + (((_DWORD)v21
           + (_DWORD)v22
           + (((_DWORD)v19 + (_DWORD)v20 + (v18 & ~(_DWORD)v17)) & ~(_DWORD)v20)) & ~(_DWORD)v22)) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v26 = ~v16 + a2;
      bzero(a1, ((v23 + 7 + ((v21 + v22 + ((v19 + v20 + (v18 & ~v17)) & ~v20)) & ~v22)) & 0xFFFFFFFFFFFFFFF8) + 16);
      *a1 = v26;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X6 }
}

uint64_t sub_18B5E2654@<X0>(uint64_t result@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void);
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int v24;

  *(_BYTE *)(result + v19) = 0;
  if (a2)
  {
    if (v24 == v3)
    {
      v20 = *(uint64_t (**)(void))(v14 + 56);
      return v20();
    }
    v21 = (v10 + result) & v18;
    if (v17 == v3)
    {
      v20 = *(uint64_t (**)(void))(v12 + 56);
      return v20();
    }
    v22 = (v21 + v8 + v7) & v13;
    if (v16 == v3)
    {
      v20 = *(uint64_t (**)(void))(v15 + 56);
      return v20();
    }
    result = (v22 + v6 + v5) & v11;
    if (v4 == v3)
    {
      v20 = *(uint64_t (**)(void))(a3 + 56);
      return v20();
    }
    v23 = (_QWORD *)((v9 + result) & 0xFFFFFFFFFFFFFFF8);
    if (a2 > 0x7FFFFFFE)
    {
      *v23 = 0;
      v23[1] = 0;
      *(_DWORD *)v23 = a2 - 0x7FFFFFFF;
    }
    else
    {
      *v23 = a2;
    }
  }
  return result;
}

void sub_18B5E26B4(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_WORD *)(a1 + v2) = 0;
  if (!a2)
    JUMPOUT(0x18B5E26BCLL);
  JUMPOUT(0x18B5E2678);
}

uint64_t type metadata completion function for Publishers.Timeout.Inner()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F)
          return swift_initClassMetadata2();
      }
    }
  }
  return AssociatedTypeWitness;
}

uint64_t sub_18B5E291C()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v3)- 8)+ 80);
  v5 = (v4 + 72) & ~v4;
  swift_release();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v5, 1, AssociatedTypeWitness))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v5, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_18B5E2A00()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_18B5E2A90()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t one-time initialization function for observableObservableObjectAvailable()
{
  uint64_t result;

  result = observableObservableObjectAvailableCheck();
  static CombineFeatures.observableObservableObjectAvailable = result & 1;
  return result;
}

int *Publishers.Buffer.init(upstream:size:prefetch:whenFull:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *result;
  _QWORD *v16;

  v11 = *a3;
  v12 = *a4;
  v13 = a4[1];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(a7, a1, a5);
  result = (int *)type metadata accessor for Publishers.Buffer(0, a5, a6, v14);
  *(_QWORD *)(a7 + result[9]) = a2;
  *(_BYTE *)(a7 + result[10]) = v11;
  v16 = (_QWORD *)(a7 + result[11]);
  *v16 = v12;
  v16[1] = v13;
  return result;
}

BOOL static Publishers.PrefetchStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void Publishers.PrefetchStrategy.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int Publishers.PrefetchStrategy.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Publishers.PrefetchStrategy(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Publishers.PrefetchStrategy()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Publishers.PrefetchStrategy()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Publishers.PrefetchStrategy()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Publishers.Buffer.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Buffer.size.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

uint64_t Publishers.Buffer.prefetch.getter@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + *(int *)(result + 40));
  return result;
}

unint64_t Publishers.Buffer.whenFull.getter@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (unint64_t *)(v2 + *(int *)(a1 + 44));
  v4 = *v3;
  v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return outlined copy of Publishers.BufferingStrategy<A><A>(v4);
}

uint64_t *Publishers.Buffer.Inner.__allocating_init(_:size:prefetch:whenFull:)(uint64_t a1, uint64_t a2, char *a3, uint64_t *a4)
{
  swift_allocObject();
  return Publishers.Buffer.Inner.init(_:size:prefetch:whenFull:)(a1, a2, a3, a4);
}

unint64_t lazy protocol witness table accessor for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy;
  if (!lazy protocol witness table cache variable for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy)
  {
    result = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.PrefetchStrategy, &type metadata for Publishers.PrefetchStrategy);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Publishers.PrefetchStrategy and conformance Publishers.PrefetchStrategy);
  }
  return result;
}

void Publishers.Buffer.Inner.receive(completion:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  int v16;
  char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[48];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v6 = type metadata accessor for Subscribers.Completion(255, AssociatedTypeWitness, AssociatedConformanceWitness, v5);
  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v20 - v12;
  v14 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v14);
  v15 = (uint64_t)v1 + *(_QWORD *)(*v1 + 160);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v15, (uint64_t)v22);
  v16 = v22[40];
  outlined destroy of SubscriptionStatus((uint64_t)v22);
  if (v16
    || (v21 = a1,
        v17 = (char *)v1 + *(_QWORD *)(*v1 + 192),
        swift_beginAccess(),
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v17, v7),
        v18 = *(_QWORD *)(v6 - 8),
        v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v13, 1, v6),
        (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7),
        v19 != 1))
  {
    os_unfair_lock_unlock(v14);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v11, v21, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v6);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v17, v11, v7);
    swift_endAccess();
    os_unfair_lock_unlock(v14);
    Publishers.Buffer.Inner.drain()();
  }
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Buffer<A>.Inner<A1>(uint64_t a1)
{
  Publishers.Buffer.Inner.receive(completion:)(a1);
}

uint64_t storeEnumTagSinglePayload for Publishers.PrefetchStrategy(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_18B5E302C + 4 * byte_18B5FCA75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18B5E3060 + 4 * byte_18B5FCA70[v4]))();
}

uint64_t sub_18B5E3060(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B5E3068(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B5E3070);
  return result;
}

uint64_t sub_18B5E307C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B5E3084);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18B5E3088(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B5E3090(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Publishers.BufferingStrategy(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *assignWithCopy for Publishers.BufferingStrategy(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

unint64_t *assignWithTake for Publishers.BufferingStrategy(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.BufferingStrategy(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Publishers.BufferingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t getEnumTag for Publishers.BufferingStrategy(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Buffer(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
    v12 = ((unint64_t)v4 + v6 + 23) & 0xFFFFFFFFFFFFFFF8;
    v13 = ((unint64_t)a2 + v6 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v13 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v12 = *(_OWORD *)v13;
      return v4;
    }
    v14 = *(_QWORD *)(v13 + 8);
    *(_QWORD *)v12 = *(_QWORD *)v13;
    *(_QWORD *)(v12 + 8) = v14;
  }
  swift_retain();
  return v4;
}

uint64_t assignWithCopy for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = v6 + a1;
  v8 = v6 + a2;
  v9 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  v11 = (_QWORD *)((v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (unint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = *v12;
  if (*v11 < 0xFFFFFFFFuLL)
  {
    if (v13 >= 0xFFFFFFFF)
    {
      v15 = v12[1];
      *v11 = v13;
      v11[1] = v15;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    return a1;
  }
  if (v13 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v14 = v12[1];
  *v11 = v13;
  v11[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = v6 + a1;
  v8 = v6 + a2;
  v9 = (v6 + a1 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  v11 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v12 = (uint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = *v12;
  if ((unint64_t)*v12 < 0xFFFFFFFF)
  {
    *(_OWORD *)v11 = *(_OWORD *)v12;
  }
  else
  {
    v14 = v12[1];
    *(_QWORD *)v11 = v13;
    *(_QWORD *)(v11 + 8) = v14;
  }
  return a1;
}

uint64_t assignWithTake for Publishers.Buffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = v6 + a1;
  v8 = v6 + a2;
  v9 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  v11 = (_QWORD *)((v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (unint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = *v12;
  if (*v11 < 0xFFFFFFFFuLL)
  {
    if (v13 >= 0xFFFFFFFF)
    {
      v15 = v12[1];
      *v11 = v13;
      v11[1] = v15;
      return a1;
    }
LABEL_7:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    return a1;
  }
  if (v13 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v14 = v12[1];
  *v11 = v13;
  v11[1] = v14;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Buffer(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFD)
    v6 = 2147483645;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFD)
    {
      v12 = *(_QWORD *)((a1 + v7 + 23) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      v13 = v12 + 1;
      v14 = v12 - 1;
      if (v13 >= 3)
        return v14;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5E3678 + 4 * byte_18B5FCA7A[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.Buffer(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFDu)
    v6 = 2147483645;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5E3804()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5E3890);
}

void sub_18B5E380C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5E3814);
  JUMPOUT(0x18B5E3890);
}

void sub_18B5E3860()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5E3890);
}

void sub_18B5E3868()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5E3890);
}

uint64_t sub_18B5E3870(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFD)
  {
    if (a2 > 0x7FFFFFFD)
      JUMPOUT(0x18B5E387CLL);
    *(_QWORD *)((v6 + v5 + 23) & 0xFFFFFFFFFFFFFFF8) = a2 + 1;
LABEL_6:
    JUMPOUT(0x18B5E3890);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

void Publishers.Buffer.Inner.customMirror.getter(uint64_t a1@<X8>)
{
  os_unfair_lock_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_unfair_lock_t v13;
  char *v14;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_unfair_lock_t *v25;

  v24 = a1;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v23 = (uint64_t)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_unfair_lock_lock(v1[2]);
  v25 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_18B5F5C60;
  *(_QWORD *)(v7 + 32) = 0x7365756C6176;
  *(_QWORD *)(v7 + 40) = 0xE600000000000000;
  v8 = (uint64_t *)((char *)v1 + *(_QWORD *)&(*v1)[44]._os_unfair_lock_opaque);
  swift_beginAccess();
  v22 = *v8;
  v9 = v22;
  swift_getAssociatedTypeWitness();
  v10 = type metadata accessor for Array();
  *(_QWORD *)(v7 + 48) = v9;
  *(_QWORD *)(v7 + 72) = v10;
  *(_QWORD *)(v7 + 80) = 0x6574617473;
  *(_QWORD *)(v7 + 88) = 0xE500000000000000;
  v11 = (uint64_t)v1 + *(_QWORD *)&(*v1)[40]._os_unfair_lock_opaque;
  swift_beginAccess();
  *(_QWORD *)(v7 + 120) = &type metadata for SubscriptionStatus;
  v12 = swift_allocObject();
  *(_QWORD *)(v7 + 96) = v12;
  outlined init with copy of SubscriptionStatus(v11, v12 + 16);
  *(_QWORD *)(v7 + 128) = 0xD000000000000010;
  *(_QWORD *)(v7 + 136) = 0x800000018B5FEDC0;
  v13 = *v1;
  *(_QWORD *)(v7 + 144) = *(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)&(*v1)[42]._os_unfair_lock_opaque);
  *(_QWORD *)(v7 + 168) = &type metadata for Subscribers.Demand;
  *(_QWORD *)(v7 + 176) = 0x6C616E696D726574;
  *(_QWORD *)(v7 + 184) = 0xE800000000000000;
  v14 = (char *)v1 + *(_QWORD *)&v13[48]._os_unfair_lock_opaque;
  swift_beginAccess();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Subscribers.Completion(255, AssociatedTypeWitness, AssociatedConformanceWitness, v17);
  v18 = type metadata accessor for Optional();
  *(_QWORD *)(v7 + 216) = v18;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v7 + 192));
  (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(boxed_opaque_existential_1, v14, v18);
  v20 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v6, 1, 1, v20);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v23);
  swift_retain();
  swift_bridgeObjectRetain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(v1[2]);
}

void Publishers.Buffer.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x726566667542;
  a1[1] = 0xE600000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Buffer<A>.Inner<A1>()
{
  return 0x726566667542;
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Buffer<A>.Inner<A1>(uint64_t a1@<X8>)
{
  Publishers.Buffer.Inner.customMirror.getter(a1);
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Buffer<A>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Buffer.Inner.playgroundDescription.getter(a1);
}

unint64_t outlined consume of Publishers.BufferingStrategy<A.Failure><A><A1>(unint64_t result)
{
  if (result >= 2)
    return swift_release();
  return result;
}

uint64_t sub_18B5E3C54()
{
  uint64_t v0;

  if (*(unsigned __int8 *)(v0 + 56) <= 1u)
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t Publishers.Sequence.sequence.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Sequence.Inner.description.getter()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[4];

  v1 = v0;
  v2 = *v0;
  v3 = *(_QWORD *)(*v0 + 104);
  v4 = type metadata accessor for Optional();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - v6;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(v2 + 200)));
  v8 = (uint64_t)v1 + *(_QWORD *)(*v1 + 152);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v7, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_6:
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CustomStringConvertible);
  if (!swift_dynamicCast())
    goto LABEL_6;
  if (!*((_QWORD *)&v13 + 1))
  {
LABEL_7:
    outlined destroy of CustomStringConvertible?((uint64_t)&v12);
    v9 = 0x65636E6575716553;
    goto LABEL_8;
  }
  outlined init with take of Subscription(&v12, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  v9 = dispatch thunk of CustomStringConvertible.description.getter();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
LABEL_8:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 200)));
  return v9;
}

void Publishers.Sequence.Inner.customMirror.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21[3];
  uint64_t v22;
  uint64_t *v23;

  v20[1] = a1;
  v2 = *v1;
  v3 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v2 + 104);
  v10 = type metadata accessor for Optional();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v20 - v12;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(v2 + 200)));
  v23 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_18B5F41E0;
  *(_QWORD *)(v14 + 32) = 0x65636E6575716573;
  *(_QWORD *)(v14 + 40) = 0xE800000000000000;
  v15 = (uint64_t)v1 + *(_QWORD *)(*v1 + 152);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v15, v10);
  v16 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v9) == 1)
  {
    v17 = *(void (**)(char *, uint64_t))(v11 + 8);
    swift_retain();
    v17(v13, v10);
    *(_QWORD *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
    *(_QWORD *)(v14 + 48) = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v22 = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
    (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(boxed_opaque_existential_1, v13, v9);
    outlined init with take of Any(v21, (_OWORD *)(v14 + 48));
    swift_retain();
  }
  v19 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v5);
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 200)));
}

uint64_t Publishers.Sequence.Inner.playgroundDescription.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Publishers.Sequence.Inner.description.getter();
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>()
{
  return Publishers.Sequence.Inner.description.getter();
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>(uint64_t a1@<X8>)
{
  Publishers.Sequence.Inner.customMirror.getter(a1);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Sequence<A, B>.Inner<A1, B1, C1>@<X0>(uint64_t *a1@<X8>)
{
  return Publishers.Sequence.Inner.playgroundDescription.getter(a1);
}

uint64_t Publishers.Sequence<>.min(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence<>.min(by:)(a1, a2, a3, MEMORY[0x1E0DEAAE8], a4);
}

uint64_t Publishers.Sequence<>.max(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence<>.min(by:)(a1, a2, a3, MEMORY[0x1E0DEAAE0], a4);
}

uint64_t Publishers.Sequence<>.first(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence<>.min(by:)(a1, a2, a3, MEMORY[0x1E0DEAB00], a4);
}

uint64_t Publishers.Sequence<>.min(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;

  v9 = *(_QWORD *)(a3 + 32);
  v10 = *(_QWORD *)(a3 + 16);
  swift_getAssociatedTypeWitness();
  v11 = type metadata accessor for Optional();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v16 - v13;
  a4(a1, a2, v10, v9);
  Optional.publisher.getter(v11, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t Publishers.Sequence.allSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.allSatisfy(_:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0DEAAA0], a4);
}

uint64_t Publishers.Sequence.tryAllSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.tryAllSatisfy(_:)(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0DEAAA0], a4);
}

uint64_t Publishers.Sequence.collect()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v14;

  v3 = v2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  type metadata accessor for Array();
  v9 = type metadata accessor for Result();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v14 - v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  *v12 = Array.init<A>(_:)();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v9, a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t Publishers.Sequence.compactMap<A>(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = Sequence.compactMap<A>(_:)();
  v2 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v2);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(a1, &v4, v2);
}

uint64_t Publishers.Sequence.contains(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.allSatisfy(_:)(a1, a2, a3, MEMORY[0x1E0DEAB48], a4);
}

uint64_t Publishers.Sequence.allSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v15;

  v10 = type metadata accessor for Result();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v15 - v12;
  *v13 = a4(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32)) & 1;
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v10, a5);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t Publishers.Sequence.tryContains(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.tryAllSatisfy(_:)(a1, a2, a3, MEMORY[0x1E0DEAB48], a4);
}

uint64_t Publishers.Sequence.tryAllSatisfy(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD)@<X3>, uint64_t a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 32));
  *(_QWORD *)a5 = result & 1;
  *(_BYTE *)(a5 + 8) = 0;
  return result;
}

uint64_t Publishers.Sequence.drop(while:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];

  v13[0] = a3;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DropWhileSequence();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v13 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, v4);
  Sequence.drop(while:)();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEC9E0], v8);
  return (*(uint64_t (**)(_QWORD, char *, uint64_t))(v9 + 32))(v13[0], v11, v8);
}

uint64_t Publishers.Sequence.dropFirst(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t Sequence;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  Sequence = type metadata accessor for DropFirstSequence();
  v10 = *(_QWORD *)(Sequence - 8);
  MEMORY[0x1E0C80A78](Sequence);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  Sequence.dropFirst(_:)();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEC9D0], Sequence);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, Sequence);
}

uint64_t Publishers.Sequence.filter(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.filter(_:)(a1, a2, a3, MEMORY[0x1E0DEAB08], a4);
}

uint64_t Publishers.Sequence.ignoreOutput()@<X0>(_BYTE *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  return Empty.init(completeImmediately:)(1, a1);
}

uint64_t Publishers.Sequence.map<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[16];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v11 = *(_QWORD *)(a3 + 16);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](a1);
  v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v14, v5, v11);
  v15 = *(_QWORD *)(a3 + 24);
  v21 = v11;
  v22 = v15;
  v23 = a4;
  v24 = *(_OWORD *)(a3 + 32);
  v25 = a1;
  v26 = a2;
  v17 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@in_guaranteed A.Sequence.Element) -> (@out A1), (uint64_t)v20, v11, a4, MEMORY[0x1E0DEDCE8], v24, MEMORY[0x1E0DEDD18], v16);
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  v27 = v17;
  v18 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v18);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, &v27, v18);
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  Swift::Int v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = type metadata accessor for Optional();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x1E0C80A78](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x1E0C80A78](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x1E0C80A78](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x1E0C80A78](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = dispatch thunk of Sequence.underestimatedCount.getter();
  v57 = Array.init()();
  v53 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v31);
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = dispatch thunk of Sequence.makeIterator()();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      dispatch thunk of IteratorProtocol.next()();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  dispatch thunk of IteratorProtocol.next()();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      ContiguousArray.append(_:)();
      dispatch thunk of IteratorProtocol.next()();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t Publishers.Sequence.prefix(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PrefixSequence();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
  Sequence.prefix(_:)();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEC5D0], v9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, v9);
}

uint64_t Publishers.Sequence.prefix(while:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return Publishers.Sequence.filter(_:)(a1, a2, a3, MEMORY[0x1E0DEAB10], a4);
}

uint64_t Publishers.Sequence.filter(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  v11 = *(_QWORD *)(a3 + 16);
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v11);
  v16[0] = a4(a1, a2, v11, *(_QWORD *)(a3 + 32));
  swift_getAssociatedTypeWitness();
  v14 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v14);
  return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a5, v16, v14);
}

uint64_t Publishers.Sequence.reduce<A>(_:_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = type metadata accessor for Result();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - v4;
  Sequence.reduce<A>(_:_:)();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence.tryReduce<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = v6;
  v20 = a6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v13 = type metadata accessor for Result();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v19 - v15;
  v17 = *(_OWORD *)(a4 + 32);
  v21 = *(_OWORD *)(a4 + 16);
  v22 = a5;
  v23 = v17;
  v24 = v7;
  v25 = a1;
  v26 = a2;
  v27 = a3;
  _ss6ResultOsRi_zrlE8catchingAByxq_Gxyq_YKXE_tcfC((void (*)(_BYTE *))partial apply for closure #1 in Publishers.Sequence.tryReduce<A>(_:_:), (uint64_t)&v19 - v15);
  Result.publisher.getter(v13, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t Publishers.Sequence.replaceNil<A>(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v4, v9);
  v13 = *(_QWORD *)(a2 + 24);
  v18 = v9;
  v19 = v13;
  v20 = a3;
  v17 = *(_OWORD *)(a2 + 32);
  v21 = v17;
  v22 = a1;
  type metadata accessor for Optional();
  v14 = Sequence.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v23 = v14;
  v15 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v15);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a4, &v23, v15);
}

uint64_t closure #1 in Publishers.Sequence.replaceNil<A>(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, char *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v18;

  v8 = type metadata accessor for Optional();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v18 - v11;
  v13 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(a4, a2, a3);
  }
  else
  {
    v16 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v16(v15, v12, a3);
    v16(a4, v15, a3);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(a4, 0, 1, a3);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, v8);
}

uint64_t Publishers.Sequence.scan<A>(_:_:)@<X0>(void (*a1)(_QWORD, _QWORD, _QWORD)@<X0>, void (*a2)(char *, char *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(_QWORD, _QWORD, _QWORD);
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t AssociatedConformanceWitness;
  void (*v36)(_QWORD, _QWORD, _QWORD);
  void (*v37)(char *, char *);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v36 = a1;
  v37 = a2;
  v38 = a3;
  v34 = a6;
  v7 = *(_QWORD *)(a4 + 16);
  v32 = *(_QWORD *)(a4 + 32);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v10 = (char *)&v30 - v9;
  v11 = type metadata accessor for Optional();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v30 - v13;
  v31 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = swift_getAssociatedTypeWitness();
  v33 = *(_QWORD *)(v41 - 8);
  v17 = MEMORY[0x1E0C80A78](v41);
  v40 = (char *)&v30 - v18;
  v19 = *(_QWORD *)(a5 - 8);
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v30 - v23;
  v43 = static Array._allocateUninitialized(_:)();
  v25 = v36;
  v36 = *(void (**)(_QWORD, _QWORD, _QWORD))(v19 + 16);
  v36(v24, v25, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v16, AssociatedConformanceWitness, v7);
  dispatch thunk of Sequence.makeIterator()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  dispatch thunk of IteratorProtocol.next()();
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v26(v14, 1, AssociatedTypeWitness) != 1)
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
    do
    {
      v27(v10, v14, AssociatedTypeWitness);
      v37(v24, v10);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v24, a5);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v22, a5);
      v36(v22, v24, a5);
      type metadata accessor for Array();
      Array.append(_:)();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v10, AssociatedTypeWitness);
      dispatch thunk of IteratorProtocol.next()();
    }
    while (v26(v14, 1, AssociatedTypeWitness) != 1);
  }
  (*(void (**)(char *, uint64_t))(v33 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, a5);
  v42 = v43;
  v28 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v28);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v34, &v42, v28);
}

uint64_t Publishers.Sequence<>.removeDuplicates()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t AssociatedConformanceWitness;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  void (*v30)(_QWORD, _QWORD, _QWORD);
  void (*v31)(char *, uint64_t);
  _QWORD *v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  unsigned int v35;
  _QWORD *v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(char *, uint64_t, uint64_t);
  void (*v42)(char *, uint64_t, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  void (*v45)(_QWORD, _QWORD, _QWORD);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;

  v39 = a3;
  v40 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  v45 = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 32);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v49 = *(_QWORD **)(AssociatedTypeWitness - 8);
  v5 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v43 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (void (**)(char *, uint64_t, uint64_t))((char *)&v38 - v8);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v38 - v11;
  v41 = *(void (***)(char *, uint64_t, uint64_t))(v3 - 8);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v47 = (char *)&v38 - v15;
  v16 = type metadata accessor for Optional();
  v44 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v38 - v21;
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v38 - v23;
  v51 = static Array._allocateUninitialized(_:)();
  v42 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v49[7];
  v42(v24, 1, 1, AssociatedTypeWitness);
  v41[2](v14, v46, v3);
  dispatch thunk of Sequence.makeIterator()();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v26 = v44;
  v46 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  v27 = (unsigned int (*)(char *, uint64_t, uint64_t))v49[6];
  if (v27(v22, 1, AssociatedTypeWitness) != 1)
  {
    v30 = (void (*)(_QWORD, _QWORD, _QWORD))v49[4];
    v41 = v9;
    v45 = v30;
    v30(v12, v22, AssociatedTypeWitness);
    while (1)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v19, v24, v16);
      if (v27(v19, 1, AssociatedTypeWitness) == 1)
      {
        v31 = *(void (**)(char *, uint64_t))(v26 + 8);
        v31(v24, v16);
        v31(v19, v16);
        v32 = v49;
        v33 = (void (*)(char *, char *, uint64_t))v49[2];
        v33(v24, v12, AssociatedTypeWitness);
        v42(v24, 0, 1, AssociatedTypeWitness);
        v33(v43, v12, AssociatedTypeWitness);
        type metadata accessor for Array();
        v26 = v44;
        Array.append(_:)();
        v34 = (void (*)(char *, uint64_t))v32[1];
        v9 = v41;
      }
      else
      {
        v30(v9, v19, AssociatedTypeWitness);
        if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
        {
          v34 = (void (*)(char *, uint64_t))v49[1];
          v34((char *)v9, AssociatedTypeWitness);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v16);
          v36 = v49;
          v37 = (void (*)(char *, char *, uint64_t))v49[2];
          v37(v24, v12, AssociatedTypeWitness);
          v42(v24, 0, 1, AssociatedTypeWitness);
          v37(v43, v12, AssociatedTypeWitness);
          type metadata accessor for Array();
          v26 = v44;
          Array.append(_:)();
          v34 = (void (*)(char *, uint64_t))v36[1];
          v9 = v41;
          v34((char *)v41, AssociatedTypeWitness);
        }
      }
      v34(v12, AssociatedTypeWitness);
      dispatch thunk of IteratorProtocol.next()();
      v35 = v27(v22, 1, AssociatedTypeWitness);
      v30 = v45;
      if (v35 == 1)
        break;
      v45(v12, v22, AssociatedTypeWitness);
    }
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v16);
  v50 = v51;
  v28 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v28);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v39, &v50, v28);
}

uint64_t Publishers.Sequence<>.contains(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v7;

  v2 = type metadata accessor for Result();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - v4;
  *v5 = Sequence<>.contains(_:)() & 1;
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.min()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Publishers.Sequence<>.min()(a1, a2, MEMORY[0x1E0DEAB80], a3);
}

uint64_t Publishers.Sequence<>.max()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Publishers.Sequence<>.min()(a1, a2, MEMORY[0x1E0DEAB78], a3);
}

uint64_t Publishers.Sequence<>.min()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 16);
  swift_getAssociatedTypeWitness();
  v9 = type metadata accessor for Optional();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v14 - v11;
  a3(v8, v7, a2);
  Optional.publisher.getter(v9, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t Publishers.Sequence<>.first()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  swift_getAssociatedTypeWitness();
  v2 = type metadata accessor for Optional();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - v4;
  Collection.first.getter();
  Optional.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.output(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[32];

  v15 = a1;
  v16 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v15 - v4;
  v6 = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - v8;
  dispatch thunk of Collection.indices.getter();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v10 = Sequence<>.contains(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    v11 = (void (*)(_BYTE *, _QWORD))dispatch thunk of Collection.subscript.read();
    v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *))(v12 + 16))(v5);
    v11(v17, 0);
    v13 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v5, v13, 1, AssociatedTypeWitness);
  return Optional.Publisher.init(_:)((uint64_t)v5, v16);
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[32];

  v15 = a1;
  v16 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = type metadata accessor for Optional();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v15 - v4;
  v6 = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - v8;
  dispatch thunk of Collection.indices.getter();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v10 = Sequence<>.contains(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) != 0)
  {
    v11 = (void (*)(_BYTE *, _QWORD))dispatch thunk of Collection.subscript.read();
    v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *))(v12 + 16))(v5);
    v11(v17, 0);
    v13 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v5, v13, 1, AssociatedTypeWitness);
  return Optional.Publisher.init(_:)((uint64_t)v5, v16);
}

uint64_t Publishers.Sequence<>.count()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;

  v2 = type metadata accessor for Result();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v7 - v4);
  *v5 = dispatch thunk of Collection.count.getter();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;

  v2 = type metadata accessor for Result();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v7 - v4);
  *v5 = dispatch thunk of Collection.count.getter();
  swift_storeEnumTagMultiPayload();
  Result.publisher.getter(v2, a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.output(in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  v16[1] = a1;
  v17 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v16[0] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v16 - v6;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v8 = type metadata accessor for Range();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v16 - v10;
  Range.relative<A>(to:)();
  dispatch thunk of Collection.subscript.getter();
  v12 = v16[0];
  (*(void (**)(char *, char *, uint64_t))(v16[0] + 16))(v5, v7, AssociatedTypeWitness);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v13 = Array.init<A>(_:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = v13;
  v14 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v14);
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v17, &v18, v14);
}

uint64_t Publishers.Sequence<>.last()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  swift_getAssociatedTypeWitness();
  v2 = type metadata accessor for Optional();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - v4;
  BidirectionalCollection.last.getter();
  Optional.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.last(where:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  swift_getAssociatedTypeWitness();
  v2 = type metadata accessor for Optional();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - v4;
  BidirectionalCollection.last(where:)();
  Optional.publisher.getter(v2, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Publishers.Sequence<>.output(in:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t AssociatedConformanceWitness;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  uint64_t v65;
  char *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t AssociatedTypeWitness;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t TupleTypeMetadata2;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v78 = a1;
  v85 = a4;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 8) + 8);
  v6 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v82 = (char *)&v70 - v7;
  v8 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v70 - v13;
  v76 = *(char **)(v8 - 8);
  v15 = MEMORY[0x1E0C80A78](v12);
  v79 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v15);
  v88 = (char *)&v70 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v70 - v20;
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v70 - v22;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v25 = type metadata accessor for Range();
  v90 = *(_QWORD *)(v25 - 8);
  v91 = v25;
  v26 = MEMORY[0x1E0C80A78](v25);
  v89 = (char *)&v70 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v70 - v29;
  MEMORY[0x1E0C80A78](v28);
  v80 = (char *)&v70 - v31;
  dispatch thunk of Collection.startIndex.getter();
  v81 = v4;
  v84 = v6;
  dispatch thunk of Collection.endIndex.getter();
  v77 = AssociatedConformanceWitness;
  result = dispatch thunk of static Comparable.<= infix(_:_:)();
  if ((result & 1) != 0)
  {
    v75 = v5;
    v33 = TupleTypeMetadata2;
    v34 = &v14[*(int *)(TupleTypeMetadata2 + 48)];
    v86 = v30;
    v35 = v76;
    v36 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v76 + 4);
    v36(v14, v23, v8);
    v36(v34, v21, v8);
    v37 = &v11[*(int *)(v33 + 48)];
    v38 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v35 + 2);
    v38(v11, v14, v8);
    v71 = v38;
    v38(v37, v34, v8);
    v39 = v89;
    v36(v89, v11, v8);
    v40 = (void (*)(char *, uint64_t))*((_QWORD *)v35 + 1);
    v40(v37, v8);
    v41 = &v11[*(int *)(v33 + 48)];
    v76 = v14;
    v36(v11, v14, v8);
    v36(v41, v34, v8);
    v42 = v91;
    v36(&v39[*(int *)(v91 + 36)], v41, v8);
    v73 = v11;
    v74 = v40;
    v40(v11, v8);
    v43 = v86;
    v72 = *(void (**)(char *, char *, uint64_t))(v90 + 32);
    v72(v86, v39, v42);
    v44 = v78;
    if ((dispatch thunk of static Comparable.> infix(_:_:)() & 1) != 0)
    {
      v45 = v71;
      v71(v88, v43, v8);
    }
    else
    {
      v45 = v71;
      v46 = &v43[*(int *)(v42 + 36)];
      if ((dispatch thunk of static Comparable.< infix(_:_:)() & 1) != 0)
      {
        v47 = v88;
        v48 = v46;
      }
      else
      {
        v47 = v88;
        v48 = v44;
      }
      v45(v47, v48, v8);
      v42 = v91;
    }
    v49 = v73;
    v50 = *(int *)(v42 + 36);
    v51 = &v43[v50];
    v52 = &v44[v50];
    if ((dispatch thunk of static Comparable.< infix(_:_:)() & 1) != 0)
    {
      v53 = v79;
      v45(v79, v51, v8);
      v55 = v89;
      v54 = v90;
      v56 = v76;
    }
    else
    {
      v57 = dispatch thunk of static Comparable.> infix(_:_:)();
      v55 = v89;
      v56 = v76;
      v53 = v79;
      if ((v57 & 1) != 0)
      {
        v58 = v79;
        v59 = v43;
      }
      else
      {
        v58 = v79;
        v59 = v52;
      }
      v45(v58, v59, v8);
      v54 = v90;
    }
    v60 = TupleTypeMetadata2;
    v61 = &v56[*(int *)(TupleTypeMetadata2 + 48)];
    v36(v56, v88, v8);
    v36(v61, v53, v8);
    v62 = &v49[*(int *)(v60 + 48)];
    v45(v49, v56, v8);
    v45(v62, v61, v8);
    v36(v55, v49, v8);
    v63 = v74;
    v74(v62, v8);
    v64 = &v49[*(int *)(v60 + 48)];
    v36(v49, v56, v8);
    v36(v64, v61, v8);
    v65 = v91;
    v36(&v55[*(int *)(v91 + 36)], v64, v8);
    v63(v49, v8);
    v66 = v80;
    v72(v80, v55, v65);
    v67 = *(void (**)(char *, uint64_t))(v54 + 8);
    v67(v86, v65);
    dispatch thunk of Collection.subscript.getter();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    v68 = Array.init<A>(_:)();
    v67(v66, v65);
    v92 = v68;
    v69 = type metadata accessor for Array();
    MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v69);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v69 - 8) + 32))(v85, &v92, v69);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Publishers.Sequence<>.count()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = dispatch thunk of Collection.count.getter();
  *a1 = result;
  return result;
}

uint64_t Publishers.Sequence<>.prepend(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = v6;
  swift_getAssociatedTypeWitness();
  v9 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF38], v9);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v8, v4);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t Publishers.Sequence<>.prepend<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t Publishers.Sequence<>.append(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = v6;
  swift_getAssociatedTypeWitness();
  v9 = type metadata accessor for Array();
  MEMORY[0x18D77ACE4](MEMORY[0x1E0DEAF58], v9);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v8, v4);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t Publishers.Sequence<>.append<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static RangeReplaceableCollection.+ infix<A>(_:_:)();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t static Publishers.Sequence<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Sequence<A, B>()
{
  return static Publishers.Sequence<>.== infix(_:_:)();
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed A.Sequence.Element) -> (@out A1)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t partial apply for closure #1 in Publishers.Sequence.tryReduce<A>(_:_:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;

  result = Sequence.reduce<A>(_:_:)();
  if (v1)
    *a1 = v1;
  return result;
}

uint64_t partial apply for closure #1 in Publishers.Sequence.replaceNil<A>(with:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in Publishers.Sequence.replaceNil<A>(with:)(a1, *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 32), a2);
}

uint64_t outlined destroy of CustomStringConvertible?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CustomStringConvertible?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void Publisher.zip<A, B>(_:_:)(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x1E0C80A78](a1);
  MEMORY[0x1E0C80A78](v1);
  type metadata accessor for Publishers.Zip();
}

void sub_18B5E75E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;

  *(_QWORD *)(v17 - 152) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v19 = (char *)&a9 - v18;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16))(v14, *(_QWORD *)(v17 - 160), v16);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v11, *(_QWORD *)(v17 - 168), v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v19, v14, v16);
  *(_QWORD *)(v17 - 112) = v16;
  *(_QWORD *)(v17 - 104) = v15;
  *(_QWORD *)(v17 - 96) = v13;
  *(_QWORD *)(v17 - 88) = v12;
  type metadata accessor for Publishers.Zip();
}

uint64_t sub_18B5E7664(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v8 + *(int *)(a1 + 52), v2, v5);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v6;
  v10[3] = v5;
  v11 = *(_QWORD *)(v9 - 144);
  v12 = *(_QWORD *)(v9 - 136);
  v10[4] = v12;
  v10[5] = v4;
  v10[6] = v3;
  v10[7] = v11;
  v10[8] = *(_QWORD *)(v9 - 128);
  v13 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.Zip<A, B>, v7);
  Publisher.map<A>(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A1.Publisher.Output) -> (@out B1), (uint64_t)v10, v7, v12, v13, *(_QWORD *)(v9 - 120));
  swift_retain();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 152) + 8))(v8, v7);
}

uint64_t sub_18B5E7724()
{
  swift_release();
  return swift_deallocObject();
}

void Publisher.zip<A, B>(_:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[4];

  v27[1] = a8;
  v27[2] = a6;
  v27[3] = a7;
  v27[0] = a9;
  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x1E0C80A78](a1);
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x1E0C80A78](v15);
  v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v25 + 16))(v24, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a2, a5);
  Publishers.Zip3.init(_:_:_:)((uint64_t)v24, a3, v27[0]);
}

void Publishers.Zip3.init(_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for Publishers.Zip3();
}

uint64_t sub_18B5E790C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v5 + *(int *)(a1 + 68), v4, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v5 + *(int *)(a1 + 72), v3, v1);
}

void type metadata accessor for Publishers.Zip3()
{
  JUMPOUT(0x18D77AC60);
}

void Publisher.zip<A, B, C>(_:_:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = MEMORY[0x1E0C80A78](a1);
  v2 = MEMORY[0x1E0C80A78](v1);
  MEMORY[0x1E0C80A78](v2);
  type metadata accessor for Publishers.Zip3();
}

void sub_18B5E7A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;

  *(_QWORD *)(v17 - 176) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v19 = (char *)&a9 - v18;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 16))(v11, *(_QWORD *)(v17 - 192), v14);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 16))(v10, *(_QWORD *)(v17 - 200), v13);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 208) + 16))(v9, *(_QWORD *)(v17 - 184), v12);
  Publishers.Zip3.init(_:_:_:)(v11, v14, (uint64_t)v19);
}

uint64_t sub_18B5E7B04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = v3;
  v10 = *(_QWORD *)(v8 - 168);
  v11 = *(_QWORD *)(v8 - 160);
  v9[4] = v2;
  v9[5] = v11;
  v9[6] = v6;
  v9[7] = v1;
  v9[8] = v5;
  v9[9] = v10;
  v9[10] = *(_QWORD *)(v8 - 152);
  v12 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.Zip3<A, B, C>, v7);
  Publisher.map<A>(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A1.Publisher.Output, @in_guaranteed B1.Publisher.Output) -> (@out C1), (uint64_t)v9, v7, v11, v12, *(_QWORD *)(v8 - 144));
  swift_retain();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 176) + 8))(v0, v7);
}

uint64_t sub_18B5E7BB0()
{
  swift_release();
  return swift_deallocObject();
}

void Publisher.zip<A, B, C>(_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, uint64_t a11)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v41 = a9;
  v42 = a8;
  v37 = a2;
  v38 = a3;
  v40 = a10;
  v39 = a11;
  v15 = *(_QWORD *)(a7 - 8);
  v35 = a1;
  v36 = v15;
  v16 = MEMORY[0x1E0C80A78](a1);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x1E0C80A78](v16);
  v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x1E0C80A78](v21);
  v28 = (char *)&v34 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v34 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v33, v32);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v35, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v37, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v18, v38, a7);
  Publishers.Zip4.init(_:_:_:_:)((uint64_t)v30, a4, v41);
}

void Publishers.Zip4.init(_:_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for Publishers.Zip4();
}

uint64_t sub_18B5E7E14(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v7 + a1[21], v6, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v7 + a1[22], v5, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v7 + a1[23], v4, v1);
}

void type metadata accessor for Publishers.Zip4()
{
  JUMPOUT(0x18D77AC60);
}

void Publisher.zip<A, B, C, D>(_:_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[30];

  v25[11] = a1;
  v25[18] = a4;
  v25[19] = a5;
  v25[16] = a3;
  v25[14] = a2;
  v25[20] = a6;
  v25[4] = a12;
  v25[5] = a11;
  v25[6] = a10;
  v25[7] = a9;
  v25[17] = a8;
  v25[13] = *(_QWORD *)(a7 - 8);
  v12 = MEMORY[0x1E0C80A78](a1);
  v25[9] = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v25[8] = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v25[0] = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v25[21] = v18;
  v25[22] = v19;
  v25[2] = v18;
  v25[1] = v19;
  v25[23] = v20;
  v25[24] = a7;
  v25[25] = v22;
  v25[26] = v21;
  v25[27] = v23;
  v25[28] = v24;
  type metadata accessor for Publishers.Zip4();
}

void sub_18B5E8000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  *(_QWORD *)(v18 - 240) = a1;
  *(_QWORD *)(v18 - 200) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v20 = (char *)&a9 - v19;
  *(_QWORD *)(v18 - 296) = (char *)&a9 - v19;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v9, *(_QWORD *)(v18 - 224), v12);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 16))(v17, *(_QWORD *)(v18 - 232), v16);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v14 + 16))(*(_QWORD *)(v18 - 256), *(_QWORD *)(v18 - 208), v13);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v18 - 216) + 16))(*(_QWORD *)(v18 - 248), *(_QWORD *)(v18 - 192), v15);
  Publishers.Zip4.init(_:_:_:_:)(v9, *(_QWORD *)(v18 - 304), (uint64_t)v20);
}

uint64_t sub_18B5E8108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v0;
  v9[3] = v2;
  v9[4] = v7;
  v9[5] = v5;
  v11 = *(_QWORD *)(v8 - 184);
  v10 = *(_QWORD *)(v8 - 176);
  v9[6] = v11;
  v9[7] = v6;
  v9[8] = v4;
  v9[9] = v3;
  v9[10] = v1;
  v9[11] = v10;
  v9[12] = *(_QWORD *)(v8 - 168);
  v12 = *(_QWORD *)(v8 - 240);
  v13 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.Zip4<A, B, C, D>, v12);
  v14 = *(_QWORD *)(v8 - 296);
  Publisher.map<A>(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output, @in_guaranteed A1.Publisher.Output, @in_guaranteed B1.Publisher.Output, @in_guaranteed C1.Publisher.Output) -> (@out D1), (uint64_t)v9, v12, v11, v13, *(_QWORD *)(v8 - 160));
  swift_retain();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 200) + 8))(v14, v12);
}

uint64_t sub_18B5E81C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t Publishers.Zip.a.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Zip.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t Publishers.Zip3.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 68));
}

uint64_t Publishers.Zip3.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) - 8) + 16))(a2, v2 + *(int *)(a1 + 72));
}

void Publishers.Zip3.receive<A>(subscriber:)()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  type metadata accessor for Zip3Inner();
}

void sub_18B5E8348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t TupleTypeMetadata3,uint64_t a27)
{
  uint64_t v27;
  uint64_t v28;

  swift_allocObject();
  v28 = specialized AbstractZip.init(downstream:upstreamCount:)(v27, 3uLL);
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(0, v28, &a23);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  a27 = a19;
  type metadata accessor for AbstractZip.Side();
}

void sub_18B5E83CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v30;

  v30 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a20, a11, a1, a12, v30);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(1, v28, &a23);
  a20 = a23;
  a21 = a24;
  a22 = a25;
  a28 = a10;
  type metadata accessor for AbstractZip.Side();
}

void sub_18B5E8454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v29;
  uint64_t v31;

  v31 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a20, a15, a1, a16, v31);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(2, v29, &a23);
  a20 = a23;
  a21 = a24;
  a22 = a25;
  a27 = a19;
  a29 = a13;
  type metadata accessor for AbstractZip.Side();
}

uint64_t sub_18B5E84D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v4, a1, v5, v2);
  swift_release();
  return swift_release();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Zip3<A, B, C>()
{
  Publishers.Zip3.receive<A>(subscriber:)();
}

uint64_t Publishers.Zip4.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 84));
}

uint64_t Publishers.Zip4.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) - 8) + 16))(a2, v2 + *(int *)(a1 + 88));
}

uint64_t Publishers.Zip4.d.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 40) - 8) + 16))(a2, v2 + *(int *)(a1 + 92));
}

void Publishers.Zip4.receive<A>(subscriber:)()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  type metadata accessor for Zip4Inner();
}

void sub_18B5E86AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  swift_allocObject();
  v32 = specialized AbstractZip.init(downstream:upstreamCount:)(a12, 4uLL);
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(0, v32, &a26);
  *(_QWORD *)(v31 - 144) = v26;
  *(_QWORD *)(v31 - 136) = v27;
  *(_QWORD *)(v31 - 128) = v30;
  *(_QWORD *)(v31 - 120) = v28;
  *(_QWORD *)(v31 - 144) = swift_getTupleTypeMetadata();
  *(_QWORD *)(v31 - 136) = a9;
  *(_QWORD *)(v31 - 128) = v29;
  *(_QWORD *)(v31 - 120) = v26;
  *(_QWORD *)(v31 - 112) = a10;
  type metadata accessor for AbstractZip.Side();
}

void sub_18B5E873C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;

  v37 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a23, v28, a1, a13, v37);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(1, v30, &a26);
  a23 = a26;
  a24 = a27;
  a25 = a28;
  *(_QWORD *)(v35 - 144) = v32;
  *(_QWORD *)(v35 - 136) = v34;
  *(_QWORD *)(v35 - 128) = v33;
  *(_QWORD *)(v35 - 120) = v31;
  *(_QWORD *)(v35 - 112) = v29;
  type metadata accessor for AbstractZip.Side();
}

void sub_18B5E87CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;

  v35 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a23, a17, a1, a18, v35);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(2, v28, &a26);
  a23 = a26;
  a24 = a27;
  a25 = a28;
  *(_QWORD *)(v33 - 144) = v30;
  *(_QWORD *)(v33 - 136) = v32;
  *(_QWORD *)(v33 - 128) = v31;
  *(_QWORD *)(v33 - 120) = a14;
  *(_QWORD *)(v33 - 112) = v29;
  type metadata accessor for AbstractZip.Side();
}

void sub_18B5E884C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;

  v35 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&a23, a19, a1, a20, v35);
  swift_release();
  swift_retain();
  Publishers._Merged.Side.init(index:merger:)(3, v28, &a26);
  a23 = a26;
  a24 = a27;
  a25 = a28;
  *(_QWORD *)(v33 - 144) = v30;
  *(_QWORD *)(v33 - 136) = v32;
  *(_QWORD *)(v33 - 128) = v31;
  *(_QWORD *)(v33 - 120) = a16;
  *(_QWORD *)(v33 - 112) = v29;
  type metadata accessor for AbstractZip.Side();
}

uint64_t sub_18B5E88CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for AbstractZip<A, B, C>.Side<A1>, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v4, a1, v5, v2);
  swift_release();
  return swift_release();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Zip4<A, B, C, D>()
{
  Publishers.Zip4.receive<A>(subscriber:)();
}

void static Publishers.Zip<>.== infix(_:_:)()
{
  type metadata accessor for Publishers.Zip();
}

uint64_t sub_18B5E8984(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  char v10;
  void (*v11)(_BYTE *, uint64_t, uint64_t);
  char v12;
  void (*v13)(_BYTE *, uint64_t);
  _BYTE v15[96];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v15[-v8];
  v10 = dispatch thunk of static Equatable.== infix(_:_:)();
  v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v2, a1);
  v11(v7, v1, a1);
  if ((v10 & 1) != 0)
    v12 = dispatch thunk of static Equatable.== infix(_:_:)();
  else
    v12 = 0;
  v13 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v13(v9, a1);
  return v12 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Zip<A, B>()
{
  static Publishers.Zip<>.== infix(_:_:)();
}

void static Publishers.Zip3<>.== infix(_:_:)()
{
  type metadata accessor for Publishers.Zip3();
}

uint64_t sub_18B5E8ADC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  char v16;
  void (*v17)(_BYTE *, uint64_t, uint64_t);
  char v18;
  void (*v19)(_BYTE *, uint64_t);
  char v20;
  _BYTE v22[96];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = &v22[-v9];
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = &v22[-v12];
  MEMORY[0x1E0C80A78](v11);
  v15 = &v22[-v14];
  v16 = dispatch thunk of static Equatable.== infix(_:_:)();
  v17 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v17(v15, v2, a1);
  v17(v13, v1, a1);
  if ((v16 & 1) != 0)
    v18 = dispatch thunk of static Equatable.== infix(_:_:)();
  else
    v18 = 0;
  v19 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v19(v13, a1);
  v19(v15, a1);
  v17(v10, v2, a1);
  v17(v7, v1, a1);
  if ((v18 & 1) != 0)
    v20 = dispatch thunk of static Equatable.== infix(_:_:)();
  else
    v20 = 0;
  v19(v7, a1);
  v19(v10, a1);
  return v20 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Zip3<A, B, C>()
{
  static Publishers.Zip3<>.== infix(_:_:)();
}

uint64_t sub_18B5E8C9C(char a1)
{
  return a1 & 1;
}

void static Publishers.Zip4<>.== infix(_:_:)()
{
  type metadata accessor for Publishers.Zip4();
}

uint64_t sub_18B5E8D0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  char v21;
  void (*v22)(_BYTE *, uint64_t, uint64_t);
  uint64_t v23;
  char v24;
  void (*v25)(_BYTE *, uint64_t);
  uint64_t v26;
  char v27;
  _BYTE *v28;
  _BYTE *v29;
  char v30;
  _BYTE v32[96];

  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v3 - 160) = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x1E0C80A78](v6);
  *(_QWORD *)(v3 - 168) = &v32[-v9];
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = &v32[-v11];
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = &v32[-v14];
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = &v32[-v17];
  MEMORY[0x1E0C80A78](v16);
  v20 = &v32[-v19];
  v21 = dispatch thunk of static Equatable.== infix(_:_:)();
  v22 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  *(_QWORD *)(v3 - 152) = v2;
  v22(v20, v2, a1);
  v23 = v1;
  v22(v18, v1, a1);
  if ((v21 & 1) != 0)
    v24 = dispatch thunk of static Equatable.== infix(_:_:)();
  else
    v24 = 0;
  v25 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v25(v18, a1);
  v25(v20, a1);
  v26 = *(_QWORD *)(v3 - 152);
  v22(v15, v26, a1);
  v22(v12, v23, a1);
  if ((v24 & 1) == 0)
  {
    v25(v12, a1);
    v25(v15, a1);
    v28 = *(_BYTE **)(v3 - 168);
    v22(v28, v26, a1);
    v29 = *(_BYTE **)(v3 - 160);
    v22(v29, v23, a1);
    goto LABEL_8;
  }
  v27 = dispatch thunk of static Equatable.== infix(_:_:)();
  v25(v12, a1);
  v25(v15, a1);
  v28 = *(_BYTE **)(v3 - 168);
  v22(v28, v26, a1);
  v29 = *(_BYTE **)(v3 - 160);
  v22(v29, v23, a1);
  if ((v27 & 1) == 0)
  {
LABEL_8:
    v30 = 0;
    goto LABEL_9;
  }
  v30 = dispatch thunk of static Equatable.== infix(_:_:)();
LABEL_9:
  v25(v29, a1);
  v25(v28, a1);
  return v30 & 1;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Zip4<A, B, C, D>()
{
  static Publishers.Zip4<>.== infix(_:_:)();
}

uint64_t sub_18B5E8FC4(char a1)
{
  return a1 & 1;
}

void AbstractZip.Side.customMirror.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_18B5F41E0;
  *(_QWORD *)(v2 + 32) = 0xD000000000000012;
  *(_QWORD *)(v2 + 40) = 0x800000018B5FECA0;
  *(_QWORD *)(v2 + 72) = &type metadata for CombineIdentifier;
  type metadata accessor for AbstractZip();
}

uint64_t sub_18B5E90E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(v0);
  v3 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v1);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void AbstractZip.Side.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 7367002;
  a1[1] = 0xE300000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbstractZip<A, B, C>.Side<A1>()
{
  return 7367002;
}

void AbstractZip.customMirror.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];
  _QWORD *v9;

  v1 = *v0;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0;
  v6 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = *(_OWORD *)(v1 + 96);
  v8[0] = *(_OWORD *)(v1 + 80);
  v8[1] = v7;
  type metadata accessor for AbstractZip();
}

uint64_t sub_18B5E926C()
{
  uint64_t v0;

  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v0);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

uint64_t *AbstractZip.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedConformanceWitness;
  uint64_t v5;
  uint64_t v6;

  v1 = *v0;
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 176)), -1, -1);
  MEMORY[0x18D77ADB0](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 184)), -1, -1);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112), *(_QWORD *)(v1 + 96));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 208);
  v3 = *(_QWORD *)(v1 + 88);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  type metadata accessor for Subscribers.Completion(255, v3, AssociatedConformanceWitness, v5);
  v6 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v2, v6);
  return v0;
}

uint64_t AbstractZip.__deallocating_deinit()
{
  AbstractZip.deinit();
  return swift_deallocClassInstance();
}

void AbstractZip.convert(values:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void AbstractZip.lockedSendCompletion(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  void (*v25)(uint64_t, char *, uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, char *, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[16];
  uint64_t v59;
  uint64_t v60;
  _OWORD v61[3];
  _QWORD v62[4];
  uint64_t v63;

  v2 = v1;
  v4 = *v1;
  v6 = *(_QWORD *)(*v1 + 96);
  v5 = *(_QWORD *)(*v1 + 104);
  v7 = *(_QWORD *)(*v1 + 88);
  v46 = v5;
  v45 = v6;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v10 = type metadata accessor for Subscribers.Completion(255, v7, AssociatedConformanceWitness, v9);
  v11 = type metadata accessor for Optional();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v37 - v16;
  v43 = *(uint64_t *)((char *)v2 + *(_QWORD *)(v4 + 168));
  *(uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 120)) = (uint64_t)specialized Array.init(repeating:count:)(MEMORY[0x1E0DEE9D8], v43);
  swift_bridgeObjectRelease();
  v18 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 128));
  swift_beginAccess();
  v42 = v18;
  v19 = *v18;
  v44 = *(_QWORD *)(*v2 + 192);
  *((_BYTE *)v2 + v44) = 1;
  v20 = *(_QWORD *)(v10 - 8);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v48 = a1;
  v21(v17, a1, v10);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  v49 = v10;
  v41 = v22;
  v22(v17, 0, 1, v10);
  v23 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v47 = v17;
  v23(v15, v17, v11);
  v24 = (uint64_t)v2 + *(_QWORD *)(*v2 + 208);
  swift_beginAccess();
  v25 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 40);
  swift_bridgeObjectRetain();
  v40 = v24;
  v50 = v11;
  v39 = v25;
  v25(v24, v15, v11);
  swift_endAccess();
  v38 = *(_QWORD *)(*v2 + 176);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v2 + v38));
  v26 = 0;
  v27 = *(_QWORD *)(v19 + 16);
  v28 = *(_QWORD *)(*v2 + 160);
  v54 = v19;
  v52 = v19 + 32;
  v51 = (uint64_t)v61 + 8;
  v53 = xmmword_18B5F41F0;
  if (v27)
    goto LABEL_5;
LABEL_4:
  memset(v61, 0, 32);
  v26 = v27;
  v61[2] = v53;
  while (1)
  {
    outlined init with take of Subscription?((uint64_t)v61, (uint64_t)v62, &demangling cache variable for type metadata for (offset: Int, element: Subscription?)?);
    if (v63 == 1)
    {
      swift_bridgeObjectRelease();
      os_unfair_recursive_lock_lock_with_options();
      (*(void (**)(uint64_t, uint64_t))(v46 + 56))(v48, v45);
      os_unfair_recursive_lock_unlock();
      v33 = v38;
      os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v2 + v38));
      v63 = 0;
      memset(v62, 0, sizeof(v62));
      v34 = specialized Array.init(repeating:count:)((uint64_t)v62, v43);
      *v42 = v34;
      swift_bridgeObjectRelease();
      v35 = v47;
      v41(v47, 1, 1, v49);
      v36 = v40;
      swift_beginAccess();
      v39(v36, v35, v50);
      swift_endAccess();
      *((_BYTE *)v2 + v44) = 0;
      *(uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 200)) = 0;
      os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v2 + v33));
      return;
    }
    v29 = v62[0];
    outlined init with take of Subscription?((uint64_t)&v62[1], (uint64_t)v61, &demangling cache variable for type metadata for Subscription?);
    if ((v29 & 0x8000000000000000) != 0)
      break;
    v30 = *(uint64_t *)((char *)v2 + v28);
    if (v29 >= *(_QWORD *)(v30 + 16))
      goto LABEL_17;
    if (*(_BYTE *)(v30 + v29 + 32) == 1)
    {
      outlined destroy of Subscription?((uint64_t)v61);
      if (v26 == v27)
        goto LABEL_4;
    }
    else
    {
      outlined init with copy of Subscription?((uint64_t)v61, (uint64_t)&v55);
      if (!v56)
      {
        outlined destroy of Subscription?((uint64_t)v61);
        swift_bridgeObjectRelease();
        outlined destroy of Subscription?((uint64_t)&v55);
        return;
      }
      outlined init with take of Subscription(&v55, (uint64_t)&v57);
      v32 = v59;
      v31 = v60;
      __swift_project_boxed_opaque_existential_1(&v57, v59);
      (*(void (**)(uint64_t))(*(_QWORD *)(v31 + 8) + 8))(v32);
      outlined destroy of Subscription?((uint64_t)v61);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
      if (v26 == v27)
        goto LABEL_4;
    }
LABEL_5:
    if (v26 >= *(_QWORD *)(v54 + 16))
      goto LABEL_18;
    outlined init with copy of Subscription?(v52 + 40 * v26, (uint64_t)v58);
    *(_QWORD *)&v61[0] = v26;
    outlined init with take of Subscription?((uint64_t)v58, v51, &demangling cache variable for type metadata for Subscription?);
    ++v26;
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
}

void AbstractZip.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 176);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + v1));
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 136);
  if ((*(_BYTE *)(v0 + v2) & 1) != 0)
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
  }
  else
  {
    v3 = (uint64_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
    swift_beginAccess();
    v4 = *v3;
    *(_BYTE *)(v0 + v2) = 1;
    v12 = 0;
    v10 = 0u;
    v11 = 0u;
    v5 = *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 168));
    swift_bridgeObjectRetain();
    *v3 = specialized Array.init(repeating:count:)((uint64_t)&v10, v5);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120)) = specialized Array.init(repeating:count:)(MEMORY[0x1E0DEE9D8], v5);
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + v1));
    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
    {
      v7 = v4 + 32;
      do
      {
        outlined init with copy of Subscription?(v7, (uint64_t)&v10);
        v9 = *((_QWORD *)&v11 + 1);
        if (*((_QWORD *)&v11 + 1))
        {
          v8 = v12;
          __swift_project_boxed_opaque_existential_1(&v10, *((uint64_t *)&v11 + 1));
          (*(void (**)(uint64_t))(*(_QWORD *)(v8 + 8) + 8))(v9);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
        }
        else
        {
          outlined destroy of Subscription?((uint64_t)&v10);
        }
        v7 += 40;
        --v6;
      }
      while (v6);
    }
    swift_bridgeObjectRelease();
  }
}

void protocol witness for CustomReflectable.customMirror.getter in conformance AbstractZip<A, B, C>()
{
  AbstractZip.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance AbstractZip<A, B, C>(_QWORD *a1@<X8>)
{
  AbstractZip.Side.playgroundDescription.getter(a1);
}

void protocol witness for Cancellable.cancel() in conformance AbstractZip<A, B, C>()
{
  AbstractZip.cancel()();
}

uint64_t Zip3Inner.convert(values:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[32];
  _BYTE v9[32];

  v4 = *(_QWORD *)(a4 + 16);
  if (!v4)
  {
    __break(1u);
    goto LABEL_6;
  }
  outlined init with copy of Any(a4 + 32, (uint64_t)v9);
  result = swift_dynamicCast();
  if (v4 == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  outlined init with copy of Any(a4 + 64, (uint64_t)v8);
  result = swift_dynamicCast();
  if (v4 >= 3)
  {
    outlined init with copy of Any(a4 + 96, (uint64_t)&v7);
    return swift_dynamicCast();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t vtable thunk for AbstractZip.convert(values:) dispatching to Zip3Inner.convert(values:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t TupleTypeMetadata3;

  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  return Zip3Inner.convert(values:)(a2, a2 + *(int *)(TupleTypeMetadata3 + 48), a2 + *(int *)(TupleTypeMetadata3 + 64), a1);
}

uint64_t Zip4Inner.convert(values:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t result;
  uint64_t v8;
  _BYTE v9[32];
  _BYTE v10[32];
  _BYTE v11[32];

  v5 = *(_QWORD *)(a5 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  outlined init with copy of Any(a5 + 32, (uint64_t)v11);
  result = swift_dynamicCast();
  if (v5 == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  outlined init with copy of Any(a5 + 64, (uint64_t)v10);
  result = swift_dynamicCast();
  if (v5 < 3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  outlined init with copy of Any(a5 + 96, (uint64_t)v9);
  result = swift_dynamicCast();
  if (v5 != 3)
  {
    outlined init with copy of Any(a5 + 128, (uint64_t)&v8);
    return swift_dynamicCast();
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t vtable thunk for AbstractZip.convert(values:) dispatching to Zip4Inner.convert(values:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *TupleTypeMetadata;

  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  return Zip4Inner.convert(values:)(a2, a2 + TupleTypeMetadata[12], a2 + TupleTypeMetadata[16], a2 + TupleTypeMetadata[20], a1);
}

void type metadata accessor for Zip3Inner()
{
  JUMPOUT(0x18D77AC60);
}

void type metadata accessor for Zip4Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t getEnumTagSinglePayload for Publishers.Zip(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5E9F28 + 4 * byte_18B5FCE90[v17 - 1]))();
}

void storeEnumTagSinglePayload for Publishers.Zip(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
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
  }
  else
  {
    v9 = 0u;
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
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
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
  __asm { BR              X16 }
}

uint64_t getEnumTagSinglePayload for Publishers.Zip3(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;

  v4 = *(_QWORD *)(a3[2] - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = a3[4];
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) > v8)
    v8 = *(_DWORD *)(v10 + 84);
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v6 + 80);
  v12 = *(_QWORD *)(v4 + 64) + v11;
  v13 = *(_QWORD *)(v6 + 64);
  v14 = *(unsigned __int8 *)(v10 + 80);
  v15 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_25;
  v16 = ((v13 + v14 + (v12 & ~v11)) & ~v14) + *(_QWORD *)(v10 + 64);
  v17 = 8 * v16;
  if (v16 <= 3)
  {
    v19 = ((v15 + ~(-1 << v17)) >> v17) + 1;
    if (HIWORD(v19))
    {
      v18 = *(_DWORD *)(a1 + v16);
      if (!v18)
        goto LABEL_25;
      goto LABEL_16;
    }
    if (v19 > 0xFF)
    {
      v18 = *(unsigned __int16 *)(a1 + v16);
      if (!*(_WORD *)(a1 + v16))
        goto LABEL_25;
      goto LABEL_16;
    }
    if (v19 < 2)
    {
LABEL_25:
      if (v8)
      {
        if (v5 == v8)
          return (*(uint64_t (**)(void))(v4 + 48))();
        v22 = (v12 + a1) & ~v11;
        if (v7 == v8)
          return (*(uint64_t (**)(uint64_t))(v6 + 48))(v22);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))((v22 + v13 + v14) & ~v14, *(unsigned int *)(v10 + 84), v9);
      }
      return 0;
    }
  }
  v18 = *(unsigned __int8 *)(a1 + v16);
  if (!*(_BYTE *)(a1 + v16))
    goto LABEL_25;
LABEL_16:
  v20 = (v18 - 1) << v17;
  if (v16 > 3)
    v20 = 0;
  if ((_DWORD)v16)
  {
    if (v16 <= 3)
      v21 = ((v13 + v14 + (v12 & ~(_DWORD)v11)) & ~(_DWORD)v14) + *(_DWORD *)(v10 + 64);
    else
      v21 = 4;
    __asm { BR              X11 }
  }
  return v8 + v20 + 1;
}

void storeEnumTagSinglePayload for Publishers.Zip3(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) > v7)
    v7 = *(_DWORD *)(v8 + 84);
  v9 = ((*(_QWORD *)(v6 + 64)
       + *(unsigned __int8 *)(v8 + 80)
       + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
     + *(_QWORD *)(v8 + 64);
  if (a3 > v7)
  {
    if (v9 <= 3)
    {
      v12 = ((a3 - v7 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0u;
  }
  if (v7 < a2)
  {
    v11 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v13 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X21 }
}

uint64_t getEnumTagSinglePayload for Publishers.Zip4(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
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
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  v12 = a3[4];
  v13 = a3[5];
  v14 = *(_QWORD *)(v12 - 8);
  v15 = *(unsigned int *)(v14 + 84);
  if (v15 > v11)
    v11 = *(_DWORD *)(v14 + 84);
  v16 = *(_QWORD *)(v13 - 8);
  v17 = *(unsigned int *)(v16 + 84);
  if (v17 > v11)
    v11 = *(_DWORD *)(v16 + 84);
  if (!a2)
    return 0;
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = *(_QWORD *)(v7 + 64) + v18;
  v20 = *(_QWORD *)(v9 + 64);
  v21 = *(unsigned __int8 *)(v14 + 80);
  v22 = *(_QWORD *)(v14 + 64);
  v23 = *(unsigned __int8 *)(v16 + 80);
  v24 = a2 - v11;
  if (a2 <= v11)
    goto LABEL_27;
  v25 = ((v22 + v23 + ((v20 + v21 + (v19 & ~v18)) & ~v21)) & ~v23) + *(_QWORD *)(v16 + 64);
  v26 = 8 * v25;
  if (v25 <= 3)
  {
    v28 = ((v24 + ~(-1 << v26)) >> v26) + 1;
    if (HIWORD(v28))
    {
      v27 = *(_DWORD *)(a1 + v25);
      if (!v27)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v28 > 0xFF)
    {
      v27 = *(unsigned __int16 *)(a1 + v25);
      if (!*(_WORD *)(a1 + v25))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v28 < 2)
    {
LABEL_27:
      if (v11)
      {
        if (v8 == v11)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v6);
        v31 = (v19 + a1) & ~v18;
        if (v10 == v11)
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v9 + 48))(v31, *(unsigned int *)(v9 + 84), v5);
        v32 = (v31 + v20 + v21) & ~v21;
        if ((_DWORD)v15 == v11)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v32, v15, v12);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))((v32 + v22 + v23) & ~v23, v17, v13);
      }
      return 0;
    }
  }
  v27 = *(unsigned __int8 *)(a1 + v25);
  if (!*(_BYTE *)(a1 + v25))
    goto LABEL_27;
LABEL_18:
  v29 = (v27 - 1) << v26;
  if (v25 > 3)
    v29 = 0;
  if ((_DWORD)v25)
  {
    if (v25 <= 3)
      v30 = ((v22 + v23 + ((v20 + v21 + (v19 & ~(_DWORD)v18)) & ~(_DWORD)v21)) & ~(_DWORD)v23) + *(_DWORD *)(v16 + 64);
    else
      v30 = 4;
    __asm { BR              X11 }
  }
  return v11 + v29 + 1;
}

void storeEnumTagSinglePayload for Publishers.Zip4(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) <= v7)
    v9 = v7;
  else
    v9 = *(_DWORD *)(v8 + 84);
  v10 = *(_QWORD *)(a4[5] - 8);
  if (*(_DWORD *)(v10 + 84) > v9)
    v9 = *(_DWORD *)(v10 + 84);
  v11 = ((*(_QWORD *)(v8 + 64)
        + *(unsigned __int8 *)(v10 + 80)
        + ((*(_QWORD *)(v6 + 64)
          + *(unsigned __int8 *)(v8 + 80)
          + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
      + *(_QWORD *)(v10 + 64);
  if (a3 > v9)
  {
    if (v11 <= 3)
    {
      v14 = ((a3 - v9 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else
      {
        v12 = v14 > 1;
        if (v14 >= 0x100)
          v12 = 2;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0u;
  }
  if (v9 < a2)
  {
    v13 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v15 = v13 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v11 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X27 }
}

uint64_t type metadata completion function for Zip3Inner()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata completion function for Zip4Inner()
{
  return swift_initClassMetadata2();
}

unint64_t Publisher.output(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  result = MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (result > 0x7FFFFFFFFFFFFFFDLL)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v4, a2);
    return Publishers.Output.init(upstream:range:)((uint64_t)v12, a1, a1 + 1, a2, a3, a4);
  }
  return result;
}

uint64_t Publishers.Output.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Output.range.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

void Publishers.Output.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x74757074754FLL;
  a1[1] = 0xE600000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Output<A>.Inner<A1>()
{
  return 0x74757074754FLL;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Output<A>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Output.Inner.playgroundDescription.getter(a1);
}

BOOL static Publishers.Output<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _BOOL8 v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;

  v6 = type metadata accessor for Publishers.Output(0, a3, a4, a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - v11;
  v13 = dispatch thunk of static Equatable.== infix(_:_:)();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, a1, v6);
  v14(v10, a2, v6);
  v19 = (v13 & 1) != 0
     && (v15 = *(int *)(v6 + 36), v16 = &v12[v15], v17 = *(_QWORD *)&v12[v15], v18 = &v10[v15], v17 == *(_QWORD *)v18)
     && *((_QWORD *)v16 + 1) == *((_QWORD *)v18 + 1);
  v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  v20(v12, v6);
  return v19;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Output<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Publishers.Output<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Output(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_OWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t assignWithCopy for Publishers.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  return a1;
}

uint64_t assignWithTake for Publishers.Output(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v7[1] = v8[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Output(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_18B5EAF40 + 4 * byte_18B5FD300[v8]))();
}

void storeEnumTagSinglePayload for Publishers.Output(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0u;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_18B5EB080()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_18B5EB088(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5EB090);
}

void sub_18B5EB0AC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_18B5EB0B4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_18B5EB0BC(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x18B5EB0C4);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

void Publishers.Catch.init(upstream:handler:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  Publishers.Catch.init(upstream:handler:)(a1, a2, a3, a4, a5, (void (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.Catch, a6);
}

uint64_t Publisher.tryCatch<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Publisher.catch<A>(_:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.TryCatch, a7);
}

void Publishers.TryCatch.init(upstream:handler:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  Publishers.Catch.init(upstream:handler:)(a1, a2, a3, a4, a5, (void (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.TryCatch, a6);
}

void Publishers.Catch.init(upstream:handler:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, void (*a6)(_QWORD, _QWORD *)@<X7>, uint64_t a7@<X8>)
{
  _QWORD v12[4];

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a7, a1, a2);
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  v12[3] = a5;
  a6(0, v12);
  JUMPOUT(0x18B5EB168);
}

void type metadata accessor for Publishers.TryCatch()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t Publishers.Catch.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

void Publishers.Catch.Inner.__allocating_init(downstream:handler:)()
{
  swift_allocObject();
  Publishers.Catch.Inner.init(downstream:handler:)();
}

void Publishers.Catch.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x6863746143;
  a1[1] = 0xE500000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS()
{
  return 0x6863746143;
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(_QWORD *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.Catch.Inner.UncaughtS.customMirror.getter);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(_QWORD *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.Catch.Inner.UncaughtS.playgroundDescription.getter);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, (void (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.Catch.Inner, a2);
}

void Publishers.Catch.Inner.CaughtS.customMirror.getter()
{
  Publishers.Catch.Inner.customMirror.getter();
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS(uint64_t a1)
{
  uint64_t *v1;

  return Publishers.Catch.Inner.CaughtS.receive(_:)(a1, *v1);
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.CaughtS(_QWORD *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.Catch.Inner.CaughtS.customMirror.getter);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Catch<A, B>.Inner<A1>.CaughtS(_QWORD *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.Catch.Inner.playgroundDescription.getter);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(uint64_t *a1@<X0>, void (*a2)(_QWORD, _QWORD *)@<X2>, _QWORD *a3@<X8>)
{
  Publishers.Catch.Inner.UncaughtS.combineIdentifier.getter(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a2, a3);
}

void protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>()
{
  Publishers.Catch.Inner.customMirror.getter();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Catch<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Catch.Inner.playgroundDescription.getter(a1);
}

uint64_t Publishers.Catch.handler.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 52));
  swift_retain();
  return v2;
}

void Publishers.TryCatch.receive<A>(subscriber:)()
{
  type metadata accessor for Publishers.TryCatch.Inner();
}

void sub_18B5EB3EC()
{
  swift_allocObject();
  swift_retain();
  specialized Publishers.TryCatch.Inner.init(downstream:handler:)();
}

void sub_18B5EB424()
{
  swift_release();
  type metadata accessor for Publishers.TryCatch.Inner.UncaughtS();
}

uint64_t sub_18B5EB44C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;

  v4 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS, a1);
  Publisher.subscribe<A>(_:)((uint64_t)&v6, v1, a1, v2, v4);
  return swift_release();
}

void type metadata accessor for Publishers.TryCatch.Inner()
{
  JUMPOUT(0x18D77AC60);
}

void Publishers.Catch.Inner.customMirror.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  v1 = *v0;
  v2 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_unfair_lock_lock((os_unfair_lock_t)v0[2]);
  v15 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_18B5F4780;
  *(_QWORD *)(v8 + 32) = 0x657274736E776F64;
  *(_QWORD *)(v8 + 40) = 0xEA00000000006D61;
  v9 = (uint64_t)v0 + *(_QWORD *)(*v0 + 152);
  v10 = *(_QWORD *)(v1 + 96);
  *(_QWORD *)(v8 + 72) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 48));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(boxed_opaque_existential_1, v9, v10);
  *(_QWORD *)(v8 + 80) = 0x646E616D6564;
  *(_QWORD *)(v8 + 88) = 0xE600000000000000;
  v12 = v0[3];
  *(_QWORD *)(v8 + 120) = &type metadata for Subscribers.Demand;
  *(_QWORD *)(v8 + 96) = v12;
  v13 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)((uint64_t)v4);
  swift_retain();
  Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
  os_unfair_lock_unlock((os_unfair_lock_t)v0[2]);
}

void Publishers.TryCatch.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x6863746143797254;
  a1[1] = 0xE800000000000000;
}

uint64_t Publishers.TryCatch.Inner.__deallocating_deinit()
{
  return Publishers.Catch.Inner.__deallocating_deinit((uint64_t (*)(_QWORD, _OWORD *))type metadata accessor for Publishers.TryCatch.Inner.State);
}

void Publishers.TryCatch.Inner.UncaughtS.receive(subscription:)(uint64_t a1)
{
  Publishers.TryCatch.Inner.receivePre(subscription:)(a1);
}

void Publishers.TryCatch.Inner.receivePre(subscription:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[32];

  v18[19] = a1;
  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v18[10] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v18[11] = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v2[13];
  v6 = v2[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18[17] = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v18[13] = (char *)v18 - v8;
  v18[18] = v9;
  v10 = type metadata accessor for Optional();
  v11 = *(_QWORD *)(v10 - 8);
  v18[14] = v10;
  v18[15] = v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v18[12] = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v18[16] = (char *)v18 - v14;
  v15 = v2[12];
  v16 = v2[14];
  v17 = v2[15];
  v18[8] = v6;
  v18[25] = v6;
  v18[26] = v3;
  v18[7] = v3;
  v18[27] = v15;
  v18[28] = v5;
  v18[9] = v5;
  v18[29] = v16;
  v18[30] = v17;
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

uint64_t sub_18B5EB808(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, _QWORD, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v37[96];

  v8 = *(_QWORD *)(a1 - 8);
  v9 = MEMORY[0x1E0C80A78](a1);
  v11 = &v37[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v13 = &v37[-v12];
  os_unfair_lock_lock(v2[2]);
  v14 = (char *)v2 + *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v8 + 16))(v13, v14, a1);
  if (swift_getEnumCaseMultiPayload())
  {
    os_unfair_lock_unlock(v2[2]);
    v15 = *(_QWORD **)(v6 - 184);
    v16 = v15[3];
    v17 = v15[4];
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t))(*(_QWORD *)(v17 + 8) + 8))(v16);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, a1);
  }
  else
  {
    *(_QWORD *)(v6 - 320) = v8;
    *(_QWORD *)(v6 - 312) = v14;
    *(_QWORD *)(v6 - 328) = v1;
    *(_QWORD *)(v6 - 304) = v11;
    *(_QWORD *)(v6 - 296) = v3;
    *(_QWORD *)(v6 - 288) = v4;
    v18 = *(_QWORD *)(v6 - 216);
    v19 = *(_QWORD *)(v6 - 208);
    v20 = v13;
    v21 = *(_QWORD *)(v6 - 232);
    v22 = *(_QWORD *)(v6 - 224);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v18 + 32))(v19, v20, v22);
    v23 = *(_QWORD *)(v6 - 240);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v23, v19, v22);
    if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 - 200) + 48))(v23, 1, *(_QWORD *)(v6 - 192)) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 - 200) + 32))(v21, v23, *(_QWORD *)(v6 - 192));
      v29 = *(_QWORD *)(v6 - 304);
      v30 = a1;
      swift_storeEnumTagMultiPayload();
      v31 = *(_QWORD *)(v6 - 312);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 320) + 40))(v31, v29, v30);
      swift_endAccess();
      os_unfair_lock_unlock(v2[2]);
      (*(void (**)(uint64_t))((char *)v2 + *(_QWORD *)&(*v2)[40]._os_unfair_lock_opaque))(v21);
      v32 = *(_QWORD *)(v6 - 288);
      v33 = *(_QWORD *)(v6 - 296);
      *(_QWORD *)(v6 - 176) = v2;
      swift_retain();
      v34 = *(_QWORD *)(v6 - 280);
      *(_QWORD *)(v6 - 136) = *(_QWORD *)(v6 - 272);
      *(_QWORD *)(v6 - 128) = v34;
      v35 = *(_QWORD *)(v6 - 264);
      *(_QWORD *)(v6 - 120) = v33;
      *(_QWORD *)(v6 - 112) = v35;
      *(_QWORD *)(v6 - 104) = *(_QWORD *)(v6 - 328);
      *(_QWORD *)(v6 - 96) = v32;
      type metadata accessor for Publishers.TryCatch.Inner.CaughtS();
    }
    v24 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v24(v23, v22);
    v25 = *(_QWORD *)(v6 - 304);
    outlined init with copy of Subscription(*(_QWORD *)(v6 - 184), v25);
    swift_storeEnumTagMultiPayload();
    v26 = *(_QWORD *)(v6 - 312);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 320) + 40))(v26, v25, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v2[2]);
    *(_QWORD *)(v6 - 112) = v5;
    *(_QWORD *)(v6 - 104) = &protocol witness table for Publishers.TryCatch<A, B>.Inner<A1>;
    *(_QWORD *)(v6 - 136) = v2;
    v27 = *(_QWORD *)(v6 - 288);
    v28 = *(void (**)(uint64_t, _QWORD, uint64_t))(v27 + 40);
    swift_retain();
    v28(v6 - 136, *(_QWORD *)(v6 - 296), v27);
    v24(v19, v22);
    return __swift_destroy_boxed_opaque_existential_1(v6 - 136);
  }
}

void Publishers.TryCatch.Inner.UncaughtS.receive(_:)(uint64_t a1)
{
  Publishers.TryCatch.Inner.receivePre(_:)(a1);
}

void Publishers.TryCatch.Inner.receivePre(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v2 = v1;
  v4 = *v1;
  os_unfair_lock_lock((os_unfair_lock_t)v1[2]);
  v5 = v1[3];
  if (v5 != 0x8000000000000000)
  {
    if (v5 < 0)
    {
      __break(1u);
    }
    else if (v5)
    {
      v1[3] = v5 - 1;
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_16;
  }
LABEL_5:
  os_unfair_lock_unlock((os_unfair_lock_t)v1[2]);
  v6 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 + 120) + 48))(a1, *(_QWORD *)(v4 + 96));
  os_unfair_lock_lock((os_unfair_lock_t)v2[2]);
  v7 = v2[3];
  if (v7 == 0x8000000000000000)
  {
LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)v2[2]);
    return;
  }
  v8 = 0x8000000000000000;
  if (v6 == 0x8000000000000000)
  {
LABEL_12:
    v2[3] = v8;
    goto LABEL_13;
  }
  if ((v7 | v6) < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v8 = v7 + v6;
  if (__OFADD__(v7, v6))
  {
    v8 = 0x8000000000000000;
    goto LABEL_12;
  }
  if ((v8 & 0x8000000000000000) == 0)
    goto LABEL_12;
LABEL_17:
  __break(1u);
}

void Publishers.TryCatch.Inner.UncaughtS.receive(completion:)(uint64_t a1)
{
  Publishers.TryCatch.Inner.receivePre(completion:)(a1);
}

void Publishers.TryCatch.Inner.receivePre(completion:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[24];

  v11[11] = a1;
  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v11[5] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v11[7] = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v2[13];
  v6 = v2[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v8 = v2[12];
  v10 = v2[14];
  v9 = v2[15];
  v11[17] = v6;
  v11[18] = v3;
  v11[6] = v3;
  v11[8] = v8;
  v11[9] = v9;
  v11[19] = v8;
  v11[20] = v5;
  v11[3] = v10;
  v11[21] = v10;
  v11[22] = v9;
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

uint64_t sub_18B5EBE58(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t AssociatedConformanceWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(uint64_t, _BYTE *, uint64_t);
  char *v26;
  uint64_t v27;
  int EnumCaseMultiPayload;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[80];

  v9 = *(_QWORD *)(a1 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x1E0C80A78](v10);
  *(_QWORD *)(v7 - 192) = &v39[-v14];
  MEMORY[0x1E0C80A78](v13);
  v16 = &v39[-v15];
  *(_QWORD *)(v7 - 240) = v4;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v19 = type metadata accessor for Subscribers.Completion(0, v5, AssociatedConformanceWitness, v18);
  MEMORY[0x1E0C80A78](v19);
  v21 = &v39[-v20];
  (*(void (**)(_BYTE *, _QWORD))(v22 + 16))(&v39[-v20], *(_QWORD *)(v7 - 184));
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v1 + 48))(v21, 1, v5) == 1)
  {
    os_unfair_lock_lock(v2[2]);
    v23 = (char *)v2 + *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v16, v23, a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = *(_QWORD *)(v7 - 192);
      swift_storeEnumTagMultiPayload();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 40))(v23, v24, a1);
      swift_endAccess();
      os_unfair_lock_unlock(v2[2]);
      *(_QWORD *)(v7 - 160) = 0;
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v7 - 200) + 56))(v7 - 160, *(_QWORD *)(v7 - 208));
    }
    else
    {
      os_unfair_lock_unlock(v2[2]);
    }
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v16, a1);
  }
  else
  {
    v25 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v1 + 32);
    *(_QWORD *)(v7 - 256) = v5;
    v25(v6, v21, v5);
    os_unfair_lock_lock(v2[2]);
    v26 = (char *)v2 + *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
    swift_beginAccess();
    *(_QWORD *)(v7 - 184) = v9;
    (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v12, v26, a1);
    v27 = a1;
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      os_unfair_lock_unlock(v2[2]);
      return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v6, *(_QWORD *)(v7 - 256));
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        *(_QWORD *)(v7 - 264) = v12;
        *(_QWORD *)(v7 - 272) = v1;
        v29 = *(_QWORD *)(v7 - 192);
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 184) + 40))(v26, v29, v27);
        swift_endAccess();
        os_unfair_lock_unlock(v2[2]);
        (*(void (**)(uint64_t))((char *)v2 + *(_QWORD *)&(*v2)[40]._os_unfair_lock_opaque))(v6);
        *(_QWORD *)(v7 - 176) = v2;
        swift_retain();
        v35 = *(_QWORD *)(v7 - 224);
        *(_QWORD *)(v7 - 136) = v3;
        *(_QWORD *)(v7 - 128) = v35;
        v37 = *(_QWORD *)(v7 - 248);
        v36 = *(_QWORD *)(v7 - 240);
        *(_QWORD *)(v7 - 120) = *(_QWORD *)(v7 - 208);
        *(_QWORD *)(v7 - 112) = v36;
        v38 = *(_QWORD *)(v7 - 200);
        *(_QWORD *)(v7 - 104) = v37;
        *(_QWORD *)(v7 - 96) = v38;
        type metadata accessor for Publishers.TryCatch.Inner.CaughtS();
      }
      v31 = *(_QWORD *)(v7 - 256);
      v32 = *(_QWORD *)(v7 - 192);
      if (EnumCaseMultiPayload)
      {
        result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        (*(void (**)(_QWORD, uint64_t, _QWORD))(v1 + 16))(*(_QWORD *)(v7 - 192), v6, *(_QWORD *)(v7 - 256));
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v32, 0, 1, v31);
        swift_storeEnumTagMultiPayload();
        swift_beginAccess();
        v33 = v1;
        v34 = *(_QWORD *)(v7 - 184);
        (*(void (**)(char *, uint64_t, uint64_t))(v34 + 40))(v26, v32, a1);
        swift_endAccess();
        os_unfair_lock_unlock(v2[2]);
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v6, v31);
        return (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v12, a1);
      }
    }
  }
  return result;
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.UncaughtS.receive(subscription:));
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.UncaughtS.receive(_:));
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.UncaughtS.receive(completion:));
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS()
{
  return 0x6863746143797254;
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS(_QWORD *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.UncaughtS.playgroundDescription.getter);
}

void protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.UncaughtS(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, (void (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.TryCatch.Inner, a2);
}

void Publishers.Catch.Inner.UncaughtS.combineIdentifier.getter(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void (*a7)(_QWORD, _QWORD *)@<X7>, _QWORD *a8@<X8>)
{
  _QWORD v9[6];

  v9[0] = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a5;
  v9[5] = a6;
  a7(0, v9);
  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(a8);
}

void Publishers.TryCatch.Inner.CaughtS.receive(subscription:)()
{
  Publishers.TryCatch.Inner.receivePost(subscription:)();
}

void Publishers.TryCatch.Inner.receivePost(subscription:)()
{
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

void sub_18B5EC4BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[80];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v16[-v8];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v2 + 16));
  v10 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 144);
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v10, a1);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    outlined init with copy of Subscription((uint64_t)v1, (uint64_t)v7);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 40))(v10, v7, a1);
    swift_endAccess();
    v11 = *(_QWORD *)(v2 + 24);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + 16));
    if (v11 == 0x8000000000000000)
    {
LABEL_5:
      v12 = v1[3];
      v13 = v1[4];
      __swift_project_boxed_opaque_existential_1(v1, v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 24))(v11, v12, v13);
      return;
    }
    if (v11 < 0)
    {
      __break(1u);
    }
    else if (v11)
    {
      goto LABEL_5;
    }
  }
  else
  {
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(v2 + 16));
    v15 = v1[3];
    v14 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v15);
    (*(void (**)(uint64_t))(*(_QWORD *)(v14 + 8) + 8))(v15);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v9, a1);
  }
}

uint64_t Publishers.Catch.Inner.CaughtS.receive(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)a2 + 120) + 48))(a1, *(_QWORD *)(*(_QWORD *)a2 + 96));
}

void Publishers.TryCatch.Inner.CaughtS.receive(completion:)(uint64_t a1)
{
  Publishers.TryCatch.Inner.receivePost(completion:)(a1);
}

void Publishers.TryCatch.Inner.receivePost(completion:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v11[4] = a1;
  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 112);
  v4 = *(_QWORD *)(*v1 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11[5] = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v8 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  v11[1] = *(_QWORD *)(v8 - 8);
  v11[2] = v8;
  MEMORY[0x1E0C80A78](v8);
  v11[3] = (char *)v11 - v9;
  v10 = *(_QWORD *)(v2 + 120);
  v13 = *(_QWORD *)(v2 + 80);
  v14 = v4;
  v12 = *(_OWORD *)(v2 + 96);
  v15 = v12;
  v16 = v3;
  v17 = v10;
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

uint64_t sub_18B5EC7A8(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[96];

  v7 = *(_QWORD *)(a1 - 8);
  v8 = MEMORY[0x1E0C80A78](a1);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8);
  v12 = &v19[-v11];
  os_unfair_lock_lock(v2[2]);
  v13 = (char *)v2 + *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v12, v13, a1);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    *(_QWORD *)(v5 - 224) = v3;
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 40))(v13, v10, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v2[2]);
    v14 = *(_QWORD *)(v5 - 200);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v5 - 216) + 16))(v14, *(_QWORD *)(v5 - 192), *(_QWORD *)(v5 - 208));
    v15 = *(_QWORD *)(v5 - 184);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v14, 1, v1) == 1)
    {
      *(_QWORD *)(v5 - 152) = 0;
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 224) + 56))(v5 - 152, *(_QWORD *)(v5 - 176));
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v4, v14, v1);
      v16 = swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v17, v4, v1);
      *(_QWORD *)(v5 - 152) = v16;
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 224) + 56))(v5 - 152, *(_QWORD *)(v5 - 176));
      MEMORY[0x18D77ABF4](v16);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v4, v1);
    }
  }
  else
  {
    os_unfair_lock_unlock(v2[2]);
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, a1);
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.CaughtS.receive(subscription:));
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return protocol witness for Subscriber.receive(_:) in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.CaughtS.receive(completion:));
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>.CaughtS(_QWORD *a1, uint64_t a2)
{
  return protocol witness for CustomReflectable.customMirror.getter in conformance Publishers.Catch<A, B>.Inner<A1>.UncaughtS(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Publishers.TryCatch.Inner.playgroundDescription.getter);
}

void Publishers.TryCatch.Inner.cancel()()
{
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

void sub_18B5ECA24(uint64_t a1)
{
  os_unfair_lock_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  __int128 *v9;
  char *v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[64];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = (__int128 *)&v14[-v8];
  os_unfair_lock_lock(v1[2]);
  v10 = (char *)v1 + *(_QWORD *)&(*v1)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(__int128 *, char *, uint64_t))(v4 + 16))(v9, v10, a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1 || EnumCaseMultiPayload == 2)
  {
    outlined init with take of Subscription(v9, v2 - 96);
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v4 + 40))(v10, v7, a1);
    swift_endAccess();
    os_unfair_lock_unlock(v1[2]);
    v12 = *(_QWORD *)(v2 - 72);
    v13 = *(_QWORD *)(v2 - 64);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 - 96), v12);
    (*(void (**)(uint64_t))(*(_QWORD *)(v13 + 8) + 8))(v12);
    __swift_destroy_boxed_opaque_existential_1(v2 - 96);
  }
  else if (EnumCaseMultiPayload == 4)
  {
    os_unfair_lock_unlock(v1[2]);
  }
  else
  {
    os_unfair_lock_unlock(v1[2]);
    (*(void (**)(__int128 *, uint64_t))(v4 + 8))(v9, a1);
  }
}

void Publishers.TryCatch.Inner.request(_:)()
{
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

void sub_18B5ECBCC(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v9 - v5;
  if (v1 != 0x8000000000000000)
  {
    if (v1 < 0)
    {
      __break(1u);
    }
    else if (v1)
    {
      goto LABEL_4;
    }
    __break(1u);
    JUMPOUT(0x18B5ECD60);
  }
LABEL_4:
  os_unfair_lock_lock(v2[2]);
  v7 = (char *)v2 + *(_QWORD *)&(*v2)[36]._os_unfair_lock_opaque;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, a1);
  v8 = (char *)&loc_18B5ECC60 + dword_18B5ECDC4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_18B5ECD70()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  JUMPOUT(0x18B5ECDC4);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.TryCatch<A, B>.Inner<A1>()
{
  Publishers.TryCatch.Inner.request(_:)();
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.TryCatch<A, B>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.TryCatch.Inner.playgroundDescription.getter(a1);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.TryCatch<A, B>.Inner<A1>()
{
  Publishers.TryCatch.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryCatch<A, B>()
{
  Publishers.TryCatch.receive<A>(subscriber:)();
}

void specialized Publishers.TryCatch.Inner.init(downstream:handler:)()
{
  uint64_t *v0;
  uint64_t v1;
  char *v2;
  uint64_t AssociatedTypeWitness;

  v1 = *v0;
  v0[3] = 0;
  v2 = (char *)v0 + *(_QWORD *)(v1 + 144);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v2, 1, 1, AssociatedTypeWitness);
  type metadata accessor for Publishers.TryCatch.Inner.State();
}

char *sub_18B5ECEEC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _DWORD *v6;

  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(&v1[*(_QWORD *)(*(_QWORD *)v1 + 152)], v3, v4);
  v5 = &v1[*(_QWORD *)(*(_QWORD *)v1 + 160)];
  *(_QWORD *)v5 = v2;
  *((_QWORD *)v5 + 1) = v0;
  swift_retain();
  v6 = (_DWORD *)swift_slowAlloc();
  *v6 = 0;
  *((_QWORD *)v1 + 2) = v6;
  return v1;
}

void type metadata accessor for Publishers.TryCatch.Inner.UncaughtS()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t type metadata completion function for Publishers.TryCatch.Inner(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  return type metadata completion function for Publishers.Catch.Inner(a1, a2, a3, (uint64_t (*)(uint64_t, _OWORD *))type metadata accessor for Publishers.TryCatch.Inner.State);
}

void type metadata accessor for Publishers.TryCatch.Inner.State()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.TryCatch.Inner.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  int v8;
  unsigned int v10;
  int v11;
  unsigned int v13;
  uint64_t v16;
  uint64_t v18;
  __int128 v19;
  unsigned int v20;
  __int128 v21;
  int v22;
  unsigned int v23;
  unsigned int v24;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84))
    v6 = *(_QWORD *)(v5 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64) + 1;
  if (v6 <= 0x28)
    v7 = 40;
  else
    v7 = v6;
  if (v7 <= 3)
  {
    v10 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    v8 = *(_DWORD *)(v5 + 80);
    if (v10 > 0xFFFC)
    {
      if ((unint64_t)(v7 + 4) > 0x18 || (v8 & 0x1000F8) != 0)
        goto LABEL_33;
      v13 = *(_DWORD *)((char *)a2 + v7);
      if (v13 >= 3)
        goto LABEL_36;
    }
    else
    {
      v11 = v8 & 0x1000F8;
      if (v10 <= 0xFC)
      {
        if ((unint64_t)(v7 + 1) > 0x18 || v11 != 0)
          goto LABEL_33;
LABEL_20:
        v13 = *((unsigned __int8 *)a2 + v7);
        if (v13 < 3)
          goto LABEL_40;
LABEL_36:
        if (v7 <= 3)
          v18 = v7;
        else
          v18 = 4;
        __asm { BR              X12 }
      }
      if ((unint64_t)(v7 + 2) > 0x18 || v11 != 0)
        goto LABEL_33;
      v13 = *(unsigned __int16 *)((char *)a2 + v7);
      if (v13 >= 3)
        goto LABEL_36;
    }
LABEL_40:
    if (v13 != 2)
    {
      if (v13 != 1)
      {
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
        {
          memcpy(a1, a2, v6);
          if (v7 > 3)
            goto LABEL_56;
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
          (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
          if (v7 > 3)
          {
LABEL_56:
            *((_BYTE *)a1 + v7) = 0;
            return a1;
          }
        }
        v24 = ((1 << (8 * v7)) + 1) >> (8 * v7);
        if (v24 > 0xFFFC)
        {
          *(_DWORD *)((char *)a1 + v7) = 0;
          return a1;
        }
        if (v24 > 0xFC)
        {
          *(_WORD *)((char *)a1 + v7) = 0;
          return a1;
        }
        goto LABEL_56;
      }
      v21 = *(_OWORD *)(a2 + 3);
      *(_OWORD *)(a1 + 3) = v21;
      (**(void (***)(uint64_t *, uint64_t *))(v21 - 8))(a1, a2);
      if (v7 > 3)
      {
LABEL_52:
        *((_BYTE *)a1 + v7) = 1;
        return a1;
      }
      v22 = 1;
      v23 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v23 <= 0xFFFC)
      {
        if (v23 <= 0xFC)
          goto LABEL_52;
LABEL_61:
        *(_WORD *)((char *)a1 + v7) = v22;
        return a1;
      }
LABEL_58:
      *(_DWORD *)((char *)a1 + v7) = v22;
      return a1;
    }
    v19 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 3) = v19;
    (**(void (***)(uint64_t *, uint64_t *))(v19 - 8))(a1, a2);
    if (v7 <= 3)
    {
      v20 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v20 > 0xFFFC)
      {
        v22 = 2;
        goto LABEL_58;
      }
      if (v20 > 0xFC)
      {
        LOWORD(v22) = 2;
        goto LABEL_61;
      }
    }
    *((_BYTE *)a1 + v7) = 2;
    return a1;
  }
  v8 = *(_DWORD *)(v5 + 80);
  if ((unint64_t)(v7 + 1) <= 0x18 && (v8 & 0x1000F8) == 0)
    goto LABEL_20;
LABEL_33:
  v16 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v16 + (((v8 & 0xF8 | 7u) + 16) & ~(unint64_t)(v8 & 0xF8 | 7u)));
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for Publishers.TryCatch.Inner.State(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  unsigned int v20;

  if (a1 == a2)
    return a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84))
    v6 = *(_QWORD *)(v5 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64) + 1;
  if (v6 <= 0x28)
    v7 = 40;
  else
    v7 = v6;
  v8 = 8 * v7;
  if (v7 > 3)
    goto LABEL_11;
  v9 = ((1 << v8) + 1) >> v8;
  if (v9 > 0xFFFC)
  {
    v10 = *(_DWORD *)((char *)a1 + v7);
    if (v10 < 3)
      goto LABEL_20;
    goto LABEL_16;
  }
  if (v9 <= 0xFC)
  {
LABEL_11:
    v10 = *((unsigned __int8 *)a1 + v7);
    if (v10 < 3)
      goto LABEL_20;
LABEL_16:
    if (v7 <= 3)
      v11 = v7;
    else
      v11 = 4;
    __asm { BR              X12 }
  }
  v10 = *(unsigned __int16 *)((char *)a1 + v7);
  if (v10 >= 3)
    goto LABEL_16;
LABEL_20:
  if (v10 == 2 || v10 == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    if (v7 > 3)
      goto LABEL_29;
  }
  else
  {
    if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48))(a1, 1, AssociatedTypeWitness))
      (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    if (v7 > 3)
      goto LABEL_29;
  }
  v12 = ((1 << v8) + 1) >> v8;
  if (v12 > 0xFFFC)
  {
    v13 = *(_DWORD *)((char *)a2 + v7);
    if (v13 < 3)
      goto LABEL_38;
    goto LABEL_34;
  }
  if (v12 <= 0xFC)
  {
LABEL_29:
    v13 = *((unsigned __int8 *)a2 + v7);
    if (v13 < 3)
      goto LABEL_38;
LABEL_34:
    if (v7 <= 3)
      v14 = v7;
    else
      v14 = 4;
    __asm { BR              X12 }
  }
  v13 = *(unsigned __int16 *)((char *)a2 + v7);
  if (v13 >= 3)
    goto LABEL_34;
LABEL_38:
  if (v13 != 2)
  {
    if (v13 != 1)
    {
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
      {
        memcpy(a1, a2, v6);
        if (v7 > 3)
          goto LABEL_54;
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
        if (v7 > 3)
        {
LABEL_54:
          *((_BYTE *)a1 + v7) = 0;
          return a1;
        }
      }
      v20 = ((1 << v8) + 1) >> v8;
      if (v20 > 0xFFFC)
      {
        *(_DWORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (v20 > 0xFC)
      {
        *(_WORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      goto LABEL_54;
    }
    v17 = a2[3];
    a1[3] = v17;
    a1[4] = a2[4];
    (**(void (***)(_QWORD *, _QWORD *))(v17 - 8))(a1, a2);
    if (v7 > 3)
      goto LABEL_50;
    v18 = 1;
    v19 = ((1 << v8) + 1) >> v8;
    if (v19 <= 0xFFFC)
    {
      if (v19 <= 0xFC)
      {
LABEL_50:
        *((_BYTE *)a1 + v7) = 1;
        return a1;
      }
LABEL_59:
      *(_WORD *)((char *)a1 + v7) = v18;
      return a1;
    }
LABEL_56:
    *(_DWORD *)((char *)a1 + v7) = v18;
    return a1;
  }
  v15 = a2[3];
  a1[3] = v15;
  a1[4] = a2[4];
  (**(void (***)(_QWORD *, _QWORD *))(v15 - 8))(a1, a2);
  if (v7 <= 3)
  {
    v16 = ((1 << v8) + 1) >> v8;
    if (v16 > 0xFFFC)
    {
      v18 = 2;
      goto LABEL_56;
    }
    if (v16 > 0xFC)
    {
      LOWORD(v18) = 2;
      goto LABEL_59;
    }
  }
  *((_BYTE *)a1 + v7) = 2;
  return a1;
}

_OWORD *initializeWithTake for Publishers.TryCatch.Inner.State(_OWORD *a1, _OWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  __int128 v11;
  unsigned int v12;
  __int128 v13;
  int v14;
  unsigned int v15;
  unsigned int v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84))
    v6 = *(_QWORD *)(v5 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64) + 1;
  if (v6 <= 0x28)
    v7 = 40;
  else
    v7 = v6;
  if (v7 > 3)
    goto LABEL_10;
  v8 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v8 <= 0xFFFC)
  {
    if (v8 > 0xFC)
    {
      v9 = *(unsigned __int16 *)((char *)a2 + v7);
      if (v9 < 3)
        goto LABEL_19;
      goto LABEL_15;
    }
LABEL_10:
    v9 = *((unsigned __int8 *)a2 + v7);
    if (v9 < 3)
      goto LABEL_19;
LABEL_15:
    if (v7 <= 3)
      v10 = v7;
    else
      v10 = 4;
    __asm { BR              X12 }
  }
  v9 = *(_DWORD *)((char *)a2 + v7);
  if (v9 >= 3)
    goto LABEL_15;
LABEL_19:
  if (v9 != 2)
  {
    if (v9 != 1)
    {
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
      {
        memcpy(a1, a2, v6);
        if (v7 > 3)
          goto LABEL_35;
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
        (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
        if (v7 > 3)
        {
LABEL_35:
          *((_BYTE *)a1 + v7) = 0;
          return a1;
        }
      }
      v16 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v16 > 0xFFFC)
      {
        *(_DWORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      if (v16 > 0xFC)
      {
        *(_WORD *)((char *)a1 + v7) = 0;
        return a1;
      }
      goto LABEL_35;
    }
    v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
    if (v7 > 3)
      goto LABEL_31;
    v14 = 1;
    v15 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v15 <= 0xFFFC)
    {
      if (v15 <= 0xFC)
      {
LABEL_31:
        *((_BYTE *)a1 + v7) = 1;
        return a1;
      }
LABEL_40:
      *(_WORD *)((char *)a1 + v7) = v14;
      return a1;
    }
LABEL_37:
    *(_DWORD *)((char *)a1 + v7) = v14;
    return a1;
  }
  v11 = a2[1];
  *a1 = *a2;
  a1[1] = v11;
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  if (v7 <= 3)
  {
    v12 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v12 > 0xFFFC)
    {
      v14 = 2;
      goto LABEL_37;
    }
    if (v12 > 0xFC)
    {
      LOWORD(v14) = 2;
      goto LABEL_40;
    }
  }
  *((_BYTE *)a1 + v7) = 2;
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.TryCatch.Inner.State(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  int v22;
  unsigned int v24;
  int v25;
  int v26;
  unsigned int v27;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v6;
  if (v6 <= 0x28)
    v6 = 40;
  if (v6 > 3)
  {
    v7 = 4;
LABEL_9:
    v9 = 8;
    goto LABEL_10;
  }
  v8 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v8 > 0xFFFC)
    goto LABEL_13;
  v7 = v8 + 3;
  if (v8 <= 0xFC)
    goto LABEL_9;
  v9 = 16;
LABEL_10:
  v10 = (1 << v9) - v7;
  if ((v10 & 0x80000000) == 0)
  {
    if (v6 > 3)
      goto LABEL_17;
LABEL_14:
    v11 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    v12 = 2;
    if (v11 > 0xFFFC)
      v12 = 4;
    if (v11 > 0xFC)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_13:
  v10 = 0x7FFFFFFF;
  if (v6 <= 3)
    goto LABEL_14;
LABEL_17:
  v12 = 1;
LABEL_18:
  if (!a2)
    return 0;
  if (a2 <= v10)
    goto LABEL_36;
  v13 = v12 + v6;
  v14 = 8 * v13;
  if (v13 <= 3)
  {
    v16 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      v15 = *(_DWORD *)(a1 + v13);
      if (!v15)
        goto LABEL_36;
      goto LABEL_29;
    }
    if (v16 > 0xFF)
    {
      v15 = *(unsigned __int16 *)(a1 + v13);
      if (!*(_WORD *)(a1 + v13))
        goto LABEL_36;
      goto LABEL_29;
    }
    if (v16 < 2)
    {
LABEL_36:
      if (v10)
      {
        if (v6 <= 3)
        {
          v24 = ((1 << (8 * v6)) + 1) >> (8 * v6);
          if (v24 > 0xFFFC)
          {
            v19 = *(_DWORD *)(a1 + v6);
            v20 = ~v19;
LABEL_46:
            v27 = 0x7FFFFFFF;
LABEL_47:
            if (v27 > v20)
              return -v19;
            else
              return 0;
          }
          v22 = v24 + 3;
          if (v24 > 0xFC)
          {
            v26 = *(unsigned __int16 *)(a1 + v6);
            v19 = v26 | 0xFFFF0000;
            v20 = v26 ^ 0xFFFF;
            v21 = 16;
          }
          else
          {
            v25 = *(unsigned __int8 *)(a1 + v6);
            v19 = v25 | 0xFFFFFF00;
            v20 = v25 ^ 0xFF;
            v21 = 8;
          }
        }
        else
        {
          v18 = *(unsigned __int8 *)(a1 + v6);
          v19 = v18 | 0xFFFFFF00;
          v20 = v18 ^ 0xFF;
          v21 = 8;
          v22 = 4;
        }
        v27 = (1 << v21) - v22;
        if ((v27 & 0x80000000) == 0)
          goto LABEL_47;
        goto LABEL_46;
      }
      return 0;
    }
  }
  v15 = *(unsigned __int8 *)(a1 + v13);
  if (!*(_BYTE *)(a1 + v13))
    goto LABEL_36;
LABEL_29:
  v17 = (v15 - 1) << v14;
  if (v13 > 3)
    v17 = 0;
  if ((_DWORD)v13)
  {
    if (v13 > 3)
      LODWORD(v13) = 4;
    __asm { BR              X12 }
  }
  return v10 + v17 + 1;
}

void storeEnumTagSinglePayload for Publishers.TryCatch.Inner.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  char v9;
  int v10;
  char v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  size_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (!v7)
    ++v8;
  if (v8 <= 0x28)
    v8 = 40;
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v13 = ((1 << v9) + 1) >> v9;
    if (v13 > 0xFFFC)
      goto LABEL_14;
    v10 = v13 + 3;
    if (v13 > 0xFC)
    {
      v11 = 16;
LABEL_8:
      v12 = (1 << v11) - v10;
      if ((v12 & 0x80000000) == 0)
      {
        if (v8 > 3)
          goto LABEL_18;
LABEL_15:
        v14 = ((1 << v9) + 1) >> v9;
        v15 = 2;
        if (v14 > 0xFFFC)
          v15 = 4;
        if (v14 > 0xFC)
        {
LABEL_19:
          v16 = v15 + v8;
          if (a3 <= v12)
          {
            v17 = 0u;
          }
          else if (v16 <= 3)
          {
            v19 = ((a3 - v12 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
            if (HIWORD(v19))
            {
              v17 = 4u;
            }
            else if (v19 >= 0x100)
            {
              v17 = 2;
            }
            else
            {
              v17 = v19 > 1;
            }
          }
          else
          {
            v17 = 1u;
          }
          if (v12 < a2)
          {
            v18 = ~v12 + a2;
            if (v16 < 4)
            {
              if ((_DWORD)v16)
              {
                v20 = v18 & ~(-1 << (8 * v16));
                bzero(a1, v16);
                if ((_DWORD)v16 == 3)
                {
                  *(_WORD *)a1 = v20;
                  a1[2] = BYTE2(v20);
                }
                else if ((_DWORD)v16 == 2)
                {
                  *(_WORD *)a1 = v20;
                }
                else
                {
                  *a1 = v20;
                }
              }
            }
            else
            {
              bzero(a1, v16);
              *(_DWORD *)a1 = v18;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_18:
        v15 = 1;
        goto LABEL_19;
      }
LABEL_14:
      v12 = 0x7FFFFFFF;
      if (v8 > 3)
        goto LABEL_18;
      goto LABEL_15;
    }
  }
  else
  {
    v10 = 4;
  }
  v11 = 8;
  goto LABEL_8;
}

uint64_t getEnumTag for Publishers.TryCatch.Inner.State(uint64_t a1)
{
  uint64_t v2;
  int v3;
  unint64_t v4;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;

  v2 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v3 = *(_DWORD *)(v2 + 84);
  v4 = *(_QWORD *)(v2 + 64);
  if (!v3)
    ++v4;
  if (v4 <= 0x28)
    v4 = 40;
  if (v4 > 3)
    goto LABEL_6;
  v6 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v6 > 0xFFFC)
  {
    result = *(unsigned int *)(a1 + v4);
  }
  else
  {
    if (v6 <= 0xFC)
    {
LABEL_6:
      result = *(unsigned __int8 *)(a1 + v4);
      goto LABEL_11;
    }
    result = *(unsigned __int16 *)(a1 + v4);
  }
LABEL_11:
  if (result >= 3)
  {
    if (v4 <= 3)
      v7 = v4;
    else
      v7 = 4;
    __asm { BR              X12 }
  }
  return result;
}

uint64_t destructiveInjectEnumTag for Publishers.TryCatch.Inner.State(_BYTE *a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int *v12;
  unsigned int v13;
  int v14;

  result = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(result - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  if (!v6)
    ++v7;
  if (v7 <= 0x28)
    v8 = 40;
  else
    v8 = v7;
  if (a2 > 2)
  {
    v9 = a2 - 3;
    if (v8 < 4)
    {
      v11 = (v9 >> (8 * v8)) + 3;
      v12 = (int *)&a1[v8];
      v13 = ((1 << (8 * v8)) + 1) >> (8 * v8);
      if (v13 > 0xFFFC)
      {
        *v12 = v11;
      }
      else if (v13 > 0xFC)
      {
        *(_WORD *)v12 = v11;
      }
      else
      {
        *(_BYTE *)v12 = v11;
      }
    }
    else
    {
      a1[v8] = 3;
    }
    if (v8 >= 4)
      v14 = 4;
    else
      v14 = v8;
    bzero(a1, v8);
    __asm { BR              X10 }
  }
  if (v8 > 3)
    goto LABEL_8;
  v10 = ((1 << (8 * v8)) + 1) >> (8 * v8);
  if (v10 > 0xFFFC)
  {
    *(_DWORD *)&a1[v8] = a2;
  }
  else
  {
    if (v10 <= 0xFC)
    {
LABEL_8:
      a1[v8] = a2;
      return result;
    }
    *(_WORD *)&a1[v8] = a2;
  }
  return result;
}

void type metadata accessor for Publishers.TryCatch.Inner.CaughtS()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t associated type witness table accessor for Subscriber.Failure : Error in Publishers.Catch<A, B>.Inner<A1>.CaughtS()
{
  return swift_getAssociatedConformanceWitness();
}

void Publishers.FlatMap.init(upstream:maxPublishers:transform:)(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for Publishers.FlatMap();
}

uint64_t sub_18B5EE310(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + *(int *)(result + 52)) = v3;
  v5 = (_QWORD *)(v4 + *(int *)(result + 56));
  *v5 = v2;
  v5[1] = v1;
  return result;
}

uint64_t sub_18B5EE340()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t Publishers.FlatMap.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t Publishers.FlatMap.maxPublishers.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 52));
}

uint64_t Publishers.FlatMap.transform.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 56));
  swift_retain();
  return v2;
}

uint64_t *Publishers.FlatMap.Outer.__allocating_init(downstream:maxPublishers:map:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  return Publishers.FlatMap.Outer.init(downstream:maxPublishers:map:)(a1, a2, a3, a4);
}

void Publishers.FlatMap.Outer.Side.customMirror.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Mirror.AncestorRepresentation();
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror.DisplayStyle?);
  MEMORY[0x1E0C80A78](v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_18B5F41E0;
  *(_QWORD *)(v2 + 32) = 0xD000000000000012;
  *(_QWORD *)(v2 + 40) = 0x800000018B5FECA0;
  *(_QWORD *)(v2 + 72) = &type metadata for CombineIdentifier;
  type metadata accessor for Publishers.FlatMap.Outer();
}

uint64_t sub_18B5EE52C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  CustomCombineIdentifierConvertible<>.combineIdentifier.getter(v0);
  v3 = type metadata accessor for Mirror.DisplayStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  default argument 3 of Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)(v1);
  swift_retain();
  return Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)();
}

void Publishers.FlatMap.Outer.Side.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x70614D74616C46;
  a1[1] = 0xE700000000000000;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.FlatMap<A, B>.Outer<A1>.Side()
{
  return 0x70614D74616C46;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.FlatMap<A, B>.Outer<A1>(_QWORD *a1@<X8>)
{
  Publishers.FlatMap.Outer.Side.playgroundDescription.getter(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.FlatMap(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *v10 = *v11;
    v12 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    v13 = v12[1];
    v14 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v14 = *v12;
    v14[1] = v13;
  }
  swift_retain();
  return v4;
}

uint64_t assignWithCopy for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for Publishers.FlatMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.FlatMap(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5EE8C0 + 4 * byte_18B5FDAA8[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.FlatMap(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5EEA48()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5EEAC8);
}

void sub_18B5EEA50(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5EEA58);
  JUMPOUT(0x18B5EEAC8);
}

void sub_18B5EEAA0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5EEAC8);
}

void sub_18B5EEAA8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5EEAC8);
}

uint64_t sub_18B5EEAB0(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x18B5EEAC8);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x18B5EEAC4);
    JUMPOUT(0x18B5EEABCLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

void Publisher.delay<A>(for:tolerance:scheduler:options:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t AssociatedTypeWitness;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v46 = a4;
  v49 = a7;
  v51 = a3;
  v37 = a2;
  v44 = a1;
  v47 = a9;
  swift_getAssociatedTypeWitness();
  v43 = type metadata accessor for Optional();
  v41 = *(_QWORD *)(v43 - 8);
  v12 = MEMORY[0x1E0C80A78](v43);
  v42 = (char *)&v36 - v13;
  v48 = a5;
  v38 = *(_QWORD *)(a5 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v40 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a6 - 8);
  v17 = MEMORY[0x1E0C80A78](v14);
  v39 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v36 - v19;
  swift_getAssociatedTypeWitness();
  v50 = a8;
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22 = type metadata accessor for Optional();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v36 - v25;
  v27 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v28 = MEMORY[0x1E0C80A78](v24);
  v36 = (char *)&v36 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28);
  v31 = (char *)&v36 - v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v26, v37, v22);
  v32 = v16;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v33(v20, v51, a6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v26, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t))(v50 + 48))(a6);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v20, a6);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v22);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v20, a6);
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v31, v26, AssociatedTypeWitness);
  }
  v34 = (uint64_t)v40;
  v35 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v40, v45, v48);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v36, v44, AssociatedTypeWitness);
  v33(v39, v51, a6);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v42, v46, v43);
  Publishers.Delay.init(upstream:interval:tolerance:scheduler:options:)(v34, v35, v47);
}

void Publishers.Delay.init(upstream:interval:tolerance:scheduler:options:)(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for Publishers.Delay();
}

uint64_t sub_18B5EEEBC(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v6 = v2 + a1[13];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32);
  v8(v6, v4, AssociatedTypeWitness);
  v8(v2 + a1[14], v3, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v2 + a1[15], v12, v1);
  v9 = v2 + a1[16];
  swift_getAssociatedTypeWitness();
  v10 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, v13, v10);
}

uint64_t Publishers.Delay.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Delay.interval.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v4 = v2 + *(int *)(a1 + 52);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v4, AssociatedTypeWitness);
}

uint64_t Publishers.Delay.tolerance.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v4 = v2 + *(int *)(a1 + 56);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v4, AssociatedTypeWitness);
}

uint64_t Publishers.Delay.scheduler.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 60));
}

uint64_t Publishers.Delay.options.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 64);
  swift_getAssociatedTypeWitness();
  v5 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

void Publishers.Delay.receive<A>(subscriber:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v16 = a4;
  v17 = a1;
  v6 = a2[5];
  v7 = a2[3];
  swift_getAssociatedTypeWitness();
  v20 = type metadata accessor for Optional();
  v19 = *(_QWORD *)(v20 - 8);
  v8 = MEMORY[0x1E0C80A78](v20);
  v18 = (char *)v15 - v9;
  v15[3] = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v8);
  v15[2] = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = MEMORY[0x1E0C80A78](v12);
  MEMORY[0x1E0C80A78](v13);
  v14 = a2[2];
  v15[0] = a2[4];
  v15[1] = v14;
  v21 = v14;
  v22 = v7;
  v23 = a3;
  v24 = v15[0];
  v25 = v6;
  v26 = v16;
  type metadata accessor for Publishers.Delay.Inner();
}

uint64_t sub_18B5EF3AC(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v6, *(_QWORD *)(v10 - 168), v7);
  v12 = *(_QWORD *)(v10 - 144);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v13(v4, v12 + v2[13], v9);
  v13(v8, v12 + v2[14], v9);
  v14 = *(_QWORD *)(v10 - 192);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 184) + 16))(v14, v12 + v2[15], v3);
  v15 = *(_QWORD *)(v10 - 160);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v10 - 152) + 16))(v15, v12 + v2[16], *(_QWORD *)(v10 - 136));
  swift_allocObject();
  *(_QWORD *)(v10 - 128) = Publishers.Delay.Inner.init(_:interval:tolerance:scheduler:options:)(v6, v4, v8, v14, v15);
  v16 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Publishers.Delay<A, B>.Inner<A1>, a1);
  Publisher.subscribe<A>(_:)(v10 - 128, *(_QWORD *)(v10 - 200), a1, *(_QWORD *)(v10 - 208), v16);
  return swift_release();
}

void type metadata accessor for Publishers.Delay.Inner()
{
  JUMPOUT(0x18D77AC60);
}

char *Publishers.Delay.Inner.__allocating_init(_:interval:tolerance:scheduler:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_allocObject();
  return Publishers.Delay.Inner.init(_:interval:tolerance:scheduler:options:)(a1, a2, a3, a4, a5);
}

char *Publishers.Delay.Inner.init(_:interval:tolerance:scheduler:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v10;
  _DWORD *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t AssociatedTypeWitness;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;

  v10 = *(_QWORD *)v5;
  v11 = (_DWORD *)swift_slowAlloc();
  *v11 = 0;
  *((_QWORD *)v5 + 2) = v11;
  v12 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 176)];
  *((_QWORD *)v12 + 4) = 0;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[40] = 2;
  v13 = *(_QWORD *)(*(_QWORD *)v5 + 184);
  v14 = (_QWORD *)swift_slowAlloc();
  *v14 = 0;
  *(_QWORD *)&v5[v13] = v14;
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v10 + 96) - 8) + 32))(&v5[*(_QWORD *)(*(_QWORD *)v5 + 136)], a1);
  v15 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 144)];
  v16 = *(_QWORD *)(v10 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32);
  v18(v15, a2, AssociatedTypeWitness);
  v18(&v5[*(_QWORD *)(*(_QWORD *)v5 + 152)], a3, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(&v5[*(_QWORD *)(*(_QWORD *)v5 + 160)], a4, v16);
  v19 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 168)];
  swift_getAssociatedTypeWitness();
  v20 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a5, v20);
  return v5;
}

char *Publishers.Delay.Inner.deinit()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v1 = *(_QWORD *)v0;
  MEMORY[0x18D77ADB0](*((_QWORD *)v0 + 2), -1, -1);
  MEMORY[0x18D77ADB0](*(_QWORD *)&v0[*(_QWORD *)(*(_QWORD *)v0 + 184)], -1, -1);
  (*(void (**)(char *))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))(&v0[*(_QWORD *)(*(_QWORD *)v0 + 136)]);
  v2 = &v0[*(_QWORD *)(*(_QWORD *)v0 + 144)];
  v3 = *(_QWORD *)(v1 + 88);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8);
  v5(v2, AssociatedTypeWitness);
  v5(&v0[*(_QWORD *)(*(_QWORD *)v0 + 152)], AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(&v0[*(_QWORD *)(*(_QWORD *)v0 + 160)], v3);
  v6 = &v0[*(_QWORD *)(*(_QWORD *)v0 + 168)];
  swift_getAssociatedTypeWitness();
  v7 = type metadata accessor for Optional();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  outlined destroy of SubscriptionStatus((uint64_t)&v0[*(_QWORD *)(*(_QWORD *)v0 + 176)]);
  return v0;
}

uint64_t Publishers.Delay.Inner.__deallocating_deinit()
{
  Publishers.Delay.Inner.deinit();
  return swift_deallocClassInstance();
}

uint64_t Publishers.Delay.Inner.schedule(immediate:work:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v18 = a2;
  v19 = a3;
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 112);
  v8 = *(_QWORD *)(*v4 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v18 - v14;
  if ((a1 & 1) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))((uint64_t)v4 + *(_QWORD *)(v6 + 168), v18, v19, v8, v7);
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v8, v7);
  swift_getAssociatedConformanceWitness();
  dispatch thunk of Strideable.advanced(by:)();
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 64))(v15, (uint64_t)v4 + *(_QWORD *)(*v4 + 152), (uint64_t)v4 + *(_QWORD *)(*v4 + 168), v18, v19, v8, v7);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, AssociatedTypeWitness);
}

void Publishers.Delay.Inner.request(_:)(uint64_t a1)
{
  _QWORD *v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7[2];
  char v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)v7);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v7);
    os_unfair_lock_unlock(v3);
  }
  else
  {
    outlined init with take of Subscription(v7, (uint64_t)v9);
    os_unfair_lock_unlock(v3);
    v5 = v10;
    v6 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
}

void Publishers.Delay.Inner.cancel()()
{
  _QWORD *v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  char v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v1 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v1);
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v2, (uint64_t)&v5);
  if (v8)
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v5);
    os_unfair_lock_unlock(v1);
  }
  else
  {
    outlined init with take of Subscription((__int128 *)&v5, (uint64_t)v9);
    v5 = 1;
    v6 = 0u;
    v7 = 0u;
    v8 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v5, v2);
    swift_endAccess();
    os_unfair_lock_unlock(v1);
    v3 = v10;
    v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 8))(v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
}

uint64_t Publishers.Delay.Inner.receive(subscription:)(_QWORD *a1)
{
  uint64_t *v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  int8x16_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  char v12;

  v3 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v3);
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v4, (uint64_t)&v9);
  if (v12 == 2
    && (v5 = vorrq_s8(v10, v11),
        !(*(_QWORD *)&vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) | v9)))
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v9);
    outlined init with copy of Subscription((uint64_t)a1, (uint64_t)&v9);
    v12 = 0;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v9, v4);
    swift_endAccess();
    os_unfair_lock_unlock(v3);
    os_unfair_recursive_lock_lock_with_options();
    closure #1 in Publishers.Delay.Inner.receive(subscription:)((uint64_t)v1 + *(_QWORD *)(*v1 + 136), v1);
    return os_unfair_recursive_lock_unlock();
  }
  else
  {
    outlined destroy of SubscriptionStatus((uint64_t)&v9);
    os_unfair_lock_unlock(v3);
    v6 = a1[3];
    v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v7 + 8) + 8))(v6);
  }
}

uint64_t closure #1 in Publishers.Delay.Inner.receive(subscription:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  void (*v3)(_QWORD *, uint64_t, uint64_t);
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  _UNKNOWN **v8;

  v7 = *a2;
  v8 = &protocol witness table for Publishers.Delay<A, B>.Inner<A1>;
  v6[0] = a2;
  v2 = *(_QWORD *)(v7 + 120);
  v3 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v2 + 40);
  v4 = *(_QWORD *)(v7 + 96);
  swift_retain();
  v3(v6, v4, v2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

void Publishers.Delay.Inner.scheduledReceive(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  __int128 v18[2];
  unsigned __int8 v19;
  _BYTE v20[48];

  v3 = *v1;
  v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  v5 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)v20);
  outlined init with copy of SubscriptionStatus((uint64_t)v20, (uint64_t)v18);
  v6 = v19;
  outlined destroy of SubscriptionStatus((uint64_t)v18);
  outlined destroy of SubscriptionStatus((uint64_t)v20);
  os_unfair_lock_unlock(v4);
  if (v6 <= 1)
  {
    v7 = *(_QWORD *)(v3 + 96);
    v8 = *(_QWORD *)(v3 + 120);
    os_unfair_recursive_lock_lock_with_options();
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, v7, v8);
    os_unfair_recursive_lock_unlock();
    if (v9 == 0x8000000000000000)
      goto LABEL_5;
    if (v9 < 0)
    {
      __break(1u);
      return;
    }
    if (v9)
    {
LABEL_5:
      os_unfair_lock_lock(v4);
      outlined init with copy of SubscriptionStatus(v5, (uint64_t)v20);
      outlined init with copy of SubscriptionStatus((uint64_t)v20, (uint64_t)v18);
      if (v19 != 1 && v19)
      {
        v14 = 0;
        v12 = 0u;
        v13 = 0u;
        outlined destroy of SubscriptionStatus((uint64_t)v18);
      }
      else
      {
        outlined init with take of Subscription(v18, (uint64_t)&v12);
      }
      outlined destroy of SubscriptionStatus((uint64_t)v20);
      if (*((_QWORD *)&v13 + 1))
      {
        outlined init with take of Subscription(&v12, (uint64_t)v15);
        os_unfair_lock_unlock(v4);
        v10 = v16;
        v11 = v17;
        __swift_project_boxed_opaque_existential_1(v15, v16);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 24))(v9, v10, v11);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      }
      else
      {
        outlined destroy of Subscription?((uint64_t)&v12);
        os_unfair_lock_unlock(v4);
      }
    }
  }
}

uint64_t Publishers.Delay.Inner.receive(_:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  _BYTE v16[48];

  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 80);
  v15 = *(_QWORD *)(*v1 + 104);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v8 = &v16[-v7 - 8];
  v9 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v9);
  v10 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v10, (uint64_t)v16);
  LODWORD(v10) = v16[40];
  outlined destroy of SubscriptionStatus((uint64_t)v16);
  os_unfair_lock_unlock(v9);
  if (!(_DWORD)v10)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, a1, AssociatedTypeWitness);
    v11 = (*(unsigned __int8 *)(v6 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v12 = (char *)swift_allocObject();
    *((_QWORD *)v12 + 2) = v4;
    *((_QWORD *)v12 + 3) = v3[11];
    v13 = v15;
    *((_QWORD *)v12 + 4) = v3[12];
    *((_QWORD *)v12 + 5) = v13;
    *((_QWORD *)v12 + 6) = v3[14];
    *((_QWORD *)v12 + 7) = v3[15];
    *((_QWORD *)v12 + 8) = v1;
    (*(void (**)(char *, _BYTE *, uint64_t))(v6 + 32))(&v12[v11], v8, AssociatedTypeWitness);
    swift_retain();
    Publishers.Delay.Inner.schedule(immediate:work:)(0, (uint64_t)partial apply for closure #1 in Publishers.Delay.Inner.receive(_:), (uint64_t)v12);
    swift_release();
  }
  return 0;
}

void Publishers.Delay.Inner.scheduledReceive(completion:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[48];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  char v13;

  v3 = *v1;
  v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  v5 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v5, (uint64_t)&v10);
  outlined init with copy of SubscriptionStatus((uint64_t)&v10, (uint64_t)v9);
  v6 = v9[40];
  outlined destroy of SubscriptionStatus((uint64_t)v9);
  outlined destroy of SubscriptionStatus((uint64_t)&v10);
  if (v6 > 1)
  {
    os_unfair_lock_unlock(v4);
  }
  else
  {
    v10 = 1;
    v11 = 0u;
    v12 = 0u;
    v13 = 2;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)&v10, v5);
    swift_endAccess();
    os_unfair_lock_unlock(v4);
    v7 = *(_QWORD *)(v3 + 96);
    v8 = *(_QWORD *)(v3 + 120);
    os_unfair_recursive_lock_lock_with_options();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v7, v8);
    os_unfair_recursive_lock_unlock();
  }
}

void Publishers.Delay.Inner.receive(completion:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  __int128 v18[2];
  char v19;
  _BYTE v20[40];

  v17 = a1;
  v2 = (_QWORD *)*v1;
  v3 = *(_QWORD *)(*v1 + 104);
  v4 = *(_QWORD *)(*v1 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v8 = type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v7);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v18 - v10 + 16;
  v12 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v12);
  v13 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  outlined init with copy of SubscriptionStatus(v13, (uint64_t)v18);
  if (v19)
  {
    outlined destroy of SubscriptionStatus((uint64_t)v18);
    os_unfair_lock_unlock(v12);
  }
  else
  {
    outlined init with take of Subscription(v18, (uint64_t)v20);
    outlined init with copy of Subscription((uint64_t)v20, (uint64_t)v18);
    v19 = 1;
    swift_beginAccess();
    outlined assign with take of SubscriptionStatus((uint64_t)v18, v13);
    swift_endAccess();
    os_unfair_lock_unlock(v12);
    v14 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v17, v8);
    v15 = (*(unsigned __int8 *)(v9 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v16 = (char *)swift_allocObject();
    *((_QWORD *)v16 + 2) = v4;
    *((_QWORD *)v16 + 3) = v2[11];
    *((_QWORD *)v16 + 4) = v2[12];
    *((_QWORD *)v16 + 5) = v3;
    *((_QWORD *)v16 + 6) = v2[14];
    *((_QWORD *)v16 + 7) = v2[15];
    *((_QWORD *)v16 + 8) = v1;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], v11, v14);
    swift_retain();
    Publishers.Delay.Inner.schedule(immediate:work:)(0, (uint64_t)partial apply for closure #1 in Publishers.Delay.Inner.receive(completion:), (uint64_t)v16);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance Publishers.Delay<A, B>.Inner<A1>(_QWORD *a1)
{
  return Publishers.Delay.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance Publishers.Delay<A, B>.Inner<A1>(uint64_t a1)
{
  return Publishers.Delay.Inner.receive(_:)(a1);
}

void protocol witness for Subscriber.receive(completion:) in conformance Publishers.Delay<A, B>.Inner<A1>(uint64_t a1)
{
  Publishers.Delay.Inner.receive(completion:)(a1);
}

void protocol witness for Subscription.request(_:) in conformance Publishers.Delay<A, B>.Inner<A1>(uint64_t a1)
{
  Publishers.Delay.Inner.request(_:)(a1);
}

void protocol witness for Cancellable.cancel() in conformance Publishers.Delay<A, B>.Inner<A1>()
{
  Publishers.Delay.Inner.cancel()();
}

void protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.Delay<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  Publishers.Delay.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t *initializeBufferWithCopyOfBuffer for Publishers.Delay(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(unint64_t, unint64_t, uint64_t);
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  const void *v35;
  size_t __n;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = *(_QWORD *)(a3 + 24);
  v45 = *(_QWORD *)(a3 + 16);
  v46 = *(_QWORD *)(v45 - 8);
  v4 = *(_QWORD *)(v46 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v39 = v4 + v7;
  v8 = *(_QWORD *)(v6 + 64);
  v40 = v8 + v7;
  v9 = *(_QWORD *)(v3 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10;
  v41 = v8 + v10;
  v12 = (v8 + v11 + ((v40 + (v39 & ~(unint64_t)v7)) & ~(unint64_t)v7)) & ~v11;
  v42 = v9;
  v43 = AssociatedTypeWitness;
  v13 = *(_QWORD *)(v9 + 64);
  v44 = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(v44 - 8);
  v15 = *(_DWORD *)(v14 + 80);
  v16 = v15;
  v17 = v13 + v15;
  if (*(_DWORD *)(v14 + 84))
    v18 = *(_QWORD *)(v14 + 64);
  else
    v18 = *(_QWORD *)(v14 + 64) + 1;
  v19 = v7 | *(_DWORD *)(v46 + 80) | v10 | v15;
  v20 = (v7 | *(_BYTE *)(v46 + 80) | v10 | v15);
  v21 = v19 & 0x100000;
  if (v20 > 7 || v21 != 0 || ((v13 + v16 + v12) & ~v16) + v18 > 0x18)
  {
    v24 = *a2;
    *a1 = *a2;
    v26 = (uint64_t *)(v24 + ((v20 + 16) & ~v20));
    swift_retain();
  }
  else
  {
    v25 = ~(unint64_t)v7;
    __n = v18;
    v38 = ~v16;
    v26 = a1;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v46 + 16))(a1, a2, v45);
    v27 = ((unint64_t)a1 + v39) & v25;
    v28 = ((unint64_t)a2 + v39) & v25;
    v29 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
    v29(v27, v28, v43);
    v30 = (v40 + v27) & v25;
    v31 = (v40 + v28) & v25;
    v29(v30, v31, v43);
    v32 = (v41 + v30) & ~v11;
    v33 = (v41 + v31) & ~v11;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v42 + 16))(v32, v33, v3);
    v34 = (void *)((v32 + v17) & v38);
    v35 = (const void *)((v33 + v17) & v38);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v35, 1, v44))
    {
      memcpy(v34, v35, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v34, v35, v44);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v34, 0, 1, v44);
    }
  }
  return v26;
}

uint64_t destroy for Publishers.Delay(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  v5 = *(_QWORD *)(v4 + 64) + a1;
  v6 = *(_QWORD *)(a2 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v5 + v9) & ~v9;
  v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v11(v10, AssociatedTypeWitness);
  v12 = *(_QWORD *)(v8 + 64);
  v13 = (v12 + v9 + v10) & ~v9;
  v11(v13, AssociatedTypeWitness);
  v14 = *(_QWORD *)(v6 - 8);
  v15 = (v13 + v12 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v15, v6);
  v16 = *(_QWORD *)(v14 + 64);
  v17 = swift_getAssociatedTypeWitness();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (v15 + v16 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v18 + 48))(v19, 1, v17);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(unint64_t, uint64_t))(v18 + 8))(v19, v17);
  return result;
}

uint64_t initializeWithCopy for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  size_t v29;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v7 + v11;
  v13 = (v7 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v15(v13, v14, AssociatedTypeWitness);
  v16 = *(_QWORD *)(v10 + 64);
  v17 = (v16 + v11 + v13) & ~v11;
  v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  v19 = *(_QWORD *)(v8 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v16 + v20 + v17) & ~v20;
  v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v21, v22, v8);
  v23 = *(_QWORD *)(v19 + 64);
  v24 = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = (void *)((v23 + v26 + v21) & ~v26);
  v28 = (const void *)((v23 + v26 + v22) & ~v26);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v28, 1, v24))
  {
    if (*(_DWORD *)(v25 + 84))
      v29 = *(_QWORD *)(v25 + 64);
    else
      v29 = *(_QWORD *)(v25 + 64) + 1;
    memcpy(v27, v28, v29);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 16))(v27, v28, v24);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v27, 0, 1, v24);
  }
  return a1;
}

uint64_t assignWithCopy for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t (*v29)(void *, uint64_t, uint64_t);
  int v30;
  size_t v31;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v7 + v11;
  v13 = (v7 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24);
  v15(v13, v14, AssociatedTypeWitness);
  v16 = *(_QWORD *)(v10 + 64);
  v17 = (v16 + v11 + v13) & ~v11;
  v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  v19 = *(_QWORD *)(v8 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v16 + v20 + v17) & ~v20;
  v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 24))(v21, v22, v8);
  v23 = *(_QWORD *)(v19 + 64);
  v24 = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = (void *)((v23 + v26 + v21) & ~v26);
  v28 = (void *)((v23 + v26 + v22) & ~v26);
  v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  LODWORD(v22) = v29(v27, 1, v24);
  v30 = v29(v28, 1, v24);
  if ((_DWORD)v22)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v27, v28, v24);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v27, 0, 1, v24);
      return a1;
    }
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v27, v28, v24);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v27, v24);
  }
  if (*(_DWORD *)(v25 + 84))
    v31 = *(_QWORD *)(v25 + 64);
  else
    v31 = *(_QWORD *)(v25 + 64) + 1;
  memcpy(v27, v28, v31);
  return a1;
}

uint64_t initializeWithTake for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  size_t v29;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v7 + v11;
  v13 = (v7 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  v15(v13, v14, AssociatedTypeWitness);
  v16 = *(_QWORD *)(v10 + 64);
  v17 = (v16 + v11 + v13) & ~v11;
  v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  v19 = *(_QWORD *)(v8 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v16 + v20 + v17) & ~v20;
  v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v21, v22, v8);
  v23 = *(_QWORD *)(v19 + 64);
  v24 = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = (void *)((v23 + v26 + v21) & ~v26);
  v28 = (const void *)((v23 + v26 + v22) & ~v26);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48))(v28, 1, v24))
  {
    if (*(_DWORD *)(v25 + 84))
      v29 = *(_QWORD *)(v25 + 64);
    else
      v29 = *(_QWORD *)(v25 + 64) + 1;
    memcpy(v27, v28, v29);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 32))(v27, v28, v24);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v27, 0, 1, v24);
  }
  return a1;
}

uint64_t assignWithTake for Publishers.Delay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t (*v29)(void *, uint64_t, uint64_t);
  int v30;
  size_t v31;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = v7 + v11;
  v13 = (v7 + v11 + a1) & ~v11;
  v14 = (v12 + a2) & ~v11;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40);
  v15(v13, v14, AssociatedTypeWitness);
  v16 = *(_QWORD *)(v10 + 64);
  v17 = (v16 + v11 + v13) & ~v11;
  v18 = (v16 + v11 + v14) & ~v11;
  v15(v17, v18, AssociatedTypeWitness);
  v19 = *(_QWORD *)(v8 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v16 + v20 + v17) & ~v20;
  v22 = (v16 + v20 + v18) & ~v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 40))(v21, v22, v8);
  v23 = *(_QWORD *)(v19 + 64);
  v24 = swift_getAssociatedTypeWitness();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(unsigned __int8 *)(v25 + 80);
  v27 = (void *)((v23 + v26 + v21) & ~v26);
  v28 = (void *)((v23 + v26 + v22) & ~v26);
  v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  LODWORD(v22) = v29(v27, 1, v24);
  v30 = v29(v28, 1, v24);
  if ((_DWORD)v22)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v27, v28, v24);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v27, 0, 1, v24);
      return a1;
    }
  }
  else
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v27, v28, v24);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v27, v24);
  }
  if (*(_DWORD *)(v25 + 84))
    v31 = *(_QWORD *)(v25 + 64);
  else
    v31 = *(_QWORD *)(v25 + 64) + 1;
  memcpy(v27, v28, v31);
  return a1;
}

uint64_t getEnumTagSinglePayload for Publishers.Delay(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  int v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t AssociatedTypeWitness;
  uint64_t v39;
  unsigned int v40;

  v4 = *(_QWORD *)(a3 + 24);
  v39 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v39 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v40 = v6;
  if (v8 <= v6)
    v9 = v6;
  else
    v9 = *(_DWORD *)(v7 + 84);
  v10 = *(_QWORD *)(v4 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v11 <= v9)
    v12 = v9;
  else
    v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v14 = *(_DWORD *)(v13 + 84);
  v15 = v14 - 1;
  if (!v14)
    v15 = 0;
  if (v15 <= v12)
    v15 = v12;
  if (v14)
    v16 = *(_QWORD *)(v13 + 64);
  else
    v16 = *(_QWORD *)(v13 + 64) + 1;
  if (!a2)
    return 0;
  v17 = *(unsigned __int8 *)(v7 + 80);
  v18 = *(_QWORD *)(v5 + 64) + v17;
  v19 = *(_QWORD *)(v7 + 64);
  v20 = v19 + v17;
  v21 = *(unsigned __int8 *)(v10 + 80);
  v22 = v19 + v21;
  v23 = *(unsigned __int8 *)(v13 + 80);
  v24 = *(_QWORD *)(v10 + 64) + v23;
  v25 = a1;
  if (a2 <= v15)
    goto LABEL_33;
  v26 = v16 + ((v24 + ((v22 + ((v20 + (v18 & ~v17)) & ~v17)) & ~v21)) & ~v23);
  v27 = 8 * v26;
  if (v26 > 3)
    goto LABEL_17;
  v29 = ((a2 - v15 + ~(-1 << v27)) >> v27) + 1;
  if (HIWORD(v29))
  {
    v28 = *(_DWORD *)(a1 + v26);
    if (!v28)
      goto LABEL_33;
    goto LABEL_24;
  }
  if (v29 > 0xFF)
  {
    v28 = *(unsigned __int16 *)(a1 + v26);
    if (!*(_WORD *)(a1 + v26))
      goto LABEL_33;
    goto LABEL_24;
  }
  if (v29 >= 2)
  {
LABEL_17:
    v28 = *(unsigned __int8 *)(a1 + v26);
    if (!*(_BYTE *)(a1 + v26))
      goto LABEL_33;
LABEL_24:
    v30 = (v28 - 1) << v27;
    if (v26 > 3)
      v30 = 0;
    if ((_DWORD)v26)
    {
      if (v26 <= 3)
        v31 = v26;
      else
        v31 = 4;
      __asm { BR              X12 }
    }
    return v15 + v30 + 1;
  }
LABEL_33:
  if (!v15)
    return 0;
  if (v40 == v15)
  {
    v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    v33 = v40;
    v34 = v39;
    return v32(v25, v33, v34);
  }
  v35 = ~v17;
  v25 = (v18 + a1) & v35;
  if ((_DWORD)v8 == v15)
  {
    v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v33 = v8;
    v34 = AssociatedTypeWitness;
    return v32(v25, v33, v34);
  }
  v25 = (v22 + ((v20 + v25) & v35)) & ~v21;
  if ((_DWORD)v11 == v15)
  {
    v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v33 = v11;
    v34 = v4;
    return v32(v25, v33, v34);
  }
  v36 = (*(uint64_t (**)(uint64_t))(v13 + 48))((v24 + v25) & ~v23);
  if (v36 >= 2)
    return v36 - 1;
  else
    return 0;
}

void storeEnumTagSinglePayload for Publishers.Delay(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  unsigned int v19;
  unsigned int v20;
  int v21;

  v4 = *(_QWORD *)(a4 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v7 + 84) <= v6)
    v8 = v6;
  else
    v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v4 - 8);
  if (*(_DWORD *)(v9 + 84) <= v8)
    v10 = v8;
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = 0u;
  v12 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v13 = *(_DWORD *)(v12 + 84);
  v14 = v13 - 1;
  if (!v13)
    v14 = 0;
  if (v14 <= v10)
    v15 = v10;
  else
    v15 = v14;
  v17 = *(_QWORD *)(v12 + 64);
  if (!v13)
    ++v17;
  v16 = *(unsigned __int8 *)(v7 + 80);
  v18 = ((*(_QWORD *)(v9 + 64)
        + *(unsigned __int8 *)(v12 + 80)
        + ((*(_QWORD *)(v7 + 64)
          + *(unsigned __int8 *)(v9 + 80)
          + ((*(_QWORD *)(v7 + 64) + v16 + ((*(_QWORD *)(v5 + 64) + v16) & ~v16)) & ~v16)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
      + v17;
  if (a3 > v15)
  {
    if (v18 <= 3)
    {
      v19 = ((a3 - v15 + ~(-1 << (8 * v18))) >> (8 * v18)) + 1;
      if (HIWORD(v19))
      {
        v11 = 4u;
      }
      else if (v19 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v19 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  if (v15 < a2)
  {
    v20 = ~v15 + a2;
    if (v18 < 4)
    {
      if ((_DWORD)v18)
      {
        v21 = v20 & ~(-1 << (8 * v18));
        bzero(a1, v18);
        if ((_DWORD)v18 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if ((_DWORD)v18 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v18);
      *(_DWORD *)a1 = v20;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X5 }
}

void sub_18B5F1810()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + v2) = v0;
}

void sub_18B5F1818()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;

  *(_WORD *)(v1 + v2) = v0;
}

void sub_18B5F18A8()
{
  _BYTE *v0;
  char v1;

  *v0 = v1;
}

void sub_18B5F18DC()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_18B5F18E4()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_18B5F18F4()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t type metadata completion function for Publishers.Delay.Inner()
{
  uint64_t AssociatedTypeWitness;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      AssociatedTypeWitness = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_getAssociatedTypeWitness();
        AssociatedTypeWitness = type metadata accessor for Optional();
        if (v4 <= 0x3F)
          return swift_initClassMetadata2();
      }
    }
  }
  return AssociatedTypeWitness;
}

uint64_t sub_18B5F1A90()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v3)- 8)+ 80);
  v5 = (v4 + 72) & ~v4;
  swift_release();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v5, 1, AssociatedTypeWitness))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v5, AssociatedTypeWitness);
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Delay.Inner.receive(completion:)()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;
  uint64_t v4;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Subscribers.Completion(0, AssociatedTypeWitness, AssociatedConformanceWitness, v3)- 8)+ 80);
  Publishers.Delay.Inner.scheduledReceive(completion:)(v0 + ((v4 + 72) & ~v4));
}

uint64_t sub_18B5F1C18()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

void partial apply for closure #1 in Publishers.Delay.Inner.receive(_:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 80);
  Publishers.Delay.Inner.scheduledReceive(_:)(v0 + ((v1 + 72) & ~v1));
}

uint64_t Publishers.Drop.init(upstream:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t result;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, a1);
  result = type metadata accessor for Publishers.Drop(0, a3, a4, v9);
  *(_QWORD *)(a5 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t Publishers.Drop.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.Drop.count.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

uint64_t *Publishers.Drop.Inner.__allocating_init(downstream:count:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return Publishers.Drop.Inner.init(downstream:count:)(a1, a2);
}

void Publishers.Drop.Inner.playgroundDescription.getter(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 1886351940;
  a1[1] = 0xE400000000000000;
}

uint64_t Publishers.Drop.Inner.cancel()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  _BYTE v9[40];

  v1 = *(os_unfair_lock_s **)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
  os_unfair_lock_lock(v1);
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 128);
  swift_beginAccess();
  outlined init with copy of Subscription?(v2, (uint64_t)v9);
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  swift_beginAccess();
  outlined assign with take of Subscription?((uint64_t)&v6, v2);
  swift_endAccess();
  os_unfair_lock_unlock(v1);
  outlined init with copy of Subscription?((uint64_t)v9, (uint64_t)&v6);
  v3 = *((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v4 = v8;
    __swift_project_boxed_opaque_existential_1(&v6, *((uint64_t *)&v7 + 1));
    (*(void (**)(uint64_t))(*(_QWORD *)(v4 + 8) + 8))(v3);
    outlined destroy of Subscription?((uint64_t)v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
  }
  else
  {
    outlined destroy of Subscription?((uint64_t)v9);
    return outlined destroy of Subscription?((uint64_t)&v6);
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Publishers.Drop<A>.Inner<A1>()
{
  return 1886351940;
}

void protocol witness for CustomPlaygroundDisplayConvertible.playgroundDescription.getter in conformance Publishers.Drop<A>.Inner<A1>(_QWORD *a1@<X8>)
{
  Publishers.Drop.Inner.playgroundDescription.getter(a1);
}

uint64_t protocol witness for Cancellable.cancel() in conformance Publishers.Drop<A>.Inner<A1>()
{
  return Publishers.Drop.Inner.cancel()();
}

BOOL static Publishers.Drop<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  void (*v19)(char *, uint64_t);
  uint64_t v20;

  v6 = type metadata accessor for Publishers.Drop(0, a3, a4, a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v20 - v11;
  v13 = dispatch thunk of static Equatable.== infix(_:_:)();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, a1, v6);
  v14(v10, a2, v6);
  if ((v13 & 1) != 0)
  {
    v15 = *(_QWORD *)&v12[*(int *)(v6 + 36)];
    v16 = *(void (**)(char *, uint64_t))(v7 + 8);
    v16(v12, v6);
    v17 = *(_QWORD *)&v10[*(int *)(v6 + 36)];
    v16(v10, v6);
    return v15 == v17;
  }
  else
  {
    v19 = *(void (**)(char *, uint64_t))(v7 + 8);
    v19(v10, v6);
    v19(v12, v6);
    return 0;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.Drop<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Publishers.Drop<>.== infix(_:_:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24));
}

uint64_t getEnumTagSinglePayload for Publishers.Drop(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_18B5F20E4 + 4 * byte_18B5FDE20[v8]))();
}

void storeEnumTagSinglePayload for Publishers.Drop(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0u;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_18B5F2224()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_18B5F222C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5F2234);
}

void sub_18B5F2250()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_18B5F2258()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_18B5F2260(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x18B5F2268);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

void Future<>.value.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = MEMORY[0x1E0DEDCE8];
  v1[3] = MEMORY[0x1E0DEDCE8];
  v1[4] = v2;
  v3 = MEMORY[0x1E0DEDD18];
  v1[5] = MEMORY[0x1E0DEDD18];
  v1[6] = v3;
  type metadata accessor for ContinuationSubscriber();
}

uint64_t sub_18B5F22D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 56) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 64) = v4;
  v5 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Future<A, B>, v2);
  *v4 = v3;
  v4[1] = Future<>.value.getter;
  return static ContinuationSubscriber.withUnsafeSubscription<A>(_:)(v0, v3 + 56, v2, v5);
}

uint64_t Future<>.value.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void Future.value.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v0;
  v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  v4 = *(_QWORD *)(v2 + 96);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v2 + 80);
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v1 + 40) = v4;
  *(_QWORD *)(v1 + 48) = MEMORY[0x1E0DEDB38];
  type metadata accessor for ContinuationSubscriber();
}

uint64_t sub_18B5F23DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 56) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 64) = v4;
  v5 = MEMORY[0x18D77ACE4](&protocol conformance descriptor for Future<A, B>, v2);
  *v4 = v3;
  v4[1] = Future.value.getter;
  return static ContinuationSubscriber.withUnsafeThrowingSubscription<A>(_:)(v0, v3 + 56, v2, v5);
}

uint64_t Future.value.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Publishers.First.init(upstream:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t Publishers.FirstWhere.init(upstream:predicate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.FirstWhere, a6);
}

uint64_t Publisher.tryFirst(where:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return Publisher.drop(while:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.TryFirstWhere, a5);
}

uint64_t Publishers.TryFirstWhere.init(upstream:predicate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return Publishers.DropWhile.init(upstream:predicate:)(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Publishers.TryFirstWhere, a6);
}

uint64_t type metadata accessor for Publishers.TryFirstWhere(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Publishers.TryFirstWhere);
}

uint64_t Publishers.First.Inner.description.getter()
{
  return 0x7473726946;
}

uint64_t Publishers.FirstWhere.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.FirstWhere.Inner.description.getter()
{
  return 0x7473726946797254;
}

uint64_t Publishers.TryFirstWhere.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.LastWhere.receive<A>(subscriber:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD *))type metadata accessor for Publishers.TryFirstWhere.Inner, (uint64_t)&unk_1E2177120, (uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed A.Publisher.Output) -> (@unowned Bool, @error @owned Error));
}

uint64_t Publishers.TryFirstWhere.Inner.description.getter()
{
  return 0x7473726946797254;
}

uint64_t Publishers.TryFirstWhere.Inner.receive(newValue:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  _QWORD v16[4];

  v2 = v1;
  v4 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v16 - v11;
  (*(void (**)(_QWORD *__return_ptr, uint64_t))((char *)v2 + *(_QWORD *)(v4 + 152)))(v16, a1);
  if (LOBYTE(v16[0]) == 1)
  {
    v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v12, a1, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    v14 = (char *)v2 + *(_QWORD *)(*v2 + 136);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v14, v10, v6);
    swift_endAccess();
  }
  return 0;
}

uint64_t vtable thunk for ReduceProducer.receive(newValue:) dispatching to Publishers.TryFirstWhere.Inner.receive(newValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = Publishers.TryFirstWhere.Inner.receive(newValue:)(a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance Publishers.TryFirstWhere<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.TryFirstWhere.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t static Publishers.First<>.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance <> Publishers.First<A>()
{
  return static Publishers.First<>.== infix(_:_:)();
}

void type metadata accessor for Publishers.TryFirstWhere.Inner()
{
  JUMPOUT(0x18D77AC60);
}

uint64_t getEnumTagSinglePayload for Publishers.First(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
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
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
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
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_18B5F2854 + 4 * byte_18B5FDFB8[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for Publishers.First(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t getEnumTagSinglePayload for Publishers.FirstWhere(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_18B5F2AD8 + 4 * byte_18B5FDFC6[v10]))();
  }
}

void storeEnumTagSinglePayload for Publishers.FirstWhere(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_18B5F2C50()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18B5F2CC8);
}

void sub_18B5F2C58(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18B5F2C60);
  JUMPOUT(0x18B5F2CC8);
}

void sub_18B5F2CA0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5F2CC8);
}

void sub_18B5F2CA8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18B5F2CC8);
}

uint64_t sub_18B5F2CB0(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x18B5F2CC8);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x18B5F2CC4);
    JUMPOUT(0x18B5F2CBCLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_18B5F2CE0()
{
  swift_release();
  return swift_deallocObject();
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_1ECED0E70 == -1)
  {
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1ECED0E70, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_1ECED0E64 > a2)
    return 1;
  return dword_1ECED0E64 >= a2 && dword_1ECED0E68 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t ObservationRegistrar.init()()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t Array.init()()
{
  return MEMORY[0x1E0DE9D70]();
}

Swift::Void __swiftcall Dictionary.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x1E0DEA040](keepingCapacity);
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t BidirectionalCollection.last(where:)()
{
  return MEMORY[0x1E0DEA358]();
}

uint64_t BidirectionalCollection.last.getter()
{
  return MEMORY[0x1E0DEA360]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1E0DEA7B8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t Sequence.allSatisfy(_:)()
{
  return MEMORY[0x1E0DEAAA0]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t Sequence.drop(while:)()
{
  return MEMORY[0x1E0DEAAF0]();
}

uint64_t Sequence.prefix(_:)()
{
  return MEMORY[0x1E0DEAB18]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t Sequence.dropFirst(_:)()
{
  return MEMORY[0x1E0DEAB68]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t dispatch thunk of RangeExpression.relative<A>(to:)()
{
  return MEMORY[0x1E0DEAC68]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t static Array._adoptStorage(_:count:)()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x1E0DEADF8]();
}

Swift::Void __swiftcall Array._makeMutableAndUnique()()
{
  MEMORY[0x1E0DEAE08]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x1E0DEAE98]();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  MEMORY[0x1E0DEAEB8](keepingCapacity);
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t static Array<A>.== infix(_:_:)()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF()
{
  return MEMORY[0x1E0DF06B8]();
}

uint64_t type metadata accessor for UnsafeContinuation()
{
  return MEMORY[0x1E0DF0918]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x1E0DEB2C8]();
}

uint64_t Set.insert(_:)()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t Set.remove(_:)()
{
  return MEMORY[0x1E0DEB2F0]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t dispatch thunk of Collection.indices.getter()
{
  return MEMORY[0x1E0DEB590]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t Collection.prefix(_:)()
{
  return MEMORY[0x1E0DEB648]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return MEMORY[0x1E0DEB6C8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.append(_:)()
{
  return MEMORY[0x1E0DEB700]();
}

uint64_t RangeReplaceableCollection.removeFirst()()
{
  return MEMORY[0x1E0DEB738]();
}

Swift::Void __swiftcall RangeReplaceableCollection.removeFirst(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEB740](a1);
}

uint64_t static RangeReplaceableCollection.+ infix<A>(_:_:)()
{
  return MEMORY[0x1E0DEB778]();
}

{
  return MEMORY[0x1E0DEB780]();
}

{
  return MEMORY[0x1E0DEB788]();
}

uint64_t Range.relative<A>(to:)()
{
  return MEMORY[0x1E0DEB840]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t dispatch thunk of Strideable.advanced(by:)()
{
  return MEMORY[0x1E0DEBCB0]();
}

uint64_t dispatch thunk of Strideable.distance(to:)()
{
  return MEMORY[0x1E0DEBCB8]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t dispatch thunk of AnyKeyPath._kvcKeyPathString.getter()
{
  return MEMORY[0x1E0DEBE60]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x1E0DEC258]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t _forEachField(of:options:body:)()
{
  return MEMORY[0x1E0DEC598]();
}

uint64_t type metadata accessor for PrefixSequence()
{
  return MEMORY[0x1E0DEC5C0]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC680](a1);
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t dispatch thunk of TextOutputStream.write(_:)()
{
  return MEMORY[0x1E0DEC950]();
}

uint64_t TextOutputStream._writeASCII(_:)()
{
  return MEMORY[0x1E0DEC958]();
}

Swift::Void __swiftcall TextOutputStream._lock()()
{
  MEMORY[0x1E0DEC960]();
}

Swift::Void __swiftcall TextOutputStream._unlock()()
{
  MEMORY[0x1E0DEC968]();
}

uint64_t dispatch thunk of CustomReflectable.customMirror.getter()
{
  return MEMORY[0x1E0DEC9B8]();
}

uint64_t type metadata accessor for DropFirstSequence()
{
  return MEMORY[0x1E0DEC9C0]();
}

uint64_t type metadata accessor for DropWhileSequence()
{
  return MEMORY[0x1E0DEC9D8]();
}

uint64_t static _EachFieldOptions.ignoreUnknown.getter()
{
  return MEMORY[0x1E0DECAB8]();
}

uint64_t static _EachFieldOptions.classType.getter()
{
  return MEMORY[0x1E0DECAC0]();
}

uint64_t type metadata accessor for _EachFieldOptions()
{
  return MEMORY[0x1E0DECAC8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return MEMORY[0x1E0DECC30]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1E0DECD50]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1E0DECF28](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DECFC8]();
}

{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED0F8]();
}

{
  return MEMORY[0x1E0DED110]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t type metadata accessor for ReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DED200]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t _diagnoseUnexpectedEnumCase<A>(type:)()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1E0DED650]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1E0DED6F0]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t dispatch thunk of CustomPlaygroundDisplayConvertible.playgroundDescription.getter()
{
  return MEMORY[0x1E0DED9E0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t print<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x1E0DEDED0]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x1E0DEDF30](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x1E0DEDFC8]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x1E0DEDFF0]();
}

uint64_t Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x1E0DEE010]();
}

uint64_t Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x1E0DEE020]();
}

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t static Result<>.== infix(_:_:)()
{
  return MEMORY[0x1E0DEE048]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t type metadata accessor for KeyPath()
{
  return MEMORY[0x1E0DEE298]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int raise(int a1)
{
  return MEMORY[0x1E0C84FA8](*(_QWORD *)&a1);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1E0DEED00]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEDF0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x1E0DEEE60]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_task_addCancellationHandler()
{
  return MEMORY[0x1E0DF0FF8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_removeCancellationHandler()
{
  return MEMORY[0x1E0DF1040]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

